module CatarseMailchimp
  module Sync
    extend self

    def subscribe(user, list_id = ::Configuration[:mailchimp_list_id])
      subscribe_params = {
        id: list_id,
        batch: [ { :EMAIL => user.email } ]
      }

      mailchimp_api.list_batch_subscribe(subscribe_params)
    end

    def unsubscribe(user, list_id = ::Configuration[:mailchimp_list_id])
      unsubscribe_params = {
        id: list_id,
        emails: [ user.email ],
        delete_member: true,
        send_goodbye: true
      }

      mailchimp_api.list_batch_unsubscribe(unsubscribe_params)
    end

    protected

    def mailchimp_api
      Mailchimp::API.new(::Configuration[:mailchimp_api_key])
    end
  end
end
