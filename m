Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DC4221FA0;
	Sat,  7 Jun 2025 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749298078; cv=none; b=f+P4zQgEy8/+GKyAWSav3rIRA8SwsvGLfkeuhp2ZZ9QzZSQgIMCo85j2F7o+ZeL+TzOYYIa0B36Jc++4Vg+UaZ55bUH94K0RtcyIYCN1OHZFmSKP09urriToLrpB3nZKlFx7P4zmr2HtGGgRXwk2y6PUA92YmDK/LLMIV0NJK9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749298078; c=relaxed/simple;
	bh=DZa3JdiBu214uY9Tt/JtVOPrAsMdXuGUNMm9XNgGI3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sEPE4R0EcOkCbvAJgk5VOzFLEzUUWjPGDUnJFrIe38zG3oCUDkbtmE5wZD/uNfsjSlxZvJr/c9Z/wTofbQU1rJ24feYEY+/acBYTsTddP2OdS+J286VpNsR0OXyCd2XEKqDG6TRbyPU3TTAFyHPHUlG0K3YFMdl22FhfrIRM1dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iT1p9kch; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iT1p9kch"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so23855835e9.3;
        Sat, 07 Jun 2025 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749298074; x=1749902874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07TVQMLxCVF1Rat4olwfbCqsRTrqGNZ3C/Ht2jMQZbM=;
        b=iT1p9kchtH0VEYrq1zNA8HAC4b1nXYrlaonCWRsaqSm8UxLe6ADOi8bVxJTrHpEyEw
         PIk12j2M0lpRlqm8+erhSgctTsxz9B+vgRtDrmgvOIeNCezaNiDrkiN8K/bOyEkKWy+E
         6K4ZK1Gxk3Zhwwjie48WI2nsg+AImE9VSpOO1SxB6XXOcDSFPOjtpWhmcn2+yFeHo+rc
         VufuDxbfHZSNnpNtMVBMfYUgcxie4wFpMH8tC+zq8V6xQhUyKCVzazdCjgv6crXn1Z8U
         XvzT7bC0oqRcOtXqFsIYtTe9eHgK1mNRcabJkKV7TCkRq2ei1OSKxIPtWSgBNjBVLo53
         Qb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749298074; x=1749902874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07TVQMLxCVF1Rat4olwfbCqsRTrqGNZ3C/Ht2jMQZbM=;
        b=Raef2wAL5eipmDfMadVyawuRT4xQlV3Xgf9jgUqthU8KkhBF+9/spoNqpzSZi/FrJl
         pBMLHKzi5/NQhqHtqIpjqu5Hp+q71IrLP5XVJa77QQybM/T1vvRg6DPtret9j/SuSUCe
         tiLeLBDe9FbqbQmXIKehRiqAmDVGgtAKJBQ1Sz3v1n+tWmt+5fY9113WN4y7VhBJ2MzV
         bCpT0wXo/PygdxTRUgjYmz7GPf/7ySF3aXR4qTq0nBSFJ3fwmmP5GZta5j2oHWWvHvFf
         PY34y8yZclK8CY3PLGHi15Mf1Nn5DoNzbP5MHtpERpwqhg1XH8W+G8wsaWuFnoUUua1s
         Sesg==
X-Forwarded-Encrypted: i=1; AJvYcCWY+z6h2FKBHBGIeRfPH8akjmQS5pcgNw+nWSpa4llJThltAeDeb8XT2UxCc9nTuNxOKHNH9cLQ4TMR2dYvQ6Q=@vger.kernel.org, AJvYcCXr1M62pjvQO7D2lnF3tRKm+loab4dm2G9vCF4mgt64LsswNF49J/L7Zkimf1shgqXWkoR0Bjt5ctv30DA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHwHYrhzv7J0CFZjC7iFAWstjDpz5LC/8IG3FHeNMqbpBLmg9I
	hgj2HT9f93KFgYU/pzJ+2w+3jobXqckWCQaVsw2axblsSMVCJMYx+vF5LhhHlQ==
X-Gm-Gg: ASbGncuPG7DtSfd0ReoGUNqR27ll70BOGF0lShvkAjVJA/Tjdln8KPcczb1L1+yMbjv
	O1VQJnG9DTvVzDshwQH6ofV3/C1mMCAWJTHVCpcUruDgawVucpRwKdGuSP6FQvndLIjLQisZL8M
	PsGC6Nb58aA9KxCGD1yyU5FaNwbulNeMD/e1IhZg9xRBa4+uuw6teqvwir4UE7Nfq5hRYAY7YWF
	ShWZAhZTqRYIEj2R9ucu2ZVAeK9b4WhT3rZsMXfH5h8/KRMyT+EvsgjH6eoSHRF8SxgwynxA8Js
	IGOc9zwd8pPtaXoxShrJ5hbCSUTq4NpyWtMHz3HA
