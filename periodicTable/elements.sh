#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[ $1 ]]
then

#loop thru args
for i in "$@"; do

  if [[ $i ]]
  then
  FINDERS=false

  # if arg is atomic_number
    if [[ $i == [0-9] || $i == 10 ]]
    then
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $i")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $i")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $i")
    TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $i")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $i")
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $i")
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")

    # remove spaces from variables
    ATOMIC_MASS=$(echo $ATOMIC_MASS | sed 's/ |/"/')
    MELTING_POINT=$(echo $MELTING_POINT | sed 's/ |/"/')
    BOILING_POINT=$(echo $BOILING_POINT | sed 's/ |/"/')
    TYPE_ID=$(echo $TYPE_ID | sed 's/ |/"/')
    SYMBOL=$(echo $SYMBOL | sed 's/ |/"/')
    NAME=$(echo $NAME | sed 's/ |/"/')
    TYPE=$(echo $TYPE | sed 's/ |/"/')
    
    echo "The element with atomic number $i is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    FINDERS=true
    fi

    # if arg is symbol
    if [[ $i == 'H' || $i == 'Be' || $i == 'B' || $i == 'C' || $i == 'N' || $i == 'O' || $i == 'He' || $i == 'Li' || $i == 'F' || $i == 'Ne' ]]
    then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$i'")
    NAME=$($PSQL "SELECT name FROM elements WHERE symbol = '$i'")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")

    # remove spaces from variables
    ATOMIC_MASS=$(echo $ATOMIC_MASS | sed 's/ |/"/')
    MELTING_POINT=$(echo $MELTING_POINT | sed 's/ |/"/')
    BOILING_POINT=$(echo $BOILING_POINT | sed 's/ |/"/')
    TYPE_ID=$(echo $TYPE_ID | sed 's/ |/"/')
    ATOMIC_NUMBER=$(echo $ATOMIC_NUMBER | sed 's/ |/"/')
    NAME=$(echo $NAME | sed 's/ |/"/')
    TYPE=$(echo $TYPE | sed 's/ |/"/')
    
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($i). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    FINDERS=true
    fi

    # if arg is name
    if [[ $i == 'Hydrogen' || $i == 'Beryllium' || $i == 'Boron' || $i == 'Carbon' || $i == 'Nitrogen' || $i == 'Oxygen' || $i == 'Helium' || $i == 'Lithium' || $i == 'Fluorine' || $i == 'Neon' ]]
    then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$i'")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name = '$i'")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")

    # remove spaces from variables
    ATOMIC_MASS=$(echo $ATOMIC_MASS | sed 's/ |/"/')
    MELTING_POINT=$(echo $MELTING_POINT | sed 's/ |/"/')
    BOILING_POINT=$(echo $BOILING_POINT | sed 's/ |/"/')
    TYPE_ID=$(echo $TYPE_ID | sed 's/ |/"/')
    ATOMIC_NUMBER=$(echo $ATOMIC_NUMBER | sed 's/ |/"/')
    SYMBOL=$(echo $SYMBOL | sed 's/ |/"/')
    TYPE=$(echo $TYPE | sed 's/ |/"/')
    
    echo "The element with atomic number $ATOMIC_NUMBER is $i ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $i has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    FINDERS=true
    fi
    # if arg but not found
    if [[ $FINDERS == false ]]
    then
    echo "I could not find that element in the database."
    fi
  fi
  done
  else
    echo "Please provide an element as an argument."
  fi