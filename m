Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9012B9CD;
	Wed,  9 Apr 2025 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193893; cv=none; b=D9XFlBJFQWDBHqehJ+zY7aU9PwiXqQDgcPNT2SAfx4fKzeWigpretRp6NFNCmwhcbJ3XkNGkuVySPulXDRKkyCDxNMdyrQNvnPKA9bz1A+bJSOgIgHh6uzD62N5SkVR1vreiY9BxqAO74y+PbEb4T8kZH/cbCIwXsCytiRHdxZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193893; c=relaxed/simple;
	bh=4DPDo0GWRSm6zQk58zZ2hZ9En9ZaULrTfU6J/69ylc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dJQgy1b2tFxEj+eZPFhbec1iBJjzbzR9HbaqVrD4wJqdBrQIhxddk9N5sY0sZaHOV8zzmzTcqRQhXFKwf37HmcP5sTd2kym5baetqY5a7ECSPrJ236Coa1cr/Pz4XptDk+PyVVbXb07wLE6jJs1ncsvuNN62PdQ6yfs6/lij4nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQWH/Gz2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQWH/Gz2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA47CC4CEE9;
	Wed,  9 Apr 2025 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744193892;
	bh=4DPDo0GWRSm6zQk58zZ2hZ9En9ZaULrTfU6J/69ylc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nQWH/Gz2MlC21HbwoLJI8G6u+ClrznpovevHVJNre9MKDw6xP6KNAVGf9JwACMnxw
	 FjsnY+h0qSg4z8u+bDRq//cA5CXGNeq4kOJKTm0MQoRQJgxQLKsQmzaDcU31PnLHZd
	 fdvUcXvidCaiC/QWaiIPbfb/PvP4YhCY8oqX5mrl2ZTj8JoIUlHoWsky4TOJFP3W0A
	 SQeJCeM7P8xYe645PMtR0Bl3+R/42+rCnHFNOYiO9PhJKtqCiDgLFanAW6lBW64JMK
	 jjJxciqzq0DBJUmIeok2LnsJEOdpkBKk20eRKlzfNcyEwm+Mhwn3ypPtt2fMCoIZhV
	 QGPUEhMVpLusQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Asahi Lina" <lina@asahilina.net>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 1/5] rust: types: Add Ownable/Owned types
In-Reply-To: <20250325-unique-ref-v9-1-e91618c1de26@pm.me> (Oliver Mangold's
	message of "Tue, 25 Mar 2025 11:56:51 +0000")
References: <20250325-unique-ref-v9-0-e91618c1de26@pm.me>
	<Ml2H7_ySOyeMcC8pbvvmed1q5GE60kAML1QCXOUWvV_N8f1870LAb1iomjNlfpilMILe6GynzZvKM9cf8SIfZg==@protonmail.internalid>
	<20250325-unique-ref-v9-1-e91618c1de26@pm.me>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 09 Apr 2025 10:34:37 +0200
Message-ID: <87o6x5d97m.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Oliver,

"Oliver Mangold" <oliver.mangold@pm.me> writes:

> From: Asahi Lina <lina@asahilina.net>
>
> By analogy to AlwaysRefCounted and ARef, an Ownable type is a (typically
> C FFI) type that *may* be owned by Rust, but need not be. Unlike
> AlwaysRefCounted, this mechanism expects the reference to be unique
> within Rust, and does not allow cloning.
>
> Conceptually, this is similar to a KBox<T>, except that it delegates
> resource management to the T instead of using a generic allocator.
>
> Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net/
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> [ om:
>   - split code into separate file and `pub use` it from types.rs
>   - make from_raw() and into_raw() public
>   - fixes to documentation
> ]
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> ---
>  rust/kernel/lib.rs     |   1 +
>  rust/kernel/ownable.rs | 117 +++++++++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/types.rs   |   2 +
>  3 files changed, 120 insertions(+)

