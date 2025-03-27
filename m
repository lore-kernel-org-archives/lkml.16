Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E464C6D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080806; cv=none; b=Li35vgfLwVz5q24yYfuQEvsUvrMNgekoAkWR8BqFUHzovgUiUtkDeMjGz+M3DXORikT0E/BAT6vAxYNo7DG49+CUckwFyoE9F62ovRS4sS1asXtkuZbIYtYdM33H89hS/+UkWr2j6m0hg6ED1OdUwn+HwdxyR+vvI0GqJxG7cZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080806; c=relaxed/simple;
	bh=CeaUBq+l+DScRoKKZPaXsgWPJG2dOd1XZHvB3U/A0ac=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHn18WPqe5Ro/OGHjVtWB49qOtlmpCYfvGLc+IlYfrr2u2BCPIxR1Bk2p3VzZywtdqBUU9n9+Ynm+O6Bmy7eh5CqpdWb3G8++yEPYtCTfUX9iJr4X2REAQKqGKT60obS67y4bJJ39ZRsL8r4K8bTcLxibGkmFZYWLNSBs6tvWEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jn5NsyC/; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jn5NsyC/"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54993c68ba0so996530e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743080802; x=1743685602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHYabRsisvvewRt2ZD66z6lVds8DGMm4+9hPyYbZNl0=;
        b=Jn5NsyC/y1VpeVPvDIYgCDDat48Gku+CqDqCWpdNB4Jwm/1l+mt1Dzg3+Ble+SZVyD
         c7LvnMIuBY0Tek0tqUiJop+fSD9YmVY3EkSBhX5GJbk6/BgIK6EcrxaSDG2FDYERaJSA
         bJClPWbwxCfOyrinj6bisEB7ABvV8SwhBcYlT7NNXmWnByHnHN9KK6wBGwFYW3E4YO6Z
         Z99YeQ/tHei1wctIsX06RxWELrreXHCsLzZrqDoJuET1PuDAHssQS9UeWERxlEhFTVn8
         68J/+rbkDtWAGIMexaNmYXav2HU1q/Rn1g3BDqeCenhgI3625Zk+sJ9RLo0dtVoq6XKg
         5fSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080802; x=1743685602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHYabRsisvvewRt2ZD66z6lVds8DGMm4+9hPyYbZNl0=;
        b=pwIIZyxuYQUsSD2jqH/aY5uTiTHuVdfLDgcOvHxRCjmbbMthlcLOoduD+7pG8p/JlR
         jOrzUTpURaLeK6Naep107N2rnGpNL4ZnXmE6soMrG6HlgZJK+aWXRBseWvzjeUchtY1c
         WIvRjcZLtw0Z9tmfF4Q/ywxy7NX0qeh8o6xoFy6YW9ol+u4fxJL1LSRqc7kIpsTJuHc7
         lxg62LBvHJxmpo37GX7zUX0xVs/JdMaxSX6ciEiTQrnSPlSskkVzcVSvLHqV/HzI3+Ng
         uXkVFNqcg/YJGlVYScIU45vNbUlEEvToKnKqs/vWOTnM1n6C3dDxvroy+/tye1XgU6vZ
         ZL8A==
X-Forwarded-Encrypted: i=1; AJvYcCUxs6noXOwRyMUQB2FXOIcFCYimiqGZnJP4PwI9j7OzJyHe+oKxV0DFgWYeiyvYongJQjYNCdM+x8sdTs8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4qf1xidAZurMGjLlTdcH+shEBTgjWGNFBrVZIDuejdwYpPPdj
	qyHrsOCh/Dl/3C4w/x1drR6sh3U/WX8GwyRtD4F+Y6SYqbXNEG2d
