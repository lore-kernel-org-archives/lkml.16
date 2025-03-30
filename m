Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3318E22611
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743319908; cv=none; b=iSYm5JmYoCX4lpcOqkGDJfVJb1nYPA1qLTy7PLoAs4mt7rjQF10idmkEP/ObwLMFW0RnXsxSjlgy0/W7T3mK40A6+M9kJRKpy1qhc5vigpCzADSXMobWJJXu6A5+jhPxGuSx8q/NSGpHagfqfdFsGYL3J30hLJUJ1vxw9Mz5NCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743319908; c=relaxed/simple;
	bh=0P43/VJZizLB00/Wzp2FmSM07nhoI88bGgfM5SzNu7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLsWbrm+/dvkb2vo4WJ0bzQqsfpFNqnLDittYV4+AajJsvwyalY/Ze7Y/hfAyTYqwmuXJbRSriUBoFYwE31eOPms7afrL3NLoJbs67BwzBqE5vn78aO0WP1X/tDzbOmnzvSEx9CMwHhMveALXu/TBPRKUIM8XT1IxPeBCohh8gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 885AD1007;
	Sun, 30 Mar 2025 00:31:50 -0700 (PDT)
Received: from [10.163.71.186] (unknown [10.163.71.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 409C23F694;
	Sun, 30 Mar 2025 00:31:39 -0700 (PDT)
Message-ID: <a87edbcf-1bbb-4ae6-9549-685210b02f97@arm.com>
Date: Sun, 30 Mar 2025 13:01:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
To: Ryan Roberts <ryan.roberts@arm.com>, Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, gshan@redhat.com,
 steven.price@arm.com, suzuki.poulose@arm.com, tianyaxiong@kylinos.cn,
 ardb@kernel.org, david@redhat.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250328062103.79462-1-dev.jain@arm.com>
 <Z-cnmklGUojMzsUF@kernel.org> <deedf5e2-4a25-4c1f-a5d8-a661a2eb16d2@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <deedf5e2-4a25-4c1f-a5d8-a661a2eb16d2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/03/25 3:16 pm, Ryan Roberts wrote:
> On 28/03/2025 18:50, Mike Rapoport wrote:
>> On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
>>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
>>
>>                                                       for vmalloc mappings ^
>>
>> arm64 does not allow changing permissions to any VA address right now.
>>
>>> which does not support changing permissions for leaf mappings. This function
>>> will change permissions until it encounters a leaf mapping, and will bail
>>> out. To avoid this partial change, explicitly disallow changing permissions
>>> for VM_ALLOW_HUGE_VMAP mappings.
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> 
> I wonder if we want a Fixes: tag here? It's certainly a *latent* bug.

I am struggling to find the commit till which we want to backport. 
Should it be e920722 (arm64: support huge vmalloc mappings)?

> 
>>> ---
>>>   arch/arm64/mm/pageattr.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>>> index 39fd1f7ff02a..8337c88eec69 100644
>>> --- a/arch/arm64/mm/pageattr.c
>>> +++ b/arch/arm64/mm/pageattr.c
>>> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>>   	 * we are operating on does not result in such splitting.
>>>   	 *
>>>   	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
>>> -	 * Those are guaranteed to consist entirely of page mappings, and
>>> +	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
>>
>> I'd keep mention of page mappings in the comment, e.g
>>
>> 	* Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
>> 	* mappings are updated and splitting is never needed.
>>
>> With this and changelog updates Ryan asked for
>>
>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>
>>
>>>   	 * splitting is never needed.
>>>   	 *
>>>   	 * So check whether the [addr, addr + size) interval is entirely
>>> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>>   	area = find_vm_area((void *)addr);
>>>   	if (!area ||
>>>   	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
>>> -	    !(area->flags & VM_ALLOC))
>>> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>>>   		return -EINVAL;
>>>   
>>>   	if (!numpages)
>>> -- 
>>> 2.30.2
>>>
>>
> 

