Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E464442A87
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749112871; cv=none; b=rtCQLGB33SOmSp/GdzxzYkcnJNc/OWRdeu3kXeVDx0AuLoxD2CdaoMP5Hw96MT3EGJY41/HTgep6cqTuSsPPy5y6vUjV45+EmpxMgjkJDNapHjz7IszIBpSVwukqjpJYp39WxhwA9SzvJBJ5vsR9ZF/xXkqv7Q9C1dFQOqW0cfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749112871; c=relaxed/simple;
	bh=j4C7ey1rAyyOw27WtM4pwE7uGX3hcPUurUCbDCPN9eU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=fEeMCmfmSUcvhiTZHfJSkJpl4cqhnGs2xB4hIY2WxFcjX3lY0YoS8obY9eqFkCOhQQSnHsiiBKxbnk33+Ok8rTDepPWbJxPB+1qPi20EAvbjheHlut8ECiHrC864LGtVUPnq+bFCIyq3cLln/743cvGZMwY+s13mFI9I6twUyA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EaNAJJZJ; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EaNAJJZJ"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250605084106epoutp01b42e6569190009cb44780ef73dd6de57~GGOKIwTeC0962409624epoutp01g
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:41:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250605084106epoutp01b42e6569190009cb44780ef73dd6de57~GGOKIwTeC0962409624epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749112866;
	bh=tXa0SEBrPs7d/bo6iM0bCVitHbWYu8Xz1wgs6ZQqUaM=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=EaNAJJZJZFUAmzmXFRn4FhfDFAEZXVfJRyHIfpjs4eqBTLj2XngJogS77RMqpDYME
	 TF+hvfcnjAwDw8b1zGctMsxdIJ+ExFblv47lGlZPq/mYf7p+DzYtFfTVBk+CJLlLYc
	 dg3Xddu/bZlZyC6iFgFOKtDrq0B6Sc085CdXB4bw=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250605084105epcas2p1a8fb18def52d2d110fb7fa381d2ca513~GGOJp1GAS1962519625epcas2p1Q;
	Thu,  5 Jun 2025 08:41:05 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.102]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bCdFs2nRLz6B9m8; Thu,  5 Jun
	2025 08:41:05 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250605084104epcas2p14d92d7acfa2efe7ead9fc8d8b9199cb8~GGOIe7tXd1729517295epcas2p1u;
	Thu,  5 Jun 2025 08:41:04 +0000 (GMT)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250605084104epsmtip1f69b1bf62a3b89e8f0ec6b2de3d5eb6a~GGOIbKI9Q2345923459epsmtip1A;
	Thu,  5 Jun 2025 08:41:04 +0000 (GMT)
Date: Thu, 5 Jun 2025 17:39:16 +0900
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
	jaewon31.kim@gmail.com, david@redhat.com, Andrew Morton
	<akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard
	<jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] mm: gup: avoid CMA page pinning by retrying
 migration if no migratable page
Message-ID: <20250605083916.GA3770753@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250605080436.3764686-2-hyesoo.yu@samsung.com>
X-CMS-MailID: 20250605084104epcas2p14d92d7acfa2efe7ead9fc8d8b9199cb8
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----bfByJ-ZIY6BJv7sVO1BMUP1RgQAR8Q.m4BWNyUsw_2ev9GnZ=_34a75_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250605080628epcas2p24220eeceef2ae38feeee9d2c18515800
References: <20250605080436.3764686-1-hyesoo.yu@samsung.com>
	<CGME20250605080628epcas2p24220eeceef2ae38feeee9d2c18515800@epcas2p2.samsung.com>
	<20250605080436.3764686-2-hyesoo.yu@samsung.com>

