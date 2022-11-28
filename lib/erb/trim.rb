# frozen_string_literal: true

require "erb"

class ERB
  class Trim < ERB
    VERSION = "0.1.0"

    class TrimScanner < ERB::Compiler::TrimScanner
      def stags
        [*super, '[ \t]*<%-=']
      end
    end

    class TrimCompiler < ERB::Compiler
      def initialize(*)
        super
      end

      def compile_stag(stag, out, scanner)
        case stag
        when /([ \t]*)<%-=/
          scanner.stag = stag
          add_put_cmd(out, content) if content.size > 0
          self.content = +''
        else
          super
        end
      end

      def compile_content(stag, out)
        case stag
        when /([ \t]*)<%-=/
          add_insert_cmd(out, "-> (c) { c.to_s.empty? ? '' : '#{$1}' + c }.((#{content}))")
        else
          super
        end
      end

      def make_scanner(src)
        TrimScanner.new(src, @trim_mode, @percent)
      end
    end

    def make_compiler(trim_mode)
      TrimCompiler.new(trim_mode)
    end
  end
end
