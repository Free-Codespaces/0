#!/bin/bash
# Tạo VPS WINDOWS TRÊN GITHUB CODESPACES
clear
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update &>/dev/null && sudo apt install ngrok -y &>/dev/null

cd
clear
echo "===================================="
echo " RINNE VPS "
echo " Code tạo bởi: Filbertt Matthew (Facebook)"

echo "Liên hệ tạo images: https://www.facebook.com/rinne.09"

echo "===================================="
sleep 4
clear
echo "===================================="
echo "===================================="
read -p "Lấy mã token Ngrok ở https://dashboard.ngrok.com/get-started/your-authtoken sau đó dán vào đây và enter:  " CRP
echo "===================================="
echo "===================================="
echo "Đang tải file Windows"
cd && wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1e9b2Cqe7TniXtO1kd9ladPWSeb5Ue8a2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1e9b2Cqe7TniXtO1kd9ladPWSeb5Ue8a2" -O /tmp/win.img &>/dev/null && rm -rf /tmp/cookies.txt
echo "===================================="
echo "===================================="
echo "Chờ chút..."
echo "===================================="
echo "===================================="
echo "Đang tiến hành cài đặt trình ảo hoá KVM.."
echo "===================================="
echo "===================================="
sudo apt update &>/dev/null && echo "Sắp xong..." && sudo apt install -y qemu-system-x86 qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils &>/dev/null && sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils -y &>/dev/null
sudo adduser $USER libvirt &>/dev/null &
sudo adduser $USER kvm &>/dev/null &
echo "===================================="
echo "===================================="
sudo mv /tmp/win.img /var/lib/libvirt/images/win.img
sudo qemu-system-x86_64 -m 3G -cpu max -enable-kvm -boot order=d -hda /var/lib/libvirt/images/win.img -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :1 -smp cores=3 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/tmp -device virtio-rng-pci,rng=rng0 -vga vmware &>/dev/null &


clear
ngrok authtoken $CRP
ngrok tcp 3388 &>/dev/null &
clear
echo "===================================="
echo "===================================="
echo "IP VPS LÀ:"

curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'


echo "===================================="
echo "===================================="
echo "USERNAME LÀ: RinneVPS"
echo "PASSWORD: Rinne@001"
echo "===================================="
echo "===================================="
echo "KHÔNG TẮT CỬA SỔ LỆNH NÀY, CHỈ NÊN TẮT TABS WEB"
echo "KHOẢNG 3 TIẾNG 50 PHÚT, HÃY VÀO https://github.com/codespaces VÀ VÀO TABS ĐỂ VPS KHÔNG TẮT ĐỘT NGỘT SAU 4 TIẾNG"

echo "===================================="
echo "===================================="
yes &>/dev/null

