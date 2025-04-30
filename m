Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3815A229B29
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746055929; cv=none; b=MZyDlvtFITe6IYJiqtSVyWItRndu10iz5CZg8HcqcTKJET6fiDw1Qin+xUwHp2luz/QJ38ay7vM9BcdrZekrIv6mHdFzhQUDoyVkoJqfcviOFQDhov9URaYYlSwbI8DjCBn/IQ2VmutkIyNaAVH7exOJP7SboO3xq63R1iYfzAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746055929; c=relaxed/simple;
	bh=yPlSgrrz4IXdvGcnIh4cW6PR57JStxkzPpJQO5+RMzU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d16GWn9W7BqSTHVO/nIUoTevQ275gYidN7WVedoDucIryJl1GZixRlDHIoZjsdVrB89TTZheL/ps5Eqi52ODLylmZngp/irXKrXBsKvykxQxi8/9bGZzAuqxdOXns8xwpIN5k3k2gZRcK5J+DAjTCA6ZL6vZSDypjggqG8WVO/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eYBLdS+M; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eYBLdS+M"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30a2a2c99f6so594820a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746055927; x=1746660727; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhx6v/+VUn2kb10b8iM44dLEQVytCie/Z3XMWWbZPuY=;
        b=eYBLdS+MEEQcRMi4ooNQwyFkpJVsq37ex/gJjcvYheA1NcpfB+qHbVzmY6X43fDqby
         iZUNvEsCJgkffnqx5t4XGMbgPQ1w6ka/GlzU3szMkDCgqj174yW7skUUnGrvICiBDhuT
         hzbceE8Fez1aiF1MCvMjgPMmg2/xXSXt+zfM0d9SyKDKO08iSBXKZoJKMAvcc0wKlIDU
         fWh+o9h8L+yzFo4r9xdJugXZtW3Y9VSCM2l1C6x2TIwbkc55Sg3SyAY4HXZK0MXD4qPe
         w2/F3cO+jnAX9nEl3edvRk/gq1zN55DO/yGCJ79GynWeQsh7xhG6UhvVfIcnP9z17jCv
         sWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746055927; x=1746660727;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhx6v/+VUn2kb10b8iM44dLEQVytCie/Z3XMWWbZPuY=;
        b=hf/Rf2RBGJLkyTx90NPE6xFwGZMrOfuupcJh816vN7YCJ7aMDznfX6LSX7lMWyit05
         3iG/0B/8p15HTSIUCBobuLRupsHCGEWkCItg35mI/YB9O/GCIMlSW12ucNkF01C6DtCN
         sCmam3w+KXgjvMdSt3qAKIsxiADT+Q8OuCHbVM4aF4hc9RthXWBWfW3/3cMjJqwUkTnJ
         bXhjX2nyqaz72aWZmsc3I9H9sB+4fmlWtHh2bUsl88fHWoQ9Y2Vsdc9oaIvMhfCu8dx2
         E/AStS+zVNvlNJwCAwbJqTEmjYm7W09AFDVMFf7kKlvw1ycCf571tkOQxHbYTR1FVPs+
         MWog==
X-Gm-Message-State: AOJu0Yz514iZLUaSGJ3LtD//ilyIpB2K0PnAev3lD19ut9p4FUNx2cX+
	dQZn407ZKpCMAARYV4Cl0NTwxH1m/edRnT5aXCaZx9nxs7K0hlv2KEv63k7dfWaSUyFMkKrXwA7
	NWbiDkw==
X-Google-Smtp-Source: AGHT+IGmun35lYu+juO8WNDrBAweocBeo9jksRENwv/DORWF0CR/Z0hH+/xYXvi/6POmN51ZaEpqgsNhnM3x
X-Received: from pjbeu4.prod.google.com ([2002:a17:90a:f944:b0:301:1bf5:2f07])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:56cc:b0:30a:20d6:ed35
 with SMTP id 98e67ed59e1d1-30a41ec6b80mr811328a91.23.1746055927519; Wed, 30
 Apr 2025 16:32:07 -0700 (PDT)
Date: Wed, 30 Apr 2025 23:31:56 +0000
In-Reply-To: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746055923; l=6660;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=yPlSgrrz4IXdvGcnIh4cW6PR57JStxkzPpJQO5+RMzU=; b=0PGZHBdNMf+sWawAXN8TN9TepRTOl4EO1hWo4wLpcAdshElgeyYwhinazyZAq3sbDqbGngqiP
 OYsZXtupkK0AQzs+aj+UplNkqgdBH+siGWkzSR1yVIPprSL17cOm2s8
X-Mailer: b4 0.14.2
Message-ID: <20250430-debugfs-rust-v2-1-2e8d3985812b@google.com>
Subject: [PATCH v2 1/4] rust: debugfs: Bind DebugFS directory creation
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

