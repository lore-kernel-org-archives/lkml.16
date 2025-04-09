Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8946522DFA2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744192205; cv=none; b=JOnZstPeSf8p1Dnd9rtAn+ssmUKI9lQT6ebg4kWeTjBz8XntH1vSwgbUpzYLPZMicWXSH5vclS/n1+WabojQuMDsK/HLQSLIZEuZQvYibi+KF88Jt6KgvHgFMfxLbsB9vn8eFYARi2Gzrm4a/qamAv0UaX7LUcZMj90BxRxFVnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744192205; c=relaxed/simple;
	bh=hVqtJeffgH2b8MnqixATFFg4ghegSRPLmWmRJv6WvA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRY4BRrX9G2sfnZuL8QWeNsY+ggtNffUKCOmRkBMqDE2D9JVgUZQObcKQoVQnaQzNMDprh/aEYf7bj4kJvGMwvYSgDBC0OgsDKhS53aGKq8nQ2giGwRay0PZxY5YP3K9cYY3QlH68joqi5aECjAOsgtDyXXB6YtTvCRfAfAReJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Ebs9lb/Y; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Ebs9lb/Y"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744192193; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=lXUcDKRxDV4X0iJjxRxdbiFSJvXNKAqKD9dZOYnRnxE=;
	b=Ebs9lb/YmvfwNc/tYCLFBerDsQA53d108yMQ0+UhOdmhrb/ufvKQvNd0POUFiuC+IaVugUIzG/zmat2ubxvfsV3nfuNXBTC8T40At4etzSCM4EmIXZecq6F+n07ua2/ty23puonnfQ52a2bLIT1X82n29OCBl641uFy0OyO1Tpg=
Received: from 30.74.144.109(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WWJc55q_1744192192 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Apr 2025 17:49:52 +0800
Message-ID: <0e294c56-d924-4d40-aa24-584235e8c923@linux.alibaba.com>
Date: Wed, 9 Apr 2025 17:49:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: huge_memory: add folio_mark_accessed() when zapping
 file THP
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: willy@infradead.org, hannes@cmpxchg.org, 21cnbao@gmail.com,
 ryan.roberts@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <fc117f60d7b686f87067f36a0ef7cdbc3a78109c.1744190345.git.baolin.wang@linux.alibaba.com>
 <39176ab9-33d5-4919-b368-2fd2467f08fe@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <39176ab9-33d5-4919-b368-2fd2467f08fe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/9 17:46, David Hildenbrand wrote:
> On 09.04.25 11:38, Baolin Wang wrote:
>> When investigating performance issues during file folio unmap, I 
>> noticed some
>> behavioral differences in handling non-PMD-sized folios and PMD-sized 
>> folios.
>> For non-PMD-sized file folios, it will call folio_mark_accessed() to 
>> mark the
>> folio as having seen activity, but this is not done for PMD-sized folios.
>>
>> This might not cause obvious issues, but a potential problem could be 
>> that,
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
>> ---
>> Changes from RFC:
>>   - Update the commit message, per Johannes.
>>   - Collect Acked tags from Johannes and Zi. Thanks.
>> ---
>>   mm/huge_memory.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 2a47682d1ab7..955781b4e946 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -2260,6 +2260,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct 
>> vm_area_struct *vma,
>>                   zap_deposited_table(tlb->mm, pmd);
>>               add_mm_counter(tlb->mm, mm_counter_file(folio),
>>                          -HPAGE_PMD_NR);
>> +
>> +            if (flush_needed && pmd_young(orig_pmd) &&
>> +                likely(vma_has_recency(vma)))
>> +                folio_mark_accessed(folio);
> 
> So the flush_needed check is really just a pmd_present() check. (the 
> latter would be clearer, but I don't mind)

Yes, we've already checked pmd_present() before, so I assume the 
flush_needed check is cheaper:)

> Acked-by: David Hildenbrand <david@redhat.com>

Thanks.
