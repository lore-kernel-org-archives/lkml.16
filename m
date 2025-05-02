Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774D823C50F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176572; cv=none; b=ohi/B3oyr2Ns6oWwlSYtvueW/hi7qCszF/QbPTWKD3EXS+u2hr3gUI5RZzu/8fORavkHr8jpawpjZeQlnXVMFkvohjiXYRwXNpeJXQ2GllPQXYj6nmESyuFBxbOa+iYJnlFkvSqXN1Y2GEvn46zAa0zgoJZqPPHs5bqYJUjQAZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176572; c=relaxed/simple;
	bh=KK7Urj6cy1NjgNkW9fTkz6gHuuLB2DlovX8CVk5bq5Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iAKRtdms80UB7150rW7RQtCi5/IilgnCG2Wfg9znO6o1hU3aT5M4s/6J6fXeT8zn/7CyFLLKlyGhL3aCMoq9Xl98w9IOHHPzY53FNr658DZrcjH/VXYdy5d6sc2oVlTADzhg9r0SCkVTITC2Gjx0Auv8E0c6lrSn55cSIrSgEsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Emiy8qxt; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Emiy8qxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1746176562; x=1746435762;
	bh=2HGsionqViK0+ek7zHJadu8rQSHQgRW1JEGT6WiiphE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Emiy8qxtj1+iFfeJPVLEq1vUILeleXhAOD4S2SADk12tHNE4+uPuYT+IK5LnNysWL
	 x5/9CsPsk0IxjMUDdv6N8cATJZQTnLnieE5+QYMjyUkHVBBrBxdAx6s7ZUs33VUF/u
	 7YGRs9pHsw+ljVvcptgmhNVhJ9EeJvimOAPx1FzOoRqS2J/or2bM0jGVn5595gBJSu
	 wyxkpyPMt/2VI6g0Neg6OWLmm3bUg9rnrva6y3585qHv4LUHJZMQiCdVXW/vpI0cFV
	 /JMtDohIciT1j/hw3DmsNFzidpkILX2h23rZ4RVNZTDNJb0bUP47ki9EWQTZN9WiaQ
	 +6spxId2BwY1w==
Date: Fri, 02 May 2025 09:02:37 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Subject: [PATCH v10 2/5] rust: Rename AlwaysRefCounted to RefCounted
Message-ID: <20250502-unique-ref-v10-2-25de64c0307f@pm.me>
In-Reply-To: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 2fcf8bd602db40efae31109f0aca9298390f576e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

AlwaysRefCounted will become a marker trait to indicate that it is allowed
to obtain an ARef<T> from a `&T`, which cannot be allowed for types which
are also Ownable.

Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
Suggested-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/block/mq/request.rs | 10 +++++++---
 rust/kernel/cred.rs             |  8 ++++++--
 rust/kernel/device.rs           |  8 ++++++--
 rust/kernel/fs/file.rs          | 10 +++++++---
 rust/kernel/pci.rs              |  6 +++++-
 rust/kernel/pid_namespace.rs    |  8 ++++++--
 rust/kernel/platform.rs         |  6 +++++-
 rust/kernel/task.rs             |  6 +++++-
 rust/kernel/types.rs            | 41 ++++++++++++++++++++++++-------------=
----
 9 files changed, 71 insertions(+), 32 deletions(-)

diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request=
.rs
index 4a5b7ec914efa598c65881b07c4ece59214fd7e7..5ec5dbc052df964f10403d65f9b=
f3dd847a41cf4 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -8,7 +8,7 @@
     bindings,
     block::mq::Operations,
     error::Result,