By default, when a directory handle leaves scope, it will be cleaned up.
This can be suppressed by calling `.keep()` on it.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/debugfs.rs          | 135 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 4 files changed, 138 insertions(+)

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
index 0000000000000000000000000000000000000000..b533ab21aaa775d4e3f33caf89e2d67ef85592f8
--- /dev/null
+++ b/rust/kernel/debugfs.rs
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! DebugFS Abstraction
+//!
+//! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
+
+use crate::str::CStr;
+
+/// Handle to a DebugFS directory.
+// INVARIANT: The wrapped pointer will always be NULL, an error, or an owned DebugFS `dentry`
+pub struct Dir(#[cfg(CONFIG_DEBUG_FS)] *mut bindings::dentry);
+
+// SAFETY: Dir is just a `dentry` under the hood, which the API promises can be transferred
+// between threads.
+unsafe impl Send for Dir {}
+
+// SAFETY: All the native functions we re-export use interior locking, and the contents of the
+// struct are opaque to Rust.
+unsafe impl Sync for Dir {}
+
+impl Dir {
+    /// Create a new directory in DebugFS at the root.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// {
+    ///    let parent = Dir::new(c_str!("parent"));
+    ///    // parent exists in DebugFS here.
+    /// }
+    /// // It does not exist here.
+    /// ```
+    pub fn new(name: &CStr) -> Self {
+        Self::create(name, None)
+    }
+
+    /// Create a DebugFS subdirectory.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// {
+    ///    let parent = Dir::new(c_str!("parent"));
+    ///    // parent exists in DebugFS here.
+    ///    let child = parent.subdir(c_str!("child"));
+    ///    // parent/child exists in DebugFS here.
+    /// }
+    /// // Neither exist here.
+    /// ```
+    pub fn subdir(&self, name: &CStr) -> Self {
+        Self::create(name, Some(self))
+    }
+
+    /// Create a new directory in DebugFS. If `parent` is [`None`], it will be created at the root.
+    #[cfg(CONFIG_DEBUG_FS)]
+    fn create(name: &CStr, parent: Option<&Self>) -> Self {
+        let parent_ptr = match parent {
+            Some(parent) => parent.as_ptr(),
+            None => core::ptr::null_mut(),
+        };
+        // SAFETY:
+        // * name argument points to a null terminated string that lives across the call, by
+        //   invariants of `&CStr`
+        // * If parent is None, parent accepts null pointers to mean create at root
+        // * If parent is Some, parent accepts live dentry debugfs pointers
+        // * `debugfs_create_dir` either returns an error code or a legal `dentry` pointer,
+        //   so we can call `Self::from_ptr`
+        unsafe { Self::from_ptr(bindings::debugfs_create_dir(name.as_char_ptr(), parent_ptr)) }
+    }
+
+    #[cfg(not(CONFIG_DEBUG_FS))]
+    fn create(_name: &CStr, _parent: Option<&Self>) -> Self {
+        Self()
+    }
+
+    /// Constructs a new DebugFS [`Dir`] from the underlying pointer.
+    ///
+    /// # Safety
+    ///
+    /// The pointer must either be an error code, NULL, or represent a transfer of ownership of a
+    /// live DebugFS directory.
+    #[cfg(CONFIG_DEBUG_FS)]
+    unsafe fn from_ptr(ptr: *mut bindings::dentry) -> Self {
+        Self(ptr)
+    }
+
+    /// Returns the pointer representation of the DebugFS directory.
+    ///
+    /// # Invariant
+    ///
+    /// The value returned from this function will always be an error code, NUL, or a live DebugFS
+    /// directory.
+    // If this function is ever needed with `not(CONFIG_DEBUG_FS)`, hardcode it to return `ENODEV`.
+    #[cfg(CONFIG_DEBUG_FS)]
+    fn as_ptr(&self) -> *mut bindings::dentry {
+        self.0
+    }
+
+    /// Allow the handle to go out of scope without removing the directory.
+    ///
+    /// Equivalent to `core::mem::forget`, but with a more semantically meaningful name.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// {
+    ///    let parent = Dir::new(c_str!("parent"));
+    ///    parent.subdir(c_str!("child")).keep();
+    ///    // We have no handle to the child, but it will not be deleted directly.
+    /// }
+    /// // When parent is deleted, it will still be deleted.
+    /// ```
+    pub fn keep(self) {
+        core::mem::forget(self)
+    }
+}
+
+impl Drop for Dir {
+    fn drop(&mut self) {
+        // SAFETY: `debugfs_remove` can take NULL, error values, and legal DebugFS dentries.
+        // `as_ptr` guarantees that the pointer is of this form.
+        #[cfg(CONFIG_DEBUG_FS)]
+        unsafe {
+            bindings::debugfs_remove(self.as_ptr())
+        }
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
2.49.0.906.g1f30a19c02-goog

