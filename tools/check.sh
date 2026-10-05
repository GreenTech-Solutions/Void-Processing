#!/usr/bin/env bash
# Checks the mod's Lua; exits non-zero if any check fails. Needs tools/setup.sh once.
#   1. syntax of every .lua under Lua 5.2 (luac -p): catches 5.3+ syntax (//, &, |, ~, <<, >>) the game rejects
#   2. luacheck with .luacheckrc
#   3. emmylua_check with .emmyrc.json against the Factorio API library: catches fields and functions
#      the game does not have, like defines.default_icon_size after 2.1
#   tools/check.sh
set -uo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
repo="$(dirname "$here")"
# shellcheck source=tools/versions.sh
source "$here/versions.sh"
root="${FACTORIO_LUA_HOME:-$HOME/.local/share/factorio-lua}"
bin="$root/5.2/bin"
emmylua="$root/emmylua/$emmylua_version/emmylua_check"
library="$root/fmtk/$factorio_api_version/factorio/library"
if [ ! -x "$bin/luac" ] || [ ! -x "$bin/luacheck" ] || [ ! -x "$emmylua" ] || [ ! -d "$library" ]; then
  echo "error: no check toolchain in $root; run tools/setup.sh" >&2
  exit 1
fi

cd "$repo"
status=0

files=0
failed=0
while IFS= read -r -d '' file; do
  files=$((files + 1))
  if ! "$bin/luac" -p "$file"; then failed=$((failed + 1)); fi
done < <(find . -name '*.lua' -not -path './node_modules/*' -not -path './.git/*' -print0)
rm -f luac.out
echo "syntax (Lua 5.2): $files files, $failed failed"
[ "$failed" -eq 0 ] || status=1

"$bin/luacheck" --no-color --formatter plain . || status=1
echo "luacheck: done"

config=$(mktemp)
trap 'rm -f "$config" "$config.out"' EXIT
python3 - .emmyrc.json "$library" "$config" <<'PY'
import json, sys
config = json.load(open(sys.argv[1]))
config.setdefault("workspace", {})["library"] = [sys.argv[2]]
json.dump(config, open(sys.argv[3], "w"))
PY
"$emmylua" . -c "$config" --warnings-as-errors > "$config.out" 2>&1 || status=1
grep -v '^Check finished$' "$config.out"
echo "emmylua_check (Factorio $factorio_api_version API): done"

exit "$status"
