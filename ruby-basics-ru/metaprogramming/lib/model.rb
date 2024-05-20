# frozen_string_literal: true

# lib/model.rb
# Реализуйте модуль Model, который содержит конструктор и позволяет указывать атрибуты для экземпляров класса и автоматическое преобразование типов.
#
# Модуль Model содержит метод attribute(name, [options = {}]), который принимает следующие параметры.
#
# name - имя атрибута
# options - опции атрибута в виде хеша. Ключ type отвечает за тип, в который будет преобразовываться атрибут при получении. Если тип не указан, то атрибут не преобразуется. Преобразуются все значения, которые не nil. В случае nil возвращается всегда nil
# Когда Model подключается в класс, то класс приобретает следующие методы:
#
# initialize() - принимает хеш с атрибутами. Все атрибуты, которые не указаны в атрибутах - игнорируются. По умолчанию принимает пустой хеш
# attributes() - возвращает хеш с преобразованными атрибутами (преобразуются исходя из заданных атрибутов)
# Вызов метода attribute() создает геттеры и сеттеры атрибута.
#
# Геттеры и сеттеры атрибутов. Геттеры возвращают преобразованные в нужный тип атрибуты

# BEGIN
module Model
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attribute(name, options = {})
      define_method(name) do
        value = instance_variable_get("@#{name}")
        type = options[:type]
        if value.nil?
          nil
        else
          case type
          when :integer
            value.to_i
          when :string
            value.to_s
          when :boolean
            !!value
          when :datetime
            DateTime.parse(value)
          else
            value
          end
        end
      end

      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
    end
  end

  def initialize(attributes = {})
    attributes.each do |name, value|
      public_send("#{name}=", value) if respond_to?("#{name}=")
    end
  end

  def attributes
    instance_variables.each_with_object({}) do |var, hash|
      name = var.to_s.delete('@').to_sym
      hash[name] = public_send(name)
    end
  end
end
# END
