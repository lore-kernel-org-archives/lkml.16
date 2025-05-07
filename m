Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5133D8248C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611337; cv=none; b=dCA1rtL4N4DD66+tj8MjW1MqRIO9CD1Ds3544Y5FuQ/DdmwaLjPCcq54BPxAfRdWmdk4EIMuRaxxEttXFH//9fMt29xdVfM5JgCBd0QGjRUPzOlaxSL6BXKG9mrbRMfLWYIZntMbvZTE0y/lYYY//G8bmQzOmRMKqWPMlaUgrw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611337; c=relaxed/simple;
	bh=HE0/xP+xIw59ri6RKynRpIPzxrML6Nv79Aap3Q8gQg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZdzj1K22r4+XpkfsYNCoMCgJFp4mL0HqNm428he+S4l4SGx8WmAOg8hiGyAx0iQLy1HBviY3HdT99RQSvG+QA3BSX1dKhtVE+Lc2o/7HB/s8duJwpKv/KoIvM4ZkmNkKpZh5SgbHv5+sfmtB7hSTZXtu7FBqIkrB4opB7ikI6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=o09JeHSt; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="o09JeHSt"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746611324; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=V0O8cm6bffSFegRdIrSugEF6D3zwGb4jo+mv6tMRPJg=;
	b=o09JeHSt3UErHbWQXbD+lFBtjGBspo7C5mNrIPZLFGssBCfgFA1kj1UDWt64SzodqrV0/73FJQeFXBxEsYuqvYNaEJXJGVVVIdq/NO7AQWnJKxxSTSjrCFz1ExEH6Ii7omDRV26gHNscQnK978wDpWG7ToV4i0QAfi9tqDCk5ZQ=
Received: from 30.74.144.111(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WZp3AbP_1746611321 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 07 May 2025 17:48:41 +0800
Message-ID: <6a8418ba-dbd1-489f-929b-e31831bea0cf@linux.alibaba.com>
Date: Wed, 7 May 2025 17:48:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: mincore: use folio_pte_batch() to batch process
 large folios
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, hughd@google.com
Cc: willy@infradead.org, david@redhat.com, 21cnbao@gmail.com,
 ryan.roberts@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
 <17289428-894a-4397-9d61-c8500d032b28@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <17289428-894a-4397-9d61-c8500d032b28@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/5/7 13:12, Dev Jain wrote:
> 
> 
> On 26/03/25 9:08 am, Baolin Wang wrote:
>> When I tested the mincore() syscall, I observed that it takes longer with
>> 64K mTHP enabled on my Arm64 server. The reason is the 
>> mincore_pte_range()
>> still checks each PTE individually, even when the PTEs are contiguous,
>> which is not efficient.
>>
>> Thus we can use folio_pte_batch() to get the batch number of the present
>> contiguous PTEs, which can improve the performance. I tested the 
>> mincore()
>> syscall with 1G anonymous memory populated with 64K mTHP, and observed an
>> obvious performance improvement:
>>
>> w/o patch        w/ patch        changes
>> 6022us            1115us            +81%
>>
>> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
>> see any obvious regression.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   mm/mincore.c | 27 ++++++++++++++++++++++-----
>>   1 file changed, 22 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/mincore.c b/mm/mincore.c
>> index 832f29f46767..88be180b5550 100644
>> --- a/mm/mincore.c
>> +++ b/mm/mincore.c
>> @@ -21,6 +21,7 @@
>>   #include <linux/uaccess.h>
>>   #include "swap.h"
>> +#include "internal.h"
>>   static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned 
>> long addr,
>>               unsigned long end, struct mm_walk *walk)
>> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned 
>> long addr, unsigned long end,
>>       pte_t *ptep;
>>       unsigned char *vec = walk->private;
>>       int nr = (end - addr) >> PAGE_SHIFT;
>> +    int step, i;
>>       ptl = pmd_trans_huge_lock(pmd, vma);
>>       if (ptl) {
>> @@ -118,16 +120,31 @@ static int mincore_pte_range(pmd_t *pmd, 
>> unsigned long addr, unsigned long end,
>>           walk->action = ACTION_AGAIN;
>>           return 0;
>>       }
>> -    for (; addr != end; ptep++, addr += PAGE_SIZE) {
>> +    for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>>           pte_t pte = ptep_get(ptep);
>> +        step = 1;
>>           /* We need to do cache lookup too for pte markers */
>>           if (pte_none_mostly(pte))
>>               __mincore_unmapped_range(addr, addr + PAGE_SIZE,
>>                            vma, vec);
>> -        else if (pte_present(pte))
>> -            *vec = 1;
>> -        else { /* pte is a swap entry */
>> +        else if (pte_present(pte)) {
>> +            if (pte_batch_hint(ptep, pte) > 1) {
>> +                struct folio *folio = vm_normal_folio(vma, addr, pte);
>> +
>> +                if (folio && folio_test_large(folio)) {
>> +                    const fpb_t fpb_flags = FPB_IGNORE_DIRTY |
>> +                                FPB_IGNORE_SOFT_DIRTY;
>> +                    int max_nr = (end - addr) / PAGE_SIZE;
>> +
>> +                    step = folio_pte_batch(folio, addr, ptep, pte,
>> +                            max_nr, fpb_flags, NULL, NULL, NULL);
>> +                }
>> +            }
> 
> Can we go ahead with this along with [1], that will help us generalize 
> for all arches.
> 
> [1] https://lore.kernel.org/all/20250506050056.59250-3-dev.jain@arm.com/
> (Please replace PAGE_SIZE with 1)

As discussed with Ryan, we don’t need to call folio_pte_batch() 
(something like the code below), so your patch seems unnecessarily 
complicated. However, David is unhappy about the open-coded 
pte_batch_hint().

  static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned 
long addr,
                         unsigned long end, struct mm_walk *walk)
@@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned 
long addr, unsigned long end,
         pte_t *ptep;
         unsigned char *vec = walk->private;
         int nr = (end - addr) >> PAGE_SHIFT;
+       int step, i;

         ptl = pmd_trans_huge_lock(pmd, vma);
         if (ptl) {
@@ -118,16 +120,21 @@ static int mincore_pte_range(pmd_t *pmd, unsigned 
long addr, unsigned long end,
                 walk->action = ACTION_AGAIN;
                 return 0;
         }
-       for (; addr != end; ptep++, addr += PAGE_SIZE) {
+       for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
                 pte_t pte = ptep_get(ptep);

+               step = 1;
                 /* We need to do cache lookup too for pte markers */
                 if (pte_none_mostly(pte))
                         __mincore_unmapped_range(addr, addr + PAGE_SIZE,
                                                  vma, vec);
-               else if (pte_present(pte))
-                       *vec = 1;
-               else { /* pte is a swap entry */
+               else if (pte_present(pte)) {
+                       unsigned int max_nr = (end - addr) / PAGE_SIZE;
+
+                       step = min(pte_batch_hint(ptep, pte), max_nr);
+                       for (i = 0; i < step; i++)
+                               vec[i] = 1;
+               } else { /* pte is a swap entry */
                         swp_entry_t entry = pte_to_swp_entry(pte);

                         if (non_swap_entry(entry)) {
@@ -146,7 +153,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned 
long addr, unsigned long end,
  #endif
                         }
                 }
-               vec++;
+               vec += step;
         }
         pte_unmap_unlock(ptep - 1, ptl);
  out:
