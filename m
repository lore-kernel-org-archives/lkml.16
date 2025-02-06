Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BBD13AD18
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 02:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738810638; cv=none; b=IcfnVRTHhcfg1BuCGKAZeeyuO8kbcSD8KEMu3OZ6wAMCsUvfnsFC00KXvkubc26vEku4DDAhBu7J7A26mXKHn9KA+vjLtHyhRNae6sqiRDyw0VrEVERrhJE2xSzP2KchDgH5WBF6bgzRs90nkH8XrQea5o+1xbIChCEiMEbWf9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738810638; c=relaxed/simple;
	bh=3ynD3NlUnVjs22S+HquQouMWMFCpkHHGdtUCvmmji5M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kDdQr8gI3lJVCY4li5oydoae9FyGR3osvxpSjfe1r5eoks0BMVgdFFn4kaB62enBAFf3bvMpE2x6mDHxgm6azyiogjVtxNyCynPep1CzgbYYi/7hZ1qC7h/8VfjjxGGrin/g9qjpwoNHVfIMVzL2wu2jyqt783MHXTneSGS3jYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WT8No3c2; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WT8No3c2"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-219f6ca9a81so25995ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 18:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738810635; x=1739415435; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mk6PiHA2jUMIAAc6GXP8rm3bb0PFPxp1kBvPr1tdqBE=;
        b=WT8No3c2Nzz9/jsh3Sy2FyNGmz5Yuy18eR5f1FcHitrf7GkTnqD2Wg+l778YrpiMiT
         /N0nEo/e0XXVZDKLC0TOrTm9wTAfWN0OPMiOMPPDEXq2cwdVSovYBJSVWq6kToc9wGYm
         LG5N4ziqJ3NquLPfl1GEAhFolhwBLWUjpna4GxCUBEXR5KbtBjEgJD6C4owINtMhDJJc
         og8SmGATrOAY1wpQdnP3kzQ313F8mBxK/EjMlUURUgc5HDXNJpvQcEsKgIUp2+0PiSYS
         XHxjhB/u/E2+xd3nbvKBkO3/lgp9LN4u4KraC6+5y0wBpuNhxK4RhlJfW3/saolYYwYg
         kB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738810635; x=1739415435;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mk6PiHA2jUMIAAc6GXP8rm3bb0PFPxp1kBvPr1tdqBE=;
        b=UFMMJr8/WZYsMXep8EEC2hJb/7y6vyyXhBa5dPAjZjVPENSyiJXoiNhgOPgDTsBubi
         nf4LRGGjA8y9koHq/Nn06j4iBXoqg8u4TT4B05qjvcIUZmHnya8cJYmfvhH5nI0mVeiZ
         //Jr8Z6OW7AaJVw+uIA2fUQ4NVeNZLTvSCGT1EvkfUWZglMYkorc1uibIujq59AuOM1M
         DK8EomRcGp80r9SPfZ8SJg/XeEWuNRYgWPk2iZc7Ot0h7W2x+IsJ5ibvFl3nknVxSObN
         7uUuhzmFFItMWMrxBVxQfXvF0zBGJIGs4gytJdVM9Nmx7+RJvsasbHiV47SwXZErP3aD
         zIBg==
X-Forwarded-Encrypted: i=1; AJvYcCUIyFDTHzFmpd7OXUyAxzR5FQxfpLMWhQ7nDovwz6SjsWlne0Y+XbOwxz6epplxDsvQ1bboQ0S463AyVQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPkT3MdYLuxLEa24azgX4imf26Q6iJm70o7spD1USx9U3MFJec
	5hcthom2M5R5gyWuOFTyQdR0ojMA5pgnXafpuCTCAWoqL/3N5r1YhkHoq7xJBw==
X-Gm-Gg: ASbGncsN1wa8jxxLMLQHLz88gU4TmWRWmA8AgOKx/lq4iQdMoLWYIRA6oeidvlsNR8s
	viWptii3k4aLcs02SNeN5D33x92cjdelutDVr4SH06i4iig8oGe4u/1iq/Rcrf3yfh550O3dFnC
	2eDAgBFsyvsepXrJAHakQEpeFoASQn+zcxMjPBjrkHBd2V9jAe1rqiWL6FBc6ev694kO5cvYv31
	sZ/DRHSPPYN9NSw/uV8Qj/JfDaC7mVDpjB7NstjP+/SKMOUrJ9MyHjUl8ImoU6tFioVOGLvBOEA
	35sLyUT3E7AFJqOefLoBPFur52E32rGQgF3tSOmvd5L60Cj2eIGpmXgjAbf/xO2Upv1gxxoqj1k
	LPOmuIkhKZw==
X-Google-Smtp-Source: AGHT+IFM1DuRCvSQG9hQ+ar4awv2YVkN6K8eMWqiCWTuOg17j/wgyyp0NwmSKpshMMQFbEAWd4kqPw==
X-Received: by 2002:a17:902:8f86:b0:215:65f3:27ef with SMTP id d9443c01a7336-21f34910ed6mr720325ad.12.1738810635348;
        Wed, 05 Feb 2025 18:57:15 -0800 (PST)
