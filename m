Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F78D28E5F4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749046952; cv=none; b=An2FSuhChq9FZEz3uoh/HFVijQIE4fA2THuBUe1czYrI9AeyqgRxqeG/3fSLE+gE0JMduyWCDpGMjQkPOlb1klkxszMDgYPJfC2K1OFsMB6mEBJml5/Fe/Otx1cAo4tdCNNoprHDn4p14GXY6IYaQdKs5E7RZRtAcSC9TkLuQqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749046952; c=relaxed/simple;
	bh=20qLp5eFVCc9S0TuosG0Blvo8ope/dtZh9+5znMNB4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u4Wz796VZPeoqfKyJLZrVutlYEJmx9y+WfA/tYjYjHj3SFU2CT2HwM5m5xIwcJ2Mcgbh7+62J0YE5OWnJ8jfVUWCIfBU2lHWUhhl+UOEQqSIRpOUUvvQmCZbYleRGF4D5qyGzTyqYf/cUN19juCkfnFLj8d6kFfqSicFd9KiUOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=jAaLnk0g; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=iuIWBj9v; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=rx9XVbmg; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zDWkXL1q; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="jAaLnk0g";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="iuIWBj9v";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="rx9XVbmg";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zDWkXL1q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CFF4C223DE;
	Wed,  4 Jun 2025 14:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749046948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ALVStNkShmrg++8Piu6YCjCiJOgAVP64VNCUFeKklYc=;
	b=jAaLnk0g7osHbUyBgGlgJi9xTP3doUgFUz3sLTa8ufjQbNyxh/UpFGkTmKlZVf/Dd7uFSk
	xNnX0fA2J757LL4jacFgwaeNA1uHtG7LmAKrBDyqo8vtcAY3TMjy/S3PM1XfyCuXNkv8VH
	inggGl25JHmWREjYohRGsF/11OzqkUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749046948;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ALVStNkShmrg++8Piu6YCjCiJOgAVP64VNCUFeKklYc=;
	b=iuIWBj9vJjb7Csl2KVYkicOjNBa70IDwxY4CE1UfPCiknHUQtUHJ/ItpYhnzce+cHCdF/u
	5R1vqUiULM0EaJDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749046946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ALVStNkShmrg++8Piu6YCjCiJOgAVP64VNCUFeKklYc=;
	b=rx9XVbmgRPZZklkTg5L1vK7AURT+LDMngy/YGbd6sp/sBpQVa9pQ/mtaI7xQgLFWDrxvya
	ay5t339fPWAueFSFs00R6u+4DkTuNWwkyBh7eQL0D5rJHT5AUAr7tFB1iuGEZ250BTPrFZ
	l4SmMiWlUK1dSAi6oFoKHj5Dv5bgy2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749046946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ALVStNkShmrg++8Piu6YCjCiJOgAVP64VNCUFeKklYc=;
	b=zDWkXL1qvwkgb4KZ5stTnLFFuEoxyxFb7ExNOGhhsS/Ff4gnUi+1ql2JVCRfHyknkyhesg
	NMF0c3+pF9HEEUCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B40D613A63;
	Wed,  4 Jun 2025 14:22:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id R4ugK6JWQGjfdQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 04 Jun 2025 14:22:26 +0000
Message-ID: <202d338d-30f6-4f3b-bddc-b0818a940732@suse.cz>
Date: Wed, 4 Jun 2025 16:22:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250604140544.688711-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,nvidia.com:email,suse.cz:mid,suse.cz:email,linux-foundation.org:email,imap1.dmz-prg2.suse.org:helo,oracle.com:email]
X-Spam-Level: 

On 6/4/25 16:05, David Hildenbrand wrote:
> Especially once we hit one of the assertions in
> sanity_check_pinned_pages(), observing follow-up assertions failing
> in other code can give good clues about what went wrong, so use
> VM_WARN_ON_ONCE instead.
> 
> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
> well. Add one comment for the pfn_valid() check.
> 
> We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
> 
> Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
> something > 0 we're in bigger trouble. Convert the other BUG_ON's into
> VM_WARN_ON_ONCE as well, they are in a similar domain "should never
> happen", but more reasonable to check for during early testing.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Makes sense, BUG_ONs bad.

Acked-by: Vlastimil Babka <vbabka@suse.cz>

