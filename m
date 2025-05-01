Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72328251790
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746139670; cv=none; b=Jeyc4UxTnz4V08KtLW3ge39PXlI/4GloWu3krFk0xhJ3o0Q05fyME7mBpYIgokF7i5zjFU95QkaO9TIXgvfci70O0epB7Cem/63HBA5vP1kir4ol2tU3Q+lowTj2JEe6MQPUCJGbsQKl95Zter105RCCePtARzgatQaxuVXCb+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746139670; c=relaxed/simple;
	bh=JbEd4yVGkc4CGLLwMtsUZunY8qOMQArWopLk0wZkvOI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TtjwMYHe3OrKIRrx4/fwfNCEdqyo/uDCwgyqYT2Q86gy8Lg+Z/nONEW71TC242OxnB6yEIBf4YKEiQOtHeBX3c1eN/AkoiQCrcAvSycjxonUk8jirE5lqiZApTkvhslahni5Sy+S/y3iC9dIFy4uBqdUj2eCD2WI5tFVoncLflQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QWaTUBI4; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QWaTUBI4"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7394792f83cso1181950b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746139667; x=1746744467; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w44KCo9lpA5CgPVgm2HVbQSg5eZSvHUWTxcca4PJz2I=;
        b=QWaTUBI40VapxdSFugblR0rqXds4ltyW4b6WS4cLWNv3vShBXzQjRImZ9iHLM/5GvA
         NC4zmEUcWlKGm1rGw6RWICgNFTHBrSC9IdX/sI6ixrMsO2rCAhmf+PCETqzqXDEpSnvn
         DxcbMXxIj1vGnZDBBZgRSCsnO0TJ0EF7b73WdKk79ogn1ibTjAQvv8wDl922uAE7Lme+
         L986mOoEcrJWFACBoKINMb0k09jR9wiJsDD3PTLnSEZ3/e9jWiSyZwaDoFsNuED/7jgh
         bGjVJ9NrRWyqri0cT/kVFeGBImVu/hhSGAlbKcTlhjkiQuVA3g32qvnqhnGh/SVahvLp
         Ab4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746139667; x=1746744467;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w44KCo9lpA5CgPVgm2HVbQSg5eZSvHUWTxcca4PJz2I=;
        b=amIiw1lcpkTP9t+tOdZ33az/NTtNuFglDJebdKEdEwsTPc+Iy/dqKnC3kuESJG/wdM
         EdYA3GKAWCWq00fQWLzSjr1BAemwRprNuT5NK8FWsSnDhn3U+Umzfd1CAdpwFOasub4G
         S85HYTn855fquqq7mspcjEJVxDxWtMMW2GBj45AB3rP8JycURYUE6H2u/GgKYPl0WhlR
         LjIW6Lxq3whsuaCTq9Vd+cTiaNqRSFSHPSr6vv7VnkAN2vCYvjPv+b1bxwJGaM/uCRnp
         TpVIr/4a26xcbUsB34lP9nQmC3/qNMXEAQ9ql8RR2Ue/I6YGIY3wsMQlANz7x3C3MhgI
         Sj0g==
X-Gm-Message-State: AOJu0YzSqOGA9SLep5F8JQI1blac5Ah+juZm1122qSY69Yx7JGSXuSio
	SjLoyDTYLLsiH62FDXhHIUwE5N81QrljfO57o8PdsWCWGt2QTPNcuaL5oX22PvSOkUooXYyDQR0
	+tonSiQ==
X-Google-Smtp-Source: AGHT+IGlVa2Bg4kQzTXqXrUtJZZg3o01lqCHz4aOmRSyKYFZMXefdnfozoziz1aewpPKP4pxqQiT2a9yT57m
X-Received: from pgbcz7.prod.google.com ([2002:a05:6a02:2307:b0:b0b:301e:8e96])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:394f:b0:1f5:7b6f:f8e8
 with SMTP id adf61e73a8af0-20cde36d531mr991871637.6.1746139666691; Thu, 01
 May 2025 15:47:46 -0700 (PDT)
Date: Thu, 01 May 2025 22:47:41 +0000
In-Reply-To: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746139663; l=7385;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=JbEd4yVGkc4CGLLwMtsUZunY8qOMQArWopLk0wZkvOI=; b=AQJYJpVCc5ljzQ9PEPNKo50FEdhNQQ74R4AtsT0cANrJVwYSmxn7/WQtCFRE6M2tDFvw+OqP1
 6Jx0HAB9yTtCPeDIhKlVC640Z65Flm/b6EzeipyXYoguP9JHww8qSpv
