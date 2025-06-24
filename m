Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5849726B0BE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807534; cv=none; b=NCKUeIE1ZWJtbKX1wNkUUf0uHNQBi8+x1z3BOMWHWwTT7befcptgnC/PMZK8ZHoYVTuVH/Wyo1wVQTRKyYYXvcBjtZWyixjfxATPn4FXMNA92253vY/tSyk5OW2SSKI7b/9X0NzVcaKd+5j31E+UDwdIHyoMjZeKev9InJDGLI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807534; c=relaxed/simple;
	bh=eWFtMg+1mUstLz1AnFmKGbl4X0Ap1ZmRq13QxZaZr14=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TQMnvyQ71hYLS7NBEXCOWwsxOrWSA73iKX4h+GX9h0YIEOlO7CsgM8v5lzf6dweqFYBZej7W/Tlz7i1BRNEfXKDEzgiVcXSyvcP0MSG79Cu6/01qlFZrJshY86Z8zWbVRkf4H6gqHq9kPX0hG3YfEawCxSNNE3wY9FTlsxArTx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DVYJGrWx; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DVYJGrWx"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7491814d6f2so905283b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750807531; x=1751412331; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0XFj7DwWuJaySgVlNklxUH82PEHx6pCmOK1QZq0Gviw=;
        b=DVYJGrWxjq364A6bg4syZLnLd8UBWlVRD0s/0PQnYSI0oIvuloL9OvoEQHprnkrMbB
         b2g8PgJggc00Fh7x8iKd/03XTc7xR/nDcITtwjKOxRjiDH2uy1PuiWcLhKutL0uuvNjZ
         csmSJiAbHdBYUg++gymBoLgMH4yxAcn7hRJ028SnAZV2GeBXjb0DR+J4YSrFG4w7gpts
         QX4heN4fopbybt84NjeEiQWFwyqprRJ65tRIeCgGzxrG6bj3/vmUDX2NED0BNR5wJxBM
         sf6/Uc4D5tP84HxnGZfW/qMfFrpJ8vjoWZhUnk65P0HP9+P0CsYp0LwX8YiDAjQ7EgeR
         ySoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750807531; x=1751412331;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XFj7DwWuJaySgVlNklxUH82PEHx6pCmOK1QZq0Gviw=;
        b=Tzm9jKNBPPYTuTrc474dhTThkjlkkJQ1c9OQqo2yN4b+u81J5QAMHQOPOVMu0bLqfP
         PmHePQreZhhtMXLGoII6eubt4AceDmDJIkrpzP1pKCGUwcB3fJF0GVeR6pzyFQE4tkdF
         VwvWZT5tmk8mXNrzk23Ry8jGtPngK/Tp9evGHXVNh5UssClUYS4uWH6YKjKXyP3N63aO
         97FEHUJNi8semY8PK0wEPWvHC3qJBvfAf5R1AnSjwKHI8ql5Svl5bFLhzZplzuV8xFkC
         e3F4Sz+V/guJuMflLbM2jtAgeMYMUiB6ljBDMmzfMrMm/s35J6SzD7uy8HaddcXMVqIc
         TMzg==
X-Gm-Message-State: AOJu0YyYGAA7WqHJLE6eqBRIhNlkbqMgSELt8+/SfY4AAesccAadcpID
	SITbpFmHDmWpVm8K8VOKqPGGO3ZXgAElJmnjsQ6Asfhz1jHks6ABOFcRxDzFCDyW1TlcErTxwzE
	iC7aT6pUepg==
X-Google-Smtp-Source: AGHT+IGJcn/EykG+jT5OLFYGdRt3qZuwFyOC3e8e4pPnmsh56KpRwNnABv2ZTEHRxb/6BHFTngcWEJMV3ym2
X-Received: from pfbde4.prod.google.com ([2002:a05:6a00:4684:b0:741:8e1a:2d09])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:8893:0:b0:748:ff39:a0ed
 with SMTP id d2e1a72fcca58-74ad45b3fc0mr1280034b3a.20.1750807531520; Tue, 24
 Jun 2025 16:25:31 -0700 (PDT)
