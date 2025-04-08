Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB5D264A98
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104244; cv=none; b=eibNh479uvm648X5ql8lVykpHyNi4cR5X6VPXEJ9i9XxDmZcmTYBu/tixTrPhXD+fTfokRulhqEhuIqSu2wQ3qIuVJ3+x8VK4HpSzxVdrdWIMjMn+oRSOXKzmlm5So4CMI+N+uo2uIPGrCB4rVfP1wvHSnCO9b8rpGGO0taaWew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104244; c=relaxed/simple;
	bh=yxKBHgKEF0Pk92dXT07hzBYbzkqnu7N3MQCAKHqDQNA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X3esDW8xTXWcAnTy4uOSOZqs2SGjwwqZmHJNKmJ8zcbti9ocNbqm5h+xtdU2+NnAPlltyUclj1iApIrjlknyvWWhbWyPQGi129d2acrk+XfZ636aibBmoPh9k2xdRBkq/+De5j5Z6xQDGZy15meOfZ3YnTGSfqE9T2q0EqtQRP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4Id5eSkR; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4Id5eSkR"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so16370565e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744104240; x=1744709040; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ki4H2x3bNdUZgaxD5TSjlFdpv0BBNOUt/zA8zBiktxo=;
        b=4Id5eSkRli4uMs29FFPdVPilE9/xjIMbyrA4ZRcDgR9lzFz+TMaNcuwr2+/ZiTeFgC
         zfe95dDcRFv6pFX3lrjtEtTBonELyBrTAFFdeyW7pVeOBmm9fuslvK5ndRX8BIZqVfP3
         m71TcSwhBfzNR7uB/kK3+NxpdvA4/7vHGqtyY7q8vRXVmZ7uhywUfrfwus+n1pZPb+hl
         wWPvjQqyx4H+Pjs/wMIqa3EEs3mYgiMWgUuN3XSj5TTseGII1Q+sjpEU0OMBtAlvIMMl
         O+Pl+pICEylz5d5fLLrEpfB8ZcgzuCIYJ7NbzINlqisOSRwgfciM3pqfAPQTtRRDnpN2
         oR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104240; x=1744709040;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ki4H2x3bNdUZgaxD5TSjlFdpv0BBNOUt/zA8zBiktxo=;
        b=Qu5U817n1YZrgmd+jp6l880KovXLU2PzEegC0QvVQeBWOPqMcVlPdm1FUFDK7JwQ1Z
         w2BLZ7KJ8dLVB19r5U73WZ6TPQA/0eFr7OD4Wgm/M0KNAMnI+W0L2blByfclyAWp7e6L
         MBD9KV2iJZYyqq6hNXzUGKYN8euNxTYLTe+gKbk3LoFa7kv6t7hN/KLqRY2LvP6Z3hWR
         iJlw82qwsHpkKXDcs7U4WHLcUu/gTwa4Yf/kzW+BdDrko/qU2yG8kT8KqqzEJKu38rPs
         9wvOoG0/znr/eytFUH3lvdoFmxrdiq/zLQwhxK1Wt2yHiMIBQ8/+YFj5tZHmlnrzW3Gj
         pdyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmNHiEEBsVPiiOJ1BHhZ0GsRqY4y40fayZvX2h9hu5qNsbrGX/5O3t76r2NaZdZKi3t6bcw7YfAxvez1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq5qerNAC8MVag310HcP7QqT7PrzeVrCsioL1zWi4M1HG1H13s
	5CDxUk3Mhz0jyhzxeD5AGCC6f2B/QdwS2JuFWpwQ0vVklnNyh9G9Wiw/AtCWBb5bXIY+A5N+1KI
	6kVCMHHaTF3RQOQ==
X-Google-Smtp-Source: AGHT+IHYfn2jFMPzZbozv1znd+quFlDYUIdmNio1DMNMO7NMjqNG77qP6RfgBjCyxquhSAqEKulRpzj7mSohx+c=
X-Received: from wmbh6.prod.google.com ([2002:a05:600c:a106:b0:43d:9035:df36])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1385:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-43ecf85f4e8mr141716885e9.12.1744104240706;
 Tue, 08 Apr 2025 02:24:00 -0700 (PDT)
