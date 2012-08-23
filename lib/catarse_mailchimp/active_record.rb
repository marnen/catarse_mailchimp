module CatarseMailchimp
  module ActiveRecord
    # USAGE
    #
    #   # Simple example
    #   class User < ActiveRecord::Base
    #     sync_with_mailchimp
    #   end
    def sync_with_mailchimp
      self.class_eval <<-RUBY
        after_save do
          if newsletter
            CatarseMailchimp::API.subscribe(self)
          else
            CatarseMailchimp::API.unsubscribe(self)
          end
        end
      RUBY
    end
  end
end
