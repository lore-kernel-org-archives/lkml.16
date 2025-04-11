Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5446523236D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744395722; cv=none; b=kLcVD2qh/WKmbO5jcpv1ofwM+EgjC+jlNnxAymeZSrAbkLXq6PRjDO1z/eH1voLI9uOA2BBVbGP3nqHSxWLf6e6dCLBatKIakcEtxsT0S3sdRI+LMtpK3nrjniybEsa5VWAFdEdubVXOj8gO/Mwvv7gpLaytYnreCeo4pSKARtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744395722; c=relaxed/simple;
	bh=M9CFvCcbsx9+0Tzu3qhRdd8Urm02rDrsZiYEXJdnSrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3/RDgfwkt1TSDJQiqKZiRpccIXo+syK3lEmvO8DLjcvVSI29bh330OYg3bt97NCml0vCUt+jcXjbNXF1Q0JqecK03zhoNhKJIPKug0aHuICvQDYOVCgAwZUyPDPmlAxp7fpfS1W+E+O4w5SQ/2TLRhNYsfHoSjfbycutYhYdK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=pc9pudzY; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="pc9pudzY"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5a88b34a6so228442785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744395718; x=1745000518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tKqiMrQYuUOQJDIH+t14CV1L3h37l2QDGVazr53LeIY=;
        b=pc9pudzYOk4LQa8J3FzDzLLvSN3lRCj0wiI74cM+UQcUFMm5dooxTmXnfZ8eqJWjSr
         X5oVk9vOa9zmvguRHwxUFihdg0QKiKnh8fwmDLwC+jyINsH32VlYW1bspqdVloLQSVU8
         dXjIxdY8B05sezSxfxhpxJi2NydHHtXWK5MAosexqD4CIhtPbjzk7PW0MXsoWNvkLS32
         8AaCtyoVNrT8dMCsusYOC6GbccisDzkvqUuJh71NWtheGzpXZS1eMzBeuSx+6eVG+lW7
         GdbegjtBp6hTbV2I4sZUZsonaF3DI8a+eKJunkJUBo9LW5QSuGN4Ccmdr+T6nNZn2F/s
         1m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744395718; x=1745000518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKqiMrQYuUOQJDIH+t14CV1L3h37l2QDGVazr53LeIY=;
        b=p3aP8kfguveCEctw79XxyIn0jE+huD0UVgPpkbh/wCFMUGsoDpacHQ3SwPx9St3DYP
         L3O55z56jkknJwGB0e6ORf/Yfh2zGsUf92p1op8lCllGVo5mrYq+eHzphNlxt/s7YYkx
         t+o1r/OkFfc/EsSE6ksAlW0DT+jBUfmhu5jKaDV7nTEKvU6H0h9pmF9ozgmKNeeRRDmh
         Bm7DQZKF0/39AGWoVaTMbNnVJeXUG+jEJ2b3FbcqPqhSJHe2PD6FfW8HOW/g5rZ3B+9w
         4Ncc3yqGRQZEdLPXUvtBuZMtuJCuBzvIdSSgeMh/UbJzoM39GH2eFQfRj0C6QTvRzqaw
         LIIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYZ1bVqGxL/Ai7JFsJW/FcFoJnReFbgu9afDaym7M8uFi18KlRcd/K2NNmB6j4GVhUk8ZKXQolYgPyGxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHBx1KkpRb2TDWPdoJ8AIbb/CRha8wIbA9yacSp0J8Hzbv+Vzf
	h0cmGE0S4jHgovUsf1RZv54ZCVf9tYeQwQms1gsPO6BcHaat2FJq7yRr823VNmA=
X-Gm-Gg: ASbGnctNTPZRMCgtW7iNJdD51WS9Eap4NfTEZHpsWcFEcmlAi+BIJ0LikSygLI7gVaT
	ECNmHO+I/EL4znKj6+hhgeKkMeITqB13Tk5cztXiUnXXjqwN1kmcWrhu0kncW0Y/TB9tybppMbA
	ra56yPLWwh/m0zSZBZs14RlowHMKi9iKXpqtF4g8y/8LvUutnZEwbXb4ktAGkgfathxpKcv73Kv
	MC+whvmk07pmPNn4CbS8polSqK3Ndp6+dD5kUhSHz/Yxw3G0ezLbnUrdStceUZP7LKbhtDVVedB
	DlQW/1+0TvdWv2a+AZn3f4l1NBM54A9cRPoLLMk=
X-Google-Smtp-Source: AGHT+IFP5i8asMphTbO//EcXhT7tEAdDoywkvdhj4bCFryDnvhvpiDrafe5VTkjrjelyP+Ckao5TYg==
X-Received: by 2002:a05:620a:4001:b0:7c5:4278:d15e with SMTP id af79cd13be357-7c7af15287dmr519282685a.33.1744395717985;
        Fri, 11 Apr 2025 11:21:57 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8969e26sm294494585a.64.2025.04.11.11.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:21:57 -0700 (PDT)
Date: Fri, 11 Apr 2025 14:21:56 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm: page_alloc: defrag_mode kswapd/kcompactd
 watermarks
Message-ID: <20250411182156.GE366747@cmpxchg.org>
References: <20250313210647.1314586-1-hannes@cmpxchg.org>
 <20250313210647.1314586-6-hannes@cmpxchg.org>
 <46f1b2ab-2903-4cde-9e68-e334a0d0df22@suse.cz>
 <20250411153906.GC366747@cmpxchg.org>
 <efa6eb69-cff3-421d-94c7-e37a9a1e26f8@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa6eb69-cff3-421d-94c7-e37a9a1e26f8@suse.cz>

