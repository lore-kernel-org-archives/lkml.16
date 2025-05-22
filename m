Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128182BDC1D
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747942383; cv=none; b=jztsNKO2/8Pj4GDkmQz7TPSwxbb88NX0svqA9vKjMXQh9UNxftD2N/0CLiNAZUkO1vmqi4bim5BS9BRxpLWKB+qt3u0uu9htHS5Fpz3AhCXi4keCqMVBlfF6WL+YiZmJBtNDncpQTyaK6Yyy5DFDhvAXZWXK6NGUpEfewEafcso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747942383; c=relaxed/simple;
	bh=fvfJJlLK+8OMCA9XCJtW+WPv9Bz75BCRfHdnweufkxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7erHo1h2/q/LmSiIK5mZQ05yiE1K0TvIG5A6SdU7opjG207ZD6a7ZgtItBTZNGTxg6KAMd91Rd4d/t0FHsY7S8Kg6Kd4wf2yxvggjEr/OQ/gAjqQezXmLnw4H8OKrzl3qtKF8EIGbMysLukfT5NDFY+MHwxJmJDDjwNUpvsNuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Axt7BNJR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FJaHp1pQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Axt7BNJR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FJaHp1pQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Axt7BNJR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FJaHp1pQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Axt7BNJR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FJaHp1pQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 21CA921757;
	Thu, 22 May 2025 19:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747942379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XoGriKZH/KeIHMAtr2DMyXbRh64tZ6X3COoz6omsFrg=;
	b=Axt7BNJRz/6WYLTpf/+9XmUnNIYnbRDuHiuXK/p7w1iYNvLXKhs9Kpb9BK3HCluXopi+55
	eRHGQyOWxUvi7iRxzqVjnJvqEOKJC+vvfCsoeMCAvDbQ8K7TX40Eca2JNrrIsnuNJg8rLI
	4zgJOAcHKMXs8GIj5R+0Ku2HGstCPIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747942379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XoGriKZH/KeIHMAtr2DMyXbRh64tZ6X3COoz6omsFrg=;
	b=FJaHp1pQ9ZFGJhQVY9TOIdfDRhcpaoLrDppHgkz8CqruLQD3rNM6OWWJGUeueYmtZx4Gg+
	7xIuflG7Rx4UKdAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Axt7BNJR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FJaHp1pQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747942379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XoGriKZH/KeIHMAtr2DMyXbRh64tZ6X3COoz6omsFrg=;
	b=Axt7BNJRz/6WYLTpf/+9XmUnNIYnbRDuHiuXK/p7w1iYNvLXKhs9Kpb9BK3HCluXopi+55
	eRHGQyOWxUvi7iRxzqVjnJvqEOKJC+vvfCsoeMCAvDbQ8K7TX40Eca2JNrrIsnuNJg8rLI
	4zgJOAcHKMXs8GIj5R+0Ku2HGstCPIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747942379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XoGriKZH/KeIHMAtr2DMyXbRh64tZ6X3COoz6omsFrg=;
	b=FJaHp1pQ9ZFGJhQVY9TOIdfDRhcpaoLrDppHgkz8CqruLQD3rNM6OWWJGUeueYmtZx4Gg+
	7xIuflG7Rx4UKdAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0EA313433;
	Thu, 22 May 2025 19:32:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qg3OGuh7L2j6awAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 22 May 2025 19:32:56 +0000
Date: Thu, 22 May 2025 21:32:48 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Muchun Song <muchun.song@linux.dev>
Cc: Ge Yang <yangge1116@126.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, 21cnbao@gmail.com, david@redhat.com,
	baolin.wang@linux.alibaba.com, liuzixing@hygon.cn
Subject: Re: [PATCH] mm/hugetlb: fix kernel NULL pointer dereference when
 replacing free hugetlb folios
