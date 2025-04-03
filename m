Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFFA241672
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666344; cv=none; b=Pmx6dFVLtp8q74ZqytedWKA8p1zFM0rG0XK+IhFz7TdaVTv6gzjvPkrjgc0uDh/D6B/Z+1lV4bZqTrWhZCGGTXIjYaSQr62VH7ObbWTo/pkfsQeCkALmVbjhWUruVSZ/C3/jr2GShaYa0Mjc7m15u4+pdXBUJcChuGrSK/Z8COg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666344; c=relaxed/simple;
	bh=hymi5Qn+fhcA2FOy03MhSS9012ysRlJkBS7t2tuXSxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5BHcFeRk6NUXeoB4BV3TRElRf9SMMfbrCL4f0gi6HKhHPCy24bjmFR+reBU9hBlOE0QtapijLykttCwnENBkMlMxLKJ7ExjBtT2q9t+qVEamJWH4sM04mTobdd4iAO0eBlNp+qIr4KvBzq7Raj2kqBTaZI/Pwz616aBSg5KgUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ET4z4w0P; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ET4z4w0P"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so475398f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743666340; x=1744271140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5VAk2UK6ZWJVQD+p+NwG0TWAjSp74Ywmjjho6zwF9q0=;
        b=ET4z4w0PfYhS2Rvf/83e5Bbitm6mewBmMkETa2bIJFS38QcYekeoBswrWemSk4cJeM
         4CsXIRg7ilN19cjXwDwziFGshVfbjRIkfZdLp/4HPfODhaj7I9EsEvkHJaTMdaPXdupM
         0ZLxT/xBwe2MVkqmHJFSwqLFmUL3I1+veFdQxJqwSyFPkhlJZ0f1HdqygQ8bDqKRygQN
         WRPGJFq07742vzswTgNeFSuXFyjhx/DH+w7WPjGh2Sn9+3nOO5cxqPsPe5XgqhGNXAFF
         AmuD8bzThCKeAtRhTStCpgJYqf834TkVzKcfUvfP6MnSNC+o1zKrHr6e6YY6yqhk5cnd
         pOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743666340; x=1744271140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VAk2UK6ZWJVQD+p+NwG0TWAjSp74Ywmjjho6zwF9q0=;
        b=TthJqBBBPefego28a6RTC6F309qfOhsgnutGzuQG91UDzn9I1dQXtMyGO6wcnHQgoq
         wxA9E5WXMhZuj5obaJtJICjcalQZ38/9HU3tSQ1JtfaA1m/1elRsLioVVqPKq+7E0AHJ
         WbPvze2SLzyK78eIl2DEvRIq3a/mz+4C+Ka97J3HvQ8XD8MqAz4TH/9rDr8SHICSQkTv
         3SkjgpziZnLlSfKSUlIW3OWPDFRhp1qo5lt05pCzzvlZoxhHzdOqQ3L1BUHiAyy6BqkP
         4Z3BYBLcqQDT2Pncp9RHrGdk+AZWLa9D51La/8LVbp8ot+jRdKdhb9+uBHEvBmzWIa1C
         /P+w==
X-Forwarded-Encrypted: i=1; AJvYcCW9inWvcJtKLfNWitsPuSAVTuEGwxp1TypsVeunLC4kROhzSyRWY0ltwJIUW4cYaaHvtWeDdw6/BZFCEpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgyr0pf963ASZgG7w2AEoz5uYmRh2jsGCjLcka5mjKJrOFaxOa
	rtHb2bToRJ0uR1Bumj1r+IVjvAjzr5KD9vWHnCHww7DEHq4jHLsal5QAC9mrO3s=
