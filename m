Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6BB2E9EB2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249688; cv=none; b=Z6Ku+InxVtNrGjsKmhSpOQhRV5B1CuAY5qoBXNDkggzTrF3AgX/9QMExsuFf2Ud5Nkw8ETZIn5+sRnyzgAPXpHECCTnrOeVJU/Yrvb0eK5kF1poA63rWUB10H2JtlmaGp2aaKklhk3ETFa9kAomvu4JL/NCXXhBk5+sFe+fSNMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249688; c=relaxed/simple;
	bh=2sjwDLSUu7h2N+nQlYr1aK7WiYYZjJPKidJAeD19mbY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L9horFDbinrnttgF5qWLlnfxeAOf1skFdqE9mN9cU54h8oGE/g31YI5BI8XM6BRLnOns5GF7/kOiqxEQRcYF6H2QPKF//CEbmtbNeVYwV6o05JFj9mFY1QurrTtbIZbvpxjaF9lPV6w2b9BJcyn/XWKObPTN8z6FMq8EzWSntBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=lAhtYeMZ; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="lAhtYeMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1750249676; x=1750508876;
	bh=q8SXXCIyESUsGQ1fZD0Fag44Ey9ZIXSqgkr3XBssptE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=lAhtYeMZcGXAx2TTUsxJ+b8aPzbj6MEyYLq6/qAvLfMb1XyyZrmJREmlui/TvKKi8
	 G2zTTv/SZryabbARtavx13gPWuZS19XqL9tIRqz4hZu39gWa4xIFFbAsaCHOToMEVP
	 YYdk+oy03pxHFhWXKrhxTYgu7o9UmjW4dXSDEsxgsHB9toZRLttg5ZwVVhd6JpXP56
	 7APWwRFRhRtmaq+GYNmj3E2Ae6/0Ghw3/ecG+ehiJGSu2C0w2CgAToPOuxR9vu7h5R
	 x7pgUfPeSaOD+hQZ6/ROQ6fjOBNbx+Hdn1HyxdbFov3BrVKSNqbIpadfZZQAvrNeIL
	 do0IXXedQnmXg==
Date: Wed, 18 Jun 2025 12:27:49 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Subject: [PATCH v11 2/4] rust: Split `AlwaysRefCounted` into two traits
Message-ID: <20250618-unique-ref-v11-2-49eadcdc0aa6@pm.me>
In-Reply-To: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 7866f2c0ed84be6cdd92bf381455f88025b7e7be
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

`AlwaysRefCounted` is renamed to `RefCounted`.

`AlwaysRefCounted` will become a marker trait to indicate that it is
allowed to obtain an `ARef<T>` from a `&T`, which cannot be allowed for
types which are also Ownable.

Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
Suggested-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/block/mq/request.rs | 15 +++++++++------
 rust/kernel/cred.rs             |  8 ++++++--
 rust/kernel/device.rs           |  8 ++++++--
 rust/kernel/fs/file.rs          | 10 +++++++---
 rust/kernel/mm.rs               | 13 ++++++++++---
 rust/kernel/mm/mmput_async.rs   |  9 +++++++--
 rust/kernel/opp.rs              |  8 ++++++--
 rust/kernel/pci.rs              |  6 +++++-
 rust/kernel/pid_namespace.rs    |  8 ++++++--
 rust/kernel/platform.rs         |  6 +++++-
 rust/kernel/task.rs             |  6 +++++-
 rust/kernel/types.rs            | 41 ++++++++++++++++++++++++-------------=
----
 rust/kernel/types/ownable.rs    |  4 ++--
 13 files changed, 98 insertions(+), 44 deletions(-)

diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request=
.rs
index 4a5b7ec914efa598c65881b07c4ece59214fd7e7..ca02d07f13ade252bc3b4d2ca3e=
5e21a16a7288e 100644
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
@@ -226,11 +226,10 @@ fn atomic_relaxed_op_unless(target: &AtomicU64, op: i=
mpl Fn(u64) -> u64, pred: u
         .is_ok()
 }