Received: from [2a00:79e0:2eb0:8:23ad:2d69:b4a0:1176] ([2a00:79e0:2eb0:8:23ad:2d69:b4a0:1176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048bf148dsm191432b3a.88.2025.02.05.18.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 18:57:14 -0800 (PST)
Date: Wed, 5 Feb 2025 18:57:14 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Vlastimil Babka <vbabka@suse.cz>
cc: Hyesoo Yu <hyesoo.yu@samsung.com>, janghyuck.kim@samsung.com, 
    Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
    Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: slub: call WARN() instead of pr_err on
 slab_fix.
In-Reply-To: <135f5cf7-6853-4715-bd7f-41c7f554ec31@suse.cz>
Message-ID: <6c45ced8-3a01-0905-0d2c-f0e7b7acc2df@google.com>
References: <CGME20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64@epcas2p3.samsung.com> <20250205004615.1253389-1-hyesoo.yu@samsung.com> <55522d9a-7fd2-1df0-19df-1552644b009e@google.com> <135f5cf7-6853-4715-bd7f-41c7f554ec31@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Feb 2025, Vlastimil Babka wrote:

> On 2/5/25 18:10, David Rientjes wrote:
> > On Wed, 5 Feb 2025, Hyesoo Yu wrote:
> > 
> >> If a slab object is corrupted or an error occurs in its internal
> >> value, continuing after restoration may cause other side effects.
> >> At this point, it is difficult to debug because the problem occurred
> >> in the past. It is better to use WARN() instead of pr_err to catch
> >> errors at the point of issue because WARN() could trigger panic for
> >> system debugging when panic_on_warn is enabled. WARN() should be
> >> called prior to fixing the value because when a panic is triggered by WARN(),
> >> it allows us to check corrupted data.
> >> 
> > 
> > I think this makes sense, but it doesn't document why the other changes 
> > are being made, like moving the setting of *freelist to NULL.  This is 
> > presumably something that you want in the crash dump when 
> > kernel.panic_on_warn is enabled.  Probably best to call that out, but to 
> > also indicate what you're relying on in the crash dump to make forward 
> > progress on in diagnosing the issue.
> 
> Well the last sentence of the changelog above says exactly that, no?
> 

Sorry, I should have been more clear.  It's unclear in the code why 
choosing WARN() here is helpful given the stack would be known.  It makes 
sense to enable kernel.panic_on_warn this way for debugging purposes, but 
thought it should also carry a comment in the code on the rationale (and 
the state we're trying to capture in a crash dump) so a future change 
doesn't go and unravel this for us again.

> >> Changes in v2:
> >> - Replace direct calling with BUG_ON with the use of WARN in slab_fix.
> >> 
> >> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> >> ---
> >>  mm/slub.c | 10 +++++-----
> >>  1 file changed, 5 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/mm/slub.c b/mm/slub.c
> >> index 1f50129dcfb3..ea956cb4b8be 100644
> >> --- a/mm/slub.c
> >> +++ b/mm/slub.c
> >> @@ -1043,7 +1043,7 @@ static void slab_fix(struct kmem_cache *s, char *fmt, ...)
> >>  	va_start(args, fmt);
> >>  	vaf.fmt = fmt;
> >>  	vaf.va = &args;
> >> -	pr_err("FIX %s: %pV\n", s->name, &vaf);
> >> +	WARN(1, "FIX %s: %pV\n", s->name, &vaf);
> >>  	va_end(args);
> >>  }
> >>  
> >> @@ -1106,8 +1106,8 @@ static bool freelist_corrupted(struct kmem_cache *s, struct slab *slab,
> >>  	if ((s->flags & SLAB_CONSISTENCY_CHECKS) &&
> >>  	    !check_valid_pointer(s, slab, nextfree) && freelist) {
> >>  		object_err(s, slab, *freelist, "Freechain corrupt");
> >> -		*freelist = NULL;
> >>  		slab_fix(s, "Isolate corrupted freechain");
> >> +		*freelist = NULL;
> >>  		return true;
> >>  	}
> >>  
> >> @@ -1445,9 +1445,9 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
> >>  				set_freepointer(s, object, NULL);
> >>  			} else {
> >>  				slab_err(s, slab, "Freepointer corrupt");
> >> +				slab_fix(s, "Freelist cleared");
> >>  				slab->freelist = NULL;
> >>  				slab->inuse = slab->objects;
> >> -				slab_fix(s, "Freelist cleared");
> >>  				return 0;
> >>  			}
> >>  			break;
> >> @@ -1464,14 +1464,14 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
> >>  	if (slab->objects != max_objects) {
> >>  		slab_err(s, slab, "Wrong number of objects. Found %d but should be %d",
> >>  			 slab->objects, max_objects);
> >> -		slab->objects = max_objects;
> >>  		slab_fix(s, "Number of objects adjusted");
> >> +		slab->objects = max_objects;
> >>  	}
> >>  	if (slab->inuse != slab->objects - nr) {
> >>  		slab_err(s, slab, "Wrong object count. Counter is %d but counted were %d",
> >>  			 slab->inuse, slab->objects - nr);
> >> -		slab->inuse = slab->objects - nr;
> >>  		slab_fix(s, "Object count adjusted");
> >> +		slab->inuse = slab->objects - nr;
> >>  	}
> >>  	return search == NULL;
> >>  }
> >> -- 
> >> 2.48.0
> >> 
> >> 
> 
> 
