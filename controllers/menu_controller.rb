require_relative "../models/address_book"

class MenuController

  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View Entry Number n"
    puts "6 - Exit"
    print "Enter your selection: "
    selection = gets.to_i

    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        system "clear"
        view_entry
        main_menu
      when 6
        puts "Good-bye!"
        exit(0)
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end

  def view_all_entries
    @address_book.entries.each do |entry|
    system "clear"
    puts entry.to_s
    entry_submenu(entry)
  end

system "clear"
puts "End of entries"
end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp
    @address_book.add_entry(name, phone, email)
    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp

    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entries_submenu(entry)
    end
  end

  def view_entry
    puts "View AddressBloc Entry"
    print "Entry Number: "
    entry_no = gets.to_i
    if entry_no > @address_book.entries.length
      system "clear"
      puts "#{entry_no} is not a valid input"
      view_entry
    else
      puts @address_book.entries[entry_no - 1].to_s
      view_entry_submenu
    end   
  end  

  def view_entry_submenu
    puts "v - view another entry"
    puts "m - return to main menu"
    puts "e - exit"
    selection = gets.chomp

    case selection
      when "a"
        system "clear"
        view_entry 
      when "m"
        system "clear"
        main_menu        
      when "e"
        exit(0)
    else
      system "clear"
      puts "#{selection} is not a valid input"
      view_entry_submenu
    end
  end

end

