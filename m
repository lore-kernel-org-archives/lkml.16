Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8E1134CF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 04:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743655071; cv=none; b=fHXyfIuCrKH245Bskc/5YV+jylookTFAxSBuFBptcgIBZ9+Dz4N6W5HRJ9lCslkzfKFFiFzhuBC/PXEpa0Ba46jDAaEt6jzRdATvkLqOOub2PO/Kz5ms1SjoGHNlxx5A+Zy2TbKU2GuSe3C2gb2SeBrMz21udo4H35xXspC3xYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743655071; c=relaxed/simple;
	bh=65mgTgXyakqVGK6V/KPoe6wVrJLNqccqmkDx6o1nmPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DuQGJLHigGQyusDZhSkstNKSaZFh2BO67MrOIvTkyBk7KsK6mMITr2byyuHXi+oHvyPjkCYxSMJ74yETVn+c33QJ74hjGSQXcWZU14rNuPRMwEgqyvfVPnKgk80TvTBKVgfpnULmhVzBDVw6aAkQTFkjntur1VpUYYiGjY1dgDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FHn1TOTU; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FHn1TOTU"
Date: Wed, 2 Apr 2025 21:37:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743655065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EqjBm8UI34Pk1sLBpujvX1ZrayvDU7fkd+T64DGWC1I=;
	b=FHn1TOTUCWFWHcHkaAxmhzZeDrzOFzWqsKhKW3fEVlc/hkwtVMRbCYPazPt96dZRLud7YI
	LwUaB+9kS65MHR1Pd526w0qNgsicQWtNt176kBUlBDT8rzbn2ZrG0SsaCmEJlvTI8v9qDg
	x3SMNAhi+5Ko2pNLx+8BA6yjygsN56Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Michal Hocko <mhocko@suse.com>
Cc: Dave Chinner <david@fromorbit.com>, Yafang Shao <laoar.shao@gmail.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Kees Cook <kees@kernel.org>, joel.granados@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
	linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] proc: Avoid costly high-order page allocations when
 reading proc files
Message-ID: <zeuszr6ot5qdi46f5gvxa2c5efy4mc6eaea3au52nqnbhjek7o@l43ps2jtip7x>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
 <Z-0gPqHVto7PgM1K@dread.disaster.area>
 <Z-0sjd8SEtldbxB1@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-0sjd8SEtldbxB1@tiehlicka>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 02, 2025 at 02:24:45PM +0200, Michal Hocko wrote:
> diff --git a/mm/util.c b/mm/util.c
> index 60aa40f612b8..8386f6976d7d 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -601,14 +601,18 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
>  	 * We want to attempt a large physically contiguous block first because
>  	 * it is less likely to fragment multiple larger blocks and therefore
>  	 * contribute to a long term fragmentation less than vmalloc fallback.
> -	 * However make sure that larger requests are not too disruptive - no
> -	 * OOM killer and no allocation failure warnings as we have a fallback.
> +	 * However make sure that larger requests are not too disruptive - i.e.
> +	 * do not direct reclaim unless physically continuous memory is preferred
> +	 * (__GFP_RETRY_MAYFAIL mode). We still kick in kswapd/kcompactd to start
> +	 * working in the background but the allocation itself.
>  	 */
>  	if (size > PAGE_SIZE) {
>  		flags |= __GFP_NOWARN;
>  
>  		if (!(flags & __GFP_RETRY_MAYFAIL))
>  			flags |= __GFP_NORETRY;
> +		else
> +			flags &= ~__GFP_DIRECT_RECLAIM;

I think you wanted the following instead:

		if (!(flags & __GFP_RETRY_MAYFAIL))
			flags &= ~__GFP_DIRECT_RECLAIM;

This is what Dave is asking as well for kmalloc() case of kvmalloc().

>  
>  		/* nofail semantic is implemented by the vmalloc fallback */
>  		flags &= ~__GFP_NOFAIL;
> -- 
> Michal Hocko
> SUSE Labs