-    types::{ARef, AlwaysRefCounted, Opaque},
+    types::{ARef, AlwaysRefCounted, Opaque, RefCounted},
 };
 use core::{
     marker::PhantomData,
@@ -227,10 +227,10 @@ fn atomic_relaxed_op_unless(target: &AtomicU64, op: i=
mpl Fn(u64) -> u64, pred: u
 }
=20
 // SAFETY: All instances of `Request<T>` are reference counted. This
-// implementation of `AlwaysRefCounted` ensure that increments to the ref =
count
+// implementation of `RefCounted` ensure that increments to the ref count
 // keeps the object alive in memory at least until a matching reference co=
unt
 // decrement is executed.
-unsafe impl<T: Operations> AlwaysRefCounted for Request<T> {
+unsafe impl<T: Operations> RefCounted for Request<T> {
     fn inc_ref(&self) {
         let refcount =3D &self.wrapper_ref().refcount();
=20
@@ -260,3 +260,7 @@ unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
         }
     }
 }
+
+// SAFETY: We currently do not implement `Ownable`, thus it is okay to can=
 obtain an `ARef<Request>`
+// from a `&Request` (but this will change in the future).
+unsafe impl<T: Operations> AlwaysRefCounted for Request<T> {}
diff --git a/rust/kernel/cred.rs b/rust/kernel/cred.rs
index 2599f01e8b285f2106aefd27c315ae2aff25293c..87fa2808050dd8a2838a0f5c21c=
d7f567ba6b534 100644
--- a/rust/kernel/cred.rs
+++ b/rust/kernel/cred.rs
@@ -11,7 +11,7 @@
 use crate::{
     bindings,
     task::Kuid,
-    types::{AlwaysRefCounted, Opaque},
+    types::{AlwaysRefCounted, Opaque, RefCounted},
 };
=20
 /// Wraps the kernel's `struct cred`.
@@ -74,7 +74,7 @@ pub fn euid(&self) -> Kuid {
 }
=20
 // SAFETY: The type invariants guarantee that `Credential` is always ref-c=
ounted.
-unsafe impl AlwaysRefCounted for Credential {
+unsafe impl RefCounted for Credential {
     #[inline]
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refc=
ount is nonzero.
@@ -88,3 +88,7 @@ unsafe fn dec_ref(obj: core::ptr::NonNull<Credential>) {
         unsafe { bindings::put_cred(obj.cast().as_ptr()) };
     }
 }
+
+// SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an=
 `ARef<Credential>` from a
+// `&Credential`.
+unsafe impl AlwaysRefCounted for Credential {}
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 21b343a1dc4d2b4ba75c3886ba954be53ada88c2..0b77faa4cc972aeff5809939a5d=
bc430a396018b 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -7,7 +7,7 @@
 use crate::{
     bindings,
     str::CStr,
-    types::{ARef, Opaque},
+    types::{ARef, AlwaysRefCounted, Opaque, RefCounted},
 };
 use core::{fmt, ptr};
=20
@@ -190,7 +190,7 @@ pub fn property_present(&self, name: &CStr) -> bool {
 }
=20
 // SAFETY: Instances of `Device` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for Device {
+unsafe impl RefCounted for Device {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the=
 refcount is non-zero.
         unsafe { bindings::get_device(self.as_raw()) };
@@ -202,6 +202,10 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
     }
 }
=20
+// SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an=
 `Device<Task>` from a
+// `&Device`.
+unsafe impl AlwaysRefCounted for Device {}
+
 // SAFETY: As by the type invariant `Device` can be sent to any thread.
 unsafe impl Send for Device {}
=20
diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 13a0e44cd1aa812eb404d452c076f90a37275b5b..76032e6abb3f0f0ab1f6536ecff=
06e2c24255d00 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -11,7 +11,7 @@
     bindings,
     cred::Credential,
     error::{code::*, Error, Result},
-    types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque},
+    types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque, RefCounted},
 };
 use core::ptr;
=20
@@ -190,7 +190,7 @@ unsafe impl Sync for File {}
=20
 // SAFETY: The type invariants guarantee that `File` is always ref-counted=
. This implementation
 // makes `ARef<File>` own a normal refcount.
