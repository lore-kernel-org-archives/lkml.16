Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34BF80C02
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743364658; cv=none; b=aZm84eOtlwoBpDAIr5Bb57m/X+5Tz9Fdrsms90nhfBQkkb4LnDFn2Gp3gK4ZkwtLhgGElgVKECGaNslfF1ZIZV+4ww1p2UFxP4qgL6j3ri6t+eJWARLMaeih+L2dj3csvayQUq/9e1U8bSsj9Wzxh9i/fgGDDU0F1PbmXBi/vbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743364658; c=relaxed/simple;
	bh=B44TjKHpzN30bdGG2g6hlZQaFiR1x8rqlYFT0s7rDyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MgEcYQV70wGreuVRA/rGLnAGJf8L9498eJ4A7BZIecaPKVpthiKBU2vMF5b8RjcD7mervCje3gE0Ga/NHXxG0Yf0hRcbqvOlMeGynkOWng9wCxua/nShcBz/Eboyw4UR2dMhsAnpAunArCTI9RfU+GYX/ebfPgwohWAI4AmN6z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=I+ppLWfI; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="I+ppLWfI"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743364647; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ni9PDOb25HWqXvjusXB3wdjsKAybc+x8kFq39soa9YU=;
	b=I+ppLWfIg5rVcBEyj1xcktXct2OKSKjGYlo0WbN1X//ho4LuXc57y33jS+6iPbtlL4CTYH4FpPcf5R3pfKrYjNEedAX4mu1g/pNnfSdewaaF+aOrglkNn97LKer750cBu8qYTu3jYz85AFAIm9OlIr8QZWvJ7sCW7kqydv43cVw=
Received: from 30.58.211.89(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WTNZI5i_1743364641 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Mar 2025 03:57:26 +0800
Message-ID: <f6f4f4ff-0074-4ba7-b2a5-02727661843c@linux.alibaba.com>
Date: Sun, 30 Mar 2025 20:57:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: mincore: use folio_pte_batch() to batch process
 large folios
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: willy@infradead.org, david@redhat.com, 21cnbao@gmail.com, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
 <54886038-3707-4ea0-bd84-00a8f4a19a6a@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <54886038-3707-4ea0-bd84-00a8f4a19a6a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/3/27 22:08, Ryan Roberts wrote:
> On 25/03/2025 23:38, Baolin Wang wrote:
>> When I tested the mincore() syscall, I observed that it takes longer with
>> 64K mTHP enabled on my Arm64 server. The reason is the mincore_pte_range()
>> still checks each PTE individually, even when the PTEs are contiguous,
>> which is not efficient.
>>
>> Thus we can use folio_pte_batch() to get the batch number of the present
>> contiguous PTEs, which can improve the performance. I tested the mincore()
>> syscall with 1G anonymous memory populated with 64K mTHP, and observed an
>> obvious performance improvement:
>>
>> w/o patch		w/ patch		changes
>> 6022us			1115us			+81%
>>
>> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
>> see any obvious regression.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   mm/mincore.c | 27 ++++++++++++++++++++++-----
>>   1 file changed, 22 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/mincore.c b/mm/mincore.c
>> index 832f29f46767..88be180b5550 100644
>> --- a/mm/mincore.c
>> +++ b/mm/mincore.c
>> @@ -21,6 +21,7 @@
>>   
>>   #include <linux/uaccess.h>
>>   #include "swap.h"
>> +#include "internal.h"
>>   
>>   static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned long addr,
>>   			unsigned long end, struct mm_walk *walk)
>> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>   	pte_t *ptep;
>>   	unsigned char *vec = walk->private;
>>   	int nr = (end - addr) >> PAGE_SHIFT;
>> +	int step, i;
>>   
>>   	ptl = pmd_trans_huge_lock(pmd, vma);
>>   	if (ptl) {
>> @@ -118,16 +120,31 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>   		walk->action = ACTION_AGAIN;
>>   		return 0;
>>   	}
>> -	for (; addr != end; ptep++, addr += PAGE_SIZE) {
>> +	for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>>   		pte_t pte = ptep_get(ptep);
>>   
>> +		step = 1;
>>   		/* We need to do cache lookup too for pte markers */
>>   		if (pte_none_mostly(pte))
>>   			__mincore_unmapped_range(addr, addr + PAGE_SIZE,
>>   						 vma, vec);
>> -		else if (pte_present(pte))
>> -			*vec = 1;
>> -		else { /* pte is a swap entry */
>> +		else if (pte_present(pte)) {
>> +			if (pte_batch_hint(ptep, pte) > 1) {
>> +				struct folio *folio = vm_normal_folio(vma, addr, pte);
>> +
>> +				if (folio && folio_test_large(folio)) {
>> +					const fpb_t fpb_flags = FPB_IGNORE_DIRTY |
>> +								FPB_IGNORE_SOFT_DIRTY;
>> +					int max_nr = (end - addr) / PAGE_SIZE;
>> +
>> +					step = folio_pte_batch(folio, addr, ptep, pte,
>> +							max_nr, fpb_flags, NULL, NULL, NULL);
>> +				}
>> +			}
> 
> You could simplify to the following, I think, to avoid needing to grab the folio
> and call folio_pte_batch():
> 
> 			else if (pte_present(pte)) {
> 				int max_nr = (end - addr) / PAGE_SIZE;
> 				step = min(pte_batch_hint(ptep, pte), max_nr);
> 			} ...
> 
> I expect the regression you are seeing here is all due to calling ptep_get() for
> every pte in the contpte batch, which will cause 16 memory reads per pte (to
> gather the access/dirty bits). For small folios its just 1 read per pte.

Right.

> pte_batch_hint() will skip forward in blocks of 16 so you now end up with the
> same number as for the small folio case. You don't need all the fancy extras
> that folio_pte_batch() gives you here.

Sounds reasonable. Your suggestion looks simple, but my method can batch 
the whole large folio (such as large folios containing more than 16 
contiguous PTEs) at once. Anyway, let me do some performance 
measurements for your suggestion. Thanks.
