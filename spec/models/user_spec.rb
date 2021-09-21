require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
   it "password and confirm_password is not the same" do
    @user=User.new(
      name:'amy',
      email:"123@gmail.com",
      password:"12345",
      password_confirmation:"23145")
    
     expect(@user.name).to_not be_equal(@user.password_confirmation)
   end
   it "Emails must be unique" do

    @user1=User.create(
      name:'amy',
      email:"123@gmail.com",
      password:"12345",
      password_confirmation:"23145")

    @user2=User.create(
      name:'amy',
      email:"123@gmail.com",
      password:"12345",
      password_confirmation:"23145")

    expect(@user2).to_not (be_valid)
   end
   it 'should be invalid without name' do
    @user=User.new(
      name:nil,
      email:"123@gmail.com",
      password:"12345",
      password_confirmation:"23145")
    expect(@user).to_not (be_valid)
   end

   it 'should be invalid without email' do
    @user=User.new(
      name:'amy',
      email:"123@gmail.com",
      password:nil,
      password_confirmation:"23145")
    expect(@user).to_not (be_valid)
   end
   it 'should have a password with a minimum length of 3' do
    @user=User.create(
      name:'amy',
      email:"123@gmail.com",
      password:"12",
      password_confirmation:"12")
    expect(@user).to_not (be_valid)
   end
end

describe '.authenticate_with_credentials' do
  it 'if successfully authenticated' do
  @user=User.create(
    name:'amy',
    email:"123@gmail.com",
    password:'123',
    password_confirmation:'123')
  authenticate = User.authenticate_with_credentials(@user.email, @user.password)
  expect(authenticate).to_not (be_valid)
  end
end
end



