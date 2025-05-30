Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47B02116F5;
	Fri, 30 May 2025 20:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638016; cv=none; b=VHumA0hNrlT/pS6QnGwamEmIyNZN2oqoSeHiZRgE2GwPXfOQ04w9+Tx9mCt7WXcfebfLER7rLrHQ0OA7O+o4DJ/F5ETf3/z+wSP0dDrsvPL5sVqoWL9qtlksA6iqT0osCHeKS5niaNJmA9cMjFEZ6SC3KGTdJm9ZiZgbj6XhQf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638016; c=relaxed/simple;
	bh=nGLnGDJCcqKkua2F7z/rEsxXVnf+YzZJSN1wQu4SzmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDsP29Aw+2LqDAficvsklAsTW0kA58xgM6lmk73hwJ5ht1gP1MOJA9l7UOLjpR7YI2KGGtlC/izpI3iTp2K0vRvZkUc/29cLelaGdD6iQe9khwWd9ktfFujJ5gjCXQbaHQFRS07D2w8dhilHdyJZhF9td9/lG7FosYSFOJHPrhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CO+cBK+i; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CO+cBK+i"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf257158fso18196105e9.2;
        Fri, 30 May 2025 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748638012; x=1749242812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tp1evWHjYS1kM2spIBLb9Guyc1fvgCNsWTii1qBWPN4=;
        b=CO+cBK+ilUxwT7eRSWCN44vKX9O8cCfzn+d3Sho04MTQyEzinE1ScyYokgqGVR1RG9
         yHVayJMZMMeuZAIQ6zE1H1SoPAq79DD+gxKOYJOoFuc1Kqm92JdXR39NpoL1oCta6y7i
         J81di08NIv5MPmvKeOhMJbegAbdMW8hLx5SHpx1ru/jXxtzxykee9O7aG/y7Wjzbyq98
         LNM9tGJzY1q25Mw9hjhuoy1jWvbsF9jX6yhZQdGGHi0lcA87ung2lSGA+5HGfX6NL2uD
         uGM/NCKlfylbeiXiW+ADKINpDGBvTcW2TQoegZ9V0+AzPv7JfcDCg8505+MRJt9KuE8A
         aPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638012; x=1749242812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tp1evWHjYS1kM2spIBLb9Guyc1fvgCNsWTii1qBWPN4=;
        b=pHODX1MuLoJdioCPyoVhTES4bbwgJBi7X/d+zce38dYASocFDmObCPnJzvFhiYYI5s
         FZ5A4SsG5crSs4VA9hmAHc100AGrm3Kd6Spt0fpZVktbnE1SMLtmy/QU2DdlyEt499sV
         +pjSPqer01M9SdqiigmBwGITF4gVZds/Z0xUQodmWbEt00hSfcrcJPgr0z6YCeTbMs6x
         GjWm8SH0hE1LAClYAppcxkguh38ZW0DiI8o8tqJtP195jVujNy1wmrq9iQlRyLB4UojM
         WliGLS70LNdQdjVkcw7IF/mqB8+G8FCeu+rmKmy1dBTOE/oz+S3cc2XWplIU0stLMyWv
         ZKDA==
X-Forwarded-Encrypted: i=1; AJvYcCX2FTDtLjQ238TeokZoXPy2UBu1UFVlSb+LUpqB4RBpfGdMx96iGOuYR8tmSbh+ACzOycGZ9IKl0Pa5qkw=@vger.kernel.org, AJvYcCX5aErwTal5aBhjKleqjWyc3tiBexI0HfrZWz2DWtQjdV/CWO5NM3FfxTkH4GeLBUPg3+i5NiyTC1gN42nZAiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxCDKCnMY2zEwahVHVJ7s3ppjmO7qEZ/SJwn7wcToXg0m8gWaj
	IWwBtkBSxrr5XaFhx25BOW2Msg7zlctB7gMTUsrkMvJT3p/aPOpGOx0L
X-Gm-Gg: ASbGncvuOZE8OQJawGIhisxhEPZr3JXYBZhkl6JLinEKkJC6R2KXqwkOvqZa2ek9gfm
	0bSa1vsQPYXi36hvmlyDsK8tJmFg2RkPuglMEln6NoCEJqclwbUJDRaD9K4nIza3bemHUBPntU9
	5ZmoMBPOjiNyP8NoL987iA7shbB1sbQQkNwukyH72CfRNmJ5Kwp6lhWvNwAbeJvw1J6Khe42UdM
	3mH2xsgDdHQsWmF0NjOJoQuia8tLqr4d+LpKZ0Ev6UfNc5gyt0Tw6A2Vyn26+gN7PTvvlFn4mce
	z5EDFvEBmq95/dNMoal2z5nzPi7/EZ0KmtOhhB+m
X-Google-Smtp-Source: AGHT+IGnh9Y7zNX5kdQRJG+d5y1Obtrkr/1jZ3SeTbS8/JDPNf85HPVepv/1pC9Z4huf5Zl4TGBTIQ==
X-Received: by 2002:a05:600c:45d0:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-450d882b1e0mr40008845e9.3.1748638011722;
        Fri, 30 May 2025 13:46:51 -0700 (PDT)
