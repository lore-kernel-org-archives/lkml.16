Received: from forward204d.mail.yandex.net (forward204d.mail.yandex.net [178.154.239.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AFE149C4A;
	Sat, 21 Jun 2025 18:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750531543; cv=none; b=oj0j8j0don7Pj1jD4/qqrkVo9HCq6q/hF7abUDkzJtkgRCjgcCrsBW7r2Yxy3ZrnRE+MmjCiJFYGu2q0vYvRhHLSmEyow+uB6Xm13XxsioOzs+v09YYT5GrrewOjuCf+TkJapSVE3cyMdxd+JMSUXSu7YNQT1LDQynPt+2uszuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750531543; c=relaxed/simple;
	bh=MwYToA1ViwMn9OJnQpWTqjLN1aNbKLDZn/TyhB72vD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jqRD7+S54kqAAZl4caCjcZ0s9hSWi8DgDSOgY6FSlEnmte9ipmXr7GIDefGHAnKUvBr7w0blqyFC9yB9RiY9yIurGhcZnrW2uJknJJwR1BfZolQtmwmGeea8utU/XmuoZa/Z6paMj9SBguN9hU2Sm6paj7W0D1dgaoiam/bL0M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=DyMgvl8t; arc=none smtp.client-ip=178.154.239.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="DyMgvl8t"
Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d100])
	by forward204d.mail.yandex.net (Yandex) with ESMTPS id 2C2AA636DB;
	Sat, 21 Jun 2025 21:45:33 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:3b23:0:640:a115:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id 1C7D36097F;
	Sat, 21 Jun 2025 21:45:25 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id uiVAZ68LnCg0-MgdBnASd;
	Sat, 21 Jun 2025 21:45:23 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750531523;
	bh=4QAtW8ztVhSVIIbbVebVmmjGfqweU/YmmuzRajEBRpg=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=DyMgvl8t71YCwPa1OTDQZXzvo4cLxMFlCSf5H4ihTHwLoQ+CpTGpO1kaz9qlx6b3b
	 TklyL74iMU0zbrkRzcDvqdvM+B/x0Y5KhwYM8fwl4hewALBz9+UxRJiiwVQs7Qzt+B
	 0azFAyWosWwGFTscbbIoKPDYuxa53c++v1qYzewg=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	bjorn3_gh@protonmail.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
Date: Sat, 21 Jun 2025 21:44:53 +0300
Message-ID: <20250621184454.8354-3-work@onurozkan.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250621184454.8354-1-work@onurozkan.dev>
References: <20250621184454.8354-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds Rust bindings for the kernel's `ww_mutex` infrastructure to enable
deadlock-free acquisition of multiple related locks.

