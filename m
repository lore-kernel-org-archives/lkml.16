Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C10779D2
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748568689; cv=none; b=YIW3Jw2UlaVMkXL3y5hfSvFREbJRStnB+QN7s5vazMGxfEq48jGb4y8dJ9BFZBmytbhvCnd0BqOLBn07qEEgPfIQAE0ewO4iKTo4sjPfgEi+8oAkOAoaLCMe+nffD3MGRWSbu3DgHRsrBePn7vax85w5xc3cu5PYtLSWtlxJBDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748568689; c=relaxed/simple;
	bh=uuTB8bMd6gInP6dfYaFOvUuBJ9jJx4I+deFrXc2J88g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YrZPub39hR+MVgJskIp+M2Q9LZIAsQn0DGmTA0GoIDx5Z48ZiYKsW6hqwvHbeOllKpcKXwjkKHJWMI3iDWb06TJokZvQauMwJa4/6vBrZCbHjtEJYbt/4sPvrc/ZhYTW7qpW/kos2Def9Cd9BeeUh3BqJg7E9kbwb2y/2lXLQPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=INo5MmX7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="INo5MmX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748568686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ExT/M5gz+/SlNb06ZwhuoetSWbpQ598xfuRjW/WvDhc=;
	b=INo5MmX73K8lk++cU2KxMjvRzhP6rEQHhYMEQSm1V9br4W+HkgsKAf2X3qqdDG8vCNabOq
	F/ujnTVJMTCHVEIi/CtQrEd9vR9nkklTwqRmkOUkyRcCmUGPqwDUlXtVhXdbZtBIXN8QO/
	DJhlF4fQ6oZ9HzbkgnqKNH68f6OW57I=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-696--yCsk8RrONOypx7wt6dRkA-1; Thu,
 29 May 2025 21:31:22 -0400
X-MC-Unique: -yCsk8RrONOypx7wt6dRkA-1
X-Mimecast-MFC-AGG-ID: -yCsk8RrONOypx7wt6dRkA_1748568681
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB45F180087F;
	Fri, 30 May 2025 01:31:20 +0000 (UTC)
Received: from localhost (unknown [10.72.112.13])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5BDB2180047F;
	Fri, 30 May 2025 01:31:18 +0000 (UTC)
Date: Fri, 30 May 2025 09:31:08 +0800
From: Baoquan He <bhe@redhat.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, hannes@cmpxchg.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] mm: swap: move nr_swap_pages counter decrement from
 folio_alloc_swap() to swap_range_alloc()
Message-ID: <aDkKXOisEB43+i6J@MiWiFi-R3L-srv>
References: <20250522122554.12209-1-shikemeng@huaweicloud.com>
 <20250522122554.12209-2-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522122554.12209-2-shikemeng@huaweicloud.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 05/22/25 at 08:25pm, Kemeng Shi wrote:
> When folio_alloc_swap() encounters a failure in either
> mem_cgroup_try_charge_swap() or add_to_swap_cache(), nr_swap_pages counter
> is not decremented for allocated entry. However, the following
> put_swap_folio() will increase nr_swap_pages counter unpairly and lead to
> an imbalance.
> 
> Move nr_swap_pages decrement from folio_alloc_swap() to swap_range_alloc()
> to pair the nr_swap_pages counting.
> 
> Fixes: 0ff67f990bd45 ("mm, swap: remove swap slot cache")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
>  mm/swapfile.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

LGTM,

Reviewed-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 026090bf3efe..75b69213c2e7 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -1115,6 +1115,7 @@ static void swap_range_alloc(struct swap_info_struct *si,
>  		if (vm_swap_full())
>  			schedule_work(&si->reclaim_work);
>  	}
> +	atomic_long_sub(nr_entries, &nr_swap_pages);
>  }
>  
>  static void swap_range_free(struct swap_info_struct *si, unsigned long offset,
> @@ -1313,7 +1314,6 @@ int folio_alloc_swap(struct folio *folio, gfp_t gfp)
>  	if (add_to_swap_cache(folio, entry, gfp | __GFP_NOMEMALLOC, NULL))
>  		goto out_free;
>  
> -	atomic_long_sub(size, &nr_swap_pages);
>  	return 0;
>  
>  out_free:
> -- 
> 2.30.0
> 

