Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053022B9A4
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750998519; cv=none; b=VMckNNY/hj5WUyL64uwx4NvZRLjS5XHuCGu6JqP31MsiTDCzyFd1WungbkpmKfH2ZcCbygP8O9UC1avnP6OFDdiej+wNU9UsK/cjMhdhDambv+yt76agqdYD5Cq9Y2c72ECZipZZOhZZp2qUtYtWY5nfjR2zCCImndwDZTj9AJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750998519; c=relaxed/simple;
	bh=+dnlwdDbyDB0D7ENRQvVBv1Fh85v0VIV7b6C/+gl4eY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENGOip0HiSzsc094HLIcoJLpmM0MIuHDepb7NrP7QLJox4COhAUB03dtlsXhiiUSg8mB1ujaghvzuEkprPDo+UNINh2QJjA28ST/2xnDuY8QCbWeVACRAoivwLurckDzarmnqvN28d5A1+B+PQXqGx0r6tGVxZEbfxXAcxCkE6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TiLJAClM; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TiLJAClM"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a52d82adcaso24913281cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750998516; x=1751603316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y36ADeRuhcP2ckTXHCpKxSMGwCYMvo3oVcA5wg7Axs0=;
        b=TiLJAClMK8DwoI4aRMUptkd/CDZ0jGBks6JgZdMy2pRU3b23UwHKdGXsHYUTMF76wY
         ZvrMJUbKINVwykxvR0vOUYQAsc4kmkEpysXK2cmGH+pJeDbKNA9WqJEXDl5sZYEK+JMH
         9OvQ2t8Wg/dx9N3GEACvWVsME+1qPBvD4/uFC4VVI8oG7I5qTw4HFG+4BspwyUcO2AQi
         keWnTQQCoE6OCgPBA93HylTy41wdt92EDt87X3icG1VXL43UT1q8byr6FR7vaK1z/lk5
         +AfbXu96g/J4jnmrMCX/9P+L0Up3hxxFR8K7eDV9ecWMVqDCcEKyXq2YIpyGiGgEoQ8F
         wj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750998516; x=1751603316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y36ADeRuhcP2ckTXHCpKxSMGwCYMvo3oVcA5wg7Axs0=;
        b=XM127VmWKQZve2B9jtQta04T2dEkTQpOS1/+khssDOTvTD+Zceoq4NV7SQ2wbppE/Q
         sNZknxr2n9ekCy6DTA2p0/491vROwIIWCFQkzceJLnk8VK2ZxUsJxPxwRs17dEtHnftL
         7He6bNqqzWHbKP/wLF0U214ullxvnPn7eSbc7j4FrdwshXD9ekFjLKHyLXBuE+ktoX1s
         BvoGDIy2cRy1JX8Kk/Z0T4bufx2UabVXpt1PXlFRUiQmESpZ/5EzrPEWu9htjHGk1kw5
         aMmuoZVNsmpiOEJN7n+uzEVkL5WQIJZ1x/kdhwT7lhWMzEHL2yAo7MhKS0syFjkEQjfC
         P5pA==
X-Forwarded-Encrypted: i=1; AJvYcCXMoMwBqgow26n96aedG0YdtMq79mFj/AD/NMABiCYdLiT+W/KP6ejL/03YH7F5Du8FHzYkW/+aOOS7Mbs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3jzFuLAOQ0ARZnxtmUkggaSl6EMkafQW62iz4sd06cpkUigrv
	AlXtUCt1iXMuSUEwS+V5ag3d1tHLd8ZyCsD93wepAOlcOlpHmFXzNcF5bWGKoL2DSF4ncBrF41H
	42PoX
