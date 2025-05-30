Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799AF2185A6;
	Fri, 30 May 2025 20:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638016; cv=none; b=e+KY5xbwqFowlWMfKdsSNntpNaaSMmlgJ+62X2QH1wWLrGdXyNcVsLYsqZcVqzG45raLwAgrNOiHhnQEdsQKtYB9KxlY1yzMOzQvpy+GP2DmkJgWtrDnCRuixHlcmLjGgxMRHH2Jo7XDtaBXNP1CmpmThzS9D++D6hYlV+/Jj/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638016; c=relaxed/simple;
	bh=Tl9KVLjAYo8nLG7kxM/4N+/E474ZkjS1L1eq4887tp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ie6OrECrWXuDDH6L7C7BqNnFMHR9W+7WlZvgzcD9CryKrdRtrP8HhzhGegsMW5QEPg8x0fBF9b1TgJKC0ByjQyYm1aXFbwuNId/ylUA+TBoxojdmIcgCCgsx0DaIcrpjOTWMsGDQcd3MEB9ABbIGZ8pc5gljvqhyVeeSO1IlGoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SajlyGUO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SajlyGUO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so1839905f8f.2;
        Fri, 30 May 2025 13:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748638013; x=1749242813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3qDm3mLZcRdoxx+80MjSPgoFL99DEoKU4L7ojs6jpw=;
        b=SajlyGUOoZN6g4NnZHQ7Eni4XTBwDWb9C9SaHAIm9u71jiyE54loPZl197aIBYRrlj
         URVB8Kru3ihz3HYnwzTI7VDv6UBD344zc692hp1iyOiJtK3JxqWDlm18wWRU/Anui9CA
         k/K3JZcACmgkFzkXLxPMGvUx2t/d5HSfgTlT96xQjntFlh5xWThljLtPmjJlQ5bTVgE9
         WMSnFgSVtT+9bbU2p4lJKBXrdvLuDxbW4emDz9arcKzxnWL5QN6LNxvtEwo+juFsYINE
         sBy5vUtMvNRvol0jUMfpODFgCUSnenrH9xaqavLjhGtBjPHf5iGJAhHWkPxZv1VfhOpU
         RqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638013; x=1749242813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3qDm3mLZcRdoxx+80MjSPgoFL99DEoKU4L7ojs6jpw=;
        b=mKYQoDlAifK8RZk/Lw+mkskZEl76x4fTgJUw2cG2a+ED7IvgnL67MrGFi5xDSPHyjH
         5PMSqLOEtPMOZ4JtqmS6LycMh1hX/2sjkW9cWfpS2OCAFK5Uo7bO0UTJuYi0iqnTigk0
         xQZYKBnvE2/Zmny9rok13O+Vi3icVwyQQWjzyaDbXWnSq9Tw9YVy7TfhJOEatFVQsFVR
         xY2etbIy5OSc685WSiNAVnU8qPDGfGJYXM1ystSWa/t2oVaju+hI4kUtevfysJ2AZDVM
         GvruEDqgF881T0XaMFVc7zNEezemsSL/4fPbdDDRgiw2QqAK+ZgrDh7Cm6KPh7RM43q4
         405g==
X-Forwarded-Encrypted: i=1; AJvYcCVe8ks0Gka4UHJ/VaSAw7E/oEdjk79Q745XLXcZqw8DyKkdF+Mx0IlFKJCesOFoeRNTlDLnIJmjoGRZshmqCgk=@vger.kernel.org, AJvYcCXXrgjvx+V00QGQwMTuBAUzUG/djJDE5vkaqTAs8IGfvasrdFhVX6npTzcSgiRX94W5WLx7G+hAYfxZljo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBCLVfKmZakXH9EFVDWubkrs+bVe2oFnVc804wWYVYQVRxaZmG
	hW22X6r0DW1rdsKAHrdGkZAvijYuiN8krXcP/yWNTf3UxjB8cTB2WXBp
X-Gm-Gg: ASbGncsnl8Eif9GhU636MO/5++bDs1lzIc1IeIzGoh2iAGqTZWBSeqc6k5wFrHEsYnD
	5biTPEmVGyDn3av5q9IbAxKErpx3Tk80kLMdKRQMIsP7LeuJHOy22hLaX4HqZ8k5IF5G7Oz0Qx3
	QqbYFaU+qrwjZLIt+3cpzC1nSugRF9ZRTk9sf+040loUiUwyx3enZJWDuZ34xUNnXtk+l+7tf1v
	wXDHM2UaxQKsh0v1U107k20NK9baTHu9WPAN7bUGs5vIcrOidX76sV3ss0Daq1LOcZs9o6A1ybd
	9LK3NlAQfmOA3NXE+bnzUauJP2wJEcpPRSO291sn
