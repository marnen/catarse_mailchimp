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
        before_save do
          if newsletter_changed?
            if newsletter
              CatarseMailchimp::API.subscribe(self)
            else
              CatarseMailchimp::API.unsubscribe(self)
            end
          end
        end
      RUBY
    end
  end
end
