require 'rails_helper'

RSpec.describe CategoryExpense, type: :model do
  before(:each) do
    @user = User.create(name: 'Abdu', email: 'abdu@gmail.com', password: 'abdu123')
    @expense = Expense.new(name: 'Burger', amount: 2, author_id: subject.id)
    @category = Category.new(author_id: subject.id, name: 'Shopping', icon: "https://images.freeimages.com/images/large-previews/d2c/water-1182071.jpg")
    @category_expense = CategoryExpense.new(category: @category, expense: @expense)
  end

  describe 'Testing validations' do
    it 'validation should be successful' do
      expect(@category_expense).to be_valid
    end

    it 'should have an expense' do
      expect(@category_expense.expense).to be_present
    end

    it 'should have a valid expense id' do
      @category_expense.expense = nil
      expect(@category_expense).to_not be_valid
    end

    it 'should have a category' do
      expect(@category_expense.category).to be_present
    end

    it 'should have a valid category id' do
      @category_expense.category = nil
      expect(@category_expense).to_not be_valid
    end
  end

  describe 'Testing associations' do
    it 'category expense should belong to a category' do
      @category_expense = CategoryExpense.reflect_on_association(:category)
      expect(@category_expense.macro).to eql(:belongs_to)
    end

    it 'category expense should belong to an expense' do
      @category_expense = CategoryExpense.reflect_on_association(:expense)
      expect(@category_expense.macro).to eql(:belongs_to)
    end
  end
end
