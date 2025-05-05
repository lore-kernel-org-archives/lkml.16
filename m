Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5296360
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746475167; cv=none; b=ShqaGvBhXJiXvH3+U/6euCcJp0Ct6jbyyaLhXcdXtr7lhP/Cf+mShFU+U4urbP51AAL4a/yx6Cjpc65OYGRxdam9CFPpbz4NRILPh8ceZsxo8BDnblJZXk1d35dfwlUebB6eCsEkt5EzMHm4YWg+7OJBCBNeHS6MIU18tsGV5l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746475167; c=relaxed/simple;
	bh=+oB1jKhAf1ZFkGxAhyretTiv2RVnZCShVQtvbNRSNkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqhNfbstkRv0iYKl1UfmKi5pgMaUSLlmWr06zhNQxw6uqiY4h76MA9/F2TZh2zRu3YySke4X1zghAXVLk8rEqj/T2wgFtVlIDUU/SX5Y9/EgOE1iOknmVseaEBZw1xxeBVMfimoJ3V1b/yXoH8vUWd7VSrtROck5yZpSSezU61Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yc9d7M/A; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yc9d7M/A"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f6dccdcadaso3761715b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746475165; x=1747079965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QZx/H+9CZaGjXPFkoHcRujVHKRL9noUkGCDGtOLr50E=;
        b=Yc9d7M/AKZs04g9N59TBd3XRzW/WHqTxDKxwSHbv3aUIflFChHF7m8d8tXPxHemH56
         3eB2/mktZdNo0esFeDv7FIq07OqSmKhs3R5PFL6W2mBabqIGb8RhrqS/XzJ7TzI5gv3R
         BDDlRHu5IFR6tdRVxtmoqsM/PoAB4AjZcJZC0DBPEZPx8hd2GWiipExV6dbGBec58csI
         dg+5xN66sY/3Qt5OpWF97imejJKrEvG70cTXkBUlIXHAoMlFnqwTHadrbDCwmfG5lPml
         wEWh08zti2YGO1EMoAdozCREQkF0Wq1/quyvUhSsMyQFgcalgp3m1HxTz0IwLS/MEfbL
         +OwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746475165; x=1747079965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZx/H+9CZaGjXPFkoHcRujVHKRL9noUkGCDGtOLr50E=;
        b=Z3YtTA+a+3TIsWp7G6JjvsSkXSKFvLf9Jt/ajSTE9CghFLYXv2nT6DqCA/Q4kSyaK1
         CbfMSKPH9Zuo5toWDCOhESd3P2Z/iouBNUA/Pg5MgHnQn3VS/KgptErc9ACypMvi51Ss
         uP1dijMM/ImKE8y3vD0uSVfiZUCGC+lwmHzGO1Ka6qjAl2iPXY6LKDXNGYBK+J5JgdiK
         08kX69CTjLLva0BIbz67xQvkpQ6QIENf4j9FJcsQcfExYnbc0AcTmVfALQdoxa3WZTmN
         lNJJrkG+s9GHouywNXpto/6hN8DPQOCztA2KQDk6kh8h1gROzL+urZtzYWMxgfkczPLP
         LAJg==
X-Forwarded-Encrypted: i=1; AJvYcCVmcN0I7yZgqVXwr749/r1RMMUm9YdZqClmNwr42nG+fuap6bxGip2WoAYNqJr7G5oyBcndWL58PiFn3Hg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKbyzVE6ln6Lcpuvz5bLna80OE2f2/2wYlpQzETsEioyvhCRKw
	rnGdVi/9caGE1nEsLoZq28HTGy5FQPXx8rAh2B7tBZ+1g5OjHzdb
X-Gm-Gg: ASbGnctw0o+l2I+sjqQSfgWUFl9malljPP0sT4MmT6BRjWzkrjfAoo94wuiGMrkmfBv
	jfKIajgV8gBP2MgoPrE1ja7Cga/EDyaJr7qcm11zCzEGnMzxVm+JX1eyd9n12KNSD64OZpnkT+o
	9weCzT3nKn0TBMSvzP0geg6J6HL/9V2W7krrBzjm5EiM+0pIyE/4BVc0sjDOpl6gVjw7QYZeM56
	lWOQVc/U6r6pQbMQYK/BqOA8xO4JsatM/Y9AE0gIiq9ojx6OVS3AmVIUKBwuDcNac8fO+Oa8QXR
	KLQqT1jfuLNaljcxcJ8oY9W75PKd4zB6Py5GJGl5PVmPcaIR+HLrVdMlDSc+55uq
