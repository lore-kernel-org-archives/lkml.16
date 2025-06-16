Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7239A86340
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750107595; cv=none; b=sqvFbDNTter3wUMmh4LCezGbvFoAEVRUmFIFxyL9+qMQgkVQyHq2VZqBjztxbm1TYjsjJgNyhTc3p7eMAOC31JAb/b+0j2NtHXo5ASPBYYs63AHSBJLkH3QhIUOBODrGl43R323FnOJRnQHar7o7TAebFgkuiFyo+iHiewVRPYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750107595; c=relaxed/simple;
	bh=5EwghKRfgKIdEKQNr+fmN3vlQn57B/oxzCbdXw13fx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UocR6p39gJniZWRxjiFEsuN9LbXLlrMTZeIFIx2lpDc2L6Op97xFZM0H7Yf4iHvXSESKzP5lR9SIhoG62EtAZEYX2wQYFVJEV0haIRhcKeKiWKKk/vLVGg67Ez7SF69zVItMAILSflT52F2D1Fa6hvywOaK2K4dr3JzfWJIkoYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CK8ekvvk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CK8ekvvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750107592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1FNJDziwKxoSpugK+gdAGuEhiR++PzKnzLIcved+z/c=;
	b=CK8ekvvkhtskOCvJ9WF3awyn0q0N3uCJE56MLzCSP9zcc9xW5dl6Er6OvttzAyFVDIn9+D
	nxPmyljPWQtVyVIrF5iqdllnZPnJyd7UrFvyVZ3vd9MiQ1Oc1s0Cxh1rhbgBgETnWDyYs/
	/ijIuEEJXPpHLNMGl+nMPhVNuURQLB4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-OOtck-_DP06LiUNR3Nmg2w-1; Mon, 16 Jun 2025 16:58:32 -0400
X-MC-Unique: OOtck-_DP06LiUNR3Nmg2w-1
X-Mimecast-MFC-AGG-ID: OOtck-_DP06LiUNR3Nmg2w_1750107511
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso25590525e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750107511; x=1750712311;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1FNJDziwKxoSpugK+gdAGuEhiR++PzKnzLIcved+z/c=;
        b=Z2SwpphlKuRY6keeRgRTMUUm9siWOHfzssA7IiJHH+ymXl9uTGfse7jkm6XF0xjUk4
         I+A0qLqxrr1ofO+5RCrt5RqE9YeJiFnF+rY0ysLADsjBUp5CHniojr7g5uueJqW9dIDI
         M/jOvhgf67cBzRVZ91wYFARz0Z4QdWNv7gG9hnntUMjHpN6FM0qul0vceoM8JAnal7+6
         kol2QZQe6qUpgtq8NhRUIoK8Zo9/Fc7SCDtd5CP4L0jLnNL5YCHwTF2Tuj/kxQqPL0YM
         QjtXsX96OnGp3m3YW+k97eZuSEL/0KT0ki6orBN0ILZ5aNkWAofgj4lkRs1aIsYgYV3h
         IB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcyAF1MXHwcRGcKW8fipZWcAYQS2Uenm0cRcnH2xcrLGXOXWdZ8z/gMTJt8mM70mhKXHEx6eHi9Ox4Skg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy90DPb//3x1ALK67lAwp2f8XQRx+Bk7fzAyIBBN4YZ/75Hp/4Y
	ZD+9OCGRli1z0KpoCghVZJVbvrk7SZVEeTJVr93PVqtrC4w3/5N4e7iUKW6VjRs3T2HDHdV1VZW
	tTjGDbildjLf3HKDRuwuydHAhzUdl4wSsdn3KgEskp29P+X4yzeeXFj6etIXmWM74Sg==
X-Gm-Gg: ASbGnctD6rKSbqSrdijNXdsXOCQUQQEtS9yWl8+wNynru1JyGXY0bel0OFyzpBOXlpA
	EUyE2LFm85gxTuJWNlq8c4o2ChWbUeaEGKNfoc7Ec7T8tSohRlbbSXeAxYRshTj2XfM7Gq6cSMB
	OYVbwjWz/guDSgjVkt5CmfDBY3NQ7uSVfijmpo04JwF8t6ADK5DcScHZy/iZDbgXTH1PquWOVn9
	30PPIpdZkigHRpcgVVKVb0sSUOmG7Hh4mJusOPYIOuFwIJyP6ndcdqYhHIu2b1aovg5AnHJ/PyR
	wCM8MtvuUPLe5VYZx0s/wp0pwYMARZCMfCOFWaOC2zqpzaXrKdqPGB77rXx3I9Yl7fa98nZS5tZ
	xclMkRbFK1O21li5c4NtaWqvbuqcCrtyzwobTSyWf9+Nw7HN+QA==
