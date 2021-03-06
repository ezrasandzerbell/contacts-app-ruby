require('capybara/rspec')
require('./app')
require('address')
require('contact')
require('email')
require('phone')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('takes user to target route', {:type => :feature}) do
  before() do
    visit('/')
    click_link('Create new contact')
  end
  it('clicks link and takes user to form page') do
    expect(page).to have_content('New Contact')
  end
  it('clicks submit and takes user to new Contact success page') do
    fill_in("first", :with => "Ezra")
    fill_in("last", :with => "Sandzer-Bell")
    fill_in("job", :with => "Writer")
    fill_in("company", :with => "Siteworks")
    click_button("Submit New Contact")
    expect(page).to have_content('Success! You made a new Contact')
  end
  it('click link and take user to Contact List page, tests for successfully appending contact name') do
    fill_in("first", :with => "Joe")
    click_button("Submit New Contact")
    click_link('View contact list')
    expect(page).to have_content("Joe")
  end
  it('click name of contact to view full contact details') do
    fill_in("first", :with => "Tracie")
    fill_in("last", :with => "Weitzman")
    fill_in("job", :with => "Firefighter")
    fill_in("company", :with => "Station")
    click_button("Submit New Contact")
    click_link('View contact list')
    expect(page).to have_content("Tracie")
    click_link('Tracie Weitzman')
    expect(page).to have_content("Tracie")
  end
  it('click add phone information link to view phone form') do
    click_button("Submit New Contact")
    click_link('View contact list')
    click_link('')
    click_link('Add Phone Information')
    expect(page).to have_content("New Contact Phone Information")
  end
  it('click add phone information link to view phone form') do
    fill_in("first", :with => "Mark")
    click_button("Submit New Contact")
    click_link('View contact list')
    click_link('Mark')
    click_link('Add Phone Information')
    click_button('Submit New Phone')
    expect(page).to have_content("")
  end
  it('click add phone information link to view phone form') do
    fill_in("first", :with => "Steve")
    click_button("Submit New Contact")
    click_link('View contact list')
    click_link('Steve')
    click_link('Add Phone Information')
    click_button('Submit New Phone')
    expect(page).to have_content("")
    click_link('View contact information for Steve')
    click_link('View Phone Details')
    expect(page).to have_content("")
  end
  it('click add email information link to view email form') do
    fill_in("first", :with => "Sarah")
    click_button("Submit New Contact")
    click_link('View contact list')
    click_link('Sarah')
    click_link('Add Email Information')
    click_button('Submit New Email')
    expect(page).to have_content("")
    click_link('View contact information for Sarah')
    click_link('View Email Details')
    expect(page).to have_content("")
  end
  it('click add address information link to view address form') do
    fill_in("first", :with => "Roberta")
    click_button("Submit New Contact")
    click_link('View contact list')
    click_link('Roberta')
    click_link('Add Address Information')
    click_button('Submit New Address')
    expect(page).to have_content("")
    click_link('View contact information for Roberta')
    click_link('View Address Details')
    expect(page).to have_content("")
  end

end
