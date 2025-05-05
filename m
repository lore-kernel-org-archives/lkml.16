Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1549F1F5433
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746489101; cv=none; b=VZdasZdenl8N6Y0EFXXz2gfvQfJN0a3NnkFfA8yOqgtflW84zxPOnDh0fEyJ4ewY9GNmvjyd1PBiPNQvfX0YJ5mDTcyjeDtm3/5PoDbpqxm2LVUWRVK2UJq0TDC4vlLmQ6RXFr+ErI2HkCFvzq36039nkZfzChvwVqiyFeVL0sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746489101; c=relaxed/simple;
	bh=Eb3lt2LvIAa6seENz5ciTjZBBIzUMwkJVD419FJR0/k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qfacrI3lzQbpiFlU12jm3oswguuNYVy/aaeGApADfgLcwgUvPNfCap4BKi2RFziAPv7lDhx/toVmsx5WhoKkFBVXWW9CBrhOKaiLg10zj6FgjkSCvSl3YnUWs7CJjGF1Yq65gTueVplQywNXCUUkirayOykFE2RuNv8yjB9Uves=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ey2cf6KM; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ey2cf6KM"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2254e0b4b85so46927355ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 16:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746489098; x=1747093898; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6fPGr+WFW2LWEagGWid0GDx4A/neFED+/hSTuUt40rs=;
        b=ey2cf6KMYTU9m1TeTIa3la9+bAyXbyXM3l3dh0HPbXCRnfVXAsyRQxYpma1dnsohzB
         2Li6XzrpOtFfv30kX0JGkFElEJhsif0UvtlKDhdpB3rRN2sCe31by2TD+5tV5I6zV/4n
         kYMizLpYf9CmzK8h0USPobkdmEWCSK/gEwsEUwGUKdbSPonJSTHVW2EMnAQaVwzIx6VM
         erIZyryrlvy8FD5vRh3tugzMFrUSjmw7z9//D1vhu3vqjFjC+PhXo8LFyqQbAfrror2R
         w2bOoQ9RP+HRGPWnrWq/OJgMHqWObM07ujkfICQ+oH8OgmaGst0cElvIL8PkLkVfdbwv
         5RkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746489098; x=1747093898;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6fPGr+WFW2LWEagGWid0GDx4A/neFED+/hSTuUt40rs=;
        b=oxT6KYvMAaU3iB/JtViHZ24N1EaMNBWkeLEBv6HtKF0k2qQKy4v5Q9n/2M97HWWRmM
         tqIaSS534lmvx8KBeBPUSzBuGu1DHfmoq2Ps42IMy36W356S5mA5q0HO5KtNgD9rB1PD
         N2nxOp8vR1CMLEbZv/QEimM/UxcCTVY+tW8uFUQpPF4RYopCY2oH4H+yocFk/elKrUCt
         WBRQYIxJXvOC3QOo+JBRWwonkbW2towY1HWtxX0gl4le64Ze2yqcbP89ffk4OvJFjec0
         9885IKSaJ+O/jGRRIY4tzVaWcUlXcgoLnZVEVtjpy78zIP4z1t9h/Zlprty4RvLKHq1o
         YTlg==
X-Gm-Message-State: AOJu0YzvRr4uhTYvCOswRAhxAruTxHK3ohXG09Hqy+oEV8E2pQKPVpuw
	EwZDpMjs6aI+2h69pAtgviNVUT7CTN2APKF9oX/hV1uqFWT2+YPBVK/jysnYhYdJvWKzGSPISFv
	/ktKgLg==
X-Google-Smtp-Source: AGHT+IFigJKKKKjm1K5W2E01S3JsEY26jj1rJmi+XCK0W0m/bcH6kvD9XD1qlePnZV77bNRfaGKsLXGSuo3u
X-Received: from pfhg23.prod.google.com ([2002:a62:e317:0:b0:73e:655:5bee])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:290:b0:220:ff82:1c60
 with SMTP id d9443c01a7336-22e3280a6e2mr19726055ad.14.1746489098296; Mon, 05
 May 2025 16:51:38 -0700 (PDT)
