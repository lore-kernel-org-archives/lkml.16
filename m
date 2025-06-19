Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DE520E6
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750291634; cv=none; b=VylvO4kDO7tas5Mx9+RxbbDLEwvXCtRo4w7gGB17N/futYgASX88G7VbtOSFXl9LgeeLF9HqiYZIW6tJ9vJZsQjaCcAXBjwcgTBua/3jnkJKICJRMNHS3hj3xZ6CM4uo7gQpKohImJ9B6bus29qps+lxx3G8rhjlBPttzGnitvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750291634; c=relaxed/simple;
	bh=4HxLSsI8Txzwy3Dvd34KNpbd5d2YI+f70vrm5E6ZPkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAUO9vPFfBOHacT3Eb/N1P0vhVH8ASt+fh4Fw2LvtMMcNyMVd8s+/bJ/Dw0JLLJxtuIAVdiqFT1jdPvu0+G1e9WftKPJgHVuGMbZVkn+fNvH5HlJg++Sy+pAcZls70PR03OG/tNWJhwI2ach1WUte4vItfR/WFVo7qTdAwKKzvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PWc7/Cfz; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PWc7/Cfz"
Date: Wed, 18 Jun 2025 20:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750291626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TN4LO1bJYNfPoUQFGuQUYNGEvypwOvZqTrhYfCptwc0=;
	b=PWc7/Cfz+CLd79m5ei3qSW93QKVKnoK8BebDTuty+ENe9uE/V5mAZhSUXbOiLjHyE4aSl9
	s1BkT/HIvGTYjbKAnQYZUdiBK9kHf7FHmSBkds1rZzLh1SkNBr9bHj1qz8Z3UFKDsvzjoD
	8eYjLAr3AvhdQed9aoza8hgIWNDnQNs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Zhongkun He <hezhongkun.hzk@bytedance.com>, mhocko@suse.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: rename the oldflags and parameter in
 memalloc_flags_*()
Message-ID: <p6nr56qg7vx72qvaalrvntzstyrkt7z3fytfux5nd4wlvef462@znymqow5qjsr>
References: <20250618070328.2192849-1-hezhongkun.hzk@bytedance.com>
 <20250618164334.54616cb2d70a1ee3c1f28a81@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618164334.54616cb2d70a1ee3c1f28a81@linux-foundation.org>
X-Migadu-Flow: FLOW_OUT

On Wed, Jun 18, 2025 at 04:43:34PM -0700, Andrew Morton wrote:
> On Wed, 18 Jun 2025 15:03:28 +0800 Zhongkun He <hezhongkun.hzk@bytedance.com> wrote:
> 
> > The variable name oldflags can indeed be misleading, because
> > it does not store the complete original value of flags.
> > Instead, it records which flags from the given set are not
> > currently set. So rename it.
> > 
> 
> Your email client is mangling the patches in strange ways.  Please send
> yourself a patch, figure out why it didn't apply?
> 
> > --- a/include/linux/sched/mm.h
> > +++ b/include/linux/sched/mm.h
> > @@ -322,21 +322,21 @@ static inline void might_alloc(gfp_t gfp_mask)
> >  }
> >  
> >  /**
> > - * memalloc_flags_save - Add a PF_* flag to current->flags, save old value
> > + * memalloc_flags_save - Add a PF_* flag to current->flags, return saved flags mask
> >   *
> >   * This allows PF_* flags to be conveniently added, irrespective of current
> >   * value, and then the old version restored with memalloc_flags_restore().
> >   */
> > -static inline unsigned memalloc_flags_save(unsigned flags)
> > +static inline unsigned int memalloc_flags_save(unsigned int flags_mask)
> >  {
> > -	unsigned oldflags = ~current->flags & flags;
> > -	current->flags |= flags;
> > -	return oldflags;
> > +	unsigned int saved_flags_mask = ~current->flags & flags_mask;
> > +
> > +	current->flags |= flags_mask;
> > +	return saved_flags_mask;
> >  }
> >  
> > -static inline void memalloc_flags_restore(unsigned flags)
> > +static inline void memalloc_flags_restore(unsigned int flags_mask)
> >  {
> > -	current->flags &= ~flags;
> > +	current->flags &= ~flags_mask;
> >  }
> 
> I guess so.  Maybe.  A bit.  Kent, what do you think?

Eesh, seems like pointless verbosity to me. Maybe don't change it if it
doesn't need to be changed?
