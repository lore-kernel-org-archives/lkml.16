Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56C228DF12
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638534; cv=none; b=VGf0h08gIh5rcIsRApMNSYf+tw36hSDJ7BYHth9x0GFb2ht2OgdgVi3HvtEkvnjPNzeUBfG70nE3lNJ6TDWJWBQ/ezwtPV/346KfbMEx5/M7641lcWDcEkXmFR2KWCVuCzgtwmsjp9ZtePnRkQoX4dsjbs3nmiMfdBDuCon88Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638534; c=relaxed/simple;
	bh=fozMOTP9xrcULyM4nzvSabdJgZDpYsQyKpmyyFskw6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGOV6p+fovH1OnuQBUH1V05si25JUgQfSaeKSAypO4AXcV92WlQzDbaqd/1+rfz27b5c3xZeRSoVoC8aKWXLTBbI2cCvZ5O2VTxDlMAigT+dMIuqBqRFDcf9tj73zQ8RDtWrZQx+7w1a4dkvqWfhXQNLI54nLxLDoY69OnjOJqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACBB51007;
	Mon, 14 Apr 2025 06:48:49 -0700 (PDT)
Received: from [10.57.86.225] (unknown [10.57.86.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 107F43F66E;
	Mon, 14 Apr 2025 06:48:48 -0700 (PDT)
Message-ID: <6cd5a4ef-5835-41db-8282-4b022df7c953@arm.com>
Date: Mon, 14 Apr 2025 14:48:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, Dev Jain <dev.jain@arm.com>,
 catalin.marinas@arm.com, will@kernel.org
Cc: gshan@redhat.com, rppt@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, tianyaxiong@kylinos.cn, ardb@kernel.org,
 urezki@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250403052844.61818-1-dev.jain@arm.com>
 <75884033-9474-4d0c-b737-d9b6aebe298b@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <75884033-9474-4d0c-b737-d9b6aebe298b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/04/2025 13:57, David Hildenbrand wrote:
> On 03.04.25 07:28, Dev Jain wrote:
>> arm64 uses apply_to_page_range to change permissions for kernel vmalloc mappings,
>> which does not support changing permissions for block mappings. This function
>> will change permissions until it encounters a block mapping, and will bail
>> out with a warning. Since there are no reports of this triggering, it
>> implies that there are currently no cases of code doing a vmalloc_huge()
>> followed by partial permission change. But this is a footgun waiting to
>> go off, so let's detect it early and avoid the possibility of permissions
>> in an intermediate state. So,  explicitly disallow changing permissions
>> for VM_ALLOW_HUGE_VMAP mappings.
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>> v1->v2:
>>   - Improve changelog, keep mention of page mappings in comment
>>
>>   arch/arm64/mm/pageattr.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 39fd1f7ff02a..04d4a8f676db 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -96,8 +96,8 @@ static int change_memory_common(unsigned long addr, int
>> numpages,
>>        * we are operating on does not result in such splitting.
>>        *
>>        * Let's restrict ourselves to mappings created by vmalloc (or vmap).
>> -     * Those are guaranteed to consist entirely of page mappings, and
>> -     * splitting is never needed.
>> +     * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
>> +     * mappings are updated and splitting is never needed.
>>        *
>>        * So check whether the [addr, addr + size) interval is entirely
>>        * covered by precisely one VM area that has the VM_ALLOC flag set.
>> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int
>> numpages,
>>       area = find_vm_area((void *)addr);
>>       if (!area ||
>>           end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
>> -        !(area->flags & VM_ALLOC))
>> +        ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>>           return -EINVAL;
>>         if (!numpages)
> 
> Makes sense to me. Whenever required, we can improve the checks (or even try
> supporting splitting).

Yes that's the plan; I'd like to get to the point where we can do huge vmalloc
mappings by default on systems that support BBML2, then split mappings when needed.


> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 

