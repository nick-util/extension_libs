class LongitudeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil?
    return if (value >= -180) && (value <= 180)
    msg = 'Invalid Longitude: Value must be > -180 and < 180'
    record.errors[attribute] << (options[:message] || msg)
  end
end
