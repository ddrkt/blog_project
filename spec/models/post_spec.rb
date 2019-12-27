require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'relations' do
    it { should have_many(:comments).dependent(:destroy) }
    it { should belong_to :user }
  end
  describe  'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :body }
    it { should validate_uniqueness_of :name }
  end
end
