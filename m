Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B2622F155
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792905; cv=none; b=gpYtnjccEYEzihy3wwixVMI/gXDHU6qk/NHBxr/h16BNOJONTz2owJ4GTPmaHCkjujMKWwupMxhOhE0AxCukrLZ0sp2MkhJG79BCS/lw+CY/+6KsvG/zIlThP3R1QPY5FcLyaDO4AU+9pfDK7G/hUHBGxqAbkE0dXu97dpgmLw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792905; c=relaxed/simple;
	bh=l0zhTe9N9zv5B7zVgTkNaD6Vu0btAowjXNlW6nP4EKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4G8KQlvgCdH+ZU8q11IRhbiogSosUKEapdlSZrtOFt+HmRI4Q+28q4tn0pMOpTwEO3NHmG7e1Ek3bVbXg+tkh606wgxg1u+eLduPX53bQAbL6/pbRVHmMkqkt3FMPBM9O0VnGgiYfq+Lr7LUiLZWZgDO44PzHadaKjD0hgAFrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=HI7M51XJ; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="HI7M51XJ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744792893; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Z6D/L440zCKz6m87Bedbqv+umyrg/+ozjToXPCehfm4=;
	b=HI7M51XJtVp/WTbJlyT4+rs4L4eK+4zfYAKImIZmcveRxaQ5b2qjyVm4YTDoPpd4mFSHor7FJ3f45pPNL7UzJ+Xln6ZhU5okduiD5yClxe7mDIdW2c6+dCkZ9HoVOTUwPKVjd81RE9xLobGaiyBfYK+Kc1Eqtw/AQ4wrMPk3Wag=
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WX8VQHe_1744792891 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Apr 2025 16:41:31 +0800
Message-ID: <7392a21b-10bf-4ce9-a6fd-807ed954c138@linux.alibaba.com>
Date: Wed, 16 Apr 2025 16:41:31 +0800
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
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <019d1c4a-ffd0-4602-b2ba-cf07379dab17@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/16 16:22, David Hildenbrand wrote:
> On 16.04.25 08:32, Baolin Wang wrote:
>>
>>
>> On 2025/4/16 13:30, Dev Jain wrote:
>>> After the check for queue_folio_required(), the code only cares about 
>>> the
>>> folio in the for loop, i.e the PTEs are redundant. Therefore, optimize
>>> this loop by skipping over a PTE batch mapping the same folio.
>>>
>>> With a test program migrating pages of the calling process, which 
>>> includes
>>> a mapped VMA of size 4GB with pte-mapped large folios of order-9, and
>>> migrating once back and forth node-0 and node-1, the average execution
>>> time reduces from 7.5 to 4 seconds, giving an approx 47% speedup.
>>>
>>> v2->v3:
>>>    - Don't use assignment in if condition
>>>
>>> v1->v2:
>>>    - Follow reverse xmas tree declarations
>>>    - Don't initialize nr
>>>    - Move folio_pte_batch() immediately after retrieving a normal folio
>>>    - increment nr_failed in one shot
>>>
>>> Acked-by: David Hildenbrand <david@redhat.com>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>    mm/mempolicy.c | 12 ++++++++++--
>>>    1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>>> index b28a1e6ae096..4d2dc8b63965 100644
>>> --- a/mm/mempolicy.c
>>> +++ b/mm/mempolicy.c
>>> @@ -566,6 +566,7 @@ static void queue_folios_pmd(pmd_t *pmd, struct 
>>> mm_walk *walk)
>>>    static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>>>                unsigned long end, struct mm_walk *walk)
>>>    {
>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>        struct vm_area_struct *vma = walk->vma;
>>>        struct folio *folio;
>>>        struct queue_pages *qp = walk->private;
>>> @@ -573,6 +574,7 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>>> unsigned long addr,
>>>        pte_t *pte, *mapped_pte;
>>>        pte_t ptent;
>>>        spinlock_t *ptl;
>>> +    int max_nr, nr;
>>>        ptl = pmd_trans_huge_lock(pmd, vma);
>>>        if (ptl) {
>>> @@ -586,7 +588,9 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>>> unsigned long addr,
>>>            walk->action = ACTION_AGAIN;
>>>            return 0;
>>>        }
>>> -    for (; addr != end; pte++, addr += PAGE_SIZE) {
>>> +    for (; addr != end; pte += nr, addr += nr * PAGE_SIZE) {
>>> +        max_nr = (end - addr) >> PAGE_SHIFT;
>>> +        nr = 1;
>>>            ptent = ptep_get(pte);
>>>            if (pte_none(ptent))
>>>                continue;
>>> @@ -598,6 +602,10 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>>> unsigned long addr,
>>>            folio = vm_normal_folio(vma, addr, ptent);
>>>            if (!folio || folio_is_zone_device(folio))
>>>                continue;
>>> +        if (folio_test_large(folio) && max_nr != 1)
>>> +            nr = folio_pte_batch(folio, addr, pte, ptent,
>>> +                         max_nr, fpb_flags,
>>> +                         NULL, NULL, NULL);
>>>            /*
>>>             * vm_normal_folio() filters out zero pages, but there might
>>>             * still be reserved folios to skip, perhaps in a VDSO.
>>> @@ -630,7 +638,7 @@ static int queue_folios_pte_range(pmd_t *pmd, 
>>> unsigned long addr,
>>>            if (!(flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL)) ||
>>>                !vma_migratable(vma) ||
>>>                !migrate_folio_add(folio, qp->pagelist, flags)) {
>>> -            qp->nr_failed++;
>>> +            qp->nr_failed += nr;
>>
>> Sorry for chiming in late, but I am not convinced that 'qp->nr_failed'
>> should add 'nr' when isolation fails.
> 
> This patch does not change the existing behavior. But I stumbled over 
> that as well ... and scratched my head.
> 
>>
>>   From the comments of queue_pages_range():
>> "
>> * >0 - this number of misplaced folios could not be queued for moving
>>    *      (a hugetlbfs page or a transparent huge page being counted 
>> as 1).
>> "
>>
>> That means if a large folio is failed to isolate, we should only add '1'
>> for qp->nr_failed instead of the number of pages in this large folio. 
>> Right?
> 
> I think what the doc really meant is "PMD-mapped THP". PTE-mapped THPs 
> always had the same behavior: per PTE of the THP we would increment 
> nr_failed by 1.

No? For pte-mapped THPs, it only adds 1 for the large folio, since we 
have below check in queue_folios_pte_range().

if (folio == qp->large)
	continue;

Or I missed anything else?

> I assume returning "1" for PMD-mapped THPs was wrong from the beginning; 
> it might only have been right for hugetlb pages.
> 
> With COW and similar things (VMA splits), achieving "count each folio 
> only once" reliably is a very hard thing to achieve.
> 
> 
> Let's explore how "nr_failed" will get used.
> 
> 1) do_mbind()
> 
> Only cares if "any failed", not the exact number.
> 
> 
> 2) migrate_pages()
> 
> Will return the number to user space, where documentation says:
> 
> "On success migrate_pages() returns the number of pages that could not 
> be moved (i.e., a return of zero means that all pages were successfully 
> moved)."
> 
> man-page does not document THP specifics AFAIKs. I would assume most 
> users care about "all migrated vs. any not migrated".
> 
> 
> I would even feel confident to change the THP PMD-handling to return the 
> actual *pages*.
> 
