Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040C628691
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751421835; cv=none; b=nSdv2Ry0mDQBIwmpHn6wzPq5/ihHD5dCK2nYRrBc1G2HB/XoqQR8Hmby363rol/drh4jxKxwmfaIjNQqd28elnhiUc+quUtVhWPG/7fc6GVQMptLn6jrVFF5uHF/C29r11K5pijPIccFuXupbTogy3kGkvu0qKvObFjRCNIvzNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751421835; c=relaxed/simple;
	bh=SPcgSdAi2LpH54nGhSxZ5hxP+hQWVfzqhzQ7D320Bww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceId/TCBnrzSE7MT0q7TTVKYl4zFoNVaLRulTZf0/fjItQGQguoo3x3NPdowE9MWNTdcH/0GUtBRpc/QzfAl53eC0BpkTtTCTp5dZW0aX7S+3KcNRL7D8gT3MA+Mo/Wi2QMjKfyTPzV1X504fEupB6tkpH1jToCuwh8reU31PfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VmKCl/qx; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VmKCl/qx"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751421825; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ohM2RwEzxFUcgPZlYGBjVFg4JIUX8hOb56pXV+uEi3Q=;
	b=VmKCl/qxo99i/iHEynR3G9G7BRkxDqKrdS2cYBIIHcbWewnYqPHWaW9YUYQxZir96sQV3tMwXycCTHlGxIPh17urmt7Gb3/UZOwUJh1WYDZB+35zJvx6eBRQnLjEjo3Xmp+s7O5gU+mU/sjPdK6sgxOA+DKK9+GJVGxl3guZVTM=
