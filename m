Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFDC199FC1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745378393; cv=none; b=ovdWuSkPocecHTWblWpW0YIBwRtApLsN228rbhZ6WMJ3JiHu/E3Xycv6LC1F+VBzhR2ia3ENyzeUy020N3QNZC19RlhYdPFrJ+Np0rWxLswIaTLG928aLwixo8yvY+p09zp0tngi17V90YTlA1IbS5IGIEspvvHAUzvlR7F77zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745378393; c=relaxed/simple;
	bh=i2dLJ9H06qux9xKxIxZJrgtkegq3foNlNliA7EqKuu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IF2L0tOYfKyad0WdMVB+N0uwJZbkWZo/N8p96Yehm5cJWzrUCetLYrbi7SHEjS8djvOSXpTG9B7zzRsxuIIyai2Hcs99QbG6PIfDGVz3g25+VuBzllopCpmZTKUSLpDahNu0GD72eKUM4NDnSZNH13ANK5qq1otElsax64vU4MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qyoBogs/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qyoBogs/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GOEAeA0iNQB0WJTvoODPlKE3a9wUo6bhm6L3qDNptjU=; b=qyoBogs/v/YnUdE2249xqnwrDA
	Xu/jaCg4c4zmLnJyVibwOJBDur7LOUzpwiohXb6iZTVrjhjEG/2dYgWExfjt9hYBJHaFVik3+qufE
	ThvM68Uu0rYTnrz5jQloUeBanVcEXgueDt6A0eFt9ZlsXD+unmGGr44hvA1TNcinJJlNXEHbK52uL
	RLbsbolGa7t+6EMKT0eUFJFsQ79c62G+92oPSQnFJuDvbVR+HMAwH9FFo/BoOsTIpMPkUsPnj2zZa
	unKd06D8nlWsLUgnqH6mUiFSvmgZmSrFXgHNVe5dMaGG86PQ+YU02NqOFVUSGf+RT0QhwihuuT19c
	gwKV/GDA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7QeJ-00000006zyM-1i2W;
	Wed, 23 Apr 2025 03:19:47 +0000
Date: Wed, 23 Apr 2025 04:19:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, mcgrof@kernel.org, a.manzanares@samsung.com,
	dave@stgolabs.net, akpm@linux-foundation.org, david@redhat.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Fan Ni <fan.ni@samsung.com>
Subject: Re: [PATCH v2 3/4] mm/hugetlb: Refactor __unmap_hugepage_range() to
 take folio instead of page
Message-ID: <aAhcU3Y9yjUcSWoc@casper.infradead.org>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
 <20250418170834.248318-4-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418170834.248318-4-nifan.cxl@gmail.com>

On Fri, Apr 18, 2025 at 09:57:41AM -0700, nifan.cxl@gmail.com wrote:
> @@ -5910,8 +5910,8 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  		 * page is being unmapped, not a range. Ensure the page we
>  		 * are about to unmap is the actual page of interest.
>  		 */
> -		if (ref_page) {
> -			if (page != ref_page) {
> +		if (ref_folio) {
> +			if (page != folio_page(ref_folio, 0)) {

I think this is actually wrong.  Shouldn't it be:

			if (page_folio(page) != ref_folio)

so that it doesn't matter which page in the folio we found; we just need
to know if the page belongs to the same folio or not?

