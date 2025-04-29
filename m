Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84DE259C9B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968561; cv=none; b=lhiDUWFSZ2XdyhRjVtYQDcI6M3Ye+BYxYPMp+wlFD8hUQn0w+gAhYT+4twOQLWaXL9Gr2ErxEr1iG+A7PIHJECoWX2FWP6KMMpTXVjk4pqgLxAeAxhAdBHjvIXlNiidwM5dmQWqusb3+JcU2D82SI4762DBKkWpLzCFqJL0yEno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968561; c=relaxed/simple;
	bh=5x0e5QBv1Z4ozrUpH5qQ8gzEs1i//XcfEzkGBpTPNY0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O+ZUyJtypT8YWjHZDKhBGZMj3rmMnIwNFxVvTH7uPuj7fW+Uy1PtQJCXxxAkGgnlMcVtueAlxbBk61cksaXVPbsTu93kBIFgghhYqdXKNbuiGiH7kOpIgSlE6n5ZKL9eiRn6lrCSY21eMpwp19sbgeoXSkBdL4thokwEYIeb3dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sCSqsRla; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sCSqsRla"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af59547f55bso3606767a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968559; x=1746573359; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0NTGxWn82aDeVJrvCw0EHsDFY/VYn1O9kb+DYv5wee8=;
        b=sCSqsRlaxonR2PUiMpKLqaBUz+iE6mYC5p2FKPaABzBMWdTN5ZDd7OX3OLnL6BcSko
         T59iOLfMrpGDr1pLY0vtX/anTTVOizwvF4evYwsMZ6D0+6qUWYZi/YFUtbBNUn+YfUQp
         051hy/YcOgcoYiXZPD2/zIIr6Dhhr9BXMrhaMEW2Eo7oWopch71esVf0QkKomPq/ORnE
         EjkqImJqBCOYi8TLTMo+KPDabEKvTz27p3cLD9z8zooD9Ua5b7B28C6x71uTn5Z79dSZ
         AOy4ZtNWI0ICZSENpDbQkiPmssz6tu+v5Er+enYMwOhwiKC9Ls5VDDHfDiF7yQ8L9wmk
         jSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968559; x=1746573359;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0NTGxWn82aDeVJrvCw0EHsDFY/VYn1O9kb+DYv5wee8=;
        b=ItnPmsrkxtBrK7CrJERYp18EpFutzBSCPHn2gL6xtNiTutygtXUZyJNKg9BGo2N3Ck
         8P45DgaaW2oAOENptGQd6f2qNUbW1QAHRVKoKlXe5m11IM6tdFfnnPxhtVg9mB5ZfTZ9
         fvQzOMqJfgsRZac7tWiyXV6Y+KSxmGO3ER14p1A/7ZeclCL2eqOfnQ6+mDCq6UlFh5Y1
         vJb3X69kWcJVrEbwsIcd3mm/qfFR4aJ0qSUlIDZL4jtCaguCmhmI8w0rLplkcC8OkjTq
         21+PGwI0McEzq1AUNZN9oXZRkVLRFuEaTgyEespg2mb7qpB4Y2AOEMCdvIsLKdivPta+
         YEoQ==
X-Gm-Message-State: AOJu0YxjbmI/pj0d/y+hQtaeK59pqpTcxTPIBO0FQQb09W/TaiZI18xO
	l4+ppFKn7OMcSbAY4d1nh00AQmkKqvr0MMjA0gbpsWD3cLid5JDiBnHKKF0CmDjbJBVEoDrO5AF
	ypLbRig==
X-Google-Smtp-Source: AGHT+IEbMTQYfSqEHs3EurYngEiO9J68LRQDBTFBMc7unXnAgKve3i6odjKua0/2N/5RRPFOwqIOiWCULDg1
X-Received: from pgbcr13.prod.google.com ([2002:a05:6a02:410d:b0:af2:681:e27a])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3297:b0:1f3:41d5:65f6
 with SMTP id adf61e73a8af0-20aa4381202mr626913637.32.1745968558968; Tue, 29
 Apr 2025 16:15:58 -0700 (PDT)
Date: Tue, 29 Apr 2025 23:15:55 +0000
In-Reply-To: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745968555; l=6559;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=5x0e5QBv1Z4ozrUpH5qQ8gzEs1i//XcfEzkGBpTPNY0=; b=fSH2M0CgACUVXBOGPZE6ztg7TYQ2YvdGv3AyPgLdSDgn6pLTo9IvUJsnOVmc6noh4sMoCzL2b
 ZpQwJrK32YRCspRwdgxI+Ux8QIPfbPMSilygjC5ZeYH2PU0hMTPFzTl
