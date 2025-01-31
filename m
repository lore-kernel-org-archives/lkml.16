Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB5A1E377E;
	Fri, 31 Jan 2025 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738336106; cv=none; b=C5ube02Z1kC/JpG1DMGbDkMHKHTCsfwjh+O9w88xdxdL+k88BzJIJweT4osEhUqUJydQw6ed2b+GKsWK/btKVK0oXusrvGIe3dJ9Q+CuJSr9HySagpNTH2yfKrQZj49AxRfLa1jgrUheXQNMVZvoF29WfkXij6TYnQ8EGOjkd94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738336106; c=relaxed/simple;
	bh=NltnxPsvyHizFdY1rZDyMFYkrrhOoY/Vq3+44/WgE7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7WqkX1ocCv+jX/PWTFVSGlx8FE0qPHGVAMSTIp7SkciWL12uTc8F14wPuki38U7WC1mwY/SpeM6uGFSJeIpBuUqF4B1jck9TwYVM+RX8TnaL1TgcKFMzXe7HwqENxL1YcApAyQ334gt6pJb+B8wJaMIAbcj4IGdnKRWWZ1YLMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQIfKWMI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQIfKWMI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so20955475e9.1;
        Fri, 31 Jan 2025 07:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738336103; x=1738940903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYn0muHYjqjA6UsqqcKnISyo0x1aOKCSWvoO/WsiV2k=;
        b=ZQIfKWMIL6bzyCXjVCAyiBdiieZXkQJSFA2lUOyO1K2/5kjG6VIiPqKuTrXZdcW0Yo
         TsyhjzWkGb2zSENjLgyFvNhjFfWV+0xvnbhyQxEWHDmwEfZrxbNVjccq343WKWqAy5ov
         V7XR5ZQmjoFzzA2q4ZzTA9oVFY+Td7F1AguWafo/ncHlw3j7TVY8+MAUR9zu0/c3JkZA
         w8NMColD7BMs2+M/t1gV8T3IvdhobNMxY2E7p8VCSDj3jAWtUmPCI/4lWPZD9BtB2dAt
         n7oy/YfZUPoY1o7yoxektSZqaZsTGPu4o8qM5UUXHFOIrGAx/CEN6OWF3IOlPJhOhoAD
         PRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738336103; x=1738940903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYn0muHYjqjA6UsqqcKnISyo0x1aOKCSWvoO/WsiV2k=;
        b=SJj8I4wduP+ww7d9FqDlyY/VoSbMxv7NxqyjbUflHUVDDca9cX7+WbJaEoSr7EPAGH
         1kcFjwZYX1Nn/1cV5UuAoDIuA7wIdRiyME5EJBfZxxxojcGMT+SrqRIa+N11dlHjCCnd
         xCsTAuu5l6h+iTCZZOK3bWIvoRsZAPjh3lSfJZJuyQtbDn4NRgKXa4C3aDF0lJ+AE5+V
         0ZFQhl2KUFpiT+yjCLQgJS4QaLrXN8Y3ko5/3yk/mEEVG2kXnYveeU7tFAXtU7a9Sq8v
         y5UPDPm0vqEmRmoIRnqlYbPSc59/0nikiaVTfx1gPplwj7QgNYePWW7Yu45EixZW0LLV
         qR4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDaQ6KzVGioTiT/q/VheIOpic8mrHpZtVr2ibRxq2lMbZp7euir0lJwbjK/EvUCLkbFLXox8VwXg1r1lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjdTU/TcJqOciNJeEHoGJyrR8yC4wnGTL9F6VPphV9/bCeDCqZ
	W7Cp8GVEXhk9rP0IL6VL0N7C7zOaWfKA4cjSzB1vmSwWk5jJDCMl
X-Gm-Gg: ASbGncvG0EUWZ7eELWXCbJbcjjg+LMTHRWfP2dpjYvMhZ1erfQa/7yv6xowONS3Tf69
	nawsSVORY5r0EnX1Sqo0jwEZMZv4dIPzcxiWW3YwZuJ6fpiAZVcgisQYytUj7auLcRw907bm9xb
	csCXbjnKmi49aOJ8IY1yRNqSuF+ho2vqFTCRede24WxN9gaylwFIUPnSAI/8uakFnLYJwnINL3N
	Me1JEWXTIgPqbwiqNcwynTTXmcQp7L+10thDKoroL8DUirrxmCyB32GkpmzLfPSzDqi7QYRhx/x
	+Go=
X-Google-Smtp-Source: AGHT+IHevu4w6u0n5f/tqugEgYckD6bhxH24TqMUE6w5dM/Z5vQ4B1xT2XlwwjUovVM6qa4WXCltLg==
X-Received: by 2002:adf:fbd1:0:b0:386:3835:9fec with SMTP id ffacd0b85a97d-38c520972d6mr8152272f8f.44.1738336102278;
        Fri, 31 Jan 2025 07:08:22 -0800 (PST)
