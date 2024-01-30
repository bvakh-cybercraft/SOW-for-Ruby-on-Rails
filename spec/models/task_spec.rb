require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { build(:task) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(120) }

    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_most(200) }

    it { should validate_presence_of(:due_date) }
  end

  describe 'associations' do
    it { should have_many_attached(:images) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(active: 0, completed: 1) }
    it { should define_enum_for(:priority).with_values(low: 0, medium: 1, high: 2) }
  end
end
