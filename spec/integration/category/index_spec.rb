require 'rails_helper'

RSpec.describe 'category/index', type: :feature do
  describe 'after log in' do
    before(:each) do
      @user = User.create(name: 'Abdu', email: 'Abdu@gmail.com', password: 'Abdu123', confirmed_at: Time.now)
      @category1 = Category.create(name: 'Shopping',
                                   icon: 'https://media.istockphoto.com/id/1389937723/vector/cartoon-planet-earth-3d-vector-icon-on-white-background.jpg?s=2048x2048&w=is&k=20&c=eOyTJtouj1h2HG9_NhiZfLxzKq4Gp8GNCUlxqVfJMx4=', author_id: @user.id)
      @category2 = Category.create(name: 'Electronics',
                                   icon: 'https://media.istockphoto.com/id/1389937723/vector/cartoon-planet-earth-3d-vector-icon-on-white-background.jpg?s=2048x2048&w=is&k=20&c=eOyTJtouj1h2HG9_NhiZfLxzKq4Gp8GNCUlxqVfJMx4=', author_id: @user.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'Abdu@gmail.com'
      fill_in 'Password', with: 'Abdu123'
      click_on 'Log in'
    end

    it 'displays a list of the categories' do
      visit 'categories'
      expect(page).to have_content 'Shopping'
      expect(page).to have_content 'Electronics'
    end

    it 'has a button to add new category' do
      visit 'categories'
      expect(page).to have_button('Create Category')
    end

    it 'should take you to add category form when clicking on the create category button' do
      visit 'categories'
      click_link('Create Category')
      expect(current_path).to eql new_category_path
    end

    it 'has a button to add new category' do
      visit 'categories'
      click_on 'Shopping'
      expect(current_path).to eql category_path(@category1)
    end
  end
end
