Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72461CB9E2;
	Fri, 31 Jan 2025 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738336105; cv=none; b=ZCnJhpv6cWmoxhY5IJZAkSIfAaMZIikckl4FJS+MrZowJbaB8/O8Sp62gsSnq2RKnY0Sv0ji1fsc8lOQVRu/oQubv1MvtjaJtHxl92mq50sw/LxXtVArtr4iXFMN7jcc0zE0Uabh/WMPXRtoeKKY9bAtQHRhg1euPcxZ3MST1No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738336105; c=relaxed/simple;
	bh=W8rdcgHq5/Rf7UBuM1nuiKlm3EHoGb8E5wAEDaYy060=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i4l9ujxFdrjOvOc7Lxdvwt577o6Mwsh8Vo0BjPCuknHb09pIR05YV+7FQHyo2s7HnssNhjfEH20yWxCsDPO7RXewvBxyhkzssqSoskJnW3crQLy5wF1DjG05zDbsE3GMeHQiQsYRZbkfkUoxoyzkFz0yiXhfkVITLhhqJTQTK1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ejwnf5HY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ejwnf5HY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436341f575fso24616725e9.1;
        Fri, 31 Jan 2025 07:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738336101; x=1738940901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSI3MPyGhxbJgcp2M7J56C/nAlb1W0KmOXVx629dU8I=;
        b=Ejwnf5HYSM8SVNZnNqPSSu9ylLWzcGHClDtUn/KMOsYCJbhgE4YqjmxtpkswsfoVDV
         4iWjvGIu00X/Ni5PELd/qgBF4lqJUYooASiC5OwfjUymUMU51IlIwjjUyZkU09Iz4GnR
         DT45csN8wsB0Gq2arlM+azwZ0dZKmCW7syZ5JJRnttQWHaOBnOaPChvr1LgWYcdtMYBZ
         ypBcusvwDO/RsbrkNFRo71NfHTU2uAHeeRCJR0PHWs+LlT/A6Ahvqkm9Bv534KxXnYQM
         lJXYMj623p0LwJEMNeQC5loaBGfFtQzpkbsnCnORWmqHsdbXp0j3SdZwYN6JKCPMDFwU
         uEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738336101; x=1738940901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSI3MPyGhxbJgcp2M7J56C/nAlb1W0KmOXVx629dU8I=;
        b=C8NqVOEBWTN7MSzZbjzr3sxOuPeupFyLQcClxVlyMIUosNEbgF7DOH+vrpuI2lOPmw
         Pr7hCyorSXig/tEI6RFQvHdsBGy0PeuzYI33oYrtuRvDG9NbQXrr/zXWu+wVk8Bu4AWK
         YEwKB4WsrNBgxRATUoItX7Qd1jd5BxDhkijGED2GziKh+nmqnON4RnyZyxRXKrt+4H30
         6SqpNgkjfRJDzp6C04MjeZLdCFH3jq4opvT+N4H738U/Tfs+xiyefV6tXM7vlIaWsbUL
         4sV9XS/XBZyVlSspySALdVo/kSUQhBuqCVY8oee3HyxS0TBPFxB4T3NHwEIH0AJ7H2vE
         IH/w==
X-Forwarded-Encrypted: i=1; AJvYcCVeR9SZelI/hsfLBTxWWG/gtJGWDQlo/Ag18iwEoMzwBgYJTnx8DAWufAd2ODLcm8EIezNtze+BG9qPifg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6GCl1+O44umRR+qxMrcjCiP1van8LgiPGuXltAZqMXuZqWYma
	4cE/TEZ9cuzn5d2HE0A7iiWN6SMuG4/srQgfwVW02o+558eha8rg
X-Gm-Gg: ASbGncuvqku1AmbpqvNPAP1p2c1+NPxurX8hSzR/N0412fGiEBybfQzIS0FjhWI9TGv
	BN556Dc+U3Tb5Jq9fwSA/saKGfUvsMoncxo/M2sJrEehX82HzvzWyTOS010nmeRGWDm4aBHKSC7
	vBm48Hgmbmu8MiXFiihr9wIEbNCL6YEChhgz60CeUSGmxXBELJriNtaj4jCOY2nAgdqLKutnWnH
	opPnu+RPwI1d4vR+8Rhpxp/prCWSoiSk62vir9UPRe9nqtWyXUfU0V91DqC696Cq2s2RBovB7Mw
	Huo=
