$port = 8080
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()

Write-Host "服务器运行在 http://localhost:$port/"
Write-Host "可用的网页："
Write-Host "- 主页: http://localhost:$port/index.html"
Write-Host "- 逻辑思维训练: http://localhost:$port/test.html"
Write-Host ""
Write-Host "按 Ctrl+C 停止服务器"

while ($listener.IsListening) {
    $context = $listener.GetContext()
    $request = $context.Request
    $response = $context.Response
    
    $path = $request.Url.LocalPath
    if ($path -eq "/") { $path = "/index.html" }
    
    $filePath = Join-Path $PSScriptRoot $path.Substring(1)
    
    if (Test-Path $filePath) {
        $content = [System.IO.File]::ReadAllBytes($filePath)
        $response.StatusCode = 200
        
        $ext = [System.IO.Path]::GetExtension($filePath)
        $contentType = "text/html"
        
        switch ($ext) {
            ".html" { $contentType = "text/html" }
            ".js" { $contentType = "text/javascript" }
            ".css" { $contentType = "text/css" }
            ".json" { $contentType = "application/json" }
            ".png" { $contentType = "image/png" }
            ".jpg" { $contentType = "image/jpeg" }
            ".gif" { $contentType = "image/gif" }
            ".svg" { $contentType = "image/svg+xml" }
            ".ico" { $contentType = "image/x-icon" }
        }
        
        $response.ContentType = $contentType
        $response.ContentLength64 = $content.Length
        $response.OutputStream.Write($content, 0, $content.Length)
    } else {
        $response.StatusCode = 404
        $errorContent = [System.Text.Encoding]::UTF8.GetBytes("<h1>404 - File Not Found</h1>")
        $response.ContentType = "text/html"
        $response.ContentLength64 = $errorContent.Length
        $response.OutputStream.Write($errorContent, 0, $errorContent.Length)
    }
    
    $response.OutputStream.Close()
}

$listener.Stop()