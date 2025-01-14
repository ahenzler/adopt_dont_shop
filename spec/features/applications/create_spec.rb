require 'rails_helper'

RSpec.describe 'application creation' do
  before(:each) do
    visit '/applications/new'
  end

  describe 'new application' do
    it 'renders the new form' do

      expect(page).to have_content('New Application')
      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Address')
      expect(find('form')).to have_content('City')
      expect(find('form')).to have_content('State')
      expect(find('form')).to have_content('Zip')
    end
  end

  describe 'create' do
    context 'given valid data' do
      it 'creates the application' do

        fill_in 'Name', with: 'Fleur'
        fill_in 'Address', with: '321 Drive'
        fill_in 'City', with: 'Denver'
        fill_in 'State', with: 'Colorado'
        fill_in 'Zip code', with: 80031
        click_button 'Save'

        expect(page).to have_current_path("/applications/#{Application.last.id}")
        expect(page).to have_content('Fleur')
        expect(page).to have_content('Description')
        expect(page).to have_content('321 Drive')
        expect(page).to have_content('Denver')
        expect(page).to have_content('Colorado')
        expect(page).to have_content(80031)
        expect(page).to have_content('Address')
        expect(page).to have_content('Application Status')
        expect(page).to have_content('In Progress')
      end
    end

    context 'given invalid data' do
      it 're-renders the new form' do

        fill_in 'City', with: 'Denver'
        click_button 'Save'

        expect(page).to have_current_path('/applications/new')
        expect(page).to have_content("Error: Please Fill In Field")
      end
    end
  end
end
