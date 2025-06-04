Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E0318F2DF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749051286; cv=none; b=tDUtbRNhPzi7KCW3jlorqgaNJ7ddL16R3KpuqtE0CmpDODI3Jwktpp0FFLlG0MniLO4Z/TskyUsfWq3D00Uw3lcspIMDxcLk4a3bEns805rFRZrZDsqIubBaUNjGO4Z4mZOm3hzgqFPDRK/GJ3erhGMctpKJ6991v60npIackR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749051286; c=relaxed/simple;
	bh=RINTIBLzTN0ku0aScR3FwXlQneypdbeTTT4uXBoDKc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTSenqgLHsSM2WqmQgx92x/RQrCP3FZlNuVvb2gWH9w5nnqNhKgZe9ItWl5J4JRJgAnwwH67yypYW/Orcx54EPjAGAvHo3KTc8J7kJuFWHvdpLZPIAoBCoqNcrhRHtnm6Q/0CcCZV6lavdIXGiKFmyu6EEyHrD8QQSNLxUEuUOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HeT3cHDA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HeT3cHDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749051282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfynHbafjDR5XmPD+vF/S3IYTbhu9p0ot28pFP/ysEk=;
	b=HeT3cHDAedqCrBQNEAYuDLM8o6Ala9069kGBTszfgYRZ4ve6mZ4R/sxk96T+noTJsWtqIy
	vLOBI7ihvkhuS9c5CvEW9O7fxSnSVFNuaiM3PnOM7Kv/cUFaPNzhu9fWpRef726sWT7L5q
	7mSD0bc/PQdoTKsF+3A7E6qDnplPSUA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-5_9r__9CM6ygdd1EqhyVmw-1; Wed, 04 Jun 2025 11:34:41 -0400
X-MC-Unique: 5_9r__9CM6ygdd1EqhyVmw-1
X-Mimecast-MFC-AGG-ID: 5_9r__9CM6ygdd1EqhyVmw_1749051281
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6faeebe9c5bso197316d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749051281; x=1749656081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfynHbafjDR5XmPD+vF/S3IYTbhu9p0ot28pFP/ysEk=;
        b=UtaltvGGo8RCmFSeRL2x/rc7qPdIpZJjxqxmhNVNzlLv4nT6+VoRtozs13ZF66co0F
         e6CVXXNEGrkE8wDQ9PW5TEtShD7hV8LHwy+dsBFmkXCUmNNWLon1b/zm3zPPpzelHor3
         bbiUTKIdS2n3fDcETnQ67tyIkANYwjOgZfC3rRr5KmSc7EG1fhPEboRhdqLODjZoD3Bh
         DumGR/YcQ/fk6f6dwaFnytI3im8cYbPFVXDZ1frhBJMYVfTyLIVjMCp89H0OomhK3SRc
         pmhjhALRfmEV6SlqBdp9d3iQS8aW4s444UvcRcRNCA/aTWnH1qduB63owcJoers4ZYVv
         To0w==
X-Forwarded-Encrypted: i=1; AJvYcCVi2448Heco8nEjDdZH87a+GPOc4//Q5SASfXPnBICGh2Wr8sEGjWor1Kxo7bCdLYvLDZ8dS9ou158xVyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsuYZTqI+ssyb4pVVey2wKMMzofaoJ39Zy6SdWJs8CQcvTdX3R
	mW9/Lbuaev72P4Ks7gHqK0APDYt0iXoposQrYrL3DkuO305ULgqSovuctFCog4QHhcwoj0s2P7X
	6aplnlpkjXJb4mcTAIsqWlJaHfLMPat/Pb8ByO76WAnIQcfyTxBmNdIT21lxxgpKMiQ==
X-Gm-Gg: ASbGncur5K0750VzdjxID4WUoKTAeQPskoAu8JY8i9Sf88I6MCIepcJ9yZ8I56MIEz2
	9hBWvSpNXCcEE5PSBhjubZ/qAKQ6ViuPPbWDBEEMPFkeq9bCIPLsO1mDg6FDMek+BOJ00P5uIdl
	iVhU22rsM1rkCLK3rCejM/BtFXMRRbd7Cih+sXvL+O45k4oDK8U5MDC8xWYlBjOWDHRltL+9KeH
	rMesFR/J3DtJI8Jx+CeJr3S2nShUDP0QmbQIFb+8Gw77jxpNtkxmHW2pJB86jZ9deD6xZKakEv2
	oLs=
X-Received: by 2002:a05:6214:ac1:b0:6fa:ce35:1ab1 with SMTP id 6a1803df08f44-6faf6fb83c3mr38167716d6.29.1749051280773;
        Wed, 04 Jun 2025 08:34:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvXfYwH6TWpq2t5A4sZ2wt/SNAp/Tp/227IPyexTsW11lGOGB7zsiZgDYEnEkSNOHjgemPhg==
