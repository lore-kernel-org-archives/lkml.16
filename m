Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644BB21CA03;
	Sat,  7 Jun 2025 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749298077; cv=none; b=k5zPpmtrccX9gy9PFCjNxzhIa6JoSRSaer7kHCKLJ4XQiBCFXdFD9bKmBH4f9cUyxRUAux/I2wt67ehVkB6vnGt553gWKVqRdZYRAMRhIrroMBcJhRtZBNRTs7ARV0NDtX/xj6c1D5ppQ2jtYOZXa4URz5OgjbZVLrH7zq/dCeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749298077; c=relaxed/simple;
	bh=GL3nRSHbsTV87E5n/f46m8vlJIIIzFEhUXcuWfSf1dM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzaEahuSaQGDwJbZ5jGdcTgOc5umLS5rhoBnwJ2ckCg+Zrh3p+zSy3B5Y/1tKE/yn6bOvFKCvpTOD5C7t9U0P5TPeO8dAy4FQorG/UIU/Ilfp2B1KEB/M/+qVsNnNM9H72i9Irdsz/PcymrBuqkyVuFHikJRcbdkh4QsbPxfWBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETY+UU1q; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETY+UU1q"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so2476544f8f.1;
        Sat, 07 Jun 2025 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749298073; x=1749902873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZAIPeOGdi6pfv+NA6DzdyEVVOCz9njuOHR0OKp/r98=;
        b=ETY+UU1qcO4zSCdrpr1WQgQlxZn37wrvEnW+vXcn+bSlIwT7RTaJkpMbWck6NgjmSU
         +aDoyV3R2w+DShEjHeNW/UhU1ZXyRpjg0eIdqs1zI9azJvYffj81XaFB68maHVa/KLg1
         wb9YOV15e7qpQFF55svOEeXaRR1XpYzAh/c6dkKqFb3J764cdXJqKYT5EEA77p3UE6js
         +a3QkUzz1ENUBukma7BwILduKBUF7JgCTFDxhSyWIG2Y8+cb0h1pK4xa7GOryJH6fSi4
         pbhktt+3dsP92Yj4gVvrSj6OTHhRymV0e7eObrYlLgBuW7l+h5QCOlC16mY1h6Nag5fZ
         OVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749298073; x=1749902873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZAIPeOGdi6pfv+NA6DzdyEVVOCz9njuOHR0OKp/r98=;
        b=WYHxrcdhvj0u5BYqQCmHjnI2zRTO1nHjtpn0QODitLwoHIISFocGvObsPZnZfcym6P
         YeXNh/F5TrjeHwZ0IVJu0j08IhAKOvezjXAFVlJSXs5K/UF0m8TgleozfT5kSPeNHB3N
         l4j74ycLmN2rEFzmNZZrXg/9CPqmIrIoW34/23LcR2OLa6iou7FbyG1wLb4mKPAZRGhW
         PnRfemIfiJj2YvfEJvNHI4hYGUXQm0ICxp4BKqHIHj16qxFGEPu8yCjKPlmPlXrGkmQ3
         98lGVamZRmJtapYrS/N5whpZNd2mPml5YnA5MaAd5bTnfxtmNskmK8v/KYLuF9tfEkcv
         ccNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4XqdpfkEWt5f6Go1lS83tfmvLBHPfnjK2WqvBAcUukr7tuc3Aqvnx2A8hOgfwVC9N8l8OJtcqC8t0rbGgRtU=@vger.kernel.org, AJvYcCVYVHhEd6vNVLqDGaEhyH4vTP3252P0TWNVB1sz2mifsCqM21ZBUVAJMWOnOKaief5rcKCw4qk6aeSCtfA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7pFJl39dUG3NmOp79QkGaf72jxDvi8BB9Xvr2ssknEeDvYuwt
	CJpj20RynsskxCvUJjhRpMjKRqTag9lqL3ZdJ4NrfUwx2/NtA6swtB/wK2KRNQ==
X-Gm-Gg: ASbGncvFoqgiio50n0kv6XS44oEPPnag46432QM3vKaLDBNeBrLiwHwWxSl+sNwZery
	yEdDn3d5vzf2ooG/bzGvSu3AvUIDeekU8ZoA6Lrj4v3SoSTro08CJJgAcu4PZEsg1n5KRMMxyvN
	TyKEoZP1jA1HxmSHYYj0rrPvqLvkGmGJvR9mAOUnQetyZIOlMxsx/j2dA/Fwr8ZAVIUzqOJywgx
	jGj1JMpiuRMxisQpLtM9ACM9mTFRh3vrU8RX8U2mB99ySgJ2NMCtMpWQLkhhUd75M//0uFC4AMW
	YY7qjcnmpXnWAjKOF27Md2WOY51vAV6f7BiMXdyt
X-Google-Smtp-Source: AGHT+IFxKGtLgmLTwnQWNI7W1safsQA4a5mTr54LGj722R/LF3kN6ne0v9oBxSevtuh3zCW9hunutw==
X-Received: by 2002:a05:6000:230c:b0:3a5:2ef8:34f9 with SMTP id ffacd0b85a97d-3a5319a0d8bmr5652350f8f.27.1749298073169;
        Sat, 07 Jun 2025 05:07:53 -0700 (PDT)
