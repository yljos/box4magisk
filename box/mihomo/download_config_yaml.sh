#!/system/bin/sh

# 设置环境变量
export PATH="/data/adb/magisk:/data/adb/ksu/bin:/data/adb/ap/bin:$PATH:/data/data/com.termux/files/usr/bin"

# 检查 clash.list 是否存在
if [ ! -f "clash.list" ]; then
    echo "clash.list 文件不存在，请确保文件在当前目录中。"
    exit 1
fi

# 从 clash.list 中读取 URL
url_part=$(cat clash.list | xargs)

# 检查是否成功获取 URL
if [ -z "$url_part" ]; then
    echo "clash.list 文件为空，请检查文件内容。"
    exit 1
fi

# 下载 config.yaml 文件
echo "正在下载配置文件..."
curl -f -A "clash verge" -o "config.yaml" "$url_part"

# 检查下载是否成功
if [ $? -eq 0 ]; then
    echo "配置文件下载成功！"
else
    echo "下载配置文件失败，请检查 URL：$url_part"
fi