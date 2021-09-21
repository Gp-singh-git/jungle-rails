require 'rails_helper'

RSpec.describe User, type: :model do

describe 'Validations' do

  it ' new user is created successfully' do
  @user = User.new(firstname: 'f1', lastname: 'l1', email: 'e1@gmail.com', password:'p1111', password_confirmation: 'p1111')
  expect(@user).to be_valid
  end

  it 'password matches confirm password' do
  @user = User.new(firstname: 'f1', lastname: 'l1', email: 'e1@gmail.com', password:'p11111', password_confirmation: 'q1')
  expect(@user).to_not be_valid
  expect(@user.errors.full_messages[0]).to include ("doesn't match")

  end

  it 'refuses to create a user without password or confirmation' do
    @user = User.new(firstname: 'f1', lastname: 'l1', email: 'e1@gmail.com', password_confirmation: 'q1')
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages[0]).to include ("can't be blank")

  end

  it 'ensures user has a name' do
    @user = User.new(
      firstname: nil,
      lastname: 'lastName',
      email: 'user@mail.com',
      password: 'nil',
      password_confirmation: 'nil'
    )
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages[0]).to include("can't be blank")
  end

  it 'ensures user has a last name' do
    @user = User.new(
      firstname: 'Nil',
      lastname: nil,
      email: 'user@mail.com',
      password: 'nil123',
      password_confirmation: 'nil123'
    )
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages[0]).to include("can't be blank")
  end


  it 'refuses to create a user with the email that already exists' do
    @user1 = User.new(
      firstname: 'Nil',
      lastname: "Lst",
      email: 'email@email.com',
      password: 'nil123',
      password_confirmation: 'nil123'
    )
    @user1.save!

    @user2 = User.new(
      firstname: 'Nil',
      lastname: "name",
      email: 'emaiL@email.com',
      password: 'nil123',
      password_confirmation: 'nil123'
    )
    expect(@user2).to_not be_valid
    expect(@user2.errors.full_messages[0]).to eq("Email has already been taken")
  end
  it 'ensures that password is long enough' do
    @user = User.new(
      firstname: 'Nil',
      lastname: "nilovich",
      email: 'user@mail.com',
      password: '123',
      password_confirmation: '123'
    )
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 4 characters)")
  end

end

describe '.authenticate_with_credentials' do
  it 'redirects user with correct password to main page' do
    @user = User.create(
      firstname: 'Nil',
      lastname: "nilovich",
      email: 'user@mail.com',
      password: '12345',
      password_confirmation: '12345'
    )
    
    expect(User.authenticate_with_credentials('user@mail.com', '12345')).to eq(@user)
  end

  it 'logs in user with correct email in uppercase' do
    @user = User.create(
      firstname: 'Nil',
      lastname: "nilovich",
      email: 'user@mail.com',
      password: '12345',
      password_confirmation: '12345'
    )
    
    expect(User.authenticate_with_credentials('USER@mail.com', '12345')).to eq(@user)
  end

  it 'logs in user with correct email and spaces' do
    @user = User.create(
      firstname: 'Nil',
      lastname: "nilovich",
      email: 'user@mail.com',
      password: '12345',
      password_confirmation: '12345'
    )
    
    expect(User.authenticate_with_credentials(' user@mail.com ', '12345')).to eq(@user)
  end

end

end