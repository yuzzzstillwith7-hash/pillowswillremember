@echo off
echo 正在启动本地服务器...
echo.
echo 服务器将在 http://localhost:8080 上运行
echo 按 Ctrl+C 停止服务器
echo.
echo 可用的网页：
echo - 主页: http://localhost:8080/index.html
echo - 逻辑思维训练: http://localhost:8080/test.html
echo.

python -m http.server 8080

pause