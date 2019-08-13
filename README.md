
  # 
    
# enumerables_rspec ♦️ :gem:

Using rspec we made some Behavior-Driven-Development to be able to test owr code and azure it's proper functionality
  
## Getting Started -- Steps for deployment 

    # First you have to make sure you have ruby installed on your computer.
    # Install rspec gem by typing in the terminal -- > gem install rspec

## Running the tests

We are gonna run the automated tests for this system with rspec by:

    # runing on the root of the project in a terminal just $rspec 

### What are the tests doing ?

test the different functions in the code and check their output with their respective outcome like :

Enumerable Methods
  #my_all?
    returns true if all elements in the array are pairs
    returns false is all elements in the array aren't pairs
    returns true for an empty array

  #my_any?
    returns true if an element from an array is pair
    returns false if none of the elements in an array are pair
    returns false if array is empty

  #my_count
    returns the number of elements in an array
    returns the number of pair elements in an array
    returns the number of words which length is equal to 3

  #my_none?
    returns true if none of the elements in an array are pair
    returns false if an element from an array is pair
    returns true if an array is empty

  #my_select
    returns an array with all the even elements
    returns an array with all the strings
    returns an array with all the integers
      
  #my_map
    returns true for all even numbers and false otherwise
    returns true for every element that is a string
    returns true for each element that is not an integer


## Built With

* [Ruby](https://www.ruby-lang.org) - The programming language used
* [Rspec](https://rspec.info/) - Ruby Gem for unit testing


## Authors

* **Sergio Diaz** - *Software Developer* - [serdg0](https://github.com/serdg0)

* **AlejoCode** - *Tech Entrepreneur* - [AlejoCode](https://github.com/AlejoCode)


## Acknowledgments

* To the Microverse team for all the help
* The Odin Project
