# 🔧 Xcode Signing Issues সমাধান

## ⚠️ বর্তমান সমস্যা:

### সমস্যা ১: PLA Update
```
Unable to process request - PLA Update available
You currently don't have access to this membership resource.
```

### সমস্যা ২: No Provisioning Profiles
```
No profiles for 'com.adelaide.plumber' were found
Xcode couldn't find any iOS App Development provisioning profiles
```

---

## ✅ সমাধান (ধাপে ধাপে):

### ধাপ ১: Apple Developer Agreement Accept করুন

1. **যান:** https://developer.apple.com/account
2. **লগইন করুন** আপনার Apple Developer account দিয়ে
3. উপরে যদি কোনো **banner/notification** দেখেন:
   - "Program License Agreement needs to be reviewed"
   - অথবা "New Agreement Available"
4. **ক্লিক করুন** সেই notification এ
5. **পড়ুন** নতুন agreement
6. **"Agree"** বাটন ক্লিক করুন
7. **অপেক্ষা করুন** 5-10 মিনিট (Apple's system update হতে সময় লাগে)

---

### ধাপ ২: Bundle Identifier Register করুন

Agreement accept করার পর:

1. **যান:** https://developer.apple.com/account/resources/identifiers/list

2. **ক্লিক করুন:** উপরের **+** (plus) বাটন

3. **Select:** "App IDs" → Continue

4. **Select:** "App" → Continue

5. **Fill করুন:**
   - **Description:** Adelaide Plumber
   - **Bundle ID:** Select "Explicit"
   - **Bundle ID:** `com.adelaide.plumber`

6. **Capabilities:** (Optional - এখন skip করতে পারেন)
   - Associated Domains
   - Push Notifications
   - Sign in with Apple (যদি ব্যবহার করেন)

7. **Continue** → **Register**

---

### ধাপ ৩: Xcode এ Team Verify করুন

Bundle ID register হওয়ার পর:

1. **Xcode খুলুন:**
   ```bash
   open ios/Runner.xcworkspace
   ```

2. **Left sidebar** এ **Runner** project select করুন

3. **TARGETS** → **Runner** select করুন

4. **Signing & Capabilities** tab এ যান

5. **নিশ্চিত করুন:**
   - ✅ "Automatically manage signing" checked আছে
   - ✅ Team: "Ilias Kotsanis" selected আছে
   - ✅ Bundle Identifier: `com.adelaide.plumber`

6. **"Try Again" ক্লিক করুন** যদি এখনো warning থাকে

7. অথবা **Team dropdown** থেকে:
   - None select করুন
   - তারপর আবার "Ilias Kotsanis" select করুন
   - এতে Xcode নতুন করে provisioning profile fetch করবে

---

### ধাপ ৪: Provisioning Profile তৈরি হওয়া যাচাই করুন

Xcode automatically provisioning profile তৈরি করবে। যাচাই করতে:

1. **Signing & Capabilities** tab এ দেখুন
2. **Status** section এ ✅ চেক মার্ক দেখা যাবে
3. **Provisioning Profile:** "Xcode Managed Profile" দেখাবে
4. **Signing Certificate:** "Apple Development" দেখাবে

---

### ধাপ ৫: Manual Provisioning Profile (যদি Automatic কাজ না করে)

যদি automatic signing কাজ না করে, manual করুন:

1. **যান:** https://developer.apple.com/account/resources/profiles/list

2. **ক্লিক করুন:** **+** (plus) button

3. **Select:** "iOS App Development" → Continue

4. **App ID:** Select "com.adelaide.plumber" → Continue

5. **Certificates:** Select your development certificate → Continue

6. **Devices:** Select test devices (optional for now) → Continue

7. **Profile Name:** "Adelaide Development Profile" → Generate

8. **Download** the profile

9. **Double-click** downloaded .mobileprovision file to install

10. **Xcode এ ফিরে যান:**
    - Signing & Capabilities
    - "Automatically manage signing" **uncheck** করুন
    - Provisioning Profile dropdown থেকে নতুন profile select করুন

---

## 🔍 Troubleshooting

### যদি এখনো "PLA Update" error দেখায়:

```bash
# Terminal এ চালান:
security find-identity -v -p codesigning
```

যদি কোনো valid certificate না দেখায়:
1. Xcode → Settings (Cmd+,)
2. Accounts tab
3. আপনার Apple ID select করুন
4. "Manage Certificates" ক্লিক করুন
5. যদি certificate না থাকে, **+** ক্লিক করে "Apple Development" create করুন

### যদি Team দেখা না যায়:

1. **Xcode → Settings → Accounts**
2. **Check করুন** আপনার Apple ID আছে কিনা
3. যদি না থাকে: **+** ক্লিক করে Apple ID add করুন
4. **Download Manual Profiles** ক্লিক করুন

### Agreement accept করার পর কাজ না করলে:

1. **Xcode সম্পূর্ণ বন্ধ করুন**
2. **Terminal এ চালান:**
   ```bash
   killall Xcode
   rm -rf ~/Library/Developer/Xcode/DerivedData/*
   ```
3. **Xcode আবার খুলুন**
4. **Signing & Capabilities** এ গিয়ে **Try Again** ক্লিক করুন

---

## 📋 Quick Checklist

- [ ] Apple Developer Agreement accepted
- [ ] 5-10 মিনিট অপেক্ষা করেছি
- [ ] Bundle ID `com.adelaide.plumber` registered
- [ ] Xcode এ Team selected: "Ilias Kotsanis"
- [ ] "Automatically manage signing" enabled
- [ ] Provisioning Profile তৈরি হয়েছে
- [ ] কোনো warning/error নেই Signing section এ

---

## ✅ সফল হলে কি দেখবেন:

Signing & Capabilities tab এ:
```
✅ Signing for "Runner"
   Team: Ilias Kotsanis
   Bundle Identifier: com.adelaide.plumber
   Provisioning Profile: Xcode Managed Profile
   Signing Certificate: Apple Development
   Status: ✅ (no warnings)
```

---

## 🚀 এরপর করণীয়:

Signing ঠিক হয়ে গেলে:

1. **Build করুন:**
   ```bash
   Product → Clean Build Folder (Cmd+Shift+K)
   Product → Build (Cmd+B)
   ```

2. **Archive করুন:**
   ```bash
   Product → Archive
   ```

3. **Upload করুন TestFlight এ:**
   - Archive window থেকে "Distribute App"
   - "App Store Connect" → Upload

---

**যেকোনো সমস্যা হলে screenshot নিয়ে জানাবেন!** 📸
