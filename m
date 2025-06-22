Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BB42EAE5;
	Sun, 22 Jun 2025 21:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750626490; cv=none; b=aSW8pWFWar9Kuf9M84nyVGh1YYWa3HJ4g06dSOwTcdmQ96NbUwJYVK1MIeyB0rho7SiVNKMm0/ralnWQQiGMXeG+zQN+g0qL7vNMkGP9jLzWI+2WP3F7VtFqeOu+WW5iO2dTaxkkJyj9Y09TxVjFUngu8v4sx1oLKua5VCA7sAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750626490; c=relaxed/simple;
	bh=/W1aBYrMwQQlNTZFuqdP4QSCvuY6Ruw1Pb+qc73m1zc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tyO300v3V/8oxvmItSh5L0RuX+0sQpQ14Odno+Vm/fhbWdkbql8JUz9TT066OkOEGqU4Tx8e4v7ynuYQ6XMPSSfifWe0SSiDWq1Dsfwgm1dLPwhLN6KO85Gr6P+vw5EFEQUgfQhkURRjzx3czgFdkVkXUWUUvsmTjspfbGQRotk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+NFQ2f9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+NFQ2f9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28691C4CEE3;
	Sun, 22 Jun 2025 21:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750626490;
	bh=/W1aBYrMwQQlNTZFuqdP4QSCvuY6Ruw1Pb+qc73m1zc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=t+NFQ2f9ELuwgUwa9bSd1f3djf7CJ+lkcEh9vwcW2bm4IZYG8+oTLhmB5KwBloEBV
	 GyMvLLb82Mv5VQw7OJbmKJyPmcSFsgXo71q0RAQHeLij1uXeDh2CixEKJAhhzCzdma
	 KioFjN4SHQTuYvgNgyaKdxxohdxq9YCg7NBu8YVCFFKRt+yukoMCuJgQrf+zhIxNO5
	 aQpRasM4SxTfzTjqiB/TEYdWstCsFXTrbyYpY+MpXebB1+/HdTHrSL5x7RwJGhO5ot
	 xGFcwoW9BIqFgzWXTlaZPQcNaO9eZ/UGPntslsRa32iOM9VDiHdXggWa5jMQpSeYwy
	 UK4Eu1ITJ91Jw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 23:08:05 +0200
Message-Id: <DATDAOYC60S9.2MEZ4NHCUHNXO@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/5] rust: convert `Arc` to use `Refcount`
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Will Deacon" <will@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Mark Rutland"
 <mark.rutland@arm.com>, "Tamir Duberstein" <tamird@gmail.com>, "Xiangfei
 Ding" <dingxiangfei2009@gmail.com>, "Alex Mantel"
 <alexmantel93@mailbox.org>
X-Mailer: aerc 0.20.1
References: <20250622125802.3224264-1-gary@kernel.org>
 <20250622125802.3224264-4-gary@kernel.org>
In-Reply-To: <20250622125802.3224264-4-gary@kernel.org>

On Sun Jun 22, 2025 at 2:57 PM CEST, Gary Guo wrote:
> @@ -428,14 +422,10 @@ fn as_ref(&self) -> &T {
> =20
>  impl<T: ?Sized> Clone for Arc<T> {
>      fn clone(&self) -> Self {
> -        // SAFETY: By the type invariant, there is necessarily a referen=
ce to the object, so it is
> -        // safe to dereference it.
> -        let refcount =3D unsafe { self.ptr.as_ref() }.refcount.get();
> -
> -        // INVARIANT: C `refcount_inc` saturates the refcount, so it can=
not overflow to zero.
> +        // INVARIANT: `Refcount` saturates the refcount, so it cannot ov=
erflow to zero.
>          // SAFETY: By the type invariant, there is necessarily a referen=
ce to the object, so it is
>          // safe to increment the refcount.
> -        unsafe { bindings::refcount_inc(refcount) };
> +        unsafe { self.ptr.as_ref().refcount.inc() };

The `.refcount.inc()` can be outside of the `unsafe` block.

> =20
>          // SAFETY: We just incremented the refcount. This increment is n=
ow owned by the new `Arc`.
>          unsafe { Self::from_inner(self.ptr) }
> @@ -444,16 +434,10 @@ fn clone(&self) -> Self {
> =20
>  impl<T: ?Sized> Drop for Arc<T> {
>      fn drop(&mut self) {
> -        // SAFETY: By the type invariant, there is necessarily a referen=
ce to the object. We cannot
> -        // touch `refcount` after it's decremented to a non-zero value b=
ecause another thread/CPU
> -        // may concurrently decrement it to zero and free it. It is ok t=
o have a raw pointer to
> -        // freed/invalid memory as long as it is never dereferenced.
> -        let refcount =3D unsafe { self.ptr.as_ref() }.refcount.get();
> -
>          // INVARIANT: If the refcount reaches zero, there are no other i=
nstances of `Arc`, and
>          // this instance is being dropped, so the broken invariant is no=
t observable.
> -        // SAFETY: Also by the type invariant, we are allowed to decreme=
nt the refcount.
> -        let is_zero =3D unsafe { bindings::refcount_dec_and_test(refcoun=
t) };
> +        // SAFETY: By the type invariant, there is necessarily a referen=
ce to the object.
> +        let is_zero =3D unsafe { self.ptr.as_ref().refcount.dec_and_test=
() };

Ditto.

>          if is_zero {
>              // The count reached zero, we must free the memory.
>              //
> @@ -747,8 +731,7 @@ pub fn new_uninit(flags: Flags) -> Result<UniqueArc<M=
aybeUninit<T>>, AllocError>
>          // INVARIANT: The refcount is initialised to a non-zero value.
>          let inner =3D KBox::try_init::<AllocError>(
>              try_init!(ArcInner {
> -                // SAFETY: There are no safety requirements for this FFI=
 call.
> -                refcount: Opaque::new(unsafe { bindings::REFCOUNT_INIT(1=
) }),
> +                refcount: Refcount::new(1),
>                  data <- pin_init::uninit::<T, AllocError>(),
>              }? AllocError),
>              flags,
> diff --git a/rust/kernel/sync/refcount.rs b/rust/kernel/sync/refcount.rs
> index a0fc22f6d645..8e7b9b0c1979 100644
> --- a/rust/kernel/sync/refcount.rs
> +++ b/rust/kernel/sync/refcount.rs
> @@ -71,6 +71,14 @@ pub fn dec(&self) {
>      /// must come after.
>      ///
>      /// Returns true if the resulting refcount is 0, false otherwise.
> +    ///
> +    /// # Notes
> +    ///
> +    /// A common pattern of using `Refcount` is to free memory when the =
reference count reaches
> +    /// zero. This means that the reference to `Refcount` could become i=
nvalid after calling this
> +    /// function. This is fine as long as the reference to `Refcount` is=
 no longer used when this
> +    /// function returns `false`. It is not necessary to use raw pointer=
s in this scenario, see
> +    /// https://github.com/rust-lang/rust/issues/55005.

This should be in patch 1?

---
Cheers,
Benno

>      #[inline]
>      #[must_use =3D "use `dec` instead if you do not need to test if it i=
s 0"]
>      pub fn dec_and_test(&self) -> bool {

