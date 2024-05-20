# frozen_string_literal: true

class Url
  def initialize(url)
    @url = url
  end

  def scheme
    @url.split('://').first
  end

  def host
    @url.split('://').last.split('/')[0].split('?').first.split(':').first
  end

  def port
    @url.split(':').last.split('/').first.to_i
  end

  def query_params
    return {} unless @url.include?('?')

    query = @url.split('?').last
    query.split('&').map do |param|
      key_value = param.split('=')
      key_value[0] = key_value[0].to_sym
      key_value << nil if key_value.length < 2
      key_value
    end.to_h
  end

  def query_param(key, default = nil)
    query_params.fetch(key, default)
  end

  include Comparable

  def ==(other)
    scheme == other.scheme && host == other.host && port == other.port && query_params == other.query_params
  end
end