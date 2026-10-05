# Space Invaders in Processing

Small arcade game written in Processing's Java mode.

## How it works

The main sketch manages game state, projectiles, enemy movement and win/loss screens. Separate `Ship`, `Flower` and `Drop` classes implement the player, enemies and shots. Collision checks remove hit enemies, and completion times populate an in-memory score list.

## Usage

Open the `.pde` files in `Space_Invaders` together as one Processing sketch. Processing may require the sketch folder to match the main file name `CC_005_Space_invaders`.

Run the sketch. Press `y` to start or restart, use the left and right arrow keys to move, and press Space to shoot.

## Notes

Scores are not saved between sessions. No web server or Python runtime is required.
