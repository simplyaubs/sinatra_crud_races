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
  end

  scenario 'user can update a race' do
      visit '/races/new'
      fill_in 'race_name', with: 'Half Marathon'
      fill_in 'race_location', with: 'Vegas'
      fill_in 'race_month', with: 'November'
      click_on 'Create Race'
      click_on 'Half Marathon'
      fill_in 'race_name', with: 'Marathon'
      click_on 'Update Race'
      expect(page).to_not have_content 'Half Marathon'
      expect(page).to have_content 'Marathon'
  end
end