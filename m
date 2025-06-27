Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA36292B25
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751066343; cv=none; b=c6m97CrdOfy6zBo+FW69SCdQEQNDR+GGsCiX2OwLsb21M10g3rk4RLMJxtuYyUgKqFmntD+SlfD4bncOaS+LZFYJdxaoDgFMA3ywBC+lXVSRdQUHzCwMDvyKSixc5g5GO1v5cgTAgTdJGpnSDgZtnj6t9GLQIX+ri56U4pSj1uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751066343; c=relaxed/simple;
	bh=CCzVBiivBVXMSUo5O7/V/lLtK76aY9HUiuVRZJLegEc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IbsGXC0pIGOjYS/RFFb/VRlxuugfnwRm9Qwvixf9uD5m8FAXIQpjnso4yWBqgKc6NroE0oviMD0LsVvY2crxBZiU87o/taS6PQBNAN7XAFl57/FSlV9l3wYYx6HbUu1oIrIpg01PAHyjcwmRStK9VrZp7MYm4GFpHkG3t4fU8jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iW5iYdD/; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iW5iYdD/"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7377139d8b1so330883b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751066340; x=1751671140; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R3e8+g6QT9hwNSxzHZzZqHUNIxultYpbJvJe5qexWds=;
        b=iW5iYdD/4lMbxc9zXjs+BWcm+IBkrYuDvqbW9brB3dJvksupwwuhR2jXIQkelcWa2m
         tlt7J7tq76/r2Btk5nZEnAHZmsdVyEgvHU+FRXwz5B2ILoY8v0aiHnb/eqXkWNB3W0y5
         04BUeRBm1s4QfRE7kpb/q2hp5Toc6Ha5/x0LBTOIrfYlJ/S9tMo2BechJpE245kHOBcC
         2sK6I6D8FX66Z4yhg9cIhC6P+/LZA63zqlIi08ksKKDsyLv48/jLRkugJeZi3AP8sP2T
         0tWkz2HqkYHX+lZzFRuNW7WaKQdZn5hF/s6q2AE0I8kq7MS8L8xMgxDnzIln1NI7DyvK
         6UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751066340; x=1751671140;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3e8+g6QT9hwNSxzHZzZqHUNIxultYpbJvJe5qexWds=;
        b=Btm9VosqRO/OpIQUSnVU1Ld04DhXnxlN1zIN0E1+6uuwQthWIIO+W1lptK5j7mUosM
         h8iY4tyaKO91rqpAasPaiwe8yvWBIr7clV3+Yx9lDsLwNpqgCKX2S8fmkruMcOjcn7ed
         pnfl3Bg6y0ap8lQtkReWj7Q8uOcCOhg9yIp8Bn6JRsDBK/esW8qUo+2PLdVvm8qvLhEs
         AerndmU1kHaFuKcB8Cx1GgO0t1ymKBKbIchzOP2w1ubv9blmlDnEYNJXdwsGuVb+jcCw
         qyQOWfHDscVsLrSuWQxpulJrAe98Q/GGRmShm61Tfe1Fam9Lkzjf8FFZQFVudyxaH+DW
         5P2g==
X-Gm-Message-State: AOJu0YyHLbZRHL4E8SI0TgYHD2jZCGLgeru3QzNn3Ku94ZV/MWT1pWhI
	HnDzcQCBHSXHIosd9HyNQOAlnYZJbeSE+88tZBklcwjII5Ow1FHBHfNyJbjFnfivlUyetODTRVp
	p6TU7iV9fKQ==
X-Google-Smtp-Source: AGHT+IGVBBGm2MURUVDVjdiFxppjr7Yri9nVRQzS7G0XJ7Be6h7Im6R3zQR+XQsT95t1tcbfAJWnoy/wnMMp
X-Received: from pgac18.prod.google.com ([2002:a05:6a02:2952:b0:b2f:4c1b:e1a0])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d08:b0:218:9b3e:e8bd
 with SMTP id adf61e73a8af0-220a12a662fmr7686662637.10.1751066339765; Fri, 27
 Jun 2025 16:18:59 -0700 (PDT)
