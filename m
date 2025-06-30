Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666611B87F0
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751314336; cv=none; b=eDBBkGvn++HAA7SAwUmcR+CbgftnELuRXQ6rW9MES83275l/mq38h4rUBYan5eCiz08As3Xx6Lsa/bAPerxCDuHuhQYMkV+2smuws5Vv3M+CGZN7KIUCgGie7dEmvG9bAPqOF1+CxZiHqT/wf+AnoDteba2JXnjPeQ1c3hpZInk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751314336; c=relaxed/simple;
	bh=yBg3GB3lhCpdzzmoDQuhGODKp6X+ylUuiDnqkO/v3S8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d0l4cX/YxI9AmgcU7B4duCx0iQW4JZaRY+nw0juGjYNwUJOLGAV4Tpoe/iu8yaxyjF537KCW2dRmAiW9lgxrW6LKWhfTrdT16//7QzaA3HlHQDBfUzu6GTBUkqES1071Ke9KhcebD93hmlupbiv2DdYBPJLCJDkCApRb/GbDcBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=fail smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=cbXEB+53; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="cbXEB+53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1751313953; bh=yBg3GB3lhCpdzzmoDQuhGODKp6X+ylUuiDnqkO/v3S8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cbXEB+5313Qe3bFolzb3FEF0a0/NGTgKnULUlrUZpcne1NsIM3XXmoZo/hXDGFvHk
	 ZLLUaDDJkXprkREqmt+AbxkLuyxI/9QpHPSFwiNyfVUKrVmIY9KJ+k5RSkgZ9mpRF2
	 vjTfcWU0Fg3qC4wMOGEdE/widwi4cyd2CgCyzEv0CrAhiXWiNbucR8lRIswaJ7ZpMY
	 1kJqQg83xSn9CCE+Fm230hskiQcNOJKb0mANaay4JsFJyi6z4i2XOVaq085wGZkDql
	 f4gt6FJmYNihkdlCoLBMfDJ7ZEPMdQSL9qPMhQtzc0Xlz2ngSSkOKS6OGaNi9WGk2+
	 DrOgiuncYSG2+/hCul8lOG2AG6w/z1vTMYPsIo1jDEzLz97Wi8bMhTkax2rA6NnvHY
	 CXL20edyECqgP5s7uFgMMG6S2k6Fc0ThjK61lwxA3iKHQLKIcY36dIPpo32MZ4yE0l
	 wYEFizbjEQMmDIZ+Ju1Z60X96BOaKJz7WGQM2vy9fYhKV/XPF1QsCobQzr6ceOn847
	 04MNWGrJ3ZNVV/y9/3GaINBECfINYjkkIt7gWrUDP1oQgUy1HJDXnaXQL+SEGB+Eqm
	 uWIQyjO2A5bVGmOG6nzjcXSKoS3ZrOv47Akkg0V96etBuU2m9nZ0e3VKQwpQWcFVhw
	 ymK8xQ2v1kImlfuhjxwH6dsY=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 805C6162A20;
	Mon, 30 Jun 2025 22:05:51 +0200 (CEST)
Message-ID: <7c1180f4-923c-4138-b756-618cb5d597ac@ijzerbout.nl>
Date: Mon, 30 Jun 2025 22:05:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm/mempolicy: Skip extra call to __alloc_pages_bulk
 in weighted interleave
To: Joshua Hahn <joshua.hahnjy@gmail.com>, Gregory Price <gourry@gourry.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alistair Popple <apopple@nvidia.com>, Byungchul Park <byungchul@sk.com>,
 David Hildenbrand <david@redhat.com>, Matthew Brost
 <matthew.brost@intel.com>, Rakie Kim <rakie.kim@sk.com>,
 Ying Huang <ying.huang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-team@meta.com
References: <20250626200936.3974420-1-joshua.hahnjy@gmail.com>
 <20250626200936.3974420-3-joshua.hahnjy@gmail.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20250626200936.3974420-3-joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 26-06-2025 om 22:09 schreef Joshua Hahn:
