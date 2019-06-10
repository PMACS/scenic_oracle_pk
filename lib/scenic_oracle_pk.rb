require "scenic_oracle_pk/version"
require "scenic/command_recorder"

module ScenicOraclePk
  class Error < StandardError; end
  
  module Scenic
    module CommandRecorder
      def create_pk_for_view(object:, key: 'id')
        key_name = [object.to_s.split('.').last, key.to_s, 'pk'].join('_')
        say_with_time do
          suppress_messages do
            execute <<-SQL
            ALTER VIEW #{object} ADD CONSTRAINT #{key_name} PRIMARY KEY (#{key}) DISABLE
            SQL
          end
          "Primary key #{key_name} created for #{object}."
        end
      end
    end
  end
end
