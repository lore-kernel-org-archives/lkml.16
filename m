Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBE8155A25
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 06:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745217348; cv=none; b=OtSgXMDa9AaeawY0UK4NFpiVkAM1tX0IOfNUsviA4xIykR+gXCgzQjRmk2qdvh8s8KU8Q12QF/MWMOQx0sIwheJOwvhAyu3tZdN7AXt9MrstP8CEh8p5FjGmFWAdP6YpXaGHq7S7qK+oh1qnmmdhQzodOJzyaMtkeDCGhWx09Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745217348; c=relaxed/simple;
	bh=IF3zXt1NZj47mVCLkAECpFLhWCDuWYyrNvMOR1KtfBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YqBpw13Js+cw9LyDyluolOVv0AGClq2JhZRJk2NBxGHWaoNFJlkwKltODRmhk3YJqJ394GaXZxomf47xP9XYw12A5SJHon3l5OHr9aYB7QH0aZYzuoSm0p4iy9WcEJevBuS4M7I9AckSmxCd/06qNoKc7Y/JYSMTQHucJnmAx4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=aCtrz6gp; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="aCtrz6gp"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1745217334; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=idPt4awxei//Gm12NGcnuqpMWa/emoKeVAP9nz2q0EM=;
	b=aCtrz6gpecKrIxjHKphxNG/eu2VEqFS1+Wh4MyXoyH9eyBb92p/5MkzvyUkylim0emncuYz/Q3WKY3uxsk6BB6XxRLo9DxDQfhQ+mhARG1gQQL3q09RtfS8BvjhX7D1cJ8vjPzGBYR7cBQw55l6PBTrhNR8sPBq9YDA2PYva8oE=
