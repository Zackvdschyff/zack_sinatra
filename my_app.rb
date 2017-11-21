require 'sinatra'
require 'csv'

get '/' do
  erb :home
end

get '/dynamic' do
  submissions = CSV.read('submissions.csv')
  erb :dynamic, locals: {submissions: submissions}
end

post '/dynamic' do
  CSV.open("submissions.csv", "a") do |csv|
    csv << [params[:full_name], params[:email], params[:phone]]
  end

  submissions = CSV.read('submissions.csv')
  erb :dynamic, locals: {submissions: submissions}
end

get '/builder' do
  erb :builder
end

get '/transact' do
  erb :transact
end
