'Insert random answering time
'Try to beat the Turring test
'Randomly change questionning method

'Name
INPUT "Enter your name: ", Name$
PRINT "Hello, "; Name$; "My name is Elisa. I am an artificial intelligence program created by Thomas Hollis."
PRINT "My ultimate goal in life is to beat the Turring Test"

'Feeling
PRINT "How are you feeling today?"
INPUT feeling$
SELECT CASE feeling$
    CASE "bad"
        GOTO 10
    CASE "good"
        GOTO 11
END SELECT

10 PRINT "Why, what's wrong?"
INPUT wrong$
PRINT "Oh that's tradgic. Well, I can cheer you up"

11 PRINT "Exelent. How old are you?"
INPUT age$
PRINT "Nice! I'm only a few weeks old yet i know a lot more than you."

'Football team
PRINT "What football team do you support"
INPUT footballteam$
SELECT CASE footballteam$
    CASE "Arsenal"
        GOTO 12
END SELECT
12 PRINT "Well done fellow gunner."
PRINT "Shame on you. Arsenal should have been your answer"