X-Google-Smtp-Source: AGHT+IEaCswwNDE2SOSBhu9ihG4LrOpHUGeefehrkNEftWLqTsrp0tSb1RKUn/hLMQ97D0QAtlw+mQ==
X-Received: by 2002:a05:600c:19cc:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-438e298fea7mr70953285e9.4.1738336100809;
        Fri, 31 Jan 2025 07:08:20 -0800 (PST)
Received: from [10.0.1.56] ([2001:871:22a:8634::1ad1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c102f7dsm4961479f8f.30.2025.01.31.07.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:08:20 -0800 (PST)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Fri, 31 Jan 2025 16:08:15 +0100
Subject: [PATCH v2 2/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-b4-rust_miscdevice_registrationdata-v2-2-588f1e6cfabe@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738336097; l=10315;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=W8rdcgHq5/Rf7UBuM1nuiKlm3EHoGb8E5wAEDaYy060=;
 b=+z7mE0TlK6JU51Avl4PgapoQ3g/LJ+nrDcTZspfyWmhFL5tx2LUgcmgA6oFHv+pdPTVe/G+VE
 ldXShgxeiHOC8D3HvoamRS6FB6VuJO8eh/J65jBXjG9HRF7+ww+ZwEV
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
 rust/kernel/miscdevice.rs        | 75 +++++++++++++++++++++++++++++-----------
 samples/rust/rust_misc_device.rs |  4 ++-
 2 files changed, 58 insertions(+), 21 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index e14433b2ab9d8fa391474b2ad7e3ed55c64b4d91..dea7d8d1a0366cf2243c7a3888ebfb8a90d6295c 100644
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
@@ -17,7 +17,7 @@
     prelude::*,
     seq_file::SeqFile,
     str::CStr,
-    types::{ForeignOwnable, Opaque},
+    types::{ForeignOwnable, Opaque, UnsafePinned},
 };
 use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
 
@@ -45,32 +45,46 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
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
+    data: UnsafePinned<T::RegistrationData>,
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
+            data <- UnsafePinned::try_pin_init(data),
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
@@ -93,10 +107,18 @@ pub fn device(&self) -> &Device {
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
@@ -109,6 +131,13 @@ pub trait MiscDevice: Sized {
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
@@ -211,17 +240,23 @@ impl<T: MiscDevice> VtableHelper<T> {
     // SAFETY: The open call of a file can access the private data.
     let misc_ptr = unsafe { (*raw_file).private_data };
 
-    // SAFETY: This is a miscdevice, so `misc_open()` set the private data to a pointer to the
-    // associated `struct miscdevice` before calling into this method. Furthermore, `misc_open()`
-    // ensures that the miscdevice can't be unregistered and freed during this call to `fops_open`.
-    let misc = unsafe { &*misc_ptr.cast::<MiscDeviceRegistration<T>>() };
+    // This is a miscdevice, so `misc_open()` sets the private data to a pointer to the
+    // associated `struct miscdevice` before calling into this method.
+    let misc_ptr = misc_ptr.cast::<bindings::miscdevice>();
+
+    // SAFETY:
+    // * `misc_open()` ensures that the `struct miscdevice` can't be unregistered and freed
+    //   during this call to `fops_open`.
+    // * The `misc_ptr` always points to the `inner` field of a `MiscDeviceRegistration<T>`.
+    // * The `MiscDeviceRegistration<T>` is valid until the `struct miscdevice` was unregistered.
+    let registration = unsafe { &*container_of!(misc_ptr, MiscDeviceRegistration<T>, inner) };
 
     // SAFETY:
     // * This underlying file is valid for (much longer than) the duration of `T::open`.
     // * There is no active fdget_pos region on the file on this thread.
     let file = unsafe { File::from_raw_file(raw_file) };
 
-    let ptr = match T::open(file, misc) {
+    let ptr = match T::open(file, registration) {
         Ok(ptr) => ptr,
         Err(err) => return err.to_errno(),
     };
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 40ad7266c2252e5c0b4e91e501ef9ada2eda3b16..779fcfd64119bdd5b4f8be740f7e8336c652b4d3 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -136,7 +136,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
         };
 
         try_pin_init!(Self {
-            _miscdev <- MiscDeviceRegistration::register(options),
+            _miscdev <- MiscDeviceRegistration::register(options, ()),
         })
     }
 }
@@ -156,6 +156,8 @@ struct RustMiscDevice {
 impl MiscDevice for RustMiscDevice {
     type Ptr = Pin<KBox<Self>>;
 
+    type RegistrationData = ();
+
     fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
         let dev = ARef::from(misc.device());
 

-- 
2.48.1

