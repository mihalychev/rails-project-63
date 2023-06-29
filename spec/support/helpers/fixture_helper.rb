# frozen_string_literal: true

require 'pathname'

module Helpers
  module FixtureHelper
    def load_fixture(path)
      base_path.join(path).read
    end

    private

    def base_path
      Pathname.new(File.join('spec', 'fixtures'))
    end
  end
end
