# AUDIT: xác nhận đã thẩm định script
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
"BAO CAO SU CO HE THONG" | Out-File -FilePath "..\backup\bao-cao-su-co.txt" -Encoding utf8
"Thoi gian tao: $date" | Out-File -FilePath "..\backup\bao-cao-su-co.txt" -Append -Encoding utf8
"----------------------------------------" | Out-File -FilePath "..\backup\bao-cao-su-co.txt" -Append -Encoding utf8

# Lọc log ERROR hoặc CRITICAL ghi vào báo cáo
Get-Content "..\data\log-he-thong.log" | Select-String "CRITICAL", "ERROR" | Out-File -FilePath "..\backup\bao-cao-su-co.txt" -Append -Encoding utf8

# Đếm số dòng lỗi
$errorCount = (Get-Content "..\data\log-he-thong.log" | Select-String "CRITICAL", "ERROR").Count
"----------------------------------------" | Out-File -FilePath "..\backup\bao-cao-su-co.txt" -Append -Encoding utf8
"TONG SO SU CO: $errorCount" | Out-File -FilePath "..\backup\bao-cao-su-co.txt" -Append -Encoding utf8
