require 'spec_helper'
describe 'bashprofile::user', :type => :define do
  context 'with a single variable and standard user directory' do
    let (:title) { 'jane.doe' }
    let (:params) {{
      'environment_variables' => { 'editor' => '/usr/bin/emacs' }
    }}
    it {
      should contain_file('/home/jane.doe/.bash_profile').with({
        'ensure' => 'file',
        'mode'   => '0644',
        'owner'  => 'jane.doe',
      })
      should contain_file('/home/jane.doe/.bash_profile').with_content(/^EDITOR=\"\/usr\/bin\/emacs\"$/)
      should contain_file('/home/jane.doe/.bash_profile').with_content(/^export EDITOR$/)
    }
  end
  context 'with multiple variables and none-standard user directory' do
    let (:title) { 'jane.doe' }
    let (:params) {{
      'homedir'               => '/root',
      'environment_variables' => {
        'editor' => '/usr/bin/emacs',
        'pager'  => 'more',
      }
    }}
  end
end