------bfByJ-ZIY6BJv7sVO1BMUP1RgQAR8Q.m4BWNyUsw_2ev9GnZ=_34a75_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 05, 2025 at 05:04:31PM +0900, Hyesoo Yu wrote:
> Commit 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
> introduced an issue where CMA pages could be pinned by longterm GUP requests.
> This occurs when unpinnable pages are detected but the movable_page_list is empty;
> the commit would return success without retrying, allowing unpinnable
> pages (such as CMA) to become pinned.
> 
> CMA pages may be temporarily off the LRU due to concurrent isolation,
> for example when multiple longterm GUP requests are racing and therefore
> not appear in movable_page_list. Before commit 1aaf8c, the kernel would
> retry migration in such cases, which helped avoid accidental CMA pinning.
> 
> The original intent of the commit was to support longterm GUP on non-LRU
> CMA pages in out-of-tree use cases such as pKVM. However, allowing this
> can lead to broader CMA pinning issues.
> 
> To avoid this, the logic is restored to return -EAGAIN instead of success
> when no folios could be collected but unpinnable pages were found.
> This ensures that migration is retried until success, and avoids
> inadvertently pinning unpinnable pages.
> 
> Fixes: 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> 
> ---
> We have confirmed that this regression causes CMA pages to be pinned
> in our kernel 6.12-based environment.
> 
> In addition to CMA allocation failures, we also observed longterm GUP failures
> when repeatedly accessing the same VMA. Specifically, the first longterm GUP
> call would pin a CMA page, and a second call on the same region
> would fail the migration because the cma page was already pinned.
> 
> After reverting commit 1aaf8c122918, the issue no longer reproduced.
> 
> Therefore, this fix is important to ensure reliable behavior of longterm GUP
> and CMA-backed memory, and should be backported to stable.
> ---
>  mm/gup.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index e065a49842a8..66193421c1d4 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2300,14 +2300,12 @@ static void pofs_unpin(struct pages_or_folios *pofs)
>  		unpin_user_pages(pofs->pages, pofs->nr_entries);
>  }
>  
> -/*
> - * Returns the number of collected folios. Return value is always >= 0.
> - */
> -static void collect_longterm_unpinnable_folios(
> +static bool collect_longterm_unpinnable_folios(
>  		struct list_head *movable_folio_list,
>  		struct pages_or_folios *pofs)
>  {
>  	struct folio *prev_folio = NULL;
> +	bool any_unpinnable = false;
>  	bool drain_allow = true;
>  	unsigned long i;
>  
> @@ -2321,6 +2319,8 @@ static void collect_longterm_unpinnable_folios(
>  		if (folio_is_longterm_pinnable(folio))
>  			continue;
>  
> +		any_unpinnable = true;
> +
>  		if (folio_is_device_coherent(folio))
>  			continue;
>
> @@ -2342,6 +2342,8 @@ static void collect_longterm_unpinnable_folios(
>  				    NR_ISOLATED_ANON + folio_is_file_lru(folio),
>  				    folio_nr_pages(folio));
>  	}
> +
> +	return any_unpinnable;
>  }
>  
>  /*
> @@ -2417,11 +2419,25 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
>  static long
>  check_and_migrate_movable_pages_or_folios(struct pages_or_folios *pofs)
>  {
> +	bool any_unpinnable;
> +
>  	LIST_HEAD(movable_folio_list);
>  
> -	collect_longterm_unpinnable_folios(&movable_folio_list, pofs);
> -	if (list_empty(&movable_folio_list))
> +	any_unpinnable = collect_longterm_unpinnable_folios(&movable_folio_list, pofs);
> +

Hi David,

While re-reviewing the v3 patch, I realized that migrate_longterm_unpinnable_folios()
should always be called whenever unpinnable folios are present, regardless of whether
the movable_folio_list is empty.

In collect_longterm_unpinnable_folios(), if folio_is_device_coherent() is true,
the folio is not added to movable_folio_list. However, such device-coherent folios
still need to be migrated later in migrate_longterm_unpinnable_folios().

I think the condition `list_empty(&movable_folio_list)` should be removed,
and it might be better to revert commit 1aaf8c122918 rather than adding a new patch.

What do you think?

Thanks,
Regards.

> +	if (list_empty(&movable_folio_list)) {
> +		/*
> +		 * If we find any longterm unpinnable page that we failed to
> +		 * isolated for migration, it might be because someone else
> +		 * concurrently isolated it. Make the caller retry until it
> +		 * succeeds.
> +		 */
> +		if (any_unpinnable) {
> +			pofs_unpin(pofs);
> +			return -EAGAIN;
> +		}
>  		return 0;
> +	}
>  
>  	return migrate_longterm_unpinnable_folios(&movable_folio_list, pofs);
>  }
> -- 
> 2.49.0
> 
> 

------bfByJ-ZIY6BJv7sVO1BMUP1RgQAR8Q.m4BWNyUsw_2ev9GnZ=_34a75_
Content-Type: text/plain; charset="utf-8"


------bfByJ-ZIY6BJv7sVO1BMUP1RgQAR8Q.m4BWNyUsw_2ev9GnZ=_34a75_--
