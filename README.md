## Bài tập chương trình dịch - INT3402-1
## VC Language Scanner
## Nhóm 5 - Thành viên:
### 17021182 - Nguyễn Duy Công
### 17021203 - Trần Văn Quân
### 17021179 - Nguyễn Đăng An

## Chương trình gồm:
- `VCLangLex.flex` chứa các bộ quy tắc từ tố
- `Token.java` chứa tập từ tố mà chương trình sẽ đoán nhận
- `VCScanner.java` là file được tạo từ file `VCLangLex.flex`
- `test.vc` chứa mã nguồn chương trình ngôn ngữ VC cần đoán nhận
- `ouput.txt` chứa các cặp từ tố và tên phân loại của nó

## Cách chạy:
    
    jflex VCLanglex.flex
    javac VCScanner.java
    java VCScanner test.vc
    
## Lưu ý:
 Cần cài đặt jflex và gán biến môi trường

Sử dụng JDK8+ để chạy chương trình java

Sửa trực tiếp trong mã nguồn chương trình `VCScanner.java` nếu:
- Muốn in kết quả ra màn hình console: thêm `scanner.printResult()` vào hàm `main`
- Muốn lưu kết quả ra file: thêm `scanner.saveResult()` vào hàm `main`
