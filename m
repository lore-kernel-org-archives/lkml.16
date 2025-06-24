Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC84026AA88
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807532; cv=none; b=f7vdlAXyOelSbnZWcrozfdhGUogmGnFPFDBf1mnYv6NIOoRykShr5Z7qeupYBP/d2u4Zl43URALB+w1FcuFq07Nj7OvqEgqxkJ40IO3KYL504Opabjf3A1YPJlgulYZ1xXUk9RLfPqSNfmhrrcZqtYR+m6RCiVYd3ijrzLDCERc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807532; c=relaxed/simple;
	bh=+xp41C/RfBpKkqE2Sxk4nZLaUiDWnhTMhBINwGivj98=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AyvW2dnzFK/2Bpkw/ogQEtjBI8Iwv0rcn7aeenrofhuQveDN8jUVyL+CWIoTWflz7SDI/QCpchOueDjD5y+2Mu81wYzSPuocQkJiTCftaMiySvCBXx213Xq1cG5xUSpXVOhYxGCw4ei9EwuizWctHB2Sd7OWo3utT1uz/HTW/cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vhp298hR; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vhp298hR"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso6471750a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750807530; x=1751412330; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/u7X21DjoTPTxomPOqlU4vHtlMJD+vn/x0gh1izMaRc=;
        b=Vhp298hR3/GKyFVEvRu6s26CdjM6xPMvVlBuCPOFBnBPlekGgHuS2NfU10plnugHnR
         ZvUW3hxipuE5rj7E9YcLqsDpIvxRBtzKm4MskujLzhuDGVQ7mGp2+MKjWctp19T0HYze
         5E/mtUB6wsDQLV/M0GStUhIIkIYfS4yO0kaxrFuXgo/+aV3FEP4MgImSH9cCcaNg5eq3
         WgmaWDz+4C4C6N0vgn4inlc362Ds1AyhmT/bmiB4APQ7q2vw8WQxH9/Qq5CKGOR+006R
         WNH3VbCU0OMwo0ym/qoIC/37HJ9L7IiwsuLJpSNgV+W9cRPHneuJeI3HOfqundPp5qsM
         XkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750807530; x=1751412330;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/u7X21DjoTPTxomPOqlU4vHtlMJD+vn/x0gh1izMaRc=;
        b=shnL4Jzwl1PJSrCQMToRugzDM7lg8bnUpsQjX4tO0Njp8lKOBrEmQoVPtCrpNe0C7V
         GSgdGZqPd/dDgkrCZp+unwFP7omPpzix2lzxkjje9T+lEvW53/Vnt4QW4o+PtVQGfipL
         eMj1jXx2MaPFct8g33TIeLL2Qd3/4Y1lgVOX+HW9+NOSOnOyGvwD6t4dgcXIt4OeODmn
         lz2Ls7vts5DRiiNmfNHfYRlvK4jnNpqhIV/pnVUHYsJiBjDBkGiM9y24ruN8WZnCypEG
         yx5dVHQQI+AzNG0twzJUs65XIAQq+1UC+k2Opr1eX3j+0ST26kLM2YcJE18fLIe7HXlA
         m4JQ==
X-Gm-Message-State: AOJu0Ywi3wUDjLf2BG2PsvSpMzy+gL0IDCDW+OIOFc2l/HZjAp0RxLgT
	naAjYeAIAAcmTvkS2e0PMRbmzlJqIeRiuaAwz45+7Id04O66YFmqUAN0lmjwnS5z6UdQkebC+Cm
	8jsXUOTMyCA==
X-Google-Smtp-Source: AGHT+IHyklagcPPuIpqO44y6dk4CBr/pVhvvzuFnM/jRch5NtGNtw1eN/CDkEdGm6nwiLwOuwlsfNTYcEy/W
X-Received: from pjbsr13.prod.google.com ([2002:a17:90b:4e8d:b0:311:8076:14f1])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4988:b0:313:d79e:1f48
 with SMTP id 98e67ed59e1d1-315f2675beemr1149688a91.16.1750807530092; Tue, 24
 Jun 2025 16:25:30 -0700 (PDT)
