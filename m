Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860E01EE02F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500587; cv=none; b=DEDi3emX2r1FrE8tDzo7U7jvPJUIpg8hANM6T2ZZtCa5Tt8wsvybd9iTu0POHZxmoAnEaS/JLYPEsHY6xHgRZo6f7FSsXR+w6IXIrKRV+kb1eOKtcwCMwzRe2iojKjvSTZvIw57GlURY2yqvjnNmW3jvqpkP011WylJnbtNHqj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500587; c=relaxed/simple;
	bh=SFKT1LUhXXpKztITCunJg4oAIbGQyKtSVB0Ms0x9Rhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzhB9ke0jpmUdMEn1/EPe3YDXe0COqFtSSTU6oXjlC5fXYtXpxHQwjXmz1jo0Ze2NznhmfXCR8YG9Y/TAoxUs1RrB+yn+i+fWzdH5Cg6PWuErk7glLdt90Jlgmu21P+DdVM7RmGLriUIekJinM1/paKz4ffWEhD87ufR+ncCQok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17D5A14BF;
	Tue,  1 Apr 2025 02:43:08 -0700 (PDT)
Received: from [10.1.28.189] (XHFQ2J9959.cambridge.arm.com [10.1.28.189])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9F923F694;
	Tue,  1 Apr 2025 02:43:02 -0700 (PDT)
Message-ID: <0aac96b5-b3ac-47ee-97af-7ca5d927bdd0@arm.com>
Date: Tue, 1 Apr 2025 10:43:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Content-Language: en-GB
To: Mike Rapoport <rppt@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org,
 gshan@redhat.com, steven.price@arm.com, suzuki.poulose@arm.com,
 tianyaxiong@kylinos.cn, ardb@kernel.org, david@redhat.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250328062103.79462-1-dev.jain@arm.com>
 <Z-cnmklGUojMzsUF@kernel.org> <deedf5e2-4a25-4c1f-a5d8-a661a2eb16d2@arm.com>
 <Z-jzouwNZwk8Ft-j@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z-jzouwNZwk8Ft-j@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/03/2025 03:32, Mike Rapoport wrote:
> On Sat, Mar 29, 2025 at 09:46:56AM +0000, Ryan Roberts wrote:
>> On 28/03/2025 18:50, Mike Rapoport wrote:
>>> On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
>>>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
>>>
>>>                                                      for vmalloc mappings ^
>>>
>>> arm64 does not allow changing permissions to any VA address right now.
>>>
>>>> which does not support changing permissions for leaf mappings. This function
>>>> will change permissions until it encounters a leaf mapping, and will bail
>>>> out. To avoid this partial change, explicitly disallow changing permissions
>>>> for VM_ALLOW_HUGE_VMAP mappings.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>
>> I wonder if we want a Fixes: tag here? It's certainly a *latent* bug.
> 
> We have only a few places that use vmalloc_huge() or VM_ALLOW_HUGE_VMAP and
> if there was a code that plays permission games on these allocations, x86
> set_memory would blow up immediately, so I don't think Fixes: is needed
> here.

Hi Mike,

I think I may have misunderstood your comments when we spoke at LSF/MM the other
day, as this statement seems to contradict. I thought you said that on x86 BPF
allocates memory using vmalloc_huge()/VM_ALLOW_HUGE_VMAP and then it's
sub-allocator will set_memory_*() on a sub-region of that allocation? (And we
then agreed that it would be good for arm64 to eventually support this with BBML2).

Anyway, regardless, I think this change is useful first step to improving
vmalloc as it makes us more defensive against any future attempt to change
permissions on a huge allocation. In the long term I'd like to get to the point
where arm64 (with BBML2) can map with VM_ALLOW_HUGE_VMAP by default.

Thanks,
Ryan


>  
>>>> ---
>>>>  arch/arm64/mm/pageattr.c | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>>>> index 39fd1f7ff02a..8337c88eec69 100644
>>>> --- a/arch/arm64/mm/pageattr.c
>>>> +++ b/arch/arm64/mm/pageattr.c
>>>> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>>>  	 * we are operating on does not result in such splitting.
>>>>  	 *
>>>>  	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
>>>> -	 * Those are guaranteed to consist entirely of page mappings, and
>>>> +	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
>>>
>>> I'd keep mention of page mappings in the comment, e.g
>>>
>>> 	* Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
>>> 	* mappings are updated and splitting is never needed.
>>>
>>> With this and changelog updates Ryan asked for
>>>
>>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>>
>>>
>>>>  	 * splitting is never needed.
>>>>  	 *
>>>>  	 * So check whether the [addr, addr + size) interval is entirely
>>>> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>>>  	area = find_vm_area((void *)addr);
>>>>  	if (!area ||
>>>>  	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
>>>> -	    !(area->flags & VM_ALLOC))
>>>> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>>>>  		return -EINVAL;
>>>>  
>>>>  	if (!numpages)
>>>> -- 
>>>> 2.30.2
>>>>
>>>
>>
> 

