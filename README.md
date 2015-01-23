Swift_Tetris
================

## Giới thiêu:
Chắc hẳn tự viết ra 1 game là ước muốn của mọi lập trình viên từ khi mới biết đến lập trình.Trong bài giưới thiệu này, chúng ta sẽ cùng nhau thử viết 1 game nhỏ và làm quen với 1 ngôn ngữ lập trình mới của Apple - Swift. Trong tương lai, apple dự định sẽ dùng swift để thay thế Obj-C, vậy tốt nhất ta hãy thử học Swift ngay từ bây giờ. Trong tutorial này, bạn sẽ được sử dụng Xcode, Sprite Kit (bộ API được cung cấp bởi iOS SDK cho phép lập trinh viên phát triển game native 2D trên Xcode). Và...bạn đã từng chơi trò chơi Tetris nổi tiếng ? Mình đoán chắc là đa số chúng ta đều đã từng ít nhất là chơi 1 lần game này. Vậy, còn gì thú vị hơn khi tự tay chúng ta viết và tận hưởng nó :)

## Tạo project:
- Mở Xcode, click `Create a new Xcode project` <br />
- Màn hình khởi tạo project hiện ra, chọn `iOS > Application > Game` và nhấp `Next`<br />
![Image]
(https://uphinhnhanh.com/images/-625656446_Screen_Shot_2015_01_23.png)

- Màn hình kế tiếp hiện ra cho phép bạn tuỳ chọn cho project , điền đầy đủ các thông tin như sau (chú ý phần Game Technology thì chọn `SpriteKit`):<br />

![Image]
(https://uphinhnhanh.com/images/-647268428_Screen_Shot_2015_01_23.png)
- Click `Next` và Xcode sẽ hỏi bạn muốn lưu thư mục project ở đâu. Lựa chọn nơi lưu project và click `Create` <br />
- Sau khi tạo mới prject, Xcode sẽ hiển thị project của bạn với các cửa sổ chứa cây thư mục, property. Tại màn hình này, tích chọn `Portrait` trong mục <b>Device Orientation:</b> . Bạn chỉ phải thực hiệ thao tác này 1 lần duy nhất khi tạo project.<br />
![Image]
(https://uphinhnhanh.com/images/-581523937_Screen_Shot_2015_01_23.png)

- Chạy thử project `⌘ + R` xem sao, có vẻ bạn đã tạo project thành công rồi đấy :) <br />

![Image]
(https://uphinhnhanh.com/images/-705399618_Screen_Shot_2015_01_23.png)


## Chèn ảnh, âm thanh:
- <b>Spin-The-Bottle: Space Edition </b> là giao diện game mặc định mà `Sprite Kit` tích hợp sẵn.Nhìn rất hấp dẫn phải không nào, nhưng thật đáng tiếc ta phải xoá nó đi và chuẩn bị thay thế nó bằng game Tetris của chúng ta :).<br />
- Mở <b> Project Navigator </b> (⌘ + 1):

![Image]
(https://uphinhnhanh.com/images/-627347954_Screen_Shot_2015_01_23.png)

- Click chuột phải vào <b>GameScene.sks</b> và chọn <b>Delete</b>, màn hình confirm hiện lên, bạn chọn <b>Move to Trash </b><br />
- Để xoá các icon và sprite của game mặc định, click chọn thư mục <b>Images.xcassets</b> và click tiếp <b>Spaceship</b>, ấn phím Delete để xoá nó đi.<br />

![Image]
(https://uphinhnhanh.com/images/-661771893_Screen_Shot_2015_01_23.png)

<h5> Dọn dẹp code thừa </h5>
Nghe có vẻ nản, nhưng bạn phải làm sạch project để bắt đầu phát triển Tetris của bạn :)

- Mở file `GameScene.swift`, hãy làm sạch nó như thế này nhé:<br />

![Image]
(https://uphinhnhanh.com/images/-625389896_Screen_Shot_2015_01_23.png)

- Tương tự với `GameViewController.swift` <br />

![Image]
 (https://uphinhnhanh.com/images/-617224747_Screen_Shot_2015_01_23.png)

<h5>Thêm icon và âm thanh cho game </h5>
- Icon, sprite và âm thanh là không thể thiếu trong bất cứ 1 game nào. Chúng ta sẽ thêm vào ngay sau đây. <a href="http://bloc-books.s3.amazonaws.com/swiftris/swiftris-assets.zip">Click vào đây</a> để download những thư viện cần thiết cho game.Giải nén file down về , kéo thả thư mục <b>Sound</b> vào thanh Project Navigator , để thư mục này ngay trên thư mục <b>Supporting Files</b>. Chú ý là check vào <b>Copy items if necessary</b> để copy toàn bộ thư mục và các file âm thanh bên trong vào project.Click <b>Finish</b>. Làm tương tự với thư mục <b>Sprites.atlas</b><br />

![Image]
(http://i.gyazo.com/a7b1d677ef4884381d7416238ab12a13.png)

- Kế tiếp, kéo thả toàn bộ ảnh trong thư mục <b>Images</b> vào thư mục <b>Supporting Files</b> trong project (chú ý chọn `Copy items if needed`). Cuối cùng, click <b>Images.xcassets</b> , chọn <b>AppIcon</b>, kéo thả những file icon trong thư mục <b>Blocs</b> mà bạn vừa download về vào những ô có ghi kích thước tương ứng : 29pt, 40pt, 60pt. <br />

Xong phần râu ria, nãy giờ chỉ có kéo chuottj và click, đến lúc thêm tí code rồi :). <br />

<h5>Thêm hình nền cho game</h5>
- Chúng ta sẽ thiết lập <b>GameScene</b> bên trong <b>GameViewController</b>. <b>GameScene</b> sẽ chịu trách nhiệm hiển thị tất cả mọi thứ của game như hình nền, các cảnh game, đối tượng game, ngoài ra nó còn chịu trách nhiệm phát âm thanh của game. <b>GameViewController</b> sẽ như cầu nối giữa những thao tác của người chơi và <b>GameScene</b>.<br />. Dưới đây là một số logic bạn cần thêm vào <b>GameScene</b> ( cố gắng tự tay code rồi đọc giải thích bên dưới cho quen nhé, đừng copy :P) <br />

![Image]
(http://i.gyazo.com/44e9184b203fb1bcf9112a55cbe56185.png)

- SpriteKit dựa trên nền OpenGL nên ta xét toạ độ là <b>0, 0</b> là góc dưới bên trái. Các thanh xếp hình sẽ rơi từ trên xuống vì thế ta sẽ lấy mốc trên cùng bên trái là toạ độ <b>0, 1.0</b>. Sau đó ta sẽ tạo <b>SKSpriteNode</b> để hiển thị ảnh nền cho game. Ở đây, `background` là tên biến, là 1 kiểu của đối tượng<b>SKSpriteNode</b>, và `let` chỉ ra rằng nó là 1 hằng số. <br />

Tiếp theo ta sẽ khai báo 1 số logic cho <b>GameViewController.swift<b/><br />

![Image]
(http://i.gyazo.com/e8e6c99b576cb4db04536b13e634871c.png)