X-Google-Smtp-Source: AGHT+IG2U7sxwRFJgIe+wXnLV5jDUaFc12c2xgUl6sDvdj2Uc3RTKkIChBO0snB+hq8AiC8DumV1uA==
X-Received: by 2002:a5d:5f84:0:b0:3a4:e706:52f5 with SMTP id ffacd0b85a97d-3a4f7a4b4e2mr4055593f8f.13.1748638012631;
        Fri, 30 May 2025 13:46:52 -0700 (PDT)
Received: from [10.0.1.162] ([2001:871:22a:cd68::171c])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-450d7fa21e4sm28045405e9.11.2025.05.30.13.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:46:52 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Fri, 30 May 2025 22:46:29 +0200
Subject: [PATCH v4 3/3] rust: miscdevice: adjust the rust_misc_device
 sample to use RegistrationData.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-b4-rust_miscdevice_registrationdata-v4-3-d313aafd7e59@gmail.com>
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
In-Reply-To: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Benno Lossin <lossin@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748638009; l=8048;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=Tl9KVLjAYo8nLG7kxM/4N+/E474ZkjS1L1eq4887tp0=;
 b=NQY75oA+Cqbyk6jh52HUGfjBuBmiXt2Cs4Heq8BWGIpSE/uxLWmKPQ+zBMkQk/0bOf7QFAIYR
 2ZgEtrbnvqdDZ7CxWjRzmpmrgf8u3CWRrUjxw3xoVP6u3+OsHXFyYwe
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

Add a second mutex to the RustMiscDevice, which is shared between all
instances of the device using an Arc and the RegistrationData of
MiscDeviceRegistration.

