module Outright
  module Matchers
    class ActAsParanoidMatcher
      def matches?(subject)
        @subject = subject
        klass_is_paranoid? && is_deleted_column_exists?
      end

      def description
        description = "act as paranoid"
      end

      def failure_message
        "Expected #{model_class.name} to be paranoid"
      end

      def negative_failure_message
        "Did not expect #{model_class.name} to be paranoid"
      end

      private

      def model_class
        @subject.class
      end

      def klass_is_paranoid?
        model_class.paranoid?
      end

      def is_deleted_column_exists?
        model_class.column_names.include?("is_deleted")
      end
    end

    def act_as_paranoid
      ActAsParanoidMatcher.new
    end
  end
end
