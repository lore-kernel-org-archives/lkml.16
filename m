Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1982185BD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791870; cv=none; b=kDbKJVjLMye0UM/vmRNThYldVu5CHN0N2OcO/8m4w5y7hkdOn8ax8zeXQp4DsR5BtTotPwyy1d3vofiIFAj/sul0rpvyJwEd0QAixCtKXSv4JI2molQ8BSnxz8XPGop/1GfWnA56QAweAAELlfN75cpL5LndB3LBmGIOn1DVgqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791870; c=relaxed/simple;
	bh=CS9U7z5ZJIE24/CDolxvByB3Pw+A/lHDmlz3BAYrobM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRCXhYN2Oz/BzYy8NYmt775/PmruJwoTzqMH22Ax0pGoSDFyQvd7X3Z27cLYzm9+PZisrnwL0vwdj0uVJooJCCnWnjKkKAmiS6mLOi3NhJde8TdOz7FNT27oPuChupCKMEpX2LwVqcBaNZ5m9r3b5cxpNNIXDcZuGqZqypltUdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=IITAAlvO; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="IITAAlvO"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744791858; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=rIlcDIRMM6cPiAZjOOcgdre2kZc+na6UyPKA4wPJ4FI=;
	b=IITAAlvOK6O+pRUhD/q0a9f0GCUYk+9AuR1u0mAOsI/1EnMHCqCurERhuqwjfYwI8XfKGc+EiAfhN9dttdquzITv+Q9NPm6gnBKS6SoTM4Fli9QUx+mJcmz2XRVR2xGDcCm4KOU0kLs6PUv+bCscDY76AtAiawr+/Y4Hjkxw9L0=
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WX8Rb9w_1744791856 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Apr 2025 16:24:16 +0800
Message-ID: <76e951ec-5043-4e89-8a5f-efdeaec4bb81@linux.alibaba.com>
Date: Wed, 16 Apr 2025 16:24:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying
 processes
To: Barry Song <21cnbao@gmail.com>, Zi Yan <ziy@nvidia.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 David Hildenbrand <david@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Matthew Wilcox <willy@infradead.org>, Oscar Salvador <osalvador@suse.de>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20250412085852.48524-1-21cnbao@gmail.com>
 <F7DF65A3-ABF1-43C0-B4F2-DC0EBB2B1668@nvidia.com>
 <CAGsJ_4yRq6iBPpWLdbcknGLGUCEBDsc05rAeMuK8HRAwnpg2Zg@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4yRq6iBPpWLdbcknGLGUCEBDsc05rAeMuK8HRAwnpg2Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/16 15:48, Barry Song wrote:
> On Sun, Apr 13, 2025 at 12:31 AM Zi Yan <ziy@nvidia.com> wrote:
>>
>> On 12 Apr 2025, at 4:58, Barry Song wrote:
>>
>>> From: Barry Song <v-songbaohua@oppo.com>
>>>
>>> Promoting exclusive file folios of a dying process is unnecessary and
>>> harmful. For example, while Firefox is killed and LibreOffice is
>>> launched, activating Firefox's young file-backed folios makes it
>>> harder to reclaim memory that LibreOffice doesn't use at all.
>>>
>>> An exiting process is unlikely to be restarted right away—it's
>>> either terminated by the user or killed by the OOM handler.
>>
>> The proposal looks reasonable to me. Do you have any performance number
>> about the improvement?
> 
> Tangquan ran the test on Android phones and saw 3% improvement on
> refault/thrashing things:

Good.

