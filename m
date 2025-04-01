Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420761519B8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743503845; cv=none; b=c+wPC8+dPjptwozPnhdXWsHUpy5jHQd+LiGR0Y0YxiqENm8PmaXRMMX5Lz6RkMXgrvEWoFWuzLVjPqk109aHJ3oEpQSyloL1znYCJjTqi7WNQp8Q2f8CqIE+pw8Q6c1VlaEZc+VVNH8IvV2VCaq7zuuiaC+CstTl6oN1zmcHRrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743503845; c=relaxed/simple;
	bh=FfaUWthueKFEi5mRA8IYKrmTsZikQOgy+sHc/ewqIHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYsPaWrM5nSbARYhaxOtvh+r4oDmHl/DaXzctWy2gyR9BudAr0nIGdH2ovWe2n7YpGbJU0QQP9c6gaEhhEAwu7Xp7YpD2TSpI+LSSm66lSP85KXh/D/urz3851E6gU1xP/7jPERkvyN6p3Q/wn92Hor6tuqvqOE/TXocLGNAlOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 254E814BF;
	Tue,  1 Apr 2025 03:37:26 -0700 (PDT)
Received: from [10.1.28.189] (XHFQ2J9959.cambridge.arm.com [10.1.28.189])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7FF83F63F;
	Tue,  1 Apr 2025 03:37:20 -0700 (PDT)
Message-ID: <49f33b4e-ff2e-4d7c-827d-9395145ce0cf@arm.com>
Date: Tue, 1 Apr 2025 11:37:19 +0100
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
 <Z-jzouwNZwk8Ft-j@kernel.org> <0aac96b5-b3ac-47ee-97af-7ca5d927bdd0@arm.com>
 <Z-u8Cc7i_l0xM5TT@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z-u8Cc7i_l0xM5TT@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/04/2025 06:12, Mike Rapoport wrote:
> Hi Ryan,
> 
> On Tue, Apr 01, 2025 at 10:43:01AM +0100, Ryan Roberts wrote:
>> On 30/03/2025 03:32, Mike Rapoport wrote:
>>> On Sat, Mar 29, 2025 at 09:46:56AM +0000, Ryan Roberts wrote:
>>>> On 28/03/2025 18:50, Mike Rapoport wrote:
>>>>> On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
>>>>>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
>>>>>
>>>>>                                                      for vmalloc mappings ^
>>>>>
>>>>> arm64 does not allow changing permissions to any VA address right now.
>>>>>
>>>>>> which does not support changing permissions for leaf mappings. This function
>>>>>> will change permissions until it encounters a leaf mapping, and will bail
>>>>>> out. To avoid this partial change, explicitly disallow changing permissions
>>>>>> for VM_ALLOW_HUGE_VMAP mappings.
>>>>>>
>>>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>>
>>>> I wonder if we want a Fixes: tag here? It's certainly a *latent* bug.
>>>
>>> We have only a few places that use vmalloc_huge() or VM_ALLOW_HUGE_VMAP and
>>> if there was a code that plays permission games on these allocations, x86
>>> set_memory would blow up immediately, so I don't think Fixes: is needed
>>> here.
>>
>> Hi Mike,
>>
>> I think I may have misunderstood your comments when we spoke at LSF/MM the other
>> day, as this statement seems to contradict. I thought you said that on x86 BPF
>> allocates memory using vmalloc_huge()/VM_ALLOW_HUGE_VMAP and then it's
>> sub-allocator will set_memory_*() on a sub-region of that allocation? (And we
>> then agreed that it would be good for arm64 to eventually support this with BBML2).
> 
> I misremembered :)
> They do allocate several PMD_SIZE chunks at once, but they don't use
> vmalloc_huge(), so everything there is mapped with base pages.
> 
> And now they are using execmem rather than vmalloc directly, and execmem
> doesn't use VM_ALLOW_HUGE_VMAP anywhere except modules on x86.

Ahh OK! Like I said, I don't think it reduces the value of this patch though.

>  
>> Anyway, regardless, I think this change is useful first step to improving
>> vmalloc as it makes us more defensive against any future attempt to change
>> permissions on a huge allocation. In the long term I'd like to get to the point
>> where arm64 (with BBML2) can map with VM_ALLOW_HUGE_VMAP by default.
>>
>> Thanks,
>> Ryan
> 

