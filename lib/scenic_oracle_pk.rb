require "scenic_oracle_pk/version"
require "scenic/statements"

module ScenicOraclePk
  class Error < StandardError; end
end

module Scenic
  module Statements
    def create_pk_for_view(name, key = 'id')
      key_name = [name.to_s.split('.').last, key.to_s, 'pk'].join('_')
      # say_with_time %q[Primary key "#{key_name}" created for "#{name}".] do
        # suppress_messages do
          execute <<-SQL
          ALTER VIEW #{quote_table_name(name)} ADD CONSTRAINT #{key_name} PRIMARY KEY (#{key}) DISABLE
          SQL
        # end
      # end
    end
  end
  
  module CommandRecorder
    def create_pk_for_view(*args)
      record(:create_pk_for_view, args)
    end
  end
end
