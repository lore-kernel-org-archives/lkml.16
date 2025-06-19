Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A458E22B59F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333937; cv=none; b=XUxFS6v/N7tCxDKHySWpyhkjLQfY+Tkcqs0qjxgQxr0giZIXaSuDucg3Ysfojt+2IK7VlLMiB6eFgBpPMRNDn1al9tY8zKjqlREmMsozjiTKv8S07gfAFLhmMZvsIENnY4yB9Cgo7ulfn9Wi8x3Tyd61cHqPcN2fCdHV9FHflf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333937; c=relaxed/simple;
	bh=Mrl/TyotBvvFYLAkLjtKZjHD0VrXz80mCZMSnaBfwBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z82BQtAWOXl3ls9n8WRnJDYbXghPE5RweAD9TbhjD4ObMcRfsgdOPe86EhWLAleKsBjM5OpAJAl+PwJEArywPbqMlY83GFjCTHMEBJx5w+5veHxrhbv9EhHeBidmkC1Ps+eRo7xHE0p3PoOYGEeb9kI/PaJ3xYSXirD6+MZimRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XSltles4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Dv2KOgK5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XSltles4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Dv2KOgK5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XSltles4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dv2KOgK5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XSltles4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dv2KOgK5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 84AEF1F38D;
	Thu, 19 Jun 2025 11:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750333932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gkbnI9M3+7/OCj+8WkZJ9wTg9dHnjACBL27tJy9YeR4=;
	b=XSltles4LDH0Wdek1UJs4MI/f58R4PWbxs/T3EBZ3M7ej4zF+hp/Fnueg8WuSUgCz0/MFZ
	YkEv37GuqS0Bluns3XK7Z1JAcnGI7KlK1pp9eZoQ2Tf6ZYrWOgXnxhoQfQ1EfTqaRMxBNT
	o+r6SKd+HwOnzNpWonhrlNcY0pHluAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750333932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gkbnI9M3+7/OCj+8WkZJ9wTg9dHnjACBL27tJy9YeR4=;
	b=Dv2KOgK5kp3kHgc6sivpwt8ndfJI1bzsQqesqdyNgbhD4/sO0IoIAs/8HLe7BkwiTNhg4z
	LCWFZe1GwlYVo+Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750333932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gkbnI9M3+7/OCj+8WkZJ9wTg9dHnjACBL27tJy9YeR4=;
	b=XSltles4LDH0Wdek1UJs4MI/f58R4PWbxs/T3EBZ3M7ej4zF+hp/Fnueg8WuSUgCz0/MFZ
	YkEv37GuqS0Bluns3XK7Z1JAcnGI7KlK1pp9eZoQ2Tf6ZYrWOgXnxhoQfQ1EfTqaRMxBNT
	o+r6SKd+HwOnzNpWonhrlNcY0pHluAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750333932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gkbnI9M3+7/OCj+8WkZJ9wTg9dHnjACBL27tJy9YeR4=;
	b=Dv2KOgK5kp3kHgc6sivpwt8ndfJI1bzsQqesqdyNgbhD4/sO0IoIAs/8HLe7BkwiTNhg4z
	LCWFZe1GwlYVo+Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E36FC136CC;
	Thu, 19 Jun 2025 11:52:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id t8jXM+v5U2g6cgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 19 Jun 2025 11:52:11 +0000
Date: Thu, 19 Jun 2025 13:52:10 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
Message-ID: <aFP56mLztZl8wI-K@localhost.localdomain>
References: <a5e098d1-ee5a-447f-9e05-0187b22500e1@redhat.com>
 <aFAlupvoJ_w7jCIU@localhost.localdomain>
 <1297fdd5-3de2-45bc-b146-e14061643fee@redhat.com>
 <aFE9YTNcCHAGBtKi@localhost.localdomain>
 <11a1d0f7-ef4e-4836-9bde-d7651eebcd03@redhat.com>
 <aFFZtD4zN_qINo9P@localhost.localdomain>
 <3eb8e1e2-5887-47ed-addc-3be664dd7053@redhat.com>
 <aFFbIXLHdYbM3ooa@localhost.localdomain>
 <aFFknpsmfb-Sh7xT@localhost.localdomain>
 <dac7aa4c-136d-4a01-9601-7bc0314a98a2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dac7aa4c-136d-4a01-9601-7bc0314a98a2@redhat.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On Tue, Jun 17, 2025 at 03:42:09PM +0200, David Hildenbrand wrote:
> Yes. As an alternative, keep locking it in the caller and only unlock in the
> !anon case?

This is what I came up with:

What do you think?

