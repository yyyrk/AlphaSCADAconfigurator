# frozen_string_literal: true

class ValidationError < StandardError
  def value_is_not_none_or_empty(value)
    raise ValidationError, 'Пустое значение.' if value.nil? || value.empty?
  end

  def value_is_digit_or_none(value)
    return if value.nil? || value.empty?

    return if value.is_a?(String) && value.match?(/Ad+z/)

    raise ValidationError, 'Значение нельзя привести к числу.'
  end

  def validate_min_max_values(min_value, max_value)
    begin
      min_value = Integer(min_value)
      max_value = Integer(max_value)
    rescue ArgumentError
      raise ValidationError, 'Минимальное и максимальное значения строк должны быть числами'
    end

    raise ValidationError, 'Минимальное значение строки должно быть больше минимального.' if max_value < min_value

    [min_value, max_value]
  end
end
