class LatitudeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil?
    return if (value >= -90) && (value <= 90)
    msg = 'Invalid Latitude: Value must be > -90 and < 90'
    record.errors[attribute] << (options[:message] || msg)
  end
end
