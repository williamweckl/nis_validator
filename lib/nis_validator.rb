class NisValidator < ActiveModel::EachValidator
  autoload :Nis, 'nis_validator/nis'

  def validate_each(record, attribute, value)
    message = options[:message].presence || :invalid
    record.errors.add(attribute, message) unless Nis.valid?(value)
  end
end