X-Gm-Gg: ASbGncvDfu+vu3w6vYokd3E90fe9IXpghbuiUtLwXQ6wCcv1v8vwiT34kNYx/nLQds9
	iaa9hgCAJlie4iwr91APoV36FmvkxK4C22nz5feLAl+DtDdpvfZnIItnyqJDqUwgTA3Z0Np1vcB
	ELYYmJWdb7wSoGHqII25ATlWHa8csPu/HN6ikcJh6hWE0A2p+rwg2CM2Lxt5Men5pCcoEK7m1SA
	6EPgSbJCxBUFt1aQEsof4A+nKkp7iHSGy9RXaB8mm40RAzHo79B5LgIkIERrJf2lQeLxxCadfLb
	jW96GEYqAK7ZG8iKeZBZ9xdkHEY9aJZXrx7J6PS+bB546D5lPo/wx1g=
X-Google-Smtp-Source: AGHT+IFVtsVP5aa9ArTL0eTRZ7z7nYosq4DIG82dzzri9OCIBx4/ZOUO1Sez8TySKMOSMj7BQjQj8A==
X-Received: by 2002:a05:6000:1789:b0:39c:cc7:3c62 with SMTP id ffacd0b85a97d-39c1211b6edmr16117808f8f.51.1743666340279;
        Thu, 03 Apr 2025 00:45:40 -0700 (PDT)
Received: from localhost (109-81-82-69.rct.o2.cz. [109.81.82.69])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301a79aasm1048844f8f.35.2025.04.03.00.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:45:39 -0700 (PDT)
Date: Thu, 3 Apr 2025 09:45:38 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH] memcg: vmalloc: simplify MEMCG_VMALLOC updates
Message-ID: <Z-48ortj_IhiPxHg@tiehlicka>
References: <20250403053326.26860-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403053326.26860-1-shakeel.butt@linux.dev>

On Wed 02-04-25 22:33:26, Shakeel Butt wrote:
> The vmalloc region can either be charged to a single memcg or none. At
> the moment kernel traverses all the pages backing the vmalloc region to
> update the MEMCG_VMALLOC stat. However there is no need to look at all
> the pages as all those pages will be charged to a single memcg or none.
> Simplify the MEMCG_VMALLOC update by just looking at the first page of
> the vmalloc region.

I do not rememeber why this was done on page by page but I suspect
originally we could have mixed more memcgs on one vm.

The patch makes sense.

> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Acked-by: Michal Hocko <mhocko@suse.com>

Thanks!

> ---
>  mm/vmalloc.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3ed720a787ec..cdae76994488 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3370,12 +3370,12 @@ void vfree(const void *addr)
>  
>  	if (unlikely(vm->flags & VM_FLUSH_RESET_PERMS))
>  		vm_reset_perms(vm);
> +	if (vm->nr_pages && !(vm->flags & VM_MAP_PUT_PAGES))
> +		mod_memcg_page_state(vm->pages[0], MEMCG_VMALLOC, -vm->nr_pages);
>  	for (i = 0; i < vm->nr_pages; i++) {
>  		struct page *page = vm->pages[i];
>  
>  		BUG_ON(!page);
> -		if (!(vm->flags & VM_MAP_PUT_PAGES))
> -			mod_memcg_page_state(page, MEMCG_VMALLOC, -1);
>  		/*
>  		 * High-order allocs for huge vmallocs are split, so
>  		 * can be freed as an array of order-0 allocations
> @@ -3671,12 +3671,9 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>  		node, page_order, nr_small_pages, area->pages);
>  
>  	atomic_long_add(area->nr_pages, &nr_vmalloc_pages);
> -	if (gfp_mask & __GFP_ACCOUNT) {
> -		int i;
> -
> -		for (i = 0; i < area->nr_pages; i++)
> -			mod_memcg_page_state(area->pages[i], MEMCG_VMALLOC, 1);
> -	}
> +	if (gfp_mask & __GFP_ACCOUNT && area->nr_pages)
> +		mod_memcg_page_state(area->pages[0], MEMCG_VMALLOC,
> +				     area->nr_pages);
>  
>  	/*
>  	 * If not enough pages were obtained to accomplish an
> -- 
> 2.47.1

-- 
Michal Hocko
SUSE Labs
