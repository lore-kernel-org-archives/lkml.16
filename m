Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DF39461
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748652; cv=none; b=DX/gX/32m8ma160f3Ps9zn8OK+ruHarX4ozb20E746UUql0nU0zrq25M0w1acA41u2Yr1D5E80hi2FvYkZW9WcEmKjmtekGQxBthNBsRd+gK99tYLm2XXye4fp1To+jWURUHufyrT4LM15AnqpnAQjhdL9/u7B/xvCoJU71Qk0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748652; c=relaxed/simple;
	bh=wjsU1mY6pdp3zY0VqnUCJPi1kpOGwF5oZ2v59ah1BEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npeZt6yGZpuSbD9w/aOrXzhr+VTWqD6OfslwAayS/iUr/4RMuhepOn8rfk9aZ8wFsU8UvWJie9TBuDgBsBjac3kYchT+zDQk2jDwBTmPu5kB5Zo+o/F7+tp4dNjejgkRtA310isw3LGxTRthtCDmjz4R0dQc+usyvTaQIsdp078=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=i3jOTG7h; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="i3jOTG7h"
Date: Tue, 20 May 2025 09:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747748647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGr+kSgbuRg7CaxuG8M/R7pLnPrjwbA83Xss8apQ3wY=;
	b=i3jOTG7hT8HlPiGsOD1Luahi1hnmA+d00NewRPtzTd36ZvmUS4zHHmPD5GdMbPI7EPBrVK
	SL0DSu2BB/MCt/iPV4jmMCrrrTOlthAy9o0r/oPTg7RgbgqLGwIW+/nOf2wsNC0w+9eYUj
	PjfgHUFqWHYwKpi7xJDq6EzmOCpo3RE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, surenb@google.com, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, vlad.wing@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions
 non-contiguously
Message-ID: <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520122547.1317050-1-usamaarif642@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, May 20, 2025 at 01:25:46PM +0100, Usama Arif wrote:
> When memory allocation profiling is running on memory bound services,
> allocations greater than order 0 for slab object extensions can fail,
> for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 bytes
> per slabobj_ext (order 1 allocation). Use kvcalloc to improve chances
> of the allocation being successful.
> 
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
> ---
>  mm/slub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index dc9e729e1d26..bf43c403ead2 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
>  	gfp &= ~OBJCGS_CLEAR_MASK;
>  	/* Prevent recursive extension vector allocation */
>  	gfp |= __GFP_NO_OBJ_EXT;
> -	vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> +	vec = kvcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
>  			   slab_nid(slab));

And what's the latency going to be on a vmalloc() allocation when we're
low on memory?