Received: from [10.0.1.162] ([2001:871:22a:cd68::171c])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-450d7fa21e4sm28045405e9.11.2025.05.30.13.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:46:51 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Fri, 30 May 2025 22:46:28 +0200
Subject: [PATCH v4 2/3] rust: miscdevice: add additional data to
 MiscDeviceRegistration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748638009; l=10571;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=nGLnGDJCcqKkua2F7z/rEsxXVnf+YzZJSN1wQu4SzmY=;
 b=EH1IsxZqOY0bdsjyD+6CjYmZBG0IYAUB26PBQ4A4SGKvXeX9cKjxlPS6ZfsGl4Np0GzCwU5Fi
 ZL6MlZ0xNjYClG0BEqmV+34Ym3i56pw/Ju6Qi1JKu9r5p8kUf1beE9r
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

When using the Rust miscdevice bindings, you generally embed the
`MiscDeviceRegistration` within another struct:

struct MyDriverData {
    data: SomeOtherData,
    misc: MiscDeviceRegistration<MyMiscFile>
}

In the `fops->open` callback of the miscdevice, you are given a
reference to the registration, which allows you to access its fields.
For example, as of commit 284ae0be4dca ("rust: miscdevice: Provide
accessor to pull out miscdevice::this_device") you can access the
internal `struct device`. However, there is still no way to access the
`data` field in the above example, because you only have a reference to
the registration.

Using `container_of` is also not possible to do safely. For example, if
the destructor of `MyDriverData` runs, then the destructor of `data`
would run before the miscdevice is deregistered, so using `container_of`
to access `data` from `fops->open` could result in a UAF. A similar
problem can happen on initialization if `misc` is not the last field to
be initialized.

To provide a safe way to access user-defined data stored next to the
`struct miscdevice`, make `MiscDeviceRegistration` into a container that
can store a user-provided piece of data. This way, `fops->open` can
access that data via the registration, since the data is stored inside
the registration.

The container enforces that the additional user data is initialized
before the miscdevice is registered, and that the miscdevice is
deregistered before the user data is destroyed. This ensures that access
to the userdata is safe.

For the same reasons as in commit 88441d5c6d17 ("rust: miscdevice:
access the `struct miscdevice` from fops->open()"), you cannot access
the user data in any other fops callback than open. This is because a
miscdevice can be deregistered while there are still open files.

A situation where this user data might be required is when a platform
driver acquires a resource in `probe` and wants to use this resource in
the `fops` implementation of a `MiscDevice`.

This solution is similar to the approach used by the initial downstream
Rust-for-Linux/Rust branch [0].

Link: https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/miscdev.rs#L108 [0]
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 rust/kernel/miscdevice.rs        | 79 ++++++++++++++++++++++++++++++----------
 samples/rust/rust_misc_device.rs |  4 +-
 2 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index b4c5f74de23d6f4fbcdebfe408d6954884609e8f..ad9fc0b2383860cb976c57a398f372280c19513c 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -9,7 +9,7 @@
 //! Reference: <https://www.kernel.org/doc/html/latest/driver-api/misc_devices.html>
 
 use crate::{
-    bindings,
+    bindings, container_of,
     device::Device,
     error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
     ffi::{c_int, c_long, c_uint, c_ulong},
@@ -20,6 +20,7 @@
     types::{ForeignOwnable, Opaque},
 };
 use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
+use pin_init::Wrapper;
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]
@@ -45,32 +46,46 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
 /// # Invariants
 ///
 /// `inner` is a registered misc device.
-#[repr(transparent)]
+#[repr(C)]
 #[pin_data(PinnedDrop)]
-pub struct MiscDeviceRegistration<T> {
+pub struct MiscDeviceRegistration<T: MiscDevice> {
     #[pin]
     inner: Opaque<bindings::miscdevice>,
+    #[pin]
+    data: Opaque<T::RegistrationData>,
     _t: PhantomData<T>,
 }
 
-// SAFETY: It is allowed to call `misc_deregister` on a different thread from where you called
-// `misc_register`.
-unsafe impl<T> Send for MiscDeviceRegistration<T> {}
-// SAFETY: All `&self` methods on this type are written to ensure that it is safe to call them in
-// parallel.
-unsafe impl<T> Sync for MiscDeviceRegistration<T> {}
+// SAFETY:
+// - It is allowed to call `misc_deregister` on a different thread from where you called
+//   `misc_register`.
+// - Only implements `Send` if `MiscDevice::RegistrationData` is also `Send`.
+unsafe impl<T: MiscDevice> Send for MiscDeviceRegistration<T> where T::RegistrationData: Send {}
+
+// SAFETY:
+// - All `&self` methods on this type are written to ensure that it is safe to call them in
+//   parallel.
+// - `MiscDevice::RegistrationData` is always `Sync`.
+unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
 
 impl<T: MiscDevice> MiscDeviceRegistration<T> {
     /// Register a misc device.
-    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
+    pub fn register(
+        opts: MiscDeviceOptions,
+        data: impl PinInit<T::RegistrationData, Error>,
+    ) -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
+            data <- Opaque::pin_init(data),
             inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
                 // SAFETY: The initializer can write to the provided `slot`.
                 unsafe { slot.write(opts.into_raw::<T>()) };
 
-                // SAFETY: We just wrote the misc device options to the slot. The miscdevice will
-                // get unregistered before `slot` is deallocated because the memory is pinned and
-                // the destructor of this type deallocates the memory.
+                // SAFETY:
+                // * We just wrote the misc device options to the slot. The miscdevice will
+                //   get unregistered before `slot` is deallocated because the memory is pinned and
+                //   the destructor of this type deallocates the memory.
+                // * `data` is Initialized before `misc_register` so no race with `fops->open()`
+                //   is possible.
                 // INVARIANT: If this returns `Ok(())`, then the `slot` will contain a registered
                 // misc device.
                 to_result(unsafe { bindings::misc_register(slot) })
@@ -93,13 +108,24 @@ pub fn device(&self) -> &Device {
         // before the underlying `struct miscdevice` is destroyed.
         unsafe { Device::as_ref((*self.as_raw()).this_device) }
     }
+
+    /// Access the additional data stored in this registration.
+    pub fn data(&self) -> &T::RegistrationData {
+        // SAFETY:
+        // * No mutable reference to the value contained by `self.data` can ever be created.
+        // * The value contained by `self.data` is valid for the entire lifetime of `&self`.
+        unsafe { &*self.data.get() }
+    }
 }
 
 #[pinned_drop]
-impl<T> PinnedDrop for MiscDeviceRegistration<T> {
+impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
     fn drop(self: Pin<&mut Self>) {
         // SAFETY: We know that the device is registered by the type invariants.
         unsafe { bindings::misc_deregister(self.inner.get()) };
+
+        // SAFETY: `self.data` is valid for dropping and nothing uses it anymore.
+        unsafe { core::ptr::drop_in_place(self.data.get()) };
     }
 }
 
@@ -109,6 +135,13 @@ pub trait MiscDevice: Sized {
     /// What kind of pointer should `Self` be wrapped in.
     type Ptr: ForeignOwnable + Send + Sync;
 
+    /// The additional data carried by the [`MiscDeviceRegistration`] for this [`MiscDevice`].
+    /// If no additional data is required than the unit type `()` should be used.
+    ///
+    /// This data can be accessed in [`MiscDevice::open()`] using
+    /// [`MiscDeviceRegistration::data()`].
+    type RegistrationData: Sync;
+
     /// Called when the misc device is opened.
     ///
     /// The returned pointer will be stored as the private data for the file.
@@ -178,18 +211,24 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         // SAFETY: The open call of a file can access the private data.
         let misc_ptr = unsafe { (*raw_file).private_data };
 
-        // SAFETY: This is a miscdevice, so `misc_open()` set the private data to a pointer to the
-        // associated `struct miscdevice` before calling into this method. Furthermore,
-        // `misc_open()` ensures that the miscdevice can't be unregistered and freed during this
-        // call to `fops_open`.
-        let misc = unsafe { &*misc_ptr.cast::<MiscDeviceRegistration<T>>() };
+        // This is a miscdevice, so `misc_open()` sets the private data to a pointer to the
+        // associated `struct miscdevice` before calling into this method.
+        let misc_ptr = misc_ptr.cast::<bindings::miscdevice>();
+
+        // SAFETY:
+        // * `misc_open()` ensures that the `struct miscdevice` can't be unregistered and freed
+        //   during this call to `fops_open`.
+        // * The `misc_ptr` always points to the `inner` field of a `MiscDeviceRegistration<T>`.
+        // * The `MiscDeviceRegistration<T>` is valid until the `struct miscdevice` was
+        //   unregistered.
+        let registration = unsafe { &*container_of!(misc_ptr, MiscDeviceRegistration<T>, inner) };
 
         // SAFETY:
         // * This underlying file is valid for (much longer than) the duration of `T::open`.
         // * There is no active fdget_pos region on the file on this thread.
         let file = unsafe { File::from_raw_file(raw_file) };
 
-        let ptr = match T::open(file, misc) {
+        let ptr = match T::open(file, registration) {
             Ok(ptr) => ptr,
             Err(err) => return err.to_errno(),
         };
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index c881fd6dbd08cf4308fe1bd37d11d28374c1f034..67a6172fbbf72dd42a1b655f5f5a782101432707 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -137,7 +137,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
         };
 
         try_pin_init!(Self {
-            _miscdev <- MiscDeviceRegistration::register(options),
+            _miscdev <- MiscDeviceRegistration::register(options, ()),
         })
     }
 }
@@ -157,6 +157,8 @@ struct RustMiscDevice {
 impl MiscDevice for RustMiscDevice {
     type Ptr = Pin<KBox<Self>>;
 
+    type RegistrationData = ();
+
     fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
         let dev = ARef::from(misc.device());
 

-- 
2.49.0

