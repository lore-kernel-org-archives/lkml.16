Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B146D23185E;
	Fri, 30 May 2025 14:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615114; cv=none; b=RDTrEleNW7PoOfxV//WKSNzmyrm+lIF8VdlPhJ8C8soCp7d9ro7YwCi/8inaDseeOxBmZVDm0giG99/CWL5mQozblMUfu48PVPoFmAY4sz44IIbaF206+jTk9wxp530UxpQBCtCeybD1Ewfz3RHqIQHg6GYnnbym/75n8mWCmbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615114; c=relaxed/simple;
	bh=/FS337mlfnfbT9rDew2hnOmZCU3j3SocUNkSjBQrmy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTDaVcuBj/4kACEfZFbBYNoSiy89/9ZeubIPbn/DFpDKJxkyk1UxJS6blNyKNFusLbdnQM7WmjIj98+HvaM/LAKNoun1JcUh6lE6Xi1RwUTpjUj0S24U4nKZxgi/V8f6We2Nq96YLMSW5xppY9SWZg7buoPHa/K5q6x95XsBxGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYb5U21V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYb5U21V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB51C4CEF0;
	Fri, 30 May 2025 14:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748615114;
	bh=/FS337mlfnfbT9rDew2hnOmZCU3j3SocUNkSjBQrmy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QYb5U21Vj8yNFJKouYdsy8bDCT7jpQjjOjbYqNASe+hgbiA7D41/4ryFV0xFTZ3sf
	 w7gZcYpmlf/Dc6wnq6itpw/r29qIN4rhs++vt74M/i4pa3KZJC31e+kcRpYuDz39FD
	 eXKvb9ekc1m4rm+A3plKY6OoCJ9po/Ijjq1HYj/kt95QMtjCXGZHw+mjDUSfORH+cV
	 bwTOQkkf+OUnJulMMH7VjOAwrPGMb0MWc417FTiUcJNXm2ndk02XKg9ADzlmWNS8at
	 GU0g0OXV5IkG86r2sE5YwmrLgHZ67PPbCpHd6PGpYIj/Md3PGNCfyn1V/UUO4keQw0
	 YEDBKCL+esLKw==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	chrisi.schrefl@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 6/7] rust: miscdevice: expose the parent device as &Device<Bound>
Date: Fri, 30 May 2025 16:24:19 +0200
Message-ID: <20250530142447.166524-7-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530142447.166524-1-dakr@kernel.org>
References: <20250530142447.166524-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the misc device abstraction design considers device drivers,
take advantage of the fact that we can safely expose the parent of the
misc device as &Device<Bound> within the misc device's file operations.

Drivers can use this bound device reference to access device resources
without additional overhead through Devres::access().

Expose the &Device<Bound> parent, the &Device representation of the misc
device and the registration data through a new type MiscArgs through the
MiscDevice callbacks.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/miscdevice.rs        | 173 ++++++++++++++++++++-----------
 samples/rust/rust_misc_device.rs |  20 ++--
 2 files changed, 128 insertions(+), 65 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 6801fe72a8a6..937d0945d827 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -18,7 +18,7 @@
     prelude::*,
     seq_file::SeqFile,
     str::CStr,
-    types::{ARef, ForeignOwnable, Opaque},
+    types::{ARef, Opaque},
 };
 use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin, ptr::NonNull};
 
@@ -51,6 +51,7 @@ struct RawDeviceRegistration<T: MiscDevice> {
     #[pin]
     inner: Opaque<bindings::miscdevice>,
     data: NonNull<T::RegistrationData>,
+    private: Opaque<T::Ptr>,
     _t: PhantomData<T>,
 }
 
@@ -67,6 +68,7 @@ fn new<'a>(
             // INVARIANT: `Self` is always embedded in a `MiscDeviceRegistration<T>`, hence `data`
             // is guaranteed to be valid for the entire lifetime of `Self`.
             data: NonNull::from(data),
+            private: Opaque::uninit(),
             inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
                 let mut value = opts.into_raw::<T>();
 
@@ -227,11 +229,21 @@ fn drop(self: Pin<&mut Self>) {
     }
 }
 