X-Gm-Gg: ASbGncs6CG2VigeHLh75kItSDCZ+3Ujj+545Qg40G8ZW1gJCRbj7DWe7yRzzKd8p4vb
	/zxCkC//KITtxJy7bgxfHSxO8Fc4HM2HcKbZ+bmdAKaeogHnbMXUWPZmYDmUqmoMeZWhqRyeif1
	1TNP1CVyI81uUvp50KaMUG5Fv23F2CQ8wdv9MuqMF+R2NR2XN5zpjhpjxvYDSgL7Q5v570V5YO5
	cFC4KdPAZH1n5tdAkUEr9nNM60qbbv9c7iXxEmgdPj11FYEpitzxDP0E61CDWyM4QySFVmR4i4h
	q/0wOeP5A7z+2tSLQzJ2TVrzvBUkO94Y4mM2lbPQnwKhsoU4U+8WSRKyzqCsZyY3TUyu1ImDHfl
	Aj7FhWdogR+dpHwKjcWC2UVsia1e5MEEFQLNJwuGcRw==
X-Google-Smtp-Source: AGHT+IHlenObjLvxgQaDPllwQc6sqiGkpBMmQxlqbMC/T6pMgBUdAGjC7LC6AAR4RMvOp3V9rD4LSA==
X-Received: by 2002:ac8:58d2:0:b0:494:9fc0:de3 with SMTP id d75a77b69052e-4a7fcad0725mr37559191cf.32.1750998515837;
        Thu, 26 Jun 2025 21:28:35 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44322884fsm75867685a.89.2025.06.26.21.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 21:28:35 -0700 (PDT)
Date: Fri, 27 Jun 2025 00:28:33 -0400
From: Gregory Price <gourry@gourry.net>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	Byungchul Park <byungchul@sk.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH 2/2] mm/mempolicy: Skip extra call to __alloc_pages_bulk
 in weighted interleave
Message-ID: <aF4d8YcGbfTktnu6@gourry-fedora-PF4VCD3F>
References: <20250626200936.3974420-1-joshua.hahnjy@gmail.com>
 <20250626200936.3974420-3-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626200936.3974420-3-joshua.hahnjy@gmail.com>

On Thu, Jun 26, 2025 at 01:09:34PM -0700, Joshua Hahn wrote:
> Currently, alloc_pages_bulk_weighted_interleave can make up to nr_node_ids+1
> calls to __alloc_pages_bulk. The additional allocation can happen if the
> previous call to this function finished the weighted round robin allocation
> partially on a node. To make up for this, the next time this function is
> called, an extra allocation is made to finish cleanly on the node boundaries
> before performing the weighted round-robin cycles again.
> 

task->il_weight can be operated on by other weighted_interleave
functions in mempolicy, so it's not just
alloc_pages_bulk_weighted_interleave that affects this.

Observations here are still true, just a correction for clarity.

i.e.:

The additional allocation happens for the current il_node/il_weight.

I *think* I did it this way just because it was easier to reason about
the two chunks separately.  So I don't see a reason not to improve this.
I will say that, at least at the time, I took the core math and
validated the edge conditions in a separate program.

If you get it wrong in the kernel, you'd either fail to allocate - or more
likely just get the wrong distribution of pages.  The latter is
non-obvious unless you go looking for it, so it might be good to at
least add this test result in the change log.  It's hard to write this
in LTP or kernel selftest unfortunately.

