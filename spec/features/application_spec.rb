require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Homepage' do
  scenario 'user can see and add a race' do
    visit '/'
    click_on 'Add a New Race'
    fill_in 'race_name', with: 'Half Marathon'
    fill_in 'race_location', with: 'Vegas'
    fill_in 'race_month', with: 'November'
    click_on 'Create Race'
    expect(page).to have_content 'Half Marathon'
    expect(page).to have_content 'Vegas'
    expect(page).to have_content 'November'
  end
end