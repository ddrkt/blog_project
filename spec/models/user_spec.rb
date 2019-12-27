require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'author_of?' do
    let(:author) { create(:user) }
    let(:user) { create(:user) }
    let(:instance) { create(:post, user: author) }

    it 'Return true if user equals to instance.user' do
      expect(author).to be_author_of(instance)
    end

    it 'Return false if user not equals to instance.user' do
      expect(user).to_not be_author_of(instance)
    end

    it 'Return false if instance has no user attribute' do
      expect(user).to_not  be_author_of(Object.new)
    end
  end
  describe 'relations' do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe 'validations' do
    it { should allow_value("email@addresse.foo").for(:email) }
    it { should_not allow_value("foo").for(:email) }
    it { should validate_presence_of :nickname}
    it { should validate_uniqueness_of :nickname}
    it { should validate_presence_of :email}
  end
end