X-Mailer: b4 0.14.2
Message-ID: <20250501-debugfs-rust-v3-1-850869fab672@google.com>
Subject: [PATCH v3 1/4] rust: debugfs: Bind DebugFS directory creation
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
 rust/kernel/debugfs.rs          | 155 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 4 files changed, 158 insertions(+)

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
index 0000000000000000000000000000000000000000..b589c2d9a8d169bd66e98d2894261784e427230e
--- /dev/null
+++ b/rust/kernel/debugfs.rs
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! DebugFS Abstraction
+//!
+//! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
+
+use crate::str::CStr;
+use core::mem::ManuallyDrop;
+use core::ops::Deref;
+
+/// Owning handle to a DebugFS directory.
+///
+/// This directory will be cleaned up when it goes out of scope.
+///
+/// # Invariants
+///
+/// The wrapped pointer will always be `NULL`, an error, or an owned DebugFS `dentry`.
+#[repr(transparent)]
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
+    ///    // The path "parent" exists in DebugFS here.
+    /// }
+    /// // It does not exist here.
+    /// ```
+    pub fn new(name: &CStr) -> Self {
+        Self::create(name, None)
+    }
+
+    /// Create a DebugFS subdirectory.
+    ///
+    /// This returns a [`SubDir`], which will not be automatically cleaned up when it leaves scope.
+    /// To convert this to a handle governing the lifetime of the directory, use [`Dir::from`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// {
+    ///    let parent = Dir::new(c_str!("parent"));
+    ///    // The path "parent" exists in DebugFS here.
+    ///    {
+    ///        let child = parent.subdir(c_str!("child"));
+    ///        // The path "parent/child" exists in DebugFS here.
+    ///    }
+    ///    // The path "parent/child" still exists.
+    ///    {
+    ///        let child2 = Dir::from(parent.subdir(c_str!("child2")));
+    ///        // The path "parent/child2" exists in DebugFS here.
+    ///    }
+    ///    // The path "parent/child2" is gone.
+    /// }
+    /// // None of the paths exist here.
+    /// ```
+    pub fn subdir(&self, name: &CStr) -> SubDir {
+        SubDir::new(Self::create(name, Some(self)))
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
+        // * `name` argument points to a NUL-terminated string that lives across the call, by
+        //   invariants of `&CStr`.
+        // * If `parent` is `None`, `parent` accepts null pointers to mean create at root.
+        // * If `parent` is `Some`, `parent` accepts live dentry debugfs pointers.
+        // * `debugfs_create_dir` either returns an error code or a legal `dentry` pointer,
+        //   so we can call `Self::from_ptr`.
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
+    /// The pointer must either be an error code, `NULL`, or represent a transfer of ownership of a
+    /// live DebugFS directory.
+    #[cfg(CONFIG_DEBUG_FS)]
+    unsafe fn from_ptr(ptr: *mut bindings::dentry) -> Self {
+        Self(ptr)
+    }
+
+    /// Returns the pointer representation of the DebugFS directory.
+    ///
+    /// Due to the type invariant, the value returned from this function will always be an error
+    /// code, NUL, or a live DebugFS directory.
+    // If this function is ever needed with `not(CONFIG_DEBUG_FS)`, hardcode it to return `ENODEV`.
+    #[cfg(CONFIG_DEBUG_FS)]
+    fn as_ptr(&self) -> *mut bindings::dentry {
+        self.0
+    }
+}
+
+impl Drop for Dir {
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
+/// Handle to a DebugFS directory that will stay alive after leaving scope.
+#[repr(transparent)]
+pub struct SubDir(ManuallyDrop<Dir>);
+
+impl Deref for SubDir {
+    type Target = Dir;
+    fn deref(&self) -> &Dir {
+        &self.0
+    }
+}
+
+impl From<SubDir> for Dir {
+    fn from(subdir: SubDir) -> Self {
+        ManuallyDrop::into_inner(subdir.0)
+    }
+}
+
+impl SubDir {
+    fn new(dir: Dir) -> Self {
+        Self(ManuallyDrop::new(dir))
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

