Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECCB18EB0;
	Sat,  5 Apr 2025 06:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743833024; cv=none; b=o6tr5y+x/YBpXFMFnoqSAEpDPuGxgIhvSCCuK8J/th9PZ5xqQr6yIIDII6ggVWDpoFs3bBPoy2c+ElikX/6NenM+3CLJgUyzC/Zp2UtePFnbp2UCo6s2K7xgOstW0RZEr5l1Xo0Hb3JGcAOqvrCh8ii5Ud9JxkA0U7o6Mjr4/oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743833024; c=relaxed/simple;
	bh=OP9jyXGfsXbSklgm1JWLNcLujZFVXafwTeoI4LeV9z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qEfQ1bqZ5/ymeY0khCfaFasphShB62POZinfMk6CmMRn74nZsg1pAV9g+khkEzc6jG2132T1+PXx3GtbZsneYu8R16unMGOeU5MTB+4vK6tJatTV+vUCRjocght71Cdx6krGu6gSpdC4VgQMlHzPqZFipe9NyEjJW/nwd82SuRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmXhc3bJ; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmXhc3bJ"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3fa0eb29cebso2230862b6e.0;
        Fri, 04 Apr 2025 23:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743833020; x=1744437820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVaPbNy61o/PSrVGDQktsWce5aWxOHJZx7fHMyJpHr0=;
        b=bmXhc3bJuMQcneKiz3pmUo8MsuNNgq3aJ8GOesSv30ZvnZXpjcEaHszIeXcZf79+Kt
         OjrzpaCbWSvqdqnayKpy/jXXOjuITqm/Njz9lyKZNFY8fcvj326KsEMLamrSbC+uUB06
         UJLT9rsV3Qk+5eH4ru73Lq3ICOe8VEYy1AxwzPfL5txOkxEtOIxAIpZKU9pblDmIopgx
         34icxSrdiJ4aydQ/knW/OyCsC2ouSiXYStIzFQhKFYE5OASx7Nm4s+nWuk50C23Iu+Hv
         i/ynEV6OkxoIUzsINDxezhSygVNr2wNW3XOhpyR2x/KgEPH6rAdeLCjH/vntrM4xWPP9
         FJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743833020; x=1744437820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVaPbNy61o/PSrVGDQktsWce5aWxOHJZx7fHMyJpHr0=;
        b=gSAnHMJ3X6tERAXjaLltUxq3v+ATiFc8XbKAJHNSKPSXjhodt+kbM6f6qQW2vY7WR8
         tkWjEJmrohR+VWPrbEL1xT9B9mdrNvZiR0SMvz9XSQrJ1rqPN5aiBx5dZak/epI/ynhX
         sL1QeMNvp9C9b4XnzayeM5SrjRbhV80Zgt9P4d0cYsFG09dIK3GJp3DgIRJbz/ojVAxY
         QYdvvFxq2IM5d/Hjta6jOe188u5WjPW0xB3/INnBsnOwJpFyOnHhiTDcN+GfOkzyXuwK
         lqBD8GYFxHjahuiZYuQ5jmMTyCHIZjZhU9huAwrn1U2aPxr4FmSzJgr72kI41Wn4NdvB
         Fd1g==
X-Forwarded-Encrypted: i=1; AJvYcCXCLbGBrVt4eZjJpDvN0cfyO+7INVMHRVriRAsQZ9SwyTlmGJklD71rERgPEW7eO8anHRQSiEdsogbTmNBL4CY=@vger.kernel.org, AJvYcCXkgR31XVG5QDtFkcHOOXd4QwuHz9h3TWr7Z37ZxAijxfOLXnhFdoYJWy35xBBXFkWh0sGUACxt1+yPm0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUfWDHWNKPwpFftmb3Ig/2qDtHOXZ7r+ksngKW6HQpnGqfSl9v
	cbO8HoPgFVPReLVo4y6TJ0f3m7yRGuSvMrUSlDUvJqamTL9Xhik5
