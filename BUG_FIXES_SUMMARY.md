# Rogue Game Bug Fixes Summary

## Issues Fixed

### Issue 1: Segmentation Errors (CRITICAL BUGS FIXED)

Multiple segmentation fault bugs were discovered and fixed in the codebase, primarily occurring during combat and trap-related operations.

#### Bug #1: NULL Pointer Dereference in move.c (Line 108)
**File:** [move.c](move.c#L108)
**Severity:** Critical
**Description:** The `rogue_hit()` function was being called with a potentially NULL monster pointer when the dungeon flags indicated a MONSTER was present, but the object list was inconsistent.

**Root Cause:** The `object_at()` function can return NULL when there's an inconsistency between the dungeon flags and the actual object list, but the caller in `one_move_rogue()` was not checking for this condition before dereferencing the monster pointer.

**Fix Applied:**
```c
// BEFORE (Buggy):
if (dungeon[row][col] & MONSTER) {
    rogue_hit(object_at(&level_monsters, row, col), 0);
    (void) reg_move();
    return(MOVE_FAILED);
}

// AFTER (Fixed):
if (dungeon[row][col] & MONSTER) {
    object *monster = object_at(&level_monsters, row, col);
    if (monster) {
        rogue_hit(monster, 0);
    }
    (void) reg_move();
    return(MOVE_FAILED);
}
```

#### Bug #2: NULL Pointer Dereference in zap.c (Line 106)
**File:** [zap.c](zap.c#L106)
**Severity:** Critical
**Description:** The `wdrain_life()` function was called without NULL checking the monster pointer returned from `get_zapped_monster()`.

**Root Cause:** The code checked for NULL in the `else if (monster)` branch but forgot to check in the `if (wand->which_kind == DRAIN_LIFE)` branch, creating an inconsistent NULL check pattern.

**Fix Applied:**
```c
// BEFORE (Buggy):
if (wand->which_kind == DRAIN_LIFE) {
    wdrain_life(monster);  // Could crash if monster is NULL
} else if (monster) {
    wake_up(monster);
    ...
}

// AFTER (Fixed):
if (wand->which_kind == DRAIN_LIFE) {
    if (monster) {
        wdrain_life(monster);
    }
} else if (monster) {
    wake_up(monster);
    ...
}
```

#### Bug #3: NULL Pointer Dereference in zap.c (Line 335)
**File:** [zap.c](zap.c#L335)
**Severity:** Critical
**Description:** The `bounce()` function (for COLD/FIRE spells) was calling `mon_name()` and using monster attributes without checking if the monster pointer was NULL after calling `object_at()`.

**Root Cause:** Similar to Bug #2, inconsistent NULL checking pattern where the dungeon flags indicated a monster was present, but `object_at()` returned NULL due to data structure inconsistency.

**Fix Applied:**
```c
// BEFORE (Buggy):
if (dungeon[row][col] & MONSTER) {
    object *monster;
    monster = object_at(&level_monsters, row, col);
    wake_up(monster);  // Could crash if monster is NULL
    if (rand_percent(33)) {
        sprintf(buf, "the %s misses the %s", s, mon_name(monster));
        ...
    }
}

// AFTER (Fixed):
if (dungeon[row][col] & MONSTER) {
    object *monster;
    monster = object_at(&level_monsters, row, col);
    if (monster) {  // Added NULL check
        wake_up(monster);
        if (rand_percent(33)) {
            sprintf(buf, "the %s misses the %s", s, mon_name(monster));
            ...
        }
        ...
    }
}
```

#### Bug #4: NULL Pointer Dereference in use.c (Line 456)
**File:** [use.c](use.c#L456)
**Severity:** Critical
**Description:** The `object_at()` function result was used directly without NULL checking when handling monsters affected by magical scrolls (e.g., sleeping spell).

**Root Cause:** Inconsistent error handling where dungeon flags indicated a monster but the object list was corrupted or inconsistent.

**Fix Applied:**
```c
// BEFORE (Buggy):
if (dungeon[row][col] & MONSTER) {
    monster = object_at(&level_monsters, row, col);
    monster->m_flags |= ASLEEP;  // Could crash if monster is NULL
    monster->m_flags &= (~WAKENS);
    mcount++;
}

// AFTER (Fixed):
if (dungeon[row][col] & MONSTER) {
    monster = object_at(&level_monsters, row, col);
    if (monster) {
        monster->m_flags |= ASLEEP;
        monster->m_flags &= (~WAKENS);
        mcount++;
    }
}
```

### Issue 2: Stairs Command Validation

**Status:** Already correctly implemented - no changes needed.

The stairs commands were verified to be working correctly:
- The **>** (stairs down) command is handled by `drop_check()` in [level.c](level.c#L805), which properly checks that the player is standing on STAIRS
- The **<** (stairs up) command is handled by `check_up()` in [level.c](level.c#L821), which properly checks that the player is standing on STAIRS

Both functions correctly reject the command with appropriate error messages if the player is not on stairs.

## Testing

The fixed code compiles successfully without errors. The changes are minimal, focused, and defensive - they add NULL pointer checks where `object_at()` results are used without validation.

## Root Cause Analysis

The underlying issue is that `object_at()` in [object.c](object.c#L244) can return NULL when the dungeon flags indicate a MONSTER or OBJECT should be present at a location, but the actual object cannot be found in the linked list. This happens when:

1. Data structure corruption occurs (unlikely in normal operation)
2. Race conditions exist between dungeon flag updates and object list updates
3. Incomplete state transitions during monster death or teleportation

The fixes ensure that all code paths that use `object_at()` properly handle the NULL case, preventing segmentation faults.

## Files Modified

1. [move.c](move.c) - Fixed NULL check in `one_move_rogue()` when attacking monsters
2. [zap.c](zap.c) - Fixed NULL checks in `zapp()` and `bounce()` functions
3. [use.c](use.c) - Fixed NULL check when applying spell effects to monsters

## Compilation Status

✅ Code compiles successfully with all changes applied
✅ No new compiler errors introduced
✅ Executable size: 210440 bytes
✅ Build timestamp: Dec 24 21:39
