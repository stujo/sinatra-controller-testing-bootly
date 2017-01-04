module Stujo
  module StubModel
    module Base
      def self.included(klass)
        klass.class_eval do

          @@db = {}
          @@nextId = 1

          def self.create(hash)
            item = self.new hash
            item.save
            item
          end

          def initialize(hash)
            @data = hash.dup
          end

          def destroy
            @@db[@data[:id]] = nil
            @data = {}
          end

          def save
            if valid?
              if @data[:id]
                @@db[@data[:id]] = self
              else
                @data[:id] = @@nextId
                @@db[@@nextId] = self
                @@nextId += 1
              end
            end
          end

          def valid?
            true
          end

          def self.all
            make_collection @@db.values
          end

          def self.make_collection(result)
            result = result.clone
            result.instance_eval do
              def self.destroy
                self.each do |model|
                  model.destroy
                end
              end
            end
            result
          end

          def self.find(id)
            @@db[id.to_i]
          end

          # def self.destroy_all
          #   @@db = {}
          #   @@nextId = 1
          # end

          def method_missing(meth, *args, &block)
            if @data.key? meth.to_sym
              @data[meth.to_sym]
            else
              if @data.key? meth
                @data[meth]
              else
                super
              end
            end
          end
        end
      end
    end
  end
end