Received: from 30.74.144.115(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WgXI.W6_1751421822 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Jul 2025 10:03:43 +0800
Message-ID: <fca114c1-9699-4dd7-9bca-83a5f5ac615d@linux.alibaba.com>
Date: Wed, 2 Jul 2025 10:03:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: support large mapping building for tmpfs
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <d4cb6e578bca8c430174d5972550cbeb530ec3fe.1751359073.git.baolin.wang@linux.alibaba.com>
 <b8258f91-ad92-419e-a0a1-a8db706c814c@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <b8258f91-ad92-419e-a0a1-a8db706c814c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/7/1 21:08, David Hildenbrand wrote:
> On 01.07.25 10:40, Baolin Wang wrote:
> 
> Nit: talking about "large mappings" is confusing. Did you actually mean:
> 
> "mm: fault in complete folios instead of individual pages for tmpfs"
> 
> I suggest not talking about "large mappings" anywhere in this patch 
> description, and instead talking about mapping multiple consecutive 
> pages of a tmpfs folios at once instead.

OK.

>> After commit acd7ccb284b8 ("mm: shmem: add large folio support for 
>> tmpfs"),
>> tmpfs can also support large folio allocation (not just PMD-sized large
>> folios).
>>
>> However, when accessing tmpfs via mmap(), although tmpfs supports 
>> large folios,
>> we still establish mappings at the base page granularity, which is 
>> unreasonable.
>  > > We can establish large mappings according to the size of the large 
> folio. On one
>> hand, this can reduce the overhead of page faults; on the other hand, 
>> it can
>> leverage hardware architecture optimizations to reduce TLB misses, 
>> such as
>> contiguous PTEs on the ARM architecture.
> 
> The latter would still apply if faulting in each individual page I 
> guess. cont-pte will try to auto-optimize IIRC.

Yes, but need more CPU cycles.

>> Moreover, since the user has already added the 'huge=' option when 
>> mounting tmpfs
>> to allow for large folio allocation, establishing large folios' 
>> mapping is expected
>> and will not surprise users by inflating the RSS of the process.
> 
> Hm, are we sure about that? 

IMO, referring to the definition of RSS:
"resident set size (RSS) is the portion of memory (measured in 
kilobytes) occupied by a process that is held in main memory (RAM). "

Seems we should report the whole large folio already in file to users. 
Moreover, the tmpfs mount already adds the 'huge=always (or within)' 
option to allocate large folios, so the increase in RSS seems also expected?

Also, how does fault_around_bytes interact
> here?

The ‘fault_around’ is a bit tricky. Currently, 'fault_around' only 
applies to read faults (via do_read_fault()) and does not control write 
shared faults (via do_shared_fault()). Additionally, in the 
do_shared_fault() function, PMD-sized large folios are also not 
controlled by 'fault_around', so I just follow the handling of PMD-sized 
large folios.

>> In order to support large mappings for tmpfs, besides checking VMA 
>> limits and
>> PMD pagetable limits, it is also necessary to check if the linear page 
>> offset
>> of the VMA is order-aligned within the file.
> 
> Why?
> 
> This only applies to PMD mappings. See below.

I previously had the same question, but I saw the comments for 
‘thp_vma_suitable_order’ function, so I added the check here. If it's 
not necessary to check non-PMD-sized large folios, should we update the 
comments for 'thp_vma_suitable_order'?

>> Performance test:
>> I created a 1G tmpfs file, populated with 64K large folios, and 
>> accessed it
>> sequentially via mmap(). I observed a significant performance 
>> improvement:
>>
>> Before the patch:
>> real    0m0.214s
>> user    0m0.012s
>> sys    0m0.203s
>>
>> After the patch:
>> real    0m0.025s
>> user    0m0.000s
>> sys    0m0.024s
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   mm/memory.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 0f9b32a20e5b..6385a9385a9b 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -5383,10 +5383,10 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>>       /*
>>        * Using per-page fault to maintain the uffd semantics, and same
>> -     * approach also applies to non-anonymous-shmem faults to avoid
>> +     * approach also applies to non shmem/tmpfs faults to avoid
>>        * inflating the RSS of the process.
>>        */
>> -    if (!vma_is_anon_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
>> +    if (!vma_is_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
>>           unlikely(needs_fallback)) {
>>           nr_pages = 1;
>>       } else if (nr_pages > 1) {
>> @@ -5395,15 +5395,20 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>>           pgoff_t vma_off = vmf->pgoff - vmf->vma->vm_pgoff;
>>           /* The index of the entry in the pagetable for fault page. */
>>           pgoff_t pte_off = pte_index(vmf->address);
>> +        unsigned long hpage_size = PAGE_SIZE << folio_order(folio);
>>           /*
>>            * Fallback to per-page fault in case the folio size in page
>> -         * cache beyond the VMA limits and PMD pagetable limits.
>> +         * cache beyond the VMA limits or PMD pagetable limits. And
>> +         * also check if the linear page offset of vma is order-aligned
>> +         * within the file for tmpfs.
>>            */
>>           if (unlikely(vma_off < idx ||
>>                   vma_off + (nr_pages - idx) > vma_pages(vma) ||
>>                   pte_off < idx ||
>> -                pte_off + (nr_pages - idx)  > PTRS_PER_PTE)) {
>> +                pte_off + (nr_pages - idx)  > PTRS_PER_PTE) ||
>> +                !IS_ALIGNED((vma->vm_start >> PAGE_SHIFT) - vma- 
>> >vm_pgoff,
>> +                    hpage_size >> PAGE_SHIFT)) {
> 
> Again, why? Shouldn't set_pte_range() just do the right thing? 
> set_ptes() doesn't have any such restriction.
> 
> Also see the arm64 variant where we call
> 
>      contpte_set_ptes(mm, addr, ptep, pte, nr);
> 
> There, I think we perform checks whether whether we can set the cont-pte 
> bit IIUC.
> 
>      if (((addr | next | (pfn << PAGE_SHIFT)) & ~CONT_PTE_MASK) == 0)
>          pte = pte_mkcont(pte);
>      else
>          pte = pte_mknoncont(pte);
> 

