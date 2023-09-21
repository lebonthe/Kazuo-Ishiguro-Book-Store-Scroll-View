//
//  ViewController.swift
//  Kazuo Ishiguro Book Store
//
//  Created by Min Hu on 2023/9/11.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer?
   
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var imageView: UIImageView!
    let images = ["艾苦","被埋葬的記憶試讀","石黑一雄套書"]
    var index = 0
    
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var view2: UIView!
    

    /* View1 的內容 */
    // 定價
    @IBOutlet weak var view1Price01: UILabel!
    
    @IBOutlet weak var view1Price03: UILabel!
    
    @IBOutlet weak var view1Price05: UILabel!
    
    @IBOutlet weak var view1Price07: UILabel!
    
    @IBOutlet weak var view1Price09: UILabel!
    
    @IBOutlet weak var view1Price11: UILabel!
    
    @IBOutlet weak var view1Price13: UILabel!
    
    @IBOutlet weak var view1Price15: UILabel!
    
    @IBOutlet weak var view1Price17: UILabel!
    
    // 數量
    
    @IBOutlet weak var view1Quantity01: UILabel!
    
    @IBOutlet weak var view1Quantity03: UILabel!
    
    @IBOutlet weak var view1Quantity05: UILabel!
    
    @IBOutlet weak var view1Quantity07: UILabel!
    
    @IBOutlet weak var view1Quantity09: UILabel!
    
    @IBOutlet weak var view1Quantity11: UILabel!
    
    @IBOutlet weak var view1Quantity13: UILabel!
    
    @IBOutlet weak var view1Quantity15: UILabel!
    
    @IBOutlet weak var view1Quantity17: UILabel!
    
    // Stepper
    
    @IBOutlet weak var view1Stepper01: UIStepper!
    
    @IBOutlet weak var view1Stepper03: UIStepper!
    
    @IBOutlet weak var view1Stepper05: UIStepper!
    
    @IBOutlet weak var view1Stepper07: UIStepper!
    
    @IBOutlet weak var view1Stepper09: UIStepper!
    
    @IBOutlet weak var view1Stepper11: UIStepper!
    
    @IBOutlet weak var view1Stepper13: UIStepper!
    
    @IBOutlet weak var view1Stepper15: UIStepper!
    
    @IBOutlet weak var view1Stepper17: UIStepper!
    
    
    /* View2 的內容 */
    // 定價
    
    @IBOutlet weak var view2Price02: UILabel!
    
    @IBOutlet weak var view2Price04: UILabel!
    
    @IBOutlet weak var view2Price06: UILabel!
    
    @IBOutlet weak var view2Price08: UILabel!
    
    @IBOutlet weak var view2Price10: UILabel!
    
    @IBOutlet weak var view2Price12: UILabel!
    
    @IBOutlet weak var view2Price14: UILabel!
    
    @IBOutlet weak var view2Price16: UILabel!
    
    @IBOutlet weak var view2Price18: UILabel!
    
    // 數量
    
    @IBOutlet weak var view2Quantity02: UILabel!
    
    @IBOutlet weak var view2Quantity04: UILabel!
    
    @IBOutlet weak var view2Quantity06: UILabel!
    
    @IBOutlet weak var view2Quantity08: UILabel!
    
    @IBOutlet weak var view2Quantity10: UILabel!
    
    @IBOutlet weak var view2Quantity12: UILabel!
    
    @IBOutlet weak var view2Quantity14: UILabel!
    
    @IBOutlet weak var view2Quantity16: UILabel!
    
    @IBOutlet weak var view2Quantity18: UILabel!
    
    // Stepper
    @IBOutlet weak var view2Stepper02: UIStepper!
    
    @IBOutlet weak var view2Stepper04: UIStepper!
    
    @IBOutlet weak var view2Stepper06: UIStepper!
    
    @IBOutlet weak var view2Stepper08: UIStepper!
    
    @IBOutlet weak var view2Stepper10: UIStepper!
    
    @IBOutlet weak var view2Stepper12: UIStepper!
    
    @IBOutlet weak var view2Stepper14: UIStepper!
    
    @IBOutlet weak var view2Stepper16: UIStepper!
    
    @IBOutlet weak var view2Stepper18: UIStepper!
    
    // 數量
    var view1amount01:Int = 0
    var view1amount03:Int = 0
    var view1amount05:Int = 0
    var view1amount07:Int = 0
    var view1amount09:Int = 0
    var view1amount11:Int = 0
    var view1amount13:Int = 0
    var view1amount15:Int = 0
    var view1amount17:Int = 0
    var view2amount02:Int = 0
    var view2amount04:Int = 0
    var view2amount06:Int = 0
    var view2amount08:Int = 0
    var view2amount10:Int = 0
    var view2amount12:Int = 0
    var view2amount14:Int = 0
    var view2amount16:Int = 0
    var view2amount18:Int = 0
    
    
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    
    //定義各品項總金額
    var allBooksSum:Int = 0
    // 設定兩個 view 的金額加總為 0
    var view1Sum: Int = 0
    var view2Sum: Int = 0
    // 設定最後金額能調整數字格式
    var formatter = NumberFormatter()
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 創建一個 Timer 實例，設定定時器的屬性
        self.timer = Timer.scheduledTimer(
            // 設定定時器的時間間隔（以秒為單位），這裡設定為 5 秒
            timeInterval: 5,
            // 設定定時器的目標對象，也就是要調用指定函數的對象，在這裡是 self，表示當前的 ViewController
            target: self,
            // 設定要調用的函數，使用 #selector 語法來指定要調用的函數，這裡指定的是 playingAdvertise 函數
            selector: #selector(playingAdvertise),
            // 用戶資訊，通常設為 nil（在這裡沒有用到）
            userInfo: nil,
            // 設定是否重複執行，這裡設定為 true，表示每隔 5 秒就重複執行一次 playingAdvertise 函數
            repeats: true
        )

        
        // 設定畫面一開始顯示第一張與第一個 Page Control
        imageView.image = UIImage(named: "艾苦")
        pageControl.currentPage = 0
        
        // 創建一個數值格式化器，設定其數值風格為貨幣格式
        formatter.numberStyle = .currency

        // 設定貨幣格式的小數點位數為0，即不顯示小數點
            formatter.maximumFractionDigits = 0

        // 使用格式化器將所有書籍的總金額轉換為貨幣格式的字符串
        let totalMoney = formatter.string(from: NSNumber(value: allBooksSum))

        // 將格式化後的總金額字符串設定為顯示在 totalPriceLabel 也就是購物車總金額上的文本
        totalPriceLabel.text = totalMoney
        
        view1.isHidden = false  // 顯示view1
        view2.isHidden = true  // 隱藏view2

        // 創建一個UIButton，設定其類型為.system
        let button = UIButton(type: .system)
        
        
        // 設定按鈕的位置和大小
        button.frame = CGRect(x: 137.5, y: 217, width: 100, height: 40)
        
        // 設定按鈕的文字內容為"按鈕標題"，並指定文字在正常狀態下顯示
        button.setTitle("按鈕標題", for: .normal)

        // 設定按鈕文字的字體大小為24點
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)

        // 設定按鈕文字在正常狀態下的顏色為黑色
        button.setTitleColor(UIColor.black, for: .normal)

        
        // 設定按鈕內容的水平對齊方式為居中對齊
        button.contentHorizontalAlignment = .center

        
        // 將按鈕添加到視圖中
        view.addSubview(button)

        // 設定按鈕在點擊時顯示菜單（類似右鍵選單）
        button.showsMenuAsPrimaryAction = true

        // 設定按鈕在點擊時改變選擇狀態（類似勾選）
        button.changesSelectionAsPrimaryAction = true

        // 設定按鈕的菜單，包含兩個選項，每個選項有不同的標題和處理函數
        button.menu = UIMenu(children: [
            UIAction(title: "中文出版", state: .on, handler: { action in
                // 當選擇"中文出版"時執行的處理函數，印出文字
                print("中文出版")
                self.view1.isHidden = false
                self.view2.isHidden = true
            }),
            UIAction(title: "外文出版", state: .on, handler: { action in
                // 當選擇"外文出版"時執行的處理函數，印出文字
                print("外文出版")
                self.view1.isHidden = true
                self.view2.isHidden = false
            }),
        ])
        
        
    }
    
    
    
    @IBAction func changeview1Quantity(_ sender: UIStepper) {
        // 傳入 stepper 的值
        view1amount01 = Int(view1Stepper01.value)
        view1amount03 = Int(view1Stepper03.value)
        view1amount05 = Int(view1Stepper05.value)
        view1amount07 = Int(view1Stepper07.value)
        view1amount09 = Int(view1Stepper09.value)
        view1amount11 = Int(view1Stepper11.value)
        view1amount13 = Int(view1Stepper13.value)
        view1amount15 = Int(view1Stepper15.value)
        view1amount17 = Int(view1Stepper17.value)

        //傳到 quantityLabel 中
        view1Quantity01.text = String(view1amount01)
        view1Quantity03.text = String(view1amount03)
        view1Quantity05.text = String(view1amount05)
        view1Quantity07.text = String(view1amount07)
        view1Quantity09.text = String(view1amount09)
        view1Quantity11.text = String(view1amount11)
        view1Quantity13.text = String(view1amount13)
        view1Quantity15.text = String(view1amount15)
        view1Quantity17.text = String(view1amount17)
        
        calculate1()
    }
   
    @IBAction func changeview2Quantity(_ sender: UIStepper) {
        // 傳入 stepper 的值
        view2amount02 = Int(view2Stepper02.value)
        view2amount04 = Int(view2Stepper04.value)
        view2amount06 = Int(view2Stepper06.value)
        view2amount08 = Int(view2Stepper08.value)
        view2amount10 = Int(view2Stepper10.value)
        view2amount12 = Int(view2Stepper12.value)
        view2amount14 = Int(view2Stepper14.value)
        view2amount16 = Int(view2Stepper16.value)
        view2amount18 = Int(view2Stepper18.value)
        //傳到 quantityLabel 中
        view2Quantity02.text = String(view2amount02)
        view2Quantity04.text = String(view2amount04)
        view2Quantity06.text = String(view2amount06)
        view2Quantity08.text = String(view2amount08)
        view2Quantity10.text = String(view2amount10)
        view2Quantity12.text = String(view2amount12)
        view2Quantity14.text = String(view2amount14)
        view2Quantity16.text = String(view2amount16)
        view2Quantity18.text = String(view2amount18)
        calculate2()
    }
   
    
    func calculate1(){
        // 字串轉數字
        let view1PriceN01 = Int(view1Price01.text!)!
        let view1PriceN03 = Int(view1Price03.text!)!
        let view1PriceN05 = Int(view1Price05.text!)!
        let view1PriceN07 = Int(view1Price07.text!)!
        let view1PriceN09 = Int(view1Price09.text!)!
        let view1PriceN11 = Int(view1Price11.text!)!
        let view1PriceN13 = Int(view1Price13.text!)!
        let view1PriceN15 = Int(view1Price15.text!)!
        let view1PriceN17 = Int(view1Price17.text!)!
        // 計算 view1 總金額
        let sum = view1PriceN01 * view1amount01 + view1PriceN03 * view1amount03 + view1PriceN05 * view1amount05 + view1PriceN07 * view1amount07 + view1PriceN09 * view1amount09 + view1PriceN11 * view1amount11 + view1PriceN13 * view1amount13 + view1PriceN15 * view1amount15 + view1PriceN17 * view1amount17
        // 將 view1 總金額放入 view1Sum
        view1Sum = sum
        // 計算購物車總金額
        calculateTotal()
       
    }
    func calculate2(){
        // 字串轉數字
        let view2PriceN02 = Int(view2Price02.text!)!
        let view2PriceN04 = Int(view2Price04.text!)!
        let view2PriceN06 = Int(view2Price06.text!)!
        let view2PriceN08 = Int(view2Price08.text!)!
        let view2PriceN10 = Int(view2Price10.text!)!
        let view2PriceN12 = Int(view2Price12.text!)!
        let view2PriceN14 = Int(view2Price14.text!)!
        let view2PriceN16 = Int(view2Price16.text!)!
        let view2PriceN18 = Int(view2Price18.text!)!
        // 計算 view2 總金額
        let sum = view2PriceN02 * view2amount02 + view2PriceN04 * view2amount04 + view2PriceN06 * view2amount06 + view2PriceN08 * view2amount08 + view2PriceN10 * view2amount10 + view2PriceN12 * view2amount12 + view2PriceN14 * view2amount14 + view2PriceN16 * view2amount16 + view2PriceN18 * view2amount18
        // 將 view2 總金額放入 view2Sum
            view2Sum = sum
        // 計算購物車總金額
        calculateTotal()
        
    }
    
    // 計算購物車總金額
    func calculateTotal() {
        // 購物車總金額 = view1 總金額 + view2 總金額
        allBooksSum = view1Sum + view2Sum
        // 使用格式化器將所有書籍的總金額轉換為貨幣格式的字符串
        let totalMoney = formatter.string(from: NSNumber(value: allBooksSum))
        // 將格式化後的總金額字符串設定為顯示在 totalPriceLabel 也就是購物車總金額上的文本
        totalPriceLabel.text = totalMoney
    }


    @IBAction func reset(_ sender: UIButton) {
        // 購物車總金額改為 0
        totalPriceLabel.text = String(0)
        
        // 兩個 view 的總金額改為 ０
        view1Sum = 0
        view2Sum = 0
        
        // 所有 Stepper 的值改為 0
        view1Stepper01.value = 0
        view1Stepper03.value = 0
        view1Stepper05.value = 0
        view1Stepper07.value = 0
        view1Stepper09.value = 0
        view1Stepper11.value = 0
        view1Stepper13.value = 0
        view1Stepper15.value = 0
        view1Stepper17.value = 0
        
        view2Stepper02.value = 0
        view2Stepper04.value = 0
        view2Stepper06.value = 0
        view2Stepper08.value = 0
        view2Stepper10.value = 0
        view2Stepper12.value = 0
        view2Stepper14.value = 0
        view2Stepper16.value = 0
        view2Stepper18.value = 0
        
        // 所有數量標籤的文字改為 0
        view1Quantity01.text = String(0)
        view1Quantity03.text = String(0)
        view1Quantity05.text = String(0)
        view1Quantity07.text = String(0)
        view1Quantity09.text = String(0)
        view1Quantity11.text = String(0)
        view1Quantity13.text = String(0)
        view1Quantity15.text = String(0)
        view1Quantity17.text = String(0)
        
        view2Quantity02.text = String(0)
        view2Quantity04.text = String(0)
        view2Quantity06.text = String(0)
        view2Quantity08.text = String(0)
        view2Quantity10.text = String(0)
        view2Quantity12.text = String(0)
        view2Quantity14.text = String(0)
        view2Quantity16.text = String(0)
        view2Quantity18.text = String(0)
    }
    
    @IBAction func checkout(_ sender: UIButton) {
        
        
        if totalPriceLabel.text != String("$0"){
            let alertControllerYes = UIAlertController(title: "購買完成～", message: "請注意收貨", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "確定", style: .cancel, handler: nil)
            alertControllerYes.addAction(okAction)
            // 通過 self.present 顯示 UIAlertController，顯示購買完成的提示
            self.present(alertControllerYes, animated: true)
        }else{
            let alertControllerNo = UIAlertController(title: "購物車空空如也～", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "確定", style: .cancel, handler: nil)
            alertControllerNo.addAction(okAction)
            // 通過 self.present 顯示 UIAlertController，顯示購物車空空如也的提示
            self.present(alertControllerNo, animated: true)
            
        }
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
            // 從 UIPageControl 中獲取當前頁面的索引，並將其分配給 index 變數
            index = sender.currentPage
            // 從圖片數組 "images" 中根據 "index" 獲取相應的圖片文件名
            let pic = images[index]
            // 使用pic 創建 UIImage 並設定到 imageView，以顯示在界面上
            imageView.image = UIImage(named: pic)
        }
    @objc func playingAdvertise(){
        // 從 UIPageControl 中獲取當前頁面的索引，並將其分配給 index 變數
        index = (index + 1) % images.count
        // 從圖片數組 "images" 中根據 "index" 獲取相應的圖片文件名
        let pic = images[index]
        // 使用pic 創建 UIImage 並設定到 imageView，以顯示在界面上
        imageView.image = UIImage(named: pic)
        // 使 Page Control 隨著圖片變化改變亮起的小圓點
        pageControl.currentPage = index
    }
    override func viewDidDisappear(_ animated: Bool) {
         // 將timer的執行緒停止
         if self.timer != nil {
              self.timer?.invalidate()
         }
    }
    
    
    
    
}