>                                                     w/o patch           w/patch
> workingset_refault_anon    2215933          2146602            3.13%
> workingset_refault_file       9859208          9646518             2.16%
> pswpin                                2411086          2337790             3.04%
> pswpout                              6482838          6264865             3.36%
> 
> A further demotion of exclusive file folios can improvement more, but
> might be controversial. it could be a separate patch later.
> 
>>
>>>
>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Johannes Weiner <hannes@cmpxchg.org>
>>> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
>>> Cc: Oscar Salvador <osalvador@suse.de>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Zi Yan <ziy@nvidia.com>
>>> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
>>> ---
>>>   mm/huge_memory.c |  4 ++--
>>>   mm/internal.h    | 19 +++++++++++++++++++
>>>   mm/memory.c      |  9 ++++++++-
>>>   3 files changed, 29 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index e97a97586478..05b83d2fcbb6 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -2264,8 +2264,8 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>>                         * Use flush_needed to indicate whether the PMD entry
>>>                         * is present, instead of checking pmd_present() again.
>>>                         */
>>> -                     if (flush_needed && pmd_young(orig_pmd) &&
>>> -                         likely(vma_has_recency(vma)))
>>> +                     if (!exclusive_folio_of_dying_process(folio, vma) && flush_needed &&

Nit: I prefer to check 'flush_needed' first to make sure it is a present 
pte. Otherwise look good to me.

>>> +                         pmd_young(orig_pmd) && likely(vma_has_recency(vma)))
>>>                                folio_mark_accessed(folio);
>>>                }
>>>
>>> diff --git a/mm/internal.h b/mm/internal.h
>>> index 4e0ea83aaf1c..666de96a293d 100644
>>> --- a/mm/internal.h
>>> +++ b/mm/internal.h
>>> @@ -11,6 +11,7 @@
>>>   #include <linux/khugepaged.h>
>>>   #include <linux/mm.h>
>>>   #include <linux/mm_inline.h>
>>> +#include <linux/oom.h>
>>>   #include <linux/pagemap.h>
>>>   #include <linux/pagewalk.h>
>>>   #include <linux/rmap.h>
>>> @@ -130,6 +131,24 @@ static inline int folio_nr_pages_mapped(const struct folio *folio)
>>>        return atomic_read(&folio->_nr_pages_mapped) & FOLIO_PAGES_MAPPED;
>>>   }
>>>
>>> +/*
>>> + * Return true if a folio is exclusive and belongs to an exiting or
>>> + * oom-reaped process; otherwise, return false.
>>> + */
>>> +static inline bool exclusive_folio_of_dying_process(struct folio *folio,
>>> +             struct vm_area_struct *vma)
>>> +{
>>> +     if (folio_maybe_mapped_shared(folio))
>>> +             return false;
>>> +
>>> +     if (!atomic_read(&vma->vm_mm->mm_users))
>>> +             return true;
>>> +     if (check_stable_address_space(vma->vm_mm))
>>> +             return true;
>>> +
>>> +     return false;
>>> +}
>>> +
>>>   /*
>>>    * Retrieve the first entry of a folio based on a provided entry within the
>>>    * folio. We cannot rely on folio->swap as there is no guarantee that it has
>>> diff --git a/mm/memory.c b/mm/memory.c
>>> index b9e8443aaa86..cab69275e473 100644
>>> --- a/mm/memory.c
>>> +++ b/mm/memory.c
>>> @@ -1515,7 +1515,14 @@ static __always_inline void zap_present_folio_ptes(struct mmu_gather *tlb,
>>>                                *force_flush = true;
>>>                        }
>>>                }
>>> -             if (pte_young(ptent) && likely(vma_has_recency(vma)))
>>> +
>>> +             /*
>>> +              * Skip marking exclusive file folios as accessed for processes that are
>>> +              * exiting or have been reaped due to OOM. This prevents unnecessary
>>> +              * promotion of folios that won't benefit the new process being launched.
>>> +              */
>>> +             if (!exclusive_folio_of_dying_process(folio, vma) && pte_young(ptent) &&
>>> +                             likely(vma_has_recency(vma)))
>>>                        folio_mark_accessed(folio);
>>>                rss[mm_counter(folio)] -= nr;
>>>        } else {
>>> --
>>> 2.39.3 (Apple Git-146)
>>
>>
>> --
>> Best Regards,
>> Yan, Zi
> 
> Thanks
> Barry
