Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A56238C15;
	Fri,  2 May 2025 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179870; cv=none; b=HDXUO6ISFSGutqgpxrKnke66KOL+735mycbMicVwXADve8gklBIKwbxMtlIpaTYYCYiRi1/E2fh+TAAt0VRISHAS6k3WRQq4N9TPfL9FXhgsBm5HAP2jECB2JgAX0H+WijzM0KnFpk1ITr8iaklyApZtPUOuPY8DaPxlkB9NUFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179870; c=relaxed/simple;
	bh=pW1H8xXE21A+n17a+0P5k7+tQf/Aa0cTWaK+S948R4s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sjeLUENcct5CbUwBA73LMw9fbtCx0ZLEhJM5TOR1VM2R9BkE67X8FtXcEvYEVoz1k9R5FZht7aT6KacEl1w2MPxsHlWAMmqrd5epmCFQuN2cqXwo481iod0S+Zm6pbCbfl6jHdtVp9KED6ku2qTo0L26cdP5G+oIuN7iwR3oPo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDPm6fIN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDPm6fIN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF68C4CEED;
	Fri,  2 May 2025 09:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746179869;
	bh=pW1H8xXE21A+n17a+0P5k7+tQf/Aa0cTWaK+S948R4s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NDPm6fINYnhGBeSfvFNgqO/AnV4iA4AnGFqqrk5aE+5rqVTjGTwRhpP7iMrILQr/P
	 DdILNeLXVmqJltLISpeZ6yEwnzgiG1b69h3l9aJG9+XRZ+wqowTXiKPFdXy9YpG/iy
	 3QBrNBcC9MorTP4JZH3m+MkQrafRgEAUd9PAhYNgrQEwnuFPFum42zYaOB0z+RoN7S
	 di/ilaVBvsXnEM886gxQapzZz00wFLowQRp0bv1P5Fz2+gkK6b23JaJ2hNifMb4oLy
	 FlcTh5Gqs+KULhcCTop+tz/xHkd6urhWFmGdzyc8sKVryJMbA4kEF8D1Umwv07/OAi
	 b6B9CJ6avteJA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Asahi Lina" <lina@asahilina.net>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
In-Reply-To: <20250502-unique-ref-v10-1-25de64c0307f@pm.me> (Oliver Mangold's
	message of "Fri, 02 May 2025 09:02:29 +0000")
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
	<d6hUddIgwZqRCgQQQV7L2VG4idnic0hOdWqt67Itt_xixs1RI25dMrPZRMyoIe2W_FS4eL6X66J_iclD2aUA0Q==@protonmail.internalid>
	<20250502-unique-ref-v10-1-25de64c0307f@pm.me>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 02 May 2025 11:57:30 +0200
Message-ID: <87zffvz65x.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

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
>  rust/kernel/types.rs         |   3 ++
>  rust/kernel/types/ownable.rs | 117 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 9d0471afc9648f2973235488b441eb109069adb1..5d8a99dcba4bf733107635bf3f0c15840ec33e4c 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -11,6 +11,9 @@
>  };
>  use pin_init::{PinInit, Zeroable};
>
> +pub mod ownable;
> +pub use ownable::{Ownable, OwnableMut, Owned};
> +
>  /// Used to transfer ownership to and from foreign (non-Rust) languages.
>  ///
>  /// Ownership is transferred from Rust to a foreign language by calling [`Self::into_foreign`] and
> diff --git a/rust/kernel/types/ownable.rs b/rust/kernel/types/ownable.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..52e7a69019f1e2bbbe3cf715651b67a5a5c7c13d
> --- /dev/null
> +++ b/rust/kernel/types/ownable.rs
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
> +/// The pointer stored in `ptr` is valid for the lifetime of the [`Owned`] instance.
> +pub struct Owned<T: Ownable> {
> +    ptr: NonNull<T>,
> +    _p: PhantomData<T>,
> +}
> +
> +// SAFETY: It is safe to send `Owned<T>` to another thread when the underlying `T` is `Send` because
> +// it effectively means sending a `&mut T` (which is safe because `T` is `Send`).
> +unsafe impl<T: Ownable + Send> Send for Owned<T> {}
> +
> +// SAFETY: It is safe to send `&Owned<T>` to another thread when the underlying `T` is `Sync`
> +// because it effectively means sharing `&T` (which is safe because `T` is `Sync`).
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

  Callers must ensure that *ownership of* the underlying object has been
  acquired. That is, the object can be considered owned by the caller.


Best regards,
Andreas Hindborg