Date: Mon, 05 May 2025 23:51:34 +0000
In-Reply-To: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746489094; l=6915;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=Eb3lt2LvIAa6seENz5ciTjZBBIzUMwkJVD419FJR0/k=; b=quWRvkW1Ex7bCk8S6MCaY7cWbf5BiM9t8ViG+nCebi7ZGPBsRB195nuaEt4me7CDFty8GvGgY
 Lnfid7D8CKzDF5KkF0gEokvDzlx0ABjyZaTkKEnfLiYPMAVph045FRk
X-Mailer: b4 0.14.2
Message-ID: <20250505-debugfs-rust-v5-1-3e93ce7bb76e@google.com>
Subject: [PATCH v5 1/4] rust: debugfs: Bind DebugFS directory creation
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Support creating DebugFS directories and subdirectories. Similar to the
original DebugFS API, errors are hidden.

By default, when a root directory handle leaves scope, it will be cleaned
up.

Subdirectories will by default persist until their root directory is
cleaned up, but can be converted into a root directory if a scoped
lifecycle is desired.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/debugfs.rs          | 139 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 4 files changed, 142 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 906881b6c5cb6ff743e13b251873b89138c69a1c..a3b835e427b083a4ddd690d9e7739851f0af47ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7271,6 +7271,7 @@ F:	include/linux/kobj*
 F:	include/linux/property.h
 F:	include/linux/sysfs.h
 F:	lib/kobj*
+F:	rust/kernel/debugfs.rs
 F:	rust/kernel/device.rs
 F:	rust/kernel/device_id.rs
 F:	rust/kernel/devres.rs
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 8a2add69e5d66d1c2ebed9d2c950380e61c48842..787f928467faabd02a7f3cf041378fac856c4f89 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -13,6 +13,7 @@
 #include <linux/blkdev.h>
 #include <linux/cpumask.h>
 #include <linux/cred.h>
+#include <linux/debugfs.h>
 #include <linux/device/faux.h>
 #include <linux/dma-mapping.h>
 #include <linux/errname.h>
diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
new file mode 100644
index 0000000000000000000000000000000000000000..ed1aba6d700d064dbfd7e923dbcbf80b9acf5361
--- /dev/null
+++ b/rust/kernel/debugfs.rs
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Google LLC.
+
+//! DebugFS Abstraction
+//!
+//! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
+
+use crate::str::CStr;
+use core::marker::PhantomData;
+
+/// Owning handle to a DebugFS entry.
+///
+/// # Invariants
+///
+/// The wrapped pointer will always be `NULL`, an error, or an owned DebugFS `dentry`.
+#[repr(transparent)]
+struct Entry<'a> {
+    #[cfg(CONFIG_DEBUG_FS)]
+    entry: *mut bindings::dentry,
+    // We need to be outlived by our parent, if they exist, but we don't actually need to be able
+    // to access the data.
+    _phantom: PhantomData<&'a Entry<'a>>,
+}
+
+// SAFETY: [`Entry`] is just a `dentry` under the hood, which the API promises can be transferred
+// between threads.
+unsafe impl Send for Entry<'_> {}
+
+// SAFETY: All the native functions we re-export use interior locking, and the contents of the
+// struct are opaque to Rust.
+unsafe impl Sync for Entry<'_> {}
+
+impl<'a> Entry<'a> {
+    /// Constructs a new DebugFS [`Entry`] from the underlying pointer.
+    ///
+    /// # Safety
+    ///
+    /// The pointer must either be an error code, `NULL`, or represent a transfer of ownership of a
+    /// live DebugFS directory. If this is a child directory or file, `'a` must be less than the
+    /// lifetime of the parent directory.
+    #[cfg(CONFIG_DEBUG_FS)]
+    unsafe fn from_ptr(entry: *mut bindings::dentry) -> Self {
+        Self {
+            entry,
+            _phantom: PhantomData,
+        }
+    }
+
+    #[cfg(not(CONFIG_DEBUG_FS))]
+    fn new() -> Self {
+        Self {
+            _phantom: PhantomData,
+        }
+    }
+
+    /// Returns the pointer representation of the DebugFS directory.
+    ///
+    /// # Guarantees
+    ///
+    /// Due to the type invariant, the value returned from this function will always be an error
+    /// code, NUL, or a live DebugFS directory.
+    // If this function is ever needed with `not(CONFIG_DEBUG_FS)`, hardcode it to return
+    // `ERR_PTR(ENODEV)`.
+    #[cfg(CONFIG_DEBUG_FS)]
+    fn as_ptr(&self) -> *mut bindings::dentry {
+        self.entry
+    }
+}
+
+impl Drop for Entry<'_> {
+    fn drop(&mut self) {
+        // SAFETY: `debugfs_remove` can take `NULL`, error values, and legal DebugFS dentries.
+        // `as_ptr` guarantees that the pointer is of this form.
+        #[cfg(CONFIG_DEBUG_FS)]
+        unsafe {
+            bindings::debugfs_remove(self.as_ptr())
+        }
+    }
+}
+
+/// Owning handle to a DebugFS directory.
+///
+/// This directory will be cleaned up when the handle leaves scope.
+pub struct Dir<'a>(Entry<'a>);
+
+impl<'a> Dir<'a> {
+    /// Create a new directory in DebugFS. If `parent` is [`None`], it will be created at the root.
+    #[cfg(CONFIG_DEBUG_FS)]
+    fn create<'b>(name: &CStr, parent: Option<&'a Dir<'b>>) -> Self {
+        let parent_ptr = match parent {
+            Some(parent) => parent.0.as_ptr(),
+            None => core::ptr::null_mut(),
+        };
+        // SAFETY:
+        // * `name` argument points to a NUL-terminated string that lives across the call, by
+        //   invariants of `&CStr`.
+        // * If `parent` is `None`, `parent` accepts null pointers to mean create at root.
+        // * If `parent` is `Some`, `parent` accepts live dentry debugfs pointers.
+        //   so we can call `Self::from_ptr`.
+        let dir = unsafe { bindings::debugfs_create_dir(name.as_char_ptr(), parent_ptr) };
+
+        // SAFETY: `debugfs_create_dir` either returns an error code or a legal `dentry` pointer,
+        Self(unsafe { Entry::from_ptr(dir) })
+    }
+
+    #[cfg(not(CONFIG_DEBUG_FS))]
+    fn create<'b>(_name: &CStr, _parent: Option<&'a Dir<'b>>) -> Self {
+        Self(Entry::new())
+    }
+
+    /// Create a DebugFS subdirectory.
+    ///
+    /// Subdirectory handles cannot outlive the directory handle they were created from.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let parent = Dir::new(c_str!("parent"));
+    /// let child = parent.subdir(c_str!("child"));
+    /// ```
+    pub fn subdir<'b>(&'b self, name: &CStr) -> Dir<'b> {
+        Dir::create(name, Some(self))
+    }
+
+    /// Create a new directory in DebugFS at the root.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let debugfs = Dir::new(c_str!("parent"));
+    /// ```
+    pub fn new(name: &CStr) -> Self {
+        Dir::create(name, None)
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index c3762e80b314316b4b0cee3bfd9442f8f0510b91..86f6055b828d5f711578293d8916a517f2436977 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -45,6 +45,7 @@
 #[doc(hidden)]
 pub mod build_assert;
 pub mod cred;
+pub mod debugfs;
 pub mod device;
 pub mod device_id;
 pub mod devres;

-- 
2.49.0.967.g6a0df3ecc3-goog

