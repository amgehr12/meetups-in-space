require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all.order(:title)
  erb :'meetups/index'
end

get '/meetups/meetup/:id' do
  @id = params[:id]
  @attendees = Attendee.where(meetup_id: @id)

  erb :'meetups/show'
end

post '/meetups/meetup/:id' do
    if session[:user_id].nil?
      flash[:notice] = "You must sign in to join this event."
    else
      Attendee.create(meetup_id: params[:id], user_id: session[:user_id])
      flash[:notice] = "You have joined this event."
    end
  redirect "/meetups/meetup/#{params[:id]}"
end


get '/meetups/new' do
  erb :'meetups/new'
end

post '/meetups/new' do
  Meetup.create(title: params[:title], description: params[:description], date: params[:date], time: params[:time], location: params[:location])

  redirect '/meetups'
  erb :'meetups/new'
end
