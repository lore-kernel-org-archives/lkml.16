Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFA7323D;
	Fri, 31 Jan 2025 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738330332; cv=none; b=IP6qVWJPa9oezOjQJnyDrwnTGsbh51gMaHHFnpN+gGHo50XBYjGAN95SHYsPbGBZaDWrVtuUcHRkXLJwv5fpoAC21TIS3DOoAiricPDBugrIMFXxvWzqfrkZVRpg961jHxw61upU843ly0wtr+ph+FV6H34Z+mdnJV9CCc5FwqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738330332; c=relaxed/simple;
	bh=05RiDeU4JoMDP04huK1ZEw1hzOOuf/PISxFtZNSCll0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HopVnA3Zc2Sme80uu4WqBWtKgfHU/Oc5p29Re2qVKGKl8+CKcAVh8ytImhkGls67dl/ZN9uNAJTJu/K0beKJ7fyWkALpPqgZ2KWSx7v9T3zvWNJT7nHovDHXqLq1nj6Rw+lVvUpKYNj7a6A+e3fyyYVJ1pd6T9jJjCxFwTIy8nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRgwVNsV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRgwVNsV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709FEC4CEE2;
	Fri, 31 Jan 2025 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738330331;
	bh=05RiDeU4JoMDP04huK1ZEw1hzOOuf/PISxFtZNSCll0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VRgwVNsV8CTpok2e2pUNzl3ggtvoQ0pcM36GF0X7Vi5AauBuAmYwXAUpOYphyKuL/
	 5QqkiaB4u9sfeFLjUTOaUE9cs2nAeeuQ9q8uriKorR/6PqDgg6OL0CrPQPQDYd2ToG
	 6dBzjIsskHRbsijaSG1hGosCnsSfxNKpNRRzwUf2mJms4Tq2GBVtbGT93feCKPPg9S
	 7rcqfA6Q5JCGhl3f2vvC+5L+5FmNQoPiuR3juQEpw0kJ+KfgjU2VUFPZvGB+u9ry2V
	 qZUxq/EMmMvJa7wNLrcP1JVrGo9uPWJ5bBTO0EWuLer1qSnCQ9N8ONW62kY7ptI1NI
	 Gjt5foATluGHA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 31 Jan 2025 14:30:08 +0100
Subject: [PATCH 1/4] rust: types: add `ForeignOwnable::PointedTo`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-configfs-v1-1-87947611401c@kernel.org>
References: <20250131-configfs-v1-0-87947611401c@kernel.org>
In-Reply-To: <20250131-configfs-v1-0-87947611401c@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
 Christoph Hellwig <hch@lst.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=15053;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=Kz3NBZWvsN1C0g/Tf6dy5jZOMimPLS7pGuT/q5cX0sE=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnnNCDQ3mwWab2keobq4zBuQGYjHuwalPBkWKBv
 OOHgi3xOoiJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ5zQgwAKCRDhuBo+eShj
 d85ED/925F/18yCu2AuXyR6LC0hHYENqaOu0NpPS8yfZwklBRhyjMvFAI/r9Q/9ompCJj2Cml4F
 PY91JpaBxeJ2Cu94+sa4FTZgQcPHOs1xEBOZ0JaM1nincXu1bzEJtKPPSgo4rW+GgVdny9szobf
 TxCoemCoKI1Y9kGULWLJDyDkHppXARziCZIe0YGHCV7aL4pKeNCbtOYvbsUMHDoQ89AC3k4Kn3b
 4qWIRD25rh5xnEPy4JqsFWvURAla0BWw46qbQcQWeE5LVY/9gY1tZTINuPs+TlOcylqvnjM4zZ+
 Ser0LpEhoPJAV1mAUu5PIOq3RNxTbtLrSlhyTFPhDx3o8FGKY2zuTOoiEPaegH7vZOkbU+xkIcK
 tQp6f3Hzq+P0TsjDlAZH7O99YkqaejxxXa//xRFSs20nitRk4I4FxllJn8I0Qs7zxa29NU4iByx
 aZ457j7GZYFT5N1fKUx9nf6O2YejDTRCSYk6CQHYvQpRKHOVzVtz8eagcIFAiPeUwyjFuKSCdWA
 8pYCK1d3YylDVamFNyrH6hAuC/83s0Xstr9x4m5ctQlz4eRdX6E9eEnsVwKo2CS8tTIt2ZBy12b
 gT95yBOr8yZ9XpNsMZiPa662KTC2gATX7mXv6l3SgvXjEithFwMR64+WoVbeesYnu6IriCWjbxu
 2+4kjBGQ2KuZDbQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

