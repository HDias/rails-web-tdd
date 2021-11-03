require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  scenario 'Verify Link to List Customers' do
    visit(root_path)
    expect(page).to have_link('List Customers')
  end

  scenario 'Verify new customer link' do
    visit (root_path)
    click_on('List Customers')
    expect(page).to have_content('List Customers')
    expect(page).to have_link('New Customer')
  end

  scenario 'Verify if link redirect to forn new customer' do 
    visit(customers_path)
    click_on('New Customer')
    expect(page).to have_content('New Customer')
  end

  scenario 'Add valid Customer' do
    customer_name = Faker::Name.name
    visit(new_customer_path)
    path_file = "#{Rails.root}/spec/fixtures/avatar.jpeg"

    fill_in('Name', with: customer_name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Phone', with: Faker::PhoneNumber.phone_number)
    attach_file('Avatar', "#{Rails.root}/spec/fixtures/avatar.jpeg")
    choose(option: ['s', 'n'].sample)
    click_on('Add Customer')

    expect(page).to have_content('Customer registered successfully')
    expect(Customer.last.name).to eq(customer_name)
  end

  scenario 'Can not add invalid Customer' do
    visit(new_customer_path)
    click_on('Add Customer')

    expect(page).to have_content("can't be blank")
  end
end
