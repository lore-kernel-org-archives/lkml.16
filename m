Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5AC217F53
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384643; cv=none; b=tqkWRMVYl8Nj76NShK0CWVlR5CN39glL/9uWRhYBqOBe4inBsmA2Kk9k9PBT8SerVMpoq8rPt8IWx8vQOs4c+d5pxYDrs4XF/6EU4WYFy0jA9E4COCOqGhR4PD2DOzxMTLih/nmg4+qUcRI+kCPGUM9cgwG7HHfAaASzwzeRW4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384643; c=relaxed/simple;
	bh=K/kCRV+vYD+2YO+oFslJP5wDdoaYlsm2sq9RCzg3FCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U7mfaj2LFZGuWPAFWq+Cecds4X0FIQ2fnWehM6k98XP9R0kGsKACnuSlnao4N9gkeM6dp172iZSUO8eBaFLzG/qEW/OGujqXGW0j9w77GNI9Nbt3qlD48R/GT/g+5PuaMnokN4bT44+ZPtsyBc99/SQ0Ok80vZnAXurrDZG0wEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IId2KlnO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IId2KlnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748384640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CBVPvFqpc4S6zyfnT4FHDRkMI9Y7cez+gb/r6f3/m84=;
	b=IId2KlnOFqyyp38MKbvH2mxCRYaDhqKVKCLfpUthqNQz3/hNzKmQCI3Zl7dp8bPr+GCPjN
	aPSqHR+c5IERTXQtIWFe8d+zIAAk+uQvk/soPUxVZ/yS2MVYMfwoSOctWDNAC8TrpUIFKo
	nk6uJ+4VZidapWvZ0KxymVC3tOP61M4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-88-hK8i15VGMhOLSlgzc6hpdQ-1; Tue,
 27 May 2025 18:23:55 -0400
X-MC-Unique: hK8i15VGMhOLSlgzc6hpdQ-1
X-Mimecast-MFC-AGG-ID: hK8i15VGMhOLSlgzc6hpdQ_1748384633
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0CC99195608B;
	Tue, 27 May 2025 22:23:53 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.105])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 40DF030001B0;
	Tue, 27 May 2025 22:23:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [RFC RESEND v10 08/14] rust: sync: lock: Add `Backend::BackendInContext`
Date: Tue, 27 May 2025 18:21:49 -0400
Message-ID: <20250527222254.565881-9-lyude@redhat.com>
In-Reply-To: <20250527222254.565881-1-lyude@redhat.com>
References: <20250527222254.565881-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

From: Boqun Feng <boqun.feng@gmail.com>

`SpinLock`'s backend can be used for `SpinLockIrq`, if the interrupts are
disabled. And it actually provides performance gains since interrupts are
not needed to be disabled anymore. So add `Backend::BackendInContext` to
describe the case where one backend can be used for another. Use it to
implement the `lock_with()` so that `SpinLockIrq` can avoid disabling
interrupts by using `SpinLock`'s backend.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Co-authored-by: Lyude Paul <lyude@redhat.com>

---
V10:
* Fix typos - Dirk/Lyude
* Since we're adding support for context locks to GlobalLock as well, let's
  also make sure to cover try_lock while we're at it and add try_lock_with
* Add a private function as_lock_in_context() for handling casting from a
  Lock<T, B> to Lock<T, B::BackendInContext> so we don't have to duplicate
  safety comments

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock.rs          | 61 ++++++++++++++++++++++++++++++-
 rust/kernel/sync/lock/mutex.rs    |  1 +
 rust/kernel/sync/lock/spinlock.rs | 41 +++++++++++++++++++++
 3 files changed, 101 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index f94ed1a825f6d..64a7a78ea2dde 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -30,10 +30,15 @@
 ///   is owned, that is, between calls to [`lock`] and [`unlock`].
 /// - Implementers must also ensure that [`relock`] uses the same locking method as the original
 ///   lock operation.
+/// - Implementers must ensure if [`BackendInContext`] is a [`Backend`], it's safe to acquire the
+///   lock under the [`Context`], the [`State`] of two backends must be the same.
 ///
 /// [`lock`]: Backend::lock
 /// [`unlock`]: Backend::unlock
 /// [`relock`]: Backend::relock
