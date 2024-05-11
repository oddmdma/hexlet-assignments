# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_push_elements
    stack = Stack.new
    stack.push! 'ruby'
    stack.push! 'php'
    stack.push! 'java'
    stack.to_a
    assert { stack.size == 3 }
  end

  def test_remove_elements
    stack = Stack.new
    stack.push! 'ruby'
    stack.push! 'php'
    stack.push! 'java'
    stack.pop!
    stack.to_a
    assert { stack.size == 2 }
  end

  def test_clear_elements
    stack = Stack.new
    stack.push! 'ruby'
    stack.push! 'php'
    stack.push! 'java'
    stack.clear!
    stack.to_a
    assert { stack.size == 0 }
  end

  def test_empty_stack
    stack = Stack.new
    stack.push! 'ruby'
    stack.push! 'php'
    stack.push! 'java'
    stack.clear!
    stack.to_a
    assert { stack.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
