require 'chefspec'

describe "wonderstuff::default" do

  let(:chef_run) { ChefSpec::SoloRunner.new.converge('recipe[chefanatic::default]') }  
   
  it "installs the lighttpd package" do
    expect(chef_run).to install_package 'lighttpd'
  end

  it "creates a webpage to be served" do
    expect(chef_run).to render_file('/var/www/index.html').with_content('Chefanatic')
  end

  it "start the lighttpd service" do
    expect(chef_run).to start_service('lighttpd')
  end

  it "enables the lighttpd service" do 
    expect(chef_run).to enable_service('lighttpd')
  end

end
