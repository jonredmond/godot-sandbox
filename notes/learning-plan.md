# Godot 4.x Learning Plan

**Engine:** Godot 4.x
**Language:** GDScript (may add C# later)
**Focus:** 2D first, then 3D
**Time:** 10–20 hours/week
**Repo structure:** Multiple separate Godot projects under `projects/`

---

## Ground Rules

- Every session ends with a **running build** and a **commit**.
- Maintain `notes/learning.md` with: what you learned + 1 question for next session.
- Work in 30–90 minute loops: implement → test → commit.

---

## Week 1 (2D Fundamentals) — ~8–12 hours

### Day 1: Setup + Godot Workflow (1–2h)
- [x] Create repo + first Godot project.
- [x] Learn: scenes/nodes, saving scenes, running from editor, input actions.
- [x] Deliverable: A "playground" scene with movement, pickups, spawner, signals, modulate.

**Concepts covered so far:**
- CharacterBody2D movement with Input.get_axis
- @export variables
- Signals (body_entered)
- Groups (player group)
- Area2D for pickups
- queue_free() to remove nodes
- Timers + spawning scenes (PackedScene.instantiate)
- get_viewport_rect() for dynamic sizing
- modulate for coloring sprites
- ColorRect vs Sprite2D for prototyping visuals

### Day 2: Player Movement + Collisions (1–2h)
- [ ] Make a `Player.tscn` using `CharacterBody2D`.
- [ ] Add movement, friction, and clamped screen bounds (or walls).
- [ ] Deliverable: Player moves smoothly and doesn't go through walls.

### Day 3–4: Microgame #1 — Pong/Breakout (3–5h total)
- Focus concepts:
  - Signals (ball hits paddle, score updates)
  - UI (Label for score)
  - Scene instancing (Ball, Paddle)
- [ ] Deliverable: Start screen → play → score → reset/restart loop.

### Day 5: Polish + Packaging (1–2h)
- [ ] Add simple sound, pause, and a tiny settings menu (volume slider optional).
- [ ] Deliverable: You can export a desktop build.

---

## Week 2 (2D Systems + Intro 3D) — ~10–16 hours

### Day 6–7: Microgame #2 — Top-down Shooter (4–6h total)
- Focus concepts:
  - Spawning (bullets, enemies)
  - Timers
  - Groups (e.g., `enemies`, `player_bullets`)
  - Basic enemy AI (move toward player)
- [ ] Deliverable: Survive for 60 seconds or reach a score target; show game over screen.

### Day 8: Simple Architecture Upgrade (1–2h)
- [ ] Create a small `GameManager` (autoload) for: score, game state, restarting.
- [ ] Keep it minimal — don't build a framework.
- [ ] Deliverable: Clean state transitions: Menu → Playing → GameOver.

### Day 9–10: Microgame #3 — Tiny 3D "Collectathon" (4–6h total)
- Focus concepts:
  - `CharacterBody3D` movement + camera follow
  - Raycast or Area3D pickups
  - Simple 3D level blockout (CSG or primitives)
- [ ] Deliverable: Collect 10 items → win screen; fall off map → reset.

### Day 11–12: Review + Refactor + Pick Next Direction (2–4h)
- [ ] Identify the 3 recurring pain points (input, UI, scene transitions, etc.).
- [ ] Refactor only those, lightly.
- [ ] Deliverable: A stable base you're not afraid to build on.

---

## Key Concepts to Learn Just-in-Time

| Concept | When to learn |
|---|---|
| Signals | Day 1 (done) |
| Groups | Day 1 (done) |
| @export vars | Day 1 (done) |
| Timer nodes | Day 1 (done) |
| Scene instancing | Day 1 (done) |
| UI (Label, Button, HBoxContainer) | Day 3 (Pong score) |
| Input Map actions | Day 1 (done) |
| Autoloads (singletons) | Day 8 (GameManager) |
| Resource files (.tres) | After Week 2 (weapon stats, enemy tuning) |
| AnimationPlayer | When you want juice/polish |
| TileMap | If you build a platformer next |
| Navigation / pathfinding | If you add smarter AI |

---

## Project Ideas After the 2 Weeks

Pick one and spend 2–4 weeks:
- 2D roguelite arena (Vampire Survivors style)
- 2D platformer with 5 tight levels
- 3D "walking sim" micro-horror with one mechanic (flashlight + keys)

---

## Repo Structure

```
godot-sandbox/
  README.md
  .gitignore
  notes/
    learning.md        # session-by-session log
    learning-plan.md   # this file
  shared/
    assets/
    scripts/
  projects/
    playground/        # Day 1 sandbox (done)
    2d_pong/           # Microgame #1
    2d_shooter/        # Microgame #2
    3d_collectathon/   # Microgame #3
```