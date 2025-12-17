# cdj.fish

A fish port of the [cdj](https://johnnydecimal.com/22.00.0172/) script for navigating Johnny.Decimal folders by ID.

## Installation

1. Copy `cdj.fish` to your fish functions directory:
   ```fish
   cp cdj.fish ~/.config/fish/functions/
   ```

2. Edit the `jd_root` variable in the function to point to your Johnny.Decimal root folder:
   ```fish
   set jd_root ~/Documents/JD
   ```

## Usage

Navigate to an ID folder:
```fish
cdj 15.52
```

Navigate to a subfolder within an ID (case-insensitive search):
```fish
cdj 15.52 visas
```

Supports both standard IDs and [expanded area IDs](https://johnnydecimal.com/10-19-concepts/13-system-expansion/13.21-expand-an-area/):
```fish
cdj 90001          # 4+ digit expanded area ID
cdj 90001 audio    # subfolder within expanded ID
```

Open the folder in Finder (in addition to navigating):
```fish
cdj -o 15.52
cdj --open 15.52 visas
```
