require 'spec_helper'

describe 'default recipe on Windows 2012 R2' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2') }
  let(:chef_run) { runner.converge('sysinternals::default') }

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
