module Veritas
  class Relation
    module Operation
      class Order
        class DirectionSet
          include Enumerable

          def initialize(directions)
            @directions = Array(directions).map do |direction|
              Ascending.coerce(direction)
            end
          end

          def each(&block)
            to_ary.each(&block)
            self
          end

          def to_ary
            @directions
          end

          def attributes
            map { |direction| direction.attribute }
          end

          def sort(tuples)
            tuples.sort { |left, right| cmp_tuples(left, right) }
          end

          def ==(other)
            other = self.class.coerce(other)
            to_ary == other.to_ary
          end

          def eql?(other)
            instance_of?(other.class) &&
            to_ary.eql?(other.to_ary)
          end

          def hash
            to_ary.hash
          end

        private

          def cmp_tuples(left, right)
            each do |direction|
              cmp = direction.call(left, right)
              return cmp if cmp != 0
            end
          end

          def self.coerce(object)
            object.kind_of?(DirectionSet) ? object : new(object)
          end

        end # class DirectionSet
      end # class Order
    end # module Operation
  end # class Relation
end # module Veritas