X-Gm-Gg: ASbGncuBi2p6xN3sXcIintcngZS5gkC3rebHpq9QPJ0e3/0ccS79/0L/xtY0rtzec93
	uUkDUr80U5vU7OVEZYipvFZjL1Wy6A3ZgwxY6D3uM9j1XOpKa2OLKluQIRKq6/+Msb7uco3VlNs
	0XS/uXQ24p1ouYrsb6LQlmASk/PXoi8W5IHag80iajGr8czGRvmmXBedRM0tqxnNhsFPeSXua9f
	eOHOzcmx52hLY8LQ8xqd2rm5CZrYrCJAJ/kf5mM31zKgz6GndXZCv+as7pw4NvJUWPOTHvdqilb
	6lrr30K2/ZNNRIHOM5qMsCa66x0ZMhFfYk19Q8QPEtUGZLgBI9RgQe4mfJkQqwNVWh8YT2e3C6n
	uUZ5VjRsSVw==
X-Google-Smtp-Source: AGHT+IEB1d2bV5NS2rf4YoT3EEb4ni6FZp7FQwziYXT+SNnYH748LFh1OTLu3uPDrh6+0Lc5RrqrBg==
X-Received: by 2002:a05:6512:1393:b0:549:9044:94a9 with SMTP id 2adb3069b0e04-54b011dd142mr1232153e87.25.1743080802331;
        Thu, 27 Mar 2025 06:06:42 -0700 (PDT)
Received: from pc636 (host-90-233-221-122.mobileonline.telia.com. [90.233.221.122])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c98dsm2088697e87.67.2025.03.27.06.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 06:06:41 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 27 Mar 2025 14:06:39 +0100
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/11] mm/vmalloc: Enter lazy mmu mode while
 manipulating vmalloc ptes
Message-ID: <Z-VNX0IA8Juh6ALx@pc636>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-11-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-11-ryan.roberts@arm.com>

On Tue, Mar 04, 2025 at 03:04:40PM +0000, Ryan Roberts wrote:
> Wrap vmalloc's pte table manipulation loops with
> arch_enter_lazy_mmu_mode() / arch_leave_lazy_mmu_mode(). This provides
> the arch code with the opportunity to optimize the pte manipulations.
> 
> Note that vmap_pfn() already uses lazy mmu mode since it delegates to
> apply_to_page_range() which enters lazy mmu mode for both user and
> kernel mappings.
> 
> These hooks will shortly be used by arm64 to improve vmalloc
> performance.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/vmalloc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6111ce900ec4..b63ca0b7dd40 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -104,6 +104,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	pte = pte_alloc_kernel_track(pmd, addr, mask);
>  	if (!pte)
>  		return -ENOMEM;
> +
> +	arch_enter_lazy_mmu_mode();
> +
>  	do {
>  		if (unlikely(!pte_none(ptep_get(pte)))) {
>  			if (pfn_valid(pfn)) {
> @@ -127,6 +130,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
>  		pfn++;
>  	} while (pte += PFN_DOWN(size), addr += size, addr != end);
> +
> +	arch_leave_lazy_mmu_mode();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  	return 0;
>  }
> @@ -354,6 +359,8 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	unsigned long size = PAGE_SIZE;
>  
>  	pte = pte_offset_kernel(pmd, addr);
> +	arch_enter_lazy_mmu_mode();
> +
>  	do {
>  #ifdef CONFIG_HUGETLB_PAGE
>  		size = arch_vmap_pte_range_unmap_size(addr, pte);
> @@ -370,6 +377,8 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			ptent = ptep_get_and_clear(&init_mm, addr, pte);
>  		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
>  	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
> +
> +	arch_leave_lazy_mmu_mode();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  }
>  
> @@ -515,6 +524,9 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  	pte = pte_alloc_kernel_track(pmd, addr, mask);
>  	if (!pte)
>  		return -ENOMEM;
> +
> +	arch_enter_lazy_mmu_mode();
> +
>  	do {
>  		struct page *page = pages[*nr];
>  
> @@ -528,6 +540,8 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
>  		(*nr)++;
>  	} while (pte++, addr += PAGE_SIZE, addr != end);
> +
> +	arch_leave_lazy_mmu_mode();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  	return 0;
>  }
> -- 
> 2.43.0
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