> Instead of making an additional call, we can calculate how many additional
> pages should be allocated from the first node (aka carryover) and add that
> value to the number of pages that should be allocated as part of the current
> round-robin cycle.
> 
> Running a quick benchmark by compiling the kernel shows a small increase
> in performance. These experiments were run on a machine with 2 nodes, each
> with 125GB memory and 40 CPUs.
> 
> time numactl -w 0,1 make -j$(nproc)
> 
> +----------+---------+------------+---------+
> | Time (s) |  6.16   | With patch | % Delta |
> +----------+---------+------------+---------+
> | Real     |  88.374 |    88.3356 | -0.2019 |
> | User     |  3631.7 |   3636.263 |  0.0631 |
> | Sys      | 366.029 |    363.792 | -0.7534 |
> +----------+---------+------------+---------+
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> 
> ---
>  mm/mempolicy.c | 39 ++++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 78ad74a0e249..0d693f96cf66 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -2569,7 +2569,7 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>  	unsigned long node_pages, delta;
>  	u8 *weights, weight;
>  	unsigned int weight_total = 0;
> -	unsigned long rem_pages = nr_pages;
> +	unsigned long rem_pages = nr_pages, carryover = 0;
>  	nodemask_t nodes;
>  	int nnodes, node;
>  	int resume_node = MAX_NUMNODES - 1;
> @@ -2594,18 +2594,12 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>  	node = me->il_prev;
>  	weight = me->il_weight;
>  	if (weight && node_isset(node, nodes)) {
> -		node_pages = min(rem_pages, weight);
> -		nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
> -						  page_array);
> -		page_array += nr_allocated;
> -		total_allocated += nr_allocated;
> -		/* if that's all the pages, no need to interleave */
>  		if (rem_pages <= weight) {
> -			me->il_weight -= rem_pages;
> -			return total_allocated;
> +			node_pages = rem_pages;
> +			me->il_weight -= node_pages;
> +			goto allocate;
>  		}
> -		/* Otherwise we adjust remaining pages, continue from there */
> -		rem_pages -= weight;
> +		carryover = weight;
>  	}
>  	/* clear active weight in case of an allocation failure */
>  	me->il_weight = 0;
> @@ -2614,7 +2608,7 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>  	/* create a local copy of node weights to operate on outside rcu */
>  	weights = kzalloc(nr_node_ids, GFP_KERNEL);
>  	if (!weights)
> -		return total_allocated;
> +		return 0;

may be worth noting that this change means small bulk allocations that
could be covered by the current il_node/weight may now fail if kzalloc
fails.  But then there are probably other problems.  However, this is a
functional difference between the old and new state of the function.

>  
>  	rcu_read_lock();
>  	state = rcu_dereference(wi_state);
> @@ -2634,16 +2628,17 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>  	/*
>  	 * Calculate rounds/partial rounds to minimize __alloc_pages_bulk calls.
>  	 * Track which node weighted interleave should resume from.
> +	 * Account for carryover. It is always allocated from the first node.
>  	 *
>  	 * if (rounds > 0) and (delta == 0), resume_node will always be
>  	 * the node following prev_node and its weight.
>  	 */
> -	rounds = rem_pages / weight_total;
> -	delta = rem_pages % weight_total;
> +	rounds = (rem_pages - carryover) / weight_total;
> +	delta = (rem_pages - carryover) % weight_total;
>  	resume_node = next_node_in(prev_node, nodes);
>  	resume_weight = weights[resume_node];
> +	node = carryover ? prev_node : next_node_in(prev_node, nodes);
>  	for (i = 0; i < nnodes; i++) {
> -		node = next_node_in(prev_node, nodes);
>  		weight = weights[node];
>  		/* when delta is depleted, resume from that node */
>  		if (delta && delta < weight) {
> @@ -2651,12 +2646,14 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>  			resume_weight = weight - delta;
>  		}
>  		/* Add the node's portion of the delta, if there is one */
> -		node_pages = weight * rounds + min(delta, weight);
> +		node_pages = weight * rounds + min(delta, weight) + carryover;
>  		delta -= min(delta, weight);
> +		carryover = 0;
>  
>  		/* node_pages can be 0 if an allocation fails and rounds == 0 */
>  		if (!node_pages)
>  			break;
> +allocate:
>  		nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
>  						  page_array);
>  		page_array += nr_allocated;
> @@ -2664,10 +2661,14 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>  		if (total_allocated == nr_pages)
>  			break;
>  		prev_node = node;
> +		node = next_node_in(prev_node, nodes);
> +	}
> +
> +	if (weights) {
> +		me->il_prev = resume_node;
> +		me->il_weight = resume_weight;
> +		kfree(weights);
>  	}
> -	me->il_prev = resume_node;
> -	me->il_weight = resume_weight;
> -	kfree(weights);
>  	return total_allocated;
>  }
>  
> -- 
> 2.47.1
