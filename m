Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F5E265607;
	Mon, 21 Apr 2025 13:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243394; cv=none; b=DlsppDKBuVY0LWgFkv8fplgKdNrW3ZXHyi8Mk9NeV6JBto2e46G8NmIL1wdtRaz+cIzQxyaUk4ETsc9JbPMgO60ImARJY337h9L6c+AB8w64QatqGvP1F13l1L3X7WkeDfao92ehX13HUxadu0USWYn0NhI/e2SVpN37ASfrt9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243394; c=relaxed/simple;
	bh=BUbl0Hso8+VvNoN3zVfpKWS+jOtyoM0JFJCCM5jfl9k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rn8AEKTN1iiegu8Gy5Qro3m36qg1mKDkXaBES93vhOqhRUybihgctXvynj4YqssK0ckBYoS7XtAd0n3R/5vQ2yCxMXYcXtoJV/YQmIOIppIcnjg04nmHxDD4B8b4QivnPFRf8NFwbXqWExlab117RqAQgOfjMqKYH4hbN52GNC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=TBmHWivq; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="TBmHWivq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745243384; x=1745502584;
	bh=64g4C6aut2iGTL5A6yDHBX2R2hNml2bmojv2EBq3Bmw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=TBmHWivq/frKLReEFixToJ+LK7QJjtgjTibzRV9rPiK9lRaWRGZiX4ZBJGX0BnHI2
	 2h3BesdQXIsh5w/jDW6pn9lPBfcUCPxnxn6OQU5J/3ehKDH7pIjqXhSqM/7juibtgD
	 Xpfhzb52O6BLil2UpvW96wT2mnxt0q72TrlMXFPIyu9OJ9O3xTjcerAxMtuxMDdm+f
	 N/iRIZYk1h3fiqKWe5fIJJioncix61moQJulLH0yIQYjLCcvd+67yG4BLBwrOAjhdJ
	 oDDM2FOsRKwDKriO5aEDLqhnrZSMJsOWR1aW/V585DrdPMfTkvk/nsWelHJWyRcQA/
	 h/fgMkEHyZ2YQ==
Date: Mon, 21 Apr 2025 13:49:41 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Xiangfei Ding <dingxiangfei2009@gmail.com>, Yutaro Ohno <yutaro.ono.418@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: [PATCH v3 2/4] rust: create basic untrusted data API
Message-ID: <20250421134909.464405-3-benno.lossin@proton.me>
In-Reply-To: <20250421134909.464405-1-benno.lossin@proton.me>
References: <20250421134909.464405-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 6dc438543a5ab2a0361c5bd07c1e950f71d473c8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When the kernel receives external data (e.g. from userspace), it usually
is a very bad idea to directly use the data for logic decision in the
kernel. For this reason, such data should be explicitly marked and
validated before making decision based on its value.

The `Untrusted<T>` wrapper type marks a value of type `T` as untrusted.
The particular meaning of "untrusted" highly depends on the type `T`.
For example `T =3D u8` ensures that the value of the byte cannot be
retrieved. However, `T =3D [u8]` still allows to access the length of the
slice. Similarly, `T =3D KVec<U>` allows modifications.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---

Thanks a lot to Gary who suggested to add the `Deref for
Untrusted<[T]>`, it allows implicit conversions at the right places and
hopefully makes the whole API have a lot less friction.

---
 rust/kernel/lib.rs      |   1 +
 rust/kernel/validate.rs | 142 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)
 create mode 100644 rust/kernel/validate.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index de9d6e797953..b2da57bd2c02 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -85,6 +85,7 @@
 pub mod transmute;
 pub mod types;
 pub mod uaccess;
+pub mod validate;
 pub mod workqueue;
=20
 #[doc(hidden)]
diff --git a/rust/kernel/validate.rs b/rust/kernel/validate.rs
new file mode 100644
index 000000000000..8b33716be0c7
--- /dev/null
+++ b/rust/kernel/validate.rs
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Untrusted data API.
+//!
+//! # Overview
+//!
+//! Untrusted data is marked using the [`Untrusted<T>`] type. See [Rationa=
le](#rationale) for the
+//! reasons to mark untrusted data throughout the kernel. It is a totally =
opaque wrapper, it is not
+//! possible to read the data inside.
+//!
+//! APIs that write back into userspace usually allow writing untrusted by=
tes directly, allowing
+//! direct copying of untrusted user data back into userspace without vali=
dation.
+//!
+//! # Rationale
+//!
+//! When reading data from an untrusted source, it must be validated befor=
e it can be used for
+//! **logic**. For example, this is a very bad idea:
+//!
+//! ```
+//! # fn read_bytes_from_network() -> Box<[u8]> {
+//! #     Box::new([1, 0], kernel::alloc::flags::GFP_KERNEL).unwrap()
+//! # }
+//! let bytes: Box<[u8]> =3D read_bytes_from_network();
+//! let data_index =3D bytes[0];
+//! let data =3D bytes[usize::from(data_index)];
+//! ```
+//!
+//! While this will not lead to a memory violation (because the array inde=
x checks the bounds), it
+//! might result in a kernel panic. For this reason, all untrusted data mu=
st be wrapped in
+//! [`Untrusted<T>`]. This type only allows validating the data or passing=
 it along, since copying
+//! data from userspace back into userspace is allowed for untrusted data.
+
+use core::ops::{Deref, DerefMut};
+
+use crate::{
+    alloc::{Allocator, Vec},
+    transmute::{cast_slice, cast_slice_mut},
+};
+
+/// Untrusted data of type `T`.
+///
+/// Data coming from userspace is considered untrusted and should be marke=
d by this type.
+///
+/// The particular meaning of [`Untrusted<T>`] depends heavily on the type=
 `T`. For example,
+/// `&Untrusted<[u8]>` is a reference to an untrusted slice. But the lengt=
h is not considered
+/// untrusted, as it would otherwise violate normal Rust rules. For this r=
eason, one can easily
+/// convert that reference to `&[Untrusted<u8>]`. Another such example is =
`Untrusted<KVec<T>>`, it
+/// derefs to `KVec<Untrusted<T>>`. Raw bytes however do not behave in thi=
s way, `Untrusted<u8>` is
+/// totally opaque.
+///
+/// # Usage in API Design
+///
+/// The exact location where to put [`Untrusted`] depends on the kind of A=
PI. When asking for an
+/// untrusted input value, or buffer to write to, always move the [`Untrus=
ted`] wrapper as far
+/// inwards as possible:
+///
+/// ```
+/// // use this
+/// pub fn read_from_userspace(buf: &mut [Untrusted<u8>]) { todo!() }
+///
+/// // and not this
+/// pub fn read_from_userspace(buf: &mut Untrusted<[u8]>) { todo!() }
+/// ```
+///
+/// The reason for this is that `&mut Untrusted<[u8]>` can beconverted int=
o `&mut [Untrusted<u8>]`
+/// very easily, but the converse is not possible.
+///
+/// For the same reason, when returning untrusted data by-value, one shoul=
d move the [`Untrusted`]
+/// wrapper as far outward as possible:
+///
+/// ```
+/// // use this
+/// pub fn read_all_from_userspace() -> Untrusted<KVec<u8>> { todo!() }
+///
+/// // and not this
+/// pub fn read_all_from_userspace() -> KVec<Untrusted<u8>> { todo!() }
+/// ```
+///
+/// Here too the reason is that `KVec<Untrusted<u8>>` is more restrictive =
compared to
+/// `Untrusted<KVec<u8>>`.
+#[repr(transparent)]
+pub struct Untrusted<T: ?Sized>(T);
+
+impl<T: ?Sized> Untrusted<T> {
+    /// Marks the given value as untrusted.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::validate::Untrusted;
+    ///
+    /// # mod bindings { pub(crate) unsafe fn read_foo_info() -> [u8; 4] {=
 todo!() } };
+    /// fn read_foo_info() -> Untrusted<[u8; 4]> {
+    ///     // SAFETY: just an FFI call without preconditions.
+    ///     Untrusted::new(unsafe { bindings::read_foo_info() })
+    /// }
+    /// ```
+    pub fn new(value: T) -> Self
+    where
+        T: Sized,
+    {
+        Self(value)
+    }
+}
+
+impl<T> Deref for Untrusted<[T]> {
+    type Target =3D [Untrusted<T>];
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: `Untrusted<T>` transparently wraps `T`.
+        unsafe { cast_slice(&self.0) }
+    }
+}
+
+impl<T> DerefMut for Untrusted<[T]> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: `Untrusted<T>` transparently wraps `T`.
+        unsafe { cast_slice_mut(&mut self.0) }
+    }
+}
+
+impl<T, A: Allocator> Deref for Untrusted<Vec<T, A>> {
+    type Target =3D Vec<Untrusted<T>, A>;
+
+    fn deref(&self) -> &Self::Target {
+        let ptr: *const Untrusted<Vec<T, A>> =3D self;
+        // CAST: `Untrusted<T>` transparently wraps `T`.
+        let ptr: *const Vec<Untrusted<T>, A> =3D ptr.cast();
+        // SAFETY: `ptr` is derived from the reference `self`.
+        unsafe { &*ptr }
+    }
+}
+
+impl<T, A: Allocator> DerefMut for Untrusted<Vec<T, A>> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        let ptr: *mut Untrusted<Vec<T, A>> =3D self;
+        // CAST: `Untrusted<T>` transparently wraps `T`.
+        let ptr: *mut Vec<Untrusted<T>, A> =3D ptr.cast();
+        // SAFETY: `ptr` is derived from the reference `self`.
+        unsafe { &mut *ptr }
+    }
+}
--=20
2.48.1


