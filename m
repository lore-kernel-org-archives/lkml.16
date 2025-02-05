Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9A24C76
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775436; cv=none; b=LM++8+r7bfwIHakYbwoykn1leF+aeCITU8rOzaLB7X6xdmcRTaZ+hx0TviYmLAFC6xtCtvp4uedE9INxcZWbLFpGXASSfZ7k+5MSQgZa2pNUNGc4bmnivgQzPWfRWKnIgc4BU3Si5yKi9l/fE8AdwE1WXAtc+Yp6htGLaEFTYxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775436; c=relaxed/simple;
	bh=FkopotS9WN0ufWR1f0o/Jvy6AhGsm2rIYxzDj+sD+Bk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iLtFeM80b6LwQ5n+VnWFVNZ6e674Dez6aeWxh8JtaQ0sKxR/HQEzEOZ6YptRNI964m/lKnH0rHFYIZFdqy2E9ZE9NUKYEDerGSPVovvehd485qTz04l4g+57Jjb23m7T+snfEwnlCl5AhzsdoS07qOHpB4xKaNOKfUvm0PuqBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z/6rs9VV; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z/6rs9VV"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-219f6ca9a81so302075ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 09:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738775434; x=1739380234; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ayw6qczz4qDcAnQoj+msV8DhDXq1GcMA4NpMhdl7bU=;
        b=z/6rs9VVsORAW7/PdBV9x2T4K8eLW5MAkEgUR4wdT9xaau54ePea8IKBBR/AOA6jGh
         T3T1GLRPvOusnsByT4+ODeAfsQ2iMujGsbVUZQDngG5n/CzoZatMsH5TxRPIrS0J8DB/
         KhZnLRhULZ+Z8whWvIxHwjYCIP0s3dbxqCzo2iADAkuHm1PAfUyIhyZxDEDYnFaa38/p
         D8PQoaqiUhzCf2x3EPjQQQ1OQYW0uTCK2kb8Op4ksyvAr9uFbeTYGZgz5UjtRajP0ukg
         ccOnuJYREC+A86AZAaOpQuyK7oa8H8u5wwfKUNOKYZLrVTeXqNm/HY7vEYB4Ex1wfjix
         YHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738775434; x=1739380234;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ayw6qczz4qDcAnQoj+msV8DhDXq1GcMA4NpMhdl7bU=;
        b=GC/A0cW8dLmYrPA8S6kZFsW1HYmqxot8G/pcM7onlsdPkwDBn0GM4HzoKrB6S60R4P
         fWgOyueHUoIL35Ev3k34Z9pg9cDT8VRH/ZM/HSx69ou1B/dWm+LpmKSp31iMOO8gH2HQ
         8WePTY1LM3BcQgZfsrmpqKFqsOWUI3RJnWKd64UMukZSnZDDa5ts70YJQqjhW4Wx4Y23
         Eov/G8LpdszCi5KHGguavX7Rn4MnY8X+J526AagxDjyMNShWrgSGplb1LIN1V00Mb1nA
         mhGiIawWWMIICq16y6MErpNwkTDs4aIimk8MClxtzK2rZwYnQvz2uJ2EqRq+D/ywfpdw
         aCxw==
X-Forwarded-Encrypted: i=1; AJvYcCUKfRj+jd0O/L0PNgnzll2jB/Ci5p6g25bRZ2FN/+fHu9GCgvqn1ngPWBMFWWzG63iV/HWn2/KyeBIjPUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBitlgumMZuAPgTduXVWwtW7bozR5xP59slwCnMmCpEr5+Mu3o
	vPRtlB3Op4XP1XxYVJiAuxdRtkKya2J7ZD+eKunGLThNlkOjxzcbaY0YaZ1tRQ==
X-Gm-Gg: ASbGncuSvFl5wPaJeDybLxzA1po124xsmTiBydsGEfIzI/hXGImm+B6l1gR6UvmR+zE
	napwlEIIB5o/NFLRNCBEfaM+lYOQnIVIQrQ0xUrrEfOk1ACMoJ8xwVz1pqnYE2SRyfIq02u8tMM
	gBQ442sgkcHnhNmEM3wtMH0rj7sI25Zi1aPru1Mc5qN61+IGk28Lf2yOlcdvs/6VGNVWnei2Gbp
	D/gv9hjmlxSz+Y7dec89DvcfRONOoB0ND7PiT9VskNthLA5Swcrmdw5v8FUkOciS9aErBm/UM7h
	foLzq27hPrXv22RaHU25D9pgAimv/T+oU4SSvtDF0R1zG0Intc7R9bsAHejv3puC1zXnlumSRsa
	efO6OfVhVAw==
