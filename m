Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A24322F152
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746186202; cv=none; b=j2pOr+1msVi2Ag1fPL789KQzPsvTJNIKiXrUibSBUVS5N+3NpFEeXIlUBivnRRgjWJzhA8p1YEGGvNWG6l3Pb+l3dNZViyva/v+2KA8v7wyOmkOkjuRdLHrrokuvrvR2Pg78ffstIncKx1Va+u2Y7EyZgGl19V1xDqtscJCxPTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746186202; c=relaxed/simple;
	bh=8gwBBioMXi3Ll+7Mw/MWxW8gwSz6pU8VF7k7c/qr3K0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OcxxFRh+YJuHXx6V7pvAi6hlLFk1eIzxVrWGEkLmWl2XmSZQWoDPXScmJsWb4eedIW52Mu3y1cwgQ8NPTdmAj1p9l692PEmy8OxotnCTbkdfQrZuy9u6j2T/BxNmLAoHrW2VvSZSOBdPuHjlvMQ443GATfZk14bf8jmJASmu4ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lznAkD3S; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lznAkD3S"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so8277725e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 04:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746186197; x=1746790997; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DidYLOHuLXP5Tq5oB8ufiHav2Zf66UmHbXzwtTzN9hs=;
        b=lznAkD3SLmVzWE3NnlQdAUy/VGgrazw+OPDw4zp0MO31BtXnim7bhFtLaMZg6cpc5d
         rt4L6GPX+XedR48RIYDOFANuoRYkQ6OPPauPG93IYy0y4vdPMwen47oWZl9v9SkG9v0K
         EaYIg0NPYXcqgi+JZ89cVUtGKjFaUguMdQN1bH8IsGDLrRsDSJ0Bx5fJ9OGqUb/VG7ZV
         /r7gEXegedFlhLQi2FRmyzHw3yp26fiWuDwslj6KyfGIbsIpcgruoWC/Iix8lnU5miIF
         pm/ZXILbIZZZilVxNuX5u3mJVrf/G/Uzi0A5qLa65zGeRsG1v2v0ZbjZnaYXbCm6JDWY
         BG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746186197; x=1746790997;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DidYLOHuLXP5Tq5oB8ufiHav2Zf66UmHbXzwtTzN9hs=;
        b=sckGF6p1Z+isScUPnVR+6MlwyqZMNrIbqhDeguSbm1Owap91xCOIQy1WvCKdTy8fl1
         aGzf1jNylIjqfVxZC6fwTv45MJXq9vkCA2F/3Bv7NhP8KisutbvPcQd4WU8s7bov4oo1
         TPUB48buNhfohodRL/xMNn0zHKfB+yeTjSls9zhpnT3Mnr/37JS7GPa3zsw2JXhQGBDi
         fcwL1DmTH/TQomvnrojrVP03wYkOa3jez68OPn47aNqqbiHWYt89wl6tVbob6PgrD8UB
         BjKDraB73dShyPbGFGdy4Z75zpIwXlxCW8SbWUlJBkYcXNA8/bRYXi3s/cPB4HSbTV31
         gefg==
X-Forwarded-Encrypted: i=1; AJvYcCXaOzvxdQcjNY9L2ci9odSQx/EPV1AgtXd8G2BCyfwhfKjqUgt0z/a+OIUlOZ3+68f5a25jVY/c3tobvrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9uoGrQbiUaIqNedRGQT4WktMx+JuV9peJMmeoHiMZcwzAqnt
	8azW+f8g6b96smBwM6T3R/O82/b4tSJAO7a550gliXKI9u2KzDiymHDYuhLKpJdcg02mSZuxHKV
	60LU4wCkGEl/B2g==
