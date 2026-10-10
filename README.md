# SNOWBOUND Android Project

เวอร์ชันต้นแบบ 0.6.0 สำหรับ Android WebView ออกแบบการเล่น **แนวนอน (landscape)** เป็นหลัก เช่น หน้าจอ POCO X7 Pro

## คุณสมบัติในชุดนี้
- ฝังเกม HTML เวอร์ชันปัจจุบันใน `app/src/main/assets/index.html`
- Android Activity ล็อกจอแนวนอนและซ่อน system UI ขณะเล่น
- ปุ่มสัมผัสแนวนอนสำหรับเดิน หมุนกล้อง ใช้งาน วิ่งแบบแตะเปิด/ปิด เลือกอุปกรณ์ เล็ง ยิง และเมนู
- มินิแมพวงกลมขนาดเล็กที่มุมขวาบน พร้อมสีแยกสัตว์นักล่า
- เพิ่มหมาป่าและเสือหิมะที่มีพลังชีวิตสูง AI ไล่ล่า/โจมตี แถบเลือด ตราผู้ล่า และหนังที่เก็บไปแขวนในบ้านได้

## Build APK
1. เปิดโฟลเดอร์นี้ใน Android Studio หรือใช้ workflow `.github/workflows/build-android.yml`
2. ใช้ JDK 17 และ Android SDK Platform 35 / Build Tools 35.0.0
3. สั่ง `bash gradlew --no-daemon assembleDebug`
4. APK debug จะอยู่ที่ `app/build/outputs/apk/debug/app-debug.apk`

## หมายเหตุ
- ชุดนี้เป็นโปรเจกต์สำหรับ build APK ไม่ใช่ APK ที่คอมไพล์แล้ว
- ตัวเกมโหลด Three.js และ PeerJS ผ่าน CDN จึงต้องเชื่อมต่ออินเทอร์เน็ตเพื่อให้ 3D และออนไลน์ทำงาน
- โหมดออนไลน์ยังเป็นต้นแบบ Peer-to-Peer และต้องทดสอบหลายเครื่องจริง
- คุณภาพภาพ/เฟรมเรตและการสัมผัสควรทดสอบบน POCO X7 Pro จริงก่อนเผยแพร่
