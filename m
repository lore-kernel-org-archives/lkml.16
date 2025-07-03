Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FE7226CF8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535647; cv=none; b=LTcY8Z0GZAVStq7qQ3OaFDV8/9GB5iVSW7HDAscP9y1BpGo2rmMhQssSsglN6WnJBl5wAE3DbdCof62XnmXYoPLDOpYl4n3L5UVw1zEeD8K4iysJsumB6hQhJytUhUx+VjUMWAsHAzL6/S0JBt+28iihdCmQ2CKesQ0XQNsVq0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535647; c=relaxed/simple;
	bh=wgtiWB8hczNV4zv16jUfwZ8x5PwUJd9ZAn1/7IhQIRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cm+pQ9zMe+xV/e7YbLvxqG3pgctT+LDiUFNLcKJup/8qpMWIEYVH9MGudaVVVgGy6J35+y6Qhm/tDazkycr7i4gNgF3FQnhFqRTHBYkw8Lzi5oCanA9bTE/ukC0K6OfhAj0eAZStkah15cIJcnmW9d6PcKkdbW6nFSBy+m3o96Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEFE012FC;
	Thu,  3 Jul 2025 02:40:30 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72BFF3F58B;
	Thu,  3 Jul 2025 02:40:41 -0700 (PDT)
Message-ID: <474399c9-21cf-409c-883b-85b437979503@arm.com>
Date: Thu, 3 Jul 2025 15:10:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] khugepaged: Reduce race probability between migration
 and khugepaged
To: David Hildenbrand <david@redhat.com>, Dev Jain <dev.jain@arm.com>,
 akpm@linux-foundation.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250703054823.49149-1-dev.jain@arm.com>
 <1d82c930-be52-4983-9fd7-099df487eb48@redhat.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <1d82c930-be52-4983-9fd7-099df487eb48@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 03/07/25 2:55 PM, David Hildenbrand wrote:
> On 03.07.25 07:48, Dev Jain wrote:
>> Suppose a folio is under migration, and khugepaged is also trying to
>> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
>> page cache via filemap_lock_folio(), thus taking a reference on the folio
>> and sleeping on the folio lock, since the lock is held by the migration
>> path. Migration will then fail in
>> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
>> such a race happening (leading to migration failure) by bailing out
>> if we detect a PMD is marked with a migration entry.
>>
>> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
>>
>> Note that, this is not a "fix" since it only reduces the chance of
>> interference of khugepaged with migration, wherein both the kernel
>> functionalities are deemed "best-effort".
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>
>> v1->v2:
>>   - Remove SCAN_PMD_MIGRATION, merge into SCAN_PMD_MAPPED (David, Anshuman)
>>   - Add a comment (Lorenzo)
>>
>> v1:
>>   - https://lore.kernel.org/all/20250630044837.4675-1-dev.jain@arm.com/
>>
>>   mm/khugepaged.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 1aa7ca67c756..3fdefc4f4984 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -941,6 +941,15 @@ static inline int check_pmd_state(pmd_t *pmd)
>>         if (pmd_none(pmde))
>>           return SCAN_PMD_NONE;
>> +
>> +    /*
>> +     * The folio may be under migration when khugepaged is trying to
>> +     * collapse it. Migration success or failure will eventually end
>> +     * up with the PMD still pointing to a PMD-order folio, so return
>> +     * SCAN_PMD_MAPPED.
> 
> Nit: the last part (, so return ..) is obvious from the code.
> 
> I would have written
> 
> /*
>  * The folio may be under migration when khugepaged is trying to
>  * collapse it. Migration success or failure will eventually end
>  * up with a present PMD entry again.
>  */

+1

> 
> 
> Acked-by: David Hildenbrand <david@redhat.com>
>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
