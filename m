Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025A12701CD;
	Wed, 23 Apr 2025 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401679; cv=none; b=LMwPSvMpAgUO03cr8m+w6gdPD64H6UnFCBNeb6aICPIQ3AZSaMpRGv1R/W2PnqEHo9x+1Z0xHdPXKeXGpxi0uhaCZktQ8ZMiWZSUFGmFsqBo8mskqSezujKEivvS+DYOAFkee525vdYbUgfxGLHggGdtZ5vJzfz1JRG9d2XmSHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401679; c=relaxed/simple;
	bh=PqYJq9oZkOdQmkfiQj9hyoOPAeTJSuyzDq9FSEgRuyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZzWcccrHXLcxAIjUoEBkObIujh8xOu2upPvCv5UMpeJdb6ALLG25mJiS8iwbOkfmW+WlX18txogsjkdDlm/qzEw+YBWbCht60c1lhVETDmY2OOo24jkBDlGinwqYAk6Eehc0euTjG9c1SAlZYOnwWfpxDd/yeqmI51dDybj+V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJlCsg/R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJlCsg/R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998A9C4CEE2;
	Wed, 23 Apr 2025 09:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745401678;
	bh=PqYJq9oZkOdQmkfiQj9hyoOPAeTJSuyzDq9FSEgRuyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJlCsg/RL/e7DuGGd/o/8Q3m92BsIntu3KEKbc3IV9EQcodmIn1VeWuj5HAPgRbXI
	 L/lHN5f2XsxrH3LGU5h0kgoZ9awidUoxIPtqs+kQT2cQj/LZcPaIGmtqR5UEre1Eic
	 cHBIYHMPSla8doMO7wRmqcEad7eHg/TS4KgMAnDh9+gKVseT688fh4kBX3WmOxiGEQ
	 qPdtcvLowJ9ni2GD/x6LF7JAZn2t+T7Mz4Yxf43UjTnsTCk8WWMthR9pQnpD9DDD+6
	 5X15pmjWK8tb3nR+Y5XaybvmBb9ZBHcGNUbjRhMa0d7WOgVQxjwEgAmjrVGZsK056Y
	 GFgva7SNBbqnA==
Date: Wed, 23 Apr 2025 11:47:52 +0200
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
Message-ID: <aAi3SMn2MgGv8eWB@pollux>
References: <20250406-vec_extend-v3-1-ec5c5c0acf2a@nvidia.com>
 <Z_OwmEKHgsZlt2cs@pollux>
 <D91AOKOTDXWC.7R5K5DI87QU4@nvidia.com>
 <D9C61DDI99JX.31T59XPQGYBB1@nvidia.com>
 <aAfL-e6qA9oBce5t@cassiopeiae>
 <D9DM3AR3FUAF.6JSNSB9WAJ4T@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9DM3AR3FUAF.6JSNSB9WAJ4T@nvidia.com>

On Wed, Apr 23, 2025 at 10:02:58AM +0900, Alexandre Courbot wrote:
> On Wed Apr 23, 2025 at 2:03 AM JST, Danilo Krummrich wrote:
> >> Well, that turned out to be an interesting rabbit hole.
> >> 
> >> Leveraging the existing traits seems a bit difficult:
> >> 
> >> - `ExactSizeIterator` cannot be implemented for adapters that increase the
> >>   length of their iterators, because if one of them is already `usize::MAX` long
> >>   then the size wouldn't be exact anymore. [1]
> >> 
> >> - And `TrustedLen` cannot be implemented for adapters that make an iterator
> >>   shorter, because if the iterator returns more than `usize::MAX` items (i.e.
> >>   has an upper bound set to `None`) then the adapter can't predict the actual
> >>   length. [2]
> >
> > Why is this a problem for the above implementation of Vec::extend()?
> >
> > I just looked it up and it seems that std [1] does the same thing. Do I miss
> > anything?
> >
> > [1] https://github.com/rust-lang/rust/blob/master/library/alloc/src/vec/spec_extend.rs#L25
> 
> The problem I see is that if you try and do something like:
> 
>   vec.extend((0..10).into_iter().skip(2));
> 
> with the standard library, then the use of `skip` will remove the
> `TrustedLen` implementation from the resulting iterator

Skip implements TrustedLen, no?

> and
> `extend_desugared` will be called instead of `extend_trusted`, which
> could add some unwanted (and unexpected) overhead.
> 
> If we want an implementation of `extend` as simple as "confidently
> increase the length of the vector and copy the new items into it, once",
> then we need a trait that can be implemented on both shrinking and
> extending adapters. Anything else and we might trick the caller into a
> code path less efficient than expected (i.e. my original version, which
> generates more core even for the obvious cases that are `extend_with`
> and `extend_from_slice`). Or if we rely on `TrustedLen` solely in the
> kernel, then `extend` could not be called at all with this particular
> iterator.

I think you can't solve all problems within this single function, since other
than std we don't have spcialization.

So, if we need both the fastpath and the slowpath it needs to be separate
methods unfortunately. I'd rather stick to the fastpath for now. Unless you have
a specific use-case for something else?

> There is also the fact that `TrustedLen` is behind a nightly feature,
> which I guess is another obstacle for using it.

Yeah, I think we have to implement our own TrustedLen trait for this reason and
add the corresponding impls. However, if we can come up with a marker trait that
deviates in requirements and guarantees from std, but is a better fit for the
kernel, I'm fine exploring this direction too.