Received: from 30.74.144.126(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WXStuVy_1745217014 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 21 Apr 2025 14:30:15 +0800
Message-ID: <e04b4295-80f4-44c8-a7ec-9e946a83ef12@linux.alibaba.com>
Date: Mon, 21 Apr 2025 14:30:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mempolicy: Optimize queue_folios_pte_range by PTE
 batching
To: David Hildenbrand <david@redhat.com>, Dev Jain <dev.jain@arm.com>,
 akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, hughd@google.com, vishal.moola@gmail.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250416053048.96479-1-dev.jain@arm.com>
 <7f96283b-11b3-49ee-9d2d-5ad977325cb0@linux.alibaba.com>
 <019d1c4a-ffd0-4602-b2ba-cf07379dab17@redhat.com>
 <7392a21b-10bf-4ce9-a6fd-807ed954c138@linux.alibaba.com>
 <8b387a53-40e0-40d1-8bfa-b7524657a7dd@redhat.com>
 <be88bfc7-ea89-4cef-bbce-3572d3902481@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <be88bfc7-ea89-4cef-bbce-3572d3902481@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/16 16:56, David Hildenbrand wrote:
> On 16.04.25 10:51, David Hildenbrand wrote:
>> On 16.04.25 10:41, Baolin Wang wrote:
>>>
>>>
>>> On 2025/4/16 16:22, David Hildenbrand wrote:
>>>> On 16.04.25 08:32, Baolin Wang wrote:
>>>>>
>>>>>
>>>>> On 2025/4/16 13:30, Dev Jain wrote:
>>>>>> After the check for queue_folio_required(), the code only cares about
>>>>>> the
>>>>>> folio in the for loop, i.e the PTEs are redundant. Therefore, 
>>>>>> optimize
>>>>>> this loop by skipping over a PTE batch mapping the same folio.
>>>>>>
>>>>>> With a test program migrating pages of the calling process, which
>>>>>> includes
>>>>>> a mapped VMA of size 4GB with pte-mapped large folios of order-9, and
>>>>>> migrating once back and forth node-0 and node-1, the average 
>>>>>> execution
>>>>>> time reduces from 7.5 to 4 seconds, giving an approx 47% speedup.
>>>>>>
>>>>>> v2->v3:
>>>>>>      - Don't use assignment in if condition
>>>>>>
>>>>>> v1->v2:
>>>>>>      - Follow reverse xmas tree declarations
>>>>>>      - Don't initialize nr
>>>>>>      - Move folio_pte_batch() immediately after retrieving a 
>>>>>> normal folio
>>>>>>      - increment nr_failed in one shot
>>>>>>
>>>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>>>> ---
>>>>>>      mm/mempolicy.c | 12 ++++++++++--
>>>>>>      1 file changed, 10 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>>>>>> index b28a1e6ae096..4d2dc8b63965 100644
>>>>>> --- a/mm/mempolicy.c
>>>>>> +++ b/mm/mempolicy.c
>>>>>> @@ -566,6 +566,7 @@ static void queue_folios_pmd(pmd_t *pmd, struct
>>>>>> mm_walk *walk)
>>>>>>      static int queue_folios_pte_range(pmd_t *pmd, unsigned long 
>>>>>> addr,
>>>>>>                  unsigned long end, struct mm_walk *walk)
>>>>>>      {
>>>>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | 
>>>>>> FPB_IGNORE_SOFT_DIRTY;
>>>>>>          struct vm_area_struct *vma = walk->vma;
>>>>>>          struct folio *folio;
>>>>>>          struct queue_pages *qp = walk->private;
>>>>>> @@ -573,6 +574,7 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>>>> unsigned long addr,
>>>>>>          pte_t *pte, *mapped_pte;
>>>>>>          pte_t ptent;
>>>>>>          spinlock_t *ptl;
>>>>>> +    int max_nr, nr;
>>>>>>          ptl = pmd_trans_huge_lock(pmd, vma);
>>>>>>          if (ptl) {
>>>>>> @@ -586,7 +588,9 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>>>> unsigned long addr,
>>>>>>              walk->action = ACTION_AGAIN;
>>>>>>              return 0;
>>>>>>          }
>>>>>> -    for (; addr != end; pte++, addr += PAGE_SIZE) {
>>>>>> +    for (; addr != end; pte += nr, addr += nr * PAGE_SIZE) {
>>>>>> +        max_nr = (end - addr) >> PAGE_SHIFT;
>>>>>> +        nr = 1;
>>>>>>              ptent = ptep_get(pte);
>>>>>>              if (pte_none(ptent))
>>>>>>                  continue;
>>>>>> @@ -598,6 +602,10 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>>>> unsigned long addr,
>>>>>>              folio = vm_normal_folio(vma, addr, ptent);
>>>>>>              if (!folio || folio_is_zone_device(folio))
>>>>>>                  continue;
>>>>>> +        if (folio_test_large(folio) && max_nr != 1)
>>>>>> +            nr = folio_pte_batch(folio, addr, pte, ptent,
>>>>>> +                         max_nr, fpb_flags,
>>>>>> +                         NULL, NULL, NULL);
>>>>>>              /*
>>>>>>               * vm_normal_folio() filters out zero pages, but 
>>>>>> there might
>>>>>>               * still be reserved folios to skip, perhaps in a VDSO.
>>>>>> @@ -630,7 +638,7 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>>>> unsigned long addr,
>>>>>>              if (!(flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL)) ||
>>>>>>                  !vma_migratable(vma) ||
>>>>>>                  !migrate_folio_add(folio, qp->pagelist, flags)) {
>>>>>> -            qp->nr_failed++;
>>>>>> +            qp->nr_failed += nr;
>>>>>
>>>>> Sorry for chiming in late, but I am not convinced that 'qp->nr_failed'
>>>>> should add 'nr' when isolation fails.
>>>>
>>>> This patch does not change the existing behavior. But I stumbled over
>>>> that as well ... and scratched my head.
>>>>
>>>>>
>>>>>     From the comments of queue_pages_range():
>>>>> "
>>>>> * >0 - this number of misplaced folios could not be queued for moving
>>>>>      *      (a hugetlbfs page or a transparent huge page being counted
>>>>> as 1).
>>>>> "
>>>>>
>>>>> That means if a large folio is failed to isolate, we should only 
>>>>> add '1'
>>>>> for qp->nr_failed instead of the number of pages in this large folio.
>>>>> Right?
>>>>
>>>> I think what the doc really meant is "PMD-mapped THP". PTE-mapped THPs
>>>> always had the same behavior: per PTE of the THP we would increment
>>>> nr_failed by 1.
>>>
>>> No? For pte-mapped THPs, it only adds 1 for the large folio, since we
>>> have below check in queue_folios_pte_range().
>>>
>>> if (folio == qp->large)
>>>     continue;
>>>
>>> Or I missed anything else?
>>
>> Ah, I got confused by that and thought it would only be for LRU
>> isolation purposes.
>>
>> Yeah, it will kind-of work for now and I think you are correct that we
>> would only increment nr_failed by 1.
>>
>> I still think that counting nr_failed that way is dubious. We should be
>> counting pages, which is something that user space from migrate_pages()
>> could understand. Having it count arbitrary THPs/large folio sizes is
>> really questionable.
>>
>> But that is indeed a separate issue to resolve.
> 
> Digging into it:
> 
> commit 1cb5d11a370f661c5d0d888bb0cfc2cdc5791382
> Author: Hugh Dickins <hughd@google.com>
> Date:   Tue Oct 3 02:17:43 2023 -0700
> 
>      mempolicy: fix migrate_pages(2) syscall return nr_failed
>      "man 2 migrate_pages" says "On success migrate_pages() returns the 
> number
>      of pages that could not be moved".  Although 5.3 and 5.4 commits fixed
>      mbind(MPOL_MF_STRICT|MPOL_MF_MOVE*) to fail with EIO when not all 
> pages
>      could be moved (because some could not be isolated for migration),
>      migrate_pages(2) was left still reporting only those pages failing 
> at the
>      migration stage, forgetting those failing at the earlier isolation 
> stage.
>      Fix that by accumulating a long nr_failed count in struct queue_pages,
>      returned by queue_pages_range() when it's not returning an error, for
>      adding on to the nr_failed count from migrate_pages() in 
> mm/migrate.c.  A
>      count of pages?  It's more a count of folios, but changing it to pages
>      would entail more work (also in mm/migrate.c): does not seem 
> justified.
> 
> Yeah, we should be counting pages, but likely nobody really cares, 
> because we
> only care if everything was migrated or something was not migrated.

Agree. Like you said, we need a separate patch to do some cleanup for this.
