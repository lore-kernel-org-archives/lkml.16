Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA47139B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254333; cv=none; b=jESihkqZQO/pJhG5ox/Ha7t8Jm+1x9GhfPJvD+Mf1HpIcafsoBzrU5fIJhOqoFE0TrpGQUJOAnDI91O+KFUDTl14tTD/ucHpuXlYCYJsvmg+sq4JWcqkZT9+gX5qZUPXg6YHLC2WhFa3PxttDlg78Tb/o/W8EKsizdqPCUWCGkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254333; c=relaxed/simple;
	bh=3k98Io1QTx6IRoPXz8JkaXG7p7qNcRagcaNixMCOUGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdxazQG6cRO03xrJaTcDSbphmf33gc/Ys+h2Xj4Sesk/yoU93tR+dIThTgi4DrzRpk+BObiomX2zoZIGnbGUE5A3OfrfIs0UGL+5ZdOiqOd1GtF9IPgeanroQ8I6x+t1bwM10z4ZYQJJk9LS+5gD+ByPrdmqYHk/41BGo+2latU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qAFZ8Z+Z; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qAFZ8Z+Z"
Date: Thu, 30 Jan 2025 16:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738254328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HXmUpHRAcd9Dqw8KbMdRCX56lRwURZhh6mzyeuYgXZs=;
	b=qAFZ8Z+ZQaKlFOJEFfwumYz86N1Vz0BHZXVp6kC1t2wnoHCswh+vi3ckCzGFLFIQ9TyQaf
	rwtHnd7IYqwTP3bd2OHyoFCrhh9zQw43T/sazS1/oRho6dKYpesqWA41se2f/HdZGhYJcX
	4OOrp9NT3ofvFt+q1elqDbbvnutitvk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv1 1/6] zsmalloc: factor out pool locking helpers
Message-ID: <Z5un85j5P2Z7B9sg@google.com>
References: <20250129064853.2210753-1-senozhatsky@chromium.org>
 <20250129064853.2210753-2-senozhatsky@chromium.org>
 <Z5pec33BWqdH_rCN@google.com>
 <blqetdedmmvheg4qri2o4gxbtiq7lz5ufcpacrrw7yvej7rcnp@i46mdzf7gqhk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <blqetdedmmvheg4qri2o4gxbtiq7lz5ufcpacrrw7yvej7rcnp@i46mdzf7gqhk>
X-Migadu-Flow: FLOW_OUT

On Thu, Jan 30, 2025 at 01:01:15PM +0900, Sergey Senozhatsky wrote:
> On (25/01/29 16:59), Yosry Ahmed wrote:
> > On Wed, Jan 29, 2025 at 03:43:47PM +0900, Sergey Senozhatsky wrote:
> > > We currently have a mix of migrate_{read,write}_lock() helpers
> > > that lock zspages, but it's zs_pool that actually has a ->migrate_lock
> > > access to which is opene-coded.  Factor out pool migrate locking
> > > into helpers, zspage migration locking API will be renamed to
> > > reduce confusion.
> > 
> > But why did we remove "migrate" from the helpers' names if this is the
> > real migrate lock? It seems like the real problem is how the zspage lock
> > helpers are named, which is addressed later.
> 
> So this is deliberately.  I guess, just like with page-faults in
> zs_map_object(), this naming comes from the time when we had fewer
> locks and less functionality.  These days we have 3 zsmalloc locks that
> can "prevent migration" at different points.  Even size class spin-lock.
> But it's not only about migration anymore.  We also now have compaction
> (defragmentation) that these locks synchronize.  So I want to have a
> reader-write naming scheme.

In this case shouldn't we also rename the lock itself?

> 
> > >  struct zs_pool {
> > > -	const char *name;
> > > +	/* protect page/zspage migration */
> > > +	rwlock_t migrate_lock;
> > >  
> > >  	struct size_class *size_class[ZS_SIZE_CLASSES];
> > >  	struct kmem_cache *handle_cachep;
> > > @@ -213,6 +214,7 @@ struct zs_pool {
> > >  	atomic_long_t pages_allocated;
> > >  
> > >  	struct zs_pool_stats stats;
> > > +	atomic_t compaction_in_progress;
> > >  
> > >  	/* Compact classes */
> > >  	struct shrinker *shrinker;
> > > @@ -223,11 +225,35 @@ struct zs_pool {
> > >  #ifdef CONFIG_COMPACTION
> > >  	struct work_struct free_work;
> > >  #endif
> > > -	/* protect page/zspage migration */
> > > -	rwlock_t migrate_lock;
> > > -	atomic_t compaction_in_progress;
> > > +
> > > +	const char *name;
> > 
> > Are the struct moves relevant to the patch or just to improve
> > readability?
> 
> Relevance is relative :)  That moved from the patch which also
> converted the lock to rwsem.  I'll move this to a separate
> patch.
> 
> > I am generally scared to move hot members around unnecessarily
> > due to cache-line sharing problems -- although I don't know if
> > these are really hot.
> 
> Size classes are basically static - once we init the array it
> becomes RO.  Having migrate_lock at the bottom forces us to
> jump over a big RO zs_pool region, besides we never use ->name
> (unlike migrate_lock) so having it at offset 0 is unnecessary.

What's special about offset 0 though?

My understanding is that we want to put RW-mostly and RO-mostly members
apart to land in different cachelines to avoid unnecessary bouncing.
Also we want the elements that are usually accessed together next to one
another.

Placing the RW lock right next to the RO size classes seems like it will
result in unnecessary cacheline bouncing. For example, if a CPU holds
the lock and dirties the cacheline then all other CPUs have to drop it
and fetch it again when accessing the size classes.

> zs_pool_stats and compaction_in_progress are modified only
> during compaction, which we do not run in parallel (only one
> CPU can do compaction at a time), so we can do something like

But other CPUs can read compaction_in_progress, even if they don't
modify it.

> 
> ---
> 
>  struct zs_pool {
> -       const char *name;
> +       /* protect page/zspage migration */
> +       rwlock_t migrate_lock;
>  
>         struct size_class *size_class[ZS_SIZE_CLASSES];
>
>
> -       struct kmem_cache *handle_cachep;
> -       struct kmem_cache *zspage_cachep;
>  
>         atomic_long_t pages_allocated;
>  
> -       struct zs_pool_stats stats;
> +       struct kmem_cache *handle_cachep;
> +       struct kmem_cache *zspage_cachep;
>  
>         /* Compact classes */
>         struct shrinker *shrinker;
> @@ -223,9 +223,9 @@ struct zs_pool {
>  #ifdef CONFIG_COMPACTION
>         struct work_struct free_work;
>  #endif
> -       /* protect page/zspage migration */
> -       rwlock_t migrate_lock;
> +       const char *name;
>         atomic_t compaction_in_progress;
> +       struct zs_pool_stats stats;
>  };
