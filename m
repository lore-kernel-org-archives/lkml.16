Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F2A152532
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744907648; cv=none; b=VlJPSBwongO4Bld9IjWeApSIhALNmbunguEu2D947khcOBKGEt4Y77Z1Ip4T1O1kA5eZr5jQ9/sE7vjJxigRJmN2LSWXzB/R/kNi7LIzmDmXtLUKzGAaWVraIAOGx7Rk9oRNm3NBcbhc2aaVnJe5iRefo5dzhtQUvf2lFS612qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744907648; c=relaxed/simple;
	bh=EkoYev/S8IiiwLNZpjzBYqfQu5jbftPMkEUzQmMiveg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRtBrX6kJHtWem7MxqzcA9kRblEjKsg1l/JxqbpbVHfQPp/d2NpnsloUQV1jal102ul/k1eA/VOpMYs8IcJubA68yIUi5SYFHlXVnRwzWAkdrl78KepZXjPyWjBjhGtOEsQ8XemgyDm0oJC550Ly6XO26tcbFAYJ2urgbfaWv+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRgcWPq8; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRgcWPq8"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff64550991so637032a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744907646; x=1745512446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYBU9MCx22dQza0JCQsf0FMImE2sKlN5SGIyup6Xt5M=;
        b=DRgcWPq8xTxZmFsUMuHDjxB9j2QVSL6lKdFLlC6WtWJKsTR2U71nHzgeCG6tWb4Fam
         oSf8YJa7LpIvsjTrilmLkdTsFlVOy0VEEB7wn9PYVzMYBGlOtPUQhlFBAVO1vVrzggl6
         ZnFmGv2rW25qS2/9SaaDi4ncRzwwQhDd+4PotIuZorumPumePkjOtAf4q+jh2WqUoqv4
         vKRXOdrHPdIagIRJGfyB/ewb2h3PVjxLQJxiGvUW7f5U7ex8WlVDjBJP5rhz6lVqe5WF
         b4IV5xhwU+Ld5zAoS2vBcsOP17J61ogH/6vWEosYSCPkp0MRKiW+jr6u+/FEhyy0auQK
         qGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744907646; x=1745512446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYBU9MCx22dQza0JCQsf0FMImE2sKlN5SGIyup6Xt5M=;
        b=IaRrxLpWMqTGmUrwf8UOgfzzCuQFt9h9MLVTHm4SwD0A282nXbfZjDSmsaTMNAjZMf
         pmqQjVtzzulRjeZbq0HOOilgzBTEbRtNvjRBGuLPyHxVYCQqrrU1dwFEtyhj/LsZAtoc
         bx5ClCOc5PL2CJfrKoOgGjPAltg60aBMP+CF5MxtGsf+xhubc69wVmsxpk4STl/XXENo
         HKTQDu0WOp3fOXTrqMe6Np+rQus2t5s0W7gHW2zcQuRlaVevs+xSTFZMGSrX2CpRjMyP
         NMT+l8qIFmF3hwtorXRJzVgY6tvQJSET2xYkD1so2Bn1mteIzvcTWoHG7Kj0LEskx8tv
         UsyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0dwBBs96VhweUDbAt5ozaw44q1QAWx71fafIWCdLiZVd92On86o1RBTurp6mU483Xwnw082ZpYThXWyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJSvYBUO2K1KKRgu8W/T8kbe4sr1HY3w1ntde2VDYiUF8goAet
	w2MdTw9xz+3r751vtqs50iiXsYc9rnV57rfgtruSKWzPkcsuAiRw
X-Gm-Gg: ASbGnct5KSGg3wlvNnJ1mdU0hFzkdNcm/dce3I3tG8TOPmECKE/tviL67WUabw7jMUb
	LM3nd3utlQWx25iSW0h3Jsa6/dTuHmOW5N3Xscw0sulqjJcqf/dizFI9FCS0iDMPMSUAjnw5bNQ
	d+yJFZXCYUj/bdg+8iT90oPQN2Ei5gC45n/E8Iln/S7GThVgu0tDaUUt6UzvebJyot6Lf8LHtFy
	1dTlOdF3NXA6ITcDWodURhKZl/jrN3gsQvhpB26+2MRIQAQS6n6NJHTQXIPfzct8OzWyAZn1bi5
	pKAirhdZ7wjr16Ie7Dtdw05loR55BTEFD149
X-Google-Smtp-Source: AGHT+IFmhhnzX4L4cgDg1xLEuHG0Kkk6GSxmwHa9nKhOkiuBa5wkAcO+cGRy7Whi7NldxkrSjQuRFg==
X-Received: by 2002:a17:90b:55cd:b0:2fe:7f40:420a with SMTP id 98e67ed59e1d1-30863f2f631mr9998835a91.17.1744907646425;
        Thu, 17 Apr 2025 09:34:06 -0700 (PDT)
