Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667F32E11B1
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750941896; cv=none; b=SB0/DbN7L/OrFphftzIkvbSmsRUn0HB4vPjB327HL4IYQmtChZtq97PNUIHjMc6hM63HYWFDZcW7fSpRlWxSqU0dE9s8ob3V4kiQei670DpwUTUGKc1EFCuuPAqH+VzjkrbBGIH23+paZzzxo0C0Qj/N2ZhXGvryq/Wk98WCLWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750941896; c=relaxed/simple;
	bh=Y19BnNLdcd6JtxmLP8VGGY8VGVrhI8XndDrOn27+sGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOvClG/ectep9tmE+qmXkw0FHCgc7WxoTPW8sF6FK66fev2ITStJZ2UlTE/O5Ag70WC3m7aj5wEX+QUBnfK6457HlwxQStA2j+yEhDhwQPGaDJqWz1lWVCym1fW8qe1lIa48W8Aqk/7Y0PMYPs0iH07jEL7c1PJjZJ7wPOUs8KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHVwv/5s; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHVwv/5s"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso524617f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750941893; x=1751546693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9Q6vWQMAD+pyX5yU0mYRqo1CgBOlEkw6ZKpgSd/AcU=;
        b=YHVwv/5sgoTv03K1QqcGjCCs+tfjmf3a2gj53JQMFrbgOUDXYUTq0cyLc+jMRh0LIz
         /iLV3bdyQtUYbXjViWNA7+LvfHP03jrk8SNPW/uZHzubWYL0FE03PYxxp6kVGv2TfT1M
         N/LCwm/X12ZVeq53i9wVDuFIUEjYN0W199NvCjte5WsHN2j8ij+OoUe10mZA/eAnL3HR
         euMHlhY6JCbBQtHdTHRWo0Hedg9jYQGEAE/VIlFO/1gzzXNtobH1wpebVBJ3q2CY5L5F
         wnIck2o8DSZuAHoY4rVcP22vxtTctOVWChUpGsV8oOd0yGx96bgLcFSBJgPnVWdEOoO1
         EHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750941893; x=1751546693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9Q6vWQMAD+pyX5yU0mYRqo1CgBOlEkw6ZKpgSd/AcU=;
        b=Ko4aIEAv2IlMYZVb5TtkpYrpSgaNTqEluAbVsHivcY2mr4Di+kqexuLmn5GQDRFENw
         +cjdrKNu91Hh8milZhhELWN4pbxvxmPS+okjqlj3B+dY3CQ3M8WD3rKnbMkO5T3hHV49
         C1eCfdw8lITlCwg2Y6Wd3Rc8RPuvMFNn8STF9iksDVJjg0/ovBVBRlCHfbTa/A+aQL+9
         AI1Xh6x2MIrk4xExrZTm4x1s6zTtJrXpOUa/gy5fSL72ijBGUo1XTsBM+FNrfrEqYPb5
         b+hwGomx1jCWB5egPM5VhU+JyzTh+nfssniUCIBt9T85Hp188pOY/HrjNTO8dr7h0ROg
         C7OA==
X-Forwarded-Encrypted: i=1; AJvYcCWyrKmzD5JcOqhBZ1m0ojObkqC7ViAy2PAE6GfdenTqcBnvDkTASlN0c0gDM3XSXNsi0mxeErh7sOPCtrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ7B44oPcdAXvACWmJIkaH07M8LETNGjW96G8myAganhKwimdE
	YN2jxZk6HTb9fksKRdAd575CMjMxFLaDywcDEXRO/kjie5vJYW6BBvDG
X-Gm-Gg: ASbGncvbncS6Iaq76pierOdQTHyMRgC1EeINYpvlmsjD0xb1vr8bKR3BDeS4pUFCfyj
	f3eBL+xV91y1StK2bR52r5WF1ZiOXjsCoDRx3GMiyKhdMNrqDf3SdwNc8Myr06030pDGsofCRhc
	1bhNSl3Fx24eCpQKegkJbYM5RMJqASm7yz5c+DaNGFAPmSeuaReBMzysvKSUG1LCfi3hAW4COUa
	ZO/el8KBLhM37TEB2ADtPzFarCf2rvZ5MQDUXNRBW5T8Ue+N92G7YMh5UE1XNuiOddEztJkW9p3
	UhQIqamrTdAcOeu3ewlsRHrvBf7Dv+hbvMS2RyjjG4wzZlA=
X-Google-Smtp-Source: AGHT+IHK9z/BBG/9EKAw7EpO3uOD6zjU0SI80m4T9S7pG+NIa80Str49cvuzTLt7WfihJvvYhpI4ug==
X-Received: by 2002:a5d:5847:0:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a6ed62eb62mr6202221f8f.21.1750941892202;
        Thu, 26 Jun 2025 05:44:52 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::3086])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a831051c49sm161455f8f.30.2025.06.26.05.44.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 05:44:51 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: ioworker0@gmail.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	kasong@tencent.com,
	lance.yang@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large folios during reclamation
