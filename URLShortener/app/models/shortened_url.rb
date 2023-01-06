# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  short_url  :string           not null
#
require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :short_url, uniqueness:true, presence:true

    def self.random_code
        code = SecureRandom.urlsafe_base64
        while shortened_urls.exists?(code)
            code = SecureRandom.urlsafe_base64
        end
        code            
    end

    after_initialize do |short_url|
        if new_record?(short_url)
            ShortenedUrl.generate_short_url
        end
    end

    :private
    def self.generate_short_url
        
    end
end