-unsafe impl AlwaysRefCounted for File {
+unsafe impl RefCounted for File {
     #[inline]
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refc=
ount is nonzero.
@@ -205,6 +205,10 @@ unsafe fn dec_ref(obj: ptr::NonNull<File>) {
     }
 }
=20
+// SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an=
 `ARef<File>` from a
+/// `&File`.
+unsafe impl AlwaysRefCounted for File {}
+
 /// Wraps the kernel's `struct file`. Not thread safe.
 ///
 /// This type represents a file that is not known to be safe to transfer a=
cross thread boundaries.
@@ -225,7 +229,7 @@ pub struct LocalFile {
=20
 // SAFETY: The type invariants guarantee that `LocalFile` is always ref-co=
unted. This implementation
 // makes `ARef<File>` own a normal refcount.
-unsafe impl AlwaysRefCounted for LocalFile {
+unsafe impl RefCounted for LocalFile {
     #[inline]
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refc=
ount is nonzero.
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index c97d6d470b282219de255450d0c1980aefcf12c0..4c1fc28a1b5526376377098139e=
a8c405b83ee25 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -443,7 +443,7 @@ fn from(dev: &Device<device::Core>) -> Self {
 }
=20
 // SAFETY: Instances of `Device` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for Device {
+unsafe impl crate::types::RefCounted for Device {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the=
 refcount is non-zero.
         unsafe { bindings::pci_dev_get(self.as_raw()) };
@@ -455,6 +455,10 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
=20
+// SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an=
 `ARef<Device>` from a
+// `&Device`.
+unsafe impl crate::types::AlwaysRefCounted for Device {}
+
 impl AsRef<device::Device> for Device {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a p=
ointer to a valid
diff --git a/rust/kernel/pid_namespace.rs b/rust/kernel/pid_namespace.rs
index 0e93808e4639b37dd77add5d79f64058dac7cb87..3d8391113c1be150c5eb2ce3547=
37bb1e4d63a80 100644
--- a/rust/kernel/pid_namespace.rs
+++ b/rust/kernel/pid_namespace.rs
@@ -9,7 +9,7 @@
=20
 use crate::{
     bindings,
-    types::{AlwaysRefCounted, Opaque},
+    types::{AlwaysRefCounted, Opaque, RefCounted},
 };
 use core::ptr;
=20
@@ -44,7 +44,7 @@ pub unsafe fn from_ptr<'a>(ptr: *const bindings::pid_name=
space) -> &'a Self {
 }
=20
 // SAFETY: Instances of `PidNamespace` are always reference-counted.
-unsafe impl AlwaysRefCounted for PidNamespace {
+unsafe impl RefCounted for PidNamespace {
     #[inline]
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refc=
ount is nonzero.
@@ -58,6 +58,10 @@ unsafe fn dec_ref(obj: ptr::NonNull<PidNamespace>) {
     }
 }
=20
+// SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an=
 `ARef<PidNamespace>`
+// from a `&PidNamespace`.
+unsafe impl AlwaysRefCounted for PidNamespace {}
+
 // SAFETY:
 // - `PidNamespace::dec_ref` can be called from any thread.
 // - It is okay to send ownership of `PidNamespace` across thread boundari=
es.
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 4917cb34e2fe8027d3d861e90de51de85f006735..49add3ae88a6841f02a1e8a8f00=
43672f15cb088 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -211,7 +211,7 @@ fn from(dev: &Device<device::Core>) -> Self {
 }
=20
 // SAFETY: Instances of `Device` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for Device {
+unsafe impl crate::types::RefCounted for Device {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the=
 refcount is non-zero.
         unsafe { bindings::get_device(self.as_ref().as_raw()) };
@@ -223,6 +223,10 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
=20
+// SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an=
 `ARef<Device>` from a
+// `&Device`.
+unsafe impl crate::types::AlwaysRefCounted for Device {}
+
 impl AsRef<device::Device> for Device {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a p=
ointer to a valid
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 9e6f6854948d9ef9bb203a3548c9b082df8280e2..58086491ac85a219f795ecb473e=
9f6dd21bda773 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -329,7 +329,7 @@ pub fn wake_up(&self) {
 }
=20
 // SAFETY: The type invariants guarantee that `Task` is always refcounted.
-unsafe impl crate::types::AlwaysRefCounted for Task {
+unsafe impl crate::types::RefCounted for Task {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refc=
ount is nonzero.
         unsafe { bindings::get_task_struct(self.as_ptr()) };
@@ -341,6 +341,10 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
     }
 }
=20
+// SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an=
 `ARef<Task>` from a
+// `&Task`.
+unsafe impl crate::types::AlwaysRefCounted for Task {}
+
 impl Kuid {
     /// Get the current euid.
     #[inline]
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 5d8a99dcba4bf733107635bf3f0c15840ec33e4c..d7fa8934c545f46a646ca900ab8=
957a04b0ad34d 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -394,11 +394,9 @@ pub const fn raw_get(this: *const Self) -> *mut T {
     }
 }
=20
-/// Types that are _always_ reference counted.
+/// Types that are internally reference counted.
 ///
 /// It allows such types to define their own custom ref increment and decr=
ement functions.
-/// Additionally, it allows users to convert from a shared reference `&T` =
to an owned reference
-/// [`ARef<T>`].
 ///
 /// This is usually implemented by wrappers to existing structures on the =
C side of the code. For
 /// Rust code, the recommendation is to use [`Arc`](crate::sync::Arc) to c=
reate reference-counted
@@ -410,9 +408,8 @@ pub const fn raw_get(this: *const Self) -> *mut T {
 /// at least until matching decrements are performed.
 ///
 /// Implementers must also ensure that all instances are reference-counted=
. (Otherwise they
-/// won't be able to honour the requirement that [`AlwaysRefCounted::inc_r=
ef`] keep the object
-/// alive.)
-pub unsafe trait AlwaysRefCounted {
+/// won't be able to honour the requirement that [`RefCounted::inc_ref`] k=
eep the object alive.)
+pub unsafe trait RefCounted {
     /// Increments the reference count on the object.
     fn inc_ref(&self);
=20
@@ -425,11 +422,21 @@ pub unsafe trait AlwaysRefCounted {
     /// Callers must ensure that there was a previous matching increment t=
o the reference count,
     /// and that the object is no longer used after its reference count is=
 decremented (as it may
     /// result in the object being freed), unless the caller owns another =
increment on the refcount
-    /// (e.g., it calls [`AlwaysRefCounted::inc_ref`] twice, then calls
-    /// [`AlwaysRefCounted::dec_ref`] once).
+    /// (e.g., it calls [`RefCounted::inc_ref`] twice, then calls [`RefCou=
nted::dec_ref`] once).
     unsafe fn dec_ref(obj: NonNull<Self>);
 }
=20
+/// An extension to RefCounted, which declares that it is allowed to conve=
rt
+/// from a shared reference `&T` to an owned reference [`ARef<T>`].
+///
+/// # Safety
+///
+/// Implementers must ensure that no safety invariants are violated by upg=
rading an `&T`
+/// to an [`ARef<T>`]. In particular that implies [`AlwaysRefCounted`] and=
 [`Ownable`]
+/// cannot be implemented for the same type, as this would allow to violat=
e the uniqueness
+/// guarantee of [`Owned<T>`] by derefencing it into an `&T` and obtaining=
 an [`ARef`] from that.
+pub unsafe trait AlwaysRefCounted: RefCounted {}
+
 /// An owned reference to an always-reference-counted object.
 ///
 /// The object's reference count is automatically decremented when an inst=
ance of [`ARef`] is
@@ -440,7 +447,7 @@ pub unsafe trait AlwaysRefCounted {
 ///
 /// The pointer stored in `ptr` is non-null and valid for the lifetime of =
the [`ARef`] instance. In
 /// particular, the [`ARef`] instance owns an increment on the underlying =
object's reference count.
-pub struct ARef<T: AlwaysRefCounted> {
+pub struct ARef<T: RefCounted> {
     ptr: NonNull<T>,
     _p: PhantomData<T>,
 }
@@ -449,16 +456,16 @@ pub struct ARef<T: AlwaysRefCounted> {
 // it effectively means sharing `&T` (which is safe because `T` is `Sync`)=
; additionally, it needs
 // `T` to be `Send` because any thread that has an `ARef<T>` may ultimatel=
y access `T` using a
 // mutable reference, for example, when the reference count reaches zero a=
nd `T` is dropped.
-unsafe impl<T: AlwaysRefCounted + Sync + Send> Send for ARef<T> {}
+unsafe impl<T: RefCounted + Sync + Send> Send for ARef<T> {}
=20
 // SAFETY: It is safe to send `&ARef<T>` to another thread when the underl=
ying `T` is `Sync`
 // because it effectively means sharing `&T` (which is safe because `T` is=
 `Sync`); additionally,
 // it needs `T` to be `Send` because any thread that has a `&ARef<T>` may =
clone it and get an
 // `ARef<T>` on that thread, so the thread may ultimately access `T` using=
 a mutable reference, for
 // example, when the reference count reaches zero and `T` is dropped.
-unsafe impl<T: AlwaysRefCounted + Sync + Send> Sync for ARef<T> {}
+unsafe impl<T: RefCounted + Sync + Send> Sync for ARef<T> {}
=20
-impl<T: AlwaysRefCounted> ARef<T> {
+impl<T: RefCounted> ARef<T> {
     /// Creates a new instance of [`ARef`].
     ///
     /// It takes over an increment of the reference count on the underlyin=
g object.
@@ -487,12 +494,12 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// ```
     /// use core::ptr::NonNull;
-    /// use kernel::types::{ARef, AlwaysRefCounted};
+    /// use kernel::types::{ARef, RefCounted};
     ///
     /// struct Empty {}
     ///
     /// # // SAFETY: TODO.
-    /// unsafe impl AlwaysRefCounted for Empty {
+    /// unsafe impl RefCounted for Empty {
     ///     fn inc_ref(&self) {}
     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
     /// }
@@ -510,7 +517,7 @@ pub fn into_raw(me: Self) -> NonNull<T> {
     }
 }
=20
-impl<T: AlwaysRefCounted> Clone for ARef<T> {
+impl<T: RefCounted> Clone for ARef<T> {
     fn clone(&self) -> Self {
         self.inc_ref();
         // SAFETY: We just incremented the refcount above.
@@ -518,7 +525,7 @@ fn clone(&self) -> Self {
     }
 }
=20
-impl<T: AlwaysRefCounted> Deref for ARef<T> {
+impl<T: RefCounted> Deref for ARef<T> {
     type Target =3D T;
=20
     fn deref(&self) -> &Self::Target {
@@ -535,7 +542,7 @@ fn from(b: &T) -> Self {
     }
 }
=20
-impl<T: AlwaysRefCounted> Drop for ARef<T> {
+impl<T: RefCounted> Drop for ARef<T> {
     fn drop(&mut self) {
         // SAFETY: The type invariants guarantee that the `ARef` owns the =
reference we're about to
         // decrement.

--=20
2.49.0


