require 'ib-ruby/models/contract_detail'

module IB
  module Models
    class Underlying < Model.for(:underlying)
      include ModelProperties

      has_one :contract

      prop :con_id, # Id of the Underlying Contract
           :delta, # double: The underlying stock or future delta.
           :price #  double: The price of the underlying.

      validates_numericality_of :con_id, :delta, :price #, :allow_nil => true

      def default_attributes
        {:con_id => 0}.merge super
      end

      # Serialize under_comp parameters
      def serialize
        [true, con_id, delta, price]
      end

      # Comparison
      def == other
        con_id == other.con_id && delta == other.delta && price == other.price
      end

    end # class Contract
    UnderComp = Underlying

  end # module Models
end # module IB