Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F068F3085D4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750306613; cv=none; b=BKWZeaEv8OtuJjgdALkboAvcqLnPKrmWJNG6VKnyDM434YXMpg6vRt6eGv2ZxcXdQHPxH0lapxKz9k6yOMBXxOdL5sIgKUlf5kC2h6Y+faKPryGWF1jU89OixicKwgLVzpNvu7jIJMUO3ckWanImkdJwiUrnf/bDQJEPPEkSrfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750306613; c=relaxed/simple;
	bh=eBiZtIBM2AzoVqqwcF2dshVCH1BG/6Y83/VbqTV149c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuwIuJG1DeXo7CMw/U/d1GpetGAR8HYeO42NKN3rgvP3TgMgKBeKZwNf7lXBNa4B79coWACNUT2a0QZ48Tq4fM7DoJqE2bFe1OnYqHRmkzb5cK1x1EmYnNWdMGoy69Bkih8yV9lrSj1aS5EkeoQYvbGcDFXwOK++tnOI6B4lbS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XWBhB/oC; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XWBhB/oC"
Date: Thu, 19 Jun 2025 00:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750306608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jLkDzHDT1DpdO9SvwjUVcY89+HsbQoXPc++y60o2jdw=;
	b=XWBhB/oCx8Xq0M2997Dmmqy/lPiH9P1wDkClwlGxOwFsMgqwkQLi99Thsv4IpmyKlYbrTQ
	fZJBNz2w17VkoUi1rJYs6jaX65Paze7olS8Q8U84di4faPvxawpvP5lPBkWToxVRnkR5rB
	JSmOkjEMkzRGmpU9yMVWqHhGdxt5rlY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, mhocko@suse.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH] mm: rename the oldflags and parameter in
 memalloc_flags_*()
Message-ID: <ig5wtmtownn5sebhqeugleb7ns5nf6wgmrbbzgev7henhujhsm@chsmrubxszrq>
References: <20250618070328.2192849-1-hezhongkun.hzk@bytedance.com>
 <20250618164334.54616cb2d70a1ee3c1f28a81@linux-foundation.org>
 <p6nr56qg7vx72qvaalrvntzstyrkt7z3fytfux5nd4wlvef462@znymqow5qjsr>
 <CACSyD1P5ksZHHRZwCr48gDVv9Wt9hXfX9PcXqrd5MpDRJkdzHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSyD1P5ksZHHRZwCr48gDVv9Wt9hXfX9PcXqrd5MpDRJkdzHA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Jun 19, 2025 at 11:17:58AM +0800, Zhongkun He wrote:
> On Thu, Jun 19, 2025 at 8:07 AM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
> >
> > On Wed, Jun 18, 2025 at 04:43:34PM -0700, Andrew Morton wrote:
> > > On Wed, 18 Jun 2025 15:03:28 +0800 Zhongkun He <hezhongkun.hzk@bytedance.com> wrote:
> > >
> > > > The variable name oldflags can indeed be misleading, because
> > > > it does not store the complete original value of flags.
> > > > Instead, it records which flags from the given set are not
> > > > currently set. So rename it.
> > > >
> > >
> > > Your email client is mangling the patches in strange ways.  Please send
> > > yourself a patch, figure out why it didn't apply?
> > >
> > > > --- a/include/linux/sched/mm.h
> > > > +++ b/include/linux/sched/mm.h
> > > > @@ -322,21 +322,21 @@ static inline void might_alloc(gfp_t gfp_mask)
> > > >  }
> > > >
> > > >  /**
> > > > - * memalloc_flags_save - Add a PF_* flag to current->flags, save old value
> > > > + * memalloc_flags_save - Add a PF_* flag to current->flags, return saved flags mask
> > > >   *
> > > >   * This allows PF_* flags to be conveniently added, irrespective of current
> > > >   * value, and then the old version restored with memalloc_flags_restore().
> > > >   */
> > > > -static inline unsigned memalloc_flags_save(unsigned flags)
> > > > +static inline unsigned int memalloc_flags_save(unsigned int flags_mask)
> > > >  {
> > > > -   unsigned oldflags = ~current->flags & flags;
> > > > -   current->flags |= flags;
> > > > -   return oldflags;
> > > > +   unsigned int saved_flags_mask = ~current->flags & flags_mask;
> > > > +
> > > > +   current->flags |= flags_mask;
> > > > +   return saved_flags_mask;
> > > >  }
> > > >
> > > > -static inline void memalloc_flags_restore(unsigned flags)
> > > > +static inline void memalloc_flags_restore(unsigned int flags_mask)
> > > >  {
> > > > -   current->flags &= ~flags;
> > > > +   current->flags &= ~flags_mask;
> > > >  }
> > >
> > > I guess so.  Maybe.  A bit.  Kent, what do you think?
> >
> > Eesh, seems like pointless verbosity to me. Maybe don't change it if it
> > doesn't need to be changed?
> 
> Hi Kent, thanks for your feedback.
> How about this version,  only change the 'old' to 'saved'.
> The function does not return the old current->flags value. Instead,
> it returns the subset of flags that were not previously set in current->flags,
> so they can later be cleared by memalloc_flags_restore(). The name savedflags
> makes this behavior clearer and avoids confusion.

Why change it at all? The returned flags parameter is opaque state that
should only be used by memalloc_flags_restore(), it's not something the
caller should be looking at.

> 
>  /**
> - * memalloc_flags_save - Add a PF_* flag to current->flags, save old value
> + * memalloc_flags_save - Add a PF_* flag to current->flags, return saved flags
>   *
>   * This allows PF_* flags to be conveniently added, irrespective of current
>   * value, and then the old version restored with memalloc_flags_restore().
>   */
>  static inline unsigned memalloc_flags_save(unsigned flags)
>  {
> -       unsigned oldflags = ~current->flags & flags;
> +       unsigned savedflags = ~current->flags & flags;
>         current->flags |= flags;
> -       return oldflags;
> +       return savedflags;
>  }
> 
> Thanks,
> Zhongkun
