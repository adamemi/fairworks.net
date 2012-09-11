class Prize < ActiveRecord::Base
  # accessibility
  attr_accessible :amount, :name, :color

  # money
  composed_of :amount,
    :class_name => "Money",
    :mapping => [%w(amount_cents cents), %w(amount_currency currency_as_string)],
    :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
end
