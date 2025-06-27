Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C9327E042
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751066337; cv=none; b=jhTQ5o7zD3psigqK9/vwpL0kVRg5fibuArdMvnnIL5BAiaCYzPbmhhapo/zqC6D3F9Elr6riGHS9RSR5cV3d2VmKLf+XONQVna5yNZ10HF3+frRyOkcTvE7lw9qT8MjvNz18gebfva/HKdyvtqDq9PebKkG0KN6dfXFRsF4o+Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751066337; c=relaxed/simple;
	bh=mx4vr3xsZbWWyuXLJVx0noMJ6L9O5fA3UXhOWAagXpk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Du0NL1o9JixsgRoVHyePZaal294K8hPZGR744NWtIBW3n1DpN7n18YO1APPWCl65wUC3wWhNugCq87GVNT0H3LTLqfPN/4ftagh5ilLp3L7/WzYiqayBVXL7OKo7XzIa8wZWMo5U+WrBh2qeEB/ROa3oAROatF5uWq41MCTXeUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f4fOBTeh; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f4fOBTeh"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3138e671316so1986947a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751066335; x=1751671135; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WWBYj6LXkY+sbts5Ks2w5a5WSEUUf8P7kitBMqSoq8s=;
        b=f4fOBTehQcjgvsYoP4YOW3HLcAkLgvjWPSxLoA/C1gOM87hlsKur57zrWof3f0fUOC
         2F9zXJqjgeR4pudfoODqoPlhhypZD51ZXAyIHzhOB0DhPUnzIN5o4zrfxPnHjbRKuWqY
         bup5PO8L7k6Lo6Pi2S6nN9/xMifXIES8zFUwftsDfdPdUnnu9/3JgSLUab7qJj+/gDJl
         NRxLaEgmvC4p6oYRLDzq4A/8v6pZZQvSBAshQy9SP02hvnFrroiDB7sVv1jHJd1oicfH
         UfICIlo+U0Gb76JmhaYblOEVXan81NVBIy/xrk+pDsrIxIl6U/BdLawZuUPJvFdtbo0W
         syVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751066335; x=1751671135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WWBYj6LXkY+sbts5Ks2w5a5WSEUUf8P7kitBMqSoq8s=;
        b=ejuzQhqdxLNaP+kyHFqulEB+xazSCkF1lcNBBjmMaEDyuP87hErcZD2XRX3HjbfX0D
         Wl6CwhbzIXH1ixa9RpoLV8XD3gs82Kw5VtHmpIw+2iHHIir7q2mQjgbqMEhTQqXJ9Hhu
         bWMUd0zyn/mxNvPnxOD0WJq+80L0lOp5gmLyESgdpTos7qgjHCxALt1iY1HMfPYpxfPn
         VuB1m5Zr/WPQOYE8P0MeVBTsCdDNDi00MMZpr8mQbIwPQ3cyD3FP27Qw6WbEs2Eqejcj
         wkbEys84/6dEFl3HPFtGDXk69jSeNgdGkbnCoSVtXABE3m+JCo1UEZUwTdfc1mKMi0Md
         ffhQ==
X-Gm-Message-State: AOJu0YzM0DHzYwuhF5qCNHa0++OPgrLBAZwhHingrnWRjeKS3wEVtrpV
	vM0V72cE3PzgLQh2WO27Fro9q2tuk30UrbvZZ9DhgkGYoewmSiYYOsyT6GoZpD3/5NlRpt6PfLE
	w0pko4k6a+Q==
X-Google-Smtp-Source: AGHT+IEe1az+j0BJXbQANCoSwc6QB/5j1Ts9K/N3RuCTtXStYM1usQmOlj0d9CIZAE6dN7r+2lNiH9l44ryE
X-Received: from pjboi12.prod.google.com ([2002:a17:90b:3a0c:b0:2fc:c98:ea47])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2b50:b0:30a:9feb:1e15
 with SMTP id 98e67ed59e1d1-316d69bfbeamr14320669a91.8.1751066334800; Fri, 27
 Jun 2025 16:18:54 -0700 (PDT)
Date: Fri, 27 Jun 2025 23:18:24 +0000
In-Reply-To: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751066331; l=7586;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=mx4vr3xsZbWWyuXLJVx0noMJ6L9O5fA3UXhOWAagXpk=; b=MK0NlxO5/VM5swSL4YtqA9y4Myu5Wd/27eOOQVe0dtvj0dy99mxjanydEc4zoHM33y+G+jdNV
 3bMaqfdNoJ+CLOvwYs7Nd0ZXUjaXrhGoZIE8gDzZukb1sC+Iil8N94p
X-Mailer: b4 0.14.2
Message-ID: <20250627-debugfs-rust-v8-1-c6526e413d40@google.com>
Subject: [PATCH v8 1/6] rust: debugfs: Bind DebugFS directory creation
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

Support creating DebugFS directories and subdirectories. Similar to the
original DebugFS API, errors are hidden.

Directories persist until their handle and the handles of any child
objects have been dropped.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
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
2.50.0.727.gbf7dc18ff4-goog