From: Tamir Duberstein <tamird@gmail.com>

Allow implementors to specify the foreign pointer type; this exposes
information about the pointed-to type such as its alignment.

This requires the trait to be `unsafe` since it is now possible for
implementors to break soundness by returning a misaligned pointer.

Encoding the pointer type in the trait (and avoiding pointer casts)
allows the compiler to check that implementors return the correct
pointer type. This is preferable to directly encoding the alignment in
the trait using a constant as the compiler would be unable to check it.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

---

This is a resend of the patch at the link below, adapted to apply on top of
`rust-6.14`.

Link: https://lore.kernel.org/r/20241217-rust-xarray-bindings-v14-1-9fef3cefcb41@gmail.com
---
 rust/kernel/alloc/kbox.rs | 38 ++++++++++++++++++++------------------
 rust/kernel/miscdevice.rs |  8 ++++----
 rust/kernel/sync/arc.rs   | 21 ++++++++++++---------
 rust/kernel/types.rs      | 46 +++++++++++++++++++++++++++++++---------------
 4 files changed, 67 insertions(+), 46 deletions(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index cb4ebea3b07422ca0f402512b7c66d66fd212042..55529832db54adc4715c1a067f1eb5ff3087c869 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -349,68 +349,70 @@ fn try_init<E>(init: impl Init<T, E>, flags: Flags) -> Result<Self, E>
     }
 }
 
