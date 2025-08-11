% ======================================
% Knowledge Base: Animal Classification
% ======================================

% ====== Facts: Animal Classifications ======
animal(mammal, tiger).
animal(mammal, elephant).
animal(mammal, dolphin).
animal(mammal, bat).
animal(mammal, kangaroo).

animal(bird, eagle).
animal(bird, penguin).
animal(bird, parrot).
animal(bird, owl).
animal(bird, ostrich).

animal(fish, salmon).
animal(fish, shark).
animal(fish, tuna).
animal(fish, clownfish).

% ====== Facts: Animal Characteristics ======
has_fur(tiger).
has_fur(elephant).
has_fur(bat).
has_fur(kangaroo).

can_fly(eagle).
can_fly(parrot).
can_fly(penguin).    % penguin exception
can_fly(bat).
can_fly(ostrich).    % ostrich exception

lives_in_water(dolphin).
lives_in_water(salmon).
lives_in_water(shark).
lives_in_water(tuna).
lives_in_water(clownfish).

lays_eggs(eagle).
lays_eggs(parrot).
lays_eggs(penguin).
lays_eggs(salmon).
lays_eggs(shark).
lays_eggs(tuna).
lays_eggs(clownfish).
lays_eggs(ostrich).

nocturnal(owl).
nocturnal(bat).
nocturnal(shark).

herbivore(elephant).
herbivore(kangaroo).
herbivore(parrot).

carnivore(tiger).
carnivore(eagle).
carnivore(shark).
carnivore(owl).
carnivore(dolphin).

% ====== Rules ======

% Rule 1: Check if an animal is a mammal
is_mammal(X) :-
    animal(mammal, X).

% Rule 2: Check if an animal can actually fly (exclude flightless birds)
can_really_fly(X) :-
    can_fly(X),
    X \= penguin,
    X \= ostrich.

% Rule 3: Animals that live in water but are not fish
water_animal_not_fish(X) :-
    lives_in_water(X),
    \+ animal(fish, X).

% Rule 4: Animals with fur that are mammals
has_fur_animal(X) :-
    has_fur(X),
    is_mammal(X).

% Rule 5: Same class animals
same_class(X, Y) :-
    animal(Class, X),
    animal(Class, Y),
    X \= Y.

% Rule 6: Find animals that are nocturnal and can fly
nocturnal_flyers(X) :-
    nocturnal(X),
    can_really_fly(X).

% Rule 7: Identify egg-laying mammals (rare cases)
egg_laying_mammal(X) :-
    is_mammal(X),
    lays_eggs(X).

% Rule 8: Identify carnivores that live in water
water_carnivores(X) :-
    carnivore(X),
    lives_in_water(X).

% Rule 9: Check if an animal is omnivore
is_omnivore(X) :-
    \+ herbivore(X),
    \+ carnivore(X),
    animal(_, X).

