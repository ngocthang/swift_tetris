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



- ta sẽ tiếp tục xử lý để màu sắc xuất hiện trong game theo ý muốn. Ta sẽ xử lý trong `Block.swift`. Hãy xem đoạn code dưới đây

![image](http://i.gyazo.com/ac3e6e4da22b1856ff37151c7118f2f7.png)

1. đầu tiên ta khai báo class `Block` implement 2 protocol `Hashable` và `Printable`. Trong đó `Block` được lưu trong `Array2D` thông qua `Hashable` 
2. Đoạn `#2`,  ta định nghĩa thuộc tính `color`.
3. Đoạn `#3`, ta định nghĩa các biến `column` và `row` (hàng và cột). Những thuộc tính này để xác định vị trí của Block trên màn hình. `SKSpriteNode` sẽ mô tả các yêu tố liên quan đến hình ảnh của mỗi Block và sẽ được dùng thông qua `GameScene` mỗi khi có bất cứ chuyển động nào của Block.
4. Đoạn `#4` ta khai báo 1 shorstcut name của sprite. Từ giờ ta có thể gọi `block.spriteName` gắn gọn hơn `block.color.spriteName`.
5. Đoạn `#5` ta khai báo 1 implement `hasValue` để thực hiện tính toán các thuộc tính, giá trị trả về là kết quả của phép XOR giữa `row` và `column`, ta nhận đc 1 giá trị integer duy nhất cho mỗi Block
6. Đoạn 6, ta khai báo implement `description`.Mỗi đối tượng của `Printable` có thể nằm trong string và bao quanh bởi `\(` và `)`. Ví dụ 1 block màu xanh ở vị trí hàng số 3, cột số 8 thì `blue:[8, 3]` sẽ biểu diễn block đó.
7. Cuối cùng, đoạn số `#7` ta dùng toán tử `==` để so sánh các block với nhau. Giá trị trả về là `true` nếu và chỉ nếu 2 block cùng vị trí và màu sắc.

##Tạo hình dạng cho Block

![Image](http://i.gyazo.com/699acb013ea3160711bc16229a9d798e.png)

- phần trước ta đã xây dựng và thiết lập các thuộc tính liên quan đến màu sắc cho Block, tiếp theo ta sẽ tạo hình thù cho chúng. Ta sẽ tạo những Block với dạng  [Tetromino](http://en.wikipedia.org/wiki/Tetromino) Tetromino trong class `Shape`. Tạo file Sharp.swift ( giống như đã tạo Block.swift).Mở file `Shape.swift`, trước tiên, xoá hết những đoạn code mà xcode tự generate ra. Như với các file khác, ta cần import thư viện `SpriteKit`
```Swift
import SpriteKit
```
- tiếp theo ta khai báo 1 bộ dữ liệu liệt kê enum để định nghĩa các hướng xoay của khối hình. Mỗi khối hình có thể xoay 4 hướng để rơi xuống, ta sẽ quy định là 4 góc `0`, `90`, `180`, và `270`.Ta có thể tưởng tượng như 4 góc của 1 chiếc đồng hồ như hình dưới đây

![image](http://bloc-books.s3.amazonaws.com/swiftris/07-giving-shape-rotation-degrees.png)

```Swift
enum Orientation: Int, Printable {
case Zero = 0, Ninety, OneEighty, TwoSeventy

var description: String {
switch self {
case .Zero:
return "0"
case .Ninety:
return "90"
case .OneEighty:
return "180"
case .TwoSeventy:
return "270"
}
}
}
```

- Tiếp theo ta khai báo 1 function để tính toán và trả ra gián trị góc của khối hình khi ta điều khiển thay đổi góc của nó.

```Swift
static func rotate(orientation:Orientation, clockwise: Bool) -> Orientation {
var rotated = orientation.rawValue + (clockwise ? 1 : -1)
if rotated > Orientation.TwoSeventy.rawValue {
rotated = Orientation.Zero.rawValue
} else if rotated < 0 {
rotated = Orientation.TwoSeventy.rawValue
}
return Orientation(rawValue:rotated)!
}
```

- tiếp theo ta sẽ khai báo 1 số constant. 

```Swift
// The number of total shape varieties
let NumShapeTypes: UInt32 = 7

// Shape indexes
let FirstBlockIdx: Int = 0
let SecondBlockIdx: Int = 1
let ThirdBlockIdx: Int = 2
let FourthBlockIdx: Int = 3
```

- định nghĩa class `Shape` cùng các thuộc tính như màu sắc, vị trí(hàng cột), orientation và mảng những block

```Swift
class Shape: Hashable, Printable {
// The color of the shape
let color:BlockColor

// The blocks comprising the shape
var blocks = Array<Block>()
// The current orientation of the shape
var orientation: Orientation
// The column and row representing the shape's anchor point
var column, row:Int
}
```
- Bước kế tiếp, ta định nghĩa 2 thuộc tính tính toán và chúng trả ra kết quả rỗng, 2 thuộc tính này đc override bởi các class hình dạng của block sẽ đc thêm vào dưới đây.

```Swift
// Subclasses must override this property
var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
return [:]
}
// Subclasses must override this property
var bottomBlocksForOrientations: [Orientation: Array<Block>] {
return [:]
}
```
- `blockRowColumnPositions` định nghĩa 1 `Dictionary`. `dictionary` trong swift được khai báo bằng ngoặc vuông với các bộ key:value, mỗi bộ được phân tách nhau bằng dấu hai chấm. Việc truy xuất phần tử trong Dictionary cũng giống như truy xuất mảng và chúng ta sẽ dùng `key` để truy xuất. Trong trường hợp này, key của `blockRowColumnPositions` sẽ là những đối tượng `Orientation` và value của nó là 1 mảng `Array<(columnDiff: Int, rowDiff: Int)>`. 
- Trong swift thì mảng là 1 `tuple`(1 bộ dữ liệu). Thông thường thì ta hay sử dụng 1 `tuple` để truyền hoặc trả về nhiều giá trị 1 lúc.Mỗi tuple thì chúng ta có thể truyền ko giới hạn phần tử. Trường hợp của chúng ta đã khai báo thì tuple có 2 phần tử `columnDiff` và `rowDiff` đều có kiểu `Int`. Dưới đây là ví dụ việc truy xuất phần tử của 1 dictionary

```Swift
let arrayOfDiffs = blockRowColumnPositions[Orientation.0]!
let columnDifference = arrayOfDiffs[0].columnDiff
```
- Vì các phần tử trong dictionary có giá trị mặc định là optional do đó ta phải thêm `!` vào cuối câu lệnh truy xuất để có thể access được dictionary. Để truy xuất giá trị `columnDiff` của phần tử đầu tiên , ta đánh index phần tử đầu tiên của mảng từ 0 và dùng dấu chấm `.` để lấy được giá trị mong muốn.
- Tiếp theo ta khai báo 1 thuộc tính tính toán để trả ra vị trí đáy của block với hướng hiện tại của nó. 

```Swift
var bottomBlocks:Array<Block> {
if let bottomBlocks = bottomBlocksForOrientations[orientation]
{
return bottomBlocks
}
return []
}

```

- tiếp dến ta sử dụng 1 dạng đặc biệt của initializer đó là `convenience` initializer. Mục đích của nó là làm rút gọn việc khởi tạo `users` cho class `Shape`. Nó gán các giá trị hàng và cột trong khi lấy ngẫu nhiên các giá trị màu sắc và hướng.

```Swift
convenience init(column:Int, row:Int) {
self.init(column:column, row:row, color:BlockColor.random(), orientation:Orientation.random())
}
```

- Ta cần khai báo thêm 1 `final` function và các class con không thể override phương thức này. Trong function ta thực hiện kiểm tra điều kiện, ta gán `blockRowColumnTranslations` vào mảng từ kết quả trả ra của bộ thuộc tính tính toán (`dictionary property`). Nếu `blockRowColumnTranslations` not found thì các câu lệnh bên trong `if` sẽ không được thực thi.

```Swift
final func initializeBlocks() {
if let blockRowColumnTranslations = blockRowColumnPositions[orientation] {
for i in 0..<blockRowColumnTranslations.count {
let blockRow = row + blockRowColumnTranslations[i].rowDiff
let blockColumn = column + blockRowColumnTranslations[i].columnDiff
let newBlock = Block(column: blockColumn, row: blockRow, color: color)
blocks.append(newBlock)
}
}
}
```

Cách viết tường minh hơn:

```Swift
let blockRowColumnTranslations = blockRowColumnPositions[orientation]
if blockRowColumnTranslations != nil {
// Code…
}
```

###Các class con
Trên đây ta đã tạo 1 base class, có thể coi nó như 1 công cụ để gọi và xử lý các khôi hình, và với mỗi dạng khối hình ta cần khai báo 1 class cho nó. Có tổng cộng 7 class con như vậy và ta phải tạo 7 file. 

- Đầu tiên là khối hình vuông, ta tạo file `SquareShape.swift` và khai báo class `SquareShape`. Bên trong class, ta khai báo khoảng cách giữa các cạnh ( thông qua 2 chỉ số row và column) và hướng quay của khối hình (`orientation`). Có thể thấy, hình vuông là đơn giản nhất, ta coi như giá trị orientation không đổi khi nó quay theo mọi hướng. Ta quy định hình dạng của khôi hình vuông ứng với vị trí như sau

```
| 0•| 1 |
| 2 | 3 |
```

do đó, đáy của hình vuống luôn là vị trí thứ 3 và 4 trong block.

![Image](http://i.gyazo.com/7faf1166d16e7468b1a10912fb70633e.png)

- ta thực hiện override bộ thuộc tính tính toán `blockRowColumnPositions` để đưa ra bộ dữ liệu hoàn chỉnh cho hình dạng khối hình vuông. Mỗi chỉ số của mảng tương ứng với góc của khối. ví dụ, góc trên bên trái ứng với giá trị 0 trong block ta quy định bên trên, bộ giá trị của nó sẽ là (0,0) ứng với (column, row). Tương tự, góc trên bên phải sẽ là (1, 0).
- cuối cùng, ta cũng thực hiện override tương tự để đưa ra bộ dữ liệu cho đáy hình vuông, cũng là để xác định hướng xoay của khối hình. Và với hình vuông thì vị trí đáy luôn cố định là block số 3 và 4 trong khối hình quy dịnh bên trên. 
```Swift
class SquareShape:Shape {
override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
return [
Orientation.Zero: [(0, 0), (1, 0), (0, 1), (1, 1)],
Orientation.OneEighty: [(0, 0), (1, 0), (0, 1), (1, 1)],
Orientation.Ninety: [(0, 0), (1, 0), (0, 1), (1, 1)],
Orientation.TwoSeventy: [(0, 0), (1, 0), (0, 1), (1, 1)]
]
}

override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
return [
Orientation.Zero:       [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
Orientation.OneEighty:  [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
Orientation.Ninety:     [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
Orientation.TwoSeventy: [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]]
]
}
}
```


