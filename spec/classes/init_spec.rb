require 'spec_helper'
describe 'cygwin_apt_cyg' do

  context 'with defaults for all parameters' do
    it { should contain_class('cygwin_apt_cyg') }
  end
end
