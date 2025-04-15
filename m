Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78252186294
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727936; cv=none; b=tBNhM4tR5Iv2nvZJSFuKCzbOyZHTTLns/XRaazmDwmcKdaWUYF5QiPFnrmOb5ddl+8RD5KTe6QMdTSG+vq6n7qSO2vMRCee08sRz3O25/mX4UkYTfrQmme5absWcI8NjZiSxcFVsUxwSCy2odBtxFXIof+pUoTQA95K/lihC3HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727936; c=relaxed/simple;
	bh=kYi/G7DS8yucADl/KkyCY0+Cn23HSPgimqEVlmD5PT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfOXWhRvke4gr3783DNFleKSWu9W+2B+a+PJ9rC25pTcUf4ZCW5RYy01RgXSuowrcHEK0FO7Z/4ueVhj9iE45e/tCQu4+ndlkiqG1hnfPRgFvEvvJ3rYd7yPQRUGMn9SxXAmaS2NKGW5kKuLXpirDwEWnXyrOi4ehxDyT3OgQAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hM4WdmUE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hM4WdmUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744727933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yWIjLbUYw25/PQVcItxs9iUgezbC0x0pYB89p458ZAQ=;
	b=hM4WdmUEJtu71CZ5wZtoN6DHyIhIx62ViLXrIACURqlRVMJCE+CHc4uLlnA/twnRKqdbzL
	nPPVTnu3Cv8pd1tRqhhYy/0iVgQ6FDKd2wF8ORnpNkP3FGCLge+fp4qTZSp2pBrp7l5y81
	4VsjjyQ5qEO9zfiIMoIHQIdVjKpGggA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-671-cl1ikxPrO7WSHGtsHXvuJQ-1; Tue,
 15 Apr 2025 10:38:50 -0400
X-MC-Unique: cl1ikxPrO7WSHGtsHXvuJQ-1
X-Mimecast-MFC-AGG-ID: cl1ikxPrO7WSHGtsHXvuJQ_1744727929
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A23DE19560B7;
	Tue, 15 Apr 2025 14:38:48 +0000 (UTC)
Received: from localhost (unknown [10.72.112.38])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 193C019560AD;
	Tue, 15 Apr 2025 14:38:46 +0000 (UTC)
Date: Tue, 15 Apr 2025 22:38:38 +0800
From: Baoquan He <bhe@redhat.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH] vmalloc: Use atomic_long_add_return_relaxed()
Message-ID: <Z/5vbrTJPvQ2lA8R@MiWiFi-R3L-srv>
References: <20250415112646.113091-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415112646.113091-1-urezki@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 04/15/25 at 01:26pm, Uladzislau Rezki (Sony) wrote:
> Switch from the atomic_long_add_return() to its relaxed version.
> 
> We do not need a full memory barrier or any memory ordering during
> increasing the "vmap_lazy_nr" variable. What we only need is to do it
> atomically. This is what atomic_long_add_return_relaxed() guarantees.
> 
> AARCH64:
> 
> <snip>
> Default:
>     40ec:       d34cfe94        lsr     x20, x20, #12
>     40f0:       14000044        b       4200 <free_vmap_area_noflush+0x19c>
>     40f4:       94000000        bl      0 <__sanitizer_cov_trace_pc>
>     40f8:       90000000        adrp    x0, 0 <__traceiter_alloc_vmap_area>
>     40fc:       91000000        add     x0, x0, #0x0
>     4100:       f8f40016        ldaddal x20, x22, [x0]
>     4104:       8b160296        add     x22, x20, x22
> 
> Relaxed:
>     40ec:       d34cfe94        lsr     x20, x20, #12
>     40f0:       14000044        b       4200 <free_vmap_area_noflush+0x19c>
>     40f4:       94000000        bl      0 <__sanitizer_cov_trace_pc>
>     40f8:       90000000        adrp    x0, 0 <__traceiter_alloc_vmap_area>
>     40fc:       91000000        add     x0, x0, #0x0
>     4100:       f8340016        ldadd   x20, x22, [x0]
>     4104:       8b160296        add     x22, x20, x22
> <snip>
> 
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  mm/vmalloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 7bb32f498d39..9d4027041a3f 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2370,7 +2370,7 @@ static void free_vmap_area_noflush(struct vmap_area *va)
>  	if (WARN_ON_ONCE(!list_empty(&va->list)))
>  		return;
>  
> -	nr_lazy = atomic_long_add_return(va_size(va) >> PAGE_SHIFT,
> +	nr_lazy = atomic_long_add_return_relaxed(va_size(va) >> PAGE_SHIFT,
>  					 &vmap_lazy_nr);

LGTM,

Reviewed-by: Baoquan He <bhe@redhat.com>

