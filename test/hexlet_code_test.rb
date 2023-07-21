# frozen_string_literal: true

require_relative 'test_helper'

class HexletCodeTest < Minitest::Test
  include Helpers::FixtureHelper

  User = Struct.new(:name, :bio, keyword_init: true)

  def setup
    @user = User.new(name: 'rob', bio: 'some text')
    @attributes = { class: 'form' }
    @subject = ->(&block) { HexletCode.form_for(@user, @attributes, &block) }
  end

  def test_empty_form
    expected = load_fixture('form_only_with_default_url.html')
    assert_equal expected, @subject.call
  end

  def test_empty_form_with_custom_url
    @attributes = { url: '/users', class: 'form' }
    expected = load_fixture('form_only_with_custom_url.html')
    assert_equal expected, @subject.call
  end

  def test_form_with_textarea
    expected = load_fixture('form_with_textarea.html')
    assert_equal(
      expected,
      @subject.call do |f|
        f.input :name, as: :text
      end
    )
  end

  def test_form_with_input
    expected = load_fixture('form_with_input.html')
    assert_equal(
      expected,
      @subject.call do |f|
        f.input :name
      end
    )
  end

  def test_form_with_submit
    expected = load_fixture('form_with_submit.html')
    assert_equal(
      expected,
      @subject.call(&:submit)
    )
  end

  def test_form_with_all_tags
    expected = load_fixture('form_with_all_tags.html')
    assert_equal(
      expected,
      @subject.call do |f|
        f.input :name
        f.input :bio, as: :text
        f.submit
      end
    )
  end
end
