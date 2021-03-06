module Veritas
  class Tuple
    attr_reader :header

    def initialize(header, data)
      @header, @data = header, data.to_ary
    end

    def [](attribute)
      to_ary[header.index(attribute)]
    end

    def project(header)
      self.class.new(header, header.map { |attribute| self[attribute] })
    end

    def to_ary
      @data
    end

    def ==(other)
      header = self.header
      other  = self.class.coerce(header, other)
      header == other.header &&
      to_ary == other.project(header).to_ary
    end

    def eql?(other)
      header = self.header
      instance_of?(other.class) &&
      header.eql?(other.header) &&
      to_ary.eql?(other.project(header).to_ary)
    end

    def hash
      header.hash ^ to_ary.hash
    end

    def inspect
      to_ary.inspect
    end

    def self.coerce(header, object)
      if object.kind_of?(Tuple) && object.header.equal?(header)
        object
      else
        new(header, object)
      end
    end

  end # class Tuple
end # module Veritas
