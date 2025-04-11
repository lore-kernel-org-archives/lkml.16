Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04002A94F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744333645; cv=none; b=PvzalzNVAP+UMPbruymNhBJ2Jl6KtoklC2R2vVYdolELm3nLodXa5OE4LPrSQtOw8OW80bQ4dcOdgPXzUqs/vd7B3lX6P0JWvJBTK33qLyeC1kd2tNEMKWJuHtzmGqa/XAnjUqA1fd8uid10c6nx78SEMcCGsPgoO6ZkoNqcY6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744333645; c=relaxed/simple;
	bh=uR4wGqR4166Ol+GIxxAIWd4jRzz6duAV9J4CkCy6U4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PU/TjvVpkvVhQDx1T7EmvxsI9uEF6xXGuCOJtyx4r/ONMfeoLEzJA7C3ThystcqMHdaFU1mBnWdcwwsSF7AQrHo+jnSu9PSNRy779g9NC8zu0/ySNekNdOeRqhmzjdIDCIWt7Gulo9usREvA6fu1l5kL0mO7ZIFMJNp5yyVrS8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=h3mwORr1; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="h3mwORr1"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744333638; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=gCQ6DzKnoO5vutwMKPVD3BAHxk5xZqVJHVeRC29A/NI=;
	b=h3mwORr1sbCtR+w7PByh5yQR/LstoGt0t2RxefUcx51W+NMq2jJaf6GQEhXHL9AGe8exUNo6pFCAlr3MKN9XZWPHJRCoJPF435JWsEdZDAvTWRSdQJTHtHLIdXVfl3ZsgByfSt6ORoMPt5x1DMbOrEbVWxo8jmDYgkKMHuzu1Gs=
Received: from 30.74.144.105(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WWQqSYz_1744333636 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 11 Apr 2025 09:07:17 +0800
Message-ID: <23fdc11d-e983-4627-89a8-79e9ecf9a45a@linux.alibaba.com>
Date: Fri, 11 Apr 2025 09:07:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: huge_memory: add folio_mark_accessed() when zapping
 file THP
To: Oscar Salvador <osalvador@suse.de>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com,
 hannes@cmpxchg.org, 21cnbao@gmail.com, ryan.roberts@arm.com, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <fc117f60d7b686f87067f36a0ef7cdbc3a78109c.1744190345.git.baolin.wang@linux.alibaba.com>
 <Z_eFPetk00AaFXem@localhost.localdomain>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <Z_eFPetk00AaFXem@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/4/10 16:45, Oscar Salvador wrote:
> On Wed, Apr 09, 2025 at 05:38:58PM +0800, Baolin Wang wrote:
>> When investigating performance issues during file folio unmap, I noticed some
>> behavioral differences in handling non-PMD-sized folios and PMD-sized folios.
>> For non-PMD-sized file folios, it will call folio_mark_accessed() to mark the
>> folio as having seen activity, but this is not done for PMD-sized folios.
>>
>> This might not cause obvious issues, but a potential problem could be that,
>> it might lead to reclaim hot file folios under memory pressure, as quoted
>> from Johannes:
>>
>> "
>> Sometimes file contents are only accessed through relatively short-lived
>> mappings. But they can nevertheless be accessed a lot and be hot. It's
>> important to not lose that information on unmap, and end up kicking out a
>> frequently used cache page.
>> "
>>
>> Therefore, we should also add folio_mark_accessed() for PMD-sized file
>> folios when unmapping.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
>> Acked-by: Zi Yan <ziy@nvidia.com>
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>

Thanks.

> Although I agree with David here that pmd_present would be more obvious than
> flush_needed.
> It was not obvious to be at first glance.

How about adding some comments to make it clear?

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index b3ade7ac5bbf..93abd1fcc4fb 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2263,6 +2263,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct 
vm_area_struct *vma,
                         add_mm_counter(tlb->mm, mm_counter_file(folio),
                                        -HPAGE_PMD_NR);

+                       /*
+                        * Use flush_needed to indicate whether the PMD 
entry is present,
+                        * instead of checking pmd_present() again.
+                        */
                         if (flush_needed && pmd_young(orig_pmd) &&
                             likely(vma_has_recency(vma)))
                                 folio_mark_accessed(folio);