=20
-// SAFETY: All instances of `Request<T>` are reference counted. This
-// implementation of `AlwaysRefCounted` ensure that increments to the ref =
count
-// keeps the object alive in memory at least until a matching reference co=
unt
-// decrement is executed.
-unsafe impl<T: Operations> AlwaysRefCounted for Request<T> {
+// SAFETY: All instances of `Request<T>` are reference counted. This imple=
mentation of `RefCounted`
+// ensure that increments to the ref count keeps the object alive in memor=
y at least until a
+// matching reference count decrement is executed.
+unsafe impl<T: Operations> RefCounted for Request<T> {
     fn inc_ref(&self) {
         let refcount =3D &self.wrapper_ref().refcount();
=20
@@ -260,3 +259,7 @@ unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
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
index dea06b79ecb536cee4d2b90c21b74658658417c7..afddb4d70d2f375c891facac7f8=
3501cd9918f54 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -7,7 +7,7 @@
 use crate::{
     bindings,
     str::CStr,
-    types::{ARef, Opaque},
+    types::{ARef, AlwaysRefCounted, Opaque, RefCounted},
 };
 use core::{fmt, marker::PhantomData, ptr};
=20
@@ -216,7 +216,7 @@ pub fn property_present(&self, name: &CStr) -> bool {
 kernel::impl_device_context_into_aref!(Device);
=20
 // SAFETY: Instances of `Device` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for Device {
+unsafe impl RefCounted for Device {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the=
 refcount is non-zero.
         unsafe { bindings::get_device(self.as_raw()) };
@@ -228,6 +228,10 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
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
index 72d84fb0e2664643619ad7fbcbbb55b3adc9f9b4..489f6d1f17508af7e064e3f5063=
49797fff497ae 100644
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
+// `&File`.
+unsafe impl AlwaysRefCounted for File {}
+
 /// Wraps the kernel's `struct file`. Not thread safe.
 ///
 /// This type represents a file that is not known to be safe to transfer a=
cross thread boundaries.
@@ -226,7 +230,7 @@ pub struct LocalFile {
=20
 // SAFETY: The type invariants guarantee that `LocalFile` is always ref-co=
unted. This implementation
 // makes `ARef<LocalFile>` own a normal refcount.
-unsafe impl AlwaysRefCounted for LocalFile {
+unsafe impl RefCounted for LocalFile {
     #[inline]
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refc=
ount is nonzero.
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 43f525c0d16ce87340ba4f991c45d4e82a050eae..9bbb317896eaa06f0e654873993=
ae9ff531d4c61 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -13,7 +13,7 @@
=20
 use crate::{
     bindings,
-    types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque},
+    types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque, RefCounted},
 };
 use core::{ops::Deref, ptr::NonNull};
=20
@@ -54,7 +54,7 @@ unsafe impl Send for Mm {}
 unsafe impl Sync for Mm {}
=20
 // SAFETY: By the type invariants, this type is always refcounted.
-unsafe impl AlwaysRefCounted for Mm {
+unsafe impl RefCounted for Mm {
     #[inline]
     fn inc_ref(&self) {
         // SAFETY: The pointer is valid since self is a reference.
@@ -68,6 +68,9 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
=20
+// SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an=
 `ARef<Mm>` from a `&Mm`.
+unsafe impl AlwaysRefCounted for Mm {}
+
 /// A wrapper for the kernel's `struct mm_struct`.
 ///
 /// This type is like [`Mm`], but with non-zero `mm_users`. It can only be=
 used when `mm_users` can
@@ -90,7 +93,7 @@ unsafe impl Send for MmWithUser {}
 unsafe impl Sync for MmWithUser {}
=20
 // SAFETY: By the type invariants, this type is always refcounted.
-unsafe impl AlwaysRefCounted for MmWithUser {
+unsafe impl RefCounted for MmWithUser {
     #[inline]
     fn inc_ref(&self) {
         // SAFETY: The pointer is valid since self is a reference.
@@ -104,6 +107,10 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
=20
+// SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an=
 `ARef<MmWithUser>` from a
+// `&MmWithUser`.
+unsafe impl AlwaysRefCounted for MmWithUser {}
+
 // Make all `Mm` methods available on `MmWithUser`.
 impl Deref for MmWithUser {
     type Target =3D Mm;
diff --git a/rust/kernel/mm/mmput_async.rs b/rust/kernel/mm/mmput_async.rs
index 9289e05f7a676b577e4edf45949c0fab6aacec14..1b8c5cc32123ed406079aa1505e=
623ea6af81011 100644
--- a/rust/kernel/mm/mmput_async.rs
+++ b/rust/kernel/mm/mmput_async.rs
@@ -10,7 +10,7 @@
 use crate::{
     bindings,
     mm::MmWithUser,
-    types::{ARef, AlwaysRefCounted},
+    types::{ARef, AlwaysRefCounted, RefCounted},
 };
 use core::{ops::Deref, ptr::NonNull};
=20
@@ -34,7 +34,7 @@ unsafe impl Send for MmWithUserAsync {}
 unsafe impl Sync for MmWithUserAsync {}
=20
 // SAFETY: By the type invariants, this type is always refcounted.
-unsafe impl AlwaysRefCounted for MmWithUserAsync {
+unsafe impl RefCounted for MmWithUserAsync {
     #[inline]
     fn inc_ref(&self) {
         // SAFETY: The pointer is valid since self is a reference.
@@ -48,6 +48,11 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
=20
+
+// SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an=
 `ARef<MmWithUserAsync>`
+// from a `&MmWithUserAsync`.
+unsafe impl AlwaysRefCounted for MmWithUserAsync {}
+
 // Make all `MmWithUser` methods available on `MmWithUserAsync`.
 impl Deref for MmWithUserAsync {
     type Target =3D MmWithUser;
diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index a566fc3e7dcb87237c68eb7d174efa5658712ddb..b8a3dace7a616cd8944e3f64729=
3cc4ca79235bd 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -16,7 +16,7 @@
     ffi::c_ulong,
     prelude::*,
     str::CString,
-    types::{ARef, AlwaysRefCounted, Opaque},
+    types::{ARef, AlwaysRefCounted, Opaque, RefCounted},
 };
=20
 #[cfg(CONFIG_CPU_FREQ)]
@@ -1042,7 +1042,7 @@ unsafe impl Send for OPP {}
 unsafe impl Sync for OPP {}
=20
 /// SAFETY: The type invariants guarantee that [`OPP`] is always refcounte=
d.
-unsafe impl AlwaysRefCounted for OPP {
+unsafe impl RefCounted for OPP {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refc=
ount is nonzero.
         unsafe { bindings::dev_pm_opp_get(self.0.get()) };
@@ -1054,6 +1054,10 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
     }
 }
=20
+// SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an=
 `ARef<OPP>` from an
+// `&OPP`.
+unsafe impl AlwaysRefCounted for OPP {}
+
 impl OPP {
     /// Creates an owned reference to a [`OPP`] from a valid pointer.
     ///
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 8435f8132e38129ccc3495e7c4d3237fcaa97ad9..e56f48bfe1e60096208bc499630=
46fbdd070afee 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -435,7 +435,7 @@ pub fn set_master(&self) {
 kernel::impl_device_context_into_aref!(Device);
=20
 // SAFETY: Instances of `Device` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for Device {
+unsafe impl crate::types::RefCounted for Device {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the=
 refcount is non-zero.
         unsafe { bindings::pci_dev_get(self.as_raw()) };
@@ -447,6 +447,10 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
=20
+// SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an=
 `ARef<Device>` from a
+// `&Device`.
+unsafe impl crate::types::AlwaysRefCounted for Device {}
+
 impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx=
> {
     fn as_ref(&self) -> &device::Device<Ctx> {
         // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a p=
ointer to a valid
diff --git a/rust/kernel/pid_namespace.rs b/rust/kernel/pid_namespace.rs
index 0e93808e4639b37dd77add5d79f64058dac7cb87..b5e319fa050002179fa920dd40f=
02a08f8473b22 100644
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
 `ARef<PidNamespace>` from
+// a `&PidNamespace`.
+unsafe impl AlwaysRefCounted for PidNamespace {}
+
 // SAFETY:
 // - `PidNamespace::dec_ref` can be called from any thread.
 // - It is okay to send ownership of `PidNamespace` across thread boundari=
es.
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 5b21fa517e55348582622ec10471918919502959..c37ba50e5dcc53891e08706343f=
cd446d640cda1 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -196,7 +196,7 @@ fn as_raw(&self) -> *mut bindings::platform_device {
 kernel::impl_device_context_into_aref!(Device);
=20
 // SAFETY: Instances of `Device` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for Device {
+unsafe impl crate::types::RefCounted for Device {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the=
 refcount is non-zero.
         unsafe { bindings::get_device(self.as_ref().as_raw()) };
@@ -208,6 +208,10 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
=20
+// SAFETY: We do not implement `Ownable`, thus it is okay to can obtain an=
 `ARef<Device>` from a
+// `&Device`.
+unsafe impl crate::types::AlwaysRefCounted for Device {}
+
 impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx=
> {
     fn as_ref(&self) -> &device::Device<Ctx> {
         // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a p=
ointer to a valid
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 927413d854846477578cbaf06e27d1fc867d0682..6c16f03c50591d6aafe4b9176c5=
c934e1a7b81ba 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -340,7 +340,7 @@ pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
 }
=20
 // SAFETY: The type invariants guarantee that `Task` is always refcounted.
-unsafe impl crate::types::AlwaysRefCounted for Task {
+unsafe impl crate::types::RefCounted for Task {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refc=
ount is nonzero.
         unsafe { bindings::get_task_struct(self.as_ptr()) };
@@ -352,6 +352,10 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
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
index c12ff4d2a3f2d79b760c34c0b84a51b507d0cfb1..40c0138bd336057e7d3a835a9e8=
1391baa2fd2b1 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -418,11 +418,9 @@ pub const fn raw_get(this: *const Self) -> *mut T {
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
@@ -438,9 +436,8 @@ pub const fn raw_get(this: *const Self) -> *mut T {
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
@@ -453,11 +450,21 @@ pub unsafe trait AlwaysRefCounted {
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
rt from a shared reference
+/// `&T` to an owned reference [`ARef<T>`].
+///
+/// # Safety
+///
+/// Implementers must ensure that no safety invariants are violated by upg=
rading an `&T` to an
+/// [`ARef<T>`]. In particular that implies [`AlwaysRefCounted`] and [`Own=
able`] cannot be
+/// implemented for the same type, as this would allow to violate the uniq=
ueness guarantee of
+/// [`Owned<T>`] by derefencing it into an `&T` and obtaining an [`ARef`] =
from that.
+pub unsafe trait AlwaysRefCounted: RefCounted {}
+
 /// An owned reference to an always-reference-counted object.
 ///
 /// The object's reference count is automatically decremented when an inst=
ance of [`ARef`] is
@@ -468,7 +475,7 @@ pub unsafe trait AlwaysRefCounted {
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
@@ -477,16 +484,16 @@ pub struct ARef<T: AlwaysRefCounted> {
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
@@ -515,12 +522,12 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
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
@@ -538,7 +545,7 @@ pub fn into_raw(me: Self) -> NonNull<T> {
     }
 }
=20
-impl<T: AlwaysRefCounted> Clone for ARef<T> {
+impl<T: RefCounted> Clone for ARef<T> {
     fn clone(&self) -> Self {
         self.inc_ref();
         // SAFETY: We just incremented the refcount above.
@@ -546,7 +553,7 @@ fn clone(&self) -> Self {
     }
 }
=20
-impl<T: AlwaysRefCounted> Deref for ARef<T> {
+impl<T: RefCounted> Deref for ARef<T> {
     type Target =3D T;
=20
     fn deref(&self) -> &Self::Target {
@@ -563,7 +570,7 @@ fn from(b: &T) -> Self {
     }
 }
=20
-impl<T: AlwaysRefCounted> Drop for ARef<T> {
+impl<T: RefCounted> Drop for ARef<T> {
     fn drop(&mut self) {
         // SAFETY: The type invariants guarantee that the `ARef` owns the =
reference we're about to
         // decrement.
diff --git a/rust/kernel/types/ownable.rs b/rust/kernel/types/ownable.rs
index f4065a0d627a62d3ecb15edabf306e9b812556e1..80cd990f6601767aa5a742a6c09=
97f4f67d06453 100644
--- a/rust/kernel/types/ownable.rs
+++ b/rust/kernel/types/ownable.rs
@@ -18,8 +18,8 @@
 ///
 /// Note: Implementing this trait allows types to be wrapped in an [`Owned=
<Self>`]. This does not
 /// provide reference counting but represents a unique, owned reference. I=
f reference counting is
-/// required [`AlwaysRefCounted`](crate::types::AlwaysRefCounted) should b=
e implemented which allows
-/// types to be wrapped in an [`ARef<Self>`](crate::types::ARef).
+/// required [`RefCounted`](crate::types::RefCounted) should be implemente=
d which allows types to be
+/// wrapped in an [`ARef<Self>`](crate::types::ARef).
 ///
 /// # Safety
 ///

--=20
2.49.0


