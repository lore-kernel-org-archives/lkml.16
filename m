Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217B22882C5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650934; cv=none; b=Mla8wCJgwL1sOu8hKpgZijLibp9EJ6TgLUa8i9ELZFeEH4T4t8gEe0MNMVyLrTp5oo/h//w7gXMA2gJXAI+pGISCHhB+/u0I7uxOPF6iWcLADpi/x13ZcaMyyZoTQfzzUyirOQhefXByzkhOxKO6lhLZY4VvassxhprDCl+zhl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650934; c=relaxed/simple;
	bh=fbXIQiswJaWMkMTaW2dr8b6K5p2U8TCNYwy2FdEVnIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9K1eeJhHqm2FmJB8wgcE0Jc1F7munQ7PKZ6/kJBTenv9eC1zpaS+ARkOWIiW7ZKdnMU36dAqQEeVy35hzcvWdkEDYlxrt6ltEh0nHnjky4MevQc/IvgnmpU2FjvIb/fK/aLy6qN6ZPQ3Dfk0eN5/D7Q+2zNK9HfW8ZqEETZYo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bdG/6GPF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bdG/6GPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749650927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O00w9NUXwe28lczeStTFDb6tJyisiybPqnPnGe9q4+Q=;
	b=bdG/6GPFrv5hHwyoxoTYiMrA/dtC8FdgMZuuDjWR1NDtWNjGeMwi6dD55pSvgDrMWMxs29
	nGJ8XphNzNYjH8OHEF+Db7nVX0FHWEmpVD26PFIPRlvnda5PPYatoUzvg+Cgmf1Uel1vES
	9SjotAa72fOLHIOIIkWPDF04y3xMzJ4=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-jhMjis09PBaK14kqktIV9Q-1; Wed, 11 Jun 2025 10:08:28 -0400
X-MC-Unique: jhMjis09PBaK14kqktIV9Q-1
X-Mimecast-MFC-AGG-ID: jhMjis09PBaK14kqktIV9Q_1749650908
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-869e9667f58so1175706139f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650908; x=1750255708;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O00w9NUXwe28lczeStTFDb6tJyisiybPqnPnGe9q4+Q=;
        b=UQ2awHp2h72ROxWoNsNkYMG/EzUEJYu7Qvc7JO9LUwA9o64tHj+9RJj2RCVH28m6AI
         uSLkKcNXoeI4woDsnvjpsV9TRS4UXbWuz5tf86DOlZZPIKzsxGYI39v/Zy+GfsVJzNQo
         KYP8Hr0ySjO5yM02W3Ff253B2zVIIGCM2qRLDlPygnsqaH7RN/fMnTL6WbS7Dl2B7+NS
         HI4AjsOoMeS3PJiWQp4PRMTZsBKpF+RsnQRDvkcSP+SeuPeXS+pD9j7q6P+O5COBwbV6
         Wyf8HNa4VHQEHrNL3JHGf6eV/szKQ16HOFjMJpqugAoyVnnO1plWSta+z82dYkFyoHw/
         54Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUWz6ymQabZOiwSXpJ1/rX//EjnoAZnbq6hSDyuStzKBZOHykoMP+vBACK7dRa5zniDBIHhjyhWJrSwbPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq7XcplkNaA5zve4JH8YGIZ9Io96L9LKrUhe+25O5AtAPlW8ZQ
	H9ndRXhI1923Uub6e4dPlVxiTwOz9WTLD0Lu4+IYAtdIn3Fu0WYAsN/lZZ9cmrlnhq9F2hIZyeS
	KYgjrWvxL9ohL/XyMcCjJ1dQPXlgMfRjEh1n/Yx6RLr+NiCHbtqJVU9POkGlBzSTf7g5h9dEyip
	7x
X-Gm-Gg: ASbGncuSfG+eW1rKsIWiFC3x+8LxnRrOXXdwlcOuE+LoxfS4PoV/bMRH0rQpIh2LSD8
	QjRcVr1+Z/0sALat35edDJX4EcbRqERrx6O6J2A4Ue5bH8MwVJo2b6lrPtzaoMqfOfsMJhNduGu
	sYVg3NjX8r/n+dRU3mOEvWgLUUt/db31gUB74PiUxQWReU/vcnxxKk0RAJbflOrd+1RqlHaPcn/
	CkyNVt6l8h927g9F8kxNXkrjcPNvxjDl2uXSN7e+I1pkgCFMYTNesMZXU4P65hFrEgL94ndv6EI
	wJVgClXbK2UXT5+tyCKQ5X9TZGCgFuw1m1I9oHybYW83