Message-ID: <aC974OtOuj9Tqzsa@localhost.localdomain>
References: <1747884137-26685-1-git-send-email-yangge1116@126.com>
 <644FF836-9DC7-42B4-BACE-C433E637B885@linux.dev>
 <aC63fmFKK84K7YiZ@localhost.localdomain>
 <ff6bd560-d249-418f-81f4-7cbe055a25ec@126.com>
 <aC8PRkyd3y74Ph5R@localhost.localdomain>
 <3B8641A1-5345-44A5-B610-9BCBC980493D@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3B8641A1-5345-44A5-B610-9BCBC980493D@linux.dev>
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Queue-Id: 21CA921757
X-Spam-Score: -1.51
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[126.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[126.com,linux-foundation.org,kvack.org,vger.kernel.org,gmail.com,redhat.com,linux.alibaba.com,hygon.cn];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

On Thu, May 22, 2025 at 08:39:39PM +0800, Muchun Song wrote:
> But I think we could use "folio_order() > MAX_PAGE_ORDER" to replace the check
> of hstate_is_gigantic(), right? Then ee could remove the first parameter of hstate
> from alloc_and_dissolve_hugetlb_folio() and obtain hstate in it.

Yes, I think we can do that.
So something like the following (compily-tested only) maybe?

 From d7199339e905f83b54d22849e8f21f631916ce94 Mon Sep 17 00:00:00 2001
 From: Oscar Salvador <osalvador@suse.de>
 Date: Thu, 22 May 2025 19:51:04 +0200
 Subject: [PATCH] TMP
 
 ---
  mm/hugetlb.c | 38 +++++++++-----------------------------
  1 file changed, 9 insertions(+), 29 deletions(-)
 
 diff --git a/mm/hugetlb.c b/mm/hugetlb.c
 index bd8971388236..20f08de9e37d 100644
 --- a/mm/hugetlb.c
 +++ b/mm/hugetlb.c
 @@ -2787,15 +2787,13 @@ void restore_reserve_on_error(struct hstate *h, struct vm_area_struct *vma,
  /*
   * alloc_and_dissolve_hugetlb_folio - Allocate a new folio and dissolve
   * the old one
 - * @h: struct hstate old page belongs to
   * @old_folio: Old folio to dissolve
   * @list: List to isolate the page in case we need to
   * Returns 0 on success, otherwise negated error.
   */
 -static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
 -			struct folio *old_folio, struct list_head *list)
 +static int alloc_and_dissolve_hugetlb_folio(struct folio *old_folio, struct list_head *list)
  {
 -	gfp_t gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
 +	struct hstate *h;
  	int nid = folio_nid(old_folio);
  	struct folio *new_folio = NULL;
  	int ret = 0;
 @@ -2829,7 +2827,11 @@ static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
  		cond_resched();
  		goto retry;
  	} else {
 +		h = folio_hstate(old_folio);
 +
  		if (!new_folio) {
 +			gfp_t gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
 +
  			spin_unlock_irq(&hugetlb_lock);
  			new_folio = alloc_buddy_hugetlb_folio(h, gfp_mask, nid,
  							      NULL, NULL);
 @@ -2874,35 +2876,20 @@ static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
  
  int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list)
  {
 -	struct hstate *h;
  	int ret = -EBUSY;
  
 -	/*
 -	 * The page might have been dissolved from under our feet, so make sure
 -	 * to carefully check the state under the lock.
 -	 * Return success when racing as if we dissolved the page ourselves.
 -	 */
 -	spin_lock_irq(&hugetlb_lock);
 -	if (folio_test_hugetlb(folio)) {
 -		h = folio_hstate(folio);
 -	} else {
 -		spin_unlock_irq(&hugetlb_lock);
 -		return 0;
 -	}
 -	spin_unlock_irq(&hugetlb_lock);
 -
  	/*
  	 * Fence off gigantic pages as there is a cyclic dependency between
  	 * alloc_contig_range and them. Return -ENOMEM as this has the effect
  	 * of bailing out right away without further retrying.
  	 */
 -	if (hstate_is_gigantic(h))
 +	if (folio_order(folio) > MAX_PAGE_ORDER)
  		return -ENOMEM;
  
  	if (folio_ref_count(folio) && folio_isolate_hugetlb(folio, list))
  		ret = 0;
  	else if (!folio_ref_count(folio))
 -		ret = alloc_and_dissolve_hugetlb_folio(h, folio, list);
 +		ret = alloc_and_dissolve_hugetlb_folio(folio, list);
  
  	return ret;
  }
 @@ -2916,7 +2903,6 @@ int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list)
   */
  int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
  {
 -	struct hstate *h;
  	struct folio *folio;
  	int ret = 0;
  
 @@ -2924,15 +2910,9 @@ int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
  
  	while (start_pfn < end_pfn) {
  		folio = pfn_folio(start_pfn);
 -		if (folio_test_hugetlb(folio)) {
 -			h = folio_hstate(folio);
 -		} else {
 -			start_pfn++;
 -			continue;
 -		}
  
  		if (!folio_ref_count(folio)) {
 -			ret = alloc_and_dissolve_hugetlb_folio(h, folio,
 +			ret = alloc_and_dissolve_hugetlb_folio(folio,
  							       &isolate_list);
  			if (ret)
  				break;
 -- 
 2.49.0

 

-- 
Oscar Salvador
SUSE Labs
