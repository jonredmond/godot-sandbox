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