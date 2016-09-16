# Local Tunnel using SSH (used for development a lot)

This is a toolsuite for reverse proxy (nginx et al.) 

On the proxy machine nothing heavy should be running, applications should be piped through secure tunnel (for instance, crude solution using SSH), so that reverse proxy can pick up the socket.

For SSH tunneling one challenge is to kill the background tunnel on-demand. [scy](https://gist.github.com/scy/6781836) provided a smart solution for his environment. However in my environment I can get away with control sockets.

## Control Socket SSH Tunnel

- script for establishing SSH master multiplexed tunnel with control socket
- script for checking lifeness of the tunnel and report back PID of the session

## Usage

To use the script you need to set up `publickey` auth to your application server on your reverse proxy.

`create_tunnel` usage:

```bash
create_tun.sh socket_file local_port remote_listen remote_port host
```

`check_life` usage:

```bash
check_life.sh socket_file host
```

