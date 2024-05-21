https://automationteststore.com
1.1 Tiêu đề và thông tin dự án 
1.1.1 Tiêu đề: Báo cáo thử nghiệm website Automation Test Store
1.1.2 Thông tin dự án
Tên	Website Automation Test Store
Dòng thời gian	Từ 1/5/2024-17/5/2024
Người thực hiện	Nguyễn Quỳnh Như – Nguyễn Huỳnh Gia Huy – Nguyễn Văn Thịnh
Mục tiêu	Đánh giá kết quả thử nghiệm website Automation Test Store
Bảng 1. Thông tin dự án
1.2 Giới thiệu website
Đây là một nền tảng giả lập được tạo ra để giúp sinh viên rèn luyện kỹ năng kiểm thử tự động hóa. Xin lưu ý rằng đây không phải là một cửa hàng thật, và sẽ không có bất kỳ đơn hàng hoặc thanh toán thực tế nào được thực hiện. Mục đích duy nhất của trang web này là phục vụ cho mục đích giáo dục và thực hành.
Trang web này gồm có các chức năng sau:
1.Đăng nhập
2.Đăng xuất 
3.Quên mật khẩu
4.Tài khoản người dùng: tài khoản của tôi, thông tin tài khoản, mật khẩu, sổ địa chỉ, lịch sử đơn hàng, tải xuống
5.Giỏ hàng & Thanh toán: giỏ hàng, thủ tục thanh toán
6.Tìm kiếm
1.3 Giới thiệu các công cụ được sử dụng để hoàn thành đề tài kiểm thử tự động.
1.Công cụ
Visual Studio Code (VS Code)
Mô tả: Visual Studio Code là một trình soạn thảo mã nguồn nhẹ nhưng mạnh mẽ, hỗ trợ nhiều ngôn ngữ lập trình và có thể mở rộng với các tiện ích bổ sung (extensions).
Lý do sử dụng:
Giao diện thân thiện và dễ sử dụng.
Tích hợp tốt với các công cụ kiểm thử như Robot Framework và Selenium thông qua các extension.
Hỗ trợ mã nguồn mở rộng và nhiều ngôn ngữ lập trình.
Robot Framework
Mô tả: Robot Framework là một framework mã nguồn mở cho kiểm thử tự động và tự động hóa quy trình, sử dụng cú pháp từ khóa (keyword-driven) để viết các test case.
Lý do sử dụng:
Dễ sử dụng với cú pháp từ khóa dễ hiểu.
Mở rộng dễ dàng với các thư viện bên ngoài.
Tích hợp tốt với Selenium và các công cụ khác.
2.Thư viện
SeleniumLibrary
Mô tả: SeleniumLibrary là một thư viện của Robot Framework để tự động hóa kiểm thử các ứng dụng web, dựa trên Selenium WebDriver.
Lý do sử dụng:
Hỗ trợ đa trình duyệt và tự động hóa hầu hết các hành động của người dùng trên trang web.
Tích hợp mạnh mẽ với Robot Framework, giúp dễ dàng viết và thực hiện các test case.
OperatingSystem Library
Mô tả: Thư viện này cung cấp các từ khóa để tương tác với hệ điều hành, cho phép thực hiện các tác vụ như quản lý tệp tin, thư mục và thực thi các lệnh hệ thống.
Lý do sử dụng: Cần thiết cho các tác vụ liên quan đến hệ thống trong quá trình kiểm thử, chẳng hạn như kiểm tra sự tồn tại của tệp tin hoặc thư mục, thực hiện các lệnh hệ thống.
Collections Library
Mô tả: Thư viện Collections cung cấp các từ khóa để xử lý và quản lý các cấu trúc dữ liệu như danh sách (list) và từ điển (dictionary).
Lý do sử dụng: Hữu ích cho việc quản lý và xử lý dữ liệu trong các test case, chẳng hạn như so sánh danh sách, thêm hoặc xóa phần tử trong danh sách.
String Library
Mô tả: Thư viện String cung cấp các từ khóa để xử lý và thao tác với chuỗi (string), bao gồm so sánh, nối, tách chuỗi và thay thế ký tự.
Lý do sử dụng: Cần thiết cho các tác vụ liên quan đến xử lý chuỗi trong quá trình kiểm thử, chẳng hạn như kiểm tra nội dung văn bản, định dạng và biến đổi chuỗi.
1.4 Đặc tả chức năng website 
1. Đăng nhập
Mô tả: Người dùng có thể nhập thông tin tài khoản (tên đăng nhập và mật khẩu) để truy cập vào trang web.
Yêu cầu:
Trường nhập tên đăng nhập.
Trường nhập mật khẩu.
Nút "Đăng nhập".
Liên kết đến trang "Quên mật khẩu" trong trường hợp người dùng quên thông tin đăng nhập.
2. Đăng xuất
Mô tả: Người dùng có thể thoát khỏi tài khoản của họ và kết thúc phiên làm việc hiện tại.
Yêu cầu: Nút "Đăng xuất" hiện trên thanh điều hướng hoặc trong mục "Tài khoản của tôi".
3. Quên mật khẩu
Mô tả: Cho phép người dùng khôi phục mật khẩu trong trường hợp họ quên.
Yêu cầu:
Trường nhập địa chỉ email đã đăng ký.
Nút "Gửi yêu cầu khôi phục".
Gửi email hướng dẫn khôi phục mật khẩu tới địa chỉ email đã nhập.
4. Tài khoản người dùng
Tài khoản của tôi
Mô tả: Trang tổng quan của người dùng với thông tin cơ bản và các liên kết tới các phần khác của tài khoản.
Yêu cầu:
Hiển thị thông tin cá nhân.
Liên kết tới các phần khác của tài khoản như thông tin tài khoản, mật khẩu, sổ địa chỉ, lịch sử đơn hàng, tải xuống.
Thông tin tài khoản
Mô tả: Cho phép người dùng xem và chỉnh sửa thông tin cá nhân của họ.
Yêu cầu:
Trường nhập thông tin cá nhân (tên, email, số điện thoại, v.v.).
Nút "Lưu thay đổi".
Mật khẩu
Mô tả: Cho phép người dùng thay đổi mật khẩu.
Yêu cầu:
Trường nhập mật khẩu hiện tại.
Trường nhập mật khẩu mới.
Trường xác nhận mật khẩu mới.
Nút "Lưu thay đổi".
Sổ địa chỉ
Mô tả: Quản lý các địa chỉ giao hàng và thanh toán.
Yêu cầu:
Hiển thị danh sách các địa chỉ hiện tại.
Nút "Thêm địa chỉ mới".
Tùy chọn chỉnh sửa hoặc xóa địa chỉ.
Lịch sử đơn hàng
Mô tả: Hiển thị danh sách các đơn hàng đã đặt.
Yêu cầu:
Hiển thị thông tin đơn hàng (mã đơn hàng, ngày đặt, trạng thái, tổng tiền).
Liên kết chi tiết đơn hàng.
Tải xuống
Mô tả: Cung cấp các liên kết để tải xuống các sản phẩm kỹ thuật số mà người dùng đã mua.
Yêu cầu:
Hiển thị danh sách các sản phẩm có sẵn để tải xuống.
Liên kết tải xuống sản phẩm.
5. Giỏ hàng & Thanh toán
Giỏ hàng
Mô tả: Hiển thị các sản phẩm mà người dùng đã chọn để mua.
Yêu cầu:
Danh sách sản phẩm trong giỏ hàng (tên sản phẩm, số lượng, giá, tổng).
Tùy chọn chỉnh sửa số lượng hoặc xóa sản phẩm.
Hiển thị tổng tiền.
Nút "Tiến hành thanh toán".
Thủ tục thanh toán
Mô tả: Quy trình hoàn tất mua hàng.
Yêu cầu:
Bước nhập thông tin giao hàng.
Bước chọn phương thức thanh toán.
Bước xác nhận đơn hàng.
Nút "Hoàn tất mua hàng".
6. Tìm kiếm
Mô tả: Cho phép người dùng tìm kiếm sản phẩm trên trang web.
Yêu cầu:
Trường nhập từ khóa tìm kiếm.
Nút "Tìm kiếm".
Hiển thị kết quả tìm kiếm (danh sách sản phẩm phù hợp với từ khóa).
7. Đổi đơn vị tiền tệ 
Mô tả: Chức năng đổi đơn vị tiền tệ cho phép người dùng lựa chọn và xem giá sản phẩm bằng đơn vị tiền tệ mà họ mong muốn, như EURO, POUND STERLING, hoặc US DOLLAR.
Yêu cầu:
Danh sách các đơn vị tiền tệ:
-Một menu thả xuống (dropdown menu) hoặc danh sách các lựa chọn cho phép người dùng chọn đơn vị tiền tệ mong muốn.
-Các đơn vị tiền tệ bao gồm: € EURO, £ POUND STERLING, $ US DOLLAR.
Cập nhật giá sản phẩm:
-Khi người dùng chọn một đơn vị tiền tệ, toàn bộ giá sản phẩm trên trang web sẽ được cập nhật và hiển thị theo đơn vị tiền tệ đó.
-Hệ thống cần tự động chuyển đổi giá từ đơn vị tiền tệ mặc định sang đơn vị tiền tệ đã chọn, sử dụng tỷ giá hối đoái hiện tại.
8. Lọc 
Mô tả: Chức năng lọc cho phép người dùng thu hẹp danh sách sản phẩm dựa trên các tiêu chí cụ thể như danh mục, giá, thương hiệu, đánh giá, v.v.
Yêu cầu:
Danh sách các tiêu chí lọc:
-Người dùng cần có các tùy chọn để lọc sản phẩm theo nhiều tiêu chí khác nhau như:
+ Danh mục sản phẩm 
+ Khoảng giá 
+ Thương hiệu 
+ Đánh giá 
Hiển thị kết quả lọc:
-Khi người dùng chọn các tiêu chí lọc, danh sách sản phẩm sẽ tự động cập nhật để chỉ hiển thị các sản phẩm phù hợp với tiêu chí đã chọn.
-Mỗi sản phẩm trong danh sách hiển thị cần có thông tin cơ bản như tên sản phẩm, giá, hình ảnh, và đánh giá.
1.5 Đặc điểm kĩ thuật thử nghiệm
1.5.1 Mục đích
Mục đích của việc kiểm thử:
Đảm bảo rằng tất cả các chức năng của website Automation Test Store hoạt động đúng như mong đợi.
Xác định và khắc phục các lỗi (bug) và sự cố (issues) trước khi phát hành chính thức.
Đánh giá hiệu suất và khả năng sử dụng của trang web.
Cung cấp trải nghiệm người dùng (UX) tốt nhất có thể.
1.5.2 Phạm vi
Phạm vi kiểm thử:
Kiểm thử các chức năng chính của trang web bao gồm: đăng ký, đăng nhập, đăng xuất, quên mật khẩu, tài khoản người dùng, giỏ hàng & thanh toán, và tìm kiếm, lọc, đổi tiền tệ…
Kiểm thử giao diện người dùng (UI) để đảm bảo rằng tất cả các thành phần hiển thị đúng trên các thiết bị và trình duyệt khác nhau.
Kiểm thử hiệu suất để đảm bảo trang web hoạt động ổn định dưới các tải trọng khác nhau.
Kiểm thử bảo mật để đảm bảo thông tin người dùng được bảo vệ an toàn.
1.5.3 Môi trường kiểm thử
Môi trường kiểm thử bao gồm:
Hệ điều hành: Windows 11, macOS.
Trình duyệt: Chrome, Firefox, Edge,…
Công cụ kiểm thử:
Visual Studio Code (VS Code)
Robot Framework
Selenium WebDriver
Các thư viện: SeleniumLibrary, OperatingSystem Library, Collections Library, String Library.
Máy chủ: Máy chủ giả lập hoặc môi trường thử nghiệm được cấu hình tương tự môi trường sản xuất.
1.5.4 Chức năng và phi chức năng kiểm thử
Chức năng kiểm thử:
Kiểm thử các chức năng chính như Đăng nhập, Đăng xuất, Quên mật khẩu, Tài khoản người dùng, Giỏ hàng & Thanh toán, và Tìm kiếm.
Kiểm thử tính chính xác của thông tin người dùng và đơn hàng.
Kiểm thử luồng người dùng từ khi truy cập trang web đến khi hoàn tất mua hàng.
Phi chức năng kiểm thử:
Hiệu suất: Đo lường tốc độ tải trang, khả năng xử lý đồng thời nhiều người dùng.
Khả năng sử dụng: Đánh giá mức độ thân thiện và dễ sử dụng của giao diện người dùng.
Bảo mật: Kiểm thử các lỗ hổng bảo mật, bảo vệ dữ liệu người dùng, ngăn chặn các cuộc tấn công như SQL Injection, Cross-site Scripting (XSS).
1.5.5 Ước lượng nguồn lực và thời gian cần cho việc kiểm thử
Nguồn lực:
Nhân lực: 3 kiểm thử viên chính (Nguyễn Quỳnh Như, Nguyễn Huỳnh Gia Huy, Nguyễn Văn Thịnh)
Phần mềm và công cụ: Máy tính cá nhân với các phần mềm kiểm thử được cài đặt sẵn, kết nối Internet ổn định.
Thời gian:
Thời gian tổng cộng: 17 ngày (1/5/2024 - 17/5/2024)
Phân tích yêu cầu và lập kế hoạch: 2 ngày (1/5 - 2/5)
Thiết kế test case: 3 ngày (3/5 - 5/5)
Thực hiện kiểm thử: 7 ngày (6/5 - 14/5)
Báo cáo kết quả kiểm thử và khắc phục lỗi: 3 ngày (15/5 - 17/5)
1.5.6 Thành lập nhóm
Thành viên nhóm kiểm thử:
1.Nguyễn Quỳnh Như: Trưởng nhóm kiểm thử, chịu trách nhiệm lập kế hoạch, phân công công việc và giám sát tiến độ, kiểm thử viên
2.Nguyễn Huỳnh Gia Huy: Kiểm thử viên
3.Nguyễn Văn Thịnh: Kiểm thử viên
1.5.7 Các milestone
Các mốc quan trọng trong quá trình kiểm thử:
1/5/2024: Bắt đầu dự án, họp khởi động, phân tích yêu cầu.
3/5/2024: Hoàn thành kế hoạch kiểm thử, bắt đầu thiết kế test case.
6/5/2024: Hoàn thành thiết kế test case, bắt đầu thiết lập môi trường kiểm thử.
8/5/2024: Bắt đầu thực hiện kiểm thử.
14/5/2024: Hoàn thành thực hiện kiểm thử, bắt đầu báo cáo kết quả.
17/5/2024: Hoàn thành báo cáo kết quả kiểm thử và khắc phục lỗi.
1.5.8 Rủi ro cần quản lý
Các rủi ro tiềm ẩn và cách quản lý:
Rủi ro về kỹ thuật: Lỗi phần mềm, không tương thích giữa các công cụ kiểm thử. Giải pháp: Sử dụng các phiên bản phần mềm ổn định, kiểm tra tính tương thích trước khi triển khai.
Rủi ro về nhân lực: Nhân sự bị bệnh hoặc không thể tham gia đầy đủ. Giải pháp: Xây dựng kế hoạch dự phòng và phân chia công việc đều đặn.
Rủi ro về thời gian: Trễ tiến độ do phát sinh lỗi ngoài dự kiến. Giải pháp: Dự trù thêm thời gian cho các hoạt động kiểm thử và khắc phục lỗi.
