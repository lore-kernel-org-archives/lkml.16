Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FF220A5D6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893028; cv=none; b=TLCFiPA6WFa8742nij4XobvbxbD8CHX6CkOIkgGv5W74ghCc7RtKac61xjYIWC3LestNZ5+yztWXpTPzYEmN4MwKteZiQz8g034u3tLjHGUvAyLVZPPc33fuz+qnGgNMBr9cI4uD5+xSPE/Goz+2g1WsX7QDx9nyHKk22HswDgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893028; c=relaxed/simple;
	bh=qXawk7MVybMlnhqg/4L4rC62C3rUuMsXBJDQOotHMuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxBt6TFOyWZtqQxA8k+3p0BMHVJC3GwVi7evQMK8gjVuYjL/sg7O4O6WavPAwyngBEB4GXitmqVNuD6JPEKby8+KB9JU6Zt6PcYXtkwg8XwiB0w/ilXUWmXfqzy7aE4BUcnCsBNOIkDgW2if/CsmOmN4VSbO5ogFKL3hPEreA90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s0aVZhgQ; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s0aVZhgQ"
Date: Wed, 25 Jun 2025 16:10:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750893023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aTakL8zcMJBOlQ4XqDs4PSwXPkePFPHvOcCYu+b0aTg=;
	b=s0aVZhgQ2XvVUdygwEzsBA4IfOujzSy8zMGjpH4RMlXIKYht3c0ALaRMfXAj8AtqPzZLrz
	IXOB6+7wtBpFzvIHjsBNnuEHpTMHZ6OQh18MndZjLIcdaptARbgLOz7Iw9I49lIEv0Jjgu
	ac1guwQX4/vhTx0iBdynNgAJmXo5uAU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: akpm@linux-foundation.org, mhocko@kernel.org, hannes@cmpxchg.org, 
	roman.gushchin@linux.dev, yosryahmed@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mm: introduce per-node proactive reclaim interface
Message-ID: <zutbi6jjx6rj2beytkp2ihpyxkuvg43ggsglfhimluojko4frf@gacgibzen5k4>
References: <20250623185851.830632-1-dave@stgolabs.net>
 <20250623185851.830632-5-dave@stgolabs.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623185851.830632-5-dave@stgolabs.net>
X-Migadu-Flow: FLOW_OUT

On Mon, Jun 23, 2025 at 11:58:51AM -0700, Davidlohr Bueso wrote:
> This adds support for allowing proactive reclaim in general on a
> NUMA system. A per-node interface extends support for beyond a
> memcg-specific interface, respecting the current semantics of
> memory.reclaim: respecting aging LRU and not supporting
> artificially triggering eviction on nodes belonging to non-bottom
> tiers.
> 
> This patch allows userspace to do:
> 
>      echo "512M swappiness=10" > /sys/devices/system/node/nodeX/reclaim
> 
> One of the premises for this is to semantically align as best as
> possible with memory.reclaim. During a brief time memcg did
> support nodemask until 55ab834a86a9 (Revert "mm: add nodes=
> arg to memory.reclaim"), for which semantics around reclaim
> (eviction) vs demotion were not clear, rendering charging
> expectations to be broken.
> 
> With this approach:
> 
> 1. Users who do not use memcg can benefit from proactive reclaim.
> The memcg interface is not NUMA aware and there are usecases that
> are focusing on NUMA balancing rather than workload memory footprint.
> 
> 2. Proactive reclaim on top tiers will trigger demotion, for which
> memory is still byte-addressable. Reclaiming on the bottom nodes
> will trigger evicting to swap (the traditional sense of reclaim).
> This follows the semantics of what is today part of the aging process
> on tiered memory, mirroring what every other form of reclaim does
> (reactive and memcg proactive reclaim). Furthermore per-node proactive
> reclaim is not as susceptible to the memcg charging problem mentioned
> above.
> 
> 3. Unlike the nodes= arg, this interface avoids confusing semantics,
> such as what exactly the user wants when mixing top-tier and low-tier
> nodes in the nodemask. Further per-node interface is less exposed to
> "free up memory in my container" usecases, where eviction is intended.
> 
> 4. Users that *really* want to free up memory can use proactive reclaim
> on nodes knowingly to be on the bottom tiers to force eviction in a
> natural way - higher access latencies are still better than swap.
> If compelled, while no guarantees and perhaps not worth the effort,
> users could also also potentially follow a ladder-like approach to
> eventually free up the memory. Alternatively, perhaps an 'evict' option
> could be added to the parameters for both memory.reclaim and per-node
> interfaces to force this action unconditionally.
> 
> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>

Overall looks good but I will try to dig deeper in next couple of days
(or weeks).

One orthogonal thought: I wonder if we want a unified aging (hotness or
generation or active/inactive) view of jobs/memcgs/system. At the moment
due to the way LRUs are implemented i.e. per-memcg per-node, we can have
different view of these LRUs even for the same memcg. For example the
hottest pages in low tier node might be colder than coldest pages in the
top tier. Not sure how to implement it in a scalable way.
