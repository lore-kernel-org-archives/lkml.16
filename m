Received: from forward206a.mail.yandex.net (forward206a.mail.yandex.net [178.154.239.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF461D798E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091618; cv=none; b=qZ8IGB5VnZ/8/zdCLiqeILAQgrXofhO8imMI5rJMxzvJz2+eUyRKSpXF6Bf9WQykNr7SPB2tIu2BmmLPM+cKEOsHK3PEAmUePe8hbqf9AtmsQJjTBpswJc46XMPvVVV2l+o4ghHmtlhZGeo7ybvmJq+BXQ9rorWnryUgnhtx5fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091618; c=relaxed/simple;
	bh=u8SnpUvg+OmgTjFeYJWgOlqPSqv/vXFXdNweqOHO+bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dg2BpfVKXptStFgzTofcd13d+LPI3dO+X+WBe5sy7T2oe223nfTAbiRRCbbiKz1WqTL+0N3RNfe/xX3GnNzZlVX379sjkDTRE2c6gSmmCm1yQkF5BdVdA1B2D+wkiqrhnQVziGp89RQFGmGI6np2K+HX90A2HfGuZvoJLIRLPKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=UV9flxaD; arc=none smtp.client-ip=178.154.239.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="UV9flxaD"
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d100])
	by forward206a.mail.yandex.net (Yandex) with ESMTPS id 93D226444D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 19:25:38 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:1984:0:640:94c0:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id DBF6046D9F;
	Mon, 16 Jun 2025 19:25:30 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id uOOm811LhiE0-zaJ3MEPh;
	Mon, 16 Jun 2025 19:25:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750091130;
	bh=OsH5xCf9TMaAzAwlB2Cz47vNBR9kyxuYbvPOtwwINXQ=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=UV9flxaDy7becJ4C3dqdJDxA6BUW8lX0TXcWnd8n0ZxIzQbwG6aH9sUCF4Bh3w3bI
	 7Yuz8snaY3RUqVzfKhZfiiAvga0XlTVvo2qP6iM+42Q5N+vxAY+n18anuStl1az0yn
	 RwpcPzL3ztbho4xdGRDvZZ0nQyIfmbiekHq0VgO0=
Authentication-Results: mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: onur-ozkan <work@onurozkan.dev>
To: linux-kernel@vger.kernel.org
Cc: boqun.feng@gmail.com,
	onur-ozkan <work@onurozkan.dev>,
	thatslyude@gmail.com
Subject: [PATCH] Add `ww_mutex` support & abstraction for Rust tree
Date: Mon, 16 Jun 2025 19:24:48 +0300
Message-ID: <20250616162448.31641-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds Rust bindings for the kernel's `ww_mutex` infrastructure to enable
deadlock-free acquisition of multiple related locks.

The implementation abstracts `ww_mutex.h` header and wraps the existing
C `ww_mutex` with three main types:
    - `WwClass` for grouping related mutexes
    - `WwAcquireCtx` for tracking lock acquisition context
    - `WwMutex<T>` for the actual lock

