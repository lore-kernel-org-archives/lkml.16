Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D9C2236F0
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749032552; cv=none; b=eLMSGFFNHnsmxRoiuks3G+PjbNHoz3CM/1FHbkv+8jE7Xz+yxbFN6ED9WC7cjGiVKEXWOiohWFGmhN6pHrUlBtOQRAkmqPLTDuqTCSIWLbGwiTLMmEVxWk7aEjcaGSWbhpWteUuT9FXxu3MC5y2ejmfDqjdRepnu9Ay9cf42yLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749032552; c=relaxed/simple;
	bh=Qz5W+vvradWz8G1yGaxhcXNSB9TzaaANhMo6byS0QGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=DOgxqOlTILn9veHeIdvFMMe5Sy0PjSrhTtFmu61iPk7RuUlXRtvKtoi+kVeQXAD+lmp56Ogu2SJvSLn2Wx01SffVmaAZO/T62Pn0N0Gxsb5FzBMVOJj2HWJUWBpoUfALQcWZmayM4LmgBwI1NcxTaxG98Tu7Uzj925S1oOL7Bt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Z60bS6rZ; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Z60bS6rZ"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250604102221epoutp03ce3d137257c69dfeb46ba9a06da04897~Fz9SB_QMj1578015780epoutp03l
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:22:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250604102221epoutp03ce3d137257c69dfeb46ba9a06da04897~Fz9SB_QMj1578015780epoutp03l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749032541;
	bh=5PFJKOcCJULULXlfEo0K6/6CMfBVPePa/hBz4dur49c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z60bS6rZdi0hWnk0sSxuIcUwZq7U8bml6F/zXGZL9fEBhyHqaq7fDze/nW+lE24dm
	 OghcnvaKeBad/vT4zhggvzlTGIybJSCTtTWwftVdZbzwMjSf2ybJaI2vgrhGWd+cfA
	 VZ+EHGpXsILXfPXvbhoXTu4LwfsH8Dgoee766ufk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250604102220epcas2p1cf5f69cfed7f307bb22bda90b73cce9f~Fz9RHCVZR1135311353epcas2p1Z;
	Wed,  4 Jun 2025 10:22:20 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bC3Y82q3dz6B9m7; Wed,  4 Jun
	2025 10:22:20 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250604102219epcas2p4e13cbdf67accf9389272d1889e073898~Fz9QDGduJ0169101691epcas2p4Y;
	Wed,  4 Jun 2025 10:22:19 +0000 (GMT)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250604102219epsmtip2cea4cb3046f85c7514d67452e731543e~Fz9QAFh431738217382epsmtip2j;
	Wed,  4 Jun 2025 10:22:19 +0000 (GMT)
Date: Wed, 4 Jun 2025 19:20:31 +0900
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: David Hildenbrand <david@redhat.com>
Cc: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
	jaewon31.kim@gmail.com, Andrew Morton <akpm@linux-foundation.org>, Jason
	Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu
	<peterx@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: gup: fail migration when no migratable page to
 prevent CMA pinning
Message-ID: <20250604102031.GA4060485@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <fa9d72ac-1b46-4a09-8f29-af97f2ca6e2e@redhat.com>
X-CMS-MailID: 20250604102219epcas2p4e13cbdf67accf9389272d1889e073898
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----6COtjJDFSqE3oSvckRkzJ3gMdAJ_hz7naVTtDv8sVOxgD1sZ=_290f2_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250604095242epcas2p17032a1133b03be2d24c8ebcff94d1d55
References: <CGME20250604095242epcas2p17032a1133b03be2d24c8ebcff94d1d55@epcas2p1.samsung.com>
	<20250604095049.4052078-1-hyesoo.yu@samsung.com>
	<fa9d72ac-1b46-4a09-8f29-af97f2ca6e2e@redhat.com>

------6COtjJDFSqE3oSvckRkzJ3gMdAJ_hz7naVTtDv8sVOxgD1sZ=_290f2_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 04, 2025 at 12:07:21PM +0200, David Hildenbrand wrote:
> On 04.06.25 11:50, Hyesoo Yu wrote:
> > Commit 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
> > caused CMA pages to become pinned in some cases when handling longterm GUP.
> > This happened because migration would return success immediately if no pages
> > were in the movable_page_list, without retrying.
> > 
> > However, CMA pages can be temporarily off the LRU (e.g., in pagevecs), and
> 
> A better example might be concurrent isolation. Just imagine two of these
> longterm pinnings racing.
> 

I will change the example below.

CMA pages may be temporarily off the LRU due to concurrent isolation, for example
when multiple longterm GUP requests are racing.


> > therefore not appear in movable_page_list, even though they can be migrated
> > later. Before commit 1aaf8c, the kernel would retry migration in such cases,
> > which helped avoid accidental CMA pinning.
> > 
> > The commit 1aaf8c aimed to support an out-of-tree use case (like pKVM), where
> > longterm GUP was applied to non-LRU CMA pages. But allowing CMA pinning
> > in general for this corner case could lead to more fragmentation and
> > reliability issues. So this patch prevents that.
> > 
> > Instead of retrying, this patch explicitly fails the migration attempt
> > (-EBUSY) if no movable pages are found and unpinnable pages remain.
> > This avoids infinite loops and gives user a clear signal to retry,
> > rather then spinning inside kernel.
> 
> Hmmm, that means we will return EBUSY to the caller. Are all users actually
> prepared to deal with that?
> 
> So far we only returned EBUSY in this corner-case
> migrate_device_coherent_folio() that most callers never actually trigger.
> 
> Maybe we should do EAGAIN for now (old way of doing it?), and look into
> doing EBUSY separately.
> 

