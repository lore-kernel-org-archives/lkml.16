Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2DC1F37D3;
	Sat, 17 May 2025 11:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747481645; cv=none; b=hc6Aw3E3cdoK4mVzo7KA6N+/l8KiXnMfgSRhJAtjyBDhQ/jjQ8L9NHF9quzhiBdF0RGLDKOPCpOf7kKyMCF347Kr4Wlc0g4XHbDhLFD32qeVaNYxuZC8B5t+tm7Vsy3XM2/cWGuW/b4qWw5AbzfwKIUS36WF7PI9LB1JV52CDPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747481645; c=relaxed/simple;
	bh=Tl9KVLjAYo8nLG7kxM/4N+/E474ZkjS1L1eq4887tp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwFsbSh+6HOkOYbFH59WN1ynzGcxii74mXXzwb/Obpm0JYoMlbnpLEaYxtrii2T+ubYz3lzDUDpZTIqSmYslxW4GX+gDi8iwMoDWam66IpDHWdqNVO+fjHjG75e5hF11l7FNZRTaSiKyNcHqzpNtxeRg2pVvvMzqUBXI19BBCdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPavOoPn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPavOoPn"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so29598105e9.1;
        Sat, 17 May 2025 04:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747481641; x=1748086441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3qDm3mLZcRdoxx+80MjSPgoFL99DEoKU4L7ojs6jpw=;
        b=gPavOoPnYM1dhmbuhh5OD98eIETP5rKKyaEecf7f2YJOL/+rbMB/agtHj05oFZBE52
         htOcD8NMGIUhPpj3+CUhNZgXk/OcMoFhP8QE/ZPnuUF6tJXYJ9lcqOCBu7CprPEI3phO
         u6nU03TCJy2DA96lLZu4KtYPg6nHrrlIG78URbi/f/83duVfNYEB7MUwYDQ/SfJUHN1y
         F9jswcgojW7l2jw6PwBmtM/RyO378LwTpBqAOyn4l/bHzcrpb0u8y56P4h8yc5umEWXi
         SsmV7sIoVKXEYLvS40RA9+9mMg4GPAoc1umiGUYmYRqlO5wENEE+Bw15HC4Sgm0uebtD
         jPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747481642; x=1748086442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3qDm3mLZcRdoxx+80MjSPgoFL99DEoKU4L7ojs6jpw=;
        b=e8POohPllRON3hn34h5TlI9nHW+ow7jou5FcxcFuW/bSOZHmz2YWAFZGWGvkAyF3qo
         0A5oYKalL1CanLEQUmcjYxWsL6LWHOpoWvRCJ6XmXsrPSf/La2N/X4kXbh21jSPl+bHs
         g+FLWrsamr2W3mYTj+ZaPLhcx5ZVwicvfjpnaoswsITdij2GIfvEFd3fkSuifntsmEjH
         SLTLYvbMoqvDtg7Fk4t6Z1kcBb66Pslr/54a3b8W9BK0g6ZqdsYlo18i3pwHiIqWag7c
         h55lNpfIvDO0GddEmWNi1LK7wh0jQt75+Y8/VKPvK4fl/AYQMxPePnjMG0BPVF3baCBp
         Eiyg==
X-Forwarded-Encrypted: i=1; AJvYcCWFol19II6daOODrt9RM7t9+5trE3WJHIgYuD/gdJDEEFV7LkB96ysEV+pmwfnPQk6R4QU4vepdLF5Kx7oWCuc=@vger.kernel.org, AJvYcCWrB8aAuN17MnrOqRod+HschfDQO/0Fk2rBNir0gXqaEmP31ZHh09piJi2CpyJ0S1h2JkzMvddOgE8fAE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdrMZD9BYMl8TF6wLlthSglNKmJmKLfkezURTCKyYW8xJzZDfV
	1n6gUMVM5a8qT7dKXNeMKplI4H3OyR/H4xEjZ3bVFIXXVC+lhFUJMiAY
X-Gm-Gg: ASbGnctFwIpbhQfsP879wesEC7zKJfKmd2jz2FToCPfdUGItrdQckTqYqD6hX8XsQj2
	t53MeZOLOgz5S9I3xDPZ56vayNo3x9oAz7jjbyqDokhPn1igij7+9Qqu4d/C/h12xDCzHBUgv2K
	8Fnf9QmlCeCfeJ/iSL1EfehhWlHdTlgLDtrebjeuw+asw+aWWAgghlXwdmeUCy93C0LFTLyHr6k
	VhsuKwrEpiJSiJsxcV+95UJKf13FihUWDsZLex7CywcEq73liCu55yofkYD5ecNYm7D0Fn7BJnn
	ZEmyAPR6/7yF4GC4VdHrxO5pDd6lV1U03mL4FWk=
X-Google-Smtp-Source: AGHT+IGD0h8HjM8OzKJ2pAwIorau0bH8v1dbeI7wsgmWCPt/kAtURZz67iwBFsxVvN4pEOo+pTPyKw==
X-Received: by 2002:a05:600c:45cf:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-442fd610128mr71005575e9.12.1747481641376;
        Sat, 17 May 2025 04:34:01 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::171c])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f3951854sm137017265e9.24.2025.05.17.04.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 04:34:01 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sat, 17 May 2025 13:33:50 +0200
Subject: [PATCH v3 2/2] rust: miscdevice: adjust the rust_misc_device
 sample to use RegistrationData.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-b4-rust_miscdevice_registrationdata-v3-2-cdb33e228d37@gmail.com>
References: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
In-Reply-To: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747481638; l=8048;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=Tl9KVLjAYo8nLG7kxM/4N+/E474ZkjS1L1eq4887tp0=;
 b=chrPU9kal/NSsIqCWhw2Op0FF1TLi+f/XexNhsz3yd9j1w84iDY0+8wYv6VwCV/gYPQzUljGa
 /2EO02x9k+gAtvvMLhBH1WTGbmU7f0ie+fBdn0JgTauBAPucEeO2XsY
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

