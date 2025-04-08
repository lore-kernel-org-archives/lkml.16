Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCB8143748;
	Tue,  8 Apr 2025 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117400; cv=none; b=ZDBNFv8eGc1nHAvYBtx/Nof+wp2lPa4oGOqFx9tQjPlDytBd/Juu/8nBTBIwkVjr/ZLpFBI4Ou2o+MSKzG0VEOLqpGS6hAHbWqi2o2NbL3yTutByWFIKp6PFvU3wiuW3kPrS12K2/Dc/Gvw2y2rsYhcjUk4d/E0df4Emz/OqEu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117400; c=relaxed/simple;
	bh=i5lzPszOX5TlxHXFgvYFZXXWKRvrNOTdCUU9Av4MGAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JG78nKR8TFBwUdJIT0VoDouDhz4H1/npAqfU7S/eS5xzbn2wiV2FiK/3MKdFfcNDFvk+zRqlSPp+iX7F0nU/0KE1OYAjkBCHt0aZYmg1svV7NsykrPTkl/giwiu+OCKFu/eQ4od6LEjLI6DsD/1GPJI8MugCB8HLYB+/iT27zEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHDvtdyx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHDvtdyx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40CBC4CEE5;
	Tue,  8 Apr 2025 13:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744117399;
	bh=i5lzPszOX5TlxHXFgvYFZXXWKRvrNOTdCUU9Av4MGAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kHDvtdyx6nWmdIeuZCRw0GMcXpvDP5IDGjxPaWA8E773uexYzPWiVyfV5VGQHoyEs
	 b84VNWPZ+DQFLQ94CuLPVtNC27tAdhYbWm3Yi8jz4B+EnwQlrqdj+XmyrI9EohKzll
	 rXnDl3sGgBiC1xAk9vUxtMgXuXMZ7f05a3I67N8FjgPxSBaGanCD5E5PzTu18VzIVp
	 y10YEJu9zT+qCf1sfEeSsQQ1nU+HFIsygXX6eGdyk/MIaJifxWl4pYSNT18m/y4l3d
	 MIFhC6SHoq+i2br+8UF4D2xN29bRo7TxtE2qso3p1NKuXuJ9GqBtsznxOX8zYkFbd6
	 vzxWL/gdvW6RQ==
Date: Tue, 8 Apr 2025 15:03:13 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: allow coercion from `Box<T>` to `Box<dyn
 U>` if T implements U
Message-ID: <Z_UekWa9F8w_tmuy@pollux>
References: <20250408-box_trait_objs-v1-1-58d8e78b0fb2@nvidia.com>
 <D916LG7Z9Q31.5RVNMYM38E2D@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D916LG7Z9Q31.5RVNMYM38E2D@proton.me>

On Tue, Apr 08, 2025 at 10:22:29AM +0000, Benno Lossin wrote:
> On Tue Apr 8, 2025 at 7:18 AM CEST, Alexandre Courbot wrote:
> > This enables the creation of trait objects backed by a Box, similarly to
> > what can be done with the standard library.
> >
> > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> > ---
> > From this discussion on Zulip [1].
> >
> > Heavily inspired from the similar feature on `Arc`.
> >
> > [1] https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topic/Trait.20objects.3F/with/510689662
> > ---
> >  rust/kernel/alloc/kbox.rs | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> > index b77d32f3a58bab5ec73c612bdaaba0d79bfdff65..969b9f9fd3149685e1d1ecdf1eed9c647c887397 100644
> > --- a/rust/kernel/alloc/kbox.rs
> > +++ b/rust/kernel/alloc/kbox.rs
> > @@ -32,6 +32,8 @@
> >  ///
> >  /// When dropping a [`Box`], the value is also dropped and the heap memory is automatically freed.
> >  ///
> > +/// [`Box`]es can also be used to store trait objects by coercing their type.
> > +///
> >  /// # Examples
> >  ///
> >  /// ```
> > @@ -62,7 +64,17 @@
> >  /// `self.0` is always properly aligned and either points to memory allocated with `A` or, for
> >  /// zero-sized types, is a dangling, well aligned pointer.
> >  #[repr(transparent)]
> > -pub struct Box<T: ?Sized, A: Allocator>(NonNull<T>, PhantomData<A>);
> > +#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, derive(core::marker::CoercePointee))]
> > +pub struct Box<#[pointee] T: ?Sized, A: Allocator>(NonNull<T>, PhantomData<A>);
> > +
> > +// This is to allow coercion from `Box<T>` to `Box<U>` if `T` can be converted to the
> > +// dynamically-sized type (DST) `U`.
> > +#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
> > +impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::CoerceUnsized<Box<U>> for Box<T> {}
> 
> You forgot to add the `A: Allocator` generic here and in the impl below.

Nit: Please use a where clause instead; I think it reads better and conforms
with the style of the rest of the file.