Thank you for the feedback. I agree. I'll keep this patch focused on resolving
the CMA pinning issue using -EAGAIN. Handling -EBUSY can be considered separately.

> > 
> > Fixes: 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
> > Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> > ---
> >   mm/gup.c | 49 ++++++++++++++++++++++++++-----------------------
> >   1 file changed, 26 insertions(+), 23 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index e065a49842a8..446938aedcc9 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -2303,12 +2303,13 @@ static void pofs_unpin(struct pages_or_folios *pofs)
> >   /*
> >    * Returns the number of collected folios. Return value is always >= 0.
> >    */
> 
> Comment should be removed.
> 

Got it. I'll remove the comment.

> > -static void collect_longterm_unpinnable_folios(
> > +static bool collect_longterm_unpinnable_folios(
> >   		struct list_head *movable_folio_list,
> >   		struct pages_or_folios *pofs)
> >   {
> >   	struct folio *prev_folio = NULL;
> >   	bool drain_allow = true;
> > +	bool any_unpinnable = false;
> >   	unsigned long i;
> >   	for (i = 0; i < pofs->nr_entries; i++) {
> > @@ -2321,6 +2322,8 @@ static void collect_longterm_unpinnable_folios(
> >   		if (folio_is_longterm_pinnable(folio))
> >   			continue;
> > +		any_unpinnable = true;
> > +
> >   		if (folio_is_device_coherent(folio))
> >   			continue;
> > @@ -2342,6 +2345,8 @@ static void collect_longterm_unpinnable_folios(
> >   				    NR_ISOLATED_ANON + folio_is_file_lru(folio),
> >   				    folio_nr_pages(folio));
> >   	}
> > +
> > +	return any_unpinnable;
> >   }
> >   /*
> > @@ -2353,8 +2358,13 @@ static int
> >   migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
> >   				   struct pages_or_folios *pofs)
> >   {
> > -	int ret;
> > +	int ret = -EAGAIN;
> >   	unsigned long i;
> > +	struct migration_target_control mtc = {
> > +		.nid = NUMA_NO_NODE,
> > +		.gfp_mask = GFP_USER | __GFP_NOWARN,
> > +		.reason = MR_LONGTERM_PIN,
> > +	};
> 
> Reverse xmas tree while we're at it.
> 
> But, can we do this cleanup here separately, and not as part of the fix?
> 

I'll prepare a separate patch for the cleanup.

> >   	for (i = 0; i < pofs->nr_entries; i++) {
> >   		struct folio *folio = pofs_get_folio(pofs, i);
> > @@ -2370,6 +2380,7 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
> >   			gup_put_folio(folio, 1, FOLL_PIN);
> >   			if (migrate_device_coherent_folio(folio)) {
> > +				pofs_unpin(pofs);
> >   				ret = -EBUSY;
> >   				goto err;
> >   			}
> > @@ -2388,27 +2399,11 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
> >   		pofs_clear_entry(pofs, i);
> >   	}
> > -	if (!list_empty(movable_folio_list)) {
> > -		struct migration_target_control mtc = {
> > -			.nid = NUMA_NO_NODE,
> > -			.gfp_mask = GFP_USER | __GFP_NOWARN,
> > -			.reason = MR_LONGTERM_PIN,
> > -		};
> > -
> > -		if (migrate_pages(movable_folio_list, alloc_migration_target,
> > -				  NULL, (unsigned long)&mtc, MIGRATE_SYNC,
> > -				  MR_LONGTERM_PIN, NULL)) {
> > -			ret = -ENOMEM;
> > -			goto err;
> > -		}
> > -	}
> > -
> > -	putback_movable_pages(movable_folio_list);
> > -
> > -	return -EAGAIN;
> > +	if (migrate_pages(movable_folio_list, alloc_migration_target, NULL,
> > +			  (unsigned long)&mtc, MIGRATE_SYNC, MR_LONGTERM_PIN, NULL))
> > +		ret = -ENOMEM;
> >   err:
> > -	pofs_unpin(pofs);
> >   	putback_movable_pages(movable_folio_list);
> >   	return ret;
> > @@ -2417,11 +2412,19 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
> >   static long
> >   check_and_migrate_movable_pages_or_folios(struct pages_or_folios *pofs)
> >   {
> > +	bool any_unpinnable;
> > +
> >   	LIST_HEAD(movable_folio_list);
> > -	collect_longterm_unpinnable_folios(&movable_folio_list, pofs);
> > -	if (list_empty(&movable_folio_list))
> > +	any_unpinnable = collect_longterm_unpinnable_folios(&movable_folio_list, pofs);
> > +
> > +	if (list_empty(&movable_folio_list)) {
> > +		if (any_unpinnable) {
> 
> /*
>  * If we find any longterm unpinnable page that we failed to
>  * isolated for migration, it might be because someone else
>  * concurrently isolated it. Make the caller retry until it
>  * succeeds.
>  */
> 
> 

I will add the comment.

> > +			pofs_unpin(pofs);
> > +			return -EBUSY;
> > +		}
> >   		return 0;
> > +	}
> >   	return migrate_longterm_unpinnable_folios(&movable_folio_list, pofs);
> >   }
> 
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 

Thanks,
Regards. 

------6COtjJDFSqE3oSvckRkzJ3gMdAJ_hz7naVTtDv8sVOxgD1sZ=_290f2_
Content-Type: text/plain; charset="utf-8"


------6COtjJDFSqE3oSvckRkzJ3gMdAJ_hz7naVTtDv8sVOxgD1sZ=_290f2_--
