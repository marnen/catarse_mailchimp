require 'spec_helper'

class User < SuperModel::Base
  extend CatarseMailchimp::ActiveRecord

  sync_with_mailchimp
end

describe CatarseMailchimp::ActiveRecord do
  let(:user) { User.new(email: 'lorem@lorem.com', newsletter: false) }

  context 'when user not want to receive news' do
    it 'should call unsubscribe api' do
      CatarseMailchimp::API.expects(:unsubscribe).with(user)
    end
  end
  context 'when user want to receive news' do
    it 'should call subcribe api' do
      user.newsletter = true
      CatarseMailchimp::API.expects(:subscribe).with(user)
    end
  end

  after(:each) do
    user.save
  end
end