Received: from [10.0.1.160] ([2001:871:22a:3372::171c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm4538965f8f.91.2025.06.07.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 05:07:52 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sat, 07 Jun 2025 14:07:31 +0200
Subject: [PATCH v5 2/3] rust: miscdevice: add additional data to
 `MiscDeviceRegistration`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-b4-rust_miscdevice_registrationdata-v5-2-b77b5b7aab5b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749298070; l=11357;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=GL3nRSHbsTV87E5n/f46m8vlJIIIzFEhUXcuWfSf1dM=;
 b=PXSXIKCELGk+v/PlMRqpjQNrM/Sc3YfcydF9g78Wq+2vel/MW/fKs8rj/Q79O50PwOixvd3Fs
 M/ZZv8QcXnEAR1ZnRoo2dt/CTygbQRMKZBMkLAbw05RkrFap9Q1Qr7C
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
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 rust/kernel/miscdevice.rs        | 93 ++++++++++++++++++++++++++++++----------
 samples/rust/rust_misc_device.rs |  4 +-
 2 files changed, 73 insertions(+), 24 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index b4c5f74de23d6f4fbcdebfe408d6954884609e8f..92b1b39c9728c7f18cc1ea3bd26839664600f9df 100644
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
@@ -44,38 +45,55 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
 ///
 /// # Invariants
 ///
-/// `inner` is a registered misc device.
-#[repr(transparent)]
+/// - `inner` is a registered misc device.
+/// - `data` contains a valid `T::Data` for the whole lifetime of [`MiscDeviceRegistration`]
+/// - `data` must be valid until `misc_deregister` (called when dropped) has returned.
+/// - no mutable references to `data` may be created.
 #[pin_data(PinnedDrop)]
-pub struct MiscDeviceRegistration<T> {
+pub struct MiscDeviceRegistration<T: MiscDevice> {
     #[pin]
     inner: Opaque<bindings::miscdevice>,
-    _t: PhantomData<T>,
+    #[pin]
+    data: Opaque<T::Data>,
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
+// - Only implements `Send` if `MiscDevice::Data` is also `Send`.
+unsafe impl<T: MiscDevice> Send for MiscDeviceRegistration<T> where T::Data: Send {}
+
+// SAFETY:
+// - All `&self` methods on this type are written to ensure that it is safe to call them in
+//   parallel.
+// - Only implements `Sync` if `MiscDevice::Data` is also `Sync`.
+unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> where T::Data: Sync {}
 
 impl<T: MiscDevice> MiscDeviceRegistration<T> {
     /// Register a misc device.
-    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
+    pub fn register(
+        opts: MiscDeviceOptions,
+        data: impl PinInit<T::Data, Error>,
+    ) -> impl PinInit<Self, Error>
+    where
+        Self: Sync,
+    {
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
             }),
-            _t: PhantomData,
         })
     }
 
@@ -93,13 +111,24 @@ pub fn device(&self) -> &Device {
         // before the underlying `struct miscdevice` is destroyed.
         unsafe { Device::as_ref((*self.as_raw()).this_device) }
     }
+
+    /// Access the additional data stored in this registration.
+    pub fn data(&self) -> &T::Data {
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
+        // SAFETY: `self.data` contains a valid `Data` and does not need to be valid anymore.
+        unsafe { core::ptr::drop_in_place(self.data.get()) };
     }
 }
 
@@ -109,6 +138,13 @@ pub trait MiscDevice: Sized {
     /// What kind of pointer should `Self` be wrapped in.
     type Ptr: ForeignOwnable + Send + Sync;
 
+    /// Additional data carried by the [`MiscDeviceRegistration`] for this [`MiscDevice`].
+    /// If no additional data is required than the unit type `()` should be used.
+    ///
+    /// This can be accessed in [`MiscDevice::open()`] using
+    /// [`MiscDeviceRegistration::data()`].
+    type Data;
+
     /// Called when the misc device is opened.
     ///
     /// The returned pointer will be stored as the private data for the file.
@@ -178,18 +214,29 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         // SAFETY: The open call of a file can access the private data.
         let misc_ptr = unsafe { (*raw_file).private_data };
 
-        // SAFETY: This is a miscdevice, so `misc_open()` set the private data to a pointer to the
-        // associated `struct miscdevice` before calling into this method. Furthermore,
-        // `misc_open()` ensures that the miscdevice can't be unregistered and freed during this
-        // call to `fops_open`.
-        let misc = unsafe { &*misc_ptr.cast::<MiscDeviceRegistration<T>>() };
+        // This is a miscdevice, so `misc_open()` sets the private data to a pointer to the
+        // associated `struct miscdevice` before calling into this method.
+        let misc_ptr = misc_ptr.cast::<Opaque<bindings::miscdevice>>();
+
+        // SAFETY:
+        // * `misc_open()` ensures that the `struct miscdevice` can't be unregistered and freed
+        //   during this call to `fops_open`.
+        // * The `misc_ptr` always points to the `inner` field of a `MiscDeviceRegistration<T>`.
+        // * The `MiscDeviceRegistration<T>` is valid until the `struct miscdevice` was
+        //   unregistered.
+        // * `MiscDeviceRegistration<T>` is `Send` since `MiscDeviceRegistration::register` has a
+        //   `Self: Send` bound and is the only way to create a `MiscDeviceRegistration`. This
+        //   means that a reference to it can be shared between contexts.
+        // TODO: add `assert_sync` for `MiscDeviceRegistration<T>` and
+        // `MiscDeviceRegistration<T>::Data`.
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
index c881fd6dbd08cf4308fe1bd37d11d28374c1f034..c0b912920d6c4b60e747d9d298900ad64df67339 100644
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
 
+    type Data = ();
+
     fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
         let dev = ARef::from(misc.device());
 

-- 
2.49.0

