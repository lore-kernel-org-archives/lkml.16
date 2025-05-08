Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA3021018F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746691078; cv=none; b=Zhjc6VHnl2RA7vm1YiKkR6sYan6ncxdr6d6Dn0glUwTaf26G98lrlihPNcHOxnJMdkFu5xj5lqopbv3IjjZwmfib4/n4PIhfYWK6pcoXI3Sj5BvUVkrehIhuf4hb/y7I5GjqomDEYMAF+EXciomWr4d8N1BZa1xR4/OGZbNt/do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746691078; c=relaxed/simple;
	bh=1zd7pfNRHrc9fmrlq+t0FTzxLujy9sMyLMFWd1EMK68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzAyJ0PhHntMS5thNArYxnHx4f4Hjh9LktOQdMdC2hILmL0YltrDmni0E+UuhTeDpKrQ2Lm6cBI0AKBJlE4SNv7ocEvmOIWVSH070cqbvIYsrE4UQ+L4M/q5Z8eG5bFYrBJq8RqrQPmBfjFpxTUa+DTXxD4Ihr4Ly7g2G5QDZ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=qHMHUntB; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="qHMHUntB"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746691071; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=6K5ejnEkUC0oNVReyoB1igMWQHDIneQzEbwYNnj+lYc=;
	b=qHMHUntBcF3ABm5XlFOuG27X7bABEwUZsJ3oQTMOCgRL0BckKQUaQp6k8JyCBUOJWx77hgAgFH/T+w30An1rZetfe11Ma5RPfSl9uXgSnPOnBBeOJXpoHSCfgQXpgu3ZdepCIXpV4zBTeCO4qqjCImpxcPJwBriEzoU674gQQU4=
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wa-9atw_1746691070 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 May 2025 15:57:50 +0800
Message-ID: <0a22ab94-f63e-4959-a2cd-8b8a3ae210c3@linux.alibaba.com>
Date: Thu, 8 May 2025 15:57:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: mincore: use pte_batch_bint() to batch process
 large folios
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <e89f3af69104c18e45362c6c48058edd2bddf501.1746677237.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4wKCpDi7ov0rx4C=rfi90nSGQrDx=4JyKgug4NXC4cYgQ@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4wKCpDi7ov0rx4C=rfi90nSGQrDx=4JyKgug4NXC4cYgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/5/8 15:42, Barry Song wrote:
> On Thu, May 8, 2025 at 4:09 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>> When I tested the mincore() syscall, I observed that it takes longer with
>> 64K mTHP enabled on my Arm64 server. The reason is the mincore_pte_range()
>> still checks each PTE individually, even when the PTEs are contiguous,
>> which is not efficient.
>>
>> Thus we can use pte_batch_hint() to get the batch number of the present
>> contiguous PTEs, which can improve the performance. I tested the mincore()
>> syscall with 1G anonymous memory populated with 64K mTHP, and observed an
>> obvious performance improvement:
>>
>> w/o patch               w/ patch                changes
>> 6022us                  549us                   +91%
>>
>> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
>> see any obvious regression for base pages.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>> Changes from v1:
>>   - Change to use pte_batch_hint() to get the batch number, per Ryan.
>>
>> Note: I observed the min_t() can introduce a slight performance regression
>> for base pages, so I change to add a batch size check for base pages,
>> which can resolve the performance regression issue.
>> ---
>>   mm/mincore.c | 19 ++++++++++++++-----
>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/mincore.c b/mm/mincore.c
>> index 832f29f46767..2e6a9123305e 100644
>> --- a/mm/mincore.c
>> +++ b/mm/mincore.c
>> @@ -21,6 +21,7 @@
>>
>>   #include <linux/uaccess.h>
>>   #include "swap.h"
>> +#include "internal.h"
>>
>>   static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned long addr,
>>                          unsigned long end, struct mm_walk *walk)
>> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>          pte_t *ptep;
>>          unsigned char *vec = walk->private;
>>          int nr = (end - addr) >> PAGE_SHIFT;
>> +       int step, i;
>>
>>          ptl = pmd_trans_huge_lock(pmd, vma);
>>          if (ptl) {
>> @@ -118,16 +120,23 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>                  walk->action = ACTION_AGAIN;
>>                  return 0;
>>          }
>> -       for (; addr != end; ptep++, addr += PAGE_SIZE) {
>> +       for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>>                  pte_t pte = ptep_get(ptep);
>>
>> +               step = 1;
>>                  /* We need to do cache lookup too for pte markers */
>>                  if (pte_none_mostly(pte))
>>                          __mincore_unmapped_range(addr, addr + PAGE_SIZE,
>>                                                   vma, vec);
>> -               else if (pte_present(pte))
>> -                       *vec = 1;
>> -               else { /* pte is a swap entry */
>> +               else if (pte_present(pte)) {
>> +                       unsigned int batch = pte_batch_hint(ptep, pte);
>> +
>> +                       if (batch > 1)
>> +                               step = min_t(unsigned int, batch, nr);
> 
> Not quite sure if nr should be (end - addr) / PAGE_SIZE as nr
> is always the initial value. For example, nr = 50, and we have
> scanned 48 PTEs, then we have 2 ptes left. No?

Ah, you are right. I missed this part when I revised the original 
patch[1]. Thanks for pointing this out.

[1] 
https://lore.kernel.org/all/6a8418ba-dbd1-489f-929b-e31831bea0cf@linux.alibaba.com/
