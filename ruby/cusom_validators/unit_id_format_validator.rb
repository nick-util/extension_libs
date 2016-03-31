class UnitIdFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil?
    return if /^([0-9A-Za-z]{10}|[0-9A-Za-z]{12})$/ =~ value
    msg = 'Invalid Unit Id Format. Must be 10 or 12 Characters: A-Z or 0-9.'
    record.errors[attribute] << (options[:message] || msg)
  end
end
