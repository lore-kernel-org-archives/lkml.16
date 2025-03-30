Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C54EAD2F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 07:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743318744; cv=none; b=huw8rjVXNiX1AxZ6YtRcZ3rh4Kes09CTONetGyOihjtcHLSGwIHZzxJYpRmQnUKQAjIbO6iugv0AumwZ1G8Gyv/C8EYoUo01bbbAccHpDcQu7iMBHxl43wDAjDvWsTG3I3RB6oBRb6ITsb/x1fDJueo4az5ouTQCuE2TUQCDYEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743318744; c=relaxed/simple;
	bh=vXKKb/bU42BmcoWJJKaIuyGu64l5DR95H7AvkK0xd3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HvDaz5Jvp2+CCk9RFNP8pu2xksF0JC1jOU9lXBommr7QLhejvbpPZubjQYuujEm42praE0iculMShk9lmLA6rF/aE0DMrv+encoSrRVDp4N2Xsz2HvN4R4ljgYllqFweFeyGJiEamc9sJCTMb45Y45C9yIJ8hbR6/GwzbNQXZgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 514C51007;
	Sun, 30 Mar 2025 00:12:19 -0700 (PDT)
Received: from [10.163.43.124] (unknown [10.163.43.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E8293F694;
	Sun, 30 Mar 2025 00:12:09 -0700 (PDT)
Message-ID: <a1d70c0a-b792-4029-86ae-fec7fa76ce2e@arm.com>
Date: Sun, 30 Mar 2025 12:42:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: gshan@redhat.com, rppt@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, tianyaxiong@kylinos.cn, ardb@kernel.org,
 david@redhat.com, urezki@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250328062103.79462-1-dev.jain@arm.com>
 <54db9fe1-7115-476e-b838-80aa68aabe7e@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <54db9fe1-7115-476e-b838-80aa68aabe7e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/03/25 8:09 pm, Ryan Roberts wrote:
> On 28/03/2025 02:21, Dev Jain wrote:
>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
>> which does not support changing permissions for leaf mappings. This function
> 
> I think you mean "block" mappings here? A leaf mapping refers to a page table
> entry that maps a piece of memory at any level in the pgtable (i.e. a present
> entry that does not map a table).
> 
> A block mapping is an Arm ARM term used to mean a leaf mapping at a level other
> than the last level (e.g. pmd, pud). A page mapping is an Arm ARM term used to
> mean a leaf mapping at the last level (e.g. pte).
> 
>> will change permissions until it encounters a leaf mapping, and will bail
> 
> block mapping
> 
>> out. To avoid this partial change, explicitly disallow changing permissions
>> for VM_ALLOW_HUGE_VMAP mappings.
> 
> It will also emit a warning. Since there are no reports of this triggering, it
> implies that there are currently no cases of code doing a vmalloc_huge()
> followed by partial permission change, at least on arm64 (I'm told BPF does do
> this on x86 though). But this is a footgun waiting to go off, so let's detect it
> early and avoid the possibility of permissions in an intermediate state. (It
> might be worth wordsmithing this into the commit log).

Thanks, I will add this.

> 
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> 
> With the commit log fixed up:
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

Thanks!

> 
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
> 

