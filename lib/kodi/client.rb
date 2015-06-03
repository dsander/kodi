module Kodi
  class Client
    attr_reader :uri, :namespaces

    def initialize(uri, method_groups = nil)
      @uri = URI.parse(uri)
      @namespaces = Namespace.generate_namespaces @uri, method_groups
    end

    def method_missing(method_name, *arguments, &block)
      find_namespace(method_name) || super
    end

    private

    def find_namespace(name)
      namespaces[name.to_s.camelize]
    end
  end
end
