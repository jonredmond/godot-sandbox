# Learning Log

## Format
Each entry: date, what you worked on, what you learned, one question for next session.

---

### 2026-04-17 — Session 1
**Project:** playground
**Worked on:**
- Repo + first Godot project setup, .gitignore, learning notes scaffold.
- Playground scene: `CharacterBody2D` player with WASD/arrow movement via `Input.get_axis`.
- Pickup as `Area2D` using `body_entered` signal + `player` group; `queue_free()` on collect.
- Pickup recolors the player via a `change_color()` method (`Sprite2D.modulate`).
- Spawner node with a `Timer` that instantiates a `PackedScene` at random positions inside `get_viewport_rect()`.

**Learned:**
- Scenes/nodes, saving scenes, running from the editor, Input Map actions.
- `@export` variables for tweaking from the Inspector.
- Signals (`body_entered`) and Groups (`player`) for loose coupling.
- `PackedScene.instantiate()` for runtime spawning.
- `ColorRect` vs `Sprite2D` as quick prototype visuals; `modulate` for tinting.

**Broke / got stuck:**
- Spawner logic needed a fix (committed in `e58cb34`) — worth revisiting what went wrong.

**Question for next time:**
- What's the cleanest way to clamp a `CharacterBody2D` to the viewport — manual `position.clamp()` each frame, or `StaticBody2D` walls around the edges?

---

### 2026-04-18 — Session 2
**Project:** playground
**Worked on:**
- Extracted the Player into its own `player.tscn` via *Save Branch as Scene*.
- Replaced instant velocity with acceleration + friction using `move_toward` and `delta`.
- Added a `Walls` StaticBody2D with four `WorldBoundaryShape2D` children to contain the player at the viewport edges.

**Learned:**
- Scene instancing and encapsulation (children of an instance are hidden without *Editable Children*).
- Units matter: `acceleration` / `friction` are px/s², multiplied by `delta` → framerate-independent and unit-meaningful. Avoid unitless `lerp` weights for time-based motion.
- `move_toward` never overshoots its target — safer than `lerp` for physics.
- Quick sanity formulas: `time_to_max_speed = max_speed / acceleration`, `time_to_stop = max_speed / friction`.
- `WorldBoundaryShape2D` is an infinite half-plane — cheap, perfect for screen edges. The *normal* points into the walkable side.
- `move_and_slide()` handles slide-along-wall behavior automatically; you don't clamp position manually.
- Answered Session 1's carry-over question: walls > manual clamping — `move_and_slide` gives you slide-along-edge for free, and the same walls will contain the Pong ball later.

**Broke / got stuck:**
-

**Question for next time:**
- For Pong, the ball needs to *bounce* off walls, not slide. What's the Godot-idiomatic way — `move_and_collide()` + reflect the velocity, a `PhysicsMaterial` with bounce, or a custom `_on_body_entered` signal on the ball?

---

### YYYY-MM-DD — Session N
**Project:** (which project)
**Worked on:**
-

**Learned:**
-

**Broke / got stuck:**
-

**Question for next time:**
-