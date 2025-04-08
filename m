Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CA5265613;
	Tue,  8 Apr 2025 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107758; cv=none; b=jnvlWaskIIFQHagd3RaEDCkObIG6z11vuVAXC9hGsSwj7OUuqzOftBrsNhDqQwwLbfuVcOkEbi3tdOP8nZq49Hq1ThYlZNWMn2RQ4d0vFAhdGHpNmB48fBF3iEOmuosqxbC7/GKWxUN3EBkekolBm+R9nIihbAs566HqmoCwZZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107758; c=relaxed/simple;
	bh=V3cQ5bRoyMwcgM7mLF08yOBU/PTK+dNHItx39HNNQns=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ppwvv+jdv9ddqwU4DF9Kcq+3FL8XZGRZb+rQR35eiVfNwaKMxCH4aZjLZOje5n3IJqRK02LEH0d8lL7tn0BuHCWnrSsXoxLAgw3cwTjHnkpfYwGcsiSfG68sTNpKhsdohKQYDD5Hhj5sQ/Eml/uk2D899LLtUV7c9Sbye2U9S5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=gSIv1yaj; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="gSIv1yaj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744107752; x=1744366952;
	bh=mGzcFFy6lfiXZdQwtpUh1luUUzc8+vWLzuXWhLF2i4M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gSIv1yajqn1FCHMN3ww3W6xb0qsK9Kye7biZNNF/adM0J0zvi1NifOcPF5brRCRnT
	 2ZHC8IJjiaAQfl/mPBdzkTAfXD1iMWLzyDi2qVJT549W3dZq0P0YrcudoMfrCmyTrV
	 rCA9+Mmk/T209IusZBYaCireEH8RkXbuMdSKzfaWhub7FAOXvzcle6PWNAC5cUpWWM
	 fpVGLhMlHSO+NtXyphrRmTVCb6GgR99CLh9dqTzZovL0LNlN7pMDXX/wykzmDA/XCp
	 oqIAILB8qVNw8eMDitrbwT3MILZaQVOeEOzCkaIp/k/reNdsVM27qoepWjf9+1yN6k
	 e+MnvODu1EgCg==
Date: Tue, 08 Apr 2025 10:22:29 +0000
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: allow coercion from `Box<T>` to `Box<dyn U>` if T implements U
Message-ID: <D916LG7Z9Q31.5RVNMYM38E2D@proton.me>
In-Reply-To: <20250408-box_trait_objs-v1-1-58d8e78b0fb2@nvidia.com>
References: <20250408-box_trait_objs-v1-1-58d8e78b0fb2@nvidia.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: c1194c8ce7c748279cd354ff1ab10801679547aa
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue Apr 8, 2025 at 7:18 AM CEST, Alexandre Courbot wrote:
> This enables the creation of trait objects backed by a Box, similarly to
> what can be done with the standard library.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> From this discussion on Zulip [1].
>
> Heavily inspired from the similar feature on `Arc`.
>
> [1] https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topi=
c/Trait.20objects.3F/with/510689662
> ---
>  rust/kernel/alloc/kbox.rs | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index b77d32f3a58bab5ec73c612bdaaba0d79bfdff65..969b9f9fd3149685e1d1ecdf1=
eed9c647c887397 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -32,6 +32,8 @@
>  ///
>  /// When dropping a [`Box`], the value is also dropped and the heap memo=
ry is automatically freed.
>  ///
> +/// [`Box`]es can also be used to store trait objects by coercing their =
type.
> +///
>  /// # Examples
>  ///
>  /// ```
> @@ -62,7 +64,17 @@
>  /// `self.0` is always properly aligned and either points to memory allo=
cated with `A` or, for
>  /// zero-sized types, is a dangling, well aligned pointer.
>  #[repr(transparent)]
> -pub struct Box<T: ?Sized, A: Allocator>(NonNull<T>, PhantomData<A>);
> +#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, derive(core::marker::CoerceP=
ointee))]
> +pub struct Box<#[pointee] T: ?Sized, A: Allocator>(NonNull<T>, PhantomDa=
ta<A>);
> +
> +// This is to allow coercion from `Box<T>` to `Box<U>` if `T` can be con=
verted to the
> +// dynamically-sized type (DST) `U`.
> +#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
> +impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::CoerceUn=
sized<Box<U>> for Box<T> {}

You forgot to add the `A: Allocator` generic here and in the impl below.

---
Cheers,
Benno

> +
> +// This is to allow `Box<U>` to be dispatched on when `Box<T>` can be co=
erced into `Box<U>`.
> +#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
> +impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::Dispatch=
FromDyn<Box<U>> for Box<T> {}
> =20
>  /// Type alias for [`Box`] with a [`Kmalloc`] allocator.
>  ///
>
> ---
> base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
> change-id: 20250408-box_trait_objs-02a700401f0b
>
> Best regards,