On Fri, Apr 11, 2025 at 06:51:51PM +0200, Vlastimil Babka wrote:
> On 4/11/25 17:39, Johannes Weiner wrote:
> > On Fri, Apr 11, 2025 at 10:19:58AM +0200, Vlastimil Babka wrote:
> >> On 3/13/25 22:05, Johannes Weiner wrote:
> >> > @@ -2329,6 +2329,22 @@ static enum compact_result __compact_finished(struct compact_control *cc)
> >> >  	if (!pageblock_aligned(cc->migrate_pfn))
> >> >  		return COMPACT_CONTINUE;
> >> >  
> >> > +	/*
> >> > +	 * When defrag_mode is enabled, make kcompactd target
> >> > +	 * watermarks in whole pageblocks. Because they can be stolen
> >> > +	 * without polluting, no further fallback checks are needed.
> >> > +	 */
> >> > +	if (defrag_mode && !cc->direct_compaction) {
> >> > +		if (__zone_watermark_ok(cc->zone, cc->order,
> >> > +					high_wmark_pages(cc->zone),
> >> > +					cc->highest_zoneidx, cc->alloc_flags,
> >> > +					zone_page_state(cc->zone,
> >> > +							NR_FREE_PAGES_BLOCKS)))
> >> > +			return COMPACT_SUCCESS;
> >> > +
> >> > +		return COMPACT_CONTINUE;
> >> > +	}
> >> 
> >> Wonder if this ever succeds in practice. Is high_wmark_pages() even aligned
> >> to pageblock size? If not, and it's X pageblocks and a half, we will rarely
> >> have NR_FREE_PAGES_BLOCKS cover all of that? Also concurrent allocations can
> >> put us below high wmark quickly and then we never satisfy this?
> > 
> > The high watermark is not aligned, but why does it have to be? It's a
> > binary condition: met or not met. Compaction continues until it's met.
> 
> What I mean is, kswapd will reclaim until the high watermark, which would be
> 32.7 blocks, wake up kcompactd [*] but that can only create up to 32 blocks
> of NR_FREE_PAGES_BLOCKS so it has already lost at that point? (unless
> there's concurrent freeing pushing it above the high wmark)

Ah, but kswapd also uses the (rounded up) NR_FREE_PAGES_BLOCKS check.

Buckle up...

> > Of course, similar to kswapd, it might not reach the watermarks and
> > keep running if there is a continuous stream of allocations consuming
> > the blocks it's making. Hence the ratio between wakeups & continues.
> > 
> > But when demand stops, it'll balance the high mark and quit.
> 
> Again, since kcompactd can only defragment free space and not create it, it
> may be trying in vain?
> 
> [*] now when checking the code between kswapd and kcompactd handover, I
> think I found a another problem?
> 
> we have:
> kswapd_try_to_sleep()
>   prepare_kswapd_sleep() - needs to succeed for wakeup_kcompactd()
>    pgdat_balanced() - needs to be true for prepare_kswapd_sleep() to be true
>     - with defrag_mode we want high watermark of NR_FREE_PAGES_BLOCKS, but
>       we were only reclaiming until now and didn't wake up kcompactd and
>       this actually prevents the wake up?

Correct, so as per above, kswapd also does the NR_FREE_PAGES_BLOCKS
check. At first, at least. So it continues to produce adequate scratch
space and won't leave compaction high and dry on a watermark it cannot
meet. They are indeed coordinated in this aspect.

As far as the *handoff* to kcompactd goes, I've been pulling my hair
over this for a very long time. You're correct about the graph
above. And actually, this is the case before defrag_mode too: if you
wake kswapd with, say, an order-8, it will do pgdat_balanced() checks
against that, seemingly reclaim until the request can succeed, *then*
wake kcompactd and sleep. WTF?

But kswapd has this:

	/*
	 * Fragmentation may mean that the system cannot be rebalanced for
	 * high-order allocations. If twice the allocation size has been
	 * reclaimed then recheck watermarks only at order-0 to prevent
	 * excessive reclaim. Assume that a process requested a high-order
	 * can direct reclaim/compact.
	 */
	if (sc->order && sc->nr_reclaimed >= compact_gap(sc->order))
		sc->order = 0;

Ignore the comment and just consider the code. What it does for higher
orders (whether defrag_mode is enabled or not), is reclaim a gap for
the order, ensure order-0 is met (but most likely it is), then enter
the sleep path - wake kcompactd and wait for more work.

Effectively, as long as there are pending higher-order requests
looping in the allocator, kswapd does this:

1) reclaim a compaction gap delta
2) wake kcompactd
3) goto 1

This pipelining seems to work *very* well in practice, especially when
there is a large number of concurrent requests.

In the huge allocator original series, I tried to convert kswapd to
use compaction_suitable() to hand over quicker. However, this ran into
scaling issues with higher allocation concurrency: maintaining just a
single, static compact gap when there could be hundreds of allocation
requests waiting for compaction results falls apart fast.

The current code has it right. The comments might be a bit dated and
maybe it could use some fine tuning. But generally, as long as there
are incoming wakeups from the allocator, it makes sense to keep making
more space for compaction as well.

I think Mel was playing 4d chess with this stuff.

[ I kept direct reclaim/compaction out of this defrag_mode series, but
  testing suggests the same is likely true for the direct path.

  Direct reclaim bails from compaction_ready() if there is a static
  compaction gap for that order. But once the gap for a given order is
  there, you can get a thundering herd of direct compactors storming
  on this gap, most of which will then fail compaction_suitable().

  A pipeline of "reclaim gap delta, direct compact, retry" seems to
  make more sense there as well. With adequate checks to prevent
  excessive reclaim in corner cases of course... ]
