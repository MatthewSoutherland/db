#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n\n~~Welcome to Number Guessing Game~~\n"

echo -e "\nEnter your username:"
read NAME

# Check to see if user exists
USER_NAME=$($PSQL "SELECT name FROM users WHERE name='$NAME'")
USER_NAME=$(echo $USER_NAME | sed 's/ |/"/')

# If user is not in database
if [[ -z $USER_NAME ]]
then
# Insert user into database
USER_NAME_INSERT=$($PSQL "INSERT INTO users(name) VALUES('$NAME')")

echo "Welcome, $NAME! It looks like this is your first time here."

# generate random number
SECRET_NUMBER=$(( RANDOM % 1001 ))


  # Run a loop until user guess correct number
  until [[ $USER_GUESS -eq $SECRET_NUMBER ]]
  do
  echo "Guess the secret number between 1 and 1000:"
  read USER_GUESS

  # if input is not a number
    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
    echo "That is not an integer, guess again:"

    else
      (( NUMBER_OF_GUESSES++ ))
      if [[ $USER_GUESS -gt $SECRET_NUMBER ]]
      then
      echo "It's lower than that, guess again:"
    
      elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
      then
      echo "It's higher than that, guess again:"

      else
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    
      # Insert game information into database
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$NAME'")
      INSERT_INTO_GAMES=$($PSQL "INSERT INTO games(user_id, score) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
      fi
    fi
  done

else
# Get user information
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USER_NAME'")
USER_ID=$(echo $USER_ID | sed 's/ |/"/')

GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id = $USER_ID")
BEST_GAME=$($PSQL "SELECT MIN(score) FROM games WHERE user_id = $USER_ID")

# Format variables
GAMES_PLAYED=$(echo $GAMES_PLAYED | sed 's/ |/"/')
BEST_GAME=$(echo $BEST_GAME | sed 's/ |/"/')

echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

# generate random number
SECRET_NUMBER=$(( RANDOM % 1001 ))

  # Run a loop until user guess correct number
  until [[ $USER_GUESS -eq $SECRET_NUMBER ]]
  do
  echo "Guess the secret number between 1 and 1000:"
  read USER_GUESS
    # if input is not a number
    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
    echo "That is not an integer, guess again: "

    else
      (( NUMBER_OF_GUESSES++ ))
      if [[ $USER_GUESS -gt $SECRET_NUMBER ]]
      then
      echo "It's lower than that, guess again: "
    
      elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
      then
      echo "It's higher than that, guess again: "

      else
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      
      # Insert game information into database
      INSERT_INTO_GAMES=$($PSQL "INSERT INTO games(user_id, score) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
      fi
    fi
  done
fi
