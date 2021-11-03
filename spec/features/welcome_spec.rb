require 'rails_helper'

RSpec.feature "Welcomes", type: :feature do
  scenario 'Show Welcome message' do
    visit(root_path)
    expect(page).to have_content('Welcome')
  end

  scenario 'Check if exists link do List Customers' do
    visit(root_path)
    expect(find('ul li')).to have_link('List Customers')
  end
end
