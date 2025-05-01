Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE706223710;
	Thu,  1 May 2025 11:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099246; cv=none; b=F+BCq9MsE4lRgTuC0qFL2kGCgVTbUF6NoqJ/uP5aKS/38C4zO2nuw0nZ+RWgjBVM5Vrd+Gczi4eRU3sk9J+GNa0W5iuMIQd7gXDH8knRS4rbjQalf+XsOxlQKZBwRtd+UXLMr8C7zuOjkH1ac4LKbAvRK5MCOt/8b6u8KQpC6j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099246; c=relaxed/simple;
	bh=MBSsfnpLazFvp18QOe8QQkxjGOkZ0vk0UOps61hYRlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFZzn/Nz4nRuIKRjQJtF7WVHAZh9/rnv4cmRmtwJ/8H7+7EHWUAAbKaNFxUcax1CkVSRYhi+F98c5Zu6moRztBzEyDrXb/jhoJTj4+CE/ya4ifTXEdw4mSrKQgRTQhsOPUk7UVEoAEFLE/DZSST80gWtcxO1tE+lcaLZDRwu/jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vs/C/zHh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vs/C/zHh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23109C4CEE4;
	Thu,  1 May 2025 11:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746099245;
	bh=MBSsfnpLazFvp18QOe8QQkxjGOkZ0vk0UOps61hYRlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vs/C/zHhez/7QBo2fGkFZ/1i8WlCGbG3I7xdHhU6QbI6NuqQLT3Y/mt/9ZqhOnoP2
	 02Lt26IvbIRC6JwuhcwQQ+nSbGiW10tKZ3M7QUgZPh17onR3zB2ofmy+OL3zYx6uC+
	 nbwcmyEtzSWzbXc6C6nF2qXBYW3TSt0I8dU4dj/8Jehnp+LnoagX3gv6s0SQPa9nFG
	 2TKRT4NV5w7+aNsv98O4Gv7PNXw/9a8ovjphpAxgr+A05x81Et891L1gUFQoyFGbRm
	 UI494g/qiHrY7M5es7jaODkt5whM7PPjn3Ko+qCDuB6WuDjTeDxRslO3pFbbIgduvW
	 s0GfEGN/9RLwQ==
Date: Thu, 1 May 2025 13:34:01 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH v4 3/7] rust: alloc: add Vec::push_within_capacity
Message-ID: <aBNcKcS_U_kMOAxu@pollux>
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-3-dad4436ff82d@google.com>
 <aBJC_Ef1lKHNx4dv@pollux>
 <aBNU-XsWZLZtlmOo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBNU-XsWZLZtlmOo@google.com>

On Thu, May 01, 2025 at 11:03:21AM +0000, Alice Ryhl wrote:
> On Wed, Apr 30, 2025 at 05:34:20PM +0200, Danilo Krummrich wrote:
> > On Tue, Apr 29, 2025 at 02:44:23PM +0000, Alice Ryhl wrote:
> > > 
> > > +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> > > +    ///
> > > +    /// Fails if the vector does not have capacity for the new element.
> > > +    ///
> > > +    /// # Examples
> > > +    ///
> > > +    /// ```
> > > +    /// let mut v = KVec::with_capacity(10, GFP_KERNEL)?;
> > > +    /// for i in 0..10 {
> > > +    ///     v.push_within_capacity(i).unwrap();
> > 
> > I'd prefer to make this
> > 
> > 	v.push_within_capacity(i).map_err(|_| ENOMEM)?;
> > 
> > instead.
> 
> Perhaps we could make a new error type for `push_within_capacity`? That
> way, you can use it with question mark directly, and you also get a
> proper error message if you unwrap() it.

Generally, that sounds good to me. However, I'd like to avoid unwrap() or
anything that panics from doctests, since they also serve as sample code. Hence,
I think we should showcase how to do things the correct way (as much as
possible).

> > > +    /// }
> > > +    ///
> > > +    /// assert!(v.push_within_capacity(10).is_err());
> > > +    /// # Ok::<(), Error>(())
> > > +    /// ```
> > > +    pub fn push_within_capacity(&mut self, v: T) -> Result<(), T> {
> > > +        if self.len() < self.capacity() {
> > > +            // SAFETY: The length is less than the capacity.
> > > +            unsafe { self.push_within_capacity_unchecked(v) };
> > > +            Ok(())
> > > +        } else {
> > > +            Err(v)
> > > +        }
> > > +    }
> > >  
> > > +    /// Appends an element to the back of the [`Vec`] instance without reallocating.
> > > +    ///
> > > +    /// # Safety
> > > +    ///
> > > +    /// The length must be less than the capacity.
> > 
> > NIT: Maybe be more specific and say:
> > 
> > "`self.len()` must be less than `self.capacity()`."
> 
> I try to avoid starting sentences with code, but I can do it if you
> prefer that. But saying "the length" and "the capacity" does not seem
> ambiguous to me.

I'll leave that up to you. :)
