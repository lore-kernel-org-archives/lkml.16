Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A8A274B59
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375306; cv=none; b=PHrqkZdUrheb4wYNrdKAflSrM5VUJI7VOik+y6RXBa1ywOAqxUZh4kxJyiPDXhHLju02CToh3u97kjn5TvPdokOIYjKGlV8eugOmhC7MPBOju2SQN0u4CNpPeaywfOmlDKYDn1fszD+rDmdoc642e9VWqRMn7L274XzIqx1shWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375306; c=relaxed/simple;
	bh=Aamnsn29zpHoXMa67/2pQ9ZN3DmtuVYS3RLZQZH8OAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0mLPObWAVxv6H6P/sJ8MKZq94E6tU0qZHMVle+dEeimyh0ukdPoX1IOBF7aaDL81SccpEHYi6XIhZ4V0Ip494RROt94Zn/bcF8eiXUhEu1zSkfgKryaF+spNAuvC++5sGr5Bt5YWg0GcCJs4+dCw1zPQKyh5FRZuJT7AyX/zCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gCa4pAIt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gCa4pAIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751375303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Qtr2oWngmrKIpZ1oZl4Jp/NvxG5BHYAOmKf1rL8B43o=;
	b=gCa4pAItJ2Da5o7MgOaiaeihB5x2dOvH2QaCBwJcYruYfPf5/M69b5jM1pV4qdmvI6H23o
	RegiLXR6fj4ZInmOx17v/KK5yynEFQQJxvz/KzbMlapBTwJY4gQgcr6lLfxnAOORY+Qy1G
	VkR9JCFEBpjW+5DBYTeR7F5M0XIe9io=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-Y0Stw0HSP8q2aJ261TM6OA-1; Tue, 01 Jul 2025 09:08:17 -0400
X-MC-Unique: Y0Stw0HSP8q2aJ261TM6OA-1
X-Mimecast-MFC-AGG-ID: Y0Stw0HSP8q2aJ261TM6OA_1751375296
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so25429265e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 06:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751375296; x=1751980096;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qtr2oWngmrKIpZ1oZl4Jp/NvxG5BHYAOmKf1rL8B43o=;
        b=RZpmqrHvza/nLEfA/UGJWlU4qi4EE1FFuu71Wva7Yoay/aOzCSA5qU3nXeqjcks9ZS
         muRerRkufeG7vY0SHZZKwqO9YHZiPTSMZ7JtGlppaVPhvHSuZhWJAozrvPhDY7g925Zq
         xU3KkqqCNeyMT6W+02dr9fX5FHXmFvkeN5Y1NHKrZ7wCXlztffiXZSAGJRgGefKkODeT
         m25VtZv1fWkz8IflSbD9WeiCYEegLTlZgV5z8nHcwYXSMThTiNGUviZi7j0vjaVVvFCj
         WlN06EJTbujG/p2NsnXeqO3dGQjsC3QiFRkZX8Ajka90g2C7FpH94KigoTjtzdbuRvCo
         zcBg==
X-Forwarded-Encrypted: i=1; AJvYcCU289bF5yYxmrqSz7R4AyxQ+q+yiFRX+kBH4QtY/0nbEuwWfgUqNwT6W31C8wYcmLtjvNHwe7xJDn1bmME=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB6PplpJa5UhSdknvYOFouy7zW8CIYO0KVtQVuTdUD1WMbt+u/
	1x3CJPAFxvAT4du7amYtD9/RatnYh28ZNwng3Bg90a0DWia1ycnemfFLLy+QgIF2iBxJth4d51f
	rM3qO6EwfO/YjB7dhbUxUYokkxVtQFHx3UpdQ+L/8oVodQC1EQxaddj2D0iZaHMLoeA==
X-Gm-Gg: ASbGnctC764CCIr/t/QS3SeIQxCS2pVdgBv3QPbd39yDG2pRpCMzyRoAB3HvBWgfdbl
	qdpKA0qMUM8IjGELFxyDhbAMwhePagkYtsTvv7jSEWQ3THS1x/7j+CVuWxlqQ+7dLSQUtNduNQU
	bKrSf/3cIAIUnzI62Nzt4Vf3I/1gK4GVtfOwG5NHOrpKbo3jJQXVF1/aSVC2uu9lA7Qb18jjLOX
	zwMcWxIQ37w2eGFOJPKpETUSndH63KeduWcWLMKEmCSLQIKPAiWEbsjYg3sAXvwf6tZ6yAW64SF
	8yHsscwbO8MX3ISEV9J2uIFL5+y55S5WcquH0UpuZqHmSU6xF41FWzWzG/xonuAALA4YWYO/C0A
	Y/vgUWhJyIZOuKmXjmzqIwLsfDK4GakwAsjcA/ptn04fN8efDlQ==
X-Received: by 2002:a05:600c:4ec6:b0:453:84a:8cf1 with SMTP id 5b1f17b1804b1-4538eeb52c6mr151654765e9.33.1751375295709;
        Tue, 01 Jul 2025 06:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGEU96WWGLC9Mi4aEpW/chhh9eOgQOKvq5527882yY0ssLJdb9rtP+Bo/Op6OsdjHVDmtOSw==
