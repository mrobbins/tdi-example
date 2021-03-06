require 'serverspec'
set :backend, :exec

describe 'Chefanatic' do
  it 'should install the lighttpd package' do
    expect(package 'lighttpd').to be_installed
  end
  
  it 'should enable and start the lighttpd service' do
    expect(service 'lighttpd').to be_enabled
    expect(service 'lighttpd').to be_running
  end

  it 'should render the Chefanatic web Page' do
    expect(file('/var/www/index.html')).to be_file
    expect(file('/var/www/index.html')).to contain 'Chefanatic'
  end

end