Date: Tue, 24 Jun 2025 23:25:21 +0000
In-Reply-To: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750807526; l=7234;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=eWFtMg+1mUstLz1AnFmKGbl4X0Ap1ZmRq13QxZaZr14=; b=sQMWG9TzZ8Ejh9Im87WE0ksTMM5FUPvSrLruugwPkCpAPFP/kQrxEqc1uyNsImCPyasfVlfXH
 uYrOGEtsF/oDPEiDI0IlLJo5EMuRFc99bs56ZHxUQs6vqwVvb0yuOh6
X-Mailer: b4 0.14.2
Message-ID: <20250624-debugfs-rust-v7-2-9c8835a7a20f@google.com>
Subject: [PATCH v7 2/6] rust: debugfs: Bind file creation for long-lived Display
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

Allows creation of files for references that live forever and lack
metadata through the `Display` implementation.

The `Display` implementation is used because `seq_printf` needs to route
through `%pA`, which in turn routes through Arguments.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs              | 62 +++++++++++++++++++++++++++++++++++++
 rust/kernel/debugfs/display_file.rs | 61 ++++++++++++++++++++++++++++++++++++
 rust/kernel/debugfs/entry.rs        |  8 +++++
 3 files changed, 131 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 2359bd11cd664fb9f7206f8fe38f758dc43d2cb8..1f20d85da56fcb89476552feefc9d97fab43cc04 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -10,7 +10,10 @@
 use crate::str::CStr;
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
+use core::fmt::Display;
 
+#[cfg(CONFIG_DEBUG_FS)]
+mod display_file;
 #[cfg(CONFIG_DEBUG_FS)]
 mod entry;
 #[cfg(CONFIG_DEBUG_FS)]
@@ -59,6 +62,43 @@ fn create(_name: &CStr, _parent: Option<&Dir>) -> Self {
         Self()
     }
 
+    #[cfg(CONFIG_DEBUG_FS)]
+    fn create_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> File {
+        let Some(parent) = &self.0 else {
+            return File {
+                _entry: Entry::empty(),
+            };
+        };
+        // SAFETY:
+        // * `name` is a NUL-terminated C string, living across the call, by `CStr` invariant.
+        // * `parent` is a live `dentry` since we have a reference to it.
+        // * `vtable` is all stock `seq_file` implementations except for `open`.
+        //   `open`'s only requirement beyond what is provided to all open functions is that the
+        //   inode's data pointer must point to a `T` that will outlive it, which we know because
+        //   we have a static reference.
+        let ptr = unsafe {
+            bindings::debugfs_create_file_full(
+                name.as_char_ptr(),
+                0o444,
+                parent.as_ptr(),
+                data as *const _ as *mut _,
+                core::ptr::null(),
+                &<T as display_file::DisplayFile>::VTABLE,
+            )
+        };
+
+        // SAFETY: `debugfs_create_file_full` either returns an error code or a legal
+        // dentry pointer, so `Entry::new` is safe to call here.
+        let entry = unsafe { Entry::new(ptr, Some(parent.clone())) };
+
+        File { _entry: entry }
+    }
+
+    #[cfg(not(CONFIG_DEBUG_FS))]
+    fn create_file<T: Display + Sized>(&self, _name: &CStr, _data: &'static T) -> File {
+        File {}
+    }
+
     /// Create a DebugFS subdirectory.
     ///
     /// Subdirectory handles cannot outlive the directory handle they were created from.
@@ -75,6 +115,22 @@ pub fn subdir(&self, name: &CStr) -> Self {
         Dir::create(name, Some(self))
     }
 
+    /// Create a file in a DebugFS directory with the provided name, and contents from invoking
+    /// [`Display::fmt`] on the provided reference.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let dir = Dir::new(c_str!("my_debugfs_dir"));
+    /// dir.display_file(c_str!("foo"), &200);
+    /// // "my_debugfs_dir/foo" now contains the number 200.
+    /// ```
+    pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> File {
+        self.create_file(name, data)
+    }
+
     /// Create a new directory in DebugFS at the root.
     ///
     /// # Examples