X-Google-Smtp-Source: AGHT+IG1Etm4cW5CykqfU8UT5ORkELSESCk64cPUlttjYTsZiyWq4Ob1nXsL4tNGuKEsK1bud17YKg==
X-Received: by 2002:a05:6808:3195:b0:3fa:ca26:6295 with SMTP id 5614622812f47-4035a5c4d1dmr5598454b6e.31.1746475164882;
        Mon, 05 May 2025 12:59:24 -0700 (PDT)
Received: from fedora (c-24-8-12-5.hsd1.co.comcast.net. [24.8.12.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae382fsm2041783b6e.21.2025.05.05.12.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:59:23 -0700 (PDT)
Date: Mon, 5 May 2025 12:59:20 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, willy@infradead.org, osalvador@suse.de,
	mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Fan Ni <fan.ni@samsung.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH v4 2/4] mm/hugetlb: Refactor unmap_hugepage_range() to
 take folio instead of page
Message-ID: <aBkYmLOiTZt1sLr_@fedora>
References: <20250505182345.506888-2-nifan.cxl@gmail.com>
 <20250505182345.506888-4-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505182345.506888-4-nifan.cxl@gmail.com>

On Mon, May 05, 2025 at 11:22:42AM -0700, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function unmap_hugepage_range() has two kinds of users:
> 1) unmap_ref_private(), which passes in the head page of a folio.  Since
>    unmap_ref_private() already takes folio and there are no other uses
>    of the folio struct in the function, it is natural for
>    unmap_hugepage_range() to take folio also.
> 2) All other uses, which pass in NULL pointer.
> 
> In both cases, we can pass in folio. Refactor unmap_hugepage_range() to
> take folio.

It looks like unmap_ref_private() is the only caller that cares about
passing a particular folio to unmap_hugepage_range(). Is there any
reason we shouldn't drop the folio argument and call
__unmap_hugepage_range() directly? 

> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/hugetlb.h | 4 ++--
>  mm/hugetlb.c            | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 23ebf49c5d6a..f6d5f24e793c 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -129,8 +129,8 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
>  int copy_hugetlb_page_range(struct mm_struct *, struct mm_struct *,
>  			    struct vm_area_struct *, struct vm_area_struct *);
>  void unmap_hugepage_range(struct vm_area_struct *,
> -			  unsigned long, unsigned long, struct page *,
> -			  zap_flags_t);
> +			  unsigned long start, unsigned long end,
> +			  struct folio *, zap_flags_t);
>  void __unmap_hugepage_range(struct mmu_gather *tlb,
>  			  struct vm_area_struct *vma,
>  			  unsigned long start, unsigned long end,
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 0c2b264a7ab8..c339ffe05556 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6046,7 +6046,7 @@ void __hugetlb_zap_end(struct vm_area_struct *vma,
>  }
>  
>  void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
> -			  unsigned long end, struct page *ref_page,
> +			  unsigned long end, struct folio *folio,
>  			  zap_flags_t zap_flags)
>  {
>  	struct mmu_notifier_range range;
> @@ -6058,7 +6058,8 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
>  	mmu_notifier_invalidate_range_start(&range);
>  	tlb_gather_mmu(&tlb, vma->vm_mm);
>  
> -	__unmap_hugepage_range(&tlb, vma, start, end, ref_page, zap_flags);
> +	__unmap_hugepage_range(&tlb, vma, start, end,
> +			       &folio->page, zap_flags);
>  
>  	mmu_notifier_invalidate_range_end(&range);
>  	tlb_finish_mmu(&tlb);
> @@ -6116,7 +6117,7 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
>  		if (!is_vma_resv_set(iter_vma, HPAGE_RESV_OWNER))
>  			unmap_hugepage_range(iter_vma, address,
>  					     address + huge_page_size(h),
> -					     &folio->page, 0);
> +					     folio, 0);
>  	}
>  	i_mmap_unlock_write(mapping);
>  }
> -- 
> 2.47.2
> 