-impl<T: 'static, A> ForeignOwnable for Box<T, A>
+// SAFETY: The `into_foreign` function returns a pointer that is well-aligned.
+unsafe impl<T: 'static, A> ForeignOwnable for Box<T, A>
 where
     A: Allocator,
 {
+    type PointedTo = T;
     type Borrowed<'a> = &'a T;
     type BorrowedMut<'a> = &'a mut T;
 
-    fn into_foreign(self) -> *mut crate::ffi::c_void {
-        Box::into_raw(self).cast()
+    fn into_foreign(self) -> *mut Self::PointedTo {
+        Box::into_raw(self)
     }
 
-    unsafe fn from_foreign(ptr: *mut crate::ffi::c_void) -> Self {
+    unsafe fn from_foreign(ptr: *mut Self::PointedTo) -> Self {
         // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
         // call to `Self::into_foreign`.
-        unsafe { Box::from_raw(ptr.cast()) }
+        unsafe { Box::from_raw(ptr) }
     }
 
-    unsafe fn borrow<'a>(ptr: *mut crate::ffi::c_void) -> &'a T {
+    unsafe fn borrow<'a>(ptr: *mut Self::PointedTo) -> &'a T {
         // SAFETY: The safety requirements of this method ensure that the object remains alive and
         // immutable for the duration of 'a.
-        unsafe { &*ptr.cast() }
+        unsafe { &*ptr }
     }
 
-    unsafe fn borrow_mut<'a>(ptr: *mut crate::ffi::c_void) -> &'a mut T {
-        let ptr = ptr.cast();
+    unsafe fn borrow_mut<'a>(ptr: *mut Self::PointedTo) -> &'a mut T {
         // SAFETY: The safety requirements of this method ensure that the pointer is valid and that
         // nothing else will access the value for the duration of 'a.
         unsafe { &mut *ptr }
     }
 }
 
-impl<T: 'static, A> ForeignOwnable for Pin<Box<T, A>>
+// SAFETY: The `into_foreign` function returns a pointer that is well-aligned.
+unsafe impl<T: 'static, A> ForeignOwnable for Pin<Box<T, A>>
 where
     A: Allocator,
 {
+    type PointedTo = T;
     type Borrowed<'a> = Pin<&'a T>;
     type BorrowedMut<'a> = Pin<&'a mut T>;
 
-    fn into_foreign(self) -> *mut crate::ffi::c_void {
+    fn into_foreign(self) -> *mut Self::PointedTo {
         // SAFETY: We are still treating the box as pinned.
-        Box::into_raw(unsafe { Pin::into_inner_unchecked(self) }).cast()
+        Box::into_raw(unsafe { Pin::into_inner_unchecked(self) })
     }
 
-    unsafe fn from_foreign(ptr: *mut crate::ffi::c_void) -> Self {
+    unsafe fn from_foreign(ptr: *mut Self::PointedTo) -> Self {
         // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
         // call to `Self::into_foreign`.
-        unsafe { Pin::new_unchecked(Box::from_raw(ptr.cast())) }
+        unsafe { Pin::new_unchecked(Box::from_raw(ptr)) }
     }
 
-    unsafe fn borrow<'a>(ptr: *mut crate::ffi::c_void) -> Pin<&'a T> {
+    unsafe fn borrow<'a>(ptr: *mut Self::PointedTo) -> Pin<&'a T> {
         // SAFETY: The safety requirements for this function ensure that the object is still alive,
         // so it is safe to dereference the raw pointer.
         // The safety requirements of `from_foreign` also ensure that the object remains alive for
         // the lifetime of the returned value.
-        let r = unsafe { &*ptr.cast() };
+        let r = unsafe { &*ptr };
 
         // SAFETY: This pointer originates from a `Pin<Box<T>>`.
         unsafe { Pin::new_unchecked(r) }
     }
 
-    unsafe fn borrow_mut<'a>(ptr: *mut crate::ffi::c_void) -> Pin<&'a mut T> {
-        let ptr = ptr.cast();
+    unsafe fn borrow_mut<'a>(ptr: *mut Self::PointedTo) -> Pin<&'a mut T> {
         // SAFETY: The safety requirements for this function ensure that the object is still alive,
         // so it is safe to dereference the raw pointer.
         // The safety requirements of `from_foreign` also ensure that the object remains alive for
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index b3a6cc50b240e9373a7d4e9959fabb42235a794f..fe0c059fabac11c0f316128bf63b5ff10ee3c3ca 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -189,7 +189,7 @@ impl<T: MiscDevice> VtableHelper<T> {
     };
 
     // SAFETY: The open call of a file owns the private data.
-    unsafe { (*file).private_data = ptr.into_foreign() };
+    unsafe { (*file).private_data = ptr.into_foreign().cast() };
 
     0
 }
@@ -205,7 +205,7 @@ impl<T: MiscDevice> VtableHelper<T> {
     // SAFETY: The release call of a file owns the private data.
     let private = unsafe { (*file).private_data };
     // SAFETY: The release call of a file owns the private data.
-    let ptr = unsafe { <T::Ptr as ForeignOwnable>::from_foreign(private) };
+    let ptr = unsafe { <T::Ptr as ForeignOwnable>::from_foreign(private.cast()) };
 
     T::release(ptr);
 
@@ -223,7 +223,7 @@ impl<T: MiscDevice> VtableHelper<T> {
     // SAFETY: The ioctl call of a file can access the private data.
     let private = unsafe { (*file).private_data };
     // SAFETY: Ioctl calls can borrow the private data of the file.
-    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private.cast()) };
 
     match T::ioctl(device, cmd, arg) {
         Ok(ret) => ret as c_long,
@@ -243,7 +243,7 @@ impl<T: MiscDevice> VtableHelper<T> {
     // SAFETY: The compat ioctl call of a file can access the private data.
     let private = unsafe { (*file).private_data };
     // SAFETY: Ioctl calls can borrow the private data of the file.
-    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private.cast()) };
 
     match T::compat_ioctl(device, cmd, arg) {
         Ok(ret) => ret as c_long,
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 3cefda7a43725581dc0eaa8441e2528c161162e1..dfe4abf82c25cf18398628d9cd5345a292419351 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -140,9 +140,10 @@ pub struct Arc<T: ?Sized> {
     _p: PhantomData<ArcInner<T>>,
 }
 
+#[doc(hidden)]
 #[pin_data]
 #[repr(C)]
-struct ArcInner<T: ?Sized> {
+pub struct ArcInner<T: ?Sized> {
     refcount: Opaque<bindings::refcount_t>,
     data: T,
 }
@@ -342,18 +343,20 @@ pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
     }
 }
 
-impl<T: 'static> ForeignOwnable for Arc<T> {
+// SAFETY: The `into_foreign` function returns a pointer that is well-aligned.
+unsafe impl<T: 'static> ForeignOwnable for Arc<T> {
+    type PointedTo = ArcInner<T>;
     type Borrowed<'a> = ArcBorrow<'a, T>;
     type BorrowedMut<'a> = Self::Borrowed<'a>;
 
-    fn into_foreign(self) -> *mut crate::ffi::c_void {
-        ManuallyDrop::new(self).ptr.as_ptr().cast()
+    fn into_foreign(self) -> *mut Self::PointedTo {
+        ManuallyDrop::new(self).ptr.as_ptr()
     }
 
-    unsafe fn from_foreign(ptr: *mut crate::ffi::c_void) -> Self {
+    unsafe fn from_foreign(ptr: *mut Self::PointedTo) -> Self {
         // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
         // call to `Self::into_foreign`.
-        let inner = unsafe { NonNull::new_unchecked(ptr.cast::<ArcInner<T>>()) };
+        let inner = unsafe { NonNull::new_unchecked(ptr) };
 
         // SAFETY: By the safety requirement of this function, we know that `ptr` came from
         // a previous call to `Arc::into_foreign`, which guarantees that `ptr` is valid and
@@ -361,17 +364,17 @@ unsafe fn from_foreign(ptr: *mut crate::ffi::c_void) -> Self {
         unsafe { Self::from_inner(inner) }
     }
 
-    unsafe fn borrow<'a>(ptr: *mut crate::ffi::c_void) -> ArcBorrow<'a, T> {
+    unsafe fn borrow<'a>(ptr: *mut Self::PointedTo) -> ArcBorrow<'a, T> {
         // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
         // call to `Self::into_foreign`.
-        let inner = unsafe { NonNull::new_unchecked(ptr.cast::<ArcInner<T>>()) };
+        let inner = unsafe { NonNull::new_unchecked(ptr) };
 
         // SAFETY: The safety requirements of `from_foreign` ensure that the object remains alive
         // for the lifetime of the returned value.
         unsafe { ArcBorrow::new(inner) }
     }
 
-    unsafe fn borrow_mut<'a>(ptr: *mut crate::ffi::c_void) -> ArcBorrow<'a, T> {
+    unsafe fn borrow_mut<'a>(ptr: *mut Self::PointedTo) -> ArcBorrow<'a, T> {
         // SAFETY: The safety requirements for `borrow_mut` are a superset of the safety
         // requirements for `borrow`.
         unsafe { Self::borrow(ptr) }
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 0dfaf45a755c7ce702027918e5fd3e97c407fda4..0cf93c293b884004a6ed64c2c09723efa7986270 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -18,7 +18,19 @@
 ///
 /// This trait is meant to be used in cases when Rust objects are stored in C objects and
 /// eventually "freed" back to Rust.
-pub trait ForeignOwnable: Sized {
+///
+/// # Safety
+///
+/// Implementers must ensure that [`into_foreign`] returns a pointer which meets the alignment
+/// requirements of [`PointedTo`].
+///
+/// [`into_foreign`]: Self::into_foreign
+/// [`PointedTo`]: Self::PointedTo
+pub unsafe trait ForeignOwnable: Sized {
+    /// Type used when the value is foreign-owned. In practical terms only defines the alignment of
+    /// the pointer.
+    type PointedTo;
+
     /// Type used to immutably borrow a value that is currently foreign-owned.
     type Borrowed<'a>;
 
@@ -27,16 +39,18 @@ pub trait ForeignOwnable: Sized {
 
     /// Converts a Rust-owned object to a foreign-owned one.
     ///
-    /// The foreign representation is a pointer to void. There are no guarantees for this pointer.
-    /// For example, it might be invalid, dangling or pointing to uninitialized memory. Using it in
-    /// any way except for [`from_foreign`], [`try_from_foreign`], [`borrow`], or [`borrow_mut`] can
-    /// result in undefined behavior.
+    /// # Guarantees
+    ///
+    /// The return value is guaranteed to be well-aligned, but there are no other guarantees for
+    /// this pointer. For example, it might be null, dangling, or point to uninitialized memory.
+    /// Using it in any way except for [`ForeignOwnable::from_foreign`], [`ForeignOwnable::borrow`],
+    /// [`ForeignOwnable::try_from_foreign`] can result in undefined behavior.
     ///
     /// [`from_foreign`]: Self::from_foreign
     /// [`try_from_foreign`]: Self::try_from_foreign
     /// [`borrow`]: Self::borrow
     /// [`borrow_mut`]: Self::borrow_mut
-    fn into_foreign(self) -> *mut crate::ffi::c_void;
+    fn into_foreign(self) -> *mut Self::PointedTo;
 
     /// Converts a foreign-owned object back to a Rust-owned one.
     ///
@@ -46,7 +60,7 @@ pub trait ForeignOwnable: Sized {
     /// must not be passed to `from_foreign` more than once.
     ///
     /// [`into_foreign`]: Self::into_foreign
-    unsafe fn from_foreign(ptr: *mut crate::ffi::c_void) -> Self;
+    unsafe fn from_foreign(ptr: *mut Self::PointedTo) -> Self;
 
     /// Tries to convert a foreign-owned object back to a Rust-owned one.
     ///
@@ -58,7 +72,7 @@ pub trait ForeignOwnable: Sized {
     /// `ptr` must either be null or satisfy the safety requirements for [`from_foreign`].
     ///
     /// [`from_foreign`]: Self::from_foreign
-    unsafe fn try_from_foreign(ptr: *mut crate::ffi::c_void) -> Option<Self> {
+    unsafe fn try_from_foreign(ptr: *mut Self::PointedTo) -> Option<Self> {
         if ptr.is_null() {
             None
         } else {
@@ -81,7 +95,7 @@ unsafe fn try_from_foreign(ptr: *mut crate::ffi::c_void) -> Option<Self> {
     ///
     /// [`into_foreign`]: Self::into_foreign
     /// [`from_foreign`]: Self::from_foreign
-    unsafe fn borrow<'a>(ptr: *mut crate::ffi::c_void) -> Self::Borrowed<'a>;
+    unsafe fn borrow<'a>(ptr: *mut Self::PointedTo) -> Self::Borrowed<'a>;
 
     /// Borrows a foreign-owned object mutably.
     ///
@@ -109,21 +123,23 @@ unsafe fn try_from_foreign(ptr: *mut crate::ffi::c_void) -> Option<Self> {
     /// [`from_foreign`]: Self::from_foreign
     /// [`borrow`]: Self::borrow
     /// [`Arc`]: crate::sync::Arc
-    unsafe fn borrow_mut<'a>(ptr: *mut crate::ffi::c_void) -> Self::BorrowedMut<'a>;
+    unsafe fn borrow_mut<'a>(ptr: *mut Self::PointedTo) -> Self::BorrowedMut<'a>;
 }
 
-impl ForeignOwnable for () {
+// SAFETY: The `into_foreign` function returns a pointer that is dangling, but well-aligned.
+unsafe impl ForeignOwnable for () {
+    type PointedTo = ();
     type Borrowed<'a> = ();
     type BorrowedMut<'a> = ();
 
-    fn into_foreign(self) -> *mut crate::ffi::c_void {
+    fn into_foreign(self) -> *mut Self::PointedTo {
         core::ptr::NonNull::dangling().as_ptr()
     }
 
-    unsafe fn from_foreign(_: *mut crate::ffi::c_void) -> Self {}
+    unsafe fn from_foreign(_: *mut Self::PointedTo) -> Self {}
 
-    unsafe fn borrow<'a>(_: *mut crate::ffi::c_void) -> Self::Borrowed<'a> {}
-    unsafe fn borrow_mut<'a>(_: *mut crate::ffi::c_void) -> Self::BorrowedMut<'a> {}
+    unsafe fn borrow<'a>(_: *mut Self::PointedTo) -> Self::Borrowed<'a> {}
+    unsafe fn borrow_mut<'a>(_: *mut Self::PointedTo) -> Self::BorrowedMut<'a> {}
 }
 
 /// Runs a cleanup function/closure when dropped.

-- 
2.47.0