X-Received: by 2002:a05:600c:4ec6:b0:453:84a:8cf1 with SMTP id 5b1f17b1804b1-4538eeb52c6mr151653715e9.33.1751375294660;
        Tue, 01 Jul 2025 06:08:14 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f923sm12917949f8f.89.2025.07.01.06.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 06:08:14 -0700 (PDT)
Message-ID: <b8258f91-ad92-419e-a0a1-a8db706c814c@redhat.com>
Date: Tue, 1 Jul 2025 15:08:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: support large mapping building for tmpfs
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <d4cb6e578bca8c430174d5972550cbeb530ec3fe.1751359073.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d4cb6e578bca8c430174d5972550cbeb530ec3fe.1751359073.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.07.25 10:40, Baolin Wang wrote:

Nit: talking about "large mappings" is confusing. Did you actually mean:

"mm: fault in complete folios instead of individual pages for tmpfs"

I suggest not talking about "large mappings" anywhere in this patch 
description, and instead talking about mapping multiple consecutive 
pages of a tmpfs folios at once instead.

> After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs"),
> tmpfs can also support large folio allocation (not just PMD-sized large
> folios).
> 
> However, when accessing tmpfs via mmap(), although tmpfs supports large folios,
> we still establish mappings at the base page granularity, which is unreasonable.
 > > We can establish large mappings according to the size of the large 
folio. On one
> hand, this can reduce the overhead of page faults; on the other hand, it can
> leverage hardware architecture optimizations to reduce TLB misses, such as
> contiguous PTEs on the ARM architecture.

The latter would still apply if faulting in each individual page I 
guess. cont-pte will try to auto-optimize IIRC.

> 
> Moreover, since the user has already added the 'huge=' option when mounting tmpfs
> to allow for large folio allocation, establishing large folios' mapping is expected
> and will not surprise users by inflating the RSS of the process.

Hm, are we sure about that? Also, how does fault_around_bytes interact here?

> 
> In order to support large mappings for tmpfs, besides checking VMA limits and
> PMD pagetable limits, it is also necessary to check if the linear page offset
> of the VMA is order-aligned within the file.

Why?

This only applies to PMD mappings. See below.

> 
> Performance test:
> I created a 1G tmpfs file, populated with 64K large folios, and accessed it
> sequentially via mmap(). I observed a significant performance improvement:
> 
> Before the patch:
> real	0m0.214s
> user	0m0.012s
> sys	0m0.203s
> 
> After the patch:
> real	0m0.025s
> user	0m0.000s
> sys	0m0.024s
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   mm/memory.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 0f9b32a20e5b..6385a9385a9b 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5383,10 +5383,10 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>   
>   	/*
>   	 * Using per-page fault to maintain the uffd semantics, and same
> -	 * approach also applies to non-anonymous-shmem faults to avoid
> +	 * approach also applies to non shmem/tmpfs faults to avoid
>   	 * inflating the RSS of the process.
>   	 */
> -	if (!vma_is_anon_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
> +	if (!vma_is_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
>   	    unlikely(needs_fallback)) {
>   		nr_pages = 1;
>   	} else if (nr_pages > 1) {
> @@ -5395,15 +5395,20 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>   		pgoff_t vma_off = vmf->pgoff - vmf->vma->vm_pgoff;
>   		/* The index of the entry in the pagetable for fault page. */
>   		pgoff_t pte_off = pte_index(vmf->address);
> +		unsigned long hpage_size = PAGE_SIZE << folio_order(folio);
>   
>   		/*
>   		 * Fallback to per-page fault in case the folio size in page
> -		 * cache beyond the VMA limits and PMD pagetable limits.
> +		 * cache beyond the VMA limits or PMD pagetable limits. And
> +		 * also check if the linear page offset of vma is order-aligned
> +		 * within the file for tmpfs.
>   		 */
>   		if (unlikely(vma_off < idx ||
>   			    vma_off + (nr_pages - idx) > vma_pages(vma) ||
>   			    pte_off < idx ||
> -			    pte_off + (nr_pages - idx)  > PTRS_PER_PTE)) {
> +			    pte_off + (nr_pages - idx)  > PTRS_PER_PTE) ||
> +			    !IS_ALIGNED((vma->vm_start >> PAGE_SHIFT) - vma->vm_pgoff,
> +					hpage_size >> PAGE_SHIFT)) {

Again, why? Shouldn't set_pte_range() just do the right thing? 
set_ptes() doesn't have any such restriction.

Also see the arm64 variant where we call

	contpte_set_ptes(mm, addr, ptep, pte, nr);

There, I think we perform checks whether whether we can set the cont-pte 
bit IIUC.

	if (((addr | next | (pfn << PAGE_SHIFT)) & ~CONT_PTE_MASK) == 0)
		pte = pte_mkcont(pte);
	else
		pte = pte_mknoncont(pte);

-- 
Cheers,

David / dhildenb

