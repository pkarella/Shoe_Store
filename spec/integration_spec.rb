require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('brand', {:type => :feature}) do
  it('index') do
    visit('/')
    expect(page).to have_content('Shoe')
  end
  it('enter a brand and receive that name capitalized') do
    visit('/brands')
    fill_in("shoe_name", :with => 'nike')
    click_button('Add brand')
    expect(page).to have_content('Nike')
  end
end
