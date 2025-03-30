Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573DC1C32
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 07:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743318794; cv=none; b=pZJLHsBzNXxDyjQihHa+zYO3+dOCsnIozRPc6nbrHfRdt/PVePL/DGjWogsNanLE4SjnRnrIJVYAKyBOIzT+XP6HdEXnSmD4DsiltvxXITSR9SMOnJFN1OiGpn3lQzkKie0XXEiXbZGRtj9H8yLITcpmXHl3dbdHFl4XEBRke3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743318794; c=relaxed/simple;
	bh=kC5EuvQqPTPDTi2iHA7lYR1aDAdViGDeGegx1E2A1VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iaCbUjZtf/OVGTgx2koXw/atEvwhujCVFTKuY6vZdi2QAdObSx8bieFRmTzjxDNFYdeIkthjftLEDZogJpw7/En2g3YX20xNd9BG0igQyj8OXZRg7NWsZwL9YKWjWnJf3+cYzIuTf3LDfDPlMb/C9paXO/WKkDhRnuXp95CEgb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B43911007;
	Sun, 30 Mar 2025 00:13:14 -0700 (PDT)
Received: from [10.163.43.124] (unknown [10.163.43.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D89353F694;
	Sun, 30 Mar 2025 00:13:05 -0700 (PDT)
Message-ID: <fe35ef7f-9b3a-4de8-a006-120e2085e817@arm.com>
Date: Sun, 30 Mar 2025 12:43:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
To: Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, gshan@redhat.com,
 steven.price@arm.com, suzuki.poulose@arm.com, tianyaxiong@kylinos.cn,
 ardb@kernel.org, david@redhat.com, ryan.roberts@arm.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250328062103.79462-1-dev.jain@arm.com>
 <Z-cnmklGUojMzsUF@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <Z-cnmklGUojMzsUF@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/03/25 4:20 am, Mike Rapoport wrote:
> On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
> 
>                                                       for vmalloc mappings ^
> 
> arm64 does not allow changing permissions to any VA address right now.

Sorry, mistakenly used them interchangeably. I'll fix this.

> 
>> which does not support changing permissions for leaf mappings. This function
>> will change permissions until it encounters a leaf mapping, and will bail
>> out. To avoid this partial change, explicitly disallow changing permissions
>> for VM_ALLOW_HUGE_VMAP mappings.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/mm/pageattr.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 39fd1f7ff02a..8337c88eec69 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>   	 * we are operating on does not result in such splitting.
>>   	 *
>>   	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
>> -	 * Those are guaranteed to consist entirely of page mappings, and
>> +	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
> 
> I'd keep mention of page mappings in the comment, e.g
> 
> 	* Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> 	* mappings are updated and splitting is never needed.
> 
> With this and changelog updates Ryan asked for
> 
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks!

> 
> 
>>   	 * splitting is never needed.
>>   	 *
>>   	 * So check whether the [addr, addr + size) interval is entirely
>> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>   	area = find_vm_area((void *)addr);
>>   	if (!area ||
>>   	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
>> -	    !(area->flags & VM_ALLOC))
>> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>>   		return -EINVAL;
>>   
>>   	if (!numpages)
>> -- 
>> 2.30.2
>>
> 

