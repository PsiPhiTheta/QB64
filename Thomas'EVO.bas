SCREEN 12 '640 x 480
_FULLSCREEN
RANDOMIZE TIMER

f = 30 'number of food plants
DIM fx(f): DIM fy(f)

a = 19 'number of each animal type
t = 9 'number of types of animals   [Max 9]

DIM ax(t, a) 'position x
DIM ay(t, a) 'position y
DIM av(t, a) 'velocity
DIM al(t, a) 'lifespan
DIM af(t, a) 'force
DIM ad(t, a) 'defence
DIM ar(t, a) 'range of sight
DIM aa(t, a) 'years to reproduce

'distribute food
FOR i = 1 TO f
    x = INT(RND * 640)
    y = INT(RND * 480)
    PSET (x, y), 10
    fx(i) = x: fy(i) = y
NEXT i

'distribute animals and allocate characteristics
FOR i = 1 TO t '9
    FOR j = 1 TO a '19
        x = INT(RND * 640)
        y = INT(RND * 480)
        PSET (x, y), i
        ax(i, j) = x
        ay(i, j) = y
        av(i, j) = 1
        al(i, j) = 100
        af(i, j) = i
        ad(i, j) = 5 - i / 2
        ar(i, j) = i * 9
    NEXT j
NEXT i

FOR n = 1 TO 2000 'Number of moves
    'move animals
    FOR i = 1 TO t
        FOR j = 1 TO a
            PRESET (ax(i, j), ay(i, j)) 'turn off old pixel
            IF al(i, j) < 0 THEN GOTO 180 'animal is dead
            FOR rr = 0 TO ar(i, j) 'look around
                IF POINT(ax(i, j), ay(i, j) + rr) = 10 THEN zx = 0: zy = rr: GOTO 100 'Seen Food
                IF POINT(ax(i, j) + rr, ay(i, j)) = 10 THEN zx = rr: zy = 0: GOTO 100 'Seen Food
                IF POINT(ax(i, j), ay(i, j) - rr) = 10 THEN zx = 0: zy = -rr: GOTO 100 'Seen Food
                IF POINT(ax(i, j) - rr, ay(i, j)) = 10 THEN zx = -rr: zy = 0: GOTO 100 'Seen Food
                IF POINT(ax(i, j) + rr, ay(i, j) + rr) = 10 THEN zx = rr: zy = rr: GOTO 100 'Seen Food
                IF POINT(ax(i, j) - rr, ay(i, j) - rr) = 10 THEN zx = -rr: zy = -rr: GOTO 100 'Seen Food
            NEXT rr
            GOTO 150

            100 'Seen food
            IF zx < 0 THEN zx = -1
            IF zx > 0 THEN zx = 1
            IF zy < 0 THEN zy = -1
            IF zy > 0 THEN zy = 1
            ax(i, j) = ax(i, j) + zx * av(i, j)
            ay(i, j) = ay(i, j) + zy * av(i, j)
            IF ax(i, j) < 1 THEN ax(i, j) = 0
            IF ax(i, j) > 640 THEN ax(i, j) = 640
            IF ay(i, j) < 1 THEN ay(i, j) = 0
            IF ay(i, j) > 480 THEN ay(i, j) = 480
            IF POINT(ax(i, j), ay(i, j)) = 10 THEN GOSUB 200 'Landed on food
            IF POINT(ax(i, j), ay(i, j)) <> 0 THEN GOSUB 300 'Landed on other animal
            PSET (ax(i, j), ay(i, j)), i 'turn on new pixel
            al(i, j) = al(i, j) - .1 'reduce life
            GOTO 180

            150 'Not seen Food
            ax(i, j) = ax(i, j) + (1 - INT(RND * 3)) * av(i, j)
            ay(i, j) = ay(i, j) + (1 - INT(RND * 3)) * av(i, j)
            IF ax(i, j) < 1 THEN ax(i, j) = 0
            IF ax(i, j) > 640 THEN ax(i, j) = 640
            IF ay(i, j) < 1 THEN ay(i, j) = 0
            IF ay(i, j) > 480 THEN ay(i, j) = 480
            IF POINT(ax(i, j), ay(i, j)) = 10 THEN GOSUB 200 'found food
            IF POINT(ax(i, j), ay(i, j)) <> 0 THEN GOSUB 300 'found other animal
            PSET (ax(i, j), ay(i, j)), i 'turn on new pixel
            al(i, j) = al(i, j) - .1 'reduce life

            180
        NEXT j
    NEXT i

    _DELAY 0.03

NEXT n
DO: SLEEP: LOOP UNTIL INKEY$ <> ""

CLS:
SCREEN _NEWIMAGE(1920, 1080)

FOR i = 1 TO t '9
    COLOR i
    FOR j = 1 TO a '19
        PRINT "Animal "; i; " # "; j, " Speed"; av(i, j), " Life "; INT(al(i, j)), " Force"; af(i, j),
        PRINT " Def "; ad(i, j), "Vision "; ar(i, j)
    NEXT j
    INPUT a$
NEXT i
END

200 'Landed on food
al(i, j) = al(i, j) + 5 'Add to life
PRESET (ax(i, j), ay(i, j)) 'Erase food point
x = INT(RND * 640)
y = INT(RND * 480)
PSET (x, y), 10 'replacement food point
fx(i) = x: fy(i) = y
RETURN

300 'Landed on other Animal
hit = 0
FOR ii = 1 TO t
    FOR jj = 1 TO a
        IF ii <> i AND ax(ii, jj) = ax(i, j) AND ay(ii, jj) THEN hit = 1
        IF hit = 0 THEN GOTO 400
        IF af(ii, jj) > ad(i, j) THEN al(i, j) = -1: RETURN
        400
    NEXT jj
NEXT ii
RETURN



