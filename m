Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029A028D831
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296122; cv=none; b=E/RtpQLsz05MlfcuQRGp6/9+aHYPERoX2YM81ENLAoAK5tFaIpWuvIYJXTktGdapj0fCvdYQkKFNZDtpu6HRyPUql3+Tf+796sSES3aAOO7h6Phcg5BSd/Q6pqRgPCHwCZSje1n/wL8KXS1UOpXocB9s6juXMrfK2NmaKX4xqSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296122; c=relaxed/simple;
	bh=jXB7ckivh7blHEfjcI2FFxFe4jYKAOApDfdeibGdXJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqe7ds2vw/4GDzExMWKsbp0bYM4PLQDfGveEgMvZ6Py6Fmzm/xay6SBuo7QNclF8zcok4YQN+Ra9F9tKb87ZxjJtbDNLgX4T/yjA75gE7uzhnOJMQj88FUP6nnMwsYVgjlFp6TqJmTb0zcE/x2lYbPDCekE5tXR8LIpejJZyS7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJxdA78Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJxdA78Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9045C4CEDD;
	Thu, 10 Apr 2025 14:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744296121;
	bh=jXB7ckivh7blHEfjcI2FFxFe4jYKAOApDfdeibGdXJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJxdA78QVwDOXDsYIzOeZ0oU57Kui8FU2LVRLlJIMztkv4qSlVOqtwl8Cx1V8pDZB
	 820u71vwDm4vFod5Fk8heNfIBco9GpGRhvGZlVwqyUhrPm5s+YXhbHoZw9avvycJd4
	 x7RPc8mGA1ls26fyhnLVETLTd4J2hd1P/F3gZ+KbTzO55zbcfGuSUFhGGuFS87ypF5
	 fXhaILtkmZU4hrFTKTgtu2f1P+zW3uFJVwoBF4HKz8PrOXAj7761TroZjgvUHclZVc
	 j7C6ydNLoe+nGA1WTohxyyvM9r5tqThMGUH8xCCowImqyQmOXDmahv68Oto1x/oN+v
	 eeeoqNnz1oxhQ==
Date: Thu, 10 Apr 2025 17:41:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: gaoxu <gaoxu2@honor.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"surenb@google.com" <surenb@google.com>,
	Barry Song <21cnbao@gmail.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	yipengxiang <yipengxiang@honor.com>
Subject: Re: [PATCH] mm: simplify zone_idx()
Message-ID: <Z_fYsyEA9hSEOoxp@kernel.org>
References: <2d42decac5194c2c8d897b0424f0dcf3@honor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d42decac5194c2c8d897b0424f0dcf3@honor.com>

Hi,

On Thu, Apr 10, 2025 at 12:03:00PM +0000, gaoxu wrote:
> store zone_idx directly in struct zone to simplify and optimize zone_idx()

Do you see an actual speed up somewhere?
 
> Signed-off-by: gao xu <gaoxu2@honor.com>
> ---
>  include/linux/mmzone.h | 3 ++-
>  mm/mm_init.c           | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 4c95fcc9e..7b14f577d 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -941,6 +941,7 @@ struct zone {
>  #endif
>  
>  	const char		*name;
> +	enum zone_type	zone_idx;
>  
>  #ifdef CONFIG_MEMORY_ISOLATION
>  	/*
> @@ -1536,7 +1537,7 @@ static inline int local_memory_node(int node_id) { return node_id; };
>  /*
>   * zone_idx() returns 0 for the ZONE_DMA zone, 1 for the ZONE_NORMAL zone, etc.
>   */
> -#define zone_idx(zone)		((zone) - (zone)->zone_pgdat->node_zones)
> +#define zone_idx(zone)		((zone)->zone_idx)
>  
>  #ifdef CONFIG_ZONE_DEVICE
>  static inline bool zone_is_zone_device(struct zone *zone)
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 9659689b8..a7f7264f1 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1425,6 +1425,7 @@ static void __meminit zone_init_internals(struct zone *zone, enum zone_type idx,
>  	atomic_long_set(&zone->managed_pages, remaining_pages);
>  	zone_set_nid(zone, nid);
>  	zone->name = zone_names[idx];
> +	zone->zone_idx = idx;
>  	zone->zone_pgdat = NODE_DATA(nid);
>  	spin_lock_init(&zone->lock);
>  	zone_seqlock_init(zone);
> -- 
> 2.17.1

-- 
Sincerely yours,
Mike.
