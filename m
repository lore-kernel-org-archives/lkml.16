Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697EF1DED57;
	Sat, 17 May 2025 11:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747481644; cv=none; b=o5gCHELODLh3ep9IRQ3HBIbiZW//DfG1cL0SVHOYXgebiqiReXFvcHTVjeKBEtQCCKuMzsbpjUZJlzmgk/vrdyJUFFfK5ZqnBJauXeDmWDn26MDqaMnOYl17nl8BOtgNFyjKLd7P2Ts4a9yf4gwo3AvHxg23bldtm3svKDmQNR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747481644; c=relaxed/simple;
	bh=7UnfGbbqNBT0k66kKZEEWip4gtnjO4DXdvTjt2YVumM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YxzPqJhA4p+Gs3yqGJ4IAZUj5iLH/B0Yd4XKlZblboPMFRfreUm5v/m+csJ1sDRlLhBZ9ZfLTLAUdi8WEqprXTcNL5RPiBu6ZDlKI1BdpJFpPmtS4PZTLUMGG1mHg83EdFDcNS+KIv8otjOxGju3RjIJACBB99Qx2G5JgRuJC1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmBAmLQw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmBAmLQw"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so21886285e9.1;
        Sat, 17 May 2025 04:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747481641; x=1748086441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84Sl4OeuETAgiwkhvubv8fwPDmyhMaW2fHPygio76aE=;
        b=XmBAmLQwN6FihT/kBA1UoRqukRxXed8cOxp7nwDO4NLzWp/6fNzM1PfjLm6kIIeh9r
         0wvg06K8zbLWFLzTgXuef3fDBXQyEntTIpsfwpU1BqxXA2Uqrxt/v/pzquANxZ+lC/Jc
         iDkciZqfSU3We90Jr8oMBPFZN7+52Oole23Y16jrzO5cHntkolO3lUNgqveLdgEXdAXG
         8JB84zGKWc355F19tNUTNL/7Ti6GcSDMhDMovKxwd+sJFm5FGUOniG3DbrN59G39bApR
         sbHSoqgKPZPtolPJSatRufpDsHrTEpAGZm0ddgwxPeh7z/xkE+pR2oy2dEx0MyIRe4d2
         RVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747481641; x=1748086441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84Sl4OeuETAgiwkhvubv8fwPDmyhMaW2fHPygio76aE=;
        b=ijWJEXsioxcHwFUUZ9SqTOnoQyTUqyiCWvCmhDo42FowRA0zfCwhxobWik1JU+V9NR
         vXfCoKEC7u8wQYot4Qke6zQ44hqTiL3F74I5YByRSz7/nG0So1uzcVUTotj44zQAfuE7
         1VEL3/bDCfgUtcG4CWX7Ygv1KglfiNVGZ66ZKfBYvoYFc+XEbQC8t3YwBMuR8/yT+QG4
         +F5fAINdmVba3Ptr4T3cXl967ibsxIc9xnpX9IUVupLsgNEy8Xuh0O4fqu0OM0OHuMQo
         Z7RP/pC5RgjVrMlgXlFOpdAuyEseVL1f7lvfNw8S6BdyPrte18M0RdQW2XGOm0ANLBlY
         5BOw==
X-Forwarded-Encrypted: i=1; AJvYcCVE76Ybv3/K0QXNdWrOIvz/roYnzyUkgD5eXnPGUM7KyGCEQ2D3tj6HEKJDEQsVBfN69SL7+H2oyq26t7c=@vger.kernel.org, AJvYcCXFDFRwYrKMOWT2ZFKabJIv5r9dR85CDB/qqody82iSQGakeo2uzggMIevfEA3Qd5Ee7lOTYxVJkQEOLSGE4+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH4AGv3UOV/vCPrabY6OFDarKP1JHXMp1pmoYBc1vdAEaFxku2
	omRuRIrC50SzokrPvWN9lHxisd1Wx77LNNYF1lgW/v8UP46VJs4y8hn4clZCUw==
X-Gm-Gg: ASbGncvB0uNdbnDHJy8yCPWVyeJQvx17mqtlXmZjQIqbVG6nXv/JW9ieGohDBzFgoIc
	lUTPdD+KZlEzHlEMMszKAC6Kz4hgnhkugszFxdek1hXA69jGD/yL7h/OrGNVA7PPlIVeFuZOK3V
	sGxRPgd7wIonTaQrBxvCHfDDRQMwlrjaZML5D3X8yiTaPmE91qkuVkvPnB1MSAEsdZyVcpbkzHW
	kw7wRS9gSRAX8gHBlahuoWtajN93yQ0SeIUrquFV5U3M3XNbf4dGdwiPzW5NlB0fELBkqfnzZ+k
	Q1bhN1qVqBb7dtqiejkKYL3LoYfq9mfC+DxWISk=
X-Google-Smtp-Source: AGHT+IGglf9WqFb1kQQTgP2hMdlNjj3IGRSlE3BEkEUrQGwKZlWbKtPzZCYH9hgdUFYxKji0DxlvuQ==
X-Received: by 2002:a05:600c:8709:b0:43b:ca8c:fca3 with SMTP id 5b1f17b1804b1-442fd97a524mr68792935e9.11.1747481640373;
        Sat, 17 May 2025 04:34:00 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::171c])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f3951854sm137017265e9.24.2025.05.17.04.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 04:34:00 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sat, 17 May 2025 13:33:49 +0200
Subject: [PATCH v3 1/2] rust: miscdevice: add additional data to
 MiscDeviceRegistration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-b4-rust_miscdevice_registrationdata-v3-1-cdb33e228d37@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747481638; l=10532;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=7UnfGbbqNBT0k66kKZEEWip4gtnjO4DXdvTjt2YVumM=;
 b=XfhwtD9ej/MWi3UA/PO1gbQ6lq9Ue3HJedd1TrYxFatKVT5epEQFmi8imco63LimUu3PSfyEZ
 0q2nAP2xiE0BXxAvKYT5VcsQk8hNcFg6P3ME5zK8MsyDdlxc2SXLETW
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
 rust/kernel/miscdevice.rs        | 78 +++++++++++++++++++++++++++++-----------
 samples/rust/rust_misc_device.rs |  4 ++-
 2 files changed, 60 insertions(+), 22 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index fa9ecc42602a477328a25b5d357db90b59dc72ae..43cb8b1ce4a2f112a7cab73a3d126845887833ad 100644
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
@@ -17,9 +17,10 @@
     prelude::*,
     seq_file::SeqFile,
     str::CStr,
-    types::{ForeignOwnable, Opaque},
+    types::{ForeignOwnable, Opaque, UnsafePinned},
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
+            data <- UnsafePinned::pin_init(data),
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
@@ -93,10 +108,18 @@ pub fn device(&self) -> &Device {
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
@@ -109,6 +132,13 @@ pub trait MiscDevice: Sized {
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
@@ -178,18 +208,24 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
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