Date: Tue, 08 Apr 2025 09:22:38 +0000
In-Reply-To: <20250408-vma-v16-0-d8b446e885d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408-vma-v16-0-d8b446e885d9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=10913; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=yxKBHgKEF0Pk92dXT07hzBYbzkqnu7N3MQCAKHqDQNA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn9OslaWj4W4zK8+NCEygrsxAUbocMAkAmSrImM
 xsssH4ZEoaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ/TrJQAKCRAEWL7uWMY5
 Rg9WEAC11iTd6isdQt5qWtvteId/5hP34edfgj8zeH/4CCCW00Sw4HXzTdwHcAegqA1muaKjn0f
 J9g0wzBZm1fKyRsYLajYxd5Z59jJLlnRrAE5QfbCH90AXUJdc6FftYwB/Jg/JubN3dPNeUYGScU
 3ISw9I3xEMA11Px/O+Ai4VVQhN5aR6M44VEyeWxjUgIN2aj7S1pfgnhM+AfmSU2HAYhOHnIqqGe
 /sVoQtjoOWcfn4/4+Ghg4n5I9Fa3BB6UMd65UaRMBOm9sOzKe3pPw3zybomx1Pb48m/cr1jsJuC
 SF2dgkMwbO6tvcB5B9exQAD2f2mXfABlxB5KQMzrm9yUaNVYyYEeVU9bluKJIZpPgA/mXkL3NLu
 2r0p7NITtj68BUpmG84+W+baaOb30suihSe42mN7lZ88HnlMBmjdk8X8wbt9hvqd5FuG+kYUmiO
 JJIXTk8EEz7zJ5QD8ZeS+M9vxo7Ut7u5dh9ysXcliHRqMkXioNnPn90W1qvICxl+Tmpz9ENOlwG
 khFeLyAnteQfbc1E2BSvhXJxziluA8Mq8jwVSWB8/EI7d/h2/a7AiIZJrV6DuwFBUVNaThNUegs
 A7dNpcPApjwoUJCn2UaYGBgaP3qBi8wES2xeBK2IpYNgpUA9i2MojX3EhyzyigwWiEoWdI7h5kx Ga+MA9pPHmxkk9w==
X-Mailer: b4 0.14.2
Message-ID: <20250408-vma-v16-1-d8b446e885d9@google.com>
Subject: [PATCH v16 1/9] mm: rust: add abstraction for struct mm_struct
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Balbir Singh <balbirs@nvidia.com>
Content-Type: text/plain; charset="utf-8"

These abstractions allow you to reference a `struct mm_struct` using
both mmgrab and mmget refcounts. This is done using two Rust types:

* Mm - represents an mm_struct where you don't know anything about the
  value of mm_users.
* MmWithUser - represents an mm_struct where you know at compile time
  that mm_users is non-zero.

This allows us to encode in the type system whether a method requires
that mm_users is non-zero or not. For instance, you can always call
`mmget_not_zero` but you can only call `mmap_read_lock` when mm_users is
non-zero.

The struct is called Mm to keep consistency with the C side.

The ability to obtain `current->mm` is added later in this series.

The mm module is defined to only exist when CONFIG_MMU is set. This
avoids various errors due to missing types and functions when CONFIG_MMU
is disabled. More fine-grained cfgs can be considered in the future. See
the thread at [1] for more info.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Acked-by: Balbir Singh <balbirs@nvidia.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/all/202503091916.QousmtcY-lkp@intel.com/
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/helpers.c |   1 +
 rust/helpers/mm.c      |  39 +++++++++
 rust/kernel/lib.rs     |   1 +
 rust/kernel/mm.rs      | 210 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 251 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index e1c21eba9b15b672c5e4ab10c4e4c01ed407fae6..48b80bbc0645b2f4abc2b8e28972b0550b5abfea 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -19,6 +19,7 @@
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
+#include "mm.c"
 #include "mutex.c"
 #include "page.c"
 #include "platform.c"
diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
new file mode 100644
index 0000000000000000000000000000000000000000..7201747a5d314b2b120b30c0b906715c04ca77a5
--- /dev/null
+++ b/rust/helpers/mm.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/mm.h>
+#include <linux/sched/mm.h>
+
+void rust_helper_mmgrab(struct mm_struct *mm)
+{
+	mmgrab(mm);
+}
+
+void rust_helper_mmdrop(struct mm_struct *mm)
+{
+	mmdrop(mm);
+}
+
+void rust_helper_mmget(struct mm_struct *mm)
+{
+	mmget(mm);
+}
+
+bool rust_helper_mmget_not_zero(struct mm_struct *mm)
+{
+	return mmget_not_zero(mm);
+}
+
+void rust_helper_mmap_read_lock(struct mm_struct *mm)
+{
+	mmap_read_lock(mm);
+}
+
+bool rust_helper_mmap_read_trylock(struct mm_struct *mm)
+{
+	return mmap_read_trylock(mm);
+}
+
+void rust_helper_mmap_read_unlock(struct mm_struct *mm)
+{
+	mmap_read_unlock(mm);
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index de07aadd1ff5fe46fd89517e234b97a6590c8e93..42ab6cf4053f2cadff0a512b8645699bfa6ec568 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -61,6 +61,7 @@
 pub mod kunit;
 pub mod list;
 pub mod miscdevice;
+pub mod mm;
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod of;
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
new file mode 100644
index 0000000000000000000000000000000000000000..eda7a479cff7e79760bb49eb4bb16209bbfc6147
--- /dev/null
+++ b/rust/kernel/mm.rs
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Memory management.
+//!
+//! This module deals with managing the address space of userspace processes. Each process has an
+//! instance of [`Mm`], which keeps track of multiple VMAs (virtual memory areas). Each VMA
+//! corresponds to a region of memory that the userspace process can access, and the VMA lets you
+//! control what happens when userspace reads or writes to that region of memory.
+//!
+//! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)
+#![cfg(CONFIG_MMU)]
+
+use crate::{
+    bindings,
+    types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque},
+};
+use core::{ops::Deref, ptr::NonNull};
+
+/// A wrapper for the kernel's `struct mm_struct`.
+///
+/// This represents the address space of a userspace process, so each process has one `Mm`
+/// instance. It may hold many VMAs internally.
+///
+/// There is a counter called `mm_users` that counts the users of the address space; this includes
+/// the userspace process itself, but can also include kernel threads accessing the address space.
+/// Once `mm_users` reaches zero, this indicates that the address space can be destroyed. To access
+/// the address space, you must prevent `mm_users` from reaching zero while you are accessing it.
+/// The [`MmWithUser`] type represents an address space where this is guaranteed, and you can
+/// create one using [`mmget_not_zero`].
+///
+/// The `ARef<Mm>` smart pointer holds an `mmgrab` refcount. Its destructor may sleep.
+///
+/// # Invariants
+///
+/// Values of this type are always refcounted using `mmgrab`.
+///
+/// [`mmget_not_zero`]: Mm::mmget_not_zero
+#[repr(transparent)]
+pub struct Mm {
+    mm: Opaque<bindings::mm_struct>,
+}
+
+// SAFETY: It is safe to call `mmdrop` on another thread than where `mmgrab` was called.
+unsafe impl Send for Mm {}
+// SAFETY: All methods on `Mm` can be called in parallel from several threads.
+unsafe impl Sync for Mm {}
+
+// SAFETY: By the type invariants, this type is always refcounted.
+unsafe impl AlwaysRefCounted for Mm {
+    #[inline]
+    fn inc_ref(&self) {
+        // SAFETY: The pointer is valid since self is a reference.
+        unsafe { bindings::mmgrab(self.as_raw()) };
+    }
+
+    #[inline]
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The caller is giving up their refcount.
+        unsafe { bindings::mmdrop(obj.cast().as_ptr()) };
+    }
+}
+
+/// A wrapper for the kernel's `struct mm_struct`.
+///
+/// This type is like [`Mm`], but with non-zero `mm_users`. It can only be used when `mm_users` can
+/// be proven to be non-zero at compile-time, usually because the relevant code holds an `mmget`
+/// refcount. It can be used to access the associated address space.
+///
+/// The `ARef<MmWithUser>` smart pointer holds an `mmget` refcount. Its destructor may sleep.
+///
+/// # Invariants
+///
+/// Values of this type are always refcounted using `mmget`. The value of `mm_users` is non-zero.
+#[repr(transparent)]
+pub struct MmWithUser {
+    mm: Mm,
+}
+
+// SAFETY: It is safe to call `mmput` on another thread than where `mmget` was called.
+unsafe impl Send for MmWithUser {}
+// SAFETY: All methods on `MmWithUser` can be called in parallel from several threads.
+unsafe impl Sync for MmWithUser {}
+
+// SAFETY: By the type invariants, this type is always refcounted.
+unsafe impl AlwaysRefCounted for MmWithUser {
+    #[inline]
+    fn inc_ref(&self) {
+        // SAFETY: The pointer is valid since self is a reference.
+        unsafe { bindings::mmget(self.as_raw()) };
+    }
+
+    #[inline]
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The caller is giving up their refcount.
+        unsafe { bindings::mmput(obj.cast().as_ptr()) };
+    }
+}
+
+// Make all `Mm` methods available on `MmWithUser`.
+impl Deref for MmWithUser {
+    type Target = Mm;
+
+    #[inline]
+    fn deref(&self) -> &Mm {
+        &self.mm
+    }
+}
+
+// These methods are safe to call even if `mm_users` is zero.
+impl Mm {
+    /// Returns a raw pointer to the inner `mm_struct`.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::mm_struct {
+        self.mm.get()
+    }
+
+    /// Obtain a reference from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` points at an `mm_struct`, and that it is not deallocated
+    /// during the lifetime 'a.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a Mm {
+        // SAFETY: Caller promises that the pointer is valid for 'a. Layouts are compatible due to
+        // repr(transparent).
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Calls `mmget_not_zero` and returns a handle if it succeeds.
+    #[inline]
+    pub fn mmget_not_zero(&self) -> Option<ARef<MmWithUser>> {
+        // SAFETY: The pointer is valid since self is a reference.
+        let success = unsafe { bindings::mmget_not_zero(self.as_raw()) };
+
+        if success {
+            // SAFETY: We just created an `mmget` refcount.
+            Some(unsafe { ARef::from_raw(NonNull::new_unchecked(self.as_raw().cast())) })
+        } else {
+            None
+        }
+    }
+}
+
+// These methods require `mm_users` to be non-zero.
+impl MmWithUser {
+    /// Obtain a reference from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` points at an `mm_struct`, and that `mm_users` remains
+    /// non-zero for the duration of the lifetime 'a.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
+        // SAFETY: Caller promises that the pointer is valid for 'a. The layout is compatible due
+        // to repr(transparent).
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Lock the mmap read lock.
+    #[inline]
+    pub fn mmap_read_lock(&self) -> MmapReadGuard<'_> {
+        // SAFETY: The pointer is valid since self is a reference.
+        unsafe { bindings::mmap_read_lock(self.as_raw()) };
+
+        // INVARIANT: We just acquired the read lock.
+        MmapReadGuard {
+            mm: self,
+            _nts: NotThreadSafe,
+        }
+    }
+
+    /// Try to lock the mmap read lock.
+    #[inline]
+    pub fn mmap_read_trylock(&self) -> Option<MmapReadGuard<'_>> {
+        // SAFETY: The pointer is valid since self is a reference.
+        let success = unsafe { bindings::mmap_read_trylock(self.as_raw()) };
+
+        if success {
+            // INVARIANT: We just acquired the read lock.
+            Some(MmapReadGuard {
+                mm: self,
+                _nts: NotThreadSafe,
+            })
+        } else {
+            None
+        }
+    }
+}
+
+/// A guard for the mmap read lock.
+///
+/// # Invariants
+///
+/// This `MmapReadGuard` guard owns the mmap read lock.
+pub struct MmapReadGuard<'a> {
+    mm: &'a MmWithUser,
+    // `mmap_read_lock` and `mmap_read_unlock` must be called on the same thread
+    _nts: NotThreadSafe,
+}
+
+impl Drop for MmapReadGuard<'_> {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: We hold the read lock by the type invariants.
+        unsafe { bindings::mmap_read_unlock(self.mm.as_raw()) };
+    }
+}

-- 
2.49.0.504.g3bcea36a83-goog

