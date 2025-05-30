Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480D1186A
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748582665; cv=none; b=DfTVVznlC4IzSQKlbrhT8RIGDYVuJ/dLPClLyHC8Ki0qmDEVxVVIZt/Nz3F8cc3YxwB3lgI4+Mv6saHw7Gu+Ar0jMf4G/KBaYEdk2JZOc03pXn3xjU7ehd3CYOUvz2pXv3/pRVFFcSNen0qOQBCy45PbygYV+/4oPg8ddTHmXYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748582665; c=relaxed/simple;
	bh=zXsvoQoYzZG+yyNyN4dvve3t7tSC4w/HMSbkxNieZaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOY2ZBxEWuHekaSMl79f9Glb473dCrM67jAPwXy5orfReH6Aly3ehB4pVCKaT59nTfVavUlaQ8kAgu0RwYro+tzD1WYHYc8+EsRIF7E7PvoFvWKmVh4mbUXh/UeHCksNzsdKQJFRyWEjGvu2ttLJN/euztY6MQrooO1Y1MRUSZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YswzHu0x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YswzHu0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748582662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0ktySp/azTrCQL0RO8tR5rVfOyqkae8In8+R+OPxIQM=;
	b=YswzHu0xruML0cRFLFH2DZEeofMvc3fxbwDuA5lk7US0u9/b6VxNJTyjq7wnSGWa0ORZ9S
	53YawfVHRixijl2R9DkTGKSnC7zkYErELCXsTMEXtcbEfT0jNVe2+nphjpsFqegZi83/Ee
	73oh46ZzfftGqu/twvW7qld54VUF5PI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-U53o6Mj6MBGqoEmg9cni1Q-1; Fri,
 30 May 2025 01:24:16 -0400
X-MC-Unique: U53o6Mj6MBGqoEmg9cni1Q-1
X-Mimecast-MFC-AGG-ID: U53o6Mj6MBGqoEmg9cni1Q_1748582655
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E4AE1180035C;
	Fri, 30 May 2025 05:24:14 +0000 (UTC)
Received: from localhost (unknown [10.72.112.13])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8DC1918003FC;
	Fri, 30 May 2025 05:24:11 +0000 (UTC)
Date: Fri, 30 May 2025 13:24:07 +0800
From: Baoquan He <bhe@redhat.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, hannes@cmpxchg.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mm: swap: remove stale comment stale comment in
 cluster_alloc_swap_entry()
Message-ID: <aDlA97iV4uUaGHZv@MiWiFi-R3L-srv>
References: <20250522122554.12209-1-shikemeng@huaweicloud.com>
 <20250522122554.12209-5-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522122554.12209-5-shikemeng@huaweicloud.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 05/22/25 at 08:25pm, Kemeng Shi wrote:
> As cluster_next_cpu was already dropped, the associated comment is stale
> now.
> 
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
>  mm/swapfile.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 63ab9f14b2c6..8525515fb06c 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -956,9 +956,8 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si, int o
>  	}
>  
>  	/*
> -	 * We don't have free cluster but have some clusters in
> -	 * discarding, do discard now and reclaim them, then
> -	 * reread cluster_next_cpu since we dropped si->lock
> +	 * We don't have free cluster but have some clusters in discarding,
> +	 * do discard now and reclaim them.
>  	 */
>  	if ((si->flags & SWP_PAGE_DISCARD) && swap_do_scheduled_discard(si))
>  		goto new_cluster;
> -- 
> 2.30.0
> 

