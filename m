Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D371F8725
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874110; cv=none; b=W5Q4PcboBA9VHV00uKDUDLS3CXLkkcgle4qgiRkRviYk6GbKYP+H/dzyjtr3uqcFFlpU9Wq0sch/vFHFYE611lXbeyAamiZ99IMWCVgjqg/ZmgT2F4D1Ehtx3617RIcTRDCwiGyP3KtYw1YdKSzKWl1bLO4wbMg9Qy0LnFOgVSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874110; c=relaxed/simple;
	bh=PJtIG3Wn/xUsv6h3KVXpqP0Dntmssym2gZQIWaZF3Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulr8ng3TCe3ne5wx4gDiAIkf6Bxs9byl3RMjchJgOrrOanXkNNrg56R/SOaK68K5ptjeP9peUnh2JSnvh/SXXy8BspGYqecv57RZjepvEZNUs0xet6+C8jYgw1EH1PRB0pTFth4h7kDDwneO5y6dTUmIneGoBc7FoF2tmJ54CHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=j/Rg4j83; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="j/Rg4j83"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FEO8loLQSHaJvJb6sb7v0d/G7pXWvP0/bwDA8Txbzyw=; b=j/Rg4j83JRIcf7GbBnG3cUzfbs
	c9OddhkqJjZnJDT7nvbDTUbuYupdFKkU/NIhj2whYPR2NY48im2NyyqC7FQtMJmifNEBNoqwF+Y/H
	X/Q9gVLgUE0QYN3DQ/NI7iTIuGRbcFEgbZ35XbalOxYAkwaFe+4923QEti+YPhkHenOeHX+ZTNnUA
	9O9s8H552/f1UBjnYB4uoGGGTGPwpN/p/+GVWvIHFtLEW0HjA8HVQ5bRnjrOXOUzqzsN+aJKEldyG
	xJAc2aSxNysvEHNHRo1L51/m1zDa4XJBI3mtDRSI5VjAHiyyH9gziOPDxLOTrl0aOtFWswB2uXNxX
	bpXrvCNQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Vbc-0000000DmjI-3qEQ;
	Mon, 28 Apr 2025 21:01:36 +0000
Date: Mon, 28 Apr 2025 22:01:36 +0100
From: Matthew Wilcox <willy@infradead.org>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, mcgrof@kernel.org, a.manzanares@samsung.com,
	dave@stgolabs.net, akpm@linux-foundation.org, david@redhat.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Fan Ni <fan.ni@samsung.com>
Subject: Re: [PATCH v3 0/4] mm/hugetlb: Let unmap_hugepage_range() and
Message-ID: <aA_ssINhIDuxCYP6@casper.infradead.org>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428171608.21111-3-nifan.cxl@gmail.com>

On Mon, Apr 28, 2025 at 10:11:43AM -0700, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>

When you're sending v2, send the same cover letter as you did for the
first one; don't make people go and look at v1 for the cover letter.

Put what was changed in v2 after it, so they have some idea what to look
at when reviewing.

> Changes compared to v2,
> 
> Patch 1: 
> 1) Update the commit log subject; 
> 2) Use &folio->page instead of folio_page(folio) in unmap_ref_private()
>   when calling unmap_hugepage_range();
> 
> Patch 2:
> 1) Update the declaration of unmap_hugepage_range() in hugetlb.h;
> 2) Use &folio->page instead of folio_page(folio) in unmap_hugepage_range()
>   when calling __unmap_hugepage_range();
> 
> Patch 3: 
> 1) Update the declaration of __unmap_hugepage_range() in hugetlb.h;
> 2) Rename ref_folio to folio;
> 3) compare folio instead of page in __unmap_hugepage_range() when folio is
>   provided when calling __unmap_hugepage_range();
> 
> Patch 4:
> 1) Pass folio size instead of huge_page_size() when calling
>   tlb_remove_page_size() by Matthew;
> 2) Update the processing inside __unmap_hugepage_range() when folio
>   is provided as sugguested by David Hildenbrand;
> 3) Since there is some functional change in this patch, we do not pick up the
>   tags;
> 
> v2:
> https://lore.kernel.org/linux-mm/20250418170834.248318-2-nifan.cxl@gmail.com
> 
> Fan Ni (4):
>   mm/hugetlb: Pass folio instead of page to unmap_ref_private()
>   mm/hugetlb: Refactor unmap_hugepage_range() to take folio instead of
>     page
>   mm/hugetlb: Refactor __unmap_hugepage_range() to take folio instead of
>     page
>   mm/hugetlb: Convert use of struct page to folio in
>     __unmap_hugepage_range()
> 
>  include/linux/hugetlb.h |  8 ++++----
>  mm/hugetlb.c            | 39 +++++++++++++++++++++------------------
>  2 files changed, 25 insertions(+), 22 deletions(-)
> 
> -- 
> 2.47.2
> 
