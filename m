Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973ED17BEBF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027181; cv=none; b=URoQexWj9e7nJnz+FYzvIV9p+L1TPLL3GzRVlcSZk82CQ68/kutWrY5188Zyi0McMW73vE1lHM4CbwKs6yh2Kmvuk2lO30yxn2aeXEE90/Rz7N0evkEK/MECMA9SGGFc4OPhsRXAlCG9cS41LIWyKAnejAlBomwGXEavKx4N5GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027181; c=relaxed/simple;
	bh=enakpdYLIgVX/IhzgAVByjZqfZ/9xensiv8Vz61Ea5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enz0yfFbkwtpR1VW29EGTcR0J7CDNz+Poc9ilir88XUROVWmnm5BKEQ58YlfWrjxVrZ5O/85oB+LpwUF5obLaJ6y3tU8GI/lJsdOyEHZ1Hc7PaAHBwitRyQA+1BchUFRY9MFQAVWwzCiJLYILgFlGFxJz0rtWlJSOQprmyOuBEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Fi8laK2a; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Fi8laK2a"
Date: Wed, 30 Apr 2025 08:32:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746027167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T4LQSg4lPMDLS8aZTjD/aS4EZY1NoY2jqFkETsR9szI=;
	b=Fi8laK2aqqJxcv76DgkLpMtMZEZmfKxIE5IPcSi9L2Au1Ihy+WVIBa4rJq8gLCYbU57e4L
	TLNKdpvQkfkSS8VWG0nTvOhdSkiEVfeX6DFJ+SFUCdvJ6Y0qYxJOXj4o6HSO1kmzdiczf3
	F5ttkLxXgD1jLAbhrAQ5+8LM66So18I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Soheil Hassas Yeganeh <soheil@google.com>, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH] memcg: multi-memcg percpu charge cache
Message-ID: <dieeei3squ2gcnqxdjayvxbvzldr266rhnvtl3vjzsqevxkevf@ckui5vjzl2qg>
References: <20250416180229.2902751-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416180229.2902751-1-shakeel.butt@linux.dev>
X-Migadu-Flow: FLOW_OUT

Andrew, please find another fix/improvements for this patch below.

From: Shakeel Butt <shakeel.butt@linux.dev>
Date: Wed, 30 Apr 2025 08:28:23 -0700
Subject: [PATCH] memcg: multi-memcg percpu charge cache - fix 4

Add comment suggested by Michal and use DEFINE_PER_CPU_ALIGNED instead
of DEFINE_PER_CPU suggested by Vlastimil.

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 mm/memcontrol.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 5a07e0375254..b877287aeb11 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1775,6 +1775,10 @@ void mem_cgroup_print_oom_group(struct mem_cgroup *memcg)
 	pr_cont(" are going to be killed due to memory.oom.group set\n");
 }
 
+/*
+ * The value of NR_MEMCG_STOCK is selected to keep the cached memcgs and their
+ * nr_pages in a single cacheline. This may change in future.
+ */
 #define NR_MEMCG_STOCK 7
 struct memcg_stock_pcp {
 	local_trylock_t stock_lock;
@@ -1791,7 +1795,7 @@ struct memcg_stock_pcp {
 	unsigned long flags;
 #define FLUSHING_CACHED_CHARGE	0
 };
-static DEFINE_PER_CPU(struct memcg_stock_pcp, memcg_stock) = {
+static DEFINE_PER_CPU_ALIGNED(struct memcg_stock_pcp, memcg_stock) = {
 	.stock_lock = INIT_LOCAL_TRYLOCK(stock_lock),
 };
 static DEFINE_MUTEX(percpu_charge_mutex);
-- 
2.47.1