I would suggest moving ownable.rs to rust/kernel/types/ownable.rs and
then moving `pub mod ownable` to types.rs.

>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 7697c60b2d1a670c436246d422de3b22b1520956..52c294bbf8ded260540e0bc07499257bce91383c 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -61,6 +61,7 @@
>  #[cfg(CONFIG_NET)]
>  pub mod net;
>  pub mod of;
> +pub mod ownable;
>  pub mod page;
>  #[cfg(CONFIG_PCI)]
>  pub mod pci;
> diff --git a/rust/kernel/ownable.rs b/rust/kernel/ownable.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..f4bebea23ce1d62f5597e35199ca38ea07b293db
> --- /dev/null
> +++ b/rust/kernel/ownable.rs
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Owned reference types.
> +
> +use core::{
> +    marker::PhantomData,
> +    mem::ManuallyDrop,
> +    ops::{Deref, DerefMut},
> +    ptr::NonNull,
> +};
> +
> +/// Types that may be owned by Rust code or borrowed, but have a lifetime managed by C code.
> +///
> +/// It allows such types to define their own custom destructor function to be called when
> +/// a Rust-owned reference is dropped.
> +///
> +/// This is usually implemented by wrappers to existing structures on the C side of the code.
> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that:
> +/// - Any objects owned by Rust as [`Owned<T>`] stay alive while that owned reference exists (i.e.
> +///   until the [`release()`](Ownable::release) trait method is called).
> +/// - That the C code follows the usual mutable reference requirements. That is, the kernel will
> +///   never mutate the [`Ownable`] (excluding internal mutability that follows the usual rules)
> +///   while Rust owns it.
> +pub unsafe trait Ownable {
> +    /// Releases the object (frees it or returns it to foreign ownership).
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that the object is no longer referenced after this call.
> +    unsafe fn release(this: NonNull<Self>);
> +}
> +
> +/// A subtrait of Ownable that asserts that an [`Owned<T>`] or `&mut Owned<T>` Rust reference
> +/// may be dereferenced into a `&mut T`.
> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that access to a `&mut T` is safe, implying that it is okay to call
> +/// [`core::mem::swap`] on the `Ownable`. This excludes pinned types (meaning: most kernel types).
> +pub unsafe trait OwnableMut: Ownable {}
> +
> +/// An owned reference to an ownable kernel object.
> +///
> +/// The object is automatically freed or released when an instance of [`Owned`] is
> +/// dropped.
> +///
> +/// # Invariants
> +///
> +/// The pointer stored in `ptr` is non-null and valid for the lifetime of the [`Owned`] instance.

I am not sure we need the non-null invariant here, since it is an
invariant of `NonNull`. The rest is fine.

> +pub struct Owned<T: Ownable> {
> +    ptr: NonNull<T>,
> +    _p: PhantomData<T>,
> +}
> +
> +// SAFETY: It is safe to send `Owned<T>` to another thread when the underlying `T` is `Send` because
> +// it effectively means sending a unique `&mut T` pointer (which is safe because `T` is `Send`).

I would drop 'pointer' in 'a unique `&mut T` ~pointer~' here. '`&mut T`'
is sufficient alone.

> +unsafe impl<T: Ownable + Send> Send for Owned<T> {}
> +
> +// SAFETY: It is safe to send `&Owned<T>` to another thread when the underlying `T` is `Sync`
> +// because it effectively means sharing `&T` (which is safe because `T` is `Sync`).

Like here, I think this is correct (without the pointer wording).

> +unsafe impl<T: Ownable + Sync> Sync for Owned<T> {}
> +
> +impl<T: Ownable> Owned<T> {
> +    /// Creates a new instance of [`Owned`].
> +    ///
> +    /// It takes over ownership of the underlying object.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that the underlying object is acquired and can be considered owned by
> +    /// Rust.

This part "the underlying object is acquired" is unclear to me. How about:

  Callers must ensure that *ownership of* the underlying object is acquired.


Best regards,
Andreas Hindborg



