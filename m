Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A704D157487
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446437; cv=none; b=fBEcAbuOttYhlzULVHREy3TNM7KShQ/Y808Jp1kOkNvJJKA/lztaoGjqyfBGRidniQr67dyPnNEn5TJbiS8MmrB2DM5XH4ag43MKkUEY/0EbysKAWYS9XFRNTccZ5pmiWGLt9zyAP/ZmCiTe2gdFr8UMcpYPUYkZNDFbxyxZ84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446437; c=relaxed/simple;
	bh=rzqv/y3yi54Tdp14FpA0KdAPOU65g0x0e/dLqWnvJo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDFCaiPOslNEnWimHXsmsQGB32Gpx3VG/HC7zBKf4+IGrffhBBVOlXbxx7vSO5YpdZ976xEXF1Bvr3jV/SafbJb+dwFZXA645FfK86lJdMsF4UVe9d8bkw8Ple5aJ9Y79Rr6Bq5WRmuqNu5Tx2EHqH6mYvLhrQ1bYw3uULCdyhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FpZ6E9zE; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FpZ6E9zE"
Date: Wed, 23 Apr 2025 15:13:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745446432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+E9cdn9Glqpj5x7uDYNuQcvdwYFdyCr3nSZbwJvgho=;
	b=FpZ6E9zEa+lLOExpS2FXQfpVOhVk22iM5558fY6pBKGIx5nUk5rvnPXAh2Li02cLFagoGK
	OLM3zqppzThUDt8Ebm84CgZtwLFYLtcIdMfSFcs1R1OyAOn4/VEjskTOJEk7sgFeInW5SI
	gWJdZBVbOzkF52EO6pCqjjWzTpIIytI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Huan Yang <link@vivo.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH 1/2] mm/memcg: use kmem_cache when alloc memcg
Message-ID: <dp5frcrqofkjjp77hw5sbkri6etnpdsvxnahs6nazvakaxt6im@xouxw25rggci>
References: <20250423084306.65706-1-link@vivo.com>
 <20250423084306.65706-2-link@vivo.com>
 <20250423145912.3e0062864b6969b3623c8ff6@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423145912.3e0062864b6969b3623c8ff6@linux-foundation.org>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 23, 2025 at 02:59:12PM -0700, Andrew Morton wrote:
> On Wed, 23 Apr 2025 16:43:04 +0800 Huan Yang <link@vivo.com> wrote:
> 
> > @@ -3652,7 +3654,10 @@ static struct mem_cgroup *mem_cgroup_alloc(struct mem_cgroup *parent)
> >  	int __maybe_unused i;
> >  	long error;
> >  
> > -	memcg = kzalloc(struct_size(memcg, nodeinfo, nr_node_ids), GFP_KERNEL);
> > +	memcg = likely(memcg_cachep) ?
> > +			kmem_cache_zalloc(memcg_cachep, GFP_KERNEL) :
> > +			kzalloc(struct_size(memcg, nodeinfo, nr_node_ids),
> > +				GFP_KERNEL);
> 
> Why are we testing for memcg_cachep=NULL?
> 
> > @@ -5055,6 +5061,10 @@ static int __init mem_cgroup_init(void)
> >  		INIT_WORK(&per_cpu_ptr(&memcg_stock, cpu)->work,
> >  			  drain_local_stock);
> >  
> > +	memcg_size = struct_size_t(struct mem_cgroup, nodeinfo, nr_node_ids);
> > +	memcg_cachep = kmem_cache_create("mem_cgroup", memcg_size, 0,
> > +					 SLAB_PANIC | SLAB_HWCACHE_ALIGN, NULL);
> 
> If it's because this allocation might have failed then let's not
> bother.  If an __init-time allocation failed, this kernel is unusable
> anyway.

+1 to Andrew's point. SLAB_PANIC is used here, so, memcg_cachep can't be
NULL later.