+/// [`BackendInContext`]: Backend::BackendInContext
+/// [`Context`]: Backend::Context
+/// [`State`]: Backend::State
 pub unsafe trait Backend {
     /// The state required by the lock.
     type State;
@@ -47,6 +52,9 @@ pub unsafe trait Backend {
     /// The context which can be provided to acquire the lock with a different backend.
     type Context<'a>;
 
+    /// The alternative backend we can use if a [`Context`](Backend::Context) is provided.
+    type BackendInContext: Sized;
+
     /// Initialises the lock.
     ///
     /// # Safety
@@ -166,10 +174,59 @@ pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> &'a Self {
 }
 
 impl<T: ?Sized, B: Backend> Lock<T, B> {
+    /// Casts the lock as a `Lock<T, B::BackendInContext>`.
+    fn as_lock_in_context<'a>(
+        &'a self,
+        _context: B::Context<'a>,
+    ) -> &'a Lock<T, B::BackendInContext>
+    where
+        B::BackendInContext: Backend,
+    {
+        // SAFETY:
+        // - Per the safety guarantee of `Backend`, if `B::BackendInContext` and `B` should
+        //   have the same state, the layout of the lock is the same so it's safe to convert one to
+        //   another.
+        // - The caller provided `B::Context<'a>`, so it is safe to recast and return this lock.
+        unsafe { &*(self as *const _ as *const Lock<T, B::BackendInContext>) }
+    }
+
     /// Acquires the lock with the given context and gives the caller access to the data protected
     /// by it.
-    pub fn lock_with<'a>(&'a self, _context: B::Context<'a>) -> Guard<'a, T, B> {
-        todo!()
+    pub fn lock_with<'a>(&'a self, context: B::Context<'a>) -> Guard<'a, T, B::BackendInContext>
+    where
+        B::BackendInContext: Backend,
+    {
+        let lock = self.as_lock_in_context(context);
+
+        // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
+        // that `init` was called. Plus the safety guarantee of `Backend` guarantees that `B::State`
+        // is the same as `B::BackendInContext::State`, also it's safe to call another backend
+        // because there is `B::Context<'a>`.
+        let state = unsafe { B::BackendInContext::lock(lock.state.get()) };
+
+        // SAFETY: The lock was just acquired.
+        unsafe { Guard::new(lock, state) }
+    }
+
+    /// Tries to acquire the lock with the given context.
+    ///
+    /// Returns a guard that can be used to access the data protected by the lock if successful.
+    pub fn try_lock_with<'a>(
+        &'a self,
+        context: B::Context<'a>,
+    ) -> Option<Guard<'a, T, B::BackendInContext>>
+    where
+        B::BackendInContext: Backend,
+    {
+        let lock = self.as_lock_in_context(context);
+
+        // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
+        // that `init` was called. Plus the safety guarantee of `Backend` guarantees that `B::State`
+        // is the same as `B::BackendInContext::State`, also it's safe to call another backend
+        // because there is `B::Context<'a>`.
+        unsafe {
+            B::BackendInContext::try_lock(lock.state.get()).map(|state| Guard::new(lock, state))
+        }
     }
 
     /// Acquires the lock and gives the caller access to the data protected by it.
diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex.rs
index be1e2e18cf42d..662a530750703 100644
--- a/rust/kernel/sync/lock/mutex.rs
+++ b/rust/kernel/sync/lock/mutex.rs
@@ -102,6 +102,7 @@ unsafe impl super::Backend for MutexBackend {
     type State = bindings::mutex;
     type GuardState = ();
     type Context<'a> = ();
+    type BackendInContext = ();
 
     unsafe fn init(
         ptr: *mut Self::State,
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index f3dac0931f6a2..a2d60d5da5e11 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -102,6 +102,7 @@ unsafe impl super::Backend for SpinLockBackend {
     type State = bindings::spinlock_t;
     type GuardState = ();
     type Context<'a> = ();
+    type BackendInContext = ();
 
     unsafe fn init(
         ptr: *mut Self::State,
@@ -221,6 +222,45 @@ macro_rules! new_spinlock_irq {
 /// # Ok::<(), Error>(())
 /// ```
 ///
+/// The next example demonstrates locking a [`SpinLockIrq`] using [`lock_with()`] in a function
+/// which can only be called when local processor interrupts are already disabled.
+///
+/// ```
+/// use kernel::sync::{new_spinlock_irq, SpinLockIrq};
+/// use kernel::interrupt::*;
+///
+/// struct Inner {
+///     a: u32,
+/// }
+///
+/// #[pin_data]
+/// struct Example {
+///     #[pin]
+///     inner: SpinLockIrq<Inner>,
+/// }
+///
+/// impl Example {
+///     fn new() -> impl PinInit<Self> {
+///         pin_init!(Self {
+///             inner <- new_spinlock_irq!(Inner { a: 20 }),
+///         })
+///     }
+/// }
+///
+/// // Accessing an `Example` from a function that can only be called in no-interrupt contexts.
+/// fn noirq_work(e: &Example, interrupt_disabled: &LocalInterruptDisabled) {
+///     // Because we know interrupts are disabled from interrupt_disable, we can skip toggling
+///     // interrupt state using lock_with() and the provided token
+///     assert_eq!(e.inner.lock_with(interrupt_disabled).a, 20);
+/// }
+///
+/// # let e = KBox::pin_init(Example::new(), GFP_KERNEL)?;
+/// # let interrupt_guard = local_interrupt_disable();
+/// # noirq_work(&e, &interrupt_guard);
+/// #
+/// # Ok::<(), Error>(())
+/// ```
+///
 /// [`lock()`]: SpinLockIrq::lock
 /// [`lock_with()`]: SpinLockIrq::lock_with
 pub type SpinLockIrq<T> = super::Lock<T, SpinLockIrqBackend>;
@@ -245,6 +285,7 @@ unsafe impl super::Backend for SpinLockIrqBackend {
     type State = bindings::spinlock_t;
     type GuardState = ();
     type Context<'a> = &'a LocalInterruptDisabled;
+    type BackendInContext = SpinLockBackend;
 
     unsafe fn init(
         ptr: *mut Self::State,
-- 
2.49.0

