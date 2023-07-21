# frozen_string_literal: true

module Helpers
  module FixtureHelper
    def load_fixture(path)
      File.read("#{File.dirname(__FILE__)}/../../fixtures/#{path}")
    end
  end
end
