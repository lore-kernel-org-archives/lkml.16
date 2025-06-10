Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE4A265CDD;
	Tue, 10 Jun 2025 20:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749587287; cv=none; b=Nx7DLBL0Z4r9HTiZrGoY7EwkPSHWHvlQSNoCplwF6daHydc7Hg6nk4NmcvSKA+Lsa/ikhxMjr6BgQ0HG4WoEr4iXzxHYql4/I8Yh0VkWuCvQ5tdOOk943tLOHza73lSxrqgJz2/TOA09/cnwHhrwNTzt420R+7V/+D/myD1J8R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749587287; c=relaxed/simple;
	bh=DZa3JdiBu214uY9Tt/JtVOPrAsMdXuGUNMm9XNgGI3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F8M0V2p+JampRa1AKUoyi6cEfRkgZtRqxyqRCouaIoPxwo3n3Iiyr1f6lYsnDKXG1Wrot3a3p2ybT2n1GwGCDGz+tX5iO2br89N7VgSlomaqfoLVM0jHJKZ94Fd+48mXlhTBGcB21jA95HDI4u2gf4GXtrLGlDyuo3uFG0uDhhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhrxmKhJ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhrxmKhJ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so8906396a12.1;
        Tue, 10 Jun 2025 13:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749587283; x=1750192083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07TVQMLxCVF1Rat4olwfbCqsRTrqGNZ3C/Ht2jMQZbM=;
        b=VhrxmKhJZNfvEMpm0D8tArrDSAAKrISZVtfBOBnd81n2jgAdZs3aK4TsLgr/2cyVWT
         RdG1dwgdqEhhKZwtX4yC2t2FV93O67FrcGYgyq7SX/Zl27IY9mBqiMS22RG25mDw4ZfA
         Qokmz3TIj1j6sGk0E4zBpGYsmM80SHXhJJWqm2zBMRYJY5q5Q2xs6MN6jQlTicymem9z
         d/6eULtGk+HhtjzdiBF9Uf3qnYI7ES0RC39tBpaiWsrHGRrRMriiQycMYUF1RDNhdOKm
         eZ6Vv1ddZQhd3svX0SBrfzr4+Y3dbOoevEyIYrtzBSKH5uC2v3j6HrKB5PFsB9F6xnp+
         hGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749587283; x=1750192083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07TVQMLxCVF1Rat4olwfbCqsRTrqGNZ3C/Ht2jMQZbM=;
        b=RRDqeCNUdLSSd5eb9gnQ754BzUaOJhzfuKU0ou2ykR7wMN0l/wlzPsKNSE88jzVX1h
         cpddql4cE6+7VTTCJZXVQJf14mObHUuFdoXaeH7QsxGBhZJ9cf7Gkx6IH5t9Z8+ql5Dd
         R7p7RoRqoDRBf9ANXrJ+RTsnf1CWz1N6JXdP1QRMz2AFzQB7S5rKJn0Jouz3nDsoxbqJ
         9RKHJBkVq7h0HQhbiADGttoPPracrHyKcvpTB/tfYz+EaS4cagPlMxGyYC5AFG5qk1UL
         Z7+4tnCKDbLseyz+5s4ktgRyopoyZdDpJuDNDSHliysNg1BTdlusmDSeLEAjksAhfPPJ
         GaFw==
X-Forwarded-Encrypted: i=1; AJvYcCVqwG/+MS6sikAw37KxYpy35J7IPOORBICeA6ltwy7WN+qDmb0VasEOEopNtUgW6BZ9k7HzTfuD6O/3Grg=@vger.kernel.org, AJvYcCWDFyC05g5yUAHxTutZeYJTTKyPsq0EQc2NPTSENAuYltYYzEecuFSl3ZVQGcQWdc+VeSxKOyzrwkagorbx3zM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLzBF/uy9Tjzwd1SCsjOa9ETHHByD1VutsyiABne4HBP18DfD1
	zj5ZowWk671n3x4K1pIdKLcJ8wdgR6ect4AVE78qDHdtNZe6FKIWv9Mr
X-Gm-Gg: ASbGncsFRU9Pug6RMViMNQaLfSDlWQkXA42jNs0qeBXFGPxGhXIiflm4b7YhOyhuJd7
	YyN463E/8O0PUsIEzbGbnvALpwUZ3pzD7YgfW5Dphglkq6/pfg+xXPSudvvKd4OlVZU5zY5pkOb
	dNlrCSukfl13/BLGCd3bnj4ZWhCFc53fgJeyaq5q3a/siv0Gm6yIfuw2x+aywnS0zqG2NLEsBOk
	MR8caD6RfP9IhRPT0GFQgzwqiLN1EZBu1gScy0qTy1eFwKONOolAGkPFol2FfPGlOpaFUfOy0IY
	Ce21hsCUrmFmRsVUOP27OZduP2Wq2YmZ9v6/EFlXy9pYo7N6+/h2GTlx5G5jTkmn3axal4eG47Y
	r3cBraw==
X-Google-Smtp-Source: AGHT+IGhwvRLfbD0HAJSRYwXR8Wo6WZ7hGaok0JWNDYeP+QKQZJlufJTAHymLpt5w85UGxdZsfaBeA==
X-Received: by 2002:a05:6402:1ecb:b0:606:9996:80b7 with SMTP id 4fb4d7f45d1cf-6084e9e6551mr54309a12.26.1749587283385;
        Tue, 10 Jun 2025 13:28:03 -0700 (PDT)
Received: from [10.5.1.156] ([193.170.134.247])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-607783e67efsm6552678a12.78.2025.06.10.13.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:28:03 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Tue, 10 Jun 2025 22:27:57 +0200
Subject: [PATCH v6 3/3] rust: miscdevice: adjust the `rust_misc_device`
 sample to use `Data`.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-rust_miscdevice_registrationdata-v6-3-b03f5dfce998@gmail.com>
References: <20250610-b4-rust_miscdevice_registrationdata-v6-0-b03f5dfce998@gmail.com>
In-Reply-To: <20250610-b4-rust_miscdevice_registrationdata-v6-0-b03f5dfce998@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749587279; l=7426;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=DZa3JdiBu214uY9Tt/JtVOPrAsMdXuGUNMm9XNgGI3o=;
 b=AE3ISk1f9xz205e0anDjngvwZxEakdyonhZ2lXr2+j5rTOXRqynDgdCvx7qnVO26X2UjngYna
 FDisQNN/zGxBMwXaGH8lFp+F7vAwA5rrLbOMxEsbMWN04XZhpvdEkmY
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

