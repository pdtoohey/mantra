require 'sinatra'
require 'HTTParty'

raw_data = HTTParty.get('http://mashable.com/stories.json')
parsed = raw_data.parsed_response

get '/' do
  @new = parsed['new']
  @hot = parsed['hot']
  @rising = parsed['rising']
  erb :home
end

get '/home' do
  @new = parsed['new']
  @hot = parsed['hot']
  @rising = parsed['rising']
  erb :home
end

get '/results_new' do
  @new = parsed['new']
  @new_story = params['new_story']
  erb :results_new
end

get '/story_new' do
  @new = parsed['new']
  @new_story = params['new_story']
  erb :story_new
end

get '/results_hot' do
  @hot = parsed['hot']
  @hot_story = params['hot_story']
    erb :results_hot
end

get '/story_hot' do
  @hot = parsed['hot']
  @hot_story = params['hot_story']
    erb :story_hot
end

get '/results_rising' do
 @rising = parsed['rising']
 @rising_story = params['rising_story']
 erb :results_rising
end

get '/story_rising' do
  @rising = parsed['rising']
  @rising_story = params['rising_story']
  erb :story_rising
end