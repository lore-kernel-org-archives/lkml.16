Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D9445948
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745378255; cv=none; b=SBblMTRUNOwCejAUbPolAkzHXjETmSv8VP/DMwcTfkauUeXf9sUaks0vkKYvIwy8D0y3ws3mjiGMC01kzaNxzNcKJE8LGUO/kEPUIE5pAWoy+qMvo4KPW3CX7LMwEHVKM2W24/5nmRCCW5N7AXqUP+/WJtadA3K9+ZOA+mFWQ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745378255; c=relaxed/simple;
	bh=gTMDoNlJUf4xhEKLZNWe+b60/vCGgqOvtOhe5a4+rM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYfgH1Nia4DWctXNZ9iolOJ09PmqoNukO8NobEe4SfiSsa2GHY6HsbQ6xjRB6TSY03Dx86WnMUywj3M4IYT5Gzw2GGZFMZH0kI3/YoHyVnGqjbiC6fzvWhz/80wNgkVUjJCAiPtnrklTk/xCWRMx3gEH1JTJsvhoN4S/0REhavI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JplOFHJs; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JplOFHJs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XrzL/ywGQWwa3UfFOg9DzphBj+qv1CvmcEybCBgX6GU=; b=JplOFHJsJ5gwbq5eZLH2Re+L6Q
	2qklporZ5OHRhoNmbd9SXgWA4glfxr5sNbHPvrVnwXDc5guBfLxRYKjMGb9mENFaeVcDevlFe9Sjm
	5bDC6PBEBgbIJyM4ZVemJRDmp4Txl537j33eqOuOCDUg/DZotdjof5umqTHleBQUIT6S9Cgdg0KTH
	/I8m8VUiV16oec+Y2Fd9iDbiW/f6fFczCQb+4qAs+T+mJ5V+YTA3cGs9DtUliw7yfwag7w2XBxmJd
	FA95CPJXzlCpDJRqF8Av8dE1swubnoskvLRrQeLtF1kjMYD+D0RJu7uRbTeCA/hditMi5FnUE3yRM
	kPrtm/9Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Qc1-00000006zVt-3IsM;
	Wed, 23 Apr 2025 03:17:25 +0000
Date: Wed, 23 Apr 2025 04:17:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, mcgrof@kernel.org, a.manzanares@samsung.com,
	dave@stgolabs.net, akpm@linux-foundation.org, david@redhat.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Fan Ni <fan.ni@samsung.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH v2 1/4] mm/hugetlb: Refactor unmap_ref_private() to take
 folio instead of page
Message-ID: <aAhbxQxMFAvsOrx0@casper.infradead.org>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418170834.248318-2-nifan.cxl@gmail.com>


With regard to the Subject: line, you're not "refactoring".  You're
passing a folio to the function.

> @@ -6108,7 +6108,8 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
>  		 */
>  		if (!is_vma_resv_set(iter_vma, HPAGE_RESV_OWNER))
>  			unmap_hugepage_range(iter_vma, address,
> -					     address + huge_page_size(h), page, 0);
> +					     address + huge_page_size(h),
> +					     folio_page(folio, 0), 0);

As previously, use &folio->page here.

