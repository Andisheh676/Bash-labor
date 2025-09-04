#!/bin/bash

echo "====== Variables from User Input ======"

# Simple inputs
echo "What is your name?"
read username

echo "How old are you?"
read userage

echo "Which city are you from?"
read usercity

# Input with prompt on the same line
read -p "What is your favorite hobby? " hobby

# Hidden input (like a password)
read -s -p "Enter a password: " password
echo # just a new line after hidden input

# Show all info
echo
echo "====== Your Data ======"
echo "Name: $username"
echo "Age: $userage years"
echo "City: $usercity"
echo "Hobby: $hobby"
echo "Password length: ${#password} characters"

# Save a variable for later use
fullinfo="$username from $usercity"
echo "Full info: $fullinfo"

# Erweiterungsaufgaben (extra tasks)
# Asking 5 pieces of info
read -p "Your favorite color? " color
read -p "Your favorite food? " food
read -p "Your favorite movie? " movie
read -p "Your favorite sport? " sport
read -p "Your favorite book? " book

echo
echo "====== Full Profile ======"
echo "Name: $username"
echo "Age: $userage"
echo "City: $usercity"
echo "Hobby: $hobby"
echo "Password length: ${#password}"
echo "Color: $color"
echo "Food: $food"
echo "Movie: $movie"
echo "Sport: $sport"
echo "Book: $book"

# Simple age validation
if ! [[ "$userage" =~ ^[0-9]+$ ]]; then
    echo "Warning: Age should be a number!"
fi
