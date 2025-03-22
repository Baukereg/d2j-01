# Soccer card game

## Players

All players have the next statistics:
* Defence
* Dribble
* Pass
* Shoot

All players have one of more traits:
* Long ball (defender) - can pass directly to striker
* Schwalbe (forwards/striker) - chance of penalty
* etc

# Teams

A total of 6 players per team:

* 1 goal keeper
* 2 defenders
* 2 forwards
* 1 striker

## Field

Exists of four zones:

| A | B | C | D |

* In zone A are positioned the goal keeper of team A and the striker of team B.
* In zone B are positioned the defenders of team A against the forwards of team B.
* Zone C and D are mirrored to that.

## Match

Each match has two halves of 10 turns. The team in position of the ball takes the next turn, until it loses the ball or scores a goal.

One player has the ball and needs to take an action. The other team has to choose a player to counter this action. This will result in an RNG roll. The player that loses the roll will have a 1 turn cooldown.

### Actions

| Action | Countered by | RNG roll |
|-|-| - |
| Dribble | Departure or destination zone | dribble vs defence |
| Pass | Destination zone | pass vs defence |
| Shoot | Current zone or forward | shoot vs defence |

#### Dribble

Move the player one zone forward.
Can be countered by any opponent from either the zone the player currently is of the zone it tries to dribbles to.

* Succes: the player moves forward
* Fail, countered on departure zone: player loses ball to opponent
* Fail, countered on destination zone: player loses ball to opponent, still moves forward

#### Pass

Pass the ball to another teammate one zone forward.
Can only be countered by an opponent on the zone the ball is passed to.

* When passing backwards, this action cannot be countered
* When passing in the same zone, low chance of loosing ball
* When passing forwards, high chance of loosing ball

#### Shoot

Attempt to score a goal. The more zones away from the goal, the lower the chance to score.

#### Trait actions

Some traits offer a player additional actions, usually offering RNG rolls with different stats or fixed chanes.

**Examples**
* Long ball, shoot vs defence
* Schwalbe, 20% penalty, 10% red card

Some trait action have limitations (only once per match) of buff/debuff effects (10% extra on next try).