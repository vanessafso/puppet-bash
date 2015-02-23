require 'spec_helper'
describe 'bashprofile' do

  context 'with defaults for all parameters' do
    it { should contain_class('bashprofile') }
  end
end