The patch abstracts `ww_mutex.h` header and wraps the existing
C `ww_mutex` with three main types:
    - `WwClass` for grouping related mutexes
    - `WwAcquireCtx` for tracking lock acquisition context
    - `WwMutex<T>` for the actual lock

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/error.rs              |   1 +
 rust/kernel/sync/lock.rs          |   1 +
 rust/kernel/sync/lock/ww_mutex.rs | 421 ++++++++++++++++++++++++++++++
 3 files changed, 423 insertions(+)
 create mode 100644 rust/kernel/sync/lock/ww_mutex.rs

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 3dee3139fcd4..28157541e12c 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -64,6 +64,7 @@ macro_rules! declare_err {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+    declare_err!(EDEADLK, "Resource deadlock avoided.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
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
index 000000000000..dcb23941813c
--- /dev/null
+++ b/rust/kernel/sync/lock/ww_mutex.rs
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A kernel Wound/Wait Mutex.
+//!
+//! This module provides Rust abstractions for the Linux kernel's `ww_mutex` implementation,
+//! which provides deadlock avoidance through a wait-wound or wait-die algorithm.
+//!
+//! C header: [`include/linux/ww_mutex.h`](srctree/include/linux/ww_mutex.h)
+//!
+//! For more information: <https://docs.kernel.org/locking/ww-mutex-design.html>
+
+use crate::bindings;
+use crate::error::to_result;
+use crate::prelude::*;
+use crate::types::{NotThreadSafe, Opaque};
+use core::cell::UnsafeCell;
+use core::marker::PhantomData;
+
+/// Create static [`WwClass`] instances.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::{c_str, define_ww_class};
+///
+/// define_ww_class!(WOUND_WAIT_GLOBAL_CLASS, wound_wait, c_str!("wound_wait_global_class"));
+/// define_ww_class!(WAIT_DIE_GLOBAL_CLASS, wait_die, c_str!("wait_die_global_class"));
+/// ```
+#[macro_export]
+macro_rules! define_ww_class {
+    ($name:ident, wound_wait, $class_name:expr) => {
+        static $name: $crate::sync::lock::ww_mutex::WwClass =
+            { $crate::sync::lock::ww_mutex::WwClass::new($class_name, false) };
+    };
+    ($name:ident, wait_die, $class_name:expr) => {
+        static $name: $crate::sync::lock::ww_mutex::WwClass =
+            { $crate::sync::lock::ww_mutex::WwClass::new($class_name, true) };
+    };
+}
+
+/// A group of mutexes that can participate in deadlock avoidance together.
+///
+/// All mutexes that might be acquired together should use the same class.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::lock::ww_mutex::WwClass;
+/// use kernel::c_str;
+/// use pin_init::stack_pin_init;
+///
+/// stack_pin_init!(let _wait_die_class = WwClass::new_wait_die(c_str!("graphics_buffers")));
+/// stack_pin_init!(let _wound_wait_class = WwClass::new_wound_wait(c_str!("memory_pools")));
+///
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data]
+pub struct WwClass {
+    #[pin]
+    inner: Opaque<bindings::ww_class>,
+}
+
+// SAFETY: [`WwClass`] is set up once and never modified. It's fine to share it across threads.
+unsafe impl Sync for WwClass {}
+// SAFETY: Doesn't hold anything thread-specific. It's safe to send to other threads.
+unsafe impl Send for WwClass {}
+
+macro_rules! ww_class_init_helper {
+    ($name:expr, $is_wait_die:expr) => {
+        Opaque::new(bindings::ww_class {
+            stamp: bindings::atomic_long_t { counter: 0 },
+            acquire_name: $name.as_char_ptr(),
+            mutex_name: $name.as_char_ptr(),
+            is_wait_die: $is_wait_die as u32,
+            // TODO: Replace with `bindings::lock_class_key::default()` once stabilized for `const`.
+            //
+            // SAFETY: This is always zero-initialized when defined with `DEFINE_WD_CLASS`
+            // globally on C side.
+            //
+            // Ref: <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/ww_mutex.h?h=v6.16-rc2#n85>
+            acquire_key: unsafe { core::mem::zeroed() },
+            // TODO: Replace with `bindings::lock_class_key::default()` once stabilized for `const`.
+            //
+            // SAFETY: This is always zero-initialized when defined with `DEFINE_WD_CLASS`
+            // globally on C side.
+            //
+            // Ref: <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/ww_mutex.h?h=v6.16-rc2#n85>
+            mutex_key: unsafe { core::mem::zeroed() },
+        })
+    };
+}
+
+impl WwClass {
+    /// Creates a [`WwClass`].
+    ///
+    /// It's `pub` only so it can be used by the `define_ww_class!` macro.
+    ///
+    /// You should not use this function directly. Use the `define_ww_class!`
+    /// macro or call [`WwClass::new_wait_die`] or [`WwClass::new_wound_wait`] instead.
+    pub const fn new(name: &'static CStr, is_wait_die: bool) -> Self {
+        WwClass {
+            inner: ww_class_init_helper!(name, is_wait_die),
+        }
+    }
+
+    /// Creates wait-die [`WwClass`].
+    pub fn new_wait_die(name: &'static CStr) -> impl PinInit<Self> {
+        pin_init!(WwClass {
+            inner: ww_class_init_helper!(name, true),
+        })
+    }
+
+    /// Creates wound-wait [`WwClass`].
+    pub fn new_wound_wait(name: &'static CStr) -> impl PinInit<Self> {
+        pin_init!(WwClass {
+            inner: ww_class_init_helper!(name, false),
+        })
+    }
+}
+
+/// An acquire context is used to group multiple mutex acquisitions together
+/// for deadlock avoidance. It must be used when acquiring multiple mutexes
+/// of the same class.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::lock::ww_mutex::{WwClass, WwAcquireCtx, WwMutex};
+/// use kernel::c_str;
+/// use kernel::alloc::KBox;
+/// use pin_init::stack_pin_init;
+///
+/// stack_pin_init!(let class = WwClass::new_wound_wait(c_str!("my_class")));
+///
+/// // Create mutexes.
+/// stack_pin_init!(let mutex1 = WwMutex::new(1, &class));
+/// stack_pin_init!(let mutex2 = WwMutex::new(2, &class));
+///
+/// // Create acquire context for deadlock avoidance.
+/// let mut ctx = KBox::pin_init(WwAcquireCtx::new(&class), GFP_KERNEL)?;
+///
+/// // Acquire multiple locks safely.
+/// let guard1 = mutex1.lock(Some(&ctx))?;
+/// let guard2 = mutex2.lock(Some(&ctx))?;
+///
+/// // Mark acquisition phase as complete.
+/// ctx.as_mut().done();
+///
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data(PinnedDrop)]
+pub struct WwAcquireCtx<'a> {
+    #[pin]
+    inner: Opaque<bindings::ww_acquire_ctx>,
+    _p: PhantomData<&'a WwClass>,
+}
+
+// SAFETY: Used in controlled ways during lock acquisition. No race risk.
+unsafe impl Sync for WwAcquireCtx<'_> {}
+// SAFETY: Doesn't rely on thread-local state. Safe to move between threads.
+unsafe impl Send for WwAcquireCtx<'_> {}
+
+impl<'ctx> WwAcquireCtx<'ctx> {
+    /// Initializes `Self` with calling C side `ww_acquire_init` inside.
+    pub fn new<'class: 'ctx>(ww_class: &'class WwClass) -> impl PinInit<Self> {
+        let raw_ptr = ww_class.inner.get();
+        pin_init!(WwAcquireCtx {
+            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_acquire_ctx| {
+                // SAFETY: The caller guarantees that `ww_class` remains valid.
+                unsafe { bindings::ww_acquire_init(slot, raw_ptr) }
+            }),
+            _p: PhantomData
+        })
+    }
+
+    /// Marks the end of the acquire phase with C side `ww_acquire_done`.
+    ///
+    /// After calling this function, no more mutexes can be acquired with this context.
+    pub fn done(self: Pin<&mut Self>) {
+        // SAFETY: The context is pinned and valid.
+        unsafe { bindings::ww_acquire_done(self.inner.get()) };
+    }
+
+    /// Returns a raw pointer to the inner `ww_acquire_ctx`.
+    fn as_ptr(&self) -> *mut bindings::ww_acquire_ctx {
+        self.inner.get()
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for WwAcquireCtx<'_> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: The context is being dropped and is pinned.
+        unsafe { bindings::ww_acquire_fini(self.inner.get()) };
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
+/// use kernel::c_str;
+/// use pin_init::stack_pin_init;
+///
+/// stack_pin_init!(let class = WwClass::new_wound_wait(c_str!("buffer_class")));
+/// stack_pin_init!(let mutex = WwMutex::new(42, &class));
+///
+/// // Simple lock without context.
+/// let guard = mutex.lock(None)?;
+/// assert_eq!(*guard, 42);
+///
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// ## Multiple Locks
+///
+/// ```
+/// use kernel::c_str;
+/// use kernel::prelude::*;
+/// use kernel::sync::lock::ww_mutex::{WwClass, WwAcquireCtx, WwMutex};
+/// use pin_init::stack_pin_init;
+///
+/// stack_pin_init!(let class = WwClass::new_wait_die(c_str!("resource_class")));
+/// stack_pin_init!(let mutex_a = WwMutex::new("Resource A", &class));
+/// stack_pin_init!(let mutex_b = WwMutex::new("Resource B", &class));
+///
+/// let mut ctx = KBox::pin_init(WwAcquireCtx::new(&class), GFP_KERNEL)?;
+///
+/// // Try to acquire both locks.
+/// let guard_a = match mutex_a.lock(Some(&ctx)) {
+///     Ok(guard) => guard,
+///     Err(e) if e == EDEADLK => {
+///         // Deadlock detected, use slow path.
+///         mutex_a.lock_slow(&ctx)?
+///     }
+///     Err(e) => return Err(e),
+/// };
+///
+/// let guard_b = mutex_b.lock(Some(&ctx))?;
+/// ctx.as_mut().done();
+///
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data]
+pub struct WwMutex<'a, T: ?Sized> {
+    _p: PhantomData<&'a WwClass>,
+    #[pin]
+    mutex: Opaque<bindings::ww_mutex>,
+    data: UnsafeCell<T>,
+}
+
+// SAFETY: [`WwMutex`] can be shared between threads.
+unsafe impl<T: ?Sized + Send> Send for WwMutex<'_, T> {}
+// SAFETY: [`WwMutex`] can be safely accessed from multiple threads concurrently.
+unsafe impl<T: ?Sized + Sync> Sync for WwMutex<'_, T> {}
+
+impl<'ww_class, T> WwMutex<'ww_class, T> {
+    /// Creates `Self` with calling `ww_mutex_init` inside.
+    pub fn new(t: T, ww_class: &'ww_class WwClass) -> impl PinInit<Self> {
+        let raw_ptr = ww_class.inner.get();
+        pin_init!(WwMutex {
+            mutex <- Opaque::ffi_init(|slot: *mut bindings::ww_mutex| {
+                // SAFETY: The caller guarantees that `ww_class` remains valid.
+                unsafe { bindings::ww_mutex_init(slot, raw_ptr) }
+            }),
+            data: UnsafeCell::new(t),
+            _p: PhantomData,
+        })
+    }
+}
+
+impl<T: ?Sized> WwMutex<'_, T> {
+    /// Locks the mutex with the given acquire context.
+    pub fn lock<'a>(&'a self, ctx: Option<&WwAcquireCtx<'_>>) -> Result<WwMutexGuard<'a, T>> {
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
+        Ok(WwMutexGuard::new(self))
+    }
+
+    /// Locks the mutex with the given acquire context, interruptible.
+    ///
+    /// Similar to `lock`, but can be interrupted by signals.
+    pub fn lock_interruptible<'a>(
+        &'a self,
+        ctx: Option<&WwAcquireCtx<'_>>,
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
+        Ok(WwMutexGuard::new(self))
+    }
+
+    /// Locks the mutex in the slow path after a die case.
+    ///
+    /// This should be called after releasing all held mutexes when `lock` returns [`EDEADLK`].
+    pub fn lock_slow<'a>(&'a self, ctx: &WwAcquireCtx<'_>) -> Result<WwMutexGuard<'a, T>> {
+        // SAFETY: The mutex is pinned and valid, and we're in the slow path.
+        unsafe { bindings::ww_mutex_lock_slow(self.mutex.get(), ctx.as_ptr()) };
+
+        Ok(WwMutexGuard::new(self))
+    }
+
+    /// Locks the mutex in the slow path after a die case, interruptible.
+    pub fn lock_slow_interruptible<'a>(
+        &'a self,
+        ctx: &WwAcquireCtx<'_>,
+    ) -> Result<WwMutexGuard<'a, T>> {
+        // SAFETY: The mutex is pinned and valid, and we are in the slow path.
+        let ret =
+            unsafe { bindings::ww_mutex_lock_slow_interruptible(self.mutex.get(), ctx.as_ptr()) };
+
+        to_result(ret)?;
+
+        Ok(WwMutexGuard::new(self))
+    }
+
+    /// Tries to lock the mutex without blocking.
+    pub fn try_lock<'a>(&'a self, ctx: Option<&WwAcquireCtx<'_>>) -> Result<WwMutexGuard<'a, T>> {
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
+        Ok(WwMutexGuard::new(self))
+    }
+
+    /// Checks if the mutex is currently locked.
+    pub fn is_locked(&self) -> bool {
+        // SAFETY: The mutex is pinned and valid.
+        unsafe { bindings::ww_mutex_is_locked(self.mutex.get()) }
+    }
+
+    /// Returns a raw pointer to the inner mutex.
+    fn as_ptr(&self) -> *mut bindings::ww_mutex {
+        self.mutex.get()
+    }
+}
+
+/// A guard that provides exclusive access to the data protected
+/// by a [`WwMutex`].
+///
+/// # Invariants
+///
+/// The guard holds an exclusive lock on the associated [`WwMutex`]. The lock is held
+/// for the entire lifetime of this guard and is automatically released when the
+/// guard is dropped.
+#[must_use = "the lock unlocks immediately when the guard is unused"]
+pub struct WwMutexGuard<'a, T: ?Sized> {
+    mutex: &'a WwMutex<'a, T>,
+    _not_send: NotThreadSafe,
+}
+
+// SAFETY: [`WwMutexGuard`] can be transferred across thread boundaries if the data can.
+unsafe impl<T: ?Sized + Send> Send for WwMutexGuard<'_, T> {}
+
+// SAFETY: [`WwMutexGuard`] can be shared between threads if the data can.
+unsafe impl<T: ?Sized + Send + Sync> Sync for WwMutexGuard<'_, T> {}
+
+impl<'a, T: ?Sized> WwMutexGuard<'a, T> {
+    /// Creates a new guard for a locked mutex.
+    fn new(mutex: &'a WwMutex<'a, T>) -> Self {
+        Self {
+            mutex,
+            _not_send: NotThreadSafe,
+        }
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
+        unsafe { bindings::ww_mutex_unlock(self.mutex.as_ptr()) };
+    }
+}
-- 
2.49.0