Received: from debian ([2601:646:8f03:9fee:5e33:e006:dcd5:852d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed0f90sm1807115ad.185.2025.04.17.09.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:34:05 -0700 (PDT)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Thu, 17 Apr 2025 09:34:00 -0700
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org,
	mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mm/hugetlb: Refactor __unmap_hugepage_range() to
 take folio instead of page
Message-ID: <aAEteJh4Gb8R7gPm@debian>
References: <20250417155530.124073-1-nifan.cxl@gmail.com>
 <20250417155530.124073-3-nifan.cxl@gmail.com>
 <daaeffe6-f9b8-4923-a273-0dab573aa749@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daaeffe6-f9b8-4923-a273-0dab573aa749@oracle.com>

On Thu, Apr 17, 2025 at 12:21:55PM -0400, Sidhartha Kumar wrote:
> On 4/17/25 11:43 AM, nifan.cxl@gmail.com wrote:
> > From: Fan Ni <fan.ni@samsung.com>
> > 
> > The function __unmap_hugepage_range() has two kinds of users:
> > 1) unmap_hugepage_range(), which passes in the head page of a folio.
> >     Since unmap_hugepage_range() already takes folio and there are no other
> >     uses of the folio struct in the function, it is natural for
> >     __unmap_hugepage_range() to take folio also.
> > 2) All other uses, which pass in NULL pointer.
> > 
> > In both cases, we can pass in folio. Refactor __unmap_hugepage_range() to
> > take folio.
> > 
> > Signed-off-by: Fan Ni <fan.ni@samsung.com>
> > ---
> > 
> > Question: If the change in the patch makes sense, should we try to convert all
> > "page" uses in __unmap_hugepage_range() to folio?
> > 
> 
> For this to be correct, we have to ensure that the pte in:
> 
> 	page = pte_page(pte);
> 
> only refers to the pte of a head page. pte comes from:
> 
> 	pte = huge_ptep_get(mm, address, ptep);
> 
> and in the for loop above:
> 		
> 	for (; address < end; address += sz)
> 
> address is incremented by the huge page size so I think address here only
> points to head pages of hugetlb folios and it would make sense to convert
> page to folio here.
> 

Thanks Sidhartha for reviewing the series. I have similar understanding and
wanted to get confirmation from experts in this area.

Thanks.
Fan

> > ---
> >   include/linux/hugetlb.h |  2 +-
> >   mm/hugetlb.c            | 10 +++++-----
> >   2 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> > index b7699f35c87f..d6c503dd2f7d 100644
> > --- a/include/linux/hugetlb.h
> > +++ b/include/linux/hugetlb.h
> > @@ -133,7 +133,7 @@ void unmap_hugepage_range(struct vm_area_struct *,
> >   void __unmap_hugepage_range(struct mmu_gather *tlb,
> >   			  struct vm_area_struct *vma,
> >   			  unsigned long start, unsigned long end,
> > -			  struct page *ref_page, zap_flags_t zap_flags);
> > +			  struct folio *ref_folio, zap_flags_t zap_flags);
> >   void hugetlb_report_meminfo(struct seq_file *);
> >   int hugetlb_report_node_meminfo(char *buf, int len, int nid);
> >   void hugetlb_show_meminfo_node(int nid);
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 3181dbe0c4bb..7d280ab23784 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -5833,7 +5833,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
> >   void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >   			    unsigned long start, unsigned long end,
> > -			    struct page *ref_page, zap_flags_t zap_flags)
> > +			    struct folio *ref_folio, zap_flags_t zap_flags)
> >   {
> >   	struct mm_struct *mm = vma->vm_mm;
> >   	unsigned long address;
> > @@ -5910,8 +5910,8 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >   		 * page is being unmapped, not a range. Ensure the page we
> >   		 * are about to unmap is the actual page of interest.
> >   		 */
> > -		if (ref_page) {
> > -			if (page != ref_page) {
> > +		if (ref_folio) {
> > +			if (page != folio_page(ref_folio, 0)) {
> >   				spin_unlock(ptl);
> >   				continue;
> >   			}
> > @@ -5977,7 +5977,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >   		/*
> >   		 * Bail out after unmapping reference page if supplied
> >   		 */
> > -		if (ref_page)
> > +		if (ref_folio)
> >   			break;
> >   	}
> >   	tlb_end_vma(tlb, vma);
> > @@ -6052,7 +6052,7 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
> >   	tlb_gather_mmu(&tlb, vma->vm_mm);
> >   	__unmap_hugepage_range(&tlb, vma, start, end,
> > -			       folio_page(ref_folio, 0), zap_flags);
> > +			       ref_folio, zap_flags);
> >   	mmu_notifier_invalidate_range_end(&range);
> >   	tlb_finish_mmu(&tlb);
> Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