X-Mailer: b4 0.14.2
Message-ID: <20250429-debugfs-rust-v1-1-6b6e7cb7929f@google.com>
Subject: [PATCH 1/8] rust: debugfs: Bind DebugFS directory creation
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

The basic API relies on `dput` to prevent leaks. Use of `debugfs_remove`
is delayed until the more full-featured API, because we need to avoid
the user having an reference to a dir that is recursively removed.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/dcache.c           |  12 +++++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/debugfs.rs          | 100 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 6 files changed, 116 insertions(+)

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
diff --git a/rust/helpers/dcache.c b/rust/helpers/dcache.c
new file mode 100644
index 0000000000000000000000000000000000000000..2396cdaa89a95a2be69fd84ec205e0f5f1b63f0c
--- /dev/null
+++ b/rust/helpers/dcache.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2025 Google LLC.
+ */
+
+#include <linux/dcache.h>
+
+struct dentry *rust_helper_dget(struct dentry *d)
+{
+	return dget(d);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index f34320e6d1f2fb56cc151ee2ffe5d331713fd36a..95f486c1175191483297b7140b99f1aa364c081c 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -15,6 +15,7 @@
 #include "cpumask.c"
 #include "cred.c"
 #include "device.c"
+#include "dcache.c"
 #include "dma.c"
 #include "err.c"
 #include "fs.c"
diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
new file mode 100644
index 0000000000000000000000000000000000000000..4d06cce7099607f95b684bad329f791a815d3e86
--- /dev/null
+++ b/rust/kernel/debugfs.rs
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! DebugFS Abstraction
+//!
+//! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
+
+use crate::error::{from_err_ptr, Result};
+use crate::str::CStr;
+use crate::types::{ARef, AlwaysRefCounted, Opaque};
+use core::ptr::NonNull;
+
+/// Handle to a DebugFS directory.
+pub struct Dir {
+    inner: Opaque<bindings::dentry>,
+}
+
+// SAFETY: Dir is just a `dentry` under the hood, which the API promises can be transferred
+// between threads.
+unsafe impl Send for Dir {}
+
+// SAFETY: All the native functions we re-export use interior locking, and the contents of the
+// struct are opaque to Rust.
+unsafe impl Sync for Dir {}
+
+// SAFETY: Dir is actually `dentry`, and dget/dput are the reference counting functions
+// for it.
+unsafe impl AlwaysRefCounted for Dir {
+    #[inline]
+    fn inc_ref(&self) {
+        // SAFETY: Since we have a reference to the directory,
+        // it's live, so it's safe to call dget on it.
+        unsafe {
+            kernel::bindings::dget(self.as_ptr());
+        }
+    }
+    #[inline]
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: By the caller precondition on the trait, we know that the caller has a reference
+        // count to the object.
+        unsafe {
+            kernel::bindings::dput(obj.cast().as_ptr());
+        }
+    }
+}
+
+impl Dir {
+    /// Create a new directory in DebugFS. If `parent` is [`None`], it will be created at the root.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// {
+    ///     let dir = Dir::new(c_str!("my_debug_dir"), None)?;
+    ///     // The directory will exist in DebugFS here.
+    /// }
+    /// // The directory will no longer exist in DebugFS here.
+    /// # Ok::<(), Error>(())
+    /// ```
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let parent = Dir::new(c_str!("parent"), None)?;
+    /// let child = Dir::new(c_str!("child"), Some(&parent))?;
+    /// // parent/child exists in DebugFS here.
+    /// drop(parent);
+    /// // The child dentry is still valid here, but DebugFS will have neither directory.
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn new(name: &CStr, parent: Option<&Self>) -> Result<ARef<Self>> {
+        let parent_ptr = match parent {
+            Some(parent) => parent.as_ptr(),
+            None => core::ptr::null_mut(),
+        };
+        // SAFETY:
+        // * name argument points to a null terminated string that lives across the call, by
+        //   invariants of &CStr
+        // * If parent is None, parent accepts null pointers to mean create at root
+        // * If parent is Some, parent accepts live dentry debugfs pointers
+        // * `debugfs_create_dir` either returns an error code or a legal `dentry` pointer,
+        //   so we can call `NonNull::new_unchecked`.
+        let dir = unsafe {
+            NonNull::new_unchecked(from_err_ptr(kernel::bindings::debugfs_create_dir(
+                name.as_char_ptr(),
+                parent_ptr,
+            ))?)
+        };
+        // SAFETY: Dir is a transparent wrapper for an Opaque<dentry>, and we received a live
+        // owning dentry from `debugfs_create_dir`, so we can wrap it in an ARef
+        Ok(unsafe { ARef::from_raw(dir.cast()) })
+    }
+
+    fn as_ptr(&self) -> *mut bindings::dentry {
+        self.inner.get()
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
2.49.0.901.g37484f566f-goog

