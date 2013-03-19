module CatarseMailchimp
  module API
    extend self

    def subscribe(hash, list_id = MAILCHIMP_LIST_ID, resource)
      subscribe_params = {
        id: list_id.to_s,
        batch: [ convert_to_resource_params(hash, resource) ]
      }

      mailchimp_api.list_batch_subscribe(subscribe_params)
    end

    def unsubscribe(email, list_id = MAILCHIMP_LIST_ID, resource)
      unsubscribe_params = {
        id: list_id.to_s,
        emails: [email],
        delete_member: true,
        send_goodbye: true
      }

      mailchimp_api.list_batch_unsubscribe(unsubscribe_params)
    end
    
    
    def convert_to_resource_params(hash, resource)
      new_hash = {}
      hash.to_a.collect do |map|
        new_hash[map[0]] = resource.send(map[1])
      end
      new_hash
    end

    protected

    def mailchimp_api
      Mailchimp::API.new(MAILCHIMP_API_KEY)
    end
  end
end
