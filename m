Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF661BD517
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743241623; cv=none; b=LCq2nhc4ClteUaokuvn6094xQH/FkwioYFYZRY+2lC4+VlwSEm/RrQoJMQKa4qiSu59egCmp0ooPSrUtkE9lRZa2eJgNAG5y3pTOdtkYmSdCttXdhW+VvHnjPWfXAYKH43/pxZF/5qj/gl0oMIBg+1pes3Wc88uzDAuTaGvGq9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743241623; c=relaxed/simple;
	bh=nAdeCiCNLGruzB4lhSr+T1Go6LuomMV55frkoilpjFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYz4/9oyQQVpQgGUktznAwknbiww0aJDDe8U8UEw5Fn2wIPxYRjabLuLdQPQfr35uvCS9utKh5G2spdpcpr12rcU+LkFEdZmemaWF+Wi/1XhyMPfqM7h0t43kvyMDlYaiXlPQh3WAYFlxIvT6RjA+CTj0A+hhenerPKF+G0v/ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61765152B;
	Sat, 29 Mar 2025 02:47:04 -0700 (PDT)
Received: from [10.57.87.112] (unknown [10.57.87.112])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB0943F694;
	Sat, 29 Mar 2025 02:46:57 -0700 (PDT)
Message-ID: <deedf5e2-4a25-4c1f-a5d8-a661a2eb16d2@arm.com>
Date: Sat, 29 Mar 2025 09:46:56 +0000
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
To: Mike Rapoport <rppt@kernel.org>, Dev Jain <dev.jain@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, gshan@redhat.com,
 steven.price@arm.com, suzuki.poulose@arm.com, tianyaxiong@kylinos.cn,
 ardb@kernel.org, david@redhat.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250328062103.79462-1-dev.jain@arm.com>
 <Z-cnmklGUojMzsUF@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z-cnmklGUojMzsUF@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2025 18:50, Mike Rapoport wrote:
> On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
> 
>                                                      for vmalloc mappings ^
> 
> arm64 does not allow changing permissions to any VA address right now.
> 
>> which does not support changing permissions for leaf mappings. This function
>> will change permissions until it encounters a leaf mapping, and will bail
>> out. To avoid this partial change, explicitly disallow changing permissions
>> for VM_ALLOW_HUGE_VMAP mappings.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>

I wonder if we want a Fixes: tag here? It's certainly a *latent* bug.

>> ---
>>  arch/arm64/mm/pageattr.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 39fd1f7ff02a..8337c88eec69 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>  	 * we are operating on does not result in such splitting.
>>  	 *
>>  	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
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
> 
> 
>>  	 * splitting is never needed.
>>  	 *
>>  	 * So check whether the [addr, addr + size) interval is entirely
>> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>  	area = find_vm_area((void *)addr);
>>  	if (!area ||
>>  	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
>> -	    !(area->flags & VM_ALLOC))
>> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>>  		return -EINVAL;
>>  
>>  	if (!numpages)
>> -- 
>> 2.30.2
>>
> 

