#!/usr/bin/ruby

require 'sinatra'
require 'json'
require 'sequel'

db = Sequel.connect('sqlite://books.db')

get '/' do
	content_type :json
	apidoc()
end

get '/count' do
	count = db[:books].count
	content_type :json
	count.to_json
end

get '/list' do
	list = db[:books].all
	content_type :json
	list.to_json
end

get '/book/:id' do
	book = db[:books].first(params['name'])
	content_type :json
	book.to_json
end

def apidoc
	Hash[
		"/" => "API Documentation.",
		"/count" => "Return the number of books in the database.",
		"/list" => "Return all books in the database.",
		"/book/:id" => "Return a book by id."
	].to_json
end
