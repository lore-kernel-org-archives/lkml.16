Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C77C219A71;
	Wed, 30 Apr 2025 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006318; cv=none; b=cpdEYQ3vKW9VVJY8QBfL6veTsCh3dLNKKh1kfLZVt10xfgQAqBiwiHRdzU/NDQtuStV/cY5zsEw+wDskQSYhVXpFM/nRTYs54ZwiZV3tB+rho7JBPO7oqHpjV84e4nZCTvh3V/Day2a4hdua7D103/4+OueCu1F9evaycdjDzn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006318; c=relaxed/simple;
	bh=CBREzKulli8KixtaZrFcnSQi5xasLN07Z0UqDEmrFoA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=riEdjhOgXmC5BBQSoNV07//Cz8QWjRrv5ignCqFLKWnwUTieW9i3AVUha/19MtPmf2Y4pd/H0xicypUU+ytoadDxkApYYza3AoPImCJE3dgrdK19m7WMnA+Jj+mYwU1zHCPiEBLpAvsReYTxCb/RpiKYrzN2bFQi0Sve7Xln9+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9wMAqx8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9wMAqx8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94F7C4CEE9;
	Wed, 30 Apr 2025 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746006316;
	bh=CBREzKulli8KixtaZrFcnSQi5xasLN07Z0UqDEmrFoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9wMAqx8hSaH3f9VaScoGc46PYMcAF6OHs9w5U6043AXNvQL8NedLczhb5fVb2IHx
	 SEHngn4gyZGE+VqBmc2MpbYi5PwfWkULCK7TgeBXX6vNC07z4/BTyfktToPM6Iem4u
	 1dMuYl5qxbT2GeENT3K9v96fR82Y105GwIvrRZ4n5g4PwLuLysecy9FSA31jeHjRHv
	 mrIgk82XzrexfQseeprV+WI1p8+m96fwrS29jG+J9zcZRN0zQX9oa6b0S7pFFpk2Lu
	 0xZjnYwVw4vpQ1bWVIK7z+RMfLHrnMc/zyNfFgcj99dXx9qlxnYDEQqI9Lq1vgmDda
	 oS6UNqK902omQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Apr 2025 11:45:11 +0200
Message-Id: <D9JVKYI3LL5L.2SFOJMSK91HLA@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Sky" <sky@sky9.dev>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, =?utf-8?q?Gerald_Wisb=C3=B6ck?=
 <gerald.wisboeck@feather.ink>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
X-Mailer: aerc 0.20.1
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
In-Reply-To: <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>

