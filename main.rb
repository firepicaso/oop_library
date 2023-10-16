require_relative 'app'

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

def main
  puts 'Welcome to School Library App!'
  app = App.new

  loop do
    display_menu
    choice = gets.chomp.to_i

    if choice == 7
      puts 'Thank you for using this app!'
      break
    end

    process_option(choice, app)
  end
end

main
