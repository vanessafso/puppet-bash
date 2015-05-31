require 'spec_helper'
describe 'bashprofile', :type => :class do
  context 'with a single variable' do
    let (:params) {{
      'bash_variables' => { 'editor' => '/usr/bin/emacs' }
    }}
    it {
      should contain_package('bash').with_ensure('present')
      should contain_file('/etc/profile.d/puppet_managed.sh').with({
        'ensure' => 'file',
        'mode'   => '0644',
        'owner'  => 'root',
        'group'  => 'root',
      })
      should contain_file('/etc/profile.d/puppet_managed.sh').with_content(/^EDITOR=\"\/usr\/bin\/emacs\"$/)
      should contain_file('/etc/profile.d/puppet_managed.sh').with_content(/^export EDITOR$/)
    }
  end
  context 'with multiple variables' do
    let (:params) {{
      'bash_variables' => {
        'histsize' => '2000',
        'editor'   => '/usr/bin/emacs',
        'pager'    => 'more',
      }
    }}
    it {
      should contain_file('/etc/profile.d/puppet_managed.sh').with_content(/^HISTSIZE=\"2000\"$/)
      should contain_file('/etc/profile.d/puppet_managed.sh').with_content(/^export HISTSIZE$/)
      should contain_file('/etc/profile.d/puppet_managed.sh').with_content(/^EDITOR=\"\/usr\/bin\/emacs\"$/)
      should contain_file('/etc/profile.d/puppet_managed.sh').with_content(/^export EDITOR$/)
      should contain_file('/etc/profile.d/puppet_managed.sh').with_content(/^PAGER=\"more\"$/)
      should contain_file('/etc/profile.d/puppet_managed.sh').with_content(/^export PAGER$/)
    }
  end
  context 'none standard package name' do
    let (:params) {{ 'package_name' => 'bash-shell' }}
    it {
      should contain_package('bash-shell')
    }
  end
end