On Wed Apr 30, 2025 at 10:36 AM CEST, Christian Schrefl wrote:
> `UnsafePinned<T>` is useful for cases where a value might be shared with
> C code but not directly used by it. In particular this is added for
> storing additional data in the `MiscDeviceRegistration` which will be
> shared between `fops->open` and the containing struct.
>
> Similar to `Opaque` but guarantees that the value is always initialized
> and that the inner value is dropped when `UnsafePinned` is dropped.
>
> This was originally proposed for the IRQ abstractions [0] and is also
> useful for other where the inner data may be aliased, but is always
> valid and automatic `Drop` is desired.
>
> Since then the `UnsafePinned` type was added to upstream Rust [1] by Sky
> as a unstable feature, therefore this patch implements the subset of the
> upstream API for the `UnsafePinned` type required for additional data in
> `MiscDeviceRegistration` and in the implementation of the `Opaque` type.
>
> Some differences to the upstream type definition are required in the
> kernel implementation, because upstream type uses some compiler changes
> to opt out of certain optimizations, this is documented in the
> documentation and a comment on the `UnsafePinned` type.
>
> The documentation on is based on the upstream rust documentation with
> minor modifications for the kernel implementation.
>
> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07=
DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
> Link: https://github.com/rust-lang/rust/pull/137043 [1]
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gerald Wisb=C3=B6ck <gerald.wisboeck@feather.ink>
> Co-developed-by: Sky <sky@sky9.dev>
> Signed-off-by: Sky <sky@sky9.dev>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> ---
>  init/Kconfig                       |   3 +
>  rust/kernel/lib.rs                 |   1 +
>  rust/kernel/types.rs               |   6 ++
>  rust/kernel/types/unsafe_pinned.rs | 115 +++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 125 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 63f5974b9fa6ea3f5c92203cedd1f2f82aa468a1..727d85d2b59f555f1c33103bb=
78698551a41e7ca 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -140,6 +140,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
>  config RUSTC_HAS_COERCE_POINTEE
>  	def_bool RUSTC_VERSION >=3D 108400
> =20
> +config RUSTC_HAS_UNSAFE_PINNED
> +	def_bool RUSTC_VERSION >=3D 108800
> +
>  config PAHOLE_VERSION
>  	int
>  	default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE))
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index de07aadd1ff5fe46fd89517e234b97a6590c8e93..c08f0a50f1d8db95799478caa=
8e85558a1fcae8d 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -17,6 +17,7 @@
>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(coerce_unsized=
))]
>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(dispatch_from_=
dyn))]
>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
> +#![cfg_attr(CONFIG_RUSTC_HAS_UNSAFE_PINNED, feature(unsafe_pinned))]
>  #![feature(inline_const)]
>  #![feature(lint_reasons)]
>  // Stable in Rust 1.82
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 9d0471afc9648f2973235488b441eb109069adb1..705f420fdfbc4a576de1c4546=
578f2f04cdf615e 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -253,6 +253,9 @@ fn drop(&mut self) {
>  ///
>  /// [`Opaque<T>`] is meant to be used with FFI objects that are never in=
terpreted by Rust code.
>  ///
> +/// In cases where the contained data is only used by Rust, is not allow=
ed to be
> +/// uninitialized and automatic [`Drop`] is desired [`UnsafePinned`] sho=
uld be used instead.
> +///
>  /// It is used to wrap structs from the C side, like for example `Opaque=
<bindings::mutex>`.
>  /// It gets rid of all the usual assumptions that Rust has for a value:
>  ///
> @@ -578,3 +581,6 @@ pub enum Either<L, R> {
>  /// [`NotThreadSafe`]: type@NotThreadSafe
>  #[allow(non_upper_case_globals)]
>  pub const NotThreadSafe: NotThreadSafe =3D PhantomData;
> +
> +mod unsafe_pinned;
> +pub use unsafe_pinned::UnsafePinned;
> diff --git a/rust/kernel/types/unsafe_pinned.rs b/rust/kernel/types/unsaf=
e_pinned.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..5a200aac30792bf71098087ae=
e0fd9d2d51c468f
> --- /dev/null
> +++ b/rust/kernel/types/unsafe_pinned.rs
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: Apache-2.0 OR MIT
> +
> +//! The contents of this file partially come from the Rust standard libr=
ary, hosted in
> +//! the <https://github.com/rust-lang/rust> repository, licensed under
> +//! "Apache-2.0 OR MIT" and adapted for kernel use. For copyright detail=
s,
> +//! see <https://github.com/rust-lang/rust/blob/master/COPYRIGHT>.
> +//!
> +//! This file provides a implementation / polyfill of a subset of the up=
stream
> +//! rust `UnsafePinned` type.
> +
> +use core::{cell::UnsafeCell, marker::PhantomPinned};
> +use pin_init::{cast_pin_init, PinInit, Wrapper};
> +
> +/// This type provides a way to opt-out of typical aliasing rules;
> +/// specifically, `&mut UnsafePinned<T>` is not guaranteed to be a uniqu=
e pointer.
> +///
> +/// However, even if you define your type like `pub struct Wrapper(Unsaf=
ePinned<...>)`, it is still
> +/// very risky to have an `&mut Wrapper` that aliases anything else. Man=
y functions that work
> +/// generically on `&mut T` assume that the memory that stores `T` is un=
iquely owned (such as
> +/// `mem::swap`). In other words, while having aliasing with `&mut Wrapp=
er` is not immediate
> +/// Undefined Behavior, it is still unsound to expose such a mutable ref=
erence to code you do not
> +/// control! Techniques such as pinning via [`Pin`](core::pin::Pin) are =
needed to ensure soundness.
> +///
> +/// Similar to [`UnsafeCell`], [`UnsafePinned`] will not usually show up=
 in
> +/// the public API of a library. It is an internal implementation detail=
 of libraries that need to
> +/// support aliasing mutable references.
> +///
> +/// Further note that this does *not* lift the requirement that shared r=
eferences must be read-only!
> +/// Use [`UnsafeCell`] for that.
> +///
> +/// This type blocks niches the same way [`UnsafeCell`] does.
> +///
> +/// # Kernel implementation notes
> +///
> +/// This implementation works because of the "`!Unpin` hack" in rustc, w=
hich allows (some kinds of)
> +/// mutual aliasing of `!Unpin` types. This hack might be removed at som=
e point, after which only
> +/// the `core::pin::UnsafePinned` type will allow this behavior. In orde=
r to simplify the migration
> +/// to future rust versions only this polyfill of this type should be us=
ed when this behavior is
> +/// required.
> +///
> +/// In order to disable niche optimizations this implementation uses [`U=
nsafeCell`] internally,
> +/// the upstream version however will not. So the fact that [`UnsafePinn=
ed`] contains an
> +/// [`UnsafeCell`] must not be relied on (Other than the niche blocking)=
.

I would make this last paragraph a normal comment, I don't think we
should expose it in the docs.

> +// As opposed to the upstream Rust type this contains a `PhantomPinned``=
 and `UnsafeCell<T>`
> +// - `PhantomPinned` to avoid needing a `impl<T> !Unpin for UnsafePinned=
<T>`
> +//      Required to use the `!Unpin hack`.
> +// - `UnsafeCell<T>` instead of T to disallow niche optimizations,
> +//     which is handled in the compiler in upstream Rust
> +#[repr(transparent)]
> +pub struct UnsafePinned<T: ?Sized> {
> +    _ph: PhantomPinned,
> +    value: UnsafeCell<T>,
> +}
> +
> +impl<T> UnsafePinned<T> {
> +    /// Constructs a new instance of [`UnsafePinned`] which will wrap th=
e specified value.
> +    ///
> +    /// All access to the inner value through `&UnsafePinned<T>` or `&mu=
t UnsafePinned<T>` or
> +    /// `Pin<&mut UnsafePinned<T>>` requires `unsafe` code.
> +    #[inline(always)]
> +    #[must_use]
> +    pub const fn new(value: T) -> Self {
> +        UnsafePinned {
> +            value: UnsafeCell::new(value),
> +            _ph: PhantomPinned,
> +        }
> +    }
> +}
> +impl<T: ?Sized> UnsafePinned<T> {
> +    /// Get read-only access to the contents of a shared `UnsafePinned`.
> +    ///
> +    /// Note that `&UnsafePinned<T>` is read-only if `&T` is read-only. =
This means that if there is
> +    /// mutation of the `T`, future reads from the `*const T` returned h=
ere are UB! Use
> +    /// [`UnsafeCell`] if you also need interior mutability.

I agree with copy-pasting the docs from upstream, even though our
implementation already wraps the value in `UnsafeCell`, but I think we
should include a comment at the top of this doc that mentions this
difference. So something along the lines "In order to make replacing
this type with the upstream one, we want to have as little API
divergence as possible. Thus we don't mention the implementation detail
of `UnsafeCell` and people have to use `UnsafePinned<UnsafeCell<T>>`
instead of just `UnsafePinned<T>`." feel free to modify.

If we add that, maybe we don't need the comment about needing
`UnsafeCell` in `Opaque` after all (from my other mail).

> +    ///
> +    /// [`UnsafeCell`]: core::cell::UnsafeCell
> +    ///
> +    /// ```rust,no_build
> +    /// use kernel::types::UnsafePinned;
> +    ///
> +    /// unsafe {
> +    ///     let mut x =3D UnsafePinned::new(0);
> +    ///     let ptr =3D x.get(); // read-only pointer, assumes immutabil=
ity
> +    ///     x.get_mut_unchecked().write(1);
> +    ///     ptr.read(); // UB!
> +    /// }
> +    /// ```
> +    ///
> +    /// Note that the `get_mut_unchecked` function used by this example =
is
> +    /// currently not implemented in the kernel implementation.
> +    #[inline(always)]
> +    #[must_use]
> +    pub const fn get(&self) -> *const T {
> +        self.value.get()
> +    }
> +
> +    /// Gets a mutable pointer to the wrapped value.
> +    ///
> +    /// The difference from `get_mut_pinned` and `get_mut_unchecked` is =
that this function
> +    /// accepts a raw pointer, which is useful to avoid the creation of =
temporary references.

You did not include the `get_mut_{pinned,unchecked}` methods, so
mentioning them here in the docs might confuse people. Do we want to
have those methods?

---
Cheers,
Benno

> +    ///
> +    /// These functions mentioned here are currently not implemented in =
the kernel.
> +    #[inline(always)]
> +    #[must_use]
> +    pub const fn raw_get_mut(this: *mut Self) -> *mut T {
> +        this as *mut T
> +    }
> +}
> +
> +impl<T> Wrapper<T> for UnsafePinned<T> {
> +    fn pin_init<E>(init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
> +        // SAFETY: `UnsafePinned<T>` has a compatible layout to `T`.
> +        unsafe { cast_pin_init(init) }
> +    }
> +}

