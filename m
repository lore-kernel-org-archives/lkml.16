Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D982512D9;
	Wed, 30 Apr 2025 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016586; cv=none; b=SeJXoA+1sNLJaIchCD8IQ4y3UKZFCXoRNzCO+Jw/tu05annWG2vdf/FAyPnIOtnDWznH0ciILJtwkJHZWOnaebE6QVDZzYeFdYLkDZJ6Ue4pS+efuHkUlwX1SYhMiHk7BshmewUVDa9AwXgRoSJrwiFmjxcEnpFGNg8v4OqdgHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016586; c=relaxed/simple;
	bh=cFbq5SIAJSv/xT/RKflh4/UM5b0ozJSrJFYHMFaCovY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkoS4bXT2tU7j297X9UP6fLk3opG81HbXKpNxkXeP0Z8jRZoZymvxC+N/y7uudSIoYmPGD18djezEOuTeLJbXdLAAPSKS9NzXIyulBtWi6vMU22nUwtY92RE72RD8VKQEjvwm+eWYUtVFzbOw44aE0phULHfq2fS1iIB3BUjMko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkxAW8Sf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkxAW8Sf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6570C4CEE9;
	Wed, 30 Apr 2025 12:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746016586;
	bh=cFbq5SIAJSv/xT/RKflh4/UM5b0ozJSrJFYHMFaCovY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LkxAW8SfNjoe0pOWwdeeSofPgim9CHvUArIh1cA/nAhejKIVEYbnNbBQ5VASnCZaN
	 kBZeFBFIbw9tRTEuwJckaqa3jiBtRcUhFid1XOmhxzg8iHRhdrnAkC6YUpgrlydLG0
	 7hAZh0Z4no44Ir6zhHJqDxS8WomAusicsZ9fB+1zplnWs2deEghn3YxKi81pCGd451
	 0Sbt4HvRyOJKc16aAChJ/UkrU2J3CflzUtcZlP/aQgQPc6PLqXtlzE79V7Z2rVRqj0
	 /3cLw6j2xenXYFouRSUInqfmk9b0meKnOYxa72y2HKPA3IazAGxwwZaGf2qyJwg4sg
	 g1Mthd3QqVQ6w==
Date: Wed, 30 Apr 2025 14:36:22 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] rust: alloc: add Vec::insert_within_capacity
Message-ID: <aBIZRoGo5J6_rqo3@pollux>
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-7-dad4436ff82d@google.com>
 <2025042925-kindly-squash-fa6f@gregkh>
 <aBIIZ64_Wsk1unB2@google.com>
 <2025043045-overbuilt-swab-5b65@gregkh>
 <aBIUUs4AWTII2bcO@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBIUUs4AWTII2bcO@google.com>

On Wed, Apr 30, 2025 at 12:15:14PM +0000, Alice Ryhl wrote:
> On Wed, Apr 30, 2025 at 01:39:03PM +0200, Greg KH wrote:
> > On Wed, Apr 30, 2025 at 11:24:23AM +0000, Alice Ryhl wrote:
> > > On Tue, Apr 29, 2025 at 05:30:06PM +0200, Greg KH wrote:
> > > > On Tue, Apr 29, 2025 at 02:44:27PM +0000, Alice Ryhl wrote:
> > > > > This adds a variant of Vec::insert that does not allocate memory. This
> > > > > makes it safe to use this function while holding a spinlock. Rust Binder
> > > > > uses it for the range allocator fast path.
> > > > > 
> > > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > > ---
> > > > >  rust/kernel/alloc/kvec.rs | 39 +++++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 39 insertions(+)
> > > > > 
> > > > > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > > > > index 0682108951675cbee05faa130e5a9ce72fc343ba..998afdcde47bec94b2c9d990ba3afbb3488ea99e 100644
> > > > > --- a/rust/kernel/alloc/kvec.rs
> > > > > +++ b/rust/kernel/alloc/kvec.rs
> > > > > @@ -355,6 +355,45 @@ pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
> > > > >          unsafe { self.inc_len(1) };
> > > > >      }
> > > > >  
> > > > > +    /// Inserts an element at the given index in the [`Vec`] instance.
> > > > > +    ///
> > > > > +    /// Fails if the vector does not have capacity for the new element. Panics if the index is out
> > > > > +    /// of bounds.
> > > > 
> > > > Why panic and why not just return an error instead?
> > > 
> > > It's for consistency with stdlib. Illegal use is panic, expected error
> > > conditions are errors.
> > 
> > But this is the kernel, not userspace :)
> > 
> > As you can return an error, why not?  Rebooting a box should be a "last
> > resort" type of thing when you can not recover from an error.  You can
> > easily not overflow and return an error here, so why do you want to just
> > give up and cause all data to be lost?
> > 
> > And I don't see any other panics happening in this file, so would this
> > be the first one?
> 
> I don't feel strongly about this method, but it's not the first panic.
> The vector type has an indexing operator vec[i] that panics if you index
> out-of-bounds.

This is because core::ops::Index isn't fallible and even if we wouldn't
implement Index for Vec, we'd get a slice through Deref, where it is exactly the
same.

In this case though, we can easily avoid the panic by checking the index and
return an error instead, which is what we should do.
