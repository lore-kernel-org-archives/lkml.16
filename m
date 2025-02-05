Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D461D6DD4;
	Wed,  5 Feb 2025 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785752; cv=none; b=u+P63traHTmetaKDlbqnrdY/HGpgd6TBtee7tg6ZrfWfkNShMBwlmmx/fPmdDLrbMdwxnti7vpjQpQbhwRwL/Dd7h5LoQbvCAMx0eKRHmIsV4JlfiQ09/49ZRMgyUty9OmVHt6mT5qxEvZ7488WA/KIGbYiIm2ZLobogXkDyZrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785752; c=relaxed/simple;
	bh=MVPoBLK5Lta8JO2yl1wG/kVgdC3BN+3WXypXj8ueEmM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LGg+fMPyD5+W0U+bfewNLcq4880z1hfBgrV9axo7Y0YwxynrtMuqhVPCAB/ashbNKZYw1P7A/OussXPNqgBl82H0RlLj7LTPf/bGyVPIc41St7JD08CLYNBeMeeMNwfgFKPeSkRRkhEo9PMvmYPN2IEaS/owJu0NqVd5HDwBdD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=URcnDuHR; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="URcnDuHR"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1738785748; bh=Ol1X+RM/G7pFZ4iQsIUtvNm2GPmVCr2iNjwUsaYgXz0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=URcnDuHRu4GxRmr5lARpYIFTcEyAHyYbtXUqPJdZDcwqP98vJUyVXRGFtCuj+kyAr
	 LQHp2Ng6+fR+6NSx3aHcnKoNjZIKqJOGXEep1uY7AUdoor/2uHkKKYpJsUlBXBqW6d
	 Umoagtn3lntDvWuktf80wIAcWnhWi0imc+d/YlyU=
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,  Miguel Ojeda <ojeda@kernel.org>,
  Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <benno.lossin@proton.me>,  Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,  Joel Becker
 <jlbec@evilplan.org>,  Christoph Hellwig <hch@lst.de>,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] rust: sync: change `<Arc<T> as
 ForeignOwnable>::PointedTo` to `T`
In-Reply-To: <20250131-configfs-v1-2-87947611401c@kernel.org> (Andreas
	Hindborg's message of "Fri, 31 Jan 2025 14:30:09 +0100")
References: <20250131-configfs-v1-0-87947611401c@kernel.org>
	<20250131-configfs-v1-2-87947611401c@kernel.org>
Date: Wed, 05 Feb 2025 21:02:27 +0100
Message-ID: <875xlop3cc.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Using `ArcInner` as `PoinedTo` in the `ForeignOwnable` implementation for
> `Arc` is a bit unfortunate. Using `T` as `PointedTo` does not remove any
> functionality, but allows `ArcInner` to be private. Further, it allows
> downstream users to write code that is generic over `Box` and `Arc`, when
> downstream users need access to `T` after calling `into_foreign`.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Bit unfortunate that we first in the patch before made it public and now
private again, but it makes sense to split patches.
Think I also found this weird when I wrote my LED patch, so this makes
a lot of sense as this is what I would expect.

Reviewed-by: Fiona Behrens <me@kloenk.dev>

>
> ---
>
> This patch is a dependency for Rust `configfs` abstractions. It allows both
> `Box` and `Arc` to be used as pointer types in the `configfs` hierarchy.
> ---
>  rust/kernel/sync/arc.rs | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index dfe4abf82c25cf18398628d9cd5345a292419351..503e318b4c4effa2f1499b6fee0944079fde99aa 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -143,7 +143,7 @@ pub struct Arc<T: ?Sized> {
>  #[doc(hidden)]
>  #[pin_data]
>  #[repr(C)]
> -pub struct ArcInner<T: ?Sized> {
> +struct ArcInner<T: ?Sized> {
>      refcount: Opaque<bindings::refcount_t>,
>      data: T,
>  }
> @@ -345,18 +345,25 @@ pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
>  
>  // SAFETY: The `into_foreign` function returns a pointer that is well-aligned.
>  unsafe impl<T: 'static> ForeignOwnable for Arc<T> {
> -    type PointedTo = ArcInner<T>;
> +    type PointedTo = T;
>      type Borrowed<'a> = ArcBorrow<'a, T>;
>      type BorrowedMut<'a> = Self::Borrowed<'a>;
>  
>      fn into_foreign(self) -> *mut Self::PointedTo {
> -        ManuallyDrop::new(self).ptr.as_ptr()
> +        let x = ManuallyDrop::new(self).ptr.as_ptr();
> +        // SAFETY: `x` is a valid pointer to `Self` so the projection below is
> +        // in bounds of the allocation.
> +        unsafe { core::ptr::addr_of_mut!((*x).data) }
>      }
>  
>      unsafe fn from_foreign(ptr: *mut Self::PointedTo) -> Self {
> +        // SAFETY: We did the reverse offset calculation in `into_foreign`, so
> +        // the offset calculation below is in bounds of the allocation.
> +        let inner_ptr = unsafe { kernel::container_of!(ptr, ArcInner<T>, data).cast_mut() };
> +
>          // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
>          // call to `Self::into_foreign`.
> -        let inner = unsafe { NonNull::new_unchecked(ptr) };
> +        let inner = unsafe { NonNull::new_unchecked(inner_ptr) };
>  
>          // SAFETY: By the safety requirement of this function, we know that `ptr` came from
>          // a previous call to `Arc::into_foreign`, which guarantees that `ptr` is valid and
> @@ -365,9 +372,13 @@ unsafe fn from_foreign(ptr: *mut Self::PointedTo) -> Self {
>      }
>  
>      unsafe fn borrow<'a>(ptr: *mut Self::PointedTo) -> ArcBorrow<'a, T> {
> +        // SAFETY: We did the reverse offset calculation in `into_foreign`, so
> +        // the offset calculation below is in bounds of the allocation.
> +        let inner_ptr = unsafe { kernel::container_of!(ptr, ArcInner<T>, data).cast_mut() };
> +
>          // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
>          // call to `Self::into_foreign`.
> -        let inner = unsafe { NonNull::new_unchecked(ptr) };
> +        let inner = unsafe { NonNull::new_unchecked(inner_ptr) };
>  
>          // SAFETY: The safety requirements of `from_foreign` ensure that the object remains alive
>          // for the lifetime of the returned value.