> ---
> 
> Wanted to do this for a long time, but my todo list keeps growing ...
> 
> Based on mm/mm-unstable
> 
> ---
>  include/linux/mmdebug.h | 12 ++++++++++++
>  mm/gup.c                | 41 +++++++++++++++++++----------------------
>  2 files changed, 31 insertions(+), 22 deletions(-)
> 
> diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
> index a0a3894900ed4..14a45979cccc9 100644
> --- a/include/linux/mmdebug.h
> +++ b/include/linux/mmdebug.h
> @@ -89,6 +89,17 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  	}								\
>  	unlikely(__ret_warn_once);					\
>  })
> +#define VM_WARN_ON_ONCE_VMA(cond, vma)		({			\
> +	static bool __section(".data..once") __warned;			\
> +	int __ret_warn_once = !!(cond);					\
> +									\
> +	if (unlikely(__ret_warn_once && !__warned)) {			\
> +		dump_vma(vma);						\
> +		__warned = true;					\
> +		WARN_ON(1);						\
> +	}								\
> +	unlikely(__ret_warn_once);					\
> +})
>  #define VM_WARN_ON_VMG(cond, vmg)		({			\
>  	int __ret_warn = !!(cond);					\
>  									\
> @@ -115,6 +126,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  #define VM_WARN_ON_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_ONCE_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_ONCE_MM(cond, mm)  BUILD_BUG_ON_INVALID(cond)
> +#define VM_WARN_ON_ONCE_VMA(cond, vma)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_VMG(cond, vmg)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ONCE(cond, format...) BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN(cond, format...) BUILD_BUG_ON_INVALID(cond)
> diff --git a/mm/gup.c b/mm/gup.c
> index e065a49842a87..3c3931fcdd820 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -64,11 +64,11 @@ static inline void sanity_check_pinned_pages(struct page **pages,
>  		    !folio_test_anon(folio))
>  			continue;
>  		if (!folio_test_large(folio) || folio_test_hugetlb(folio))
> -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page), page);
> +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page), page);
>  		else
>  			/* Either a PTE-mapped or a PMD-mapped THP. */
> -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) &&
> -				       !PageAnonExclusive(page), page);
> +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page) &&
> +					     !PageAnonExclusive(page), page);
>  	}
>  }
>  
> @@ -760,8 +760,8 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
>  	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
>  		return ERR_PTR(-EMLINK);
>  
> -	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> -			!PageAnonExclusive(page), page);
> +	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> +			     !PageAnonExclusive(page), page);
>  
>  	ret = try_grab_folio(page_folio(page), 1, flags);
>  	if (ret)
> @@ -899,8 +899,8 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  		goto out;
>  	}
>  
> -	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> -		       !PageAnonExclusive(page), page);
> +	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> +			     !PageAnonExclusive(page), page);
>  
>  	/* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is set. */
>  	ret = try_grab_folio(folio, 1, flags);
> @@ -1180,7 +1180,7 @@ static int faultin_page(struct vm_area_struct *vma,
>  	if (unshare) {
>  		fault_flags |= FAULT_FLAG_UNSHARE;
>  		/* FAULT_FLAG_WRITE and FAULT_FLAG_UNSHARE are incompatible */
> -		VM_BUG_ON(fault_flags & FAULT_FLAG_WRITE);
> +		VM_WARN_ON_ONCE(fault_flags & FAULT_FLAG_WRITE);
>  	}
>  
>  	ret = handle_mm_fault(vma, address, fault_flags, NULL);
> @@ -1760,10 +1760,7 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  		}
>  
>  		/* VM_FAULT_RETRY or VM_FAULT_COMPLETED cannot return errors */
> -		if (!*locked) {
> -			BUG_ON(ret < 0);
> -			BUG_ON(ret >= nr_pages);
> -		}
> +		VM_WARN_ON_ONCE(!*locked && (ret < 0 || ret >= nr_pages));
>  
>  		if (ret > 0) {
>  			nr_pages -= ret;
> @@ -1808,7 +1805,6 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  
>  		ret = mmap_read_lock_killable(mm);
>  		if (ret) {
> -			BUG_ON(ret > 0);
>  			if (!pages_done)
>  				pages_done = ret;
>  			break;
> @@ -1819,11 +1815,11 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  				       pages, locked);
>  		if (!*locked) {
>  			/* Continue to retry until we succeeded */
> -			BUG_ON(ret != 0);
> +			VM_WARN_ON_ONCE(ret != 0);
>  			goto retry;
>  		}
>  		if (ret != 1) {
> -			BUG_ON(ret > 1);
> +			VM_WARN_ON_ONCE(ret > 1);
>  			if (!pages_done)
>  				pages_done = ret;
>  			break;
> @@ -1885,10 +1881,10 @@ long populate_vma_page_range(struct vm_area_struct *vma,
>  	int gup_flags;
>  	long ret;
>  
> -	VM_BUG_ON(!PAGE_ALIGNED(start));
> -	VM_BUG_ON(!PAGE_ALIGNED(end));
> -	VM_BUG_ON_VMA(start < vma->vm_start, vma);
> -	VM_BUG_ON_VMA(end   > vma->vm_end, vma);
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
> +	VM_WARN_ON_ONCE_VMA(start < vma->vm_start, vma);
> +	VM_WARN_ON_ONCE_VMA(end   > vma->vm_end, vma);
>  	mmap_assert_locked(mm);
>  
>  	/*
> @@ -1957,8 +1953,8 @@ long faultin_page_range(struct mm_struct *mm, unsigned long start,
>  	int gup_flags;
>  	long ret;
>  
> -	VM_BUG_ON(!PAGE_ALIGNED(start));
> -	VM_BUG_ON(!PAGE_ALIGNED(end));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
>  	mmap_assert_locked(mm);
>  
>  	/*
> @@ -2908,7 +2904,8 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
>  		} else if (pte_special(pte))
>  			goto pte_unmap;
>  
> -		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
> +		/* If it's not marked as special it must have a valid memmap. */
> +		VM_WARN_ON_ONCE(!pfn_valid(pte_pfn(pte)));
>  		page = pte_page(pte);
>  
>  		folio = try_grab_folio_fast(page, 1, flags);
> 
> base-commit: 2d0c297637e7d59771c1533847c666cdddc19884

