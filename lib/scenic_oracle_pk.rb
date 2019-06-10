require "scenic_oracle_pk/version"
require "scenic/statements"
require "scenic/command_recorder"

module ScenicOraclePk
  class Error < StandardError; end
end

module Scenic
  module Statements
    def create_pk_for_view(name, key = 'id')
      key_name = [name.to_s.split('.').last, key.to_s, 'pk'].join('_')
      execute <<-SQL
      ALTER VIEW #{quote_table_name(name)} ADD CONSTRAINT #{key_name} PRIMARY KEY (#{key}) DISABLE
      SQL
    end
  end
  
  module CommandRecorder
    def create_pk_for_view(*args)
      record(:create_pk_for_view, args)
    end
  end
end
