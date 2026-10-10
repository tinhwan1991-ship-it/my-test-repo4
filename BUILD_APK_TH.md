# SNOWBOUND Android — วิธีสร้าง APK

โปรเจกต์นี้ห่อเกม HTML/Three.js เวอร์ชันล่าสุดไว้ใน Android WebView และมีปุ่มสัมผัสสำหรับจอมือถือ แนะนำ Android 8.0 ขึ้นไป (API 26+) และใช้โหมดแนวนอน

## สร้าง APK ด้วย Android Studio

1. ติดตั้ง Android Studio บนคอมพิวเตอร์
2. แตก ZIP `snowbound-android-project.zip`
3. เปิด Android Studio → **Open** → เลือกโฟลเดอร์ `snowbound-android`
4. ติดตั้ง Android SDK Platform 35 หากโปรแกรมแจ้งให้ติดตั้ง และใช้ JDK 17
5. รอ Gradle Sync จนเสร็จ (ครั้งแรกต้องมีอินเทอร์เน็ตเพื่อดาวน์โหลด Gradle/Android Gradle Plugin)
6. เลือกเมนู **Build → Build Bundle(s) / APK(s) → Build APK(s)**
7. เมื่อสำเร็จ กด **locate** ในแจ้งเตือนเพื่อหาไฟล์ APK โดยปกติอยู่ที่ `app/build/outputs/apk/debug/app-debug.apk`
8. ส่ง APK ไปยังมือถือ Android เปิดไฟล์ติดตั้ง และอนุญาตติดตั้งจากแหล่งที่มานี้เมื่อระบบถาม

## สิ่งที่ตัวแอปทำ

- เปิดเกมใน WebView แบบเต็มหน้าจอและแนวนอน
- ฝังไฟล์เกมไว้ในแอป ไม่ต้องเลือกไฟล์ HTML เอง
- มีจอยซ้ายสำหรับเดินและพื้นที่ลากด้านขวาสำหรับหมุนกล้อง
- มีปุ่มสัมผัสสำหรับหยิบ/ใช้ของ ยิง เล็ง วิ่ง กิน บรรจุกระสุน เปิดกระเป๋า และเลือกอุปกรณ์
- เซฟเดี่ยวเก็บใน WebView ของอุปกรณ์นั้น
- ใช้อินเทอร์เน็ตเพื่อโหลด Three.js และ PeerJS จาก CDN; ถ้าไม่มีเน็ต เกมอาจเปิดฉากไม่ได้และโหมดออนไลน์ใช้ไม่ได้

## ข้อจำกัดที่ควรรู้

- APK ที่สร้างจาก `debug` เป็นไฟล์สำหรับทดสอบ/ติดตั้งเอง ไม่ใช่ release ที่ลงนามเพื่อเผยแพร่ใน Play Store
- เกมเดิมออกแบบเป็นต้นแบบ WebGL จึงอาจหนักบนมือถือระดับล่าง แนะนำเริ่มจากเมนูปรับภาพระดับ “ต่ำ” หรือ “มาตรฐาน” และจำกัด 30 FPS
- ระบบออนไลน์ยังเป็นรุ่นทดลองผ่าน PeerJS public signaling; ยังไม่ได้ทดสอบการเล่นจริงข้ามมือถือ 2–4 เครื่อง
- การสร้าง APK ต้องใช้ Android SDK/Android Studio และดาวน์โหลด build dependencies ซึ่งไม่มีในสภาพแวดล้อมที่ใช้จัดทำไฟล์นี้ จึงส่งเป็นโปรเจกต์พร้อม build แทน APK ที่คอมไพล์แล้ว


## สถานะการสร้าง APK ในรอบล่าสุด

มีการลองสั่ง `./gradlew assembleDebug` จริงแล้ว แต่การสร้างหยุดก่อนเริ่มคอมไพล์ เพราะไม่สามารถดาวน์โหลด Gradle 8.9 จาก `services.gradle.org` ได้ (ระบบแจ้งว่า resolve host ไม่สำเร็จ) และสภาพแวดล้อมที่จัดทำไฟล์นี้ไม่มี Android SDK ติดตั้งอยู่ จึง **ยังไม่มี APK สำเร็จรูป** ใน ZIP นี้ อย่าเปลี่ยนนามสกุล ZIP เป็น `.apk` เพราะจะติดตั้งไม่ได้

## ทางเลือกสร้าง APK โดยไม่ติดตั้ง Android Studio ในเครื่องนี้

โปรเจกต์มี workflow ที่ `/.github/workflows/build-android.yml` สำหรับ GitHub Actions อยู่แล้ว ผู้ที่ใช้งาน GitHub สามารถสร้าง repository ใหม่ แล้วนำไฟล์และโฟลเดอร์ทั้งหมด *ภายใน* โฟลเดอร์ `snowbound-android` ขึ้นไปไว้ที่ root ของ repository (ต้องให้ `.github/workflows/build-android.yml` อยู่ที่ root ของ repository) จากนั้นเปิดแท็บ **Actions** เลือก **Build SNOWBOUND Android APK** แล้วกด **Run workflow** เมื่อ job สำเร็จ ให้เปิด run ล่าสุด ไปที่ **Artifacts** และดาวน์โหลด `snowbound-debug-apk` ซึ่งมีไฟล์ `app-debug.apk` อยู่ภายใน

วิธีนี้ต้องใช้บัญชี GitHub และการเชื่อมต่ออินเทอร์เน็ตบน runner ของ GitHub; ผมยังไม่ได้รัน workflow นั้นและยังไม่สามารถยืนยัน APK จนกว่า workflow จะสำเร็จ


## สร้าง APK ผ่าน GitHub โดยไม่ต้องติดตั้ง Android Studio

1. ดาวน์โหลด ZIP โปรเจกต์ แล้วแตกไฟล์ใน Chromebook
2. ที่ GitHub สร้าง repository ชื่อ `snowbound-android`
3. ใน repository กด **Add file → Upload files** แล้วอัปโหลด “ไฟล์และโฟลเดอร์ทั้งหมดที่อยู่ข้างในโฟลเดอร์ `snowbound-android`” ไม่ใช่อัปโหลดโฟลเดอร์ชั้นนอกทั้งโฟลเดอร์ เพื่อให้ `app/`, `gradlew`, และ `.github/` อยู่ที่ราก repository
4. ในแอป Files ของ Chromebook กด `Ctrl+H` เพื่อแสดงไฟล์/โฟลเดอร์ที่ซ่อนอยู่ จากนั้นตรวจให้แน่ใจว่าได้อัปโหลดโฟลเดอร์ `.github` ด้วย (ภายในมี `workflows/build-android.yml`)
5. กด **Commit changes**
6. เปิดแท็บ **Actions** แล้วเลือก **Build SNOWBOUND Android APK** จากนั้นกด **Run workflow**
7. เมื่อ workflow เสร็จและเป็นสีเขียว เปิด run นั้น แล้วดาวน์โหลด Artifact `snowbound-debug-apk`
8. แตก ZIP ของ Artifact จะพบ `app-debug.apk` สำหรับติดตั้งบน Android

หมายเหตุ: ขั้นตอน build ต้องใช้อินเทอร์เน็ตบน GitHub Actions และบัญชีต้องอนุญาตให้ใช้ Actions ใน repository นี้
