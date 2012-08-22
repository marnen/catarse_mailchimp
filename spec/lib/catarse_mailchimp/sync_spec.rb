require 'spec_helper'

describe 'Subscribe and Unsubscribe user email on mailchimp' do
  before do
    fake_mailchimp = mock();
    fake_mailchimp.stubs(:list_batch_subscribe).returns('list_batch_subscribe')
    fake_mailchimp.stubs(:list_batch_unsubscribe).returns('list_batch_unsubscribe')

    Mailchimp::API.stubs(:new).returns(fake_mailchimp)
  end

  subject { Factory(:user) }

  context 'Subscribe' do
    it 'when user want to receive a newsletter, should update on mailchimp list' do
      instance = CatarseMailchimp::Sync.subscribe(subject, 'LISTID')
      instance.should == 'list_batch_subscribe'
    end
  end

  context 'Unsubscribe' do
    it 'when user want to not receive a newsletter, should update on mailchimp list' do
      instance = CatarseMailchimp::Sync.unsubscribe(subject, 'LISTID')
      instance.should == 'list_batch_unsubscribe'
    end
  end
end
