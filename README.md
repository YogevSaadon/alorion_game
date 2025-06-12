# Alorion Arena (2020 - Early Learning Project)

**Note**: This is an early project I developed before starting my Computer Science studies, created entirely without AI assistance. I'm preserving it in its original state to demonstrate my learning progression. This project sparked my interest in game development and influenced my decision to pursue Computer Science.

## Description
A top-down action RPG built with Godot Engine 3.x, featuring melee combat, ranged weapons, magic spells, and basic AI enemies. Players can switch between different weapon types including swords, bows, and staffs while battling enemies in an arena setting.

## Technologies Used
- **Engine**: Godot Engine 3.x
- **Language**: GDScript
- **Graphics**: 2D sprites and animations
- **Audio**: Basic sound effects

## Features Implemented
- **Combat System**: Melee weapons (hands, sword), ranged weapons (bow with arrows), magic (fireball spells)
- **Character System**: Health and mana management with UI bars
- **Enemy AI**: Basic enemy behavior with player targeting
- **Animation System**: Walking animations and attack sequences
- **Weapon Switching**: Dynamic weapon swapping during gameplay
- **Particle Effects**: Visual effects for magic spells

## Technical Implementation
- Object-oriented design with Actor base class
- Component-based weapon system
- Manual animation control and timing
- Collision detection for combat
- Resource management (health/mana)
- Basic game state management

## How to Run
1. Download Godot Engine 3.x
2. Clone this repository
3. Open the project in Godot
4. Run the main scene

## What I Learned
- Object-oriented programming fundamentals in GDScript
- Game architecture and design patterns
- Animation systems and timing
- User input handling and game controls
- Basic physics and collision detection
- Resource management and UI systems

## Technical Challenges & Learning
One significant challenge was performance optimization with particle effects. Early implementation used excessive particle counts (90+ per projectile) which caused severe frame rate drops. This taught me the importance of:
- Performance profiling and optimization
- Resource management in game development
- Balancing visual effects with performance constraints

## Reflection
As an early project, this code demonstrates my initial understanding of programming concepts. Looking back, I can identify areas like code organization, naming conventions, and architecture patterns that I've significantly improved in my recent work. This project was instrumental in developing my passion for programming and game development.

## Controls
- **WASD**: Movement
- **Mouse**: Aim and rotate character
- **Left Click**: Attack/Cast
- **E**: Switch to sword weapon
- **O**: Reset level (debug)

---
*This project represents my programming journey's beginning and my growth as a developer.*