Received: from [10.0.1.56] ([2001:871:22a:8634::1ad1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c102f7dsm4961479f8f.30.2025.01.31.07.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:08:21 -0800 (PST)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Fri, 31 Jan 2025 16:08:16 +0100
Subject: [PATCH v2 3/3] rust: miscdevice: adjust the rust_misc_device
 sample to use RegistrationData.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-b4-rust_miscdevice_registrationdata-v2-3-588f1e6cfabe@gmail.com>
References: <20250131-b4-rust_miscdevice_registrationdata-v2-0-588f1e6cfabe@gmail.com>
In-Reply-To: <20250131-b4-rust_miscdevice_registrationdata-v2-0-588f1e6cfabe@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738336097; l=7574;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=NltnxPsvyHizFdY1rZDyMFYkrrhOoY/Vq3+44/WgE7E=;
 b=c7LplwSvTqIu+Va75CPu8xjG1TeUKHHCx0G9m7T9YReLx7411MIpgglJ87y5U84yv7Ynq9RMm
 MsNbDacBPIXDjuOYeuDO7m58r7gWyc4+gB2vJv6enYEJSq2EgoN/3hx
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

Add a second mutex to the RustMiscDevice, which is shared between all
instances of the device using an Arc and the RegistrationData of
MiscDeviceRegistration.

This is mostly to demonstrate the capability to share data in this way.

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 samples/rust/rust_misc_device.rs | 117 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 108 insertions(+), 9 deletions(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 779fcfd64119bdd5b4f8be740f7e8336c652b4d3..050910400c6f05024625136a66ffbeec21d654e8 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -86,6 +86,62 @@
 ///     return -1;
 ///   }
 ///
+///   value++;
+///
+///   // Set shared value to something different
+///   printf("Submitting new shared value (%d)\n", value);
+///   ret = ioctl(fd, RUST_MISC_DEV_SET_SHARED_VALUE, &value);
+///   if (ret < 0) {
+///     perror("ioctl: Failed to submit new value");
+///     close(fd);
+///     return errno;
+///   }
+///
+///   // Close the device file
+///   printf("Closing /dev/rust-misc-device\n");
+///   close(fd);
+///
+///   // Open the device file again
+///   printf("Opening /dev/rust-misc-device again for reading\n");
+///   fd = open("/dev/rust-misc-device", O_RDWR);
+///   if (fd < 0) {
+///     perror("open");
+///     return errno;
+///   }
+///
+///   // Ensure new value was applied
+///   printf("Fetching new value\n");
+///   ret = ioctl(fd, RUST_MISC_DEV_GET_SHARED_VALUE, &new_value);
+///   if (ret < 0) {
+///     perror("ioctl: Failed to fetch the new value");
+///     close(fd);
+///     return errno;
+///   }
+///
+///   if (value != new_value) {
+///     printf("Failed: Committed and retrieved values are different (%d - %d)\n",
+///            value, new_value);
+///     close(fd);
+///     return -1;
+///   }
+///
+///   value = 0;
+///   // Ensure non-shared value is still 0
+///   printf("Fetching new value\n");
+///   ret = ioctl(fd, RUST_MISC_DEV_GET_VALUE, &new_value);
+///   if (ret < 0) {
+///     perror("ioctl: Failed to fetch the new value");
+///     close(fd);
+///     return errno;
+///   }
+///
+///   if (value != new_value) {
+///     printf("Failed: Committed and retrieved values are different (%d - %d)\n",
+///            value, new_value);
+///     close(fd);
+///     return -1;
+///   }
+///
 ///   // Close the device file
 ///   printf("Closing /dev/rust-misc-device\n");
 ///   close(fd);
@@ -104,7 +160,7 @@
     miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
     new_mutex,
     prelude::*,
-    sync::Mutex,
+    sync::{Arc, Mutex},
     types::ARef,
     uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
 };
@@ -112,6 +168,8 @@
 const RUST_MISC_DEV_HELLO: u32 = _IO('|' as u32, 0x80);
 const RUST_MISC_DEV_GET_VALUE: u32 = _IOR::<i32>('|' as u32, 0x81);
 const RUST_MISC_DEV_SET_VALUE: u32 = _IOW::<i32>('|' as u32, 0x82);
+const RUST_MISC_DEV_GET_SHARED_VALUE: u32 = _IOR::<i32>('|' as u32, 0x83);
+const RUST_MISC_DEV_SET_SHARED_VALUE: u32 = _IOW::<i32>('|' as u32, 0x84);
 
 module! {
     type: RustMiscDeviceModule,
@@ -129,14 +187,17 @@ struct RustMiscDeviceModule {
 
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
@@ -147,8 +208,9 @@ struct Inner {
 
 #[pin_data(PinnedDrop)]
 struct RustMiscDevice {
+    shared: Arc<Mutex<Inner>>,
     #[pin]
-    inner: Mutex<Inner>,
+    unique: Mutex<Inner>,
     dev: ARef<Device>,
 }
 
@@ -156,7 +218,7 @@ struct RustMiscDevice {
 impl MiscDevice for RustMiscDevice {
     type Ptr = Pin<KBox<Self>>;
 
-    type RegistrationData = ();
+    type RegistrationData = Arc<Mutex<Inner>>;
 
     fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
         let dev = ARef::from(misc.device());
@@ -166,7 +228,8 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
         KBox::try_pin_init(
             try_pin_init! {
                 RustMiscDevice {
-                    inner <- new_mutex!( Inner{ value: 0_i32 } ),
+                    shared: misc.data().clone(),
+                    unique <- new_mutex!(Inner { value: 0_i32 }),
                     dev: dev,
                 }
             },
@@ -182,6 +245,12 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
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
@@ -192,7 +261,6 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
         Ok(0)
     }
 }
-
 #[pinned_drop]
 impl PinnedDrop for RustMiscDevice {
     fn drop(self: Pin<&mut Self>) {
@@ -203,7 +271,7 @@ fn drop(self: Pin<&mut Self>) {
 impl RustMiscDevice {
     fn set_value(&self, mut reader: UserSliceReader) -> Result<isize> {
         let new_value = reader.read::<i32>()?;
-        let mut guard = self.inner.lock();
+        let mut guard = self.unique.lock();
 
         dev_info!(
             self.dev,
@@ -216,7 +284,38 @@ fn set_value(&self, mut reader: UserSliceReader) -> Result<isize> {
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
2.48.1

