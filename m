Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66824265CA0;
	Tue, 10 Jun 2025 20:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749587286; cv=none; b=E5dlDaEAkBMpk4ljDczP7Cj3utZO0p0w+xX89Pe5KyCNxC/MPwrkv4/z7KMe026EPTqTtCGfFXwixfir11/We9hpsuQToi6IczEPiyOr85lXMzV7INwpFH9cu+ytHKQFgzRRUvMPUfD0KLqsMjvjVClhLU6umOuq++2livBGg5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749587286; c=relaxed/simple;
	bh=K4RhgZE/wYQmP+QbXOufjRK7BPcv3S+aCV2ZQpi/RyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DfSzxU7zWsBJEIDPMMzNdLSXfO87kAcgb/DmP15ZY9/BofQam9CoCugtUytmV9j2Fd5cavi4EES3eiS100kt2LOqNI+0cwgcqTSF17QL3MoKbXAkSrXqUw1kz9tS1E59BmbcVKv6/5NlGORZZKwToJOPlcQzKwxrC2bFUzeZGek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7TY/HhP; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7TY/HhP"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo7286661a12.3;
        Tue, 10 Jun 2025 13:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749587283; x=1750192083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByIM0SqwrqaZQqOesQau4CN4JmNVKP7t3Qu2vIl6D+M=;
        b=Z7TY/HhPUBlqv1UYwuuQujjy9hsy6suREh0VinWXpOyNZaYwL+xK2coIEioJjNPHjo
         1IbaI3uMQP5brIIYfPzS5qLiEs0CdqwvGMKTxJD73E4OJQOGBVopRd3WbmpnE0U7z9um
         deNNuvm4yzdWITPmcX7Gupo7b5BJZQZ+yrllVZEMbDdEGjLqxQtsKwEuKayE3MMW3hpp
         z9B2qmOz4UHPdZ8WwXCGrx1apB9/tt6ZQOtVSPn1hePb27Ze/yiNhkNBLiE1e7v68QEF
         eDys7VV3l4eiX+IltJTNQNjtLV0hCxrc3qFDRNC1Cf5PhgCbtQ2ybrKrQ0+vWoSrqyJy
         +gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749587283; x=1750192083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByIM0SqwrqaZQqOesQau4CN4JmNVKP7t3Qu2vIl6D+M=;
        b=GO9FL2VoGxdwu1jUtK76slntL9jaOb9cnxJ+LRpcVFlX62/oyFLqY/K/sDcA297ugd
         oNB7F/Zw2pYmuwJNw3WH4S0shmOX1fXekBxCfx/46LAXC6yGl9ilLgLRHeNNc3+2wq08
         mDtEfKAi/QZkJY3/xZYBG05H1Pd6w7Fkz+4hjGqrhlYEzxBCJFo8hAFumeqFBeTjmDTv
         TeRtCInE/x5tnmedqTQrYohjUW4l4CMEaBzO1XMxTvD8kxZnP52aGhIxqALEMsvQXQmk
         l4pDWhNUTzq9clPc+GfVy/7l+rwSjVUyAn02pDErJqjc2lbJdrxQDy4Rvy+21rgZ/Qxj
         rAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzEHgQQuz7wO3AfVtCuQPLcQ0lsLwuOdfYTBAcjKLT2kpUYwJRSPoomw6l3q24KngnlUIy4EllFT1mAYE=@vger.kernel.org, AJvYcCXWuXYDT/pKtz5r7JZ3/e47fPBgpnyEchvF1AzXYbTjvGEaNzuQR9Mrnz1pC1Uv01MOE6vbYqht52Uts/jYB6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhYh0ei/QMzief5SM5ZD6CFQH0Ljq/vll9u4Xb0GVMmaejqG/L
	BsrJEVs4bCzdCBa+PNS3X66yKle/BOYDVak1biT5lmxWGH4amGSTxu35
