require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    visit('/')
    click_link('You have MORE to do?!!! Make a list')
    fill_in('name', :with => 'Epicodus Work')
    click_button('Make this list!')
    expect(page).to have_content('You made a List!')
  end
end

describe('viewing all of the lists', {:type => :feature}) do
  it('allows a user to see all of the lists that have been created') do
    list = List.new({:name => 'Epicodus Homework', :id => nil})
    list.save
    visit('/')
    click_link('Here are your current lists')
    expect(page).to have_content(list.name)
  end
end
