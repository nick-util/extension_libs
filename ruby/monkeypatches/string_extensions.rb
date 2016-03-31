class String
  # converts a sentance with spaces to camel case
  # "Panic Alerts".camelize_sentance ->  "PanicAlerts"
  # optional :upper or :lower for camelize type
  def camelize_sentence(case_type = :upper)
    underscore.parameterize('_').camelize(case_type)
  end
end
