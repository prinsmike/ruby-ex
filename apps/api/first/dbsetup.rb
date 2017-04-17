#!/usr/bin/ruby

require "sequel"

db = Sequel.connect('sqlite://books.db')

db.create_table :books do
	primary_key :id
	String :title
	String :author
end

books = db[:books]

books.insert(:title => 'Moby Dick', :author => 'Herman Melville')
books.insert(:title => 'Around the World in 80 Days', :author => 'Jules Verne')
books.insert(:title => 'Crime and Punishment', :author => 'Fyodor Dostoevsky')
books.insert(:title => 'Heart of Darkness', :author => 'Joseph Conrad')
books.insert(:title => 'Don Quixote', :author => 'Miquel de Cervantes')
