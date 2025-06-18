Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD9E72606
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750213701; cv=none; b=GYZaYpaNvjaXxkikJe05tchujBWrXTcxo9b2yFRfu1onmFS6tUO7AWVbbWynlhHpjC0Ti1+R7RIuRGXzox30+hFaUpA3wtDV7wja/AWBeUArfNJ0DbH/rbxUbRzAoX4128foLTIrZxhMhedueBoeDFfsPYmGdtrZ6XYnmychYrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750213701; c=relaxed/simple;
	bh=arncnwztjoqLIa7H95YpFTsDUfZi47rpF4nw6cr7M0A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rSR5p6knfCIToK7/wfcdr7sz6uFT6V32g1+Ae94XIvxq2b6o5gVOhYCOb6ThAc8ZtAKB44FfwU6hfztIEiJL05IHDkL6JdLuLJ6sr33ZD715kNVU4cb+csjlbYaI2Ab5qCxbBDng55F5mAa6WkSO1iOWxLucq03cR7Wc+5zLj3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vdjFDRAC; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vdjFDRAC"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748e1e474f8so906709b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750213699; x=1750818499; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5g9C/2aXjP3q3IRmwt44Q9zBgZjDUhb/vz3CKf6T5mY=;
        b=vdjFDRACDmxxBoJjdJscinXKo2meX5kgIP40IaMDE4jzhZDqlqjNGRIK03N6K6WxZm
         nZcAg1rxI2dkaZGOTGgSf50Fg2nW2TpzrBfOs8JYahirao0CnRVzkaiEk5ot5SfSCIyk
         q9jxTo+YS4TrLNw4c06nR7m9btE4IraAXCvfm8ZLmRiqFriJrGBRGfcrbY4pdKmppFeK
         h18MQvkoDxhaAo4aLD2Re3+Ams1WfnYl1INkl8FbsKTrszTx5jNLK7ZEzgZ/LrGNzJC/
         OyXaeK6uv4qcdNMVH5BM8YlFxrMY/XOks8rzIqf/uOom8spTS8idv7TJSXDqRCpgmbAw
         2gNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750213699; x=1750818499;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5g9C/2aXjP3q3IRmwt44Q9zBgZjDUhb/vz3CKf6T5mY=;
        b=vE93oQiJV9ZFwRg48o50uSwT4vE5x9Q0weougsfCXUnp4aLa6u07GcCPv1mi7QCdw7
         QOQl79CInJfu+ZrUHR2E9q1ni2JK1sicHL9TP1TcsCp6F33b4JldVv6rsjz4ec9MQyxp
         MIEkwbnh4MP7/qRjLC+sh2mqtgggia736mtNn5vJ5ONYyhpXHnfYGeqi3HvJCWy4TuAM
         f4tAva4vaRSNev1QTtWHfCCXgrl5GYXk0w/XvRUS4OBFR+Pq0aiI4dbZe6ZYeWQC6lcM
         a/c1ndK3og+6kP62gHaizIElzEdRvTIIiZKRjCrln5XGB89TM2iHpLKNYjJdrRnpA42A
         W4PQ==
X-Gm-Message-State: AOJu0YyyZX+CbZCxF2PcsfamMhPbZ3IEGc/6jxaVXB+dWnb/whZr2Q9E
	1U5+UpcTwuBYNxgDCELBY7fyYlRsh0UDHxXDzzuYzlmsI2cHV6+n1UMz1fqVl85vii7K3x4Tgfz
	Uie2mDokv1A==
X-Google-Smtp-Source: AGHT+IF5WvYUSe54T6Ow+jbHfSuXMsSRK3PMsFOXvOFipiuoXcxFOhmVI/04CxZ+x/0s0oKv6VvB3fTb+57u
X-Received: from pfbde14.prod.google.com ([2002:a05:6a00:468e:b0:748:dd5c:e882])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1790:b0:736:3d7c:236c
 with SMTP id d2e1a72fcca58-7489d062437mr20439275b3a.14.1750213698962; Tue, 17
 Jun 2025 19:28:18 -0700 (PDT)
Date: Wed, 18 Jun 2025 02:28:14 +0000
In-Reply-To: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750213694; l=7330;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=arncnwztjoqLIa7H95YpFTsDUfZi47rpF4nw6cr7M0A=; b=RPkAyspbgBp0kXzMBUSWsawJSmXKkKlsU5ypJfOiEBT6ZbLFGMzqyTkkOnEyCEKTIa5ViV+6z
 WuIx7BS/XsjBshg7TA4rDpYrKfXoR+UweHV8tDoIF/KpixeI3QdpprL
X-Mailer: b4 0.14.2
Message-ID: <20250618-debugfs-rust-v6-2-72cae211b133@google.com>
Subject: [PATCH v6 2/5] rust: debugfs: Bind file creation for long-lived Display
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

The reference must live forever because we do not have a maximum
lifetime for the file we are creating.

The `Display` implementation is used because `seq_printf` needs to route
through `%pA`, which in turn routes through Arguments.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs              | 62 +++++++++++++++++++++++++++++++++++++
 rust/kernel/debugfs/display_file.rs | 60 +++++++++++++++++++++++++++++++++++
 rust/kernel/debugfs/entry.rs        |  8 +++++
 3 files changed, 130 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index e390278b8b7384f1d9e2b3d7a4f5f365f6447d0f..6a89557d8cf49327d2984d15741ffb6640defd70 100644
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
 
@@ -57,6 +60,43 @@ fn create(_name: &CStr, _parent: Option<&Dir>) -> Self {
         Self()
     }
 
+    #[cfg(CONFIG_DEBUG_FS)]
+    fn create_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> File {
+        let Some(parent) = &self.0 else {
+            return File {
+                _entry: entry::Entry::empty(),
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
+        let entry = unsafe { entry::Entry::new(ptr, Some(parent.clone())) };
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
@@ -73,6 +113,22 @@ pub fn subdir(&self, name: &CStr) -> Self {
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
@@ -86,3 +142,9 @@ pub fn new(name: &CStr) -> Self {
         Dir::create(name, None)
     }
 }
+
+/// Handle to a DebugFS file.
+pub struct File {
+    #[cfg(CONFIG_DEBUG_FS)]
+    _entry: entry::Entry,
+}
diff --git a/rust/kernel/debugfs/display_file.rs b/rust/kernel/debugfs/display_file.rs
new file mode 100644
index 0000000000000000000000000000000000000000..65e37e34d7b587482492dc296637a3bc517b9fe3
--- /dev/null
+++ b/rust/kernel/debugfs/display_file.rs
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Google LLC.
+
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
+) -> i32 {
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
+    _: *mut core::ffi::c_void,
+) -> i32 {
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
+        open: Some(display_open::<Self> as _),
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
2.50.0.rc2.696.g1fc2a0284f-goog

