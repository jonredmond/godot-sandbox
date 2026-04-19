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

### 2026-04-19 — Session 3
**Project:** 2d_pong
**Worked on:**
- Bootstrapped a fresh Godot project at 960×540.
- Built Ball, Paddle, and AIPaddle scenes as independent, reusable scenes.
- Ball uses `move_and_collide` + `velocity.bounce(normal)` for perfect elastic reflection.
- Paddles use `move_and_slide` + 1D `move_toward` for snappy vertical control; AI tracks the ball with a deadzone.
- Replaced left/right walls with Area2D goal zones; signals wired in `main.gd`.
- Score HUD on a `CanvasLayer` with `Label` nodes.
- State machine: MENU / PLAYING / GAME_OVER, first-to-5, restart with Space.

**Learned:**
- `move_and_collide` vs `move_and_slide` — same node type, different feel. Balls bounce, characters slide.
- `WorldBoundaryShape2D.normal` points to the *walkable* side. Two debugging sessions' worth of pain from getting this backwards.
- GDScript treats a bare function reference (`move_and_slide`) as a valid no-op statement — silent bug. `()` = call, no `()` = reference.
- Groups (`get_first_node_in_group`) decouple references across scenes better than node paths.
- `@onready` for safe child-node references at scene load.
- `CanvasLayer` keeps UI on top of the 2D world.
- `enum` + `match` is the clean way to do state machines in GDScript.
- State-guard signal handlers (`if _state != State.PLAYING: return`) prevent stray events from corrupting state.

**Broke / got stuck:**
- Shared `WorldBoundaryShape2D` resource meant all four walls had the same normal → ball spawned inside walls, didn't visibly move. Fix: *Make Unique* on each shape.
- Missing `()` on `move_and_slide` in `paddle.gd` → paddle computed velocity but never applied it.

**Question for next time:**
- Paddle hits currently reflect purely by surface normal, so the bounce angle doesn't depend on *where* on the paddle the ball hit. Real Pong adds "English" (ball deflects more upward if hit near the paddle top). Is the Godot-idiomatic way to do that in the ball (reading the paddle via the collision object) or in the paddle (exposing a hit offset and custom signal)?

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