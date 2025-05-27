Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B331421B182
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384650; cv=none; b=abHsocoqT5TFS4DLTDPSK5noKaKHyfDFDoTv7wc0G9ZLp3F5BvuPa1R+DdBfaAEc6tcwGKMFCLgX/wkBFQ7rmfnzXidpwQP/XoS2APZUctxkXoDSLpqYbL1c3if5d6heVJRltVW1yI0kvAw3M+DQrruswyYPdY4KA+zC9GHzWd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384650; c=relaxed/simple;
	bh=AydgeMBxQmfRC50EYCC7u9zKePxoR7+R6ojZT1ByqY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1A3IBZOFwI1H2H3fMBpEx9zzqcodnhWyOHaV3kyzpKF49R0Gv09P46lG2pGz/0w/3OY/NAuWDVr1TKMmQuRlphoz/Lo4N1fmvtk2GUw87Dm48OuuZJdccXReqWWMBVzpesJ8suTmdjgwoZj4nV0tEwmil6Jb9x/orz8ubxaVqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MBv7Nelo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MBv7Nelo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748384647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pb6GJmOC89y5wwjfDdoygoI3FossLZXmvu5/ODyB7LU=;
	b=MBv7Nelo+/SinjXWsIZlxSzz0jB0t5HhCJU7FUc2NRLMAML367SY1N/1mBM56pbkvaHRoG
	ZyXI7tfqx62gqRSXvy2L8/Rq/o6ZhTh3Xw+TEfkhFVdIHnxy18uZiyy9jIJLbdYaH210Mi
	Fyv9exkt2abtxqZJKWhSp+J5uMh5AA0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-0DOzfyj-Mu6ODQlyJtpc8A-1; Tue,
 27 May 2025 18:24:04 -0400
X-MC-Unique: 0DOzfyj-Mu6ODQlyJtpc8A-1
X-Mimecast-MFC-AGG-ID: 0DOzfyj-Mu6ODQlyJtpc8A_1748384642
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2FB29180034E;
	Tue, 27 May 2025 22:24:02 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.105])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4F6EA19560AA;
	Tue, 27 May 2025 22:23:58 +0000 (UTC)
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
Subject: [RFC RESEND v10 10/14] rust: sync: lock/global: Rename B to G in trait bounds
Date: Tue, 27 May 2025 18:21:51 -0400
Message-ID: <20250527222254.565881-11-lyude@redhat.com>
In-Reply-To: <20250527222254.565881-1-lyude@redhat.com>
References: <20250527222254.565881-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Due to the introduction of Backend::BackendInContext, if we want to be able
support Lock types with a Context we need to be able to handle the fact
that the Backend for a returned Guard may not exactly match the Backend for
the lock. Before we add this though, rename B to G in all of our trait
bounds to make sure things don't become more difficult to understand once
we add a Backend bound.

