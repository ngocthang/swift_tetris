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

- Chúng ta khai báo biến `scene`: <b>var scene: GameScene!</b>. `var` dùng để khai báo biến, `GameScene` là kiểu hữ liệu, dấu `!` cho chúng ta biết biến này ko phải là giá trị optional mà nó sẽ đươcn khởi tạo sau đó.<br />
- Trong <b>viewDidLoad()</b> chúng ta gán giá trị cho <b>scene</b> với initializer chúng ta đã khai báo trong <b>GameScene.swift</b>.<br />
- CHúng ta thử chạy lại ứng dụng để xem background xuất hiện:<br />

![Image]
(http://i.gyazo.com/a3c318996ecf759c702f23796d5375eb.png)

## Set vị trí cho đối tượng bằng array

- Giống như các ngôn ngữ lập trình khác, array được sử dụng dụng trong hầu như mọi project. Trong game Tetris này, chúng ta sẽ sử dụng array để xác định các vị trí của các đối tượng, cụ thể là bằng các hàng và cột.<br />

![Image]
(http://i.gyazo.com/787c6eccb8df46d0e32051d81ba8660b.png)

- 20 hàng và 10 cột sẽ tạo ra 200 vị trí để các thanh xếp hình xuất hiện.Chúng ta khai báo mảng 2 chiều <b>array[column, row]</b>.<br />
- Chúng ta sẽ tạo 1 file mới (nhấn <b> ⌘ + N) </b>, chọn Swift file , <b>next</b> và đặt tên file là Array2D rồi <b>Create</b>( chú ý nhớ đánh dấu vào thư mục `first_game`)<br />

![Image]
(http://i.gyazo.com/9eeb33d10a4599fb399243fa448e2753.png)

- Tiếp tục viết code cho array2D và cùng tìm hiểu ý nghĩa của những đoạn code dưới đây<br />

![Image]
(http://i.gyazo.com/937acdaac55fbfe4ac4eccd998ca7c01.png)

- Trong đoạn code đầu tiên `#1` , ta khai báo class <b>Array2D</b>. Thông thường thì không cần khai báo class vì trong Swift, array là 1 kiểu <b>struct</b>, tuy nhiên trong trường hợp này ta khai bao class vì các đối tượng class được truyền thông qua các <b>reference</b> trong khi structure được truyền theo các giá trị.Game của chúng ta sẽ yêu cầu 1 cấu trúc dữ liệu như vậy để sử dụng trong toàn bộ game. Chú yas rằng ở đây khi khai báo class, chúng ta có thêm 1 param `<T>`. Nó cho phép chúng ta khai báo 1 mảng có thể chứa bất kỳ loại dữ liệu nào nên có thể sử dụng ở nhiều chỗ khác nữa.<br />

- Trong đoạn code thứ 2 `#2`, ta khai báo 1 array, nó sẽ là 1 cấu trúc dữ liệu được dùng nhiều chỗ trong poẹct này. Để ý thấy `<T?>` khi khai báo array, dấu <b>?</b> đánh dấu 1 giá trị tuỳ chọn. 1 Giá trih tuỳ chọn có thể có hoặc ko có dữ liệu, ó thể nil, empty. Cụ thể trong project này, 1 array nil có nghĩa là ko có 1 khối xếp hình nào xuất hiện trên màn hình.<br />

- Trong đoạn code thứ 3 `#3`, ta set cấu trúc cho mảng với size là hàng * cột,đảm bảo rằng <b>array2D</b> có thể chứa đc 200 object (10*20).<br />

- Đoạn code cuối cùng `#4`, ta tạo custom subscript cho <b>Array2D</b>, cụ thể là 1 subscript cho array[column, row].  

##Tạo chuyển động cho đối tượng
- Như những version game tetris bạn đã từng chơi trước đây, bạn sẽ chờ đợi từng khối rơi xuống theo mỗi khoảng thời gian nhất định và sẽ rơi với tốc độ từ chậm đến nhanh dần tuỳ theo từng level, tất nhiên khi chúng rơi, bạn không thể dừng chúng lại được. Và game Tetris cũng sẽ tạo chuyển động giống như vậy.

- Chúng ta sẽ cần 1 class mở rộng của lớp `SKScene` kế thừa function `update(currentTime:CFTimeInterbval)`. Function `update` được các frame gọi liên tục. Mỗi frame có thể hiểu như 1 khối hình xuất hiện trên màn hình. Để game có chuyển động trơn tru thì ta cần thiết lập giá trị frame rate càng cao càng tốt, cỡ khoảng 60 hình trên giây hoặc cao hơn. 

- Khi mắt chúng ta cảm nhận được từng frame đang chuyển động thì ta sẽ thấy game chuyển động một cách chậm chạp. Đây gọi là khái niệm chuyển động gián đoạn. Dưới đây là ví dụ về chuyển động của game theo các giá trị frame rate khác nhau

![Image](http://bloc-books.s3.amazonaws.com/swiftris/05-a-ticking-clock-frame-rate-comparison.gif)

- Bây giờ chúng ta cùng viết tiếp code cho `GameScene.swift`:

![Image](http://i.gyazo.com/bcb4089445fd39af4c0306b1d1e5aa8c.png)

1. Trước tiên trong `#1` chúng ta định nghĩa 1 constant `TickLengthLevelOne`. Constant này sẽ biểu thị tốc độ chậm nhất mà các khối hình rơi xuống. Như trong code, ta đã set cho nó giá trị là `600` mili giây - nghĩa là cứ 0.6 giây thì khối hình sẽ rơi xuống 1 hàng.

2. Ở `#2` chúng ta khai báo biến. `tickLengthMillis` và `lastTick` được khai báo giống như chúng ta đã khai báo biến trong bài trước. `tickLengthMillis` biểu thị tốc độ rơi hiện tại của `GameScene` được gán bằng giá trị mặc định là constant `TickLengthLevelOne` chúng ta khai báo ở trên còn biến `lastTick` sẽ là tốc độ rơi nhanh nhất của khối hình, được gán bằng 1 đối tượng `NSDate`.

Tuy nhiên, dòng khai báo `var tick:(() -> ())?` nhìn có vẻ khá phức tạp. Ở đây `tick` được coi như `closure` trong swift, kiểu của nó là `(() -> ())?` , điều đó có nghĩa là nó là closure và không cần truyền parameter và cũng không cần trả ra dữ liệu. Dấu `?` có nghĩa là nó có giá trị optional và có thể `nil`.

3. Trong `#3` , ta thêm một số logic cho những biến đã khai báo ở trên. Nếu `lastTick` bị missing thì game ở trạng thái pause, không có bất cứ chuyển động nào của khối hình vì vậy đơn giản chỉ cần return ở đây. Tuy nhiên nếu `lastTick` có giá trị, chúng ta thiết lập giá trị thời gian được thực thi của hàm `update` bằng cách gọi function `timeIntervalSinceNow` trong đối tượng `lastTick`. Trong Swift, để gọi hàm trong đối tượng thì ta dùng dấu chấm `.`

Ở đây, khi gọi function ta thấy có xuất hiện dấu chấm than `!`. Ký hiệu này được dùng khi đối tượng gọi hàm là có kiểu `optional`. Sau khi gọi function `timeIntervalSinceNow`, ta nhân kết quả với `-1000` để nhận giá trị dương tính theo mili giây.

Tiếp theo, ta kiểm tra nếu time được truyền mà vượt quá giá trị của `tickLengthMillis`, cứ mỗi khoảng thời gian trôi qua bằng giá trị của `timePassed` thì ta phải cập nhật lại vị trí của khối hình. Để làm được điều này, trước tiên ta cập nhật giá trị `lastTick` bằng thời gian hiện tại, sau đó ta gọi đến closure `tick?()`. Ở đây ta dùng dấu `?` sau tên biến để check xem nó có giá trị hay không trước tiên, nếu có thì mới gọi nó và không có parameter. Thực ra đây chỉ là cách viết tắt, nếu viết tường minh ra thì nó sẽ tương dương với đoạn code:
```
if tick != nil {
tick!()
}

```

4. Đoạn `#4`, ta khai báo các phương thức để cho phép các class bên ngoài có thể stop và start chuyển động của khối hình. 

##Block party
- Trong lập trình nói chung, chúng ta sử dụng class để mô tả các đối tượng. Trong game của chúng ta, những đối tượng chính là những khối hình và mỗi khối hình bao gồm 4 phần độc lập nhau và hãy mô tả chúng như những đối tượng. Ta sẽ thực hiện bằng cách tạo một class mới `Block`. Tạo file `Block.swift` như ta đã làm với `Array2D.swift`. Bây giờ ta khai báo class và thêm một số đoạn mã cho `Block.swift`

![Image](http://i.gyazo.com/11adca755286b15d0dcca285a3dad413.png)

- Nhìn đoạn code trên ta có thể dễ dàng nhận thấy đó không phải tất cả những gì cần khai báo để mô tả khối hình. Trong phần đầu tiên, ta định nghĩa 1 `enumeration` là `BlockColor` và game của chúng ta sẽ hộ trợ tổng cộng 6 màu.

1. Trong đoạn code đầu tiên `#1`, ta khai báo rằng game của chúng ta sẽ có tổng cộng 6 màu.

2. Trong đoạn `#2`, ta khai báo `enumeration` với kiểu `Int` nó implement protocol `Printable` 

Class, Struc và enum implement `Printable` có khả năng tạo ra 1 chuỗi mà ta có thể đọc được trong quá trình debug hoặc in giá trị lên màn hình console.

3. Đoạn `#3` ta khai báo đầy đủ danh sách những option của enumerable, biểu thị cho các màu ứng với giá trị 0 cho màu xanh biển cho đến giá trị 5 cho màu vàng.

4. Đoạn `#4` ta định nghĩa 1 bộ các thuộc tính `spriteName` gọi là `computed property`. 1 `computed property` hoạt động giống như 1 biến thông thường nhưng khi truy cập nó, cả 1 block code được gọi để đưa ra kết quả của nó.

`spriteName` sẽ trả về đúng tên file ứng với màu sắc, ở đây ta dùng `switch...case` để thực hiện.

5. Đoạn `#5` , ta định nghĩa 1 `computer property` khác : `description`. Thuộc tính này là bắt buộc nếu như ta tuân theo giao thức `Printable`.

Không có thuộc tính này thì code của chúng ta sẽ bị fail. Ở đây nó đơn giản chỉ trả về `spriteName` của màu sắc và như vậy là đủ để mô tả đối tượng.

6. Cuối cùng, đoạn số 6, ta định nghĩa 1 static function có tên là `random()`. Function naỳ sẽ trả về 1 giá trị ngẫu nhiên được tìm thấy trong `BlockColor`. Ta tạo 1 `BlockColor` sử dụng  khởi tạo : `răValue:Int` để thiết lập 1 enumeration được gán các giá trị số. Ở đây các giá trị đó là từ 0 -> 5.

