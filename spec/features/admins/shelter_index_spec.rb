require 'rails_helper'

RSpec.describe 'the admin shelter index' do
  before(:each) do
    @shelter_1 = Shelter.create!(foster_program: true, name: "Idaho Humane Society", city: "Boise", rank: 3)
    @shelter_2 = Shelter.create!(foster_program: true, name: "Denver Humane Society", city: "Denver", rank: 1)

    @pet_1 = @shelter_1.pets.create!(adoptable: true, age: 2, breed: "Mastiff", name: "Sir Willim Wallace")
    @pet_2 = @shelter_1.pets.create!(adoptable: false, age: 1, breed: "German Short Hair", name: "Blazer")
    @pet_3 = @shelter_1.pets.create!(adoptable: false, age: 2, breed: "Newfoundland", name: "Dean")
    @pet_4 = @shelter_2.pets.create!(adoptable: false, age: 4, breed: "Mix Breed", name: "Wanda")
    @pet_5 = @shelter_2.pets.create!(adoptable: true, age: 3, breed: "Mane Coon", name: "Tina")

    @veterinarian_office_1 = VeterinaryOffice.create!(boarding_services: false, max_patient_capacity: 15, name: "Eagle Veterinarian")
    @veterinarian_office_2 = VeterinaryOffice.create!(boarding_services: true, max_patient_capacity: 19, name: "Meridian Veterinarian")

    @veterinarian_1 = @veterinarian_office_1.veterinarians.create!(on_call: true, review_rating: 5, name: "Dr. David")
    @veterinarian_2 = @veterinarian_office_2.veterinarians.create!(on_call: false, review_rating: 5, name: "Dr. Josh")

    @application_1 = Application.create!(name: "George", state: "Idaho", city: "Boise", zip_code: 83616, address: "395 Middle Street", description: "Student", status: "In Progress")
    @application_2 = Application.create!(name: "Fred", state: "Idaho", city: "Star", zip_code: 83616, address: "395 State Street", description: "Archeologist", status: "In Progress")
    @application_3 = Application.create!(name: "Charlie", state: "Colorado", city: "Nampa", zip_code: 83616, address: "395 Eagle Road", description: "Geologist", status: "In Progress")
    @application_4 = Application.create!(name: "Bill", state: "Colorado", city: "Kuna", zip_code: 83616, address: "395 Purple Street", description: "River Guide", status: "In Progress")
    @application_5 = Application.create!(name: "Ronald", state: "Colorado", city: "Kuna", zip_code: 83616, address: "395 Purple Street", description: "Avid Hiker", status: "In Progress")

    PetApplication.create!(pet: @pet_1, application: @application_1)
    PetApplication.create!(pet: @pet_2, application: @application_2)
    PetApplication.create!(pet: @pet_3, application: @application_3)
    PetApplication.create!(pet: @pet_4, application: @application_4)

    visit '/admins/shelters'
  end

  it 'has shelters listed in reverse alphabetical order' do

    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
  end
end