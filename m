Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601991DF984
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745273890; cv=none; b=VuGBWbb6eOFcbuBAyrJ72hCVrE5NHxhRYJ7CtGQJYljVicOzEr3rfDWpasHLNvWyUn0sroQWMLBdAxbxmpU9NwiqYOaKwDGC9fGmFAxqtPGNedxM+bu7+z0GOnDOJXGUkx/TyVOJFyvF8F7ud6TFixMSKhCkqkr4QvO8BQFFOgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745273890; c=relaxed/simple;
	bh=SL51Md59hZ+XJ/1Yte46U1iC+9XIuZEKmzyMLRrzsxA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QeszqML1Ry3Zi/LTy0uuAgvU6VbbigTjyS7exgW4OZ9YtDhdroTXBxT4cNcK451j0C4YCvEC6hnB/MB1ESpeGnF5tE9QLC2A37OWoddPJnN5pW+N+pYWUa5zGTEqkVyi+K1L1HIyHTDUm5xJ/i57qnK/W8nUkVxEAgCUsst8jvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=VXs8ckiu; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="VXs8ckiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745273886; x=1745533086;
	bh=zjUqHYdF/HH4/Y4doW89sElFGiRA2gnx05va2p7uSJ0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=VXs8ckiuin0jHjPmnXF/XcX0i74CzQKvF8obrmgKkaEITqkeAh4DmFARwOhrHmb9a
	 YBmU1qajx5e0Xt50q21KAf2K16gXfMBmqLDYrYsxuNyr/IaUFvkCxlWzNpWDY+leXV
	 HwMqkK7H4Jqg/5xwnzR2y4oND66byja43hFkfE3xm2J82XCPJwMZcfeP9LIFlQ2AgZ
	 2CM4xcmNOzNqiSNs3wbBz6sCxmvajaQPzWz0h2ttTzy0hbHkVJE2N3lk/aa/Gvl17J
	 NLrYrQGicyGpT0+opzlBCPs3xfQk7OvJhi0+14RbFoD2wmaM20smGMSeJ7noygxURz
	 bxqMXdvIgyqiA==
Date: Mon, 21 Apr 2025 22:17:59 +0000
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] rust: pin-init: Add the `Wrapper` trait.
Message-ID: <20250421221728.528089-3-benno.lossin@proton.me>
In-Reply-To: <20250421221728.528089-1-benno.lossin@proton.me>
References: <20250421221728.528089-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: fa2e693ea299802de73a01f3e5fac33a5ed34781
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Christian Schrefl <chrisi.schrefl@gmail.com>

This trait allows creating `PinInitializers` for wrapper or new-type
structs with the inner value structurally pinned, when given the
initializer for the inner value.

Implement this trait for `UnsafeCell` and `MaybeUninit`.

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
Link: https://github.com/Rust-for-Linux/pin-init/pull/37/commits/3ab4db083b=
d7b41a1bc23d937224f975d7400e50
[ Reworded commit message into imperative mode, fixed typo and fixed
  commit authorship. - Benno ]
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/pin-init/src/lib.rs | 44 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index a880c21d3f09..467ccc8bd616 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1513,3 +1513,47 @@ unsafe impl<$first: Zeroable, $($t: Zeroable),*> Zer=
oable for ($first, $($t),*)
 }
=20
 impl_tuple_zeroable!(A, B, C, D, E, F, G, H, I, J);
+
+/// This trait allows creating an instance of `Self` which contains exactl=
y one
+/// [structurally pinned value](https://doc.rust-lang.org/std/pin/index.ht=
ml#projections-and-structural-pinning).
+///
+/// This is useful when using wrapper `struct`s like [`UnsafeCell`] or wit=
h new-type `struct`s.
+///
+/// # Examples
+///
+/// ```
+/// # use core::cell::UnsafeCell;
+/// # use pin_init::{pin_data, pin_init, Wrapper};
+///
+/// #[pin_data]
+/// struct Foo {}
+///
+/// #[pin_data]
+/// struct Bar {
+///     #[pin]
+///     content: UnsafeCell<Foo>
+/// };
+///
+/// let foo_initializer =3D pin_init!(Foo{});
+/// let initializer =3D pin_init!(Bar {
+///     content <- UnsafeCell::pin_init(foo_initializer)
+/// });
+/// ```
+pub trait Wrapper<T> {
+    /// Create an pin-initializer for a [`Self`] containing `T` form the `=
value_init` initializer.
+    fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E=
>;
+}
+
+impl<T> Wrapper<T> for UnsafeCell<T> {
+    fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E=
> {
+        // SAFETY: `UnsafeCell<T>` has a compatible layout to `T`.
+        unsafe { cast_pin_init(value_init) }
+    }
+}
+
+impl<T> Wrapper<T> for MaybeUninit<T> {
+    fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E=
> {
+        // SAFETY: `MaybeUninit<T>` has a compatible layout to `T`.
+        unsafe { cast_pin_init(value_init) }
+    }
+}
--=20
2.48.1