@@ -88,3 +144,9 @@ pub fn new(name: &CStr) -> Self {
         Dir::create(name, None)
     }
 }
+
+/// Handle to a DebugFS file.
+pub struct File {
+    #[cfg(CONFIG_DEBUG_FS)]
+    _entry: Entry,
+}
diff --git a/rust/kernel/debugfs/display_file.rs b/rust/kernel/debugfs/display_file.rs
new file mode 100644
index 0000000000000000000000000000000000000000..e4b551f7092884ad12e18a32cc243d0d037931a6
--- /dev/null
+++ b/rust/kernel/debugfs/display_file.rs
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Google LLC.
+
+use crate::prelude::*;
+use crate::seq_file::SeqFile;
+use crate::seq_print;
+use core::fmt::Display;
+
+/// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`.
+///
+/// # Safety
+///
+/// * `inode`'s private pointer must point to a value of type `T` which will outlive the `inode`
+///   and will not be mutated during this call.
+/// * `file` must point to a live, not-yet-initialized file object.
+pub(crate) unsafe extern "C" fn display_open<T: Display>(
+    inode: *mut bindings::inode,
+    file: *mut bindings::file,
+) -> c_int {
+    // SAFETY:
+    // * `file` is acceptable by caller precondition.
+    // * `print_act` will be called on a `seq_file` with private data set to the third argument,
+    //   so we meet its safety requirements.
+    // * The `data` pointer passed in the third argument is a valid `T` pointer that outlives
+    //   this call by caller preconditions.
+    unsafe { bindings::single_open(file, Some(display_act::<T>), (*inode).i_private) }
+}
+
+/// Prints private data stashed in a seq_file to that seq file.
+///
+/// # Safety
+///
+/// `seq` must point to a live `seq_file` whose private data is a live pointer to a `T` which is
+/// not being mutated.
+pub(crate) unsafe extern "C" fn display_act<T: Display>(
+    seq: *mut bindings::seq_file,
+    _: *mut c_void,
+) -> c_int {
+    // SAFETY: By caller precondition, this pointer is live, points to a value of type `T`, and
+    // is not being mutated.
+    let data = unsafe { &*((*seq).private as *mut T) };
+    // SAFETY: By caller precondition, `seq_file` points to a live `seq_file`, so we can lift
+    // it.
+    let seq_file = unsafe { SeqFile::from_raw(seq) };
+    seq_print!(seq_file, "{}", data);
+    0
+}
+
+// Work around lack of generic const items.
+pub(crate) trait DisplayFile: Display + Sized {
+    const VTABLE: bindings::file_operations = bindings::file_operations {
+        read: Some(bindings::seq_read),
+        llseek: Some(bindings::seq_lseek),
+        release: Some(bindings::single_release),
+        open: Some(display_open::<Self>),
+        // SAFETY: `file_operations` supports zeroes in all fields.
+        ..unsafe { core::mem::zeroed() }
+    };
+}
+
+impl<T: Display + Sized> DisplayFile for T {}
diff --git a/rust/kernel/debugfs/entry.rs b/rust/kernel/debugfs/entry.rs
index ae0e2c4e1d58e878ebb081a71e4ac0f4a7d99b91..2baaf31c326c3071b92b5bc37552907fa1102246 100644
--- a/rust/kernel/debugfs/entry.rs
+++ b/rust/kernel/debugfs/entry.rs
@@ -38,6 +38,14 @@ pub(crate) unsafe fn new(entry: *mut bindings::dentry, parent: Option<Arc<Entry>
         }
     }
 
+    /// Constructs a placeholder DebugFS [`Entry`].
+    pub(crate) fn empty() -> Self {
+        Self {
+            entry: core::ptr::null_mut(),
+            _parent: None,
+        }
+    }
+
     /// Returns the pointer representation of the DebugFS directory.
     ///
     /// # Guarantees

-- 
2.50.0.714.g196bf9f422-goog

