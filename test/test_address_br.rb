# frozen_string_literal: true

require_relative 'helper'

class TestAddressBR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressBR,
    :zip_code, :state, :state_abbr, :city, :street_prefix, :street, :full_address
  )

  def test_zip_code
    assert_match(/\d{5}-\d{3}/, FFaker::AddressBR.zip_code)
  end

  def test_state
    assert FFaker::AddressBR::STATE.include?(FFaker::AddressBR.state)
  end

  def test_state_abbr
    assert FFaker::AddressBR::STATE_ABBR.include?(FFaker::AddressBR.state_abbr)
  end

  def test_city
    assert FFaker::AddressBR::CITY.include?(FFaker::AddressBR.city)
  end

  def test_street_prefix
    assert FFaker::AddressBR::STREET_PREFIX.include?(FFaker::AddressBR.street_prefix)
  end

  def test_street
    prefixes = FFaker::AddressBR::STREET_PREFIX
    assert_match(/(#{prefixes.join('|')})( \p{Alpha}+){1,2}/, FFaker::AddressBR.street)
  end

  def test_complement
    assert FFaker::AddressBR::COMPLEMENT.include?(FFaker::AddressBR.complement)
  end

  def test_neighborhood
    neighborhood_prefix = FFaker::AddressBR.neighborhood.split(' ').first
    assert FFaker::AddressBR::NEIGHBORHOOD_PREFIXES.include?(neighborhood_prefix)
  end

end
