Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C4621D3EE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745952220; cv=none; b=q3F9zgkPM2gr0Sc15nyC5ilh2cwwmpbnzuolSAExpLF8ZxuLHpDc8KU4RdfAsdFz33dk/cRJpqE6EdPvjx5ZuIzjwFYSfAmca8L96L1ywTZk1GIzs1oFmQn7ma85+z0m2/jFVI0ywLXXGRpbX4fwPGkP1yqEhvTlndqsIHN+pVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745952220; c=relaxed/simple;
	bh=CdC9ruIWZ1FfGLg3NH2skEI1pGGNzHOxvsNypspemcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkthIGnxP8/34g7YLT7oQFJ2l/F/xFCPq3ua7gSSUJdpWNIH/NfNKqPaNWmaCyTRwfNopDj4IoSzapiaxdM4RDqi3L1sw1hNqEpppj1VRhtHBXub/Zb+MUvs9kvZU2H/zLDyv3HGY2udkZ+Fc4wvU15+2BZSQVaIr+dASg5/ls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=th0mMmCL; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="th0mMmCL"
Date: Tue, 29 Apr 2025 11:43:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745952215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PbGSqBzLNpWlOS59XTKfG+qwmbQZ2wA+xkjLCzhbwfE=;
	b=th0mMmCLdit+le/j4472txhxqiQcrL+ghmVRPSbgSFWYuubbc7mCKTwcJ/8gtlSNYbV/Cq
	amWkvQki/LnEQ+Q2e78TSE/02jvxqg6JlAIbTwSlCuMgOjGW700pSlaywf9veMyy7FBwtX
	sd92hxP6UYYqX6qUnmCuylOhU3Q9wsw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Vlastimil Babka <vbabka@suse.cz>, 
	Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Soheil Hassas Yeganeh <soheil@google.com>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH] memcg: multi-memcg percpu charge cache
Message-ID: <qt5jtbsgjym655tbnoddlo5c7cemndcgsqwy4wp7m7ki3venxz@cfp637s7eqo6>
References: <20250416180229.2902751-1-shakeel.butt@linux.dev>
 <aBDCXB_Tb2Iaihua@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBDCXB_Tb2Iaihua@tiehlicka>
X-Migadu-Flow: FLOW_OUT

On Tue, Apr 29, 2025 at 02:13:16PM +0200, Michal Hocko wrote:
> 
> > Some of the design choices are:
> > 
> > 1. Fit all caches memcgs in a single cacheline.
> 
> Could you be more specific about the reasoning? I suspect it is for the
> network receive path you are mentioning above, right?
> 

Here I meant why I chose NR_MEMCG_STOCK to be 7. Basically the first
cacheline of per-cpu stock has all the cached memcg, so checking if a
given memcg is cached or not should be comparable cheap as single cached
memcg. You suggested comment already mentioned this.

However please note that we may find in future that 2 cachelines worth of
cached memcgs are better for wider audience/workloads but for simplicity
let's start with single cacheline worth of cached memcgs.

[...]
> 
> Just a minor suggestion below. Other than that looks good to me (with
> follow up fixes) in this thread.
> Acked-by: Michal Hocko <mhocko@suse.com>
> Thanks!
> 

Thanks, I will send a diff for Andrew to squash it into original patch.
