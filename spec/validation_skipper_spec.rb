require 'spec_helper'

describe ValidationSkipper do
  let (:name) { 'Tyler Durden' }
  let (:email) { 'tylerdurden@example.com' }
  let (:password) { 'tyler&marla4EVAR' }

  describe 'when not skipping validation' do
    context 'given valid attributes' do
      let (:attributes) do
        {
          name: name,
          email: email,
          password: password
        }
      end

      it 'should be valid' do
        expect(TestUser.new(attributes)).to be_valid
      end
    end

    context 'given invalid attributes' do
      let (:attributes) do
        {
          name: name,
          email: email,
          password: nil
        }
      end

      it 'should be invalid' do
        expect(TestUser.new(attributes)).not_to be_valid
      end
    end
  end

  describe 'when skipping validation' do
    context 'given valid attributes' do
      let (:attributes) do
        {
          name: name,
          email: email,
          password: password
        }
      end

      it 'should be valid' do
        user = TestUser.new(attributes)
        user.skip_validation_for :password
        expect(user).to be_valid
      end
    end

    context 'given invalid skipped attributes' do
      let (:attributes) do
        {
          name: name,
          email: email,
          password: nil
        }
      end

      it 'should be valid' do
        user = TestUser.new(attributes)
        user.skip_validation_for :password
        expect(user).to be_valid
      end
    end

    context 'given invalid non-skipped attributes' do
      let (:attributes) do
        {
          name: nil,
          email: email,
          password: password
        }
      end

      it 'should be valid' do
        user = TestUser.new(attributes)
        user.skip_validation_for :password, :email
        expect(user).not_to be_valid
      end
    end
  end
end