> Currently, alloc_pages_bulk_weighted_interleave can make up to nr_node_ids+1
> calls to __alloc_pages_bulk. The additional allocation can happen if the
> previous call to this function finished the weighted round robin allocation
> partially on a node. To make up for this, the next time this function is
> called, an extra allocation is made to finish cleanly on the node boundaries
> before performing the weighted round-robin cycles again.
>
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
>   mm/mempolicy.c | 39 ++++++++++++++++++++-------------------
>   1 file changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 78ad74a0e249..0d693f96cf66 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -2569,7 +2569,7 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>   	unsigned long node_pages, delta;
>   	u8 *weights, weight;
>   	unsigned int weight_total = 0;
> -	unsigned long rem_pages = nr_pages;
> +	unsigned long rem_pages = nr_pages, carryover = 0;
>   	nodemask_t nodes;
>   	int nnodes, node;
>   	int resume_node = MAX_NUMNODES - 1;
> @@ -2594,18 +2594,12 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>   	node = me->il_prev;
>   	weight = me->il_weight;
>   	if (weight && node_isset(node, nodes)) {
> -		node_pages = min(rem_pages, weight);
> -		nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
> -						  page_array);
> -		page_array += nr_allocated;
> -		total_allocated += nr_allocated;
> -		/* if that's all the pages, no need to interleave */
>   		if (rem_pages <= weight) {
> -			me->il_weight -= rem_pages;
> -			return total_allocated;
> +			node_pages = rem_pages;
> +			me->il_weight -= node_pages;
> +			goto allocate;
This is a goto into the middle of a for-loop.
What do you think is going to happen at the end of that loop?

I think (only tested with a small C program) it will go to the start of
the loop, do the i++, check i<nnodes, and possibly do the loop again.
Variable i is uninitialized at that point. In the loop it hits several
uninitialized variables.

Even if this is legal C code, it is pretty obscure.

>   		}
> -		/* Otherwise we adjust remaining pages, continue from there */
> -		rem_pages -= weight;
> +		carryover = weight;
>   	}
>   	/* clear active weight in case of an allocation failure */
>   	me->il_weight = 0;
> @@ -2614,7 +2608,7 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>   	/* create a local copy of node weights to operate on outside rcu */
>   	weights = kzalloc(nr_node_ids, GFP_KERNEL);
>   	if (!weights)
> -		return total_allocated;
> +		return 0;
>   
>   	rcu_read_lock();
>   	state = rcu_dereference(wi_state);
> @@ -2634,16 +2628,17 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>   	/*
>   	 * Calculate rounds/partial rounds to minimize __alloc_pages_bulk calls.
>   	 * Track which node weighted interleave should resume from.
> +	 * Account for carryover. It is always allocated from the first node.
>   	 *
>   	 * if (rounds > 0) and (delta == 0), resume_node will always be
>   	 * the node following prev_node and its weight.
>   	 */
> -	rounds = rem_pages / weight_total;
> -	delta = rem_pages % weight_total;
> +	rounds = (rem_pages - carryover) / weight_total;
> +	delta = (rem_pages - carryover) % weight_total;
>   	resume_node = next_node_in(prev_node, nodes);
>   	resume_weight = weights[resume_node];
> +	node = carryover ? prev_node : next_node_in(prev_node, nodes);
>   	for (i = 0; i < nnodes; i++) {
> -		node = next_node_in(prev_node, nodes);
>   		weight = weights[node];
>   		/* when delta is depleted, resume from that node */
>   		if (delta && delta < weight) {
> @@ -2651,12 +2646,14 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>   			resume_weight = weight - delta;
>   		}
>   		/* Add the node's portion of the delta, if there is one */
> -		node_pages = weight * rounds + min(delta, weight);
> +		node_pages = weight * rounds + min(delta, weight) + carryover;
>   		delta -= min(delta, weight);
> +		carryover = 0;
>   
>   		/* node_pages can be 0 if an allocation fails and rounds == 0 */
>   		if (!node_pages)
>   			break;
> +allocate:
>   		nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
>   						  page_array);
>   		page_array += nr_allocated;
> @@ -2664,10 +2661,14 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>   		if (total_allocated == nr_pages)
>   			break;
>   		prev_node = node;
> +		node = next_node_in(prev_node, nodes);
> +	}
> +
> +	if (weights) {
> +		me->il_prev = resume_node;
> +		me->il_weight = resume_weight;
> +		kfree(weights);
>   	}
> -	me->il_prev = resume_node;
> -	me->il_weight = resume_weight;
> -	kfree(weights);
>   	return total_allocated;
>   }
>   

