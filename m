Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11E41DF25A;
	Wed, 30 Apr 2025 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014808; cv=none; b=UeOuQ9v53E1D3xG3jibzFfD2NZpxn/GHb0/khQ77e6Xwk0TK5LRrzSN7BDrnewRaz4unyzlHdE8DtRTwCNo3AGfueYFCc8eIjvlngeqOucJTMLVp0siv7hVgMR8sP+Iow58T6mzmlvrgCvuXzLWJlcY/wZnRVjdPwp2pnffCfok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014808; c=relaxed/simple;
	bh=ggzJdcF1LEuvRLwQjRDVUR7jfw+ysM+qJp8k4pzDC+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrjHT/y7E5tHM+2Mon53h+ISnFYBu3/smH1IVHUWLTkmSrBWv/gTBC5cWF7IjjVhLnXMC4ZRa+iJF7gaebQI8n4C+q/cxNEsivbR10fHu+hL2JJBkPSXvKIzb/+9yNZ5PzvtVRMXWInlZcGy9azTgrz5zpql47t/KkpLS3PZSL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aXkosFex; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aXkosFex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5939C4CEE9;
	Wed, 30 Apr 2025 12:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746014808;
	bh=ggzJdcF1LEuvRLwQjRDVUR7jfw+ysM+qJp8k4pzDC+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXkosFex5aG+w4YePweaeBxzYDv68/FLVlp/UhflZ1Su5S4MOED3CW/b/hRaI7GOo
	 7AphoZbh4jaoIOaqCSn+id2grR4TDNqmNv7+4qE2oLyXOp4WHTT0TIArvEbkyUtUXP
	 eh2tkiuIPrUo2M0Edr0xdpwdsKO3iToXVKfVgcQY=
Date: Wed, 30 Apr 2025 13:39:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] rust: alloc: add Vec::insert_within_capacity
Message-ID: <2025043045-overbuilt-swab-5b65@gregkh>
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-7-dad4436ff82d@google.com>
 <2025042925-kindly-squash-fa6f@gregkh>
 <aBIIZ64_Wsk1unB2@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBIIZ64_Wsk1unB2@google.com>

On Wed, Apr 30, 2025 at 11:24:23AM +0000, Alice Ryhl wrote:
> On Tue, Apr 29, 2025 at 05:30:06PM +0200, Greg KH wrote:
> > On Tue, Apr 29, 2025 at 02:44:27PM +0000, Alice Ryhl wrote:
> > > This adds a variant of Vec::insert that does not allocate memory. This
> > > makes it safe to use this function while holding a spinlock. Rust Binder
> > > uses it for the range allocator fast path.
> > > 
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  rust/kernel/alloc/kvec.rs | 39 +++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 39 insertions(+)
> > > 
> > > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > > index 0682108951675cbee05faa130e5a9ce72fc343ba..998afdcde47bec94b2c9d990ba3afbb3488ea99e 100644
> > > --- a/rust/kernel/alloc/kvec.rs
> > > +++ b/rust/kernel/alloc/kvec.rs
> > > @@ -355,6 +355,45 @@ pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {
> > >          unsafe { self.inc_len(1) };
> > >      }
> > >  
> > > +    /// Inserts an element at the given index in the [`Vec`] instance.
> > > +    ///
> > > +    /// Fails if the vector does not have capacity for the new element. Panics if the index is out
> > > +    /// of bounds.
> > 
> > Why panic and why not just return an error instead?
> 
> It's for consistency with stdlib. Illegal use is panic, expected error
> conditions are errors.

But this is the kernel, not userspace :)

As you can return an error, why not?  Rebooting a box should be a "last
resort" type of thing when you can not recover from an error.  You can
easily not overflow and return an error here, so why do you want to just
give up and cause all data to be lost?

And I don't see any other panics happening in this file, so would this
be the first one?

thanks,

greg k-h
