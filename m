Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503393234
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 01:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751852872; cv=none; b=o5zMP4YsvL4KWpUJUilWYbOxAJdGW05FjoAGcgodS6TkhT6sAldxZ+f+7bybOLT+lkbZ+chVInYGLgJnsy8/SJtZ7i1Qcc5Pt1At03fGmntK+UwV6TXH/HMGNocNa1Q1RO3jHgzge9yZopnpU/MCAMqh4/5b64gKSkoZ575mqeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751852872; c=relaxed/simple;
	bh=3yCNEXJheNxJ+E4JEkYrJIJ0FCoyCQdL03vOw9Tq2/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syq61apMhRDQPn5ogGNAw4kUVHFzLezkqw6Ga0qEhQbzJxhlrHuGS6bCXHOeD3+SeMIj+hq00AxLi291obU2y1STLiKXwamrzePEKNbznzMlSXS4L9YW2Jj244frUmq9o5XypJA+5z9j5y894VGPP4LZfOSxar5g3LXlY8jDLEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EREvv7Bh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EREvv7Bh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751852869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/W2YF/gvP/DLp/ARaAeE9iRBNkC+Eys8vYw5JjQSL0=;
	b=EREvv7BhMfc2goms42MV8ilNq01yOm58nO7pLWd0uqkKM80yjjzEc8FRU7GIWGfxR+YaxO
	l/9r1rGqY1BUduSaig3Oyzu6i/R2ddQvU8lXuB5AnvuUIZgd4A9hwQVMET9DyZ36MQqe5A
	ogIEzIKG7ezFJotfOYxMAIAdIbLh2bg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-680-dzVr7NIlN7utzYeZzBoZew-1; Sun,
 06 Jul 2025 21:47:45 -0400
X-MC-Unique: dzVr7NIlN7utzYeZzBoZew-1
X-Mimecast-MFC-AGG-ID: dzVr7NIlN7utzYeZzBoZew_1751852864
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3AABB19560A1;
	Mon,  7 Jul 2025 01:47:44 +0000 (UTC)
Received: from localhost (unknown [10.72.112.60])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 03BE2180045B;
	Mon,  7 Jul 2025 01:47:42 +0000 (UTC)
Date: Mon, 7 Jul 2025 09:47:38 +0800
From: Baoquan He <bhe@redhat.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>
Subject: Re: [RFC 4/7] mm/kasan, mm/vmalloc: Respect GFP flags in
 kasan_populate_vmalloc()
Message-ID: <aGsnOm4ImBjp5kMN@MiWiFi-R3L-srv>
References: <20250704152537.55724-1-urezki@gmail.com>
 <20250704152537.55724-5-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704152537.55724-5-urezki@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 07/04/25 at 05:25pm, Uladzislau Rezki (Sony) wrote:
......snip.......
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index d2c70cd2afb1..5edfc1f6b53e 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -335,13 +335,13 @@ static void ___free_pages_bulk(struct page **pages, int nr_pages)
>  	}
>  }
>  
> -static int ___alloc_pages_bulk(struct page **pages, int nr_pages)
> +static int ___alloc_pages_bulk(struct page **pages, int nr_pages, gfp_t gfp_mask)
>  {
>  	unsigned long nr_populated, nr_total = nr_pages;
>  	struct page **page_array = pages;
>  
>  	while (nr_pages) {
> -		nr_populated = alloc_pages_bulk(GFP_KERNEL, nr_pages, pages);
> +		nr_populated = alloc_pages_bulk(gfp_mask, nr_pages, pages);
>  		if (!nr_populated) {
>  			___free_pages_bulk(page_array, nr_total - nr_pages);
>  			return -ENOMEM;
> @@ -353,25 +353,33 @@ static int ___alloc_pages_bulk(struct page **pages, int nr_pages)
>  	return 0;
>  }
>  
> -static int __kasan_populate_vmalloc(unsigned long start, unsigned long end)
> +static int __kasan_populate_vmalloc(unsigned long start, unsigned long end, gfp_t gfp_mask)
>  {
>  	unsigned long nr_pages, nr_total = PFN_UP(end - start);
> +	bool noblock = !gfpflags_allow_blocking(gfp_mask);
>  	struct vmalloc_populate_data data;
> +	unsigned int flags;
>  	int ret = 0;
>  
> -	data.pages = (struct page **)__get_free_page(GFP_KERNEL | __GFP_ZERO);
> +	data.pages = (struct page **)__get_free_page(gfp_mask | __GFP_ZERO);
>  	if (!data.pages)
>  		return -ENOMEM;
>  
>  	while (nr_total) {
>  		nr_pages = min(nr_total, PAGE_SIZE / sizeof(data.pages[0]));
> -		ret = ___alloc_pages_bulk(data.pages, nr_pages);
> +		ret = ___alloc_pages_bulk(data.pages, nr_pages, gfp_mask);
>  		if (ret)
>  			break;
>  
>  		data.start = start;
> +		if (noblock)
> +			flags = memalloc_noreclaim_save();
> +
>  		ret = apply_to_page_range(&init_mm, start, nr_pages * PAGE_SIZE,
>  					  kasan_populate_vmalloc_pte, &data);

This series is a great enhancement, thanks.

When checking code, seems apply_to_page_range() will lead to page table
allocation which uses GFP_PGTABLE_KERNEL. Not sure if we need to handle
this either.

> +		if (noblock)
> +			memalloc_noreclaim_restore(flags);
> +
>  		___free_pages_bulk(data.pages, nr_pages);
>  		if (ret)
>  			break;
...snip...

