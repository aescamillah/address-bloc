require_relative "entry.rb"

class AddressBook

  attr_accessor :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone, email)
    index = 0
    @entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end
    @entries.insert(index, Entry.new(name, phone, email))
  end


  def remove_entry(name, phone, email)
    index = 0
    @entries.each do |entry|
      if (name == entry.name) && (phone == entry.phone_number) && (email == entry.email)
        break
      end
      index += 1
    end
    if index < @entries.length
      @entries.delete_at(index)
    end
  end

=begin
  def remove_entry(name, phone, email)
    @entries.delete(Entry.new(name, phone, email))
  end
=end

end