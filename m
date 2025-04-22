Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C3529009F;
	Tue, 22 Apr 2025 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745341441; cv=none; b=d2n+FIjniOu2CmZlvvp4u3WMEENi/T++LC6hV3CDe7MWfo0YrkmH0Lsurxl5FFK0Q7He4x9eupTjKllkjB8zF0eCE1Nbo/B8W4Ted3bmspPqvq9XLGIREdDZnS/ksZ+rYA/JMTLHjD6l1FCfJsL9VkyVPxLodLL9Vhp4UMdyjXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745341441; c=relaxed/simple;
	bh=gg92JHS7VohNwxJ+w2LeTrz9szf/JSQlwhN3QdOinmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eES+kipwGvzHSZmfv4BqC/Lf3oU6lF7XYNoQt3dcQvoXCYka0qF629a0Fpw7uoMDMPjsiNHYDVZWqc0MnvcdxbRIQ0XiQ3TOSInGrFymZia7tv+9WjbQX7YaCVrk7/538MFZC8Fml1OGD/QVb62HNSNcR8ZNoS2M2oBulACxUic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZ4rhYdQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZ4rhYdQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA62EC4CEEE;
	Tue, 22 Apr 2025 17:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745341440;
	bh=gg92JHS7VohNwxJ+w2LeTrz9szf/JSQlwhN3QdOinmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZ4rhYdQYRCzbc2dMhupNmZSmu/Dhb1THJIF20ra2Q1psTOUrVz3DsWv6qBaAdVZ5
	 GPT3TRmfaSm0kAYwJGH3rxBZqdwVhFUzg5EyvS5O+U9iRs9v9fjIH7yy8aBbSLr2E2
	 sS4HAvRg1fNDATfFzyll3ojfZ7aFY8Buc6C0PDzvr/4eWJqZUv0l13p4pLR+Cs5Vro
	 ID+Z2LLbWe65MesrxCeyMsd2BpWIPU/oPmxDXteRhFqDQZRMhZt7q9l9tGMGNTxUIV
	 oy+gbDUsX8a5qjbgh60sd5tvEJGYl9TVMTb4oeKCK9VShpcxAyhvzu0f1J7RVNcAmJ
	 usdIwC/fzPv1w==
Date: Tue, 22 Apr 2025 19:03:53 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: alloc: implement `extend` for `Vec`
Message-ID: <aAfL-e6qA9oBce5t@cassiopeiae>
References: <20250406-vec_extend-v3-1-ec5c5c0acf2a@nvidia.com>
 <Z_OwmEKHgsZlt2cs@pollux>
 <D91AOKOTDXWC.7R5K5DI87QU4@nvidia.com>
 <D9C61DDI99JX.31T59XPQGYBB1@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9C61DDI99JX.31T59XPQGYBB1@nvidia.com>

On Mon, Apr 21, 2025 at 05:15:29PM +0900, Alexandre Courbot wrote:
> On Tue Apr 8, 2025 at 10:34 PM JST, Alexandre Courbot wrote:
> > On Mon Apr 7, 2025 at 8:01 PM JST, Danilo Krummrich wrote:
> >>> +    /// Extends the vector by the elements of `iter`.
> >>> +    ///
> >>> +    /// This uses [`Iterator::size_hint`] to optimize memory reallocations, but will work even with
> >>> +    /// imprecise implementations - albeit in a non-optimal way.
> >>> +    ///
> >>> +    /// This method returns an error if a memory reallocation required to accommodate the new items
> >>> +    /// failed. In this case, callers must assume that some (but not all) elements of `iter` might
> >>> +    /// have been added to the vector.
> >>> +    ///
> >>> +    /// # Note on optimal behavior and correctness
> >>> +    ///
> >>> +    /// The efficiency of this method depends on how reliable the [`Iterator::size_hint`]
> >>> +    /// implementation of the `iter` is.
> >>> +    ///
> >>> +    /// It performs optimally with at most a single memory reallocation if the lower bound of
> >>> +    /// `size_hint` is the exact number of items actually yielded.
> >>> +    ///
> >>> +    /// If `size_hint` is more vague, there may be as many memory reallocations as necessary to
> >>> +    /// cover the whole iterator from the successive lower bounds returned by `size_hint`.
> >>> +    ///
> >>> +    /// If `size_hint` signals more items than actually yielded by the iterator, some unused memory
> >>> +    /// might be reserved.
> >>> +    ///
> >>> +    /// Finally, whenever `size_hint` returns `(0, Some(0))`, the method assumes that no more items
> >>> +    /// are yielded by the iterator and returns. This may result in some items not being added if
> >>> +    /// there were still some remaining.
> >>> +    ///
> >>> +    /// In the kernel most iterators are expected to have a precise and correct `size_hint`
> >>> +    /// implementation, so this should nicely optimize out for these cases.
> >>
> >> I agree, hence I think we should enforce to be provided with a guaranteed
> >> correct size hint and simplify the code. I think we should extend the signature.
> >>
> >>      pub fn extend<I>(&mut self, iter: I, flags: Flags) -> Result<(), AllocError>
> >>      where
> >>          I: IntoIterator<Item = T>,
> >>          I::IntoIter: ExactSizeIterator,
> >>
> >> And implement ExactSizeIterator for IntoIter.
> >>
> >> The only thing that bothers me a bit is that the documentation [1] of
> >> ExactSizeIterator sounds a bit ambiguous.
> >>
> >> It says: "When implementing an ExactSizeIterator, you must also implement
> >> Iterator. When doing so, the implementation of Iterator::size_hint *must*
> >> return the exact size of the iterator."
> >>
> >> But it also says: "Note that this trait is a safe trait and as such does not and
> >> cannot guarantee that the returned length is correct. This means that unsafe
> >> code must not rely on the correctness of Iterator::size_hint. The unstable and
> >> unsafe TrustedLen trait gives this additional guarantee."
> >
> > Yeah ExactSizeIterator is not the solution to this, since it can be
> > implemented without an unsafe block and the implementer is perfectly
> > free to provide an incorrect value - so we cannot trust its result.
> >
> >>
> >> Acknowledging the latter, I think we should implement our own trait for this
> >> instead. Our own version of TrustedLen seems reasonable to me.
> >
> > That sounds reasonable and would greatly simplify the code (and remove
> > most of my fears about its optimization). Let me explore that direction.
> 
> Well, that turned out to be an interesting rabbit hole.
> 
> Leveraging the existing traits seems a bit difficult:
> 
> - `ExactSizeIterator` cannot be implemented for adapters that increase the
>   length of their iterators, because if one of them is already `usize::MAX` long
>   then the size wouldn't be exact anymore. [1]
> 
> - And `TrustedLen` cannot be implemented for adapters that make an iterator
>   shorter, because if the iterator returns more than `usize::MAX` items (i.e.
>   has an upper bound set to `None`) then the adapter can't predict the actual
>   length. [2]

Why is this a problem for the above implementation of Vec::extend()?

I just looked it up and it seems that std [1] does the same thing. Do I miss
anything?

[1] https://github.com/rust-lang/rust/blob/master/library/alloc/src/vec/spec_extend.rs#L25

> 
> So in both cases, the model breaks at the limit. OTOH, in our case we want to
> gather items into some collection, meaning that we are quite unlikely to ever
> reach that limit, as doing so would likely trigger an OOM anyway.
> 
> Which means that we need to come with our own unsafe trait
> (`ExactSizeCollectible`?), which will have its own limits. It shall only be
> used to collect things (because we are unlikely to reach a size of `usize::MAX`
> in that context), and will take the lower bound of `size_hint` at face value,
> meaning it might collect less than the whole collection if the lower bound of
> the iterator or one of its adapters ever reaches `usize::MAX`. Again in the
> context of a collection this should never happen, but it's still a limitation.
> 
> If we can live with this, then with a bit of code (because the new trait would
> need to be implemented for every iterator and adapter we want to collect out
> there) we should be able to provide an efficient, one-pass `collect()` method.
> 
> Thoughts?
> 
> [1] https://doc.rust-lang.org/std/iter/trait.ExactSizeIterator.html#when-shouldnt-an-adapter-be-exactsizeiterator
> [2] https://doc.rust-lang.org/core/iter/trait.TrustedLen.html#when-shouldnt-an-adapter-be-trustedlen
> 