+/// The arguments passed to the file operation callbacks of a [`MiscDeviceRegistration`].
+pub struct MiscArgs<'a, T: MiscDevice> {
+    /// The [`Device`] representation of the `struct miscdevice`.
+    pub device: &'a Device,
+    /// The parent [`Device`] of [`Self::device`].
+    pub parent: Option<&'a Device<Bound>>,
+    /// The `RegistrationData` passed to [`MiscDeviceRegistration::register`].
+    pub data: &'a T::RegistrationData,
+}
+
 /// Trait implemented by the private data of an open misc device.
 #[vtable]
 pub trait MiscDevice: Sized {
     /// What kind of pointer should `Self` be wrapped in.
-    type Ptr: ForeignOwnable + Send + Sync;
+    type Ptr: Send + Sync;
 
     /// The additional data carried by the [`MiscDeviceRegistration`] for this [`MiscDevice`].
     /// If no additional data is required than the unit type `()` should be used.
@@ -242,12 +254,7 @@ pub trait MiscDevice: Sized {
     /// Called when the misc device is opened.
     ///
     /// The returned pointer will be stored as the private data for the file.
-    fn open(_file: &File, _misc: &Device, _data: &Self::RegistrationData) -> Result<Self::Ptr>;
-
-    /// Called when the misc device is released.
-    fn release(device: Self::Ptr, _file: &File) {
-        drop(device);
-    }
+    fn open(_file: &File, _args: MiscArgs<'_, Self>) -> Result<Self::Ptr>;
 
     /// Handler for ioctls.
     ///
@@ -255,7 +262,8 @@ fn release(device: Self::Ptr, _file: &File) {
     ///
     /// [`kernel::ioctl`]: mod@crate::ioctl
     fn ioctl(
-        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _args: MiscArgs<'_, Self>,
+        _device: &Self::Ptr,
         _file: &File,
         _cmd: u32,
         _arg: usize,
@@ -272,7 +280,8 @@ fn ioctl(
     /// provided, then `compat_ptr_ioctl` will be used instead.
     #[cfg(CONFIG_COMPAT)]
     fn compat_ioctl(
-        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _args: MiscArgs<'_, Self>,
+        _device: &Self::Ptr,
         _file: &File,
         _cmd: u32,
         _arg: usize,
@@ -281,11 +290,7 @@ fn compat_ioctl(
     }
 
     /// Show info for this fd.
-    fn show_fdinfo(
-        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
-        _m: &SeqFile,
-        _file: &File,
-    ) {
+    fn show_fdinfo(_args: MiscArgs<'_, Self>, _device: &Self::Ptr, _m: &SeqFile, _file: &File) {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 }
@@ -296,16 +301,15 @@ fn show_fdinfo(
 impl<T: MiscDevice> MiscdeviceVTable<T> {
     /// # Safety
     ///
-    /// `file` and `inode` must be the file and inode for a file that is undergoing initialization.
-    /// The file must be associated with a `MiscDeviceRegistration<T>`.
-    unsafe extern "C" fn open(inode: *mut bindings::inode, raw_file: *mut bindings::file) -> c_int {
-        // SAFETY: The pointers are valid and for a file being opened.
-        let ret = unsafe { bindings::generic_file_open(inode, raw_file) };
-        if ret != 0 {
-            return ret;
-        }
-
-        // SAFETY: The open call of a file can access the private data.
+    /// This function must only be called from misc device file operations with the `struct file`
+    /// pointer provided by the corresponding callback.
+    unsafe fn registration_from_file<'a>(
+        raw_file: *mut bindings::file,
+    ) -> &'a RawDeviceRegistration<T> {
+        // SAFETY:
+        // * Since `raw_file` comes from a misc device file operation callback, it is a pointer to a
+        //   valid `struct file`.
+        // * All file operations can access the file's private data.
         let misc_ptr = unsafe { (*raw_file).private_data };
 
         // This is a miscdevice, so `misc_open()` sets the private data to a pointer to the
@@ -313,30 +317,57 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         let misc_ptr = misc_ptr.cast::<bindings::miscdevice>();
 
         // SAFETY:
-        // * `misc_open()` ensures that the `struct miscdevice` can't be unregistered and freed
-        //   during this call to `fops_open`.
+        // * File operation callbacks ensure that the `struct miscdevice` can't be unregistered and
+        //   freed during a call.
         // * The `misc_ptr` always points to the `inner` field of a `RawDeviceRegistration<T>`.
         // * The `RawDeviceRegistration<T>` is valid until the `struct miscdevice` was
         //   unregistered.
-        let registration = unsafe { &*container_of!(misc_ptr, RawDeviceRegistration<T>, inner) };
+        unsafe { &*container_of!(misc_ptr, RawDeviceRegistration<T>, inner) }
+    }
+
+    fn args_from_registration<'a>(registration: &'a RawDeviceRegistration<T>) -> MiscArgs<'a, T> {
+        let parent: Option<&'a Device<Bound>> = registration.device().parent().map(|parent| {
+            // SAFETY: We just convert from `&Device` into `Device<Bound>`.
+            unsafe { Device::as_ref(parent.as_raw()) }
+        });
+
+        MiscArgs {
+            device: registration.device(),
+            parent,
+            data: registration.data(),
+        }
+    }
+
+    /// # Safety
+    ///
+    /// `file` and `inode` must be the file and inode for a file that is undergoing initialization.
+    /// The file must be associated with a `MiscDeviceRegistration<T>`.
+    unsafe extern "C" fn open(inode: *mut bindings::inode, raw_file: *mut bindings::file) -> c_int {
+        // SAFETY: The pointers are valid and for a file being opened.
+        let ret = unsafe { bindings::generic_file_open(inode, raw_file) };
+        if ret != 0 {
+            return ret;
+        }
+
+        // SAFETY: Called from a misc device file operation callback with the corresponding pointer
+        // to a `struct file`.
+        let registration = unsafe { Self::registration_from_file(raw_file) };
 
         // SAFETY:
         // * This underlying file is valid for (much longer than) the duration of `T::open`.
         // * There is no active fdget_pos region on the file on this thread.
         let file = unsafe { File::from_raw_file(raw_file) };
 
-        let ptr = match T::open(file, registration.device(), registration.data()) {
+        let ptr = match T::open(file, Self::args_from_registration(registration)) {
             Ok(ptr) => ptr,
             Err(err) => return err.to_errno(),
         };
 
-        // This overwrites the private data with the value specified by the user, changing the type
-        // of this file's private data. All future accesses to the private data is performed by
-        // other fops_* methods in this file, which all correctly cast the private data to the new
-        // type.
-        //
-        // SAFETY: The open call of a file can access the private data.
-        unsafe { (*raw_file).private_data = ptr.into_foreign().cast() };
+        // SAFETY:
+        // * We only ever write `registration.private` from `open()`, which does not race with other
+        //   file operation callbacks, i.e. there are no concurrent reads.
+        // * `registration.private.get()` is properly aligned.
+        unsafe { registration.private.get().write(ptr) };
 
         0
     }
@@ -346,15 +377,16 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
     /// `file` and `inode` must be the file and inode for a file that is being released. The file
     /// must be associated with a `MiscDeviceRegistration<T>`.
     unsafe extern "C" fn release(_inode: *mut bindings::inode, file: *mut bindings::file) -> c_int {
-        // SAFETY: The release call of a file owns the private data.
-        let private = unsafe { (*file).private_data }.cast();
-        // SAFETY: The release call of a file owns the private data.
-        let ptr = unsafe { <T::Ptr as ForeignOwnable>::from_foreign(private) };
+        // SAFETY: Called from a misc device file operation callback with the corresponding pointer
+        // to a `struct file`.
+        let registration = unsafe { Self::registration_from_file(file) };
 
         // SAFETY:
-        // * The file is valid for the duration of this call.
-        // * There is no active fdget_pos region on the file on this thread.
-        T::release(ptr, unsafe { File::from_raw_file(file) });
+        // * There won't be any subsequent reads or writes to `registration.private` once
+        //   `release()` is called.
+        // * `registration.private` has been initialized in `open()`.
+        // * `registration.private.get()` is properly aligned.
+        unsafe { core::ptr::drop_in_place(registration.private.get()) };
 
         0
     }
@@ -363,17 +395,25 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
     ///
     /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
     unsafe extern "C" fn ioctl(file: *mut bindings::file, cmd: c_uint, arg: c_ulong) -> c_long {
-        // SAFETY: The ioctl call of a file can access the private data.
-        let private = unsafe { (*file).private_data }.cast();
-        // SAFETY: Ioctl calls can borrow the private data of the file.
-        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+        // SAFETY: Called from a misc device file operation callback with the corresponding pointer
+        // to a `struct file`.
+        let registration = unsafe { Self::registration_from_file(file) };
+
+        // SAFETY:
+        // * `registration.private` is initialized in `open()`, which is guaranteed to called
+        //   before this callback.
+        // * `registration.private.get()` is properly aligned.
+        // * There are no concurrent writes.
+        let private = unsafe { &*registration.private.get() };
 
         // SAFETY:
         // * The file is valid for the duration of this call.
         // * There is no active fdget_pos region on the file on this thread.
         let file = unsafe { File::from_raw_file(file) };
 
-        match T::ioctl(device, file, cmd, arg) {
+        let args = Self::args_from_registration(registration);
+
+        match T::ioctl(args, private, file, cmd, arg) {
             Ok(ret) => ret as c_long,
             Err(err) => err.to_errno() as c_long,
         }
@@ -388,17 +428,25 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         cmd: c_uint,
         arg: c_ulong,
     ) -> c_long {
-        // SAFETY: The compat ioctl call of a file can access the private data.
-        let private = unsafe { (*file).private_data }.cast();
-        // SAFETY: Ioctl calls can borrow the private data of the file.
-        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+        // SAFETY: Called from a misc device file operation callback with the corresponding pointer
+        // to a `struct file`.
+        let registration = unsafe { Self::registration_from_file(file) };
+
+        // SAFETY:
+        // * `registration.private` is initialized in `open()`, which is guaranteed to called
+        //   before this callback.
+        // * `registration.private.get()` is properly aligned.
+        // * There are no concurrent writes.
+        let private = unsafe { &*registration.private.get() };
 
         // SAFETY:
         // * The file is valid for the duration of this call.
         // * There is no active fdget_pos region on the file on this thread.
         let file = unsafe { File::from_raw_file(file) };
 
-        match T::compat_ioctl(device, file, cmd, arg) {
+        let args = Self::args_from_registration(registration);
+
+        match T::compat_ioctl(args, private, file, cmd, arg) {
             Ok(ret) => ret as c_long,
             Err(err) => err.to_errno() as c_long,
         }
@@ -409,10 +457,17 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
     /// - `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
     /// - `seq_file` must be a valid `struct seq_file` that we can write to.
     unsafe extern "C" fn show_fdinfo(seq_file: *mut bindings::seq_file, file: *mut bindings::file) {
-        // SAFETY: The release call of a file owns the private data.
-        let private = unsafe { (*file).private_data }.cast();
-        // SAFETY: Ioctl calls can borrow the private data of the file.
-        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+        // SAFETY: Called from a misc device file operation callback with the corresponding pointer
+        // to a `struct file`.
+        let registration = unsafe { Self::registration_from_file(file) };
+
+        // SAFETY:
+        // * `registration.private` is initialized in `open()`, which is guaranteed to called
+        //   before this callback.
+        // * `registration.private.get()` is properly aligned.
+        // * There are no concurrent writes.
+        let private = unsafe { &*registration.private.get() };
+
         // SAFETY:
         // * The file is valid for the duration of this call.
         // * There is no active fdget_pos region on the file on this thread.
@@ -421,7 +476,9 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         // which this method is called.
         let m = unsafe { SeqFile::from_raw(seq_file) };
 
-        T::show_fdinfo(device, m, file);
+        let args = Self::args_from_registration(registration);
+
+        T::show_fdinfo(args, private, m, file);
     }
 
     const VTABLE: bindings::file_operations = bindings::file_operations {
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index b60fd063afa8..9bf1a0f64e6e 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -159,7 +159,7 @@
     device::Device,
     fs::File,
     ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
-    miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
+    miscdevice::{MiscArgs, MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
     new_mutex,
     prelude::*,
     sync::{Arc, Mutex},
@@ -223,15 +223,15 @@ impl MiscDevice for RustMiscDevice {
 
     type RegistrationData = Arc<Mutex<Inner>>;
 
-    fn open(_file: &File, misc: &Device, data: &Self::RegistrationData) -> Result<Pin<KBox<Self>>> {
-        let dev = ARef::from(misc);
+    fn open(_file: &File, args: MiscArgs<'_, Self>) -> Result<Pin<KBox<Self>>> {
+        let dev = ARef::from(args.device);
 
         dev_info!(dev, "Opening Rust Misc Device Sample\n");
 
         KBox::try_pin_init(
             try_pin_init! {
                 RustMiscDevice {
-                    shared: data.clone(),
+                    shared: args.data.clone(),
                     unique <- new_mutex!(Inner { value: 0_i32 }),
                     dev: dev,
                 }
@@ -240,8 +240,14 @@ fn open(_file: &File, misc: &Device, data: &Self::RegistrationData) -> Result<Pi
         )
     }
 
-    fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result<isize> {
-        dev_info!(me.dev, "IOCTLing Rust Misc Device Sample\n");
+    fn ioctl(
+        args: MiscArgs<'_, Self>,
+        me: &Self::Ptr,
+        _file: &File,
+        cmd: u32,
+        arg: usize,
+    ) -> Result<isize> {
+        dev_info!(args.device, "IOCTLing Rust Misc Device Sample\n");
 
         let size = _IOC_SIZE(cmd);
 
@@ -256,7 +262,7 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
             }
             RUST_MISC_DEV_HELLO => me.hello()?,
             _ => {
-                dev_err!(me.dev, "-> IOCTL not recognised: {}\n", cmd);
+                dev_err!(args.device, "-> IOCTL not recognised: {}\n", cmd);
                 return Err(ENOTTY);
             }
         };
-- 
2.49.0

