Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C42219A9B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384638; cv=none; b=MRyYhkvOGaMX7rdt/fpfNPKn6PDq0QZ9LsbtP11la/xyfKD8DzcSbINdFqnOmhzR9sujphBLnryOgae/evwNqgQm41aYeKrJ3rZ5iy+DMCbpJAHNa+Nbb8rxi2e88pxWMlJhlWmoFnkgesycmzZJCPaMBskklM67Fhi95RYYO6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384638; c=relaxed/simple;
	bh=iyN9np/xVFIv3Eksb2k4W4/BeVrtDJGJ8iQYqgl/KGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMMi3wzHmTMYsoFm1tUrt6wSJvE0KztJCAGlFEkyiqDbNzxDLtTcJRZenHChIv0mziper6hmN3jWu3bvgnzZx1lUX8ZZGRaB5sLho7hxqUG8CClhDdDe/F3Ow7kRRFtHzdfLS6EmXTsGP09USlDRshQFg7p2lSCcWO8QnE9Zg6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q4w4KJ//; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q4w4KJ//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748384635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n4FONPi+3zPFCa0oB0I1LXHAYQTljuOdTTgCI7xxKTw=;
	b=Q4w4KJ//jDuJ/cZNHws0dOWUKRWQ9axJsxWqxi2a2av59IIHLltUDtOACYOgv1FoSp9A8i
	+Z5knBsNT/7HpTG0az7v9uw2QxtrBOkTG493mhT3Juyl+trlfQ5zvCTodSQQ1b84TfF/2U
	01di3EDClWWxOc99Nd8s5fPcVmNd5NA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-374-oV1tzUtWOTKKuWTJ4n4pDw-1; Tue,
 27 May 2025 18:23:50 -0400
X-MC-Unique: oV1tzUtWOTKKuWTJ4n4pDw-1
X-Mimecast-MFC-AGG-ID: oV1tzUtWOTKKuWTJ4n4pDw_1748384628
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 29D601800361;
	Tue, 27 May 2025 22:23:48 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.105])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BD2451956095;
	Tue, 27 May 2025 22:23:44 +0000 (UTC)
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
Subject: [RFC RESEND v10 07/14] rust: sync: Introduce lock::Backend::Context
Date: Tue, 27 May 2025 18:21:48 -0400
Message-ID: <20250527222254.565881-8-lyude@redhat.com>
In-Reply-To: <20250527222254.565881-1-lyude@redhat.com>
References: <20250527222254.565881-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Now that we've introduced an `InterruptDisabled` token for marking
contexts in which IRQs are disabled, we can have a way to avoid
`SpinLockIrq` disabling interrupts if the interrupts have already been
disabled. Basically, a `SpinLockIrq` should work like a `SpinLock` if
interrupts are disabled. So a function:

	(&'a SpinLockIrq, &'a InterruptDisabled) -> Guard<'a, .., SpinLockBackend>

makes senses. Note that due to `Guard` and `InterruptDisabled` having the
same lifetime, interrupts cannot be enabled while the Guard exists.

Add a `lock_with()` interface for `Lock`, and an associate type of
`Backend` to describe the context.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Co-Developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

---
V10:
- Fix typos - Dirk

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock.rs          | 12 +++++++++++-
 rust/kernel/sync/lock/mutex.rs    |  1 +
 rust/kernel/sync/lock/spinlock.rs |  3 +++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index e82fa5be289c1..f94ed1a825f6d 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -44,6 +44,9 @@ pub unsafe trait Backend {
     /// [`unlock`]: Backend::unlock
     type GuardState;
 
+    /// The context which can be provided to acquire the lock with a different backend.
+    type Context<'a>;
+
     /// Initialises the lock.
     ///
     /// # Safety
@@ -163,8 +166,15 @@ pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> &'a Self {
 }
 
 impl<T: ?Sized, B: Backend> Lock<T, B> {
+    /// Acquires the lock with the given context and gives the caller access to the data protected
+    /// by it.
+    pub fn lock_with<'a>(&'a self, _context: B::Context<'a>) -> Guard<'a, T, B> {
+        todo!()
+    }
+
     /// Acquires the lock and gives the caller access to the data protected by it.
-    pub fn lock(&self) -> Guard<'_, T, B> {
+    #[inline]
+    pub fn lock<'a>(&'a self) -> Guard<'a, T, B> {
         // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
         // that `init` was called.
         let state = unsafe { B::lock(self.state.get()) };
diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex.rs
index 581cee7ab842a..be1e2e18cf42d 100644
--- a/rust/kernel/sync/lock/mutex.rs
+++ b/rust/kernel/sync/lock/mutex.rs
@@ -101,6 +101,7 @@ macro_rules! new_mutex {
 unsafe impl super::Backend for MutexBackend {
     type State = bindings::mutex;
     type GuardState = ();
+    type Context<'a> = ();
 
     unsafe fn init(
         ptr: *mut Self::State,
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index a1d76184a5bb4..f3dac0931f6a2 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -3,6 +3,7 @@
 //! A kernel spinlock.
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
+use crate::interrupt::LocalInterruptDisabled;
 
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
@@ -100,6 +101,7 @@ macro_rules! new_spinlock {
 unsafe impl super::Backend for SpinLockBackend {
     type State = bindings::spinlock_t;
     type GuardState = ();
+    type Context<'a> = ();
 
     unsafe fn init(
         ptr: *mut Self::State,
@@ -242,6 +244,7 @@ macro_rules! new_spinlock_irq {
 unsafe impl super::Backend for SpinLockIrqBackend {
     type State = bindings::spinlock_t;
     type GuardState = ();
+    type Context<'a> = &'a LocalInterruptDisabled;
 
     unsafe fn init(
         ptr: *mut Self::State,
-- 
2.49.0

