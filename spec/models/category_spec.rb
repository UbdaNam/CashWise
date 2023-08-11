require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    User.create(name: 'Jonas', email: 'jonasnw@gmail.com', password: 'jonas123')
  end

  before(:each) do
    @category = Category.new(author_id: subject.id, name: 'Shopping', icon: "https://images.freeimages.com/images/large-previews/d2c/water-1182071.jpg")
  end

  describe 'Testing validations' do
    it 'validation should be successful' do
      expect(@category).to be_valid
    end

    it 'should have a user id' do
      expect(@category.author_id).to be_present
    end

    it 'should have a name for category' do
      expect(@category.name).to eql 'Shopping'
    end

    it 'should have a icon url' do
      expect(@category.icon).to be_present
    end
  end

  describe 'Testing Associations' do
    it 'category should belong to a user' do
      @category = Category.reflect_on_association(:author)
      expect(@category.macro).to eql(:belongs_to)
    end

    it 'category should have many category transactions/expenses' do
      @category = Category.reflect_on_association(:category_expenses)
      expect(@category.macro).to eql(:has_many)
    end
  end
end
