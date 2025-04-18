Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E81277003
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982800; cv=none; b=nfT8fJWVmE+hjIYD6pE+61KjXBnbm8jSIqFdiayNykxol/9NDk/5WtLV7iK5ozJce04deCf0BreUGDsL2q2W0HIuArN4xRQo9fZNBNgsIM0LEVFSItHnsKTnWGm0ynv1j+da8ajbDuFpHSwBUnnULeOED67qWcvNNBQOt9X7rcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982800; c=relaxed/simple;
	bh=vo1u5R7CKFHLY5Pcf+O8cErwwCHr2sj55TDkno4Z8n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8mBTCtHzX/3Ey8tLGZwPdQTvefSmasDFbIxGyC2Wfeyaz68x9/OrtdNSZRGlhpx/BmXLZtPLA0XsJE0+KLvYvMmW9cXbvcuoqLIklXCgZnqTchC/nuwujfAHsAFFatiCcZToJmcr7MvDBARIuSSA3xyLDog2qLXYzO4P7yAd9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dpP0vGNN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dpP0vGNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744982796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SIni5x89I32+x4VeAQQr3m0SnK0e1Dbju4MMocfjk+I=;
	b=dpP0vGNNgsh6DZRacArBC7N37HHYSAb7KoyuRvZ4j3irY7UAqe02eOWXQm74xxXShL6huE
	zxyhxdBmYlEf0grLut3J/x3oHwUpY+NPPYUEGUaZB5Q9nRNE3alJ4RSjp2jWUM93bK5wRY
	6l3pzMMPXCjLhp09m75eyv1rv2A8ZwE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-537-mM6__yF-McWgbZq-SUA0vg-1; Fri,
 18 Apr 2025 09:26:32 -0400
X-MC-Unique: mM6__yF-McWgbZq-SUA0vg-1
X-Mimecast-MFC-AGG-ID: mM6__yF-McWgbZq-SUA0vg_1744982791
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE2CE18004A7;
	Fri, 18 Apr 2025 13:26:30 +0000 (UTC)
Received: from localhost (unknown [10.72.112.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9BC9A180094C;
	Fri, 18 Apr 2025 13:26:29 +0000 (UTC)
Date: Fri, 18 Apr 2025 21:26:25 +0800
From: Baoquan He <bhe@redhat.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [PATCH 4/4] vmalloc: Align nr_vmalloc_pages and vmap_lazy_nr
Message-ID: <aAJTAUwhP1w8v9rD@MiWiFi-R3L-srv>
References: <20250417161216.88318-1-urezki@gmail.com>
 <20250417161216.88318-4-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417161216.88318-4-urezki@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 04/17/25 at 06:12pm, Uladzislau Rezki (Sony) wrote:
> Currently both atomics share one cache-line:
> 
> <snip>
> ...
> ffffffff83eab400 b vmap_lazy_nr
> ffffffff83eab408 b nr_vmalloc_pages
> ...
> <snip>
> 
> those are global variables and they are only 8 bytes apart.
> Since they are modified by different threads this causes a
> false sharing. This can lead to a performance drop due to
> unnecessary cache invalidations.
> 
> After this patch it is aligned to a cache line boundary:
> 
> <snip>
> ...
> ffffffff8260a600 d vmap_lazy_nr
> ffffffff8260a640 d nr_vmalloc_pages

A great catch and improvement.

Reviewed-by: Baoquan He <bhe@redhat.com>

> ...
> <snip>
> 
> Cc: Mateusz Guzik <mjguzik@gmail.com>
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  mm/vmalloc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 77da4613f07ff..54f60d62051da 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -1008,7 +1008,8 @@ static BLOCKING_NOTIFIER_HEAD(vmap_notify_list);
>  static void drain_vmap_area_work(struct work_struct *work);
>  static DECLARE_WORK(drain_vmap_work, drain_vmap_area_work);
>  
> -static atomic_long_t nr_vmalloc_pages;
> +static __cacheline_aligned_in_smp atomic_long_t nr_vmalloc_pages;
> +static __cacheline_aligned_in_smp atomic_long_t vmap_lazy_nr;
>  
>  unsigned long vmalloc_nr_pages(void)
>  {
> @@ -2117,8 +2118,6 @@ static unsigned long lazy_max_pages(void)
>  	return log * (32UL * 1024 * 1024 / PAGE_SIZE);
>  }
>  
> -static atomic_long_t vmap_lazy_nr = ATOMIC_LONG_INIT(0);
> -
>  /*
>   * Serialize vmap purging.  There is no actual critical section protected
>   * by this lock, but we want to avoid concurrent calls for performance
> -- 
> 2.39.5
> 