Date: Fri, 27 Jun 2025 23:18:27 +0000
In-Reply-To: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751066331; l=10601;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=CCzVBiivBVXMSUo5O7/V/lLtK76aY9HUiuVRZJLegEc=; b=G8n4sb4Xu2zurni/h3aQ7uYSYPthrOZaRXO2LJv2K/E21jlFyPU77UIesfpoPrV7LO+Dr1LKu
 7NQjH2DTrVEBuOOLdpO34CSUDPgWiMmm64GfIfqrbBvP6PUVvsLgpv3
X-Mailer: b4 0.14.2
Message-ID: <20250627-debugfs-rust-v8-4-c6526e413d40@google.com>
Subject: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing for File
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="utf-8"

This allows `File`s to be backed by `ForeignOwnable` rather than just
`&'static T`. This means that dynamically allocated objects can be
attached to `File`s without needing to take extra steps to create a
pinned reference that's guaranteed to live long enough.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs              | 99 +++++++++++++++++++++++++++++++------
 rust/kernel/debugfs/display_file.rs | 49 +++++++++++-------
 2 files changed, 115 insertions(+), 33 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 1f20d85da56fcb89476552feefc9d97fab43cc04..929e55ee5629f6888edf29997b9ed77d274e11c8 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -5,11 +5,11 @@
 //!
 //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
 
-#[cfg(CONFIG_DEBUG_FS)]
-use crate::prelude::GFP_KERNEL;
+use crate::prelude::*;
 use crate::str::CStr;
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
+use crate::types::ForeignOwnable;
 use core::fmt::Display;
 
 #[cfg(CONFIG_DEBUG_FS)]
@@ -63,40 +63,52 @@ fn create(_name: &CStr, _parent: Option<&Dir>) -> Self {
     }
 
     #[cfg(CONFIG_DEBUG_FS)]
