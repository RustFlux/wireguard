#!/bin/bash

# 设置错误时退出
set -e

# 随机生成50000-60000之间的端口
NEW_PORT=$(shuf -i 50000-60000 -n 1)

# 获取当前的端口
CURRENT_PORT=$(grep "ListenPort" /etc/wireguard/wg0.conf | awk '{print $3}')

# 如果找不到当前端口,退出脚本
if [ -z "$CURRENT_PORT" ]; then
    echo "Error: Could not find current port in WireGuard configuration."
    echo "WireGuard configuration content:"
    cat /etc/wireguard/wg0.conf
    exit 1
fi

echo "Current port: $CURRENT_PORT"
echo "New port: $NEW_PORT"

# 更新WireGuard配置文件
sed -i "s/ListenPort = $CURRENT_PORT/ListenPort = $NEW_PORT/" /etc/wireguard/wg0.conf

# 检查sed命令是否成功执行
if [ $? -ne 0 ]; then
    echo "Error: Failed to update WireGuard configuration."
    exit 1
fi

# 验证更新是否成功
NEW_PORT_CHECK=$(grep "ListenPort" /etc/wireguard/wg0.conf | awk '{print $3}')
if [ "$NEW_PORT" != "$NEW_PORT_CHECK" ]; then
    echo "Error: Port update failed. New port does not match in the configuration."
    echo "Expected: $NEW_PORT, Found: $NEW_PORT_CHECK"
    exit 1
fi

# 重启WireGuard服务
systemctl restart wg-quick@wg0

# 检查重启是否成功
if [ $? -ne 0 ]; then
    echo "Error: Failed to restart WireGuard service."
    exit 1
fi

echo "WireGuard port has been updated to $NEW_PORT and service has been restarted."
