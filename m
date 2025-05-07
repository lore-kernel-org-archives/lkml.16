Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A009B1F91C5
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612227; cv=none; b=q4b+T9eWdH06kMgrP4KC2bjW3i25/+Usibgfm4gXc0YAv3aPhU5rJohqZ/liEXMcCEr8yjk/8p/acf4/nwAtc2J89ArhpC1hyhpPspMQGUQK+wdr98g5a/3iVFqEvnzVsfiJGtGCY3aNSHIZF9XIy3I3RmVDdKaDHTaxSFZusr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612227; c=relaxed/simple;
	bh=JPqB85uGz5OWzFqLAvlB+Xmhgew3sJv2rTxhQ7cBYIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0fz8aZJkCpDEb2bAJE7epBD6Bwu2y6wRAvJcsp4UcqwMQ2OGGUdBDmQ5NWdWpbhh4N2C6y2ERXNWmuo0wzncVyQ5ZoayETfbZSUsirh7NJKWGq1WAv7p6PrnZpgd445Aa/UXAdVi315EDk7AXAiqFMiy1DaF0WEvG3U59cnGIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=sgxIqJAZ; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="sgxIqJAZ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746612220; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=EWQps3oaNtZZ7GNbFF8Y5bHARbDvabiLn4K5Tv65RZI=;
	b=sgxIqJAZ85b4SoNGEzv3rsVZEwfQhCWs/piDav3mOLvhhW4iYarE8IK1I/lTJkaKyYTtr6QIWytISEJJRKj0cZK76U0YEgNiJ6WAGbh4Qh1I9dxVd+YfhW00WZD1Ea/OFh1N7y3z5k1g833fFJWEY4ohEB+XM33XMkCWqYZUPd0=
Received: from 30.74.144.111(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WZpIPoD_1746612218 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 07 May 2025 18:03:39 +0800
Message-ID: <c0b2221f-2686-49a7-a1bd-97f5181065e0@linux.alibaba.com>
Date: Wed, 7 May 2025 18:03:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: mincore: use folio_pte_batch() to batch process
 large folios
To: David Hildenbrand <david@redhat.com>, Dev Jain <dev.jain@arm.com>,
 akpm@linux-foundation.org, hughd@google.com
Cc: willy@infradead.org, 21cnbao@gmail.com, ryan.roberts@arm.com,
 ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
 <17289428-894a-4397-9d61-c8500d032b28@arm.com>
 <6a8418ba-dbd1-489f-929b-e31831bea0cf@linux.alibaba.com>
 <fc883e4c-41cb-4f05-a5ef-3b756c689da3@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <fc883e4c-41cb-4f05-a5ef-3b756c689da3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/5/7 17:54, David Hildenbrand wrote:
> On 07.05.25 11:48, Baolin Wang wrote:
>>
>>
>> On 2025/5/7 13:12, Dev Jain wrote:
>>>
>>>
>>> On 26/03/25 9:08 am, Baolin Wang wrote:
>>>> When I tested the mincore() syscall, I observed that it takes longer 
>>>> with
>>>> 64K mTHP enabled on my Arm64 server. The reason is the
>>>> mincore_pte_range()
>>>> still checks each PTE individually, even when the PTEs are contiguous,
>>>> which is not efficient.
>>>>
>>>> Thus we can use folio_pte_batch() to get the batch number of the 
>>>> present
>>>> contiguous PTEs, which can improve the performance. I tested the
>>>> mincore()
>>>> syscall with 1G anonymous memory populated with 64K mTHP, and 
>>>> observed an
>>>> obvious performance improvement:
>>>>
>>>> w/o patch        w/ patch        changes
>>>> 6022us            1115us            +81%
>>>>
>>>> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
>>>> see any obvious regression.
>>>>
>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> ---
>>>>    mm/mincore.c | 27 ++++++++++++++++++++++-----
>>>>    1 file changed, 22 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/mm/mincore.c b/mm/mincore.c
>>>> index 832f29f46767..88be180b5550 100644
>>>> --- a/mm/mincore.c
>>>> +++ b/mm/mincore.c
>>>> @@ -21,6 +21,7 @@
>>>>    #include <linux/uaccess.h>
>>>>    #include "swap.h"
>>>> +#include "internal.h"
>>>>    static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned
>>>> long addr,
>>>>                unsigned long end, struct mm_walk *walk)
>>>> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned
>>>> long addr, unsigned long end,
>>>>        pte_t *ptep;
>>>>        unsigned char *vec = walk->private;
>>>>        int nr = (end - addr) >> PAGE_SHIFT;
>>>> +    int step, i;
>>>>        ptl = pmd_trans_huge_lock(pmd, vma);
>>>>        if (ptl) {
>>>> @@ -118,16 +120,31 @@ static int mincore_pte_range(pmd_t *pmd,
>>>> unsigned long addr, unsigned long end,
>>>>            walk->action = ACTION_AGAIN;
>>>>            return 0;
>>>>        }
>>>> -    for (; addr != end; ptep++, addr += PAGE_SIZE) {
>>>> +    for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>>>>            pte_t pte = ptep_get(ptep);
>>>> +        step = 1;
>>>>            /* We need to do cache lookup too for pte markers */
>>>>            if (pte_none_mostly(pte))
>>>>                __mincore_unmapped_range(addr, addr + PAGE_SIZE,
>>>>                             vma, vec);
>>>> -        else if (pte_present(pte))
>>>> -            *vec = 1;
>>>> -        else { /* pte is a swap entry */
>>>> +        else if (pte_present(pte)) {
>>>> +            if (pte_batch_hint(ptep, pte) > 1) {
>>>> +                struct folio *folio = vm_normal_folio(vma, addr, pte);
>>>> +
>>>> +                if (folio && folio_test_large(folio)) {
>>>> +                    const fpb_t fpb_flags = FPB_IGNORE_DIRTY |
>>>> +                                FPB_IGNORE_SOFT_DIRTY;
>>>> +                    int max_nr = (end - addr) / PAGE_SIZE;
>>>> +
>>>> +                    step = folio_pte_batch(folio, addr, ptep, pte,
>>>> +                            max_nr, fpb_flags, NULL, NULL, NULL);
>>>> +                }
>>>> +            }
>>>
>>> Can we go ahead with this along with [1], that will help us generalize
>>> for all arches.
>>>
>>> [1] https://lore.kernel.org/all/20250506050056.59250-3-dev.jain@arm.com/
>>> (Please replace PAGE_SIZE with 1)
>>
>> As discussed with Ryan, we don’t need to call folio_pte_batch()
>> (something like the code below), so your patch seems unnecessarily
>> complicated. However, David is unhappy about the open-coded
>> pte_batch_hint().
> 
> I can live with the below :)
> 
> Having something more universal does maybe not make sense here. Any form 
> of patching contiguous PTEs (contiguous PFNs) -- whether with folios or 
> not -- is not required here as we really only want to
> 
> (a) Identify pte_present() PTEs
> (b) Avoid the cost of repeated ptep_get() with cont-pte.

Good. I will change the patch and resend it. Thanks.
