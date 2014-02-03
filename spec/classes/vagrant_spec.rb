require 'spec_helper'

describe 'vagrant' do

  describe 'version' do
    it 'should compile with 1.4.2' do
       pp = "class { 'vagrant': version => '1.4.2' }"
       apply_manifest(pp, :catch_failures    => true)
    end

    it 'should compile with 1.3.5' do
       pp = "class { 'vagrant': version => '1.3.5' }"
       apply_manifest(pp, :catch_failures    => true)
    end

    it 'should not compile with 1.3.0' do
       pp = "class { 'vagrant': version => '1.3.0' }"
       apply_manifest(pp, :catch_failures    => true)
    end
  end
end
