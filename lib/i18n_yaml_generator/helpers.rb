module I18nYamlGenerator
  module Helpers
    def wrap_hash(obj, scope)
      hsh = nil
      scope.reverse.each do |scope_node|
        hsh = { scope_node => hsh || obj }
      end
      return hsh
    end

    def comment_yaml_body(string)
      lines = string.lines.to_a
      new_lines = lines[0..1] + lines[2..-1].collect{ |line| line.gsub(/^(.?)/, '#\1') }
      new_lines.join
    end
  end
end

