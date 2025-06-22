Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE5ABA34;
	Sun, 22 Jun 2025 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750597142; cv=none; b=CWy/U6HOzp6Kjc+BXYemJUHSCOFeylXSqEHY5bQURX3LpyqsDfQmJBXffHurSSuLn52q9YdAV/+s0eZ2urlhN2h+2G1112KnegNUsdo+DrhTVSfPf8Y5mgNoBtbsu7IFBuvY6GYOkBiHvmSkkd30RbYRLWoJfZwgTor/ACOQaTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750597142; c=relaxed/simple;
	bh=psmatb5q2y4XNrP55GujTA94WAv8VwfGnVaR5bowiek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrzMkPAsAhRw1l8HOjoCBC6cSAsD1+aUR/wN5uBXdyc/hkxcjTFE2dhrt5RG8Jeq8pBjyCjLq7D6rYM6LjwKI8C6Ir/LmHvtFsgyOpIvrfqN9u+3o+npU0dJ1K3FtQffWk4WTQL6Oue1b6A2A7N4NvPXO4VRg31XDZVWbdf7rdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGKgFRsq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGKgFRsq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD21C4CEE3;
	Sun, 22 Jun 2025 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750597141;
	bh=psmatb5q2y4XNrP55GujTA94WAv8VwfGnVaR5bowiek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jGKgFRsq97zoKzeFZc0y0omJL5h+rRF2eofmE48FopeeJEN/cIopdFTaC/BayxU3X
	 LCCLXKLPSVVV473J6CNJKSQ21fK5vIf5hB02HkUg1+xy9c+g5uvJMO3EFRDSwX2euO
	 jl4YvO3dZOXxk0PqQ3OxABR8GQufust2IbPmPaF5/Q7lTxIueilpRyCG1WqheVwRMf
	 9NBHQw/RfdTNIgfCJzPNaV+pr7vmi8uKkEt/YrkNmRhVoA1hAAkCk+x4Ze7OT79c1X
	 DUFPD5IfWWPmnb2U3nf8vaHszLCe5HRUbQaU2F0XaL+Ob2pKa13UTruuLyIsEUjTlC
	 +oOB43aUofT0A==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	Alex Mantel <alexmantel93@mailbox.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] rust: convert `Arc` to use `Refcount`
Date: Sun, 22 Jun 2025 13:57:29 +0100
Message-ID: <20250622125802.3224264-4-gary@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250622125802.3224264-1-gary@kernel.org>
References: <20250622125802.3224264-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

With `Refcount` type created, `Arc` can use `Refcount` instead of
calling into FFI directly.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/sync/arc.rs      | 45 +++++++++++-------------------------
 rust/kernel/sync/refcount.rs |  8 +++++++
 2 files changed, 22 insertions(+), 31 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 09a471fea4da..fc63ded00f6e 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -8,7 +8,7 @@
 //! threads.
 //!
 //! It is different from the standard library's [`Arc`] in a few ways:
-//! 1. It is backed by the kernel's `refcount_t` type.
+//! 1. It is backed by the kernel's [`Refcount`] type.
 //! 2. It does not support weak references, which allows it to be half the size.
 //! 3. It saturates the reference count instead of aborting when it goes over a threshold.
 //! 4. It does not provide a `get_mut` method, so the ref counted object is pinned.
