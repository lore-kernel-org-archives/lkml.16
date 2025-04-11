Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54766230D0D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392654; cv=none; b=GF4gDNyA3VxThMrN3UW+wgr4QhNPpZFbokIdioaJzE6vhY2fGs49CRQS1VFGdLM33v7mIqYBNc7+zB2n4R7aJVE89THGLqcKN9rgPcx4YtSRwBZmarQa32bAY+51Dfw9qWHbo3fD+TveBg3FiK8BVQ4P8QxPds3OLwSq5pE9Q98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392654; c=relaxed/simple;
	bh=gXCUSf3XDzPifGKQZ5fcXPrPfIH4zdU2bln8aCuqOvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSUYxmabsDG25v00Mku7cWJ0WMOK+GH4SbRyo6uA/X43l74IJNCYoK5RgZnAeWXFdLt5uzEmHROK2CW1+m+fa2GQvc11cj7ciFLhgZdtWKmR4/r7eF35mIaGY7e7xyNx8qBq2Cq1F1f+wPglHQG2BGtQkV8kgU79lLqS8xXvjC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D8BC106F;
	Fri, 11 Apr 2025 10:30:50 -0700 (PDT)
Received: from [10.163.75.48] (unknown [10.163.75.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91C733F59E;
	Fri, 11 Apr 2025 10:30:45 -0700 (PDT)
Message-ID: <7dccb3a2-f5e2-4f9e-8f5c-465a1d3ffdb6@arm.com>
Date: Fri, 11 Apr 2025 23:00:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant
 operations
To: Barry Song <21cnbao@gmail.com>, Xavier <xavier_qy@163.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 ryan.roberts@arm.com, ioworker0@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Zi Yan <ziy@nvidia.com>
References: <20250407092243.2207837-1-xavier_qy@163.com>
 <CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

+others

On 11/04/25 2:55 am, Barry Song wrote:
> On Mon, Apr 7, 2025 at 9:23 PM Xavier <xavier_qy@163.com> wrote:
>>
>> This commit optimizes the contpte_ptep_get function by adding early
>>   termination logic. It checks if the dirty and young bits of orig_pte
>>   are already set and skips redundant bit-setting operations during
>>   the loop. This reduces unnecessary iterations and improves performance.
>>
>> Signed-off-by: Xavier <xavier_qy@163.com>
>> ---
>>   arch/arm64/mm/contpte.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>> index bcac4f55f9c1..ca15d8f52d14 100644
>> --- a/arch/arm64/mm/contpte.c
>> +++ b/arch/arm64/mm/contpte.c
>> @@ -163,17 +163,26 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>>
>>          pte_t pte;
>>          int i;
>> +       bool dirty = false;
>> +       bool young = false;
>>
>>          ptep = contpte_align_down(ptep);
>>
>>          for (i = 0; i < CONT_PTES; i++, ptep++) {
>>                  pte = __ptep_get(ptep);
>>
>> -               if (pte_dirty(pte))
>> +               if (!dirty && pte_dirty(pte)) {
>> +                       dirty = true;
>>                          orig_pte = pte_mkdirty(orig_pte);
>> +               }
>>
>> -               if (pte_young(pte))
>> +               if (!young && pte_young(pte)) {
>> +                       young = true;
>>                          orig_pte = pte_mkyoung(orig_pte);
>> +               }
>> +
>> +               if (dirty && young)
>> +                       break;
> 
> This kind of optimization is always tricky. Dev previously tried a similar
> approach to reduce the loop count, but it ended up causing performance
> degradation:
> https://lore.kernel.org/linux-mm/20240913091902.1160520-1-dev.jain@arm.com/
> 
> So we may need actual data to validate this idea.

The original v2 patch does not work, I changed it to the following:

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index bcac4f55f9c1..db0ad38601db 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *mm, 
unsigned long addr,
  }
  EXPORT_SYMBOL_GPL(__contpte_try_unfold);

+#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
+       int _start; \
+       pte_t *_ptep = ptep; \
+       for (_start = start; _start < CONT_PTES; _start++, ptep++) { \
+               if (pte_##flag(__ptep_get(_ptep))) { \
+                       orig_pte = pte_mk##flag(orig_pte); \
+                       break; \
+               } \
+       }
+
  pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
  {
         /*
@@ -169,11 +179,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
         for (i = 0; i < CONT_PTES; i++, ptep++) {
                 pte = __ptep_get(ptep);

-               if (pte_dirty(pte))
+               if (pte_dirty(pte)) {
                         orig_pte = pte_mkdirty(orig_pte);
+                       CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
+                       break;
+               }

-               if (pte_young(pte))
+               if (pte_young(pte)) {
                         orig_pte = pte_mkyoung(orig_pte);
+                       CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
+                       break;
+               }
         }

         return orig_pte;

Some rudimentary testing with micromm reveals that this may be 
*slightly* faster. I cannot say for sure yet.

> 
>>          }
>>
>>          return orig_pte;
>> --
>> 2.34.1
>>
> 
> Thanks
> Barry
> 

