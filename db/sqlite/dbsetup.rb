#!/usr/bin/ruby

require 'sqlite3'

File.delete('books.db') if File.exists?('books.db')

db = SQLite3::Database.new 'books.db'

db.execute <<-SQL
	CREATE TABLE books(
		id INTEGER PRIMARY KEY,
		title VARCHAR(255),
		author VARCHAR(255)
	);
	SQL

books = Array.new
books.push(Hash["title" => "Moby Dick", "author" => "Herman Melville"])
books.push(Hash["title" => "Around the World in 80 Days", "author" => "Jules Verne"])
books.push(Hash["title" => "Crime and Punishment", "author" => "Fyodor Dostoevsky"])
books.push(Hash["title" => "Heart of Darkness", "author" => "Joseph Conrad"])
books.push(Hash["title" => "Don Quixote", "author" => "Miguel de Cervantes"])

puts "#{books}"

for h in books
	puts "Inserting #{h["title"]}"
	db.execute("INSERT INTO books (title, author) VALUES (?, ?)", [h["title"], h["author"]])
end

db.results_as_hash = true

list = db.execute "SELECT * FROM books"
list.each do |row|
	puts "#{row["id"]}: #{row["title"]} by #{row["author"]}"
end

