require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'relations' do
    it { should belong_to :user }
    it { should belong_to :post }
  end
  describe  'validates' do
    it { should validate_presence_of :body }
  end
end
