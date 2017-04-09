'Name
INPUT "Enter your name: ", Name$
PRINT


'Introduction
PRINT "Hello "; Name$; ", this program (first compiled in 2014) has the purpose"
PRINT "of attempting to estimate life expectancy to a higher degree of accuracy"
PRINT "by taking into account the biggest range of factors possible (as opposed"
PRINT "to most life expectancy generators which only take into account gender)."
PRINT "All the calculations are done by collecting data directly from the user"
PRINT "and applying statistical life expectancy changes predicted by a range of"
PRINT "different academic studies."
PRINT
PRINT "This program is still in early stages and the author hopes to develop it"
PRINT "further as more ressearch is made available and more factors are included."

'Gender
100 PRINT "What is your birth gender (m/f)?"
INPUT gender$
SELECT CASE gender$
    CASE "m"
        CorrectionGender = -2.5
    CASE "male"
        CorrectionGender = -2.5
    CASE "Male"
        CorrectionGender = -2.5
    CASE "f"
        CorrectionGender = 2.5
    CASE "female"
        CorrectionGender = 2.5
    CASE "Female"
        CorrectionGender = 2.5 'source: http://www.who.int/mediacentre/news/releases/2014/world-health-statistics-2014/en/
    CASE ELSE
        PRINT "Please answer by using the following lowercase letters: m/f."
        PRINT
        GOTO 100
END SELECT
PRINT


'Location
PRINT "In which country have you lived most of your life?"
INPUT location$
SELECT CASE location$
    CASE "UK"
        CorrectionLocation = 9.5
    CASE "United Kingdom"
        CorrectionLocation = 9.5
    CASE "England"
        CorrectionLocation = 9.5
    CASE "France"
        CorrectionLocation = 12.3
    CASE "Spain"
        CorrectionLocation = 12.5
    CASE "Italy"
        CorrectionLocation = 11.37
    CASE "Japan"
        CorrectionLocation = 14.6
    CASE "China"
        CorrectionLocation = 6
    CASE "Sweeden"
        CorrectionLocation = 13
    CASE "Australia"
        CorrectionLocation = 13
    CASE "Canada"
        CorrectionLocation = 12.5
    CASE "Ireland"
        CorrectionLocation = 11.4
    CASE "Germany"
        CorrectionLocation = 11
    CASE "US"
        CorrectionLocation = 9.8
    CASE "United States"
        CorrectionLocation = 9.8
    CASE "USA"
        CorrectionLocation = 9.8
    CASE "India"
        CorrectionLocation = -5
    CASE "Corsica"
        CorrectionLocation = 12.6
    CASE ELSE
        PRINT "Syntax error detected, please check spelling & capitalization."
        PRINT "Please note: unavailable data for some countries may also generate this error."
        PRINT
END SELECT 'source: http://en.wikipedia.org/wiki/List_of_countries_by_life_expectancy
PRINT



'Smoking
PRINT "Do you smoke cigarettes? (y/n)"
500 INPUT smoking$
SELECT CASE smoking$
    CASE "y"
        GOTO 600
    CASE "n"
        GOTO 700
    CASE ELSE
        PRINT
        PRINT "Please answer by using the following lowercase letters: y or n."
        PRINT
        GOTO 500
END SELECT

600 PRINT
PRINT "How many cigarettes do you smoke per day on average?"
INPUT cigarettes
PRINT
PRINT "Roughly how long have you been smoking for (in years)?"
INPUT smokingyears
CorrectionSmoking = -1 * cigarettes * smokingyears * 28 / (365 * 24 * 60) 'source: http://www.medicalnewstoday.com/releases/9703.php

700 PRINT


' drinking
PRINT "Do you drink alcohol excessively - more than 5 units per day (y/n)?"
INPUT drinking$
SELECT CASE drinking$
    CASE "y"
        CorrectionDrinking = -10
    CASE "n"
        CorrectionDrinking = 0
    CASE ELSE
        PRINT
        PRINT "Please answer by using the following lowercase letters: y or n."
        PRINT
        GOTO 700
END SELECT 'source: WHO stats
PRINT


' weight
800 PRINT "Are you considered clinically obese - BMI greater than 45 (y/n)?"
INPUT weight$
SELECT CASE weight$
    CASE "y"
        CorrectionWeight = -8
    CASE "n"
        CorrectionWeight = 0
    CASE ELSE
        PRINT
        PRINT "Please answer by using the following lowercase letters: y or n."
        PRINT
        GOTO 800
END SELECT 'source: Study: Obesity May Shorten Life Expectancy by Up to 8 Years
PRINT


'Sexual partners
PRINT "How many sexual partners have you had unprotected sex with in the past year?"
INPUT sex
SELECT CASE sex
    CASE 0
        CorrectionSex = 0
    CASE ELSE
        CorrectionSex = -5
END SELECT 'source: www.ons.gov.uk
PRINT


' ancestors
' hours of physical activity
' - heavy drinkrs alcoholics (5+ units/day) lifespan-10
' drugs -
' current diseases


'Final calculation
BaseLifeExpectancy = 70 'source:http://www.who.int/gho/mortality_burden_disease/life_tables/en/
LifeExpectancy = BaseLifeExpectancy + CorrectionGender + CorrectionLocation + CorrectionSmoking + CorrectionDrinking + CorrectionWeight + CorrectionSex
PRINT
PRINT "The calculated life expectancy simulated for you is "; LifeExpectancy; "years old."