Date: Thu, 26 Jun 2025 20:44:45 +0800
Message-ID: <20250626124445.77865-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626092905.31305-1-ioworker0@gmail.com>
References: <20250626092905.31305-1-ioworker0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


On 2025/6/26 17:29, Lance Yang wrote:
> Before I send out the real patch, I'd like to get some quick feedback to
> ensure I've understood the discussion correctly ;)
> 
> Does this look like the right direction?
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index fb63d9256f09..5ebffe2137e4 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1845,23 +1845,37 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
>   #endif
>   }
>   
> -/* We support batch unmapping of PTEs for lazyfree large folios */
> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> -			struct folio *folio, pte_t *ptep)
> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
> +			struct page_vma_mapped_walk *pvmw,
> +			enum ttu_flags flags, pte_t pte)
>   {
>   	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> -	int max_nr = folio_nr_pages(folio);
> -	pte_t pte = ptep_get(ptep);
> +	unsigned long end_addr, addr = pvmw->address;
> +	struct vm_area_struct *vma = pvmw->vma;
> +	unsigned int max_nr;
> +
> +	if (flags & TTU_HWPOISON)
> +		return 1;
> +	if (!folio_test_large(folio))
> +		return 1;
>   
> +	/* We may only batch within a single VMA and a single page table. */
> +	end_addr = pmd_addr_end(addr, vma->vm_end);
> +	max_nr = (end_addr - addr) >> PAGE_SHIFT;
> +
> +	/* We only support lazyfree batching for now ... */
>   	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> -		return false;
> +		return 1;
>   	if (pte_unused(pte))
> -		return false;
> -	if (pte_pfn(pte) != folio_pfn(folio))
> -		return false;
> +		return 1;
> +
> +	/* ... where we must be able to batch the whole folio. */
> +	if (pte_pfn(pte) != folio_pfn(folio) || max_nr != folio_nr_pages(folio))
> +		return 1;
> +	max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
> +				 NULL, NULL, NULL);
>   
> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
> -			       NULL, NULL) == max_nr;
> +	return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
>   }
>   
>   /*
> @@ -2024,9 +2038,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   			if (pte_dirty(pteval))
>   				folio_mark_dirty(folio);
>   		} else if (likely(pte_present(pteval))) {
> -			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
> -			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
> -				nr_pages = folio_nr_pages(folio);
> +			nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
>   			end_addr = address + nr_pages * PAGE_SIZE;
>   			flush_cache_range(vma, address, end_addr);
>   
> @@ -2206,13 +2218,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   			hugetlb_remove_rmap(folio);
>   		} else {
>   			folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
> -			folio_ref_sub(folio, nr_pages - 1);
>   		}
>   		if (vma->vm_flags & VM_LOCKED)
>   			mlock_drain_local();
> -		folio_put(folio);
> -		/* We have already batched the entire folio */
> -		if (nr_pages > 1)
> +		folio_put_refs(folio, nr_pages);
> +
> +		/*
> +		 * If we are sure that we batched the entire folio and cleared
> +		 * all PTEs, we can just optimize and stop right here.
> +		 */
> +		if (nr_pages == folio_nr_pages(folio))
>   			goto walk_done;
>   		continue;
>   walk_abort:
> --

Oops ... Through testing on my machine, I found that the logic doesn't
behave as expected because I messed up the meaning of max_nr (the available
scan room in the page table) with folio_nr_pages(folio) :(

With the following change:

diff --git a/mm/rmap.c b/mm/rmap.c
index 5ebffe2137e4..b1407348e14e 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1850,9 +1850,9 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
 			enum ttu_flags flags, pte_t pte)
 {
 	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+	unsigned int max_nr, nr_pages = folio_nr_pages(folio);
 	unsigned long end_addr, addr = pvmw->address;
 	struct vm_area_struct *vma = pvmw->vma;
-	unsigned int max_nr;
 
 	if (flags & TTU_HWPOISON)
 		return 1;
@@ -1870,12 +1870,13 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
 		return 1;
 
 	/* ... where we must be able to batch the whole folio. */
-	if (pte_pfn(pte) != folio_pfn(folio) || max_nr != folio_nr_pages(folio))
+	if (pte_pfn(pte) != folio_pfn(folio) || max_nr < nr_pages)
 		return 1;
-	max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
-				 NULL, NULL, NULL);
 
-	return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
+	max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, nr_pages,
+				 fpb_flags, NULL, NULL, NULL);
+
+	return (max_nr != nr_pages) ? 1 : max_nr;
 }
 
 /*
--

... then things work as expected for the lazyfree case, without any
splitting.
