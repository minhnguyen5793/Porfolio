

from random import randrange
from string import *
import os
from collections import Counter
os.chdir("G:\My Drive\Python")



WORDLIST_FILENAME = "words.txt"

# load_words: void -> list
# expects nothing
# returns a list of words read from the WORDLIST_FILENAME

def load_words():
    '''
    Returns a list of valid words. Words are strings of lowercase
    letters.

    Depending on the size of the word list, this function may
    take a while to finish.
    '''
    print("Loading word list from file...")
    # inFile is a file handle - we'll discuss this later :-)
    inFile = open(WORDLIST_FILENAME, 'rt')
    # line is a string to hold the contents of the file
    line = inFile.readline()
    # wordlist is a list of words found in the file
    wordlist = line.split()
    
    print("  ", len(wordlist), "words loaded.")
    print('Enter play_hangman() to play a game of Hangman!')
    return wordlist



list_of_words = load_words()


# secret_word = get_word()

# get_word: void -> str
# expects nothing
# returns a word rendomly selected from the file "words.txt"

def get_word():
    '''
    Retrieves a random word from the list of available words
    '''
    chosen_word = list_of_words[randrange(0, len(list_of_words))]
    return chosen_word


# print_hangman_image: int -> void
# expects an integer for the number of incorrect guesses so far
# returns nothing
# side effect: prints to the screen a drawing of the Hangman
#     game based on the number of incorrect guesses

def print_hangman_image(mistakes=6):
  '''
  Prints out a gallows image for hangman.
  The image printed depends on the number of mistakes (0-6).
  '''

  if mistakes <= 0:
    print('''
        __________
        |    |       
        |
        |
        |
        |
        |_________
        ''')

  elif mistakes == 1:
    print('''
        __________
        |    |       
        |    O
        |
        |
        |
        |_________
        ''')
  elif mistakes == 2:
    print('''
        __________
        |    |       
        |    O
        |    |
        |    |
        |
        |_________
        ''')
  elif mistakes == 3:
    print('''
        __________
        |    |       
        |    O
        |   /|
        |    |
        |
        |_________
        ''')
  elif mistakes == 4:
    print('''
        __________
        |    |       
        |    O
        |   /|\\
        |    |
        |   
        |_________
        ''')
  elif mistakes == 5:
    print('''
        __________
        |    |       
        |    O
        |   /|\\
        |    |
        |   /
        |_________
        ''')
  else: # mistakes >= 6
    print('''
        __________
        |    |       
        |    O
        |   /|\\
        |    |
        |   / \\
        |_HANGED!_

        ''')
  

###################################################################


# USEFUL CONSTANTS
# 
MAX_GUESSES = 6

# GLOBAL VARIABLES (with default values for testing)
secret_word = 'claptrap' 
letters_guessed = []



# word_guessed: void -> bool
# expects nothing
# returns True if the word (stored in secret_word) has been
#     completely guessed, based on the letters_guessed list
# returns False otherwise

def word_guessed():
    '''
    Returns True if the player has successfully guessed the word,
    and False otherwise.
    '''
    global secret_word
    global letters_guessed

    ####### YOUR CODE HERE ######
    if Counter(secret_word).keys() == dict(Counter(letters_guessed)&Counter(secret_word)).keys():
        return True
    else:
        return False
    
    ####### YOUR CODE HERE ######
    


# print_guessed: void -> void
# expects nothing, returns nothing
# side effect: prints to the screen (on one line) a letter
#     of the secret word if it has been guessed, and "_" for
#     any letter that hasn't yet been guessed

# For example, if the word is "claptrap" and the letters
# guessed so far are ['a', 'e', 'p', 't'] then it should print:
#
# _ _ a p t _ a p

def print_guessed():
    '''
    Prints out the secret word, revealing only those letters
    that have been guessed so far
    '''
    global secret_word
    global letters_guessed
    
    
    correct_guessed_list = []
    letter_guessed_string = ""
    for i in list(secret_word):
        if i in letters_guessed:
            correct_guessed_list.append(i)
        else:
            correct_guessed_list.append("_")
    letter_guessed_string = " ".join(correct_guessed_list)
    return letter_guessed_string 
    


# play_hangman: void -> void
# expects nothing, returns nothing
# side effects:
# This function controls the playing of the game Hangman by:
# -- choosing a secret word
# -- asking the player for letters to guess, one at a time
# -- displaying the Hangman image after each guess
#    (by calling the function print_hangman_image)
# -- displaying the word as guessed so far after each guess
#    (by calling the function print_guessed)
# -- When the word has been completely guessed, tell the
#    user they've won! (Use the word_guessed function for this)
# -- If the word's not completely guessed before the allowed
#    number of mistakes, tell the user they've lost and reveal
#    the word they didn't get

def play_hangman():
    '''
    Plays the Hangman game!
    '''
    global secret_word
    global letters_guessed
    wrong_guesses = 0
    max_mistakes = 6
    secret_word  = get_word()

   
    
    print ('WELCOME TO THE HANGMAN GAME!!!!')
    #print ("(Please use python 3.5.1 or up, older version doesn't work very well)")
   
    for i in range (0,MAX_GUESSES+max_mistakes):
        letters_input = input('Enter the guessing letter: ')
        
        if letters_input in letters_guessed:
            print ('Already used, try another letter!')
            letters_input = input('Enter the guessing letter: ')
        if len(letters_input) != 1:
            print('Invalid! One charactor only! Please try again!')
            letters_input = input('Enter the guessing letter: ')
            
        letters_guessed.append(letters_input)
        print (letters_guessed)
        print( print_guessed())
        
        if letters_input not in Counter(secret_word).keys():
            wrong_guesses +=1
        print (print_hangman_image(wrong_guesses))
        
        if word_guessed() == True:
            print("YOU'VE WON!!!")
            letters_guessed =[]
            break
        else:
            if wrong_guesses == max_mistakes:
                print ("YOU'VE LOST!!!")
                print ("The secret word is: ",secret_word)
                letters_guessed =[]
                break
            else:
                continue
            
    if __name__ == '__main__':
        while play_hangman():
            print()
             
    return None
   

    