X-Gm-Gg: ASbGncvX2OAtyqMnpViha3Zk/yipKCvZ7kS3KKTvgLJB8+1DJi1Zoi+AfDg/5wjpeDh
	nvVYwXhgJuOwkOtSbAumAcDPVuUxcT233fcBZgdFp6DqnzYqP97ukxlhmZ/MnLmQTrS/blqVRjr
	BGm27QjAOHoBH2mvdusZkT0EgDnJrVc/getV/VN9Ia9dEjtWe+Jftq0IISVJ6i/1l+D5VPfnUda
	e8EYziGaYLDSZC2+/oLkCFErepKHs6fit8DAjbaUHJ2LPboOgyzgg96/VPTyhkQAJOanFSHU3bR
	lOHmD0f6/6fMPMVIm8q06+NFfVGbBOlQfYjxF8OwU8OOt6PlDreKUJ/3fJymn6Id0421wEE=
X-Google-Smtp-Source: AGHT+IGr77VP/Ma9Z1hcbN/HIgnqWYmRyulvY+7lK2QE/njA2IDND7OEc/5wwflwbu3he4cH/ycIuw==
X-Received: by 2002:a05:6402:524c:b0:602:e46:638 with SMTP id 4fb4d7f45d1cf-60846cf0c7emr449756a12.26.1749587282265;
        Tue, 10 Jun 2025 13:28:02 -0700 (PDT)
Received: from [10.5.1.156] ([193.170.134.247])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-607783e67efsm6552678a12.78.2025.06.10.13.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:28:02 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Tue, 10 Jun 2025 22:27:56 +0200
Subject: [PATCH v6 2/3] rust: miscdevice: add additional data to
 `MiscDeviceRegistration`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-rust_miscdevice_registrationdata-v6-2-b03f5dfce998@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749587279; l=12398;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=K4RhgZE/wYQmP+QbXOufjRK7BPcv3S+aCV2ZQpi/RyI=;
 b=VvGfVxZJKhKHRjSP9TQtrKEirJgNsguVLWOtcQPxFV3ypHVQjzyd7875kJwU8b/YSwyTH4ewA
 BrBuced3blCB1oYrz0coPQuqFHa6Q7yEcC9wlXTATYthrb+9+JDXU7Q
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
 rust/kernel/miscdevice.rs        | 104 +++++++++++++++++++++++++++++----------
 samples/rust/rust_misc_device.rs |   4 +-
 2 files changed, 82 insertions(+), 26 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 939278bc7b03489a647b697012e09223871c90cd..8daf3724b75068c998cb361eac38f43a39884b0c 100644
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
@@ -21,6 +21,7 @@
     types::{ForeignOwnable, Opaque},
 };
 use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
+use pin_init::Wrapper;
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]
@@ -31,7 +32,10 @@ pub struct MiscDeviceOptions {
 
 impl MiscDeviceOptions {
     /// Create a raw `struct miscdev` ready for registration.
-    pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
+    pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice
+    where
+        T::Data: Sync,
+    {
         // SAFETY: All zeros is valid for this C type.
         let mut result: bindings::miscdevice = unsafe { MaybeUninit::zeroed().assume_init() };
         result.minor = bindings::MISC_DYNAMIC_MINOR as _;
@@ -45,38 +49,55 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
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
+        T::Data: Sync,
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
 
@@ -94,13 +115,24 @@ pub fn device(&self) -> &Device {
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
 
@@ -110,6 +142,13 @@ pub trait MiscDevice: Sized {
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
@@ -180,7 +219,10 @@ fn show_fdinfo(
 /// A vtable for the file operations of a Rust miscdevice.
 struct MiscdeviceVTable<T: MiscDevice>(PhantomData<T>);
 
-impl<T: MiscDevice> MiscdeviceVTable<T> {
+impl<T: MiscDevice> MiscdeviceVTable<T>
+where
+    T::Data: Sync,
+{
     /// # Safety
     ///
     /// `file` and `inode` must be the file and inode for a file that is undergoing initialization.
@@ -195,18 +237,30 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
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
+        //   `T::Data: Sync` bound,  `MiscDeviceRegistration<T>` is Send if `T::Data: Sync` and is
+        //   the only way to create a `MiscDeviceRegistration`. This means that a reference to it
+        //   can be shared between contexts.
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

