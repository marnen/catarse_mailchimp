module CatarseMailchimp
  module API
    extend self

    def subscribe(user, list_id = MAILCHIMP_LIST_ID)
      subscribe_params = {
        id: list_id.to_s,
        batch: [ { :EMAIL => user.email } ]
      }

      mailchimp_api.list_batch_subscribe(subscribe_params)
    end

    def unsubscribe(user, list_id = MAILCHIMP_LIST_ID)
      unsubscribe_params = {
        id: list_id.to_s,
        emails: [ user.email ],
        delete_member: true,
        send_goodbye: true
      }

      mailchimp_api.list_batch_unsubscribe(unsubscribe_params)
    end

    protected

    def mailchimp_api
      Mailchimp::API.new(MAILCHIMP_API_KEY)
    end
  end
end
