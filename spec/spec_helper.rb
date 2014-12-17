require 'bundler/setup'
Bundler.setup

require 'active_model'
require 'nis_validator'
require 'ostruct'

RSpec.configure do |config|

end

class User < OpenStruct
  include ActiveModel::Validations
  validates :nis, :nis => true
end