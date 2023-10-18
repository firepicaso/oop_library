require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'inputhandler'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      if person.is_a?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    person_type = InputHandler.get_integer('Do you want to create a student (1) or a teacher (2)?:')

    age = InputHandler.get_integer('Age?')
    name = InputHandler.get_string('Name?')

    if person_type == 2
      specialization = InputHandler.get_string('Specialization?')
      @people << Teacher.new(age, name, specialization: specialization)
    else
      parent_permission = InputHandler.get_boolean('Has parent permission? [Y/N]:')
      @people << Student.new(age, name, parent_permission: parent_permission)
    end

    puts 'Person created successfully'
  end

  def create_book
    title = InputHandler.get_string('Title?')
    author = InputHandler.get_string('Author?')

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = InputHandler.get_integer('')

    puts "\nSelect a person from the following list by number (not id):"
    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    person_index = InputHandler.get_integer('')

    date = InputHandler.get_string('\nDate: ')

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals_for_person
    person_id = InputHandler.get_integer('ID of person:')

    puts 'Rentals:'
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