X-Gm-Gg: ASbGncuXshx6Q5lN0Vyr6+RujTsJqS78GDFx3Vyko3OWdu7EUAWmWAL5r5CVdUjMk7z
	ptYF8bW8YQ8GEaa8ujw2miaf8oBEl6WSlZXZNZkne6sNhtf74iQEHFb7mm1QhpLQqSmYxybd9+S
	LfgrGlqS95zlBlTpt+w+zMrF2bF5wysgjAlMEXVHwqRGPYGI/v4MwwpN2rhXASE6jI/wX6Whqbd
	xwrf2UT+sJoOj6pjln2YIahW42Ju5nDNo3aTUGh0fZxJfcE6q6G0nA6expeWxZDKle/qN3W9n88
	tdl+E+RJYgtX6ouVZFWrC3MqVOH6oxUXXaVmitDj3U+O2Tzz2HhbtjT59pCblZ/ITrUiW6XF+32
	EIoAcnbOHwjBrwE6j
X-Google-Smtp-Source: AGHT+IEFMWdDsMam+Sj5FrfEtfi4U1OQeF2Bo3YyiOkiewnPGN6P2mqGKczzlfITtEY5tkjjyjhiDw==
X-Received: by 2002:a05:6808:ec8:b0:3f6:7091:d297 with SMTP id 5614622812f47-4003d58de03mr4975447b6e.18.1743833019947;
        Fri, 04 Apr 2025 23:03:39 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-40040080a15sm926565b6e.34.2025.04.04.23.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 23:03:39 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: Liam.Howlett@oracle.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	wedsonaf@gmail.com,
	brauner@kernel.org,
	andrewjballance@gmail.com,
	dingxiangfei2009@gmail.com,
	linux-kernel@vger.kernel.org,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org
Subject: [RFC PATCH 2/2] rust: add maple tree abstractions
Date: Sat,  5 Apr 2025 01:01:54 -0500
Message-ID: <20250405060154.1550858-3-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405060154.1550858-1-andrewjballance@gmail.com>
References: <20250405060154.1550858-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

maple trees are sparse array like data structure that maps
non-overlapping ranges to pointers.

implements basic abstractions for maple trees in rust.

Link: https://docs.kernel.org/core-api/maple_tree.html
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/helpers/helpers.c    |   1 +
 rust/helpers/maple_tree.c |  25 +++
 rust/kernel/lib.rs        |   1 +
 rust/kernel/maple_tree.rs | 340 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 367 insertions(+)
 create mode 100644 rust/helpers/maple_tree.c
 create mode 100644 rust/kernel/maple_tree.rs

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0640b7e115be..6bac5ffe1684 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -18,6 +18,7 @@
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
+#include "maple_tree.c"
 #include "mutex.c"
 #include "page.c"
 #include "platform.c"