Date: Tue, 24 Jun 2025 23:25:20 +0000
In-Reply-To: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750807526; l=7537;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=+xp41C/RfBpKkqE2Sxk4nZLaUiDWnhTMhBINwGivj98=; b=QG8NOTQwzEEj3qrpQze05r6EKB80xbtOCS9Y+slO9tHjvEJtgayszWc22LzBzILyfmPWdMTKw
 Ig7eEZJwTIuAIKnED4KTDAZRNFXVMdG+7ZnlyZfyiBq1NNsx+pVCWU5
X-Mailer: b4 0.14.2
Message-ID: <20250624-debugfs-rust-v7-1-9c8835a7a20f@google.com>
Subject: [PATCH v7 1/6] rust: debugfs: Bind DebugFS directory creation
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

Support creating DebugFS directories and subdirectories. Similar to the
original DebugFS API, errors are hidden.

Directories persist until their handle and the handles of any child
objects have been dropped.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS                     |  2 +
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/debugfs.rs          | 90 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/debugfs/entry.rs    | 58 ++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 5 files changed, 152 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3f7fbd0d67afe8376ea84bc17d70e9fa4b89bf6..551e3a6a16d9051a2d58a77614c458287da2bdcc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7366,6 +7366,8 @@ F:	include/linux/kobj*
 F:	include/linux/property.h
 F:	include/linux/sysfs.h
 F:	lib/kobj*
+F:	rust/kernel/debugfs.rs
+F:	rust/kernel/debugfs/
 F:	rust/kernel/device.rs
 F:	rust/kernel/device_id.rs
 F:	rust/kernel/devres.rs
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 8cbb660e2ec218021d16e6e0144acf6f4d7cca13..655d88b8e7fe717190ccfb7b8173e84213bf8331 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -45,6 +45,7 @@
 #include <linux/cpufreq.h>
 #include <linux/cpumask.h>
 #include <linux/cred.h>
+#include <linux/debugfs.h>
 #include <linux/device/faux.h>
 #include <linux/dma-mapping.h>
 #include <linux/errname.h>
diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
new file mode 100644
index 0000000000000000000000000000000000000000..2359bd11cd664fb9f7206f8fe38f758dc43d2cb8
--- /dev/null
+++ b/rust/kernel/debugfs.rs
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Google LLC.
+
+//! DebugFS Abstraction
+//!
+//! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
+
+#[cfg(CONFIG_DEBUG_FS)]
+use crate::prelude::GFP_KERNEL;
+use crate::str::CStr;
+#[cfg(CONFIG_DEBUG_FS)]
+use crate::sync::Arc;
+
+#[cfg(CONFIG_DEBUG_FS)]
+mod entry;
+#[cfg(CONFIG_DEBUG_FS)]
+use entry::Entry;
+
+/// Owning handle to a DebugFS directory.
+///
+/// This directory will be cleaned up when the handle and all child directory/file handles have
+/// been dropped.
+// We hold a reference to our parent if it exists to prevent the dentry we point to from being
+// cleaned up when our parent is removed.
+pub struct Dir(#[cfg(CONFIG_DEBUG_FS)] Option<Arc<Entry>>);
+
+impl Dir {
+    /// Create a new directory in DebugFS. If `parent` is [`None`], it will be created at the root.
+    #[cfg(CONFIG_DEBUG_FS)]
+    fn create(name: &CStr, parent: Option<&Dir>) -> Self {
+        let parent_ptr = match parent {
+            // If the parent couldn't be allocated, just early-return
+            Some(Dir(None)) => return Self(None),
+            Some(Dir(Some(entry))) => entry.as_ptr(),
+            None => core::ptr::null_mut(),
+        };
+        // SAFETY:
+        // * `name` argument points to a NUL-terminated string that lives across the call, by
+        //   invariants of `&CStr`.
+        // * If `parent` is `None`, `parent_ptr` is null to mean create at root.
+        // * If `parent` is `Some`, `parent_ptr` is a live dentry debugfs pointer.
+        let dir = unsafe { bindings::debugfs_create_dir(name.as_char_ptr(), parent_ptr) };
+
+        Self(
+            // If Arc creation fails, the `Entry` will be dropped, so the directory will be cleaned
+            // up.
+            Arc::new(
+                // SAFETY: `debugfs_create_dir` either returns an error code or a legal `dentry`
+                // pointer, and the parent is the same one passed to `debugfs_create_dir`
+                unsafe { Entry::new(dir, parent.and_then(|dir| dir.0.clone())) },
+                GFP_KERNEL,
+            )
+            .ok(),
+        )
+    }
+
+    #[cfg(not(CONFIG_DEBUG_FS))]
+    fn create(_name: &CStr, _parent: Option<&Dir>) -> Self {
+        Self()
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
+    pub fn subdir(&self, name: &CStr) -> Self {
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
diff --git a/rust/kernel/debugfs/entry.rs b/rust/kernel/debugfs/entry.rs
new file mode 100644
index 0000000000000000000000000000000000000000..ae0e2c4e1d58e878ebb081a71e4ac0f4a7d99b91
--- /dev/null
+++ b/rust/kernel/debugfs/entry.rs
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Google LLC.
+
+use crate::sync::Arc;
+
+/// Owning handle to a DebugFS entry.
+///
+/// # Invariants
+///
+/// The wrapped pointer will always be `NULL`, an error, or an owned DebugFS `dentry`.
+pub(crate) struct Entry {
+    entry: *mut bindings::dentry,
+    _parent: Option<Arc<Entry>>,
+}
+
+// SAFETY: [`Entry`] is just a `dentry` under the hood, which the API promises can be transferred
+// between threads.
+unsafe impl Send for Entry {}
+
+// SAFETY: All the native functions we re-export use interior locking, and the contents of the
+// struct are opaque to Rust.
+unsafe impl Sync for Entry {}
+
+impl Entry {
+    /// Constructs a new DebugFS [`Entry`] from the underlying pointer.
+    ///
+    /// # Safety
+    ///
+    /// The pointer must either be an error code, `NULL`, or represent a transfer of ownership of a
+    /// live DebugFS directory. If this is a child directory or file, `'a` must be less than the
+    /// lifetime of the parent directory.
+    ///
+    /// If the dentry has a parent, it must be provided as the parent argument.
+    pub(crate) unsafe fn new(entry: *mut bindings::dentry, parent: Option<Arc<Entry>>) -> Self {
+        Self {
+            entry,
+            _parent: parent,
+        }
+    }
+
+    /// Returns the pointer representation of the DebugFS directory.
+    ///
+    /// # Guarantees
+    ///
+    /// Due to the type invariant, the value returned from this function will always be an error
+    /// code, NULL, or a live DebugFS directory.
+    pub(crate) fn as_ptr(&self) -> *mut bindings::dentry {
+        self.entry
+    }
+}
+
+impl Drop for Entry {
+    fn drop(&mut self) {
+        // SAFETY: `debugfs_remove` can take `NULL`, error values, and legal DebugFS dentries.
+        // `as_ptr` guarantees that the pointer is of this form.
+        unsafe { bindings::debugfs_remove(self.as_ptr()) }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c37f4da1866e993be6230bc6715841..43f40b1baa9717ea71e4586042e9e6979491ad37 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -66,6 +66,7 @@
 pub mod cpufreq;
 pub mod cpumask;
 pub mod cred;
+pub mod debugfs;
 pub mod device;
 pub mod device_id;
 pub mod devres;

-- 
2.50.0.714.g196bf9f422-goog

