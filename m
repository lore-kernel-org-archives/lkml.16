Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D791421A928
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384645; cv=none; b=MVw69Pk4oqm0U+iQdAzp8kRznqUJb+4McMfOHPtMAqmCXBnAUID1HP9ZfcvTT8qSYstu84aK2Bbx5pBr9IwrtirdMDQsJCqa4DyCWFgKf3AGrTrI6EFZlclr5KAr5xNgW83hM3D63Z9m4Z7KWSrm5PB8czfmvZihM6j8tB6HGH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384645; c=relaxed/simple;
	bh=PVaj8/EVXA1CeA9kqbXdBYiDwZpHxa8saR3Rd70C81A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8Ds+TBE7g1hv0zmOT063UchbFmh0B3yauvfWE6i4tvoLgnBroZ2NCYgPnJZaVZdtOvMk+eFqNhxGr7Od1+6Q8O3maL4rZi08dXFi4uRFHQBehmvfj5J+N8ZF2NEEvuMSHLiYUjIfyu5fAvIYNFUVj8xB7SSpUCbMu+mt82U78c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=de9+jFYV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="de9+jFYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748384642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MjrbJaMYIn3bcpL9GAFqRs/9YheFIo7lqlBabeM9tMU=;
	b=de9+jFYVzyDOSQBWzkwtpPZfcjG4xl6uoRU8DDyOnXwEwzPs+BMJQ3sF09bNdT6Cp5vz0X
	kG54dltD8ZJxibsDgmwAw8QqZs2hxlAbymWNfcdVVD5SJmOqUBOFbO956O5RW0xKvW8jER
	RQyeiteD6YQEO6L/xyfYCBFP3YX2DCc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691-x69BTkSJMPiSeytzrnI4Aw-1; Tue,
 27 May 2025 18:23:59 -0400
X-MC-Unique: x69BTkSJMPiSeytzrnI4Aw-1
X-Mimecast-MFC-AGG-ID: x69BTkSJMPiSeytzrnI4Aw_1748384637
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4940B195608C;
	Tue, 27 May 2025 22:23:57 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.105])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0C88630001B0;
	Tue, 27 May 2025 22:23:53 +0000 (UTC)
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
Subject: [RFC RESEND v10 09/14] rust: sync: Add a lifetime parameter to lock::global::GlobalGuard
Date: Tue, 27 May 2025 18:21:50 -0400
Message-ID: <20250527222254.565881-10-lyude@redhat.com>
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

While a GlobalLock is always going to be static, in the case of locks with
explicit backend contexts the GlobalGuard will not be 'static and will
instead share the lifetime of the context. So, add a lifetime parameter to
GlobalGuard to allow for this so we can implement GlobalGuard support for
SpinlockIrq.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock/global.rs | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 47e200b750c1d..45400824b0940 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -37,7 +37,7 @@ pub struct GlobalLock<B: GlobalLockBackend> {
     inner: Lock<B::Item, B::Backend>,
 }
 
-impl<B: GlobalLockBackend> GlobalLock<B> {
+impl<'a, B: GlobalLockBackend> GlobalLock<B> {
     /// Creates a global lock.
     ///
     /// # Safety
@@ -77,14 +77,14 @@ pub unsafe fn init(&'static self) {
     }
 
     /// Lock this global lock.
-    pub fn lock(&'static self) -> GlobalGuard<B> {
+    pub fn lock(&'static self) -> GlobalGuard<'static, B> {
         GlobalGuard {
             inner: self.inner.lock(),
         }
     }
 
     /// Try to lock this global lock.
-    pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
+    pub fn try_lock(&'static self) -> Option<GlobalGuard<'static, B>> {
         Some(GlobalGuard {
             inner: self.inner.try_lock()?,
         })
@@ -94,11 +94,11 @@ pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
 /// A guard for a [`GlobalLock`].
 ///
 /// See [`global_lock!`] for examples.
-pub struct GlobalGuard<B: GlobalLockBackend> {
-    inner: Guard<'static, B::Item, B::Backend>,
+pub struct GlobalGuard<'a, B: GlobalLockBackend> {
+    inner: Guard<'a, B::Item, B::Backend>,
 }
 
-impl<B: GlobalLockBackend> core::ops::Deref for GlobalGuard<B> {
+impl<'a, B: GlobalLockBackend> core::ops::Deref for GlobalGuard<'a, B> {
     type Target = B::Item;
 
     fn deref(&self) -> &Self::Target {
@@ -106,7 +106,7 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl<B: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<B> {
+impl<'a, B: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<'a, B> {
     fn deref_mut(&mut self) -> &mut Self::Target {
         &mut self.inner
     }
@@ -154,7 +154,7 @@ impl<T: ?Sized, B: GlobalLockBackend> GlobalLockedBy<T, B> {
     /// Access the value immutably.
     ///
     /// The caller must prove shared access to the lock.
-    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<B>) -> &'a T {
+    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<'_, B>) -> &'a T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &*self.value.get() }
     }
@@ -162,7 +162,7 @@ pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<B>) -> &'a T {
     /// Access the value mutably.
     ///
     /// The caller must prove shared exclusive to the lock.
-    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<B>) -> &'a mut T {
+    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<'_, B>) -> &'a mut T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &mut *self.value.get() }
     }
@@ -232,7 +232,7 @@ pub fn get_mut(&mut self) -> &mut T {
 ///     /// Increment the counter in this instance.
 ///     ///
 ///     /// The caller must hold the `MY_MUTEX` mutex.
-///     fn increment(&self, guard: &mut GlobalGuard<MY_MUTEX>) -> u32 {
+///     fn increment(&self, guard: &mut GlobalGuard<'_, MY_MUTEX>) -> u32 {
 ///         let my_counter = self.my_counter.as_mut(guard);
 ///         *my_counter += 1;
 ///         *my_counter
-- 
2.49.0