-    fn create_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> File {
+    fn create_file<D: ForeignOwnable + Send + Sync>(&self, name: &CStr, data: D) -> File
+    where
+        for<'a> D::Borrowed<'a>: Display,
+    {
+        let mut file = File {
+            _entry: Entry::empty(),
+            _foreign: ForeignHolder::new(data),
+        };
+
         let Some(parent) = &self.0 else {
-            return File {
-                _entry: Entry::empty(),
-            };
+            return file;
         };
+
         // SAFETY:
         // * `name` is a NUL-terminated C string, living across the call, by `CStr` invariant.
         // * `parent` is a live `dentry` since we have a reference to it.
         // * `vtable` is all stock `seq_file` implementations except for `open`.
         //   `open`'s only requirement beyond what is provided to all open functions is that the
         //   inode's data pointer must point to a `T` that will outlive it, which we know because
-        //   we have a static reference.
+        //   we have an owning `D` in the `File`, and we tear down the file during `Drop`.
         let ptr = unsafe {
             bindings::debugfs_create_file_full(
                 name.as_char_ptr(),
                 0o444,
                 parent.as_ptr(),
-                data as *const _ as *mut _,
+                file._foreign.data,
                 core::ptr::null(),
-                &<T as display_file::DisplayFile>::VTABLE,
+                &<D as display_file::DisplayFile>::VTABLE,
             )
         };
 
         // SAFETY: `debugfs_create_file_full` either returns an error code or a legal
         // dentry pointer, so `Entry::new` is safe to call here.
-        let entry = unsafe { Entry::new(ptr, Some(parent.clone())) };
+        file._entry = unsafe { Entry::new(ptr, Some(parent.clone())) };
 
-        File { _entry: entry }
+        file
     }
 
     #[cfg(not(CONFIG_DEBUG_FS))]
-    fn create_file<T: Display + Sized>(&self, _name: &CStr, _data: &'static T) -> File {
-        File {}
+    fn create_file<D: ForeignOwnable>(&self, _name: &CStr, data: D) -> File
+    where
+        for<'a> D::Borrowed<'a>: Display,
+    {
+        File {
+            _foreign: ForeignHolder::new(data),
+        }
     }
 
     /// Create a DebugFS subdirectory.
@@ -127,7 +139,21 @@ pub fn subdir(&self, name: &CStr) -> Self {
     /// dir.display_file(c_str!("foo"), &200);
     /// // "my_debugfs_dir/foo" now contains the number 200.
     /// ```
-    pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> File {
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// # use kernel::prelude::*;
+    /// let val = KBox::new(300, GFP_KERNEL)?;
+    /// let dir = Dir::new(c_str!("my_debugfs_dir"));
+    /// dir.display_file(c_str!("foo"), val);
+    /// // "my_debugfs_dir/foo" now contains the number 300.
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn display_file<D: ForeignOwnable + Send + Sync>(&self, name: &CStr, data: D) -> File
+    where
+        for<'a> D::Borrowed<'a>: Display,
+    {
         self.create_file(name, data)
     }
 
@@ -147,6 +173,51 @@ pub fn new(name: &CStr) -> Self {
 
 /// Handle to a DebugFS file.
 pub struct File {
+    // This order is load-bearing for drops - `_entry` must be dropped before `_foreign`
     #[cfg(CONFIG_DEBUG_FS)]
     _entry: Entry,
+    _foreign: ForeignHolder,
+}
+
+struct ForeignHolder {
+    data: *mut c_void,
+    drop_hook: unsafe fn(*mut c_void),
+}
+
+// SAFETY: We only construct `ForeignHolder` using a pointer from a `ForeignOwnable` which
+// is also `Sync`.
+unsafe impl Sync for ForeignHolder {}
+// SAFETY: We only construct `ForeignHolder` using a pointer from a `ForeignOwnable` which
+// is also `Send`.
+unsafe impl Send for ForeignHolder {}
+
+/// Helper function to drop a `D`-typed foreign ownable from its foreign representation, useful for
+/// cases where you want the type erased.
+/// # Safety
+/// * The foreign pointer passed in must have come from `D`'s `ForeignOwnable::into_foreign`
+/// * There must be no outstanding `ForeignOwnable::borrow{,mut}`
+/// * The pointer must not have been `ForeignOwnable::from_foreign`'d
+unsafe fn drop_helper<D: ForeignOwnable>(foreign: *mut c_void) {
+    // SAFETY: By safetydocs, we meet the requirements for `from_foreign`
+    drop(unsafe { D::from_foreign(foreign as _) })
+}
+
+impl ForeignHolder {
+    fn new<D: ForeignOwnable>(data: D) -> Self {
+        Self {
+            data: data.into_foreign() as _,
+            drop_hook: drop_helper::<D>,
+        }
+    }
+}
+
+impl Drop for ForeignHolder {
+    fn drop(&mut self) {
+        // SAFETY: `drop_hook` corresponds to the original `ForeignOwnable` instance's `drop`.
+        // This is only used in the case of `File`, so the only place borrows occur is through the
+        // DebugFS file owned by `_entry`. Since `_entry` occurs earlier in the struct, it will be
+        // dropped first, so no borrows will be ongoing. We know no `from_foreign` has occurred
+        // because this pointer is not exposed anywhere that is called.
+        unsafe { (self.drop_hook)(self.data) }
+    }
 }
diff --git a/rust/kernel/debugfs/display_file.rs b/rust/kernel/debugfs/display_file.rs
index e4b551f7092884ad12e18a32cc243d0d037931a6..0c2dd756fa866425d1b7771beceaa2fb43bf11e5 100644
--- a/rust/kernel/debugfs/display_file.rs
+++ b/rust/kernel/debugfs/display_file.rs
@@ -4,42 +4,48 @@
 use crate::prelude::*;
 use crate::seq_file::SeqFile;
 use crate::seq_print;
+use crate::types::ForeignOwnable;
 use core::fmt::Display;
 
 /// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`.
 ///
 /// # Safety
 ///
-/// * `inode`'s private pointer must point to a value of type `T` which will outlive the `inode`
-///   and will not be mutated during this call.
+/// * `inode`'s private pointer must be the foreign representation of `D`, and no mutable borrows
+///   are outstanding.
 /// * `file` must point to a live, not-yet-initialized file object.
-pub(crate) unsafe extern "C" fn display_open<T: Display>(
+pub(crate) unsafe extern "C" fn display_open<D: ForeignOwnable + Sync>(
     inode: *mut bindings::inode,
     file: *mut bindings::file,
-) -> c_int {
+) -> c_int
+where
+    for<'a> D::Borrowed<'a>: Display,
+{
     // SAFETY:
     // * `file` is acceptable by caller precondition.
     // * `print_act` will be called on a `seq_file` with private data set to the third argument,
     //   so we meet its safety requirements.
-    // * The `data` pointer passed in the third argument is a valid `T` pointer that outlives
-    //   this call by caller preconditions.
-    unsafe { bindings::single_open(file, Some(display_act::<T>), (*inode).i_private) }
+    // * The `data` pointer passed in the third argument is valid by caller preconditions.
+    unsafe { bindings::single_open(file, Some(display_act::<D>), (*inode).i_private) }
 }
 
 /// Prints private data stashed in a seq_file to that seq file.
 ///
 /// # Safety
 ///
-/// `seq` must point to a live `seq_file` whose private data is a live pointer to a `T` which is
-/// not being mutated.
-pub(crate) unsafe extern "C" fn display_act<T: Display>(
+/// `seq` must point to a live `seq_file` whose private data is the foreign representation of `D`,
+/// and no mutable borrows are outsstanding.
+pub(crate) unsafe extern "C" fn display_act<D: ForeignOwnable + Sync>(
     seq: *mut bindings::seq_file,
     _: *mut c_void,
-) -> c_int {
-    // SAFETY: By caller precondition, this pointer is live, points to a value of type `T`, and
-    // is not being mutated.
-    let data = unsafe { &*((*seq).private as *mut T) };
-    // SAFETY: By caller precondition, `seq_file` points to a live `seq_file`, so we can lift
+) -> c_int
+where
+    for<'a> D::Borrowed<'a>: Display,
+{
+    // SAFETY: By caller precondition, this pointer is live, has the right type, and has no mutable
+    // borrows outstanding.
+    let data = unsafe { D::borrow((*seq).private as _) };
+    // SAFETY: By caller precondition, `seq` points to a live `seq_file`, so we can lift
     // it.
     let seq_file = unsafe { SeqFile::from_raw(seq) };
     seq_print!(seq_file, "{}", data);
@@ -47,15 +53,20 @@
 }
 
 // Work around lack of generic const items.
-pub(crate) trait DisplayFile: Display + Sized {
+pub(crate) trait DisplayFile {
+    const VTABLE: bindings::file_operations;
+}
+
+impl<D: ForeignOwnable + Sync> DisplayFile for D
+where
+    for<'a> D::Borrowed<'a>: Display,
+{
     const VTABLE: bindings::file_operations = bindings::file_operations {
         read: Some(bindings::seq_read),
         llseek: Some(bindings::seq_lseek),
         release: Some(bindings::single_release),
-        open: Some(display_open::<Self>),
+        open: Some(display_open::<D>),
         // SAFETY: `file_operations` supports zeroes in all fields.
         ..unsafe { core::mem::zeroed() }
     };
 }
-
-impl<T: Display + Sized> DisplayFile for T {}

-- 
2.50.0.727.gbf7dc18ff4-goog