X-Google-Smtp-Source: AGHT+IFrbF9lqfMOOkSUjVEHTZOA83bFrb3jA9riWnv70B7MEFE0qPjQ/1M0KgApO8HvHduIDhQwwg==
X-Received: by 2002:a17:903:3253:b0:21f:54d:14b0 with SMTP id d9443c01a7336-21f054d15bfmr6182765ad.14.1738775434169;
        Wed, 05 Feb 2025 09:10:34 -0800 (PST)
Received: from [2a00:79e0:2eb0:8:23ad:2d69:b4a0:1176] ([2a00:79e0:2eb0:8:23ad:2d69:b4a0:1176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f0dd8cc20sm26773525ad.11.2025.02.05.09.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 09:10:33 -0800 (PST)
Date: Wed, 5 Feb 2025 09:10:32 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Hyesoo Yu <hyesoo.yu@samsung.com>
cc: janghyuck.kim@samsung.com, Christoph Lameter <cl@linux.com>, 
    Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Vlastimil Babka <vbabka@suse.cz>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: slub: call WARN() instead of pr_err on
 slab_fix.
In-Reply-To: <20250205004615.1253389-1-hyesoo.yu@samsung.com>
Message-ID: <55522d9a-7fd2-1df0-19df-1552644b009e@google.com>
References: <CGME20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64@epcas2p3.samsung.com> <20250205004615.1253389-1-hyesoo.yu@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Feb 2025, Hyesoo Yu wrote:

> If a slab object is corrupted or an error occurs in its internal
> value, continuing after restoration may cause other side effects.
> At this point, it is difficult to debug because the problem occurred
> in the past. It is better to use WARN() instead of pr_err to catch
> errors at the point of issue because WARN() could trigger panic for
> system debugging when panic_on_warn is enabled. WARN() should be
> called prior to fixing the value because when a panic is triggered by WARN(),
> it allows us to check corrupted data.
> 

I think this makes sense, but it doesn't document why the other changes 
are being made, like moving the setting of *freelist to NULL.  This is 
presumably something that you want in the crash dump when 
kernel.panic_on_warn is enabled.  Probably best to call that out, but to 
also indicate what you're relying on in the crash dump to make forward 
progress on in diagnosing the issue.

> Changes in v2:
> - Replace direct calling with BUG_ON with the use of WARN in slab_fix.
> 
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> ---
>  mm/slub.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 1f50129dcfb3..ea956cb4b8be 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1043,7 +1043,7 @@ static void slab_fix(struct kmem_cache *s, char *fmt, ...)
>  	va_start(args, fmt);
>  	vaf.fmt = fmt;
>  	vaf.va = &args;
> -	pr_err("FIX %s: %pV\n", s->name, &vaf);
> +	WARN(1, "FIX %s: %pV\n", s->name, &vaf);
>  	va_end(args);
>  }
>  
> @@ -1106,8 +1106,8 @@ static bool freelist_corrupted(struct kmem_cache *s, struct slab *slab,
>  	if ((s->flags & SLAB_CONSISTENCY_CHECKS) &&
>  	    !check_valid_pointer(s, slab, nextfree) && freelist) {
>  		object_err(s, slab, *freelist, "Freechain corrupt");
> -		*freelist = NULL;
>  		slab_fix(s, "Isolate corrupted freechain");
> +		*freelist = NULL;
>  		return true;
>  	}
>  
> @@ -1445,9 +1445,9 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
>  				set_freepointer(s, object, NULL);
>  			} else {
>  				slab_err(s, slab, "Freepointer corrupt");
> +				slab_fix(s, "Freelist cleared");
>  				slab->freelist = NULL;
>  				slab->inuse = slab->objects;
> -				slab_fix(s, "Freelist cleared");
>  				return 0;
>  			}
>  			break;
> @@ -1464,14 +1464,14 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
>  	if (slab->objects != max_objects) {
>  		slab_err(s, slab, "Wrong number of objects. Found %d but should be %d",
>  			 slab->objects, max_objects);
> -		slab->objects = max_objects;
>  		slab_fix(s, "Number of objects adjusted");
> +		slab->objects = max_objects;
>  	}
>  	if (slab->inuse != slab->objects - nr) {
>  		slab_err(s, slab, "Wrong object count. Counter is %d but counted were %d",
>  			 slab->inuse, slab->objects - nr);
> -		slab->inuse = slab->objects - nr;
>  		slab_fix(s, "Object count adjusted");
> +		slab->inuse = slab->objects - nr;
>  	}
>  	return search == NULL;
>  }
> -- 
> 2.48.0
> 
> 
