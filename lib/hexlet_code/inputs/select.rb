# frozen_string_literal: true

module HexletCode
  module Inputs
    class Select < Input
      attr_reader :collection

      def initialize(name, value = nil, hash = {})
        @collection = hash[:collection]
        hash.reject! { |key| key == :collection }
        super(name, value, hash)
      end

      def build
        options = collection.map do |elem|
          if elem == value
            Option.new(elem, selected: true)
          else
            Option.new(elem)
          end
        end
        rendered_options = options.map(&:build)
        Tag.build('select', attributes) { rendered_options.join }
      end
    end
  end
end
