class Hash
  def deep_strip_keys
    deep_transform_keys { |key| (key.is_a? String) ? key.strip : key }
  end

  def deep_strip_values
    Hash.deep_strip_values(self)
  end

  def deep_lowercase_values
    Hash.deep_lowercase_values(self)
  end

  def deep_uppercase_values
    Hash.deep_uppercase_values(self)
  end

  def flatten_leaves
    Hash.flatten_leaves(self)
  end

  def to_params
    ActionController::Parameters.new(self)
  end

  def normalized
    deep_strip_values.deep_strip_keys.to_lowercase
  end

  def normalized_flattened
    normalized.flatten_leaves
  end

  def add_absent_fields(h, in_array)
    in_array.map do |field|
      h.key?(field) || h[field] = ''
    end
    h
  end

  def self.deep_strip_values(object)
    object.transform_values do |value|
      case value
      when String then
        value.to_s.strip
      when Array then
        value.each { |i| i.strip if i.is_a?(String) }
      when Hash then
        deep_strip_values(value)
      else
        value
      end
    end
  end

  def self.deep_lowercase_values(object)
    object.transform_values do |value|
      case value
      when String then
        value.to_s.downcase
      when Array then
        value.each { |i| i.downcase if i.is_a?(String) }
      when Hash then
        deep_lowercase_values(value)
      else
        value
      end
    end
  end

  def self.deep_uppercase_values(object)
    object.transform_values do |value|
      case value
      when String then
        value.to_s.upcase
      when Array then
        value.each { |i| i.upcase if i.is_a?(String) }
      when Hash then
        deep_uppercase_values(value)
      else
        value
      end
    end
  end

  def self.flatten_leaves(object, out = {})
    object.each do |key, value|
      case value
      when Hash then
        out = flatten_leaves(value, out)
      else
        out[key] = value
      end
    end
    out
  end
end
