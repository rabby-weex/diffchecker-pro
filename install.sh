#!/bin/bash
# ============================================================
#  DiffChecker Pro - 一键本地安装脚本 (macOS / Linux)
# ============================================================

set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
APP_NAME="DiffChecker Pro.app"

echo "========================================================"
echo "  DiffChecker Pro 一键本地安装程序"
echo "========================================================"

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "[1/3] 检测到 macOS 系统，正在安装应用至 /Applications ..."
  
  SRC_APP=""
  if [ -d "$DIR/$APP_NAME" ]; then
    SRC_APP="$DIR/$APP_NAME"
  elif [ -d "$DIR/app-macos/$APP_NAME" ]; then
    SRC_APP="$DIR/app-macos/$APP_NAME"
  fi

  if [ -n "$SRC_APP" ]; then
    cp -R "$SRC_APP" /Applications/
    xattr -cr "/Applications/$APP_NAME" 2>/dev/null || true
    echo "✅ [成功] 已安装到 /Applications/$APP_NAME"

    # 在桌面创建替身/软链接 (可选)
    ln -sf "/Applications/$APP_NAME" "$HOME/Desktop/$APP_NAME" 2>/dev/null || true
    echo "✅ [成功] 已在桌面创建启动替身"
  else
    echo "⚠️ 未找到 $APP_NAME 目录，准备通过本地 Python 服务启动..."
  fi

  echo "[2/3] 验证 Python 3 运行环境..."
  if ! command -v python3 &>/dev/null; then
    echo "❌ 未检测到 Python 3，请先安装 Python 3 (https://www.python.org/downloads/)"
    exit 1
  fi

  echo "[3/3] 首次启动验证..."
  if [ -d "/Applications/$APP_NAME" ]; then
    open "/Applications/$APP_NAME"
  else
    python3 "$DIR/server.py" &
    sleep 0.5
    open "http://127.0.0.1:28833/"
  fi

else
  echo "检测到 Linux 系统："
  echo "正在启动本地服务..."
  python3 "$DIR/server.py" &
  sleep 0.5
  xdg-open "http://127.0.0.1:28833/" 2>/dev/null || sensible-browser "http://127.0.0.1:28833/" || true
fi

echo "========================================================"
echo "  DiffChecker Pro 安装完成！"
echo "========================================================"
