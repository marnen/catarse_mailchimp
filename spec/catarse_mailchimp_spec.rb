require 'spec_helper'

class User < SuperModel::Base
  extend CatarseMailchimp::ActiveRecord

  sync_with_mailchimp subscribe_data: { EMAIL: :email, NAME: :name },      
                      list_id: 'listID',
                      subscribe_when: ->(user) { user.newsletter_changed? && user.newsletter },
                      unsubscribe_when: ->(user) { user.newsletter_changed? && !user.newsletter },
                      ubsubscribe_email: ->(user) { user.email }
end

describe CatarseMailchimp::ActiveRecord do
  context 'when user not want to receive news' do
    let(:user) { User.create(email: 'lorem@lorem.com', newsletter: false) }

    before do
       user.stubs(:newsletter_changed?).returns(true)
       CatarseMailchimp::API.expects(:unsubscribe).with(user.email, 'listID')
     end

    it 'should satisfy expectations' do
      user.save
    end
  end

  context 'when user want to receive news' do
    let(:user) { User.create(email: 'lorem@lorem.com', newsletter: true) }
    
    before do
      user.stubs(:newsletter_changed?).returns(true)
       CatarseMailchimp::API.expects(:subscribe).with({ EMAIL: :email, NAME: :name }, 'listID', user)
    end
    
    it 'should satisfy expectations' do
      user.save
    end
  end
end
