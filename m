Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFA119F42C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750213699; cv=none; b=FqKtg/eajgcf6GF+CcA0hKikEAHTGhShwzc7fRK9deyZCii9XnvfqYeWdbVlqHlL3ygGs1RXG5Vqd9Bb110KTTB+pVEkYUQvZpHErhxjD+c+pPBYl2WO9CBwi1zJeOgZrLttnoBdgABTVyLIqr2/de3fT2yM+JVGGMYVckXPA+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750213699; c=relaxed/simple;
	bh=c91v0oZSa1f3RWSJbPI/Wr8as6LUX6oZYXpz1cZXU4w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qA+1s/SSPP+wVD3U3VFRa9wkwzzXp2DSi6G9SRudyV8MLhykcWu0P2AhoeDZPeZV1Ksl4adGK9fGrwxZTMZ5fDn6hJYaBOOAcLogijG42TLWYVR8hGmdgqByLqjEA801nOwpM4KsRUSMhtCgaG5AqFg2eKT83hCUefzeZ0e8HcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SHMhnzXp; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SHMhnzXp"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2eeff19115so8105275a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750213697; x=1750818497; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AdgGyioAlpkKqnAzoZUsP7EnTyjVQhraIGn06X2d058=;
        b=SHMhnzXp7uCEfl1WF3jmZqIX8LyxBqM91A/9ytWtjadcnE8m5ngA8PfL3okxPd7IzB
         zuiNCfgshQ+PeRuKG+CNIctrpmQ1LgTq0iO7tAVeNKi2Lu+A7FbjTfGmVTX+iQp+mvH6
         8R4RNu/x6r/gWAEwEBmrJH9pHd6DpNCJ8AearVzuMYNJQHXHworN778mQlhQiRRmCyNf
         RkQ76b6GkOV09fKfKfuTKfymtgYtdbrBtUiOjSRfC4KuMtIUMpG8rIFYgSiTuuT+T3ks
         H7Xn1E7JwaJWMUsSPEYGq3DNUMtupRXjOR78xsF4UxBuCgGCcOP1f5ogtO9Xhy6TCbya
         C3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750213697; x=1750818497;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdgGyioAlpkKqnAzoZUsP7EnTyjVQhraIGn06X2d058=;
        b=UuEgwv53T0PAFidxIgy0LaT4Z6Y5BhW2XyHZ2ufJW+3HNTdn/7ObEgaGiuxjKuZfFP
         YzRWx16rZvmgUb9TSwcAP6eDKXKOMw2FRHFDNSTLC69DqNgGvyziYxDet/qG8YmkMOa8
         pKUUU12LqP72Gi2Xq2C/9JcWFeK+X0eCU4E8dNffFQJh+tXeGGeBdhainMfa2D4A6nxw
         jKIhZEKgYUN9S28aOfOMQTj7aYNmwOXUWt5B8tU+6X2CS2eB6fzLtVZJr7jYEe4t1mBy
         feZFBthkkK0pe6dyH1k5eaIvd7mkaKawUFiOVx1V4FbCC8QDTl8AlQCBcJbh6ke6xOcn
         CFpA==
X-Gm-Message-State: AOJu0YwEVTSYo84YLWajZLjmjXkgmd5ytMOtTEJbshYoJYkd04R9zST6
	2UCIVdqb8b4B2p0bbJVEazfAX4zV+u/GamJm35cG3jz7Buhjg7sc0UHAI3fkcRnJokqrlBYJ/kO
	drAg5DQYN8A==
X-Google-Smtp-Source: AGHT+IHQoOX+BrqTUCm/O8EOIxNbaBK2exfCPiELR02vgoPnaMHTN1gMaoiO1O1+N32pH0UA6ktp2C3TD0oy
X-Received: from pgac10.prod.google.com ([2002:a05:6a02:294a:b0:b2c:3a2e:ac7])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a343:b0:21f:4631:811c
 with SMTP id adf61e73a8af0-21fbd556858mr21618936637.19.1750213697334; Tue, 17
 Jun 2025 19:28:17 -0700 (PDT)
Date: Wed, 18 Jun 2025 02:28:13 +0000
In-Reply-To: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750213694; l=7508;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=c91v0oZSa1f3RWSJbPI/Wr8as6LUX6oZYXpz1cZXU4w=; b=EFdrhCeNGoeFPIHxGRT9W2s1EVCBCWFyS6Peod1Ov2+bo3mono66oIM3+lu82cr75uYqOiycv
 WGtL8B9VtV2CBEYEDNA4nHrkc8j0xex2cw++mZ+AUfvKTQ4aGMm0JA1
X-Mailer: b4 0.14.2
Message-ID: <20250618-debugfs-rust-v6-1-72cae211b133@google.com>
Subject: [PATCH v6 1/5] rust: debugfs: Bind DebugFS directory creation
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
 rust/kernel/debugfs.rs          | 88 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/debugfs/entry.rs    | 58 +++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 5 files changed, 150 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ec49e19734256f0c0c0960b722293edeb851562a..fda422023e30fe8821e4cd79b503693ecc6eb48c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7373,6 +7373,8 @@ F:	include/linux/kobj*
 F:	include/linux/property.h
 F:	include/linux/sysfs.h
 F:	lib/kobj*
+F:	rust/kernel/debugfs.rs
+F:	rust/kernel/debugfs/
 F:	rust/kernel/device.rs
 F:	rust/kernel/device/
 F:	rust/kernel/device_id.rs
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
index 0000000000000000000000000000000000000000..e390278b8b7384f1d9e2b3d7a4f5f365f6447d0f
--- /dev/null
+++ b/rust/kernel/debugfs.rs
@@ -0,0 +1,88 @@
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
+
+/// Owning handle to a DebugFS directory.
+///
+/// This directory will be cleaned up when the handle and all child directory/file handles have
+/// been dropped.
+// We hold a reference to our parent if it exists to prevent the dentry we point to from being
+// cleaned up when our parent is removed.
+pub struct Dir(#[cfg(CONFIG_DEBUG_FS)] Option<Arc<entry::Entry>>);
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
+                unsafe { entry::Entry::new(dir, parent.and_then(|dir| dir.0.clone())) },
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
2.50.0.rc2.696.g1fc2a0284f-goog

