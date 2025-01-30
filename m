Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666DB139B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738207282; cv=none; b=tVnUiwSjeWUfMe3h2nbPC9xWw6dWFUp4PeRNaQhj3UCxdPKY1/rkiA7x5IP6+P7xlys3+eoomrqLlG5iO+yZrKA3Z0lZWJjyAPfnzfbtFWuLVd19LXQMsGJlAYcG384P+hVC/6Lly3g7x4iFoRv6l6EqwTgo92GXQupL1knrqvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738207282; c=relaxed/simple;
	bh=833m0TONNKz2uaQ8J4FnS7DL1U7EyJEVS6iVDnZ1CQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHL0cdCXGoECOik87rR0IiYhOB8YCOWTKSRhsN6tTn+Rizr8+5NgmSXwkzY+DlP5yeSx1Ge1DdY4yOsPzmbKrb4kmUjxzYW96z9WtNAZfIoCArhIiRmM86qYssVmNAToUcwr/ePf8EPEdgYKYZR7o8TWof5ZUb7V77k9g73Q4M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NaP2tBsS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NaP2tBsS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21619108a6bso4329205ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 19:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738207280; x=1738812080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8LFwMbEdYeenrWulReSvIxHvIEZ86bGfQIBWhk4yajU=;
        b=NaP2tBsS3TtG34eGMUr5EgG6PGGEqfX0a2Pxjkt7chs6RRvWDcWkX6z7gpRul1R+oG
         Z8QQrfXkHkxzBltufXk/Fj2A7/N2ORTMf5lRrYrmeGyH0l7LCrqZK/TTksc9QqFzhVoo
         ndz9sS0br8Aj6kZQY/3nTLGgh8jDF1uxxg8/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738207280; x=1738812080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LFwMbEdYeenrWulReSvIxHvIEZ86bGfQIBWhk4yajU=;
        b=VrlNPUNBXT6QoiRqSB/3uAfQfaKrUcuF30i/iPU833VFuj/IqJEzNc4raLCf4hJy4A
         Cqrc4DdJPLJ3dug1+LQidq+7gYkeOSBEz0HkOBQ/HRQZTGO2c51G+VhV4Z6FCp++2AnZ
         BiBIoAPmiZz3RG8ovWdzuvLPl0aRqIVbWwvnulmCG8+FqmrXA2Hmjkmh5Nze3hgFgqx/
         HyhnGrH/yzxnR4U94R+MsnzNqDolxXntdTwPGwB54dmjbF+4rA9L5nSsfmjy2eQtrCMm
         IQx/B+tVb0hDpNMv7ZluNfiJZ/mDwUhusHEOapaMw6Mck9AJBiazcFvXDo+nNlGZiXIP
         fKgw==
X-Forwarded-Encrypted: i=1; AJvYcCVdhgAQHY0aPEW1cwRJYWNZMPcXso3e2jgBKA2ZfJMLxjfiTszwcR/5QoIBM/u4V5ZGA2gQGJDmMko1/ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YztQlJjCZq8i5xOf6Z2VUU36cnQYMwYXy0qGH6rKk98kfOiPeh0
	GlwQLh4RO1FN/0n5eibLkFw6GFsiT6Zm0rrDOazjiefEZRwqpk0cDd+0uLkn1g==
X-Gm-Gg: ASbGncuEBIJTw3Yj/xASsraG7letsjBAJ49AslFGkIpaAIX9I9jhK9NBpZ1Z/W0Ojbt
	tDukeX7LcDTEB4SdfPMUGDX0l+IkAGvp+LXJPLqSJlHGiqUBQ5uMM/Im7B8mx4i3XmTi4yefRW7
	4VsqFYE461nUG7mDMJcu/ixpRk7G2Dmm5Yoe1ct9KYTSItmbvQTehu3318hOuu5ktF39viuojGn
	Ig5Qy1aFGbrlxJl5JCOW4G5k+7niKPYUksebEB1o85uKENegusawgsrc0UQwsG5YsLj3jyCYmwh
	HaUz/TaECwfbB9KpzOI=
X-Google-Smtp-Source: AGHT+IGCVAO7sy+stGRd4OaRulYCU1tHhr1fCPxXx6dky7QdPIH1J9SteiQhQlAN7tDgfLKzNK5J5g==
X-Received: by 2002:a17:902:fc4e:b0:216:2bd7:1c49 with SMTP id d9443c01a7336-21dd7d7bfb8mr98669585ad.29.1738207280645;
        Wed, 29 Jan 2025 19:21:20 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:d794:9e7a:5186:857e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ede21sm3581955ad.27.2025.01.29.19.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 19:21:20 -0800 (PST)
Date: Thu, 30 Jan 2025 12:21:14 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv1 4/6] zsmalloc: introduce new object mapping API
Message-ID: <4slya4kbgfvkvlgkvwep2cgghs233lfhfpctfrrgvho4fpgzwr@cjp643bd4ml6>
References: <20250129064853.2210753-1-senozhatsky@chromium.org>
 <20250129064853.2210753-5-senozhatsky@chromium.org>
 <Z5pl6OOVcb_rsgTC@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5pl6OOVcb_rsgTC@google.com>

On (25/01/29 17:31), Yosry Ahmed wrote:
> On Wed, Jan 29, 2025 at 03:43:50PM +0900, Sergey Senozhatsky wrote:
[..]
> > The old API will stay around until the remaining users switch
> > to the new one.  After that we'll also remove zsmalloc per-CPU
> > buffer and CPU hotplug handling.
> 
> I will propose removing zbud (in addition to z3fold) soon. If that gets
> in then we'd only need to update zpool and zswap code to use the new
> API. I can take care of that if you want.

Sounds like a plan.  I think I saw zbud deprecation patch (along with z3fold
removal).  I guess you still want to keep zpool, just because it's there
already?

> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> I have a couple of questions below, but generally LGTM:
> 
> Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>

Thanks.

[..]
> > +void zs_obj_read_end(struct zs_pool *pool, unsigned long handle,
> > +		     void *handle_mem);
> > +void *zs_obj_read_begin(struct zs_pool *pool, unsigned long handle,
> > +			void *local_copy);
> 
> Nit: Any reason to put 'end' before 'begin'? Same for the function
> definitions.

An old habit, I just put release() before init() (or end() before
begin()) because often times you call end() from begin() error path.
Not in this particular case, but I just do that semi-automatically.

[..]
> > +	if (off + class->size <= PAGE_SIZE) {
> > +		/* this object is contained entirely within a page */
> > +		void *dst = kmap_local_zpdesc(zpdesc);
> > +
> > +		if (!ZsHugePage(zspage))
> > +			off += ZS_HANDLE_SIZE;
> > +		memcpy(dst + off, handle_mem, mem_len);
> > +		kunmap_local(dst);
> > +	} else {
> > +		size_t sizes[2];
> > +
> > +		/* this object spans two pages */
> > +		off += ZS_HANDLE_SIZE;
> 
> Are huge pages always stored in a single page? If yes, can we just do
> this before the if block for both cases:

Yes.

> if (!ZsHugePage(zspage))
> 	off += ZS_HANDLE_SIZE;

Looks good.