@@ -18,10 +18,10 @@
 
 use crate::{
     alloc::{AllocError, Flags, KBox},
-    bindings,
     init::InPlaceInit,
+    sync::Refcount,
     try_init,
-    types::{ForeignOwnable, Opaque},
+    types::ForeignOwnable,
 };
 use core::{
     alloc::Layout,
@@ -144,7 +144,7 @@ pub struct Arc<T: ?Sized> {
 #[pin_data]
 #[repr(C)]
 pub struct ArcInner<T: ?Sized> {
-    refcount: Opaque<bindings::refcount_t>,
+    refcount: Refcount,
     data: T,
 }
 
@@ -156,7 +156,7 @@ impl<T: ?Sized> ArcInner<T> {
     /// `ptr` must have been returned by a previous call to [`Arc::into_raw`], and the `Arc` must
     /// not yet have been destroyed.
     unsafe fn container_of(ptr: *const T) -> NonNull<ArcInner<T>> {
-        let refcount_layout = Layout::new::<bindings::refcount_t>();
+        let refcount_layout = Layout::new::<Refcount>();
         // SAFETY: The caller guarantees that the pointer is valid.
         let val_layout = Layout::for_value(unsafe { &*ptr });
         // SAFETY: We're computing the layout of a real struct that existed when compiling this
@@ -228,8 +228,7 @@ impl<T> Arc<T> {
     pub fn new(contents: T, flags: Flags) -> Result<Self, AllocError> {
         // INVARIANT: The refcount is initialised to a non-zero value.
         let value = ArcInner {
-            // SAFETY: There are no safety requirements for this FFI call.
-            refcount: Opaque::new(unsafe { bindings::REFCOUNT_INIT(1) }),
+            refcount: Refcount::new(1),
             data: contents,
         };
 
@@ -347,18 +346,13 @@ pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T>>> {
         // We will manually manage the refcount in this method, so we disable the destructor.
         let this = ManuallyDrop::new(this);
         // SAFETY: We own a refcount, so the pointer is still valid.
-        let refcount = unsafe { this.ptr.as_ref() }.refcount.get();
+        let refcount = unsafe { &this.ptr.as_ref().refcount };
 
         // If the refcount reaches a non-zero value, then we have destroyed this `Arc` and will
         // return without further touching the `Arc`. If the refcount reaches zero, then there are
         // no other arcs, and we can create a `UniqueArc`.
-        //
-        // SAFETY: We own a refcount, so the pointer is not dangling.
-        let is_zero = unsafe { bindings::refcount_dec_and_test(refcount) };
-        if is_zero {
-            // SAFETY: We have exclusive access to the arc, so we can perform unsynchronized
-            // accesses to the refcount.
-            unsafe { core::ptr::write(refcount, bindings::REFCOUNT_INIT(1)) };
+        if refcount.dec_and_test() {
+            refcount.set(1);
 
             // INVARIANT: We own the only refcount to this arc, so we may create a `UniqueArc`. We
             // must pin the `UniqueArc` because the values was previously in an `Arc`, and they pin
@@ -428,14 +422,10 @@ fn as_ref(&self) -> &T {
 
 impl<T: ?Sized> Clone for Arc<T> {
     fn clone(&self) -> Self {
-        // SAFETY: By the type invariant, there is necessarily a reference to the object, so it is
-        // safe to dereference it.
-        let refcount = unsafe { self.ptr.as_ref() }.refcount.get();
-
-        // INVARIANT: C `refcount_inc` saturates the refcount, so it cannot overflow to zero.
+        // INVARIANT: `Refcount` saturates the refcount, so it cannot overflow to zero.
         // SAFETY: By the type invariant, there is necessarily a reference to the object, so it is
         // safe to increment the refcount.
-        unsafe { bindings::refcount_inc(refcount) };
+        unsafe { self.ptr.as_ref().refcount.inc() };
 
         // SAFETY: We just incremented the refcount. This increment is now owned by the new `Arc`.
         unsafe { Self::from_inner(self.ptr) }
@@ -444,16 +434,10 @@ fn clone(&self) -> Self {
 
 impl<T: ?Sized> Drop for Arc<T> {
     fn drop(&mut self) {
-        // SAFETY: By the type invariant, there is necessarily a reference to the object. We cannot
-        // touch `refcount` after it's decremented to a non-zero value because another thread/CPU
-        // may concurrently decrement it to zero and free it. It is ok to have a raw pointer to
-        // freed/invalid memory as long as it is never dereferenced.
-        let refcount = unsafe { self.ptr.as_ref() }.refcount.get();
-
         // INVARIANT: If the refcount reaches zero, there are no other instances of `Arc`, and
         // this instance is being dropped, so the broken invariant is not observable.
-        // SAFETY: Also by the type invariant, we are allowed to decrement the refcount.
-        let is_zero = unsafe { bindings::refcount_dec_and_test(refcount) };
+        // SAFETY: By the type invariant, there is necessarily a reference to the object.
+        let is_zero = unsafe { self.ptr.as_ref().refcount.dec_and_test() };
         if is_zero {
             // The count reached zero, we must free the memory.
             //
@@ -747,8 +731,7 @@ pub fn new_uninit(flags: Flags) -> Result<UniqueArc<MaybeUninit<T>>, AllocError>
         // INVARIANT: The refcount is initialised to a non-zero value.
         let inner = KBox::try_init::<AllocError>(
             try_init!(ArcInner {
-                // SAFETY: There are no safety requirements for this FFI call.
-                refcount: Opaque::new(unsafe { bindings::REFCOUNT_INIT(1) }),
+                refcount: Refcount::new(1),
                 data <- pin_init::uninit::<T, AllocError>(),
             }? AllocError),
             flags,
diff --git a/rust/kernel/sync/refcount.rs b/rust/kernel/sync/refcount.rs
index a0fc22f6d645..8e7b9b0c1979 100644
--- a/rust/kernel/sync/refcount.rs
+++ b/rust/kernel/sync/refcount.rs
@@ -71,6 +71,14 @@ pub fn dec(&self) {
     /// must come after.
     ///
     /// Returns true if the resulting refcount is 0, false otherwise.
+    ///
+    /// # Notes
+    ///
+    /// A common pattern of using `Refcount` is to free memory when the reference count reaches
+    /// zero. This means that the reference to `Refcount` could become invalid after calling this
+    /// function. This is fine as long as the reference to `Refcount` is no longer used when this
+    /// function returns `false`. It is not necessary to use raw pointers in this scenario, see
+    /// https://github.com/rust-lang/rust/issues/55005.
     #[inline]
     #[must_use = "use `dec` instead if you do not need to test if it is 0"]
     pub fn dec_and_test(&self) -> bool {
-- 
2.49.0