There should be no functional changes in this patch.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock/global.rs | 56 ++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 45400824b0940..37209882e006b 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -33,18 +33,18 @@ pub trait GlobalLockBackend {
 /// Type used for global locks.
 ///
 /// See [`global_lock!`] for examples.
-pub struct GlobalLock<B: GlobalLockBackend> {
-    inner: Lock<B::Item, B::Backend>,
+pub struct GlobalLock<G: GlobalLockBackend> {
+    inner: Lock<G::Item, G::Backend>,
 }
 
-impl<'a, B: GlobalLockBackend> GlobalLock<B> {
+impl<'a, G: GlobalLockBackend> GlobalLock<G> {
     /// Creates a global lock.
     ///
     /// # Safety
     ///
     /// * Before any other method on this lock is called, [`Self::init`] must be called.
-    /// * The type `B` must not be used with any other lock.
-    pub const unsafe fn new(data: B::Item) -> Self {
+    /// * The type `G` must not be used with any other lock.
+    pub const unsafe fn new(data: G::Item) -> Self {
         Self {
             inner: Lock {
                 state: Opaque::uninit(),
@@ -68,23 +68,23 @@ pub unsafe fn init(&'static self) {
         // `init` before using any other methods. As `init` can only be called once, all other
         // uses of this lock must happen after this call.
         unsafe {
-            B::Backend::init(
+            G::Backend::init(
                 self.inner.state.get(),
-                B::NAME.as_char_ptr(),
-                B::get_lock_class().as_ptr(),
+                G::NAME.as_char_ptr(),
+                G::get_lock_class().as_ptr(),
             )
         }
     }
 
     /// Lock this global lock.
-    pub fn lock(&'static self) -> GlobalGuard<'static, B> {
+    pub fn lock(&'static self) -> GlobalGuard<'static, G> {
         GlobalGuard {
             inner: self.inner.lock(),
         }
     }
 
     /// Try to lock this global lock.
-    pub fn try_lock(&'static self) -> Option<GlobalGuard<'static, B>> {
+    pub fn try_lock(&'static self) -> Option<GlobalGuard<'static, G>> {
         Some(GlobalGuard {
             inner: self.inner.try_lock()?,
         })
@@ -94,19 +94,19 @@ pub fn try_lock(&'static self) -> Option<GlobalGuard<'static, B>> {
 /// A guard for a [`GlobalLock`].
 ///
 /// See [`global_lock!`] for examples.
-pub struct GlobalGuard<'a, B: GlobalLockBackend> {
-    inner: Guard<'a, B::Item, B::Backend>,
+pub struct GlobalGuard<'a, G: GlobalLockBackend> {
+    inner: Guard<'a, G::Item, G::Backend>,
 }
 
-impl<'a, B: GlobalLockBackend> core::ops::Deref for GlobalGuard<'a, B> {
-    type Target = B::Item;
+impl<'a, G: GlobalLockBackend> core::ops::Deref for GlobalGuard<'a, G> {
+    type Target = G::Item;
 
     fn deref(&self) -> &Self::Target {
         &self.inner
     }
 }
 
-impl<'a, B: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<'a, B> {
+impl<'a, G: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<'a, G> {
     fn deref_mut(&mut self) -> &mut Self::Target {
         &mut self.inner
     }
@@ -115,33 +115,33 @@ fn deref_mut(&mut self) -> &mut Self::Target {
 /// A version of [`LockedBy`] for a [`GlobalLock`].
 ///
 /// See [`global_lock!`] for examples.
-pub struct GlobalLockedBy<T: ?Sized, B: GlobalLockBackend> {
-    _backend: PhantomData<B>,
+pub struct GlobalLockedBy<T: ?Sized, G: GlobalLockBackend> {
+    _backend: PhantomData<G>,
     value: UnsafeCell<T>,
 }
 
 // SAFETY: The same thread-safety rules as `LockedBy` apply to `GlobalLockedBy`.
-unsafe impl<T, B> Send for GlobalLockedBy<T, B>
+unsafe impl<T, G> Send for GlobalLockedBy<T, G>
 where
     T: ?Sized,
-    B: GlobalLockBackend,
-    LockedBy<T, B::Item>: Send,
+    G: GlobalLockBackend,
+    LockedBy<T, G::Item>: Send,
 {
 }
 
 // SAFETY: The same thread-safety rules as `LockedBy` apply to `GlobalLockedBy`.
-unsafe impl<T, B> Sync for GlobalLockedBy<T, B>
+unsafe impl<T, G> Sync for GlobalLockedBy<T, G>
 where
     T: ?Sized,
-    B: GlobalLockBackend,
-    LockedBy<T, B::Item>: Sync,
+    G: GlobalLockBackend,
+    LockedBy<T, G::Item>: Sync,
 {
 }
 
-impl<T, B: GlobalLockBackend> GlobalLockedBy<T, B> {
+impl<T, G: GlobalLockBackend> GlobalLockedBy<T, G> {
     /// Create a new [`GlobalLockedBy`].
     ///
-    /// The provided value will be protected by the global lock indicated by `B`.
+    /// The provided value will be protected by the global lock indicated by `G`.
     pub fn new(val: T) -> Self {
         Self {
             value: UnsafeCell::new(val),
@@ -150,11 +150,11 @@ pub fn new(val: T) -> Self {
     }
 }
 
-impl<T: ?Sized, B: GlobalLockBackend> GlobalLockedBy<T, B> {
+impl<T: ?Sized, G: GlobalLockBackend> GlobalLockedBy<T, G> {
     /// Access the value immutably.
     ///
     /// The caller must prove shared access to the lock.
-    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<'_, B>) -> &'a T {
+    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<'_, G>) -> &'a T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &*self.value.get() }
     }
@@ -162,7 +162,7 @@ pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<'_, B>) -> &'a T {
     /// Access the value mutably.
     ///
     /// The caller must prove shared exclusive to the lock.
-    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<'_, B>) -> &'a mut T {
+    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<'_, G>) -> &'a mut T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &mut *self.value.get() }
     }
-- 
2.49.0

