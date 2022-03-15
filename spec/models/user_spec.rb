require 'rails_helper'
require 'users_controller'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new
    @user.name = 'firstname lastname'
    @user.email = 'test@test.com'
    @user.password = 'test-password'
    @user.password_confirmation = 'test-password'
  end

  describe 'Validations' do

    it 'will return error if user has no name' do
      @user.name = nil
      @user.save

      expect(@user.errors.full_messages).to include("Name can't be blank")
    end 


    it 'will return error if user has empty password' do
      @user.password = nil
      @user.save

      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

  
    it 'will return error about empty password confirmation' do
      @user.password_confirmation = nil
      @user.save

      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end


    it 'will return error about incorrect password confirmation' do
      @user.password_confirmation = 'incorrect-confirmation'
      @user.save

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    it 'will return error if password length is less than 4' do
      @user.password = '123'
      @user.password_confirmation = '123'
      @user.save

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end

    it 'will return error if user has empty email' do
      @user.email = nil
      @user.save

      expect(@user.errors.full_messages).to include("Email can't be blank")
    end 

    it 'will return error about email already in use' do
      @user2 = User.new
      @user2.name = 'User Two'
      @user2.email = @user.email.upcase
      @user2.password = 'password2'
      @user2.password_confirmation = 'password2'
        
      @user.save
      @user2.save

      expect(@user2.errors.full_messages).to include('Email has already been taken')
    end
  end

  describe '.authenticate_with_credentials' do

    before(:each) do
      @user.save
    end

    it 'should return user object with correct credentials' do
      user = User.authenticate_with_credentials @user.email, @user.password

      expect(user).to be_instance_of(User)
    end


    it 'should not return user object with incorrect credentials' do
      user = User.authenticate_with_credentials @user.email, 'incorrect-password'

      expect(user).to eq(nil)
    end


    it 'should return user object with whitespace' do
      email_with_whitespace = ' ' + @user.email + ' '
      user = User.authenticate_with_credentials email_with_whitespace, @user.password

      expect(user).to be_instance_of(User)
    end



    it 'should return user object even with incorrect casing' do 
      user = User.authenticate_with_credentials @user.email.upcase, @user.password

      expect(user).to be_instance_of(User)
    end

 
    it 'should not return user object with incorrect email' do 
      incorrect_email = '2' + @user.email
      user = User.authenticate_with_credentials incorrect_email, @user.password

      expect(user).to eq(nil)
    end


    it 'should not return user object with incorrect password' do 
      user = User.authenticate_with_credentials @user.email, @user.password.upcase

      expect(user).to eq(nil)
    end


  end
end