module AssociationCallbacks

  module ActiveRecord

    CALLBACKS = %w(
      after_commit
      after_create
      after_destroy
      after_save
      after_update
      after_validation
      before_create
      before_destroy
      before_save
      before_update
      before_validation
    ).freeze

    extend ActiveSupport::Concern

    included do |base|
      CALLBACKS.each do |callback|
        base.class_eval <<-EOS
          class << self

            def #{callback}_with_association(*args, &block)
              if args.last.is_a?(Hash) && args.last.key?(:source)
                options = args.extract_options!
                define_callback_with_association(:#{callback}, args, options, &block)
              else
                #{callback}_without_association(*args, &block)
              end
            end
            alias_method_chain :#{callback}, :association

          end
        EOS
      end
    end

    class_methods do

      private

      def define_callback_with_association(callback, methods, options = {}, &block)
        relation_name = options.delete(:source).try(:to_sym)
        relation = reflect_on_association(relation_name) || raise(ArgumentError.new("No such association: #{name}.#{relation_name}"))
        inverse_relation_name = relation.inverse_of.try(:name).presence || raise(ArgumentError.new("You must specify :inverse_of on #{name}.#{relation_name} to use association callbacks"))
        relation.klass.send(callback, options) do |record|
          invoke_callback_with_association(record, record.send(inverse_relation_name), methods, &block)
        end
      end

    end

    private

    def invoke_callback_block_with_association(record, inverse_record, &block)
      yield(inverse_record, record) if block_given?
    end

    def invoke_callback_methods_with_association(record, inverse_record, methods)
      methods.each do |method|
        if inverse_record.method(method).arity == 1
          inverse_record.send(method, record)
        else
          inverse_record.send(method)
        end
      end
    end

    def invoke_callback_with_association(record, assocation, methods, &block)
      return if assocation.nil?
      if assocation.respond_to?(:find_each)
        assocation.find_each do |inverse_record|
          invoke_callback_methods_with_association(record, inverse_record, methods)
          invoke_callback_block_with_association(record, inverse_record, &block)
        end
      elsif assocation.is_a?(::ActiveRecord::Base)
        invoke_callback_methods_with_association(record, assocation, methods)
        invoke_callback_block_with_association(record, assocation, &block)
      else
        raise "Assocation can't be used by callbacks: #{association.inspect}"
      end
    end

  end

end