X-Received: by 2002:a17:90b:5289:b0:313:14b5:2525 with SMTP id 98e67ed59e1d1-313af28fb8cmr5533010a91.35.1749650458209;
        Wed, 11 Jun 2025 07:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjD5dEBHqYP+J40L6QO31gcp2UGI2QFVAzDC/8AtkH2FxqpBtJysXFpPQA+E4bADJ4VxXZmw==
X-Received: by 2002:a05:6102:4191:b0:4e5:996d:f23c with SMTP id ada2fe7eead31-4e7bafaa30amr2764481137.20.1749650445776;
        Wed, 11 Jun 2025 07:00:45 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ab8a19sm81555616d6.8.2025.06.11.07.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 07:00:45 -0700 (PDT)
Message-ID: <43d9cb6e-1b8f-47b9-8c19-58fc7c74a71e@redhat.com>
Date: Wed, 11 Jun 2025 16:00:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] mm: Optimize mremap() by PTE batching
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, ryan.roberts@arm.com,
 mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
 zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, hughd@google.com
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-3-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250610035043.75448-3-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.06.25 05:50, Dev Jain wrote:
> Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> are painted with the contig bit, then ptep_get() will iterate through all 16
> entries to collect a/d bits. Hence this optimization will result in a 16x
> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
> will eventually call contpte_try_unfold() on every contig block, thus
> flushing the TLB for the complete large folio range. Instead, use
> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
> do them on the starting and ending contig block.
> 
> For split folios, there will be no pte batching; nr_ptes will be 1. For
> pagetable splitting, the ptes will still point to the same large folio;
> for arm64, this results in the optimization described above, and for other
> arches (including the general case), a minor improvement is expected due to
> a reduction in the number of function calls.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   mm/mremap.c | 39 ++++++++++++++++++++++++++++++++-------
>   1 file changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 180b12225368..18b215521ada 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>   	return pte;
>   }
>   
> +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
> +		pte_t *ptep, pte_t pte, int max_nr)
> +{
> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +	struct folio *folio;
> +
> +	if (max_nr == 1)
> +		return 1;
> +
> +	folio = vm_normal_folio(vma, addr, pte);
> +	if (!folio || !folio_test_large(folio))
> +		return 1;
> +
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
> +			       NULL, NULL);
> +}
> +
>   static int move_ptes(struct pagetable_move_control *pmc,
>   		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>   {
> @@ -177,7 +194,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>   	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>   	struct mm_struct *mm = vma->vm_mm;
>   	pte_t *old_ptep, *new_ptep;
> -	pte_t pte;
> +	pte_t old_pte, pte;
>   	pmd_t dummy_pmdval;
>   	spinlock_t *old_ptl, *new_ptl;
>   	bool force_flush = false;
> @@ -185,6 +202,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>   	unsigned long new_addr = pmc->new_addr;
>   	unsigned long old_end = old_addr + extent;
>   	unsigned long len = old_end - old_addr;
> +	int max_nr_ptes;
> +	int nr_ptes;
>   	int err = 0;
>   
>   	/*
> @@ -236,14 +255,16 @@ static int move_ptes(struct pagetable_move_control *pmc,
>   	flush_tlb_batched_pending(vma->vm_mm);
>   	arch_enter_lazy_mmu_mode();
>   
> -	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> -				   new_ptep++, new_addr += PAGE_SIZE) {
> +	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
> +		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
>   		VM_WARN_ON_ONCE(!pte_none(*new_ptep));
>   
> -		if (pte_none(ptep_get(old_ptep)))
> +		nr_ptes = 1;
> +		max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
> +		old_pte = ptep_get(old_ptep);
> +		if (pte_none(old_pte))
>   			continue;
>   
> -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>   		/*
>   		 * If we are remapping a valid PTE, make sure
>   		 * to flush TLB before we drop the PTL for the
> @@ -255,8 +276,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>   		 * the TLB entry for the old mapping has been
>   		 * flushed.
>   		 */
> -		if (pte_present(pte))
> +		if (pte_present(old_pte)) {
> +			nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
> +							 old_pte, max_nr_ptes);
>   			force_flush = true;
> +		}
> +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
>   		pte = move_pte(pte, old_addr, new_addr);
>   		pte = move_soft_dirty_pte(pte);
>   
> @@ -269,7 +294,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>   				else if (is_swap_pte(pte))
>   					pte = pte_swp_clear_uffd_wp(pte);
>   			}
> -			set_pte_at(mm, new_addr, new_ptep, pte);
> +			set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);


