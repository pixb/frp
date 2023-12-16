# 参考 `fatedier/frp`

## Usage

```bash
sudo docker pull pixboly/frpc:latest
sudo docker run  -v /work/frp/config:/frp/config -v /work/frp/log:/frp/log --name frpc  -d pixboly/frpc:latest
# frpc
cp config/frpc.toml /work/frp/config/frpc.toml
```

## SEEALSO

- [fatedier/frp](https://github.com/fatedier/frp)
- [nykma/frp](https://github.com/mykma/frp)