Some of the kernel's `ww_mutex` functions are implemented as `static inline`,
so they are inaccessible from Rust as bindgen can't generate code on them.
The `rust/helpers/ww_mutex.c file provides C function wrappers around these inline
implementations, so bindgen can see them and generate the corresponding Rust code.

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library/topic/Writing.20up.20wrappers.20for.20ww_mutex.3F/with/524269974
Suggested-by: thatslyude@gmail.com
Signed-off-by: onur-ozkan <work@onurozkan.dev>
---
 rust/helpers/helpers.c            |   1 +
 rust/helpers/ww_mutex.c           |  39 +++
 rust/kernel/error.rs              |   1 +
 rust/kernel/sync/lock.rs          |   1 +
 rust/kernel/sync/lock/ww_mutex.rs | 501 ++++++++++++++++++++++++++++++
 5 files changed, 543 insertions(+)
 create mode 100644 rust/helpers/ww_mutex.c
 create mode 100644 rust/kernel/sync/lock/ww_mutex.rs

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0f1b5d115985..fd071cbe20a1 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -44,3 +44,4 @@
 #include "wait.c"
 #include "workqueue.c"
 #include "xarray.c"
+#include "ww_mutex.c"
diff --git a/rust/helpers/ww_mutex.c b/rust/helpers/ww_mutex.c
new file mode 100644
index 000000000000..61a487653394
--- /dev/null
+++ b/rust/helpers/ww_mutex.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/ww_mutex.h>
+
+void rust_helper_ww_mutex_init(struct ww_mutex *lock, struct ww_class *ww_class)
+{
+	ww_mutex_init(lock, ww_class);
+}
+
+void rust_helper_ww_acquire_init(struct ww_acquire_ctx *ctx, struct ww_class *ww_class)
+{
+	ww_acquire_init(ctx, ww_class);
+}
+
+void rust_helper_ww_acquire_done(struct ww_acquire_ctx *ctx)
+{
+	ww_acquire_done(ctx);
+}
+
+void rust_helper_ww_acquire_fini(struct ww_acquire_ctx *ctx)
+{
+	ww_acquire_fini(ctx);
+}
+
+void rust_helper_ww_mutex_lock_slow(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+{
+	ww_mutex_lock_slow(lock, ctx);
+}
+
+int rust_helper_ww_mutex_lock_slow_interruptible(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+{
+	return ww_mutex_lock_slow_interruptible(lock, ctx);
+}
+
+bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
+{
+	return ww_mutex_is_locked(lock);
+}
+
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 3dee3139fcd4..94d8014b236b 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -84,6 +84,7 @@ macro_rules! declare_err {
     declare_err!(EIOCBQUEUED, "iocb queued, will get completion event.");
     declare_err!(ERECALLCONFLICT, "Conflict with recalled state.");
     declare_err!(ENOGRACE, "NFS file lock reclaim refused.");
+    declare_err!(EDEADLK, "Resource deadlock avoided.");
 }

 /// Generic integer kernel error.
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index e82fa5be289c..8824ebc81084 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -15,6 +15,7 @@

 pub mod mutex;
 pub mod spinlock;
+pub mod ww_mutex;

 pub(super) mod global;
 pub use global::{GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww_mutex.rs
new file mode 100644
index 000000000000..33de67047420
--- /dev/null
+++ b/rust/kernel/sync/lock/ww_mutex.rs
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A kernel Wound/Wait Mutex.
+//!
+//! This module provides Rust abstractions for the Linux kernel's `ww_mutex` implementation,
+//! which provides deadlock avoidance through a wait/die algorithm.
+
+use crate::error::{to_result, Result};
+use crate::prelude::EBUSY;
+use crate::{bindings, str::CStr, types::Opaque};
+use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
+use macros::kunit_tests;
+use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
+
+/// Implementation of C side `ww_class`.
+///
+/// Represents a group of mutexes that can participate in deadlock avoidance together.
+/// All mutexes that might be acquired together should use the same class.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::lock::ww_mutex::WwClass;
+/// use kernel::c_str;
+///
+/// let _wait_die_class = unsafe { WwClass::new(c_str!("graphics_buffers"), true) };
+/// let _wound_wait_class = unsafe { WwClass::new(c_str!("memory_pools"), false) };
+///
+/// # Ok::<(), Error>(())
+/// ```
+#[repr(transparent)]
+pub struct WwClass(Opaque<bindings::ww_class>);
+
+// SAFETY: `WwClass` can be shared between threads.
+unsafe impl Sync for WwClass {}
+
+impl WwClass {
+    /// Creates `WwClass` that wraps C side `ww_class`.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that the returned `WwClass` is not moved or freed
+    /// while any `WwMutex` instances using this class exist.
+    pub unsafe fn new(name: &'static CStr, is_wait_die: bool) -> Self {
+        Self(Opaque::new(bindings::ww_class {
+            stamp: bindings::atomic_long_t { counter: 0 },
+            acquire_name: name.as_char_ptr(),
+            mutex_name: name.as_char_ptr(),
+            is_wait_die: is_wait_die as u32,
+
+            // `lock_class_key` doesn't have any value
+            acquire_key: bindings::lock_class_key {},
+            mutex_key: bindings::lock_class_key {},
+        }))
+    }
+}
+
+/// Implementation of C side `ww_acquire_ctx`.
+///
+/// An acquire context is used to group multiple mutex acquisitions together
+/// for deadlock avoidance. It must be used when acquiring multiple mutexes
+/// of the same class.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::lock::ww_mutex::{WwClass, WwAcquireCtx, WwMutex};
+/// use kernel::alloc::KBox;
+/// use kernel::c_str;
+///
+/// let class = unsafe { WwClass::new(c_str!("my_class"), false) };
+///
+/// // Create mutexes
+/// let mutex1 = unsafe { KBox::pin_init(WwMutex::new(1u32, &class), GFP_KERNEL).unwrap() };
+/// let mutex2 = unsafe { KBox::pin_init(WwMutex::new(2u32, &class), GFP_KERNEL).unwrap() };
+///
+/// // Create acquire context for deadlock avoidance
+/// let mut ctx = KBox::pin_init(
+///     unsafe { WwAcquireCtx::new(&class) },
+///     GFP_KERNEL
+/// ).unwrap();
+///
+/// // Acquire multiple locks safely
+/// let guard1 = mutex1.as_ref().lock(Some(&ctx)).unwrap();
+/// let guard2 = mutex2.as_ref().lock(Some(&ctx)).unwrap();
+///
+/// // Mark acquisition phase as complete
+/// ctx.as_mut().done();
+///
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data(PinnedDrop)]
+pub struct WwAcquireCtx {
+    #[pin]
+    inner: Opaque<bindings::ww_acquire_ctx>,
+    #[pin]
+    _pin: PhantomPinned,
+}
+
+// SAFETY: `WwAcquireCtx` is safe to send between threads when not in use.
+unsafe impl Send for WwAcquireCtx {}
+
+impl WwAcquireCtx {
+    /// Initializes `Self` with calling C side `ww_acquire_init` inside.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that the `ww_class` remains valid for the lifetime
+    /// of this context.
+    pub unsafe fn new(ww_class: &WwClass) -> impl PinInit<Self> {
+        let raw_ptr = ww_class.0.get();
+
+        pin_init!(WwAcquireCtx {
+            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_acquire_ctx| {
+                // SAFETY: The caller guarantees that `ww_class` remains valid.
+                unsafe {
+                    bindings::ww_acquire_init(slot, raw_ptr)
+                }
+            }),
+            _pin: PhantomPinned,
+        })
+    }
+
+    /// Marks the end of the acquire phase with C side `ww_acquire_done`.
+    ///
+    /// After calling this function, no more mutexes can be acquired with this context.
+    pub fn done(self: Pin<&mut Self>) {
+        // SAFETY: The context is pinned and valid.
+        unsafe {
+            bindings::ww_acquire_done(self.inner.get());
+        }
+    }
+
+    /// Returns a raw pointer to the inner `ww_acquire_ctx`.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure proper synchronization when using the raw pointer.
+    unsafe fn as_ptr(&self) -> *mut bindings::ww_acquire_ctx {
+        self.inner.get()
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for WwAcquireCtx {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: The context is being dropped and is pinned.
+        unsafe {
+            bindings::ww_acquire_fini(self.inner.get());
+        }
+    }
+}
+
+/// A wound/wait mutex backed with C side `ww_mutex`.
+///
+/// This is a mutual exclusion primitive that provides deadlock avoidance when
+/// acquiring multiple locks of the same class.
+///
+/// # Examples
+///
+/// ## Basic Usage
+///
+/// ```
+/// use kernel::sync::lock::ww_mutex::{WwClass, WwMutex};
+/// use kernel::alloc::KBox;
+/// use kernel::c_str;
+///
+/// let class = unsafe { WwClass::new(c_str!("buffer_class"), false) };
+/// let mutex = unsafe { KBox::pin_init(WwMutex::new(42u32, &class), GFP_KERNEL).unwrap() };
+///
+/// // Simple lock without context
+/// let guard = mutex.as_ref().lock(None).unwrap();
+/// assert_eq!(*guard, 42);
+///
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// ## Multiple Lock Acquisition with Deadlock Avoidance
+///
+/// ```
+/// use kernel::sync::lock::ww_mutex::{WwClass, WwAcquireCtx, WwMutex};
+/// use kernel::alloc::KBox;
+/// use kernel::c_str;
+/// use kernel::error::code::*;
+///
+/// let class = unsafe { WwClass::new(c_str!("resource_class"), true) };
+/// let mutex_a = unsafe { KBox::pin_init(WwMutex::new("Resource A", &class), GFP_KERNEL).unwrap() };
+/// let mutex_b = unsafe { KBox::pin_init(WwMutex::new("Resource B", &class), GFP_KERNEL).unwrap() };
+///
+/// let mut ctx = KBox::pin_init(unsafe { WwAcquireCtx::new(&class) }, GFP_KERNEL).unwrap();
+///
+/// // Try to acquire both locks
+/// let guard_a = match mutex_a.as_ref().lock(Some(&ctx)) {
+///     Ok(guard) => guard,
+///     Err(e) if e == EDEADLK => {
+///         // Deadlock detected, use slow path
+///         mutex_a.as_ref().lock_slow(&ctx).unwrap()
+///     }
+///     Err(e) => return Err(e),
+/// };
+///
+/// let guard_b = mutex_b.as_ref().lock(Some(&ctx)).unwrap();
+/// ctx.as_mut().done();
+///
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data]
+pub struct WwMutex<T: ?Sized> {
+    #[pin]
+    mutex: Opaque<bindings::ww_mutex>,
+    #[pin]
+    data: UnsafeCell<T>,
+}
+
+// SAFETY: `WwMutex` can be transferred across thread boundaries.
+unsafe impl<T: ?Sized + Send> Send for WwMutex<T> {}
+
+// SAFETY: `WwMutex` can be shared between threads.
+unsafe impl<T: ?Sized + Send> Sync for WwMutex<T> {}
+
+impl<T> WwMutex<T> {
+    /// Creates `Self` with calling `ww_mutex_init` inside.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that the `WwClass` remains valid for the lifetime
+    /// of this mutex.
+    pub unsafe fn new(t: T, ww_class: &WwClass) -> impl PinInit<Self> {
+        let raw_ptr = ww_class.0.get();
+        pin_init!(WwMutex {
+            mutex <- Opaque::ffi_init(|slot: *mut bindings::ww_mutex| {
+                // SAFETY: The caller guarantees that `ww_class` remains valid.
+                unsafe {
+                    bindings::ww_mutex_init(slot, raw_ptr)
+                }
+            }),
+            data: UnsafeCell::new(t),
+        })
+    }
+}
+
+impl<T: ?Sized> WwMutex<T> {
+    /// Locks the mutex with the given acquire context.
+    pub fn lock<'a>(
+        self: Pin<&'a Self>,
+        ctx: Option<&WwAcquireCtx>,
+    ) -> Result<WwMutexGuard<'a, T>> {
+        // SAFETY: The mutex is pinned and valid.
+        let ret = unsafe {
+            bindings::ww_mutex_lock(
+                self.mutex.get(),
+                ctx.map_or(core::ptr::null_mut(), |c| c.as_ptr()),
+            )
+        };
+
+        to_result(ret)?;
+
+        // SAFETY: We just acquired the lock.
+        Ok(unsafe { WwMutexGuard::new(self) })
+    }
+
+    /// Locks the mutex with the given acquire context, interruptible.
+    ///
+    /// Similar to `lock`, but can be interrupted by signals.
+    pub fn lock_interruptible<'a>(
+        self: Pin<&'a Self>,
+        ctx: Option<&WwAcquireCtx>,
+    ) -> Result<WwMutexGuard<'a, T>> {
+        // SAFETY: The mutex is pinned and valid.
+        let ret = unsafe {
+            bindings::ww_mutex_lock_interruptible(
+                self.mutex.get(),
+                ctx.map_or(core::ptr::null_mut(), |c| c.as_ptr()),
+            )
+        };
+
+        to_result(ret)?;
+
+        // SAFETY: We just acquired the lock.
+        Ok(unsafe { WwMutexGuard::new(self) })
+    }
+
+    /// Locks the mutex in the slow path after a die case.
+    ///
+    /// This should be called after releasing all held mutexes when `lock` returns `EDEADLK`.
+    pub fn lock_slow<'a>(self: Pin<&'a Self>, ctx: &WwAcquireCtx) -> Result<WwMutexGuard<'a, T>> {
+        // SAFETY: The mutex is pinned and valid, and we're in the slow path.
+        unsafe {
+            bindings::ww_mutex_lock_slow(self.mutex.get(), ctx.as_ptr());
+        }
+
+        // SAFETY: We just acquired the lock.
+        Ok(unsafe { WwMutexGuard::new(self) })
+    }
+
+    /// Locks the mutex in the slow path after a die case, interruptible.
+    pub fn lock_slow_interruptible<'a>(
+        self: Pin<&'a Self>,
+        ctx: &WwAcquireCtx,
+    ) -> Result<WwMutexGuard<'a, T>> {
+        // SAFETY: The mutex is pinned and valid, and we are in the slow path.
+        let ret =
+            unsafe { bindings::ww_mutex_lock_slow_interruptible(self.mutex.get(), ctx.as_ptr()) };
+
+        to_result(ret)?;
+
+        // SAFETY: We just acquired the lock.
+        Ok(unsafe { WwMutexGuard::new(self) })
+    }
+
+    /// Tries to lock the mutex without blocking.
+    pub fn try_lock<'a>(
+        self: Pin<&'a Self>,
+        ctx: Option<&WwAcquireCtx>,
+    ) -> Result<WwMutexGuard<'a, T>> {
+        // SAFETY: The mutex is pinned and valid.
+        let ret = unsafe {
+            bindings::ww_mutex_trylock(
+                self.mutex.get(),
+                ctx.map_or(core::ptr::null_mut(), |c| c.as_ptr()),
+            )
+        };
+
+        if ret == 0 {
+            return Err(EBUSY);
+        }
+
+        to_result(if ret < 0 { ret } else { 0 })?;
+
+        // SAFETY: We just acquired the lock.
+        Ok(unsafe { WwMutexGuard::new(self) })
+    }
+
+    /// Checks if the mutex is currently locked.
+    pub fn is_locked(self: Pin<&Self>) -> bool {
+        // SAFETY: The mutex is pinned and valid.
+        unsafe { bindings::ww_mutex_is_locked(self.mutex.get()) }
+    }
+
+    /// Returns a raw pointer to the inner mutex.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure proper synchronization when using the raw pointer.
+    unsafe fn as_ptr(&self) -> *mut bindings::ww_mutex {
+        self.mutex.get()
+    }
+}
+
+/// A guard that provides exclusive access to the data protected by a
+// [`WwMutex`] (a.k.a `ww_mutex` on the C side).
+pub struct WwMutexGuard<'a, T: ?Sized> {
+    mutex: Pin<&'a WwMutex<T>>,
+}
+
+// SAFETY: `WwMutexGuard` can be transferred across thread boundaries if the data can.
+unsafe impl<T: ?Sized + Send> Send for WwMutexGuard<'_, T> {}
+
+// SAFETY: `WwMutexGuard` can be shared between threads if the data can.
+unsafe impl<T: ?Sized + Send + Sync> Sync for WwMutexGuard<'_, T> {}
+
+impl<'a, T: ?Sized> WwMutexGuard<'a, T> {
+    /// Creates a new guard for a locked mutex.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that the mutex is actually locked.
+    unsafe fn new(mutex: Pin<&'a WwMutex<T>>) -> Self {
+        Self { mutex }
+    }
+}
+
+impl<T: ?Sized> core::ops::Deref for WwMutexGuard<'_, T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: We hold the lock, so we have exclusive access.
+        unsafe { &*self.mutex.data.get() }
+    }
+}
+
+impl<T: ?Sized> core::ops::DerefMut for WwMutexGuard<'_, T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: We hold the lock, so we have exclusive access.
+        unsafe { &mut *self.mutex.data.get() }
+    }
+}
+
+impl<T: ?Sized> Drop for WwMutexGuard<'_, T> {
+    fn drop(&mut self) {
+        // SAFETY: We hold the lock and are about to release it.
+        unsafe {
+            bindings::ww_mutex_unlock(self.mutex.as_ptr());
+        }
+    }
+}
+
+#[kunit_tests(rust_kernel_ww_mutex)]
+mod tests {
+    use crate::alloc::KBox;
+    use crate::c_str;
+    use crate::init::InPlaceInit;
+    use crate::prelude::*;
+
+    use super::*;
+
+    #[test]
+    fn test_ww_mutex_basic_lock_unlock() {
+        // SAFETY: valid for this test, nothing to worry about
+
+        let class = unsafe { WwClass::new(c_str!("test_mutex_class"), false) };
+
+        // SAFETY: valid for this test, nothing to worry about
+
+        let mutex = unsafe { KBox::pin_init(WwMutex::new(42, &class), GFP_KERNEL).unwrap() };
+
+        // Lock without context
+        let guard = mutex.as_ref().lock(None).unwrap();
+        assert_eq!(*guard, 42);
+
+        // Drop the lock
+        drop(guard);
+
+        // Lock it again
+        let mut guard = mutex.as_ref().lock(None).unwrap();
+        *guard = 100;
+        assert_eq!(*guard, 100);
+    }
+
+    #[test]
+    fn test_ww_mutex_trylock() {
+        // SAFETY: valid for this test, nothing to worry about
+
+        let class = unsafe { WwClass::new(c_str!("trylock_class"), false) };
+        // SAFETY: valid for this test, nothing to worry about
+
+        let mutex = unsafe { KBox::pin_init(WwMutex::new(123i32, &class), GFP_KERNEL).unwrap() };
+
+        // trylock on unlocked mutex should succeed
+        let guard = mutex.as_ref().try_lock(None).unwrap();
+        assert_eq!(*guard, 123);
+        drop(guard);
+
+        // lock it first
+        let _guard1 = mutex.as_ref().lock(None).unwrap();
+
+        // trylock should fail with EBUSY when already locked
+        let result = mutex.as_ref().try_lock(None);
+        match result {
+            Err(e) => assert_eq!(e, EBUSY),
+            Ok(_) => panic!("Expected `EBUSY` but got success"),
+        }
+    }
+
+    #[test]
+    fn test_ww_mutex_is_locked() {
+        // SAFETY: valid for this test, nothing to worry about
+
+        let class = unsafe { WwClass::new(c_str!("locked_check_class"), true) };
+        // SAFETY: valid for this test, nothing to worry about
+
+        let mutex = unsafe { KBox::pin_init(WwMutex::new("hello", &class), GFP_KERNEL).unwrap() };
+
+        // should not be locked initially
+        assert!(!mutex.as_ref().is_locked());
+
+        let guard = mutex.as_ref().lock(None).unwrap();
+        assert!(mutex.as_ref().is_locked());
+
+        drop(guard);
+        assert!(!mutex.as_ref().is_locked());
+    }
+
+    #[test]
+    fn test_ww_acquire_context() {
+        // SAFETY: valid for this test, nothing to worry about
+        let class = unsafe { WwClass::new(c_str!("ctx_class"), false) };
+
+        // SAFETY: valid for this test, nothing to worry about
+        let mutex1 = unsafe { KBox::pin_init(WwMutex::new(1u64, &class), GFP_KERNEL).unwrap() };
+
+        // SAFETY: valid for this test, nothing to worry about
+        let mutex2 = unsafe { KBox::pin_init(WwMutex::new(2u64, &class), GFP_KERNEL).unwrap() };
+
+        // SAFETY: valid for this test, nothing to worry about
+        let mut ctx = unsafe { KBox::pin_init(WwAcquireCtx::new(&class), GFP_KERNEL).unwrap() };
+
+        // acquire multiple mutexes with same context
+        let guard1 = mutex1.as_ref().lock(Some(&ctx)).unwrap();
+        let guard2 = mutex2.as_ref().lock(Some(&ctx)).unwrap();
+
+        assert_eq!(*guard1, 1);
+        assert_eq!(*guard2, 2);
+
+        ctx.as_mut().done();
+
+        // we shouldn't be able to lock once it's `done`.
+        assert!(mutex1.as_ref().lock(Some(&ctx)).is_err());
+        assert!(mutex2.as_ref().lock(Some(&ctx)).is_err());
+    }
+}
2.49.0