X-Received: by 2002:a05:600c:1d0c:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-4533cab544emr86359225e9.22.1750107510774;
        Mon, 16 Jun 2025 13:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5R5FYswgmwqhNvrAuOBPaB0nRslGDtIRvhkrg1b+OZGkfAx1Olg2NW3xSXWBdBM9ubhXbZA==
X-Received: by 2002:a05:600c:1d0c:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-4533cab544emr86359155e9.22.1750107510244;
        Mon, 16 Jun 2025 13:58:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5? (p200300d82f3ae300c6604ff55bfbf5c5.dip0.t-ipconnect.de. [2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224cb2sm162173875e9.5.2025.06.16.13.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 13:58:29 -0700 (PDT)
Message-ID: <f24dd244-f188-4804-981c-8b7560e5a26b@redhat.com>
Date: Mon, 16 Jun 2025 22:58:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox
 <willy@infradead.org>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
 Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.06.25 15:26, Lorenzo Stoakes wrote:
> When mremap() moves a mapping around in memory, it goes to great lengths to
> avoid having to walk page tables as this is expensive and
> time-consuming.
> 
> Rather, if the VMA was faulted (that is vma->anon_vma != NULL), the virtual
> page offset stored in the VMA at vma->vm_pgoff will remain the same, as
> well all the folio indexes pointed at the associated anon_vma object.
> 
> This means the VMA and page tables can simply be moved and this affects the
> change (and if we can move page tables at a higher page table level, this
> is even faster).
> 
> While this is efficient, it does lead to big problems with VMA merging - in
> essence it causes faulted anonymous VMAs to not be mergeable under many
> circumstances once moved.
> 
> This is limiting and leads to both a proliferation of unreclaimable,
> unmovable kernel metadata (VMAs, anon_vma's, anon_vma_chain's) and has an
> impact on further use of mremap(), which has a requirement that the VMA
> moved (which can also be a partial range within a VMA) may span only a
> single VMA.
> 
> This makes the mergeability or not of VMAs in effect a uAPI concern.
> 
> In some use cases, users may wish to accept the overhead of actually going
> to the trouble of updating VMAs and folios to affect mremap() moves. Let's
> provide them with the choice.
> 
> This patch add a new MREMAP_RELOCATE_ANON flag to do just that, which
> attempts to perform such an operation. If it is unable to do so, it cleanly
> falls back to the usual method.
> 
> It carefully takes the rmap locks such that at no time will a racing rmap
> user encounter incorrect or missing VMAs.
> 
> It is also designed to interact cleanly with the existing mremap() error
> fallback mechanism (inverting the remap should the page table move fail).
> 
> Also, if we could merge cleanly without such a change, we do so, avoiding
> the overhead of the operation if it is not required.
> 
> In the instance that no merge may occur when the move is performed, we
> still perform the folio and VMA updates to ensure that future mremap() or
> mprotect() calls will result in merges.
> 
> In this implementation, we simply give up if we encounter large folios. A
> subsequent commit will extend the functionality to allow for these cases.
> 
> We restrict this flag to purely anonymous memory only.
> 
> we separate out the vma_had_uncowed_parents() helper function for checking
> in should_relocate_anon() and introduce a new function
> vma_maybe_has_shared_anon_folios() which combines a check against this and
> any forked child anon_vma's.
> 
> We carefully check for pinned folios in case a caller who holds a pin might
> make assumptions about index, mapping fields which we are about to
> manipulate.

Som quick feedback, I did not yet digest everything.

[...]

> +/*
> + * If the folio mapped at the specified pte entry can have its index and mapping
> + * relocated, then do so.
> + *
> + * Returns the number of pages we have traversed, or 0 if the operation failed.
> + */
> +static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
> +		struct pte_state *state, bool undo)
> +{
> +	struct folio *folio;
> +	struct vm_area_struct *old, *new;
> +	pgoff_t new_index;
> +	pte_t pte;
> +	unsigned long ret = 1;
> +	unsigned long old_addr = state->old_addr;
> +	unsigned long new_addr = state->new_addr;
> +
> +	old = pmc->old;
> +	new = pmc->new;
> +
> +	pte = ptep_get(state->ptep);
> +
> +	/* Ensure we have truly got an anon folio. */
> +	folio = vm_normal_folio(old, old_addr, pte);
> +	if (!folio)
> +		return ret;
> +
> +	folio_lock(folio);
> +
> +	/* No-op. */
> +	if (!folio_test_anon(folio) || folio_test_ksm(folio))
> +		goto out;
> +

So these cases are all "pass".

 > +	/*> +	 * This should never be the case as we have already checked 
to ensure
> +	 * that the anon_vma is not forked, and we have just asserted that it is
> +	 * anonymous.
> +	 */
> +	if (WARN_ON_ONCE(folio_maybe_mapped_shared(folio)))
> +		goto out;

Good a warning, so we should be able to handle that early.

> +	/* The above check should imply these. */
> +	VM_WARN_ON_ONCE(folio_mapcount(folio) > folio_nr_pages(folio));
 > +	VM_WARN_ON_ONCE(!PageAnonExclusive(folio_page(folio, 0)));

This can trigger in one nasty case, where we can lose the PAE bit during 
swapin (refault from the swapcache while the folio is under writeback, 
and the device does not allow for modifying the data while under writeback).

> +
> +	/*
> +	 * A pinned folio implies that it will be used for a duration longer
> +	 * than that over which the mmap_lock is held, meaning that another part
> +	 * of the kernel may be making use of this folio.
> +	 *
> +	 * Since we are about to manipulate index & mapping fields, we cannot
> +	 * safely proceed because whatever has pinned this folio may then
> +	 * incorrectly assume these do not change.
> +	 */
> +	if (folio_maybe_dma_pinned(folio))
> +		goto out;

As discussed, this can race with GUP-fast. SO *maybe* we can just allow 
for moving these.

(after all we still have ordinary GUP that would also not be covered by 
this check)

> +
> +	/*
> +	 * This should not happen as we explicitly disallow this, but check
> +	 * anyway.
> +	 */
> +	if (folio_test_large(folio)) {
> +		ret = 0;
> +		goto out;
> +	}

That is the only real problem for rollback so far I assume.

> +
> +	if (!undo)
> +		new_index = linear_page_index(new, new_addr);
> +	else
> +		new_index = linear_page_index(old, old_addr);
> +
> +	/*
> +	 * The PTL should keep us safe from unmapping, and the fact the folio is
> +	 * a PTE keeps the folio referenced.
> +	 *
> +	 * The mmap/VMA locks should keep us safe from fork and other processes.
> +	 *
> +	 * The rmap locks should keep us safe from anything happening to the
> +	 * VMA/anon_vma.
> +	 *
> +	 * The folio lock should keep us safe from reclaim, migration, etc.
> +	 */
> +	folio_move_anon_rmap(folio, undo ? old : new);
> +	WRITE_ONCE(folio->index, new_index);
> +
> +out:
> +	folio_unlock(folio);
> +	return ret;
> +}
> +
> +static bool pte_done(struct pte_state *state)
> +{
> +	return state->old_addr >= state->old_end;
> +}
> +
> +static void pte_next(struct pte_state *state, unsigned long nr_pages)
> +{
> +	state->old_addr += nr_pages * PAGE_SIZE;
> +	state->new_addr += nr_pages * PAGE_SIZE;
> +	state->ptep += nr_pages;
> +}
> +
> +static bool relocate_anon_ptes(struct pagetable_move_control *pmc,
> +		unsigned long extent, pmd_t *pmdp, bool undo)
> +{
> +	struct mm_struct *mm = current->mm;
> +	struct pte_state state = {
> +		.old_addr = pmc->old_addr,
> +		.new_addr = pmc->new_addr,
> +		.old_end = pmc->old_addr + extent,
> +	};
> +	pte_t *ptep_start;
> +	bool ret;
> +	unsigned long nr_pages;
> +
> +	ptep_start = pte_offset_map_lock(mm, pmdp, pmc->old_addr, &state.ptl);
> +	/*
> +	 * We prevent faults with mmap write lock, hold the rmap lock and should
> +	 * not fail to obtain this lock. Just give up if we can't.
> +	 */
> +	if (!ptep_start)
> +		return false;
> +
> +	state.ptep = ptep_start;
> +	for (; !pte_done(&state); pte_next(&state, nr_pages)) {
> +		pte_t pte = ptep_get(state.ptep);
> +
> +		if (pte_none(pte) || !pte_present(pte)) {
> +			nr_pages = 1;

What if we have

(a) A migration entry (possibly we might fail migration and simply remap 
the original folio)

(b) A swap entry with a folio in the swapcache that we can refault.

I don't think we can simply skip these ...

> +			continue;
> +		}
> +
> +		nr_pages = relocate_anon_pte(pmc, &state, undo);
> +		if (!nr_pages) {
> +			ret = false;
> +			goto out;
> +		}
> +	}
> +
> +	ret = true;
> +out:
> +	pte_unmap_unlock(ptep_start, state.ptl);
> +	return ret;
> +}
> +
> +static bool __relocate_anon_folios(struct pagetable_move_control *pmc, bool undo)
> +{
> +	pud_t *pudp;
> +	pmd_t *pmdp;
> +	unsigned long extent;
> +	struct mm_struct *mm = current->mm;
> +
> +	if (!pmc->len_in)
> +		return true;
> +
> +	for (; !pmc_done(pmc); pmc_next(pmc, extent)) {
> +		pmd_t pmd;
> +		pud_t pud;
> +
> +		extent = get_extent(NORMAL_PUD, pmc);
> +
> +		pudp = get_old_pud(mm, pmc->old_addr);
> +		if (!pudp)
> +			continue;
> +		pud = pudp_get(pudp);
> +
> +		if (pud_trans_huge(pud) || pud_devmap(pud))
> +			return false;

We don't support PUD-size THP, why to we have to fail here?

> +
> +		extent = get_extent(NORMAL_PMD, pmc);
> +		pmdp = get_old_pmd(mm, pmc->old_addr);
> +		if (!pmdp)
> +			continue;
> +		pmd = pmdp_get(pmdp);
> +
> +		if (is_swap_pmd(pmd) || pmd_trans_huge(pmd) ||
> +		    pmd_devmap(pmd))
> +			return false;

Okay, this case could likely be handled later (present anon folio or 
migration entry; everything else, we can skip).

> +
> +		if (pmd_none(pmd))
> +			continue;
> +
> +		if (!relocate_anon_ptes(pmc, extent, pmdp, undo))
> +			return false;
> +	}
 > +> +	return true;
> +}
> +
> +static bool relocate_anon_folios(struct pagetable_move_control *pmc, bool undo)
> +{
> +	unsigned long old_addr = pmc->old_addr;
> +	unsigned long new_addr = pmc->new_addr;
> +	bool ret;
> +
> +	ret = __relocate_anon_folios(pmc, undo);
> +
> +	/* Reset state ready for retry. */
> +	pmc->old_addr = old_addr;
> +	pmc->new_addr = new_addr;
> +
> +	return ret;
> +}
> +
>   unsigned long move_page_tables(struct pagetable_move_control *pmc)
>   {
>   	unsigned long extent;
> @@ -1134,6 +1380,67 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
>   	}
>   }
>   
> +/*
> + * Should we attempt to relocate anonymous folios to the location that the VMA
> + * is being moved to by updating index and mapping fields accordingly?
> + */
> +static bool should_relocate_anon(struct vma_remap_struct *vrm,
> +	struct pagetable_move_control *pmc)
> +{
> +	struct vm_area_struct *old = vrm->vma;
> +
> +	/* Currently we only do this if requested. */
> +	if (!(vrm->flags & MREMAP_RELOCATE_ANON))
> +		return false;
> +
> +	/* We can't deal with special or hugetlb mappings. */
> +	if (old->vm_flags & (VM_SPECIAL | VM_HUGETLB))
> +		return false;
> +
> +	/* We only support anonymous mappings. */
> +	if (!vma_is_anonymous(old))
> +		return false;

I suspect MAP_PRIVATE file mappings should be easy to extend?

[...]

>   	pmc.new = new_vma;
>   
> +	if (relocate_anon) {
> +		lock_new_anon_vma(new_vma);
> +		pmc.relocate_locked = new_vma;
> +
> +		if (!relocate_anon_folios(&pmc, /* undo= */false)) {
> +			unsigned long start = new_vma->vm_start;
> +			unsigned long size = new_vma->vm_end - start;
> +
> +			/* Undo if fails. */
> +			relocate_anon_folios(&pmc, /* undo= */true);

You'd assume this cannot fail, but I think it can: imagine concurrent 
GUP-fast ...

I really wish we can find a way to not require the fallback.

-- 
Cheers,

David / dhildenb

