#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Welcome to my salon. How may I help you?" 
  echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim\n6) Exit"
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) WORK ;;
    2) WORK ;;
    3) WORK ;;
    4) WORK ;;
    5) WORK ;;
    6) EXIT ;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac
}

WORK(){
  # Get selected service
  SELECTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  
  # Get customer phone number
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # If customer doesn't exist
  if [[ -z $CUSTOMER_ID ]]
  then
  echo -e "\nWhat is your name?"
  read CUSTOMER_NAME

  echo -e "\nWhat time would you like to schedule an appointment?"
  read SERVICE_TIME

  #Insert name and phone into customers
  CUSTOMER_INSERT_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  
  # Get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # Insert data into appointments
  CUSTOMER_APPOINTMENT_RESULTS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a $SELECTED_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
 
 
  else
  # Get customer name from data base if customer exists.
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  echo -e "\nWhat time would you like to schedule an appointment?"
  read SERVICE_TIME

  # Insert data into appointments
  CUSTOMER_APPOINTMENT_RESULTS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a $SELECTED_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

EXIT(){
  echo -e "\nHave a wonderful day!"
}
MAIN_MENU