X-Received: by 2002:a05:6214:ac1:b0:6fa:ce35:1ab1 with SMTP id 6a1803df08f44-6faf6fb83c3mr38167236d6.29.1749051280100;
        Wed, 04 Jun 2025 08:34:40 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a195507sm1055594185a.88.2025.06.04.08.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:34:39 -0700 (PDT)
Date: Wed, 4 Jun 2025 11:34:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Barry Song <21cnbao@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Lokesh Gidra <lokeshgidra@google.com>, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mm: userfaultfd: fix race of userfaultfd_move and
 swap cache
Message-ID: <aEBnjWkghvXqlYZo@x1.local>
References: <20250604151038.21968-1-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250604151038.21968-1-ryncsn@gmail.com>

On Wed, Jun 04, 2025 at 11:10:38PM +0800, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> On seeing a swap entry PTE, userfaultfd_move does a lockless swap
> cache lookup, and tries to move the found folio to the faulting vma.
> Currently, it relies on checking the PTE value to ensure that the moved
> folio still belongs to the src swap entry and that no new folio has
> been added to the swap cache, which turns out to be unreliable.
> 
> While working and reviewing the swap table series with Barry, following
> existing races are observed and reproduced [1]:
> 
> In the example below, move_pages_pte is moving src_pte to dst_pte,
> where src_pte is a swap entry PTE holding swap entry S1, and S1
> is not in the swap cache:
> 
> CPU1                               CPU2
> userfaultfd_move
>   move_pages_pte()
>     entry = pte_to_swp_entry(orig_src_pte);
>     // Here it got entry = S1
>     ... < interrupted> ...
>                                    <swapin src_pte, alloc and use folio A>
>                                    // folio A is a new allocated folio
>                                    // and get installed into src_pte
>                                    <frees swap entry S1>
>                                    // src_pte now points to folio A, S1
>                                    // has swap count == 0, it can be freed
>                                    // by folio_swap_swap or swap
>                                    // allocator's reclaim.
>                                    <try to swap out another folio B>
>                                    // folio B is a folio in another VMA.
>                                    <put folio B to swap cache using S1 >
>                                    // S1 is freed, folio B can use it
>                                    // for swap out with no problem.
>                                    ...
>     folio = filemap_get_folio(S1)
>     // Got folio B here !!!
>     ... < interrupted again> ...
>                                    <swapin folio B and free S1>
>                                    // Now S1 is free to be used again.
>                                    <swapout src_pte & folio A using S1>
>                                    // Now src_pte is a swap entry PTE
>                                    // holding S1 again.
>     folio_trylock(folio)
>     move_swap_pte
>       double_pt_lock
>       is_pte_pages_stable
>       // Check passed because src_pte == S1
>       folio_move_anon_rmap(...)
>       // Moved invalid folio B here !!!
> 
> The race window is very short and requires multiple collisions of
> multiple rare events, so it's very unlikely to happen, but with a
> deliberately constructed reproducer and increased time window, it
> can be reproduced easily.
> 
> This can be fixed by checking if the folio returned by filemap is the
> valid swap cache folio after acquiring the folio lock.
> 
> Another similar race is possible: filemap_get_folio may return NULL, but
> folio (A) could be swapped in and then swapped out again using the same
> swap entry after the lookup. In such a case, folio (A) may remain in the
> swap cache, so it must be moved too:
> 
> CPU1                               CPU2
> userfaultfd_move
>   move_pages_pte()
>     entry = pte_to_swp_entry(orig_src_pte);
>     // Here it got entry = S1, and S1 is not in swap cache
>     folio = filemap_get_folio(S1)
>     // Got NULL
>     ... < interrupted again> ...
>                                    <swapin folio A and free S1>
>                                    <swapout folio A re-using S1>
>     move_swap_pte
>       double_pt_lock
>       is_pte_pages_stable
>       // Check passed because src_pte == S1
>       folio_move_anon_rmap(...)
>       // folio A is ignored !!!
> 
> Fix this by checking the swap cache again after acquiring the src_pte
> lock. And to avoid the filemap overhead, we check swap_map directly [2].
> 
> The SWP_SYNCHRONOUS_IO path does make the problem more complex, but so
> far we don't need to worry about that, since folios can only be exposed
> to the swap cache in the swap out path, and this is covered in this
> patch by checking the swap cache again after acquiring the src_pte lock.
> 
> Testing with a simple C program that allocates and moves several GB of
> memory did not show any observable performance change.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: adef440691ba ("userfaultfd: UFFDIO_MOVE uABI")
> Closes: https://lore.kernel.org/linux-mm/CAMgjq7B1K=6OOrK2OUZ0-tqCzi+EJt+2_K97TPGoSt=9+JwP7Q@mail.gmail.com/ [1]
> Link: https://lore.kernel.org/all/CAGsJ_4yJhJBo16XhiC-nUzSheyX-V3-nFE+tAi=8Y560K8eT=A@mail.gmail.com/ [2]
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Reviewed-by: Lokesh Gidra <lokeshgidra@google.com>
> 
> ---
> 
> V1: https://lore.kernel.org/linux-mm/20250530201710.81365-1-ryncsn@gmail.com/
> Changes:
> - Check swap_map instead of doing a filemap lookup after acquiring the
>   PTE lock to minimize critical section overhead [ Barry Song, Lokesh Gidra ]
> 
> V2: https://lore.kernel.org/linux-mm/20250601200108.23186-1-ryncsn@gmail.com/
> Changes:
> - Move the folio and swap check inside move_swap_pte to avoid skipping
>   the check and potential overhead [ Lokesh Gidra ]
> - Add a READ_ONCE for the swap_map read to ensure it reads a up to dated
>   value.
> 
> V3: https://lore.kernel.org/all/20250602181419.20478-1-ryncsn@gmail.com/
> Changes:
> - Add more comments and more context in commit message.
> 
>  mm/userfaultfd.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index bc473ad21202..8253978ee0fb 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -1084,8 +1084,18 @@ static int move_swap_pte(struct mm_struct *mm, struct vm_area_struct *dst_vma,
>  			 pte_t orig_dst_pte, pte_t orig_src_pte,
>  			 pmd_t *dst_pmd, pmd_t dst_pmdval,
>  			 spinlock_t *dst_ptl, spinlock_t *src_ptl,
> -			 struct folio *src_folio)
> +			 struct folio *src_folio,
> +			 struct swap_info_struct *si, swp_entry_t entry)
>  {
> +	/*
> +	 * Check if the folio still belongs to the target swap entry after
> +	 * acquiring the lock. Folio can be freed in the swap cache while
> +	 * not locked.
> +	 */
> +	if (src_folio && unlikely(!folio_test_swapcache(src_folio) ||
> +				  entry.val != src_folio->swap.val))
> +		return -EAGAIN;
> +
>  	double_pt_lock(dst_ptl, src_ptl);
>  
>  	if (!is_pte_pages_stable(dst_pte, src_pte, orig_dst_pte, orig_src_pte,
> @@ -1102,6 +1112,25 @@ static int move_swap_pte(struct mm_struct *mm, struct vm_area_struct *dst_vma,
>  	if (src_folio) {
>  		folio_move_anon_rmap(src_folio, dst_vma);
>  		src_folio->index = linear_page_index(dst_vma, dst_addr);
> +	} else {
> +		/*
> +		 * Check if the swap entry is cached after acquiring the src_pte
> +		 * lock. Otherwise, we might miss a newly loaded swap cache folio.
> +		 *
> +		 * Check swap_map directly to minimize overhead, READ_ONCE is sufficient.
> +		 * We are trying to catch newly added swap cache, the only possible case is
> +		 * when a folio is swapped in and out again staying in swap cache, using the
> +		 * same entry before the PTE check above. The PTL is acquired and released
> +		 * twice, each time after updating the swap_map's flag. So holding
> +		 * the PTL here ensures we see the updated value. False positive is possible,
> +		 * e.g. SWP_SYNCHRONOUS_IO swapin may set the flag without touching the
> +		 * cache, or during the tiny synchronization window between swap cache and
> +		 * swap_map, but it will be gone very quickly, worst result is retry jitters.
> +		 */

The comment above may not be the best I can think of, but I think I'm
already too harsh. :)  That's good enough to me.  It's also great to
mention the 2nd race too as Barry suggested in the commit log.

Thank you!

Acked-by: Peter Xu <peterx@redhat.com>

> +		if (READ_ONCE(si->swap_map[swp_offset(entry)]) & SWAP_HAS_CACHE) {
> +			double_pt_unlock(dst_ptl, src_ptl);
> +			return -EAGAIN;
> +		}
>  	}
>  
>  	orig_src_pte = ptep_get_and_clear(mm, src_addr, src_pte);
> @@ -1412,7 +1441,7 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
>  		}
>  		err = move_swap_pte(mm, dst_vma, dst_addr, src_addr, dst_pte, src_pte,
>  				orig_dst_pte, orig_src_pte, dst_pmd, dst_pmdval,
> -				dst_ptl, src_ptl, src_folio);
> +				dst_ptl, src_ptl, src_folio, si, entry);
>  	}
>  
>  out:
> -- 
> 2.49.0
> 

-- 
Peter Xu

