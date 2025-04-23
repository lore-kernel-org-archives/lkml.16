Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A4B2701BF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745449168; cv=none; b=ecZxJD75X1s3cVn5YtIK+SQREVFcdIdUgLdhrHtBgECeu7FbD8+rbWGvKj/eHj+1dkuVMgJg9bFxxl8Pic+LvaFhZaeYCRThccFT5fhtwHBXKtM4n6RY+tfmSHl/K/M48q3gaBxXZONwKumTgmcqY3vzvEmBOtMmNdgSq01GAwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745449168; c=relaxed/simple;
	bh=ANM1L0fguovtc5G10RZhCVZ6sfOMQzacN9PCVs7IQb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzwKpqI4Hngt7w3gQZAxbkmgvvbQnWrhPhpZ4ipSokqj8M0H8NkLxVO+lGI6LPRZzit4xiMSk+EUmBo+xRyIQZHPuuK0vHorh/aFTRA6XMw6znSW5lm3pQQyhLiHAdjk1rW7wfxsU1NUj+tIgj4TPYHnxjhbcPoYmYj2StKuJUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R/jHDlrK; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R/jHDlrK"
Date: Wed, 23 Apr 2025 15:59:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745449163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FD1aCXz6k1Jg0AnKxmnZHvXUq4o3mf+YIXA3Fl6SqoY=;
	b=R/jHDlrKZgVW0GCW96rhyiqI6YnD5xtDMGwoo1oNLRj2fVRKDrh6KmAIm7qD90e8JubDzX
	ua56Bp6ukaev27wDIN48iLTDca/GfUdS5y6ny4gwJtK+9RnXs3H3fqd+QI4l3374GuaBtv
	5aNZfIGGaoVtYBpacUKmrF7iPdrzK3Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, Eric Dumazet <edumazet@google.com>, 
	Soheil Hassas Yeganeh <soheil@google.com>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH] memcg: multi-memcg percpu charge cache
Message-ID: <agazegt7js4jrbbng2di33xggfswxgrdrojoiqh4vaqxxmdidj@zmyzkgfuhykl>
References: <20250416180229.2902751-1-shakeel.butt@linux.dev>
 <20250422181022.308116c1@kernel.org>
 <ha4sqstdknwvvubs2g33r3itrabepz2jwlr3ksrbjdlgjnbuel@appekpf6ffud>
 <20250423153046.54d135f2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423153046.54d135f2@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 23, 2025 at 03:30:46PM -0700, Jakub Kicinski wrote:
> On Wed, 23 Apr 2025 15:16:56 -0700 Shakeel Butt wrote:
> > > > -	if (!local_trylock_irqsave(&memcg_stock.stock_lock, flags)) {
> > > > +	if (nr_pages > MEMCG_CHARGE_BATCH ||
> > > > +	    !local_trylock_irqsave(&memcg_stock.stock_lock, flags)) {
> > > >  		/*
> > > > -		 * In case of unlikely failure to lock percpu stock_lock
> > > > -		 * uncharge memcg directly.
> > > > +		 * In case of larger than batch refill or unlikely failure to
> > > > +		 * lock the percpu stock_lock, uncharge memcg directly.
> > > >  		 */  
> > > 
> > > We're bypassing the cache for > CHARGE_BATCH because the u8 math 
> > > may overflow? Could be useful to refocus the comment on the 'why'
> > 
> > We actually never put more than MEMCG_CHARGE_BATCH in the cache and thus
> > we can use u8 as type here. Though we may increase the batch size in
> > future, so I should put a BUILD_BUG_ON somewhere here.
> 
> No idea if this matters enough to deserve its own commit but basically
> I was wondering if that behavior change is a separate optimization.
> 
> Previously we'd check if the cache was for the releasing cgroup and sum
> was over BATCH - drain its stock completely. Now we bypass looking at
> the cache if nr_pages > BATCH so the cgroup may retain some stock.

Yes indeed there is a little bit behavior change as you have explained.
The older behavior (fully drain if nr_pages > BATCH) might be due to
single per-cpu memcg cache limitation and in my opinion is problematic
in some scenarios. If you see commit 5387c90490f7 ("mm/memcg: improve
refill_obj_stock() performance"), a very similar behavior for objcg
cache was having a performance impact and was optimized by only allowing
the drain for some code paths. With multi-memcg support, I think we
don't need to worry about it. Multi-objcg per-cpu cache is also on my
TODO list.

