Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577EB1876
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 08:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743323049; cv=none; b=SMTcfcLJ0MQDV9eUJqQ94fXCQxQNBhYkGAoIHddiymFna2hIFgXu2ISeOhexrMrhwWi6dKwzhLaXkz03mt+QG7ihA7Wjo/5DgstBnOZQlZhbPmRoO98ylXyIwCNYQUjoP0QnycrhUmX6knVlgCc0Cu4cAX/cgwGoHGT3d8P7/PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743323049; c=relaxed/simple;
	bh=wNpSnTx1uthNa4zv1wPW7CS1MiE98Goqy3/HNwAz6xM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2LxKRBKW0YVyUlTY4UaSu96oMSsvQjHyrIzqJGwQG63XhT+1DCJjt4S2316v3/XM2Iek/e6oxnL85NTFBQiOBs8tSAM3b3FcYpQj3Yt044FBHegCkGOBmJnVRWn+HRGBgtbINR1ASeNgLiQ6waxbg4hNXL7qQSq2NTruw+w0GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A7611007;
	Sun, 30 Mar 2025 01:24:09 -0700 (PDT)
Received: from [10.163.43.149] (unknown [10.163.43.149])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B252B3F58B;
	Sun, 30 Mar 2025 01:24:00 -0700 (PDT)
Message-ID: <b7be0b9c-89fa-470d-8f6d-7db6282b3c68@arm.com>
Date: Sun, 30 Mar 2025 13:53:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
To: Mike Rapoport <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, gshan@redhat.com,
 steven.price@arm.com, suzuki.poulose@arm.com, tianyaxiong@kylinos.cn,
 ardb@kernel.org, david@redhat.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250328062103.79462-1-dev.jain@arm.com>
 <Z-cnmklGUojMzsUF@kernel.org> <deedf5e2-4a25-4c1f-a5d8-a661a2eb16d2@arm.com>
 <Z-jzouwNZwk8Ft-j@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <Z-jzouwNZwk8Ft-j@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/03/25 1:02 pm, Mike Rapoport wrote:
> On Sat, Mar 29, 2025 at 09:46:56AM +0000, Ryan Roberts wrote:
>> On 28/03/2025 18:50, Mike Rapoport wrote:
>>> On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
>>>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
>>>
>>>                                                       for vmalloc mappings ^
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

But I think x86 can handle this (split_large_page() in 
__change_page_attr()) ?

>   
>>>> ---
>>>>   arch/arm64/mm/pageattr.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>>>> index 39fd1f7ff02a..8337c88eec69 100644
>>>> --- a/arch/arm64/mm/pageattr.c
>>>> +++ b/arch/arm64/mm/pageattr.c
>>>> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>>>   	 * we are operating on does not result in such splitting.
>>>>   	 *
>>>>   	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
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
>>>>   	 * splitting is never needed.
>>>>   	 *
>>>>   	 * So check whether the [addr, addr + size) interval is entirely
>>>> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>>>   	area = find_vm_area((void *)addr);
>>>>   	if (!area ||
>>>>   	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
>>>> -	    !(area->flags & VM_ALLOC))
>>>> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>>>>   		return -EINVAL;
>>>>   
>>>>   	if (!numpages)
>>>> -- 
>>>> 2.30.2
>>>>
>>>
>>
> 

