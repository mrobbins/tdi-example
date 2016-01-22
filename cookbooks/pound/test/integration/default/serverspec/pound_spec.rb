require 'serverspec'
set :backend, :exec
describe 'Pound Loadbalancer' do
  it 'should be listening on port 80' do
    expect(port 80).to be_listening
  end

  it 'should be running the pound service' do
    expect(service 'pound').to be_running
  end

  it 'should have two active backends' do
    expect((command 'poundctl -c /var/lib/pound/pound.cfg').stdout).to  match  /.*Backend.*800[01].*active/
  end

  it 'should have an HTTP Listener' do
    expect((command 'poundctl -c /var/lib/pound/pound.cfg').stdout).to  match /http Listener/
  end

  it 'should not have an HTTPS Listener' do
    expect((command 'poundctl -c /var/lib/pound/pound.cfg').stdout).to_not match /.*HTTPS Listener.*/
  end

  it 'should accept HTTP connections on port 80' do
#    expect((command "echo 'GET / HTTP/1.1' | nc localhost 80").stdout).to match /Content-Length:.*/
  end
end
