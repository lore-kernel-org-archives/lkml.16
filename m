Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0552927442
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744738663; cv=none; b=su2d4pISZeQE3sM5TLi8r2mcm1i1FlpLQRvKUKSd0MusUuTeqWTKw7DUtPVfjKFe6/mI9e/WgnTXWn2zr8ISvG8Byi4FKEUG7aA54Jm6+O+GVIL2vM7UqMp7zDB0ueqOFaATfIjfsh8WI0mrXZfxh844CfrmvkMr8hw3QIP+Azg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744738663; c=relaxed/simple;
	bh=pq6SCLbfEk6ugftEr6CiDTUkiHdl1Zh9ezntmdwttNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilwFCicj+WtJbJ8ItKz8XteF1D9/TpPPpFwMAOlbChMFPh20JUTOY51C4GCFXIwaFYrqCeNsKxT3qZzv/UbEsvodrfHQzRX+vTeQkowPA5UiAjJsgtUHWuZxGCb/dI275LR/bDwbovpBjubDkHmzLpoBVFyDVPUV1n5t4w+kzgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4CmDOCE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4CmDOCE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43690d4605dso46660855e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744738660; x=1745343460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x/S/cjEnszsQ1ir5xk4cNEJyO5+OZlwMe97IvIg8dZ0=;
        b=Y4CmDOCEQXFoVVQZeVVGD+5bLWtSfgBjAISyMWxXaJ8atf5GRRzfh5r9IThXVe2o3/
         Yfz5B0JIwW3ZRsb0HWuigZv6jMJw+AYHgfrlM9roorWVMZcY6cVL0XaJrp0WsmUBCZh9
         OpGkQS8XXAmjZuLzBVHwtacfk5RX4gMHoel0xE1KqEkBUh72kMGKvwthxnjHc7nIO2d8
         r8GaOey3fD2kVlxhwJskA3Xj39cFiVNbSQ/08WHtzvRgMsNr+wWKG47nIYWZdTjNa3SI
         Mc7i/kt5if6fsFnDhykv7Ht9FsWTAEgHhmGEBOiA2R8SXaZ14oepOhYOi8cg71oZJnes
         OUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744738660; x=1745343460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/S/cjEnszsQ1ir5xk4cNEJyO5+OZlwMe97IvIg8dZ0=;
        b=hs/1nfrNi+iAe01K222cXONfWXMlUqjGlg1fnJgseAyRUOwi5YuhmJDzFfUnWOXJPl
         vrAwDHoJZHrfkSsJlySonBKeXE0icohefmCBjYX5tDtINnsdHtEdRJbO6vhzSP4ByACD
         e84NQy2ZIPzj26WOi2dg+jcIrzbWdBFd4m8992ZT3Gsdlq/nWkUqQPAYTw+Dpgupw2EG
         7tU2PbiePs9zh83Njx+TbkYKhJb/IdCufB5jcmYyjVUopHGltJnzKqiTMy44yRbpB+Mz
         3qLw6KNXbKCU6E/djU1mGH7pVa/nMst+1Hv6X2GyT2qBnMpolz2fLSpf/wHD1wqs77kw
         kcWg==
X-Forwarded-Encrypted: i=1; AJvYcCV/fLwOn2PAQwudfjOIjX9lv0A840uK9DUauyiYMAKmlUkRFs77uVrPRVXi/wKDvZbnQ3zo4sp47fC7hGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGrXBMPnwux8DuelSRa2G0MHLCt1bIAGEprdHnaPZBlshUEmqW
	DCtiumYasb3A/Eb4hwzoU9swWljmkytN4Stqzy33WgDrbYjXNuzt
X-Gm-Gg: ASbGncsrR0M3CAE2rvEu2VMuvuraRdy8B/3EcdaPzWSINTcHlIOD+/idKrHvPbEiLZP
	WFrHXMrazoFqBgP0Pcg2WRapby7yVYbQ14P92Lc9K2/1FwIf36giEkjU4TM4FLfXhb9BbwYNRXu
	5m01Ug92aD6mFn1a1UPNY0DfNRU0JXkIw96g/UCsqpj3SqtWcVdpHM64C36Ua3/ujcCE9L1KoF9
	4WZKoxchygil8TPNEeMhecrZj1f9oU3P1Oe7wzuAS9BSC8H0qJNqzhcZpTfFAkSF19Tgn5D+/cd
	4QuzOMijhbKhKERTa8xrCBqDDFf8A0ISqeyXt5e8qz3tHKelHa8Fcy6d
X-Google-Smtp-Source: AGHT+IEJX7C3/UrhFqmiGuJ7CA0QU8jXtKvhEQIO5w2z5EAHTFd7RJY1Cv4nnQak/NIfWCEiXPFRtA==
X-Received: by 2002:a05:600c:1c0e:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-4405a1045c0mr16225e9.27.1744738659990;
        Tue, 15 Apr 2025 10:37:39 -0700 (PDT)
Received: from f (cst-prg-69-220.cust.vodafone.cz. [46.135.69.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43d38fsm14908147f8f.71.2025.04.15.10.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:37:39 -0700 (PDT)
Date: Tue, 15 Apr 2025 19:37:31 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>, 
	Christoph Hellwig <hch@infradead.org>, Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH] vmalloc: Use atomic_long_add_return_relaxed()
Message-ID: <zoxj24qmv3gxng2tz7ypxdlarktygsxjipbrr2opsaxgktrgib@7kzy5px2j557>
References: <20250415112646.113091-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250415112646.113091-1-urezki@gmail.com>

On Tue, Apr 15, 2025 at 01:26:46PM +0200, Uladzislau Rezki (Sony) wrote:
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
>  
>  	/*

If touching this, maybe a step further -- I see false sharing with:
nm vmlinux | sort -k 1

[snip]
ffffffff845cb240 b vmap_lazy_nr
ffffffff845cb248 b nr_vmalloc_pages
ffffffff845cb260 b single
[/snip]

If this is used enough to warrant messing with eliding a fence, then it
probably also wants to elide some false sharing.

So at least the first two should be annotated with __cacheline_aligned_in_smp?

I am not going to push though, feel free to ignore.
