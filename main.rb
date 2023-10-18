require_relative 'app'
require_relative 'inputhandler'

def display_menu
  puts "\nPlease choose an option by entering a number:"
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def process_option(choice, app)
  method_names = %i[list_books list_people create_person create_book create_rental list_rentals_for_person]

  case choice
  when 1..6
    app.send(method_names[choice - 1])
  when 7
    puts 'Thank you for using this app!'
    exit
  else
    puts 'Invalid option. Please choose a valid option.'
  end
end

def main
  puts 'Welcome to School Library App!'
  app = App.new

  loop do
    display_menu
    choice = InputHandler.get_integer('')

    process_option(choice, app)
  end
end

main