X-Google-Smtp-Source: AGHT+IE7n4gjCOE3epBBVqjFinYJFlGKFod+74ExHLrgD548M10Dcn8f9XkH9neTz2BOYCEzP2ucSA==
X-Received: by 2002:a05:6000:2204:b0:3a4:eecd:f4d2 with SMTP id ffacd0b85a97d-3a5319b5aafmr5912572f8f.38.1749298074265;
        Sat, 07 Jun 2025 05:07:54 -0700 (PDT)
Received: from [10.0.1.160] ([2001:871:22a:3372::171c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm4538965f8f.91.2025.06.07.05.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 05:07:53 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sat, 07 Jun 2025 14:07:32 +0200
Subject: [PATCH v5 3/3] rust: miscdevice: adjust the `rust_misc_device`
 sample to use `Data`.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-b4-rust_miscdevice_registrationdata-v5-3-b77b5b7aab5b@gmail.com>
References: <20250607-b4-rust_miscdevice_registrationdata-v5-0-b77b5b7aab5b@gmail.com>
In-Reply-To: <20250607-b4-rust_miscdevice_registrationdata-v5-0-b77b5b7aab5b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749298070; l=7426;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=DZa3JdiBu214uY9Tt/JtVOPrAsMdXuGUNMm9XNgGI3o=;
 b=2SATMg4MDJOQ/ZrVtcO+nSGqVdznYIlzFz+Zz9lQ1Ay2W/0s39ZXGXHcQA0aMx9Meyd4KTq6g
 LXUkgO90jQaCpCB8vzC8qclaZHknMwDmA0ssUunouiIMVEYknKwHaAb
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

Add a second mutex to the `RustMiscDevice``, which is shared between all
instances of the device using an `Arc` and the `Data` of
`MiscDeviceRegistration`.

This is mostly to demonstrate the capability to share data in this way.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 samples/rust/rust_misc_device.rs | 116 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 109 insertions(+), 7 deletions(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index c0b912920d6c4b60e747d9d298900ad64df67339..7519ff6a79985e8bdbb7f4c79d8a6ebf160ef8cc 100644
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
@@ -105,7 +163,7 @@
     miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
     new_mutex,
     prelude::*,
-    sync::Mutex,
+    sync::{Arc, Mutex},
     types::ARef,
     uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
 };
@@ -113,6 +171,8 @@
 const RUST_MISC_DEV_HELLO: u32 = _IO('|' as u32, 0x80);
 const RUST_MISC_DEV_GET_VALUE: u32 = _IOR::<i32>('|' as u32, 0x81);
 const RUST_MISC_DEV_SET_VALUE: u32 = _IOW::<i32>('|' as u32, 0x82);
+const RUST_MISC_DEV_GET_SHARED_VALUE: u32 = _IOR::<i32>('|' as u32, 0x83);
+const RUST_MISC_DEV_SET_SHARED_VALUE: u32 = _IOW::<i32>('|' as u32, 0x84);
 
 module! {
     type: RustMiscDeviceModule,
@@ -137,7 +197,10 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
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
@@ -148,8 +211,9 @@ struct Inner {
 
 #[pin_data(PinnedDrop)]
 struct RustMiscDevice {
+    shared: Arc<Mutex<Inner>>,
     #[pin]
-    inner: Mutex<Inner>,
+    unique: Mutex<Inner>,
     dev: ARef<Device>,
 }
 
@@ -157,7 +221,7 @@ struct RustMiscDevice {
 impl MiscDevice for RustMiscDevice {
     type Ptr = Pin<KBox<Self>>;
 
-    type Data = ();
+    type Data = Arc<Mutex<Inner>>;
 
     fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
         let dev = ARef::from(misc.device());
@@ -167,7 +231,8 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
         KBox::try_pin_init(
             try_pin_init! {
                 RustMiscDevice {
-                    inner <- new_mutex!( Inner{ value: 0_i32 } ),
+                    shared: misc.data().clone(),
+                    unique <- new_mutex!(Inner { value: 0_i32 }),
                     dev: dev,
                 }
             },
@@ -183,6 +248,12 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
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
@@ -204,7 +275,7 @@ fn drop(self: Pin<&mut Self>) {
 impl RustMiscDevice {
     fn set_value(&self, mut reader: UserSliceReader) -> Result<isize> {
         let new_value = reader.read::<i32>()?;
-        let mut guard = self.inner.lock();
+        let mut guard = self.unique.lock();
 
         dev_info!(
             self.dev,
@@ -217,7 +288,38 @@ fn set_value(&self, mut reader: UserSliceReader) -> Result<isize> {
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

