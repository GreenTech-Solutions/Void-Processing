# Void-Processing

> Fork of [RustyNova016/Void-Processing](https://github.com/RustyNova016/Void-Processing) updated for Factorio 2.1, published as `VoidProcessing-Updated`. All credit for the mod goes to RustyNova.
> Part 3 (quality) is done in this fork: void data disks, void synthesis and the Void quality tier above legendary. See [Part 3](#part-3) below.

A space age extension mod, right after promethium science. This adds a whole new tier of science, focused on matter/reality manipulation.

This feature late game challenges where your interplanetary logistics skills will be tested, featuring challenges from all planets, as well as new space location for you to discover

Your reward? Master the art of quality products with a final quality tier, and boost your science production with a favorable alternative to quality cycling

- ✔️ Compatible with any save
- ✔️ No content dependancies
- ✔️ Not yet another planet mod
- ✔️ No AI used
- ❌ Won't laugh at you for not finishing space age

## Compatibility

For mod compatibility, please check [the compatibility list](./COMPATIBILITY.md). If a mod isn't on there and is incompatible, please make an issue!

## Development progress

Currently, 2 out of 3 parts are done. There is still the quality cycling left to do, and hopefully done this decade.

## Part 3

Added in this fork; details in the in-game recipe and technology descriptions.

| Step | Recipe | Machine |
| --- | --- | --- |
| Learning | blank void data disk + 50 items → data disk of that item, at the items' quality | Void pylon |
| Refining | disk + 2 void data + 1000 void → 50 % one quality up (up to legendary), 40 % unchanged, 10 % lost | Void assembler |
| Ascension | legendary disk → 25 % Void disk | Tuned void pylon at Oratl |
| Synthesis | disk + 1 void data + 500 void → 1 item at the disk's quality; the disk comes back in 99 % of crafts | Void assembler |

Learnable by default: science packs (lab inputs that at least 3 technologies use and at most 30 recipes take). Startup settings: "Learnable items", "Void quality". Other mods add items through `data.raw["mod-data"]["voidp-learnable-items"].data[<item>] = true` in `data-updates`.

Void quality comes only from ascension: recipes of any mod that raise quality without their own limit, and items that spoil into a higher quality, stop at legendary.

The Void quality icon is a recolour of the vanilla legendary icon.

## Credits

- Hurricane for the void assembler and void synthetizer textures
- [factorio-mod-template](https://github.com/fgardt/factorio-mod-template) for the CI

## Licensing

Since there is no special license to keep assets in the factorio community, this mod got a special type of licensing.

The code is licensed under [MIT](./LICENSE).

Graphics and sounds are distributed under [GPLv3](./LICENSE-ASSETS), with some key points
- Edited assets from factorio keep the Factorio's asset policy. This means that you can only reuse them for factorio mods
- If you use / edit my assets in a factorio mod, only those assets are affected by GPLv3. Not the other assets used
- Any assets not made for this mod (E.G. The void assembler) must respect the original author's policy
- Usage of the assets outside of Factorio modding is forbidden (But you can still ask for permission :))

I do not know how much legal foothold this licensing got, but please be respectful. And in any doubt, don't hesitate to contact me

Assets can also be found [here](https://github.com/RustyNova016/Factorio-Assets)
