require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject do
    User.create(name: 'Jonas', email: 'jonas@gmail.com', password: 'jonas123')
  end

  before(:each) do
    @expense = Expense.new(name: 'Burger', amount: 2, author_id: subject.id)
  end

  describe 'Testing validations' do
    it 'should be validates' do
      expect(@expense).to be_valid
    end

    it 'should have a name for expense' do
      expect(@expense.name).to eql('Burger')
    end

    it 'should have an amount for expense' do
      expect(@expense.amount).to eql(2)
    end

    it 'should have a quantity for food' do
      expect(@expense.amount).to be >= 0
    end

    it 'should have a user id' do
      expect(@expense.author_id).to be_present
    end
  end

  describe 'Testing associations' do
    it 'expense should belong to a user' do
      @expense = Expense.reflect_on_association(:author)
      expect(@expense.macro).to eql(:belongs_to)
    end

    it 'expense should have zero to many categories' do
      @expense = Expense.reflect_on_association(:category_expenses)
      expect(@expense.macro).to eql(:has_many)
    end
  end
end
