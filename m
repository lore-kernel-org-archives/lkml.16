Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF92826B76F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807537; cv=none; b=Cuv3UaLTVOeYmWtrl8Q+G80FTYY9I2xjPZ9sMRg1q/qZFGA5URd8s10f/U8kjx4gtFxO2k/1tS7wg/SO+0EdrF6lmC0lY/bQ0wUvzLJ49Wp5Xceu+FkIR0Phw30lLZ9n1yqXevku98W2GxmB2hiEvsBFM3fiWXB7QgWFmo1Mj14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807537; c=relaxed/simple;
	bh=WjpW1mXe8cskLJAhrTgyC0GBDNPR7e42hLnbyajfepA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XlQobORtFFZDD6FHYJ1OMBDaiMq15NfJ5vxf4KPgD/MPHb+TREruzOmhtxRg8VD0pqxDXCfkI8lgAOamnOzx6kMmlBW/p6gZ7y8OyhlcsbbInOCsxCn/WcsSLVR2cYVxtm7RFDEwP+CLOn4ljZPogH9QPR1dwatzGSsT0mwfiqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=30CdnvrT; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="30CdnvrT"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-235089528a0so2639205ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750807535; x=1751412335; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VcQSqDmTI7Mi8sBsMKZd9s5lqLXk3Ve+cqvRIqdaUAg=;
        b=30CdnvrT8jqeh+CBuaMvbYk1kYL5o7OOdHOfO6pSjRyHtKrlFqJtlY+YRqfiJP4ayc
         YsIiMHXiji8jqdkfIrGkiuIlwxeNMchNJefL0vM/Pd/ENAR84TgwQMP0n/OG6EInnNTc
         rlGoH/oiZQO1IaeMH63OqeR3kbDMimJ3644x2484OfkWvLaNCW/SbtUvSnUpCHs86SHf
         fLx7U16WlNsk4D7/JmkjjOQ1pU2vQT4oihKOXQKEnecnOvP/DE58VNesO3v03v9pNe8i
         fumOgTxlNz1QVKlX9u6x+TdVwnpdLxnI8amYt7n/i7OuZRXfHiBq/2eN7S8Cqlf6MWeY
         NeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750807535; x=1751412335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VcQSqDmTI7Mi8sBsMKZd9s5lqLXk3Ve+cqvRIqdaUAg=;
        b=ul/GtoYaDtDv41lNl6dLG5lmJrpP61kbaLxr1ovacBM8Weftr5RcJ2Qr9hbzWB6PNm
         8QmtcB0tlXRiUdk7g2Oq2YZCLeO+bOHuiK1g/4TQCub/IEFduTjdH7cTqTv81DV8X6OI
         kS/+gTJvT/z6bmzP64+trZuuL5OSi0n9RmAyAPlYUMICdTwnog6yPwZA2rkT5+Mf7tCt
         V/bzMjD9AwpywdfMNWdZSeKmUtl2GPqEzGxGk1rDvPFZaFBNU8KFqxTugTgVoB64vzLt
         s1Vx/U9RtxV2oysmB24kkkUiA9Su8lm68ef2sp/sAaXHAtrH5Hv5okk/0o85PjvNh71S
         2Aag==
X-Gm-Message-State: AOJu0Yw7oeFZtnmePeRloWUnmKN9WD7ggJq3v82dwTJkK7h5zc0Ks24i
	mn+PghRpZwNKHWyf2ShHJHPi7SqVrrYG+vQr5h0bUna/wWielRijxe4oPIqFNac3iU5Bdg7NzZ0
	TNDMbdgup7g==
X-Google-Smtp-Source: AGHT+IGjx99C5o9m+4WWlNaQnnXrLLQSddoO+vJgJOK0xKwJg5ldBl9NJcByshGyyqzME+hLSTB0LTL5V/xl
X-Received: from plhq12.prod.google.com ([2002:a17:903:11cc:b0:236:8084:af9f])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4c7:b0:234:1e11:95a3
 with SMTP id d9443c01a7336-23802495bd7mr90979425ad.13.1750807534912; Tue, 24
 Jun 2025 16:25:34 -0700 (PDT)
Date: Tue, 24 Jun 2025 23:25:23 +0000
In-Reply-To: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750807526; l=10552;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=WjpW1mXe8cskLJAhrTgyC0GBDNPR7e42hLnbyajfepA=; b=uZE0jQrjzKnXjGQBP79LSCDmJwmGqeNJQIz17sQXljWw0cGzZZ+iXKGjich27TWHB7QSmv3OQ
 r4+huigDnBgBZ9OqnR8NyIk+GGOx0Rs68jQPdOGz645Waeewbm/3DvI
X-Mailer: b4 0.14.2
Message-ID: <20250624-debugfs-rust-v7-4-9c8835a7a20f@google.com>
Subject: [PATCH v7 4/6] rust: debugfs: Support arbitrary owned backing for File
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This allows `File`s to be backed by `ForeignOwnable` rather than just
`&'static T`. This means that dynamically allocated objects can be
attached to `File`s without needing to take extra steps to create a
pinned reference that's guaranteed to live long enough.

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
2.50.0.714.g196bf9f422-goog

