Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE00221C18D
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384659; cv=none; b=pRzlN0dnk0EZc9PAns88MlP9QgJUKMSos+gLRj38W0Dzl/eUVyvE6Qk8QgIbNiEfgX3Fh0BfnCtfM78gI24tJqNXmfxzuTDwZKiEtltyAHNJnb0+gPTNCVwQ4HBZtYBDu3r3Xoi59T6/lfT1GhGhw3s+opSuKTWsCBeKBNmSRMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384659; c=relaxed/simple;
	bh=uktaqPLGYFThz2NOiuu7G0P60nubNqBxhcPq0eA6gdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SgovzN/uBdIpnih/Q1dpjqEZYkj5ODmDOe3MyUJBj20+q66QterDIMwl+6k//FybanYhhCz547izYvQ+g+a5EGB64cOW1BhteNZBLpEl56ZV/JZoVmTHFDfoO6THB4ki0R64kQRcdiAyAD1C4HTlBUdJLcHDWxyuK1hlkDo+Kho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vc/4/Bjs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vc/4/Bjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748384656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Dc1B1ViQhAuL8J3llMovxspzHOXW+tb2JzUw0/EYtE=;
	b=Vc/4/BjsufyeWp6DaT99huKvzFKf5DguyiEpAOKN2An+MiDAfxp+5jQtiTZ3BEX/t50VWp
	phGCAhKHf5dszS+CFmgdybyPM/FUaNpfW9c3Cji+4Yvc7t+hdJjs+wWKDkdZZdf6N2R3Qa
	IgX3kLi48OlqC8NN/RrV0aecD6T4JaY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592--mhULbN9PUeMkqVhsDRIOw-1; Tue,
 27 May 2025 18:24:13 -0400
X-MC-Unique: -mhULbN9PUeMkqVhsDRIOw-1
X-Mimecast-MFC-AGG-ID: -mhULbN9PUeMkqVhsDRIOw_1748384651
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 827CD19560A7;
	Tue, 27 May 2025 22:24:11 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.105])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4671B195608D;
	Tue, 27 May 2025 22:24:08 +0000 (UTC)
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
Subject: [RFC RESEND v10 12/14] rust: sync: lock/global: Add Backend parameter to GlobalGuard
Date: Tue, 27 May 2025 18:21:53 -0400
Message-ID: <20250527222254.565881-13-lyude@redhat.com>
In-Reply-To: <20250527222254.565881-1-lyude@redhat.com>
References: <20250527222254.565881-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Due to the introduction of sync::lock::Backend::Context, it's now possible
for normal locks to return a Guard with a different Backend than their
respective lock (e.g. Backend::BackendInContext). We want to be able to
support global locks with contexts as well, so add a trait bound to
explicitly specify which Backend is in use for a GlobalGuard.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock/global.rs | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 37209882e006b..1678655faae32 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -77,14 +77,14 @@ pub unsafe fn init(&'static self) {
     }
 
     /// Lock this global lock.
-    pub fn lock(&'static self) -> GlobalGuard<'static, G> {
+    pub fn lock(&'static self) -> GlobalGuard<'static, G, G::Backend> {
         GlobalGuard {
             inner: self.inner.lock(),
         }
     }
 
     /// Try to lock this global lock.
-    pub fn try_lock(&'static self) -> Option<GlobalGuard<'static, G>> {
+    pub fn try_lock(&'static self) -> Option<GlobalGuard<'static, G, G::Backend>> {
         Some(GlobalGuard {
             inner: self.inner.try_lock()?,
         })
@@ -94,11 +94,11 @@ pub fn try_lock(&'static self) -> Option<GlobalGuard<'static, G>> {
 /// A guard for a [`GlobalLock`].
 ///
 /// See [`global_lock!`] for examples.
-pub struct GlobalGuard<'a, G: GlobalLockBackend> {
-    inner: Guard<'a, G::Item, G::Backend>,
+pub struct GlobalGuard<'a, G: GlobalLockBackend, B: Backend> {
+    inner: Guard<'a, G::Item, B>,
 }
 
-impl<'a, G: GlobalLockBackend> core::ops::Deref for GlobalGuard<'a, G> {
+impl<'a, G: GlobalLockBackend, B: Backend> core::ops::Deref for GlobalGuard<'a, G, B> {
     type Target = G::Item;
 
     fn deref(&self) -> &Self::Target {
@@ -106,7 +106,7 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl<'a, G: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<'a, G> {
+impl<'a, G: GlobalLockBackend, B: Backend> core::ops::DerefMut for GlobalGuard<'a, G, B> {
     fn deref_mut(&mut self) -> &mut Self::Target {
         &mut self.inner
     }
@@ -154,7 +154,7 @@ impl<T: ?Sized, G: GlobalLockBackend> GlobalLockedBy<T, G> {
     /// Access the value immutably.
     ///
     /// The caller must prove shared access to the lock.
-    pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<'_, G>) -> &'a T {
+    pub fn as_ref<'a, B: Backend>(&'a self, _guard: &'a GlobalGuard<'_, G, B>) -> &'a T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &*self.value.get() }
     }
@@ -162,7 +162,7 @@ pub fn as_ref<'a>(&'a self, _guard: &'a GlobalGuard<'_, G>) -> &'a T {
     /// Access the value mutably.
     ///
     /// The caller must prove shared exclusive to the lock.
-    pub fn as_mut<'a>(&'a self, _guard: &'a mut GlobalGuard<'_, G>) -> &'a mut T {
+    pub fn as_mut<'a, B: Backend>(&'a self, _guard: &'a mut GlobalGuard<'_, G, B>) -> &'a mut T {
         // SAFETY: The lock is globally unique, so there can only be one guard.
         unsafe { &mut *self.value.get() }
     }
@@ -216,7 +216,7 @@ pub fn get_mut(&mut self) -> &mut T {
 /// ```
 /// # mod ex {
 /// # use kernel::prelude::*;
-/// use kernel::sync::{GlobalGuard, GlobalLockedBy};
+/// use kernel::sync::{Backend, GlobalGuard, GlobalLockedBy};
 ///
 /// kernel::sync::global_lock! {
 ///     // SAFETY: Initialized in module initializer before first use.
@@ -232,7 +232,7 @@ pub fn get_mut(&mut self) -> &mut T {
 ///     /// Increment the counter in this instance.
 ///     ///
 ///     /// The caller must hold the `MY_MUTEX` mutex.
-///     fn increment(&self, guard: &mut GlobalGuard<'_, MY_MUTEX>) -> u32 {
+///     fn increment<B: Backend>(&self, guard: &mut GlobalGuard<'_, MY_MUTEX, B>) -> u32 {
 ///         let my_counter = self.my_counter.as_mut(guard);
 ///         *my_counter += 1;
 ///         *my_counter
-- 
2.49.0