diff --git a/rust/helpers/maple_tree.c b/rust/helpers/maple_tree.c
new file mode 100644
index 000000000000..3e70db431616
--- /dev/null
+++ b/rust/helpers/maple_tree.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/maple_tree.h>
+
+
+void rust_helper_mt_init_flags(struct maple_tree *mt, unsigned int flags)
+{
+	mt_init_flags(mt, flags);
+}
+
+void rust_helper_mtree_lock(struct maple_tree *mt)
+{
+	mtree_lock(mt);
+}
+
+void rust_helper_mtree_unlock(struct maple_tree *mt)
+{
+	mtree_unlock(mt);
+}
+
+struct ma_state rust_helper_MA_STATE(struct maple_tree *mt, unsigned long start, unsigned long end)
+{
+	MA_STATE(mas, mt, start, end);
+	return mas;
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 7697c60b2d1a..e84538d7e643 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -57,6 +57,7 @@
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
 pub mod list;
+pub mod maple_tree;
 pub mod miscdevice;
 #[cfg(CONFIG_NET)]
 pub mod net;
diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
new file mode 100644
index 000000000000..be107e11a3dc
--- /dev/null
+++ b/rust/kernel/maple_tree.rs
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Maple trees.
+//!
+//! C header: [`include/linux/maple_tree.h`](srctree/include/linux/maple_tree.h)
+//!
+//! Reference: <https://docs.kernel.org/core-api/maple_tree.html>
+//!
+//! # Examples
+//! ```
+//! # use kernel::maple_tree::*;
+//! # use kernel::alloc::{KBox, flags::GFP_KERNEL};
+//! let mtree = KBox::pin_init(MapleTree::new(flags::DEFAULT_TREE), GFP_KERNEL)?;
+//! let mut guard = mtree.lock();
+//! let entry = KBox::new(5, GFP_KERNEL)?;
+//! guard.insert_range(0, 10, entry, GFP_KERNEL);
+//!
+//! for i in 0..=10 {
+//!    assert_eq!(guard.get(i), Some(&5));
+//! }
+//!
+//! guard.remove(2);
+//!
+//! for i in 0..=10 {
+//!    assert_eq!(guard.get(i), None);
+//! }
+//!
+//! # Ok::<(), Error>(())
+//! ```
+
+// TODO and missing features
+// - the C version suports external locking this only supports the internal spinlock
+// - this version can only have one reader because the safety requirements
+//   means that we need to hold the lock
+// - there is currently no api for the functionality enabled by alloc_trees
+// - future work may use rcu to enable lockless operation.
+// - add a way to iter through ranges
+//
+// SAFETY:
+// we cannot derefrence any pointers without holding the spinlock because
+// all returned pointers are guaranteed to have been inserted by the user
+// but the pointers are not guaranteed to be still be valid
+// another thread may have already removed and dropped the pointers
+// so to safely deref the returned pointers the user must
+// have exclusive write access to the `MapleTree`
+// or rcu_read_lock() is held and updater side uses a synchronize_rcu()
+
+use core::{ffi::c_void, marker::PhantomData, pin::Pin, ptr::NonNull};
+
+use macros::pin_data;
+use macros::pinned_drop;
+
+use crate::error::code;
+use crate::prelude::PinInit;
+
+use crate::{
+    alloc, bindings,
+    error::{self, Error},
+    pin_init,
+    types::{ForeignOwnable, NotThreadSafe, Opaque},
+};
+
+/// A `MapleTree` is a tree like data structure that is optimized for storing
+/// non-overlaping ranges and mapping them to pointers.
+/// They use rcu locks and an internal spinlock to syncronise access.
+///
+/// Note that maple tree ranges are range inclusive.
+// # Invariants
+// self.root is always a valid and initialized `bindings::maple_tree`
+//
+// all values inserted into the tree come from `T::into_foreign`
+#[pin_data(PinnedDrop)]
+pub struct MapleTree<T: ForeignOwnable> {
+    #[pin]
+    root: Opaque<bindings::maple_tree>,
+    _p: PhantomData<T>,
+}
+
+impl<T: ForeignOwnable> MapleTree<T> {
+    /// creates a new `MapleTree` with the specified `flags`
+    ///
+    /// see [`flags`] for the list of flags and their usage
+    pub fn new(flags: Flags) -> impl PinInit<Self> {
+        pin_init!(
+            Self{
+                // SAFETY:
+                // - mt is valid because of ffi_init
+                // - maple_tree contains a lock which should be pinned
+                root <- Opaque::ffi_init(|mt| unsafe {
+                    bindings::mt_init_flags(mt, flags.as_raw())
+                }),
+                _p: PhantomData
+            }
+
+        )
+    }
+
+    /// helper for internal use.
+    /// returns an iterator through the maple tree
+    /// # Safety
+    /// - the user must ensure that it has exclusive access to the tree if no locks are held
+    /// - if the internal lock is held it is safe to deref the returned pointers
+    /// - if the rcu lock is held the pointers will be a value that was inserted
+    ///   by the user but possibly may be invalid
+    unsafe fn iter_no_lock(&self) -> IterNoLock<'_, T> {
+        // SAFETY:
+        // self.root.get() will allways point to a valid maple_tree
+        // by the invariants of MapleTree
+        let ma_state = unsafe { Opaque::new(bindings::MA_STATE(self.root.get(), 0, usize::MAX)) };
+        IterNoLock {
+            ma_state,
+            _p: PhantomData,
+        }
+    }
+
+    /// locks the `Mapletree`'s internal spinlock and returns a [`Guard`].
+    /// When the `Guard` is dropped, the internal spinlock is unlocked
+    /// if the lock is already held by the current thread this will deadlock
+    pub fn lock(&self) -> Guard<'_, T> {
+        // SAFETY:
+        // self.root.get() will allways point to a valid maple_tree
+        // by the invariants of MapleTree
+        unsafe { bindings::mtree_lock(self.root.get()) };
+        Guard {
+            tree: self,
+            _not_send: NotThreadSafe,
+        }
+    }
+}
+
+#[pinned_drop]
+impl<T: ForeignOwnable> PinnedDrop for MapleTree<T> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY:
+        // - we have exclusive access to self because we should have
+        //   exclussive access whenever drop is called
+        //   if drop is called multiple times an invariant is already violated
+        for i in unsafe { self.iter_no_lock() } {
+            //SAFETY:
+            // - we can call from_foreign because all values inserted into a MapleTree
+            //   come from T::into_foreign
+            // - i.as_ptr is guaranteed to not be null because of the invariant of NonNull
+            // - we have exclusive access to self because we should have
+            //   exclussive access whenever drop is called
+            let original = unsafe { T::from_foreign(i.as_ptr()) };
+            drop(original);
+        }
+        // SAFETY:
+        // - self.root.get() will allways point to a valid maple_tree
+        //   by the invariants of MapleTree
+        // - we can call this without taking the spinlock because we should have
+        //   exclusive access whenever drop is called
+        unsafe {
+            bindings::__mt_destroy(self.root.get());
+        }
+    }
+}
+
+// SAFETY: `MapleTree<T>` has no shared mutable state so it is `Send` iff `T` is `Send`.
+// MapleTree is still pin_init so it still cannot be moved but this means that types like
+// Box<MapleTree<T>> can be sent between threads
+unsafe impl<T: ForeignOwnable + Send> Send for MapleTree<T> {}
+
+// SAFETY: `MapleTree<T>` has interior mutability so it is `Sync` iff `T` is `Send`.
+unsafe impl<T: ForeignOwnable + Send> Sync for MapleTree<T> {}
+
+/// an iterator over all of the values in a [`MapleTree`].
+/// this intentionally does not hold the rcu lock or the internal lock
+/// the user must ensure that it exclusive access to the tree if no locks are held
+/// if the internal lock is held it is safe to deref the returned pointers
+/// if the rcu lock is held the pointers will be a value that was inserted
+/// by the user but possibly may be invalid
+struct IterNoLock<'a, T: ForeignOwnable> {
+    ma_state: Opaque<bindings::ma_state>,
+    _p: PhantomData<&'a MapleTree<T>>,
+}
+
+impl<'a, T: ForeignOwnable> Iterator for IterNoLock<'a, T> {
+    type Item = NonNull<c_void>;
+    fn next(&mut self) -> Option<Self::Item> {
+        // SAFETY:
+        // self.ma_state.get() will allways point to a valid ma_state by the invariants of Iter
+        let ptr: *mut c_void = unsafe { bindings::mas_find(self.ma_state.get(), usize::MAX) };
+        NonNull::new(ptr)
+    }
+}
+
+/// A lock guard for a [`MapleTree`]'s internal spinlock
+///
+/// The lock is unlocked when the guard goes out of scope
+// # Invariants
+//
+// `tree` is always a valid reference to a locked `MapleTree`
+// `tree` is unlocked when the guard is dropped
+pub struct Guard<'a, T: ForeignOwnable> {
+    tree: &'a MapleTree<T>,
+    _not_send: NotThreadSafe,
+}
+
+impl<'a, T: ForeignOwnable> Guard<'a, T> {
+    /// Removes a value at the specified index.
+    /// if there is no value at the index returns `None`.
+    /// if there is a value at the index returns it and unmaps the entire range
+    pub fn remove(&mut self, index: usize) -> Option<T> {
+        // SAFETY:
+        // - we can safely call MA_STATE because self.tree.root.get() will be valid
+        //   by the invariants of guard
+        // - we can safely call mas_erase because the lock is held and mas is valid
+        // - we can call try_from_foreign because all values inserted into a MapleTree
+        //   come from T::into_foreign
+        unsafe {
+            let mas = Opaque::new(bindings::MA_STATE(self.tree.root.get(), index, index));
+            let removed = bindings::mas_erase(mas.get());
+            T::try_from_foreign(removed)
+        }
+    }
+
+    /// Returns a reference to the `T` at `index` if it exists,
+    /// otherwise returns `None`
+    pub fn get(&self, index: usize) -> Option<T::Borrowed<'_>> {
+        // SAFETY:
+        // self.tree.root.get() will always be valid because of the invariants of MapleTree
+        let ptr = unsafe { bindings::mtree_load(self.tree.root.get(), index) };
+        if ptr.is_null() {
+            return None;
+        }
+        // SAFETY:
+        // - we can safely call borrow because all values inserted into a MapleTree
+        //   come from T::into_foreign
+        // - ptr is not null by the check above
+        Some(unsafe { T::borrow(ptr) })
+    }
+
+    /// Returns a mut reference to the `T` at `index` if it exists,
+    /// otherwise returns `None`
+    pub fn get_mut(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
+        // SAFETY:
+        // self.tree.root.get() will always be valid because of the invariants of MapleTree
+        let ptr = unsafe { bindings::mtree_load(self.tree.root.get(), index) };
+        if ptr.is_null() {
+            return None;
+        }
+        // SAFETY:
+        // - we can safely call borrowmut because all values inserted into a MapleTree
+        //   come from T::into_foreign
+        // - ptr is not null by the check above
+        // - we have exclusive ownership becauce this function takes `&mut self`
+        Some(unsafe { T::borrow_mut(ptr) })
+    }
+
+    /// a convenience alias for [`Self::insert_range`] where `start == end`
+    pub fn insert(&mut self, index: usize, value: T, gfp: alloc::Flags) -> Result<(), (T, Error)> {
+        self.insert_range(index, index, value, gfp)
+    }
+
+    /// Maps the range `[start, end]` to `value` in the MapleTree.
+    /// if `[start, end]` overlaps with any range already inserted, then `value` will
+    /// not be inserted.
+    ///
+    /// * Returns `Ok(())` if insertion is successful
+    ///
+    /// * Returns `Err((value, EINVAL))` if `T::into_foreign` is `NULL`
+    ///   or is in [0, 4096] with the bottom two bits set to `10` (ie 2, 6, 10 .. 4094)
+    ///   or `start` > `end`.
+    ///
+    /// * Returns `Err((value, EEXISTS))` if there is any entry already within the range.
+    ///
+    /// * Returns `Err((value, ENOMEM))` if allocation failed.
+    pub fn insert_range(
+        &mut self,
+        start: usize,
+        end: usize,
+        value: T,
+        gfp: alloc::Flags,
+    ) -> Result<(), (T, Error)> {
+        let ptr = value.into_foreign();
+        // a insertion of NULL will succeed even if there are values stored there (i tested this)
+        // this may remove values that we do not want to remove
+        // and any stored T that gets overwritten will not be dropped
+        // which we do not want to happen
+        // so return early if ptr is NULL
+        if ptr.is_null() {
+            // SAFETY:
+            // ptr is from T::into_foreign so we can safely convert it back
+            let original = unsafe { T::from_foreign(ptr) };
+            return Err((original, code::EINVAL));
+        }
+
+        // SAFETY:
+        // - we can call __mtree_insert_range because we hold the lock because of the
+        //   invariants of self
+        // - self.tree.root.get() will always be valid because of the invariants of MapleTree
+        let errno = unsafe {
+            bindings::__mtree_insert_range(self.tree.root.get(), start, end, ptr, gfp.as_raw())
+        };
+
+        let err = error::to_result(errno);
+        // SAFETY:
+        // - we can call from_foreign because all values inserted into a MapleTree
+        //   come from T::into_foreign
+        // - we have exclusive ownership of ptr because if err is an error then, ptr was
+        //   not inserted into the MapleTree
+        //
+        err.map_err(|e| unsafe { (T::from_foreign(ptr), e) })
+    }
+}
+
+impl<T: ForeignOwnable> Drop for Guard<'_, T> {
+    fn drop(&mut self) {
+        // SAFETY:
+        // - unlock the MapleTree because the guard is being dropped
+        // - self.tree.root.get() will always be valid because of the invariants of MapleTree
+        unsafe { bindings::mtree_unlock(self.tree.root.get()) };
+    }
+}
+
+#[derive(Clone, Copy, PartialEq)]
+/// flags to be used with [`MapleTree::new`].
+///
+/// values can used from the [`flags`] module.
+pub struct Flags(u32);
+
+impl Flags {
+    pub(crate) fn as_raw(self) -> u32 {
+        self.0
+    }
+}
+
+/// flags to be used with [`MapleTree::new`]
+pub mod flags {
+    use super::Flags;
+
+    /// Creates a default MapleTree
+    pub const DEFAULT_TREE: Flags = Flags(0);
+
+    /// if a `MapleTree` is created with ALLOC_TREE the `MapleTree` will be a alloc tree.
+    /// alloc trees have a lower branching factor but allows the user to search
+    /// for a gap of a given size.
+    pub const ALLOC_TREE: Flags = Flags(bindings::MT_FLAGS_ALLOC_RANGE);
+}
-- 
2.49.0

