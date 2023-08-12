require 'rails_helper'

RSpec.describe 'category/show', type: :feature do
  describe 'after log in' do
    before(:each) do
      @user = User.create(name: 'Abdu', email: 'Abdu@gmail.com', password: 'Abdu123', confirmed_at: Time.now)
      @category1 = Category.create(name: 'Shopping',
                                   icon: 'https://media.istockphoto.com/id/1389937723/vector/cartoon-planet-earth-3d-vector-icon-on-white-background.jpg?s=2048x2048&w=is&k=20&c=eOyTJtouj1h2HG9_NhiZfLxzKq4Gp8GNCUlxqVfJMx4=',
                                   author_id: @user.id)
      @expense = Expense.create(name: 'Electronics', amount: 23, author_id: @user.id, category_ids: [@category1.id])

      visit 'users/sign_in'
      fill_in 'Email', with: 'Abdu@gmail.com'
      fill_in 'Password', with: 'Abdu123'
      click_on 'Log in'
    end

    it 'displays a list of the expenses' do
      visit category_path(@category1)
      expect(page).to have_content 'Electronics'
    end

    it 'has a button to add new transaction' do
      visit category_path(@category1)
      expect(page).to have_button('Create Transaction')
    end

    it 'should take you to add transaction form when clicking on the create transaction button' do
      visit category_path(@category1)
      click_link('Create Transaction')
      expect(current_path).to eql new_expense_path
    end
  end
end
