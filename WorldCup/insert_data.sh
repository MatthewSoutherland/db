#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
do
if [[ $WINNER != "winner" ]]
then
TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  
  if [[ -z $TEAM_ID ]]
  then
  INSERT_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

    if [[ $INSERT_TEAMS == "INSERT 0 1" ]]
    then
    echo Inserted into teams, $WINNER
    fi
  fi
fi

if [[ $OPPONENT != "opponent" ]]
then
TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  
  if [[ -z $TEAM_ID ]]
  then
  INSERT_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

    if [[ $INSERT_TEAMS == "INSERT 0 1" ]]
    then
    echo Inserted into teams, $OPPONENT
    fi
  fi
fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
do
if [[ $YEAR != 'year' ]]
then
    # get winner_id, opponent_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # insert all data
    INSERT_INTO_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, opponent_goals, winner_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $OPPONENT_GOALS, $WINNER_GOALS)")
    if [[ $INSERT_INTO_GAMES == "INSERT 0 1" ]]
    then
      echo Inserted into games, $YEAR $ROUND $WINNER_ID $OPPONENT_ID $OPPONENT_GOALS $WINNER_GOALS
    fi
  fi
done


# Do not change code above this line. Use the PSQL variable above to query your database.