What I dislike is that some paths work on a single PTE, and we implicitly have to know
that they don't apply for !pte_present.

Like
	if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))

Will not get batched yet. And that is hidden inside the pte_marker_uffd_wp check ...

Should we properly separate both paths (present vs. !present), and while at it, do
some more cleanups? I'm thinking of the following on top (only compile-tested)


diff --git a/mm/mremap.c b/mm/mremap.c
index 18b215521adae..b88abf02b34e0 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -155,21 +155,6 @@ static void drop_rmap_locks(struct vm_area_struct *vma)
                 i_mmap_unlock_write(vma->vm_file->f_mapping);
  }
  
-static pte_t move_soft_dirty_pte(pte_t pte)
-{
-       /*
-        * Set soft dirty bit so we can notice
-        * in userspace the ptes were moved.
-        */
-#ifdef CONFIG_MEM_SOFT_DIRTY
-       if (pte_present(pte))
-               pte = pte_mksoft_dirty(pte);
-       else if (is_swap_pte(pte))
-               pte = pte_swp_mksoft_dirty(pte);
-#endif
-       return pte;
-}
-
  static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
                 pte_t *ptep, pte_t pte, int max_nr)
  {
@@ -260,7 +245,6 @@ static int move_ptes(struct pagetable_move_control *pmc,
                 VM_WARN_ON_ONCE(!pte_none(*new_ptep));
  
                 nr_ptes = 1;
-               max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
                 old_pte = ptep_get(old_ptep);
                 if (pte_none(old_pte))
                         continue;
@@ -277,24 +261,34 @@ static int move_ptes(struct pagetable_move_control *pmc,
                  * flushed.
                  */
                 if (pte_present(old_pte)) {
+                       max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
                         nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
                                                          old_pte, max_nr_ptes);
                         force_flush = true;
-               }
-               pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
-               pte = move_pte(pte, old_addr, new_addr);
-               pte = move_soft_dirty_pte(pte);
-
-               if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
-                       pte_clear(mm, new_addr, new_ptep);
-               else {
-                       if (need_clear_uffd_wp) {
-                               if (pte_present(pte))
-                                       pte = pte_clear_uffd_wp(pte);
-                               else if (is_swap_pte(pte))
+
+                       pte = get_and_clear_full_ptes(mm, old_addr, old_ptep,
+                                                     nr_ptes, 0);
+                       /*
+                        * Moving present PTEs requires special care on some
+                        * archs.
+                        */
+                       pte = move_pte(pte, old_addr, new_addr);
+                       /* make userspace aware that this pte moved. */
+                       pte = pte_mksoft_dirty(pte);
+                       if (need_clear_uffd_wp)
+                               pte = pte_clear_uffd_wp(pte);
+                       set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
+               } else if (need_clear_uffd_wp && pte_marker_uffd_wp(pte)) {
+                       pte_clear(mm, old_addr, old_ptep);
+               } else {
+                       pte_clear(mm, old_addr, old_ptep);
+                       if (is_swap_pte(pte)) {
+                               if (need_clear_uffd_wp)
                                         pte = pte_swp_clear_uffd_wp(pte);
+                               /* make userspace aware that this pte moved. */
+                               pte = pte_swp_mksoft_dirty(pte);
                         }
-                       set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
+                       set_pte_at(mm, new_addr, new_ptep, pte);
                 }
         }
  


Note that I don't know why we had the existing

-               if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
-                       pte_clear(mm, new_addr, new_ptep);


I thought we would always expect that the destination pte is already pte_none() ?

-- 
Cheers,

David / dhildenb

