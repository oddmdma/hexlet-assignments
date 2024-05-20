# frozen_string_literal: true
require 'forwardable'

class Url
  def initialize(url)
    @url = url
  end

  def scheme
    @url.split('://').first
  end

  def host
    @url.split('://').last.split('/').first
  end

  def port
    @url.split(':').last.split('/').first.to_i
  end

  def query_params
    query = @url.split('?').last
    query.split('&').map { |param| param.split('=') }.to_h
  end

  def query_param(key = nil)
    query_params[key]
  end

  include Comparable

  def ==(other)
    query_params == other.query_params
  end

  extend Forwardable
  def_delegators :@url, :scheme, :host, :port
end