X-Google-Smtp-Source: AGHT+IFGa/pmevzllhA3VKUyCdg9dMO5Fkxuvgy8Gq5Jgms9suiSPzBpAtv6+CgiyV3Rj/nCueu/o+qTbmID7mU=
X-Received: from wmbfm22.prod.google.com ([2002:a05:600c:c16:b0:43c:fce2:1db2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:ccc:b0:43d:1840:a13f with SMTP id 5b1f17b1804b1-441bbf2bbc1mr18359295e9.25.1746186197444;
 Fri, 02 May 2025 04:43:17 -0700 (PDT)
Date: Fri, 2 May 2025 11:43:15 +0000
In-Reply-To: <20250502-unique-ref-v10-5-25de64c0307f@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <20250502-unique-ref-v10-5-25de64c0307f@pm.me>
Message-ID: <aBSv0w5x8qhBfOM8@google.com>
Subject: Re: [PATCH v10 5/5] rust: Add OwnableRefCounted and SimpleOwnableRefCounted
From: Alice Ryhl <aliceryhl@google.com>
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 02, 2025 at 09:03:04AM +0000, Oliver Mangold wrote:
> Types implementing one of these traits can safely convert between an
> ARef<T> and an Owned<T>.
> 
> This is useful for types which generally are accessed through an ARef
> but have methods which can only safely be called when the reference is
> unique, like e.g. `block::mq::Request::end_ok()`.
> 
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/types.rs         |   8 +-
>  rust/kernel/types/ownable.rs | 244 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 251 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 33d2b4e4a87b991c6d934f4e8d2c6c71a15b1bcb..3a58905599eb9acb0e701c97bd92d3b93b9515cf 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -12,7 +12,7 @@
>  use pin_init::{PinInit, Zeroable};
>  
>  pub mod ownable;
> -pub use ownable::{Ownable, OwnableMut, Owned};
> +pub use ownable::{Ownable, OwnableMut, OwnableRefCounted, Owned, SimpleOwnableRefCounted};
>  
>  /// Used to transfer ownership to and from foreign (non-Rust) languages.
>  ///
> @@ -544,6 +544,12 @@ fn from(b: &T) -> Self {
>      }
>  }
>  
> +impl<T: OwnableRefCounted> From<Owned<T>> for ARef<T> {
> +    fn from(b: Owned<T>) -> Self {
> +        T::into_shared(b)
> +    }
> +}
> +
>  impl<T: RefCounted> Drop for ARef<T> {
>      fn drop(&mut self) {
>          // SAFETY: The type invariants guarantee that the `ARef` owns the reference we're about to
> diff --git a/rust/kernel/types/ownable.rs b/rust/kernel/types/ownable.rs
> index 52e7a69019f1e2bbbe3cf715651b67a5a5c7c13d..b79459d07870ea4fa4f5df0c7565ac72d65e2c53 100644
> --- a/rust/kernel/types/ownable.rs
> +++ b/rust/kernel/types/ownable.rs
> @@ -2,6 +2,7 @@
>  
>  //! Owned reference types.
>  
> +use crate::types::{ARef, RefCounted};
>  use core::{
>      marker::PhantomData,
>      mem::ManuallyDrop,
> @@ -115,3 +116,246 @@ fn drop(&mut self) {
>          unsafe { T::release(self.ptr) };
>      }
>  }
> +
> +/// A trait for objects that can be wrapped in either one of the reference types [`Owned`] and
> +/// [`ARef`].
> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that:
> +///
> +/// - Both the safety requirements for [`Ownable`] and [`RefCounted`] are fulfilled.
> +/// - [`try_from_shared()`](OwnableRefCounted::into_shared) only returns an [`Owned`] if exactly
> +///   one [`ARef`] exists.
> +/// - [`into_shared()`](OwnableRefCounted::into_shared) set the reference count to the value which
> +///   the returned [`ARef`] expects for an object with a single reference
> +///   in existence. This implies that if [`into_shared()`](OwnableRefCounted::into_shared) is left
> +///   on the default implementation, which just rewraps the underlying object, the reference count
> +///   needs not to be modified when converting a [`Owned`] to an [`ARef`].
> +///
> +/// # Examples
> +///
> +/// A minimal example implementation of [`OwnableRefCounted`], [`Ownable`] and its usage with
> +/// [`ARef`] and [`Owned`] looks like this:
> +///
> +/// ```
> +/// # #![expect(clippy::disallowed_names)]
> +/// use core::cell::Cell;
> +/// use core::ptr::NonNull;
> +/// use kernel::alloc::{flags, kbox::KBox, AllocError};
> +/// use kernel::types::{
> +///     ARef, RefCounted, Owned, Ownable, OwnableRefCounted,
> +/// };
> +///
> +/// struct Foo {
> +///     refcount: Cell<usize>,
> +/// }
> +///
> +/// impl Foo {
> +///     fn new() -> Result<Owned<Self>, AllocError> {
> +///         // Use a `KBox` to handle the actual allocation.
> +///         let result = KBox::new(
> +///             Foo {
> +///                 refcount: Cell::new(1),
> +///             },
> +///             flags::GFP_KERNEL,
> +///         )?;
> +///         let result = NonNull::new(KBox::into_raw(result))
> +///             .expect("Raw pointer to newly allocation KBox is null, this should never happen.");
> +///         // SAFETY: We just allocated the `Foo`, thus it is valid.
> +///         Ok(unsafe { Owned::from_raw(result) })
> +///     }
> +/// }
> +///
> +/// // SAFETY: We increment and decrement each time the respective function is called and only free
> +/// // the `Foo` when the refcount reaches zero.
> +/// unsafe impl RefCounted for Foo {
> +///     fn inc_ref(&self) {
> +///         self.refcount.replace(self.refcount.get() + 1);
> +///     }
> +///
> +///     unsafe fn dec_ref(this: NonNull<Self>) {
> +///         // SAFETY: The underlying object is always valid when the function is called.
> +///         let refcount = unsafe { &this.as_ref().refcount };
> +///         let new_refcount = refcount.get() - 1;
> +///         if new_refcount == 0 {
> +///             // The `Foo` will be dropped when `KBox` goes out of scope.
> +///             // SAFETY: The `Box<Foo>` is still alive as the old refcount is 1.
> +///             unsafe { KBox::from_raw(this.as_ptr()) };
> +///         } else {
> +///             refcount.replace(new_refcount);
> +///         }
> +///     }
> +/// }
> +///
> +/// // SAFETY: We only convert into an `Owned` when the refcount is 1.
> +/// unsafe impl OwnableRefCounted for Foo {
> +///     fn try_from_shared(this: ARef<Self>) -> Result<Owned<Self>, ARef<Self>> {
> +///         if this.refcount.get() == 1 {
> +///             // SAFETY: The `Foo` is still alive as the refcount is 1.
> +///             Ok(unsafe { Owned::from_raw(ARef::into_raw(this)) })
> +///         } else {
> +///             Err(this)
> +///         }
> +///     }
> +/// }
> +///
> +/// // SAFETY: We are not `AlwaysRefCounted`.
> +/// unsafe impl Ownable for Foo {
> +///     unsafe fn release(this: NonNull<Self>) {
> +///         // SAFETY: Using `dec_ref()` from `RefCounted` to release is okay, as the refcount is
> +///         // always 1 for an `Owned<Foo>`.
> +///         unsafe{ Foo::dec_ref(this) };
> +///     }
> +/// }
> +///
> +/// let foo = Foo::new().unwrap();
> +/// let mut foo = ARef::from(foo);
> +/// {
> +///     let bar = foo.clone();
> +///     assert!(Owned::try_from(bar).is_err());
> +/// }
> +/// assert!(Owned::try_from(foo).is_ok());
> +/// ```
> +pub unsafe trait OwnableRefCounted: RefCounted + Ownable + Sized {
> +    /// Checks if the [`ARef`] is unique and convert it to an [`Owned`] it that is that case.
> +    /// Otherwise it returns again an [`ARef`] to the same underlying object.
> +    fn try_from_shared(this: ARef<Self>) -> Result<Owned<Self>, ARef<Self>>;
> +
> +    /// Converts the [`Owned`] into an [`ARef`].
> +    fn into_shared(this: Owned<Self>) -> ARef<Self> {
> +        // SAFETY: Safe by the requirements on implementing the trait.
> +        unsafe { ARef::from_raw(Owned::into_raw(this)) }
> +    }
> +}
> +
> +/// This trait allows to implement [`Ownable`] and [`OwnableRefCounted`] together in a simplified
> +/// way, only requiring to implement [`RefCounted`] and providing the method
> +/// [`is_unique()`](SimpleOwnableRefCounted::is_unique).
> +///
> +/// For non-standard cases where conversion between [`Ownable`] and [`RefCounted`] does not allow
> +/// [`Ownable::release()`] and [`RefCounted::dec_ref()`] to be the same method, [`Ownable`]
> +/// and [`OwnableRefCounted`] should be implemented separately.
> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that:
> +///
> +/// - The safety requirements for [`Ownable`] are fulfilled and [`RefCounted::dec_ref()`] can
> +///   be used for [`Ownable::release()`].
> +/// - [`is_unique`](SimpleOwnableRefCounted::is_unique) must only return `true` in case only one
> +///   [`ARef`] exists and it is impossible for one to be obtained other than by cloning an existing
> +///   [`ARef`] or converting an [`Owned`] to an [`ARef`].
> +/// - It is safe to convert an unique [`ARef`] into an [`Owned`] simply by re-wrapping the
> +///   underlying object without modifying the refcount.
> +///
> +/// # Examples
> +///
> +/// A minimal example implementation of [`RefCounted`] and [`SimpleOwnableRefCounted`]
> +/// and its usage with [`ARef`] and [`Owned`] looks like this:
> +///
> +/// ```
> +/// # #![expect(clippy::disallowed_names)]
> +/// use core::cell::Cell;
> +/// use core::ptr::NonNull;
> +/// use kernel::alloc::{flags, kbox::KBox, AllocError};
> +/// use kernel::types::{
> +///     ARef, Owned, RefCounted, SimpleOwnableRefCounted,
> +/// };
> +///
> +/// struct Foo {
> +///     refcount: Cell<usize>,
> +/// }
> +///
> +/// impl Foo {
> +///     fn new() -> Result<Owned<Self>, AllocError> {
> +///         // Use a KBox to handle the actual allocation.
> +///         let result = KBox::new(
> +///             Foo {
> +///                 refcount: Cell::new(1),
> +///             },
> +///             flags::GFP_KERNEL,
> +///         )?;
> +///         let result = NonNull::new(KBox::into_raw(result))
> +///             .expect("Raw pointer to newly allocation KBox is null, this should never happen.");
> +///         // SAFETY: We just allocated the `Foo`, thus it is valid.
> +///         Ok(unsafe { Owned::from_raw(result) })
> +///     }
> +/// }
> +///
> +/// // SAFETY: we ensure that:
> +/// // - The `Foo` is only dropped when the refcount is zero.
> +/// // - `is_unique()` only returns `true` when the refcount is 1.
> +/// unsafe impl RefCounted for Foo {
> +///     fn inc_ref(&self) {
> +///         self.refcount.replace(self.refcount.get() + 1);
> +///     }
> +///
> +///     unsafe fn dec_ref(this: NonNull<Self>) {
> +///         // SAFETY: The underlying object is always valid when the function is called.
> +///         let refcount = unsafe { &this.as_ref().refcount };
> +///         let new_refcount = refcount.get() - 1;
> +///         if new_refcount == 0 {
> +///             // The `Foo` will be dropped when KBox goes out of scope.
> +///             // SAFETY: The `Box<Foo>` is still alive as the old refcount is 1.
> +///             unsafe { KBox::from_raw(this.as_ptr()) };
> +///         } else {
> +///             refcount.replace(new_refcount);
> +///         }
> +///     }
> +/// }
> +///
> +/// // SAFETY: we ensure that:
> +/// // - `is_unique()` only returns `true` when the refcount is 1.
> +/// unsafe impl SimpleOwnableRefCounted for Foo {
> +///     fn is_unique(&self) -> bool {
> +///         self.refcount.get() == 1
> +///     }
> +/// }
> +///
> +/// let foo = Foo::new().unwrap();
> +/// let mut foo = ARef::from(foo);
> +/// {
> +///     let bar = foo.clone();
> +///     assert!(Owned::try_from(bar).is_err());
> +/// }
> +/// assert!(Owned::try_from(foo).is_ok());
> +/// ```
> +pub unsafe trait SimpleOwnableRefCounted: RefCounted {
> +    /// Checks if exactly one [`ARef`] to the object exists. In case the object is [`Sync`], the
> +    /// check needs to be race-free.
> +    fn is_unique(&self) -> bool;
> +}
> +
> +#[cfg_attr(RUSTC_HAS_DO_NOT_RECOMMEND, diagnostic::do_not_recommend)]
> +// SAFETY: Safe by the requirements on implementation of [`SimpleOwnableRefCounted`].
> +unsafe impl<T: SimpleOwnableRefCounted> OwnableRefCounted for T {
> +    fn try_from_shared(this: ARef<Self>) -> Result<Owned<Self>, ARef<Self>> {
> +        if T::is_unique(&*this) {
> +            // SAFETY: Safe by the requirements on implementation of [`SimpleOwnable`].
> +            Ok(unsafe { Owned::from_raw(ARef::into_raw(this)) })
> +        } else {
> +            Err(this)
> +        }
> +    }
> +}
> +
> +#[cfg_attr(RUSTC_HAS_DO_NOT_RECOMMEND, diagnostic::do_not_recommend)]
> +// SAFETY: Safe by the requirements on implementation of [`SimpleOwnableRefCounted`].
> +unsafe impl<T: SimpleOwnableRefCounted> Ownable for T {
> +    unsafe fn release(this: NonNull<Self>) {
> +        // SAFETY: Safe by the requirements on implementation of
> +        // [`SimpleOwnableRefCounted::dec_ref()`].
> +        unsafe { RefCounted::dec_ref(this) };
> +    }
> +}

I wonder if this is too limiting. It will limit our ability to write
other blanket impls for Ownable and OwnableRefCounted. Using e.g. a
derive macro might be better?

Alice