I just made sure that all hugetlb-LTP tests pass fine (after I fixed an
obvious mistake :-S)

 From 3a0c53a00511abdcf5df53491bbb9295973f24f9 Mon Sep 17 00:00:00 2001
 From: Oscar Salvador <osalvador@suse.de>
 Date: Wed, 11 Jun 2025 10:05:34 +0200
 Subject: [PATCH] mm,hugetlb: Sort out folio locking in the faulting path
 
 Recent conversations showed that there was a misunderstanding about why we
 were locking the folio prior to call in hugetlb_wp().
 In fact, as soon as we have the folio mapped into the pagetables, we no longer
 need to hold it locked, because we know that no concurrent truncation could have
 happened.
 There is only one case where the folio needs to be locked, and that is when we
 are handling an anonymous folio, because hugetlb_wp() will check whether it can
 re-use it exclusively for the process that is faulting it in.
 
 So, pass the folio locked to hugetlb_wp() when that is the case.
 
 Suggested-by: David Hildenbrand <david@redhat.com>
 Signed-off-by: Oscar Salvador <osalvador@suse.de>
 ---
  mm/hugetlb.c | 43 +++++++++++++++++++++++++++++++++----------
  1 file changed, 33 insertions(+), 10 deletions(-)
 
 diff --git a/mm/hugetlb.c b/mm/hugetlb.c
 index 175edafeec67..04049d0fb70d 100644
 --- a/mm/hugetlb.c
 +++ b/mm/hugetlb.c
 @@ -6437,6 +6437,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
  	pte_t new_pte;
  	bool new_folio, new_pagecache_folio = false;
  	u32 hash = hugetlb_fault_mutex_hash(mapping, vmf->pgoff);
 +	bool folio_locked = true;
  
  	/*
  	 * Currently, we are forced to kill the process in the event the
 @@ -6602,6 +6603,11 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
  
  	hugetlb_count_add(pages_per_huge_page(h), mm);
  	if ((vmf->flags & FAULT_FLAG_WRITE) && !(vma->vm_flags & VM_SHARED)) {
 +		/* No need to lock file folios. See comment in hugetlb_fault() */
 +		if (!anon_rmap) {
 +			folio_locked = false;
 +			folio_unlock(folio);
 +		}
  		/* Optimization, do the COW without a second fault */
  		ret = hugetlb_wp(vmf);
  	}
 @@ -6616,7 +6622,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
  	if (new_folio)
  		folio_set_hugetlb_migratable(folio);
  
 -	folio_unlock(folio);
 +	if (folio_locked)
 +		folio_unlock(folio);
  out:
  	hugetlb_vma_unlock_read(vma);
  
 @@ -6636,7 +6643,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
  	if (new_folio && !new_pagecache_folio)
  		restore_reserve_on_error(h, vma, vmf->address, folio);
  
 -	folio_unlock(folio);
 +	if (folio_locked)
 +		folio_unlock(folio);
  	folio_put(folio);
  	goto out;
  }
 @@ -6670,7 +6678,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
  {
  	vm_fault_t ret;
  	u32 hash;
 -	struct folio *folio;
 +	struct folio *folio = NULL;
  	struct hstate *h = hstate_vma(vma);
  	struct address_space *mapping;
  	struct vm_fault vmf = {
 @@ -6687,6 +6695,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
  		 * be hard to debug if called functions make assumptions
  		 */
  	};
 +	bool folio_locked = false;
  
  	/*
  	 * Serialize hugepage allocation and instantiation, so that we don't
 @@ -6801,13 +6810,24 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
  		/* Fallthrough to CoW */
  	}
  
 -	/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
 -	folio = page_folio(pte_page(vmf.orig_pte));
 -	folio_lock(folio);
 -	folio_get(folio);
 -
  	if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
  		if (!huge_pte_write(vmf.orig_pte)) {
 +			/*
 +			 * Anonymous folios need to be lock since hugetlb_wp()
 +			 * checks whether we can re-use it exclusively for us in
 +			 * case we are the only user.
 +			 */
 +			folio = page_folio(pte_page(vmf.orig_pte));
 +			folio_get(folio);
 +			if (folio_test_anon(folio)) {
 +				spin_unlock(vmf.ptl);
 +				folio_lock(folio);
 +				folio_locked = true;
 +				spin_lock(vmf.ptl);
 +				if (unlikely(!pte_same(vmf.orig_pte, huge_ptep_get(mm,
 +						   vmf.address, vmf.pte))))
 +					goto out_put_page;
 +			}
  			ret = hugetlb_wp(&vmf);
  			goto out_put_page;
  		} else if (likely(flags & FAULT_FLAG_WRITE)) {
 @@ -6819,8 +6839,11 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
  						flags & FAULT_FLAG_WRITE))
  		update_mmu_cache(vma, vmf.address, vmf.pte);
  out_put_page:
 -	folio_unlock(folio);
 -	folio_put(folio);
 +	if (folio) {
 +		if (folio_locked)
 +			folio_unlock(folio);
 +		folio_put(folio);
 +	}
  out_ptl:
  	spin_unlock(vmf.ptl);
  out_mutex:
 -- 
 2.49.0

 

-- 
Oscar Salvador
SUSE Labs