This is mostly to demonstrate the capability to share data in this way.

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 samples/rust/rust_misc_device.rs | 120 +++++++++++++++++++++++++++++++++++----
 1 file changed, 110 insertions(+), 10 deletions(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 67a6172fbbf72dd42a1b655f5f5a782101432707..3c96cf8fe747427106f2e436c3dba33008c7fd53 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -18,6 +18,8 @@
 //! #define RUST_MISC_DEV_HELLO _IO('|', 0x80)
 //! #define RUST_MISC_DEV_GET_VALUE _IOR('|', 0x81, int)
 //! #define RUST_MISC_DEV_SET_VALUE _IOW('|', 0x82, int)
+//! #define RUST_MISC_DEV_GET_SHARED_VALUE _IOR('|', 0x83, int)
+//! #define RUST_MISC_DEV_SET_SHARED_VALUE _IOW('|', 0x84, int)
 //!
 //! int main() {
 //!   int value, new_value;
@@ -86,6 +88,62 @@
 //!     return -1;
 //!   }
 //!
+//!   value++;
+//!
+//!   // Set shared value to something different
+//!   printf("Submitting new shared value (%d)\n", value);
+//!   ret = ioctl(fd, RUST_MISC_DEV_SET_SHARED_VALUE, &value);
+//!   if (ret < 0) {
+//!     perror("ioctl: Failed to submit new value");
+//!     close(fd);
+//!     return errno;
+//!   }
+//!
+//!   // Close the device file
+//!   printf("Closing /dev/rust-misc-device\n");
+//!   close(fd);
+//!
+//!   // Open the device file again
+//!   printf("Opening /dev/rust-misc-device again for reading\n");
+//!   fd = open("/dev/rust-misc-device", O_RDWR);
+//!   if (fd < 0) {
+//!     perror("open");
+//!     return errno;
+//!   }
+//!
+//!   // Ensure new value was applied
+//!   printf("Fetching new value\n");
+//!   ret = ioctl(fd, RUST_MISC_DEV_GET_SHARED_VALUE, &new_value);
+//!   if (ret < 0) {
+//!     perror("ioctl: Failed to fetch the new value");
+//!     close(fd);
+//!     return errno;
+//!   }
+//!
+//!   if (value != new_value) {
+//!     printf("Failed: Committed and retrieved values are different (%d - %d)\n",
+//!            value, new_value);
+//!     close(fd);
+//!     return -1;
+//!   }
+//!
+//!   value = 0;
+//!   // Ensure non-shared value is still 0
+//!   printf("Fetching new value\n");
+//!   ret = ioctl(fd, RUST_MISC_DEV_GET_VALUE, &new_value);
+//!   if (ret < 0) {
+//!     perror("ioctl: Failed to fetch the new value");
+//!     close(fd);
+//!     return errno;
+//!   }
+//!
+//!   if (value != new_value) {
+//!     printf("Failed: Committed and retrieved values are different (%d - %d)\n",
+//!            value, new_value);
+//!     close(fd);
+//!     return -1;
+//!   }
+//!
 //!   // Close the device file
 //!   printf("Closing /dev/rust-misc-device\n");
 //!   close(fd);
@@ -94,7 +152,6 @@
 //!   return 0;
 //! }
 //! ```
-
 use core::pin::Pin;
 
 use kernel::{
@@ -105,7 +162,7 @@
     miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
     new_mutex,
     prelude::*,
-    sync::Mutex,
+    sync::{Arc, Mutex},
     types::ARef,
     uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
 };
@@ -113,6 +170,8 @@
 const RUST_MISC_DEV_HELLO: u32 = _IO('|' as u32, 0x80);
 const RUST_MISC_DEV_GET_VALUE: u32 = _IOR::<i32>('|' as u32, 0x81);
 const RUST_MISC_DEV_SET_VALUE: u32 = _IOW::<i32>('|' as u32, 0x82);
+const RUST_MISC_DEV_GET_SHARED_VALUE: u32 = _IOR::<i32>('|' as u32, 0x83);
+const RUST_MISC_DEV_SET_SHARED_VALUE: u32 = _IOW::<i32>('|' as u32, 0x84);
 
 module! {
     type: RustMiscDeviceModule,
@@ -130,14 +189,17 @@ struct RustMiscDeviceModule {
 
 impl kernel::InPlaceModule for RustMiscDeviceModule {
     fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
-        pr_info!("Initialising Rust Misc Device Sample\n");
+        pr_info!("Initializing Rust Misc Device Sample\n");
 
         let options = MiscDeviceOptions {
             name: c_str!("rust-misc-device"),
         };
 
         try_pin_init!(Self {
-            _miscdev <- MiscDeviceRegistration::register(options, ()),
+            _miscdev <- MiscDeviceRegistration::register(
+                options,
+                Arc::pin_init(new_mutex!(Inner { value: 0_i32 }), GFP_KERNEL)?
+            ),
         })
     }
 }
@@ -148,8 +210,9 @@ struct Inner {
 
 #[pin_data(PinnedDrop)]
 struct RustMiscDevice {
+    shared: Arc<Mutex<Inner>>,
     #[pin]
-    inner: Mutex<Inner>,
+    unique: Mutex<Inner>,
     dev: ARef<Device>,
 }
 
@@ -157,7 +220,7 @@ struct RustMiscDevice {
 impl MiscDevice for RustMiscDevice {
     type Ptr = Pin<KBox<Self>>;
 
-    type RegistrationData = ();
+    type RegistrationData = Arc<Mutex<Inner>>;
 
     fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
         let dev = ARef::from(misc.device());
@@ -167,7 +230,8 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
         KBox::try_pin_init(
             try_pin_init! {
                 RustMiscDevice {
-                    inner <- new_mutex!( Inner{ value: 0_i32 } ),
+                    shared: misc.data().clone(),
+                    unique <- new_mutex!(Inner { value: 0_i32 }),
                     dev: dev,
                 }
             },
@@ -183,6 +247,12 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
         match cmd {
             RUST_MISC_DEV_GET_VALUE => me.get_value(UserSlice::new(arg, size).writer())?,
             RUST_MISC_DEV_SET_VALUE => me.set_value(UserSlice::new(arg, size).reader())?,
+            RUST_MISC_DEV_GET_SHARED_VALUE => {
+                me.get_shared_value(UserSlice::new(arg, size).writer())?
+            }
+            RUST_MISC_DEV_SET_SHARED_VALUE => {
+                me.set_shared_value(UserSlice::new(arg, size).reader())?
+            }
             RUST_MISC_DEV_HELLO => me.hello()?,
             _ => {
                 dev_err!(me.dev, "-> IOCTL not recognised: {}\n", cmd);
@@ -193,7 +263,6 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
         Ok(0)
     }
 }
-
 #[pinned_drop]
 impl PinnedDrop for RustMiscDevice {
     fn drop(self: Pin<&mut Self>) {
@@ -204,7 +273,7 @@ fn drop(self: Pin<&mut Self>) {
 impl RustMiscDevice {
     fn set_value(&self, mut reader: UserSliceReader) -> Result<isize> {
         let new_value = reader.read::<i32>()?;
-        let mut guard = self.inner.lock();
+        let mut guard = self.unique.lock();
 
         dev_info!(
             self.dev,
@@ -217,7 +286,38 @@ fn set_value(&self, mut reader: UserSliceReader) -> Result<isize> {
     }
 
     fn get_value(&self, mut writer: UserSliceWriter) -> Result<isize> {
-        let guard = self.inner.lock();
+        let guard = self.unique.lock();
+        let value = guard.value;
+
+        // Free-up the lock and use our locally cached instance from here
+        drop(guard);
+
+        dev_info!(
+            self.dev,
+            "-> Copying data to userspace (value: {})\n",
+            &value
+        );
+
+        writer.write::<i32>(&value)?;
+        Ok(0)
+    }
+
+    fn set_shared_value(&self, mut reader: UserSliceReader) -> Result<isize> {
+        let new_value = reader.read::<i32>()?;
+        let mut guard = self.shared.lock();
+
+        dev_info!(
+            self.dev,
+            "-> Copying data from userspace (value: {})\n",
+            new_value
+        );
+
+        guard.value = new_value;
+        Ok(0)
+    }
+
+    fn get_shared_value(&self, mut writer: UserSliceWriter) -> Result<isize> {
+        let guard = self.shared.lock();
         let value = guard.value;
 
         // Free-up the lock and use our locally cached instance from here

-- 
2.49.0

