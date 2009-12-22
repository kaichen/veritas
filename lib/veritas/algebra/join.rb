module Veritas
  module Algebra
    class Join < Relation
      include CombineOperation

      def self.new(left, right)
        if (left.header & right.header).empty?
          raise InvalidHeaderError, "the headers must have common attributes for #{name}.new"
        end

        super
      end

    private

      def combine_bodies
        body = []

        index     = left_index
        offsets   = right_offsets
        remainder = (0..right.header.size-1).to_a - offsets

        right.each do |right_tuple|
          key = right_tuple.values_at(*offsets)
          next unless index.key?(key)

          join_tuple = right_tuple.values_at(*remainder)

          index[key].each do |left_tuple|
            body << left_tuple + join_tuple
          end
        end

        body
      end

      def left_offsets
        @left_offsets ||= offset(left.header)
      end

      def right_offsets
        @right_offsets ||= offset(right.header)
      end

      def offset(header)
        common.map { |attribute| header.index(attribute) }
      end

      def common
        @common ||= left.header & right.header
      end

      def left_index
        offsets = left_offsets
        index   = {}

        left.each do |left_tuple|
          (index[left_tuple.values_at(*offsets)] ||= []) << left_tuple
        end

        index
      end
    end # class Product
  end # module Algebra
end # module Veritas