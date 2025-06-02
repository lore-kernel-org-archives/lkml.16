Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0402C3264
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 10:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748861237; cv=none; b=sQHvqZLbdyGb7CPMYGSwUiRW8hD7bchES7jZRAwQR4OcIre4V5LzqqCGFYiOnRy257b0OVTzLtgMxDjFw1MY2/S6jsR8AgR2T++29TVMdgNT1KINHVSAO1+TFJZENjrbiW22TppwcML/S1vKnBJC3ILV9uXjHmItuJZ9LKynfag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748861237; c=relaxed/simple;
	bh=8VZo6dWQreuY0sW8turtih50w0yeHdmq7rbdvJlQYpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJvIv0DTKhFk2IjcOnhCSe0ucQgB3xCorebhqq7cpGwveEaHUzFPEo5LlyOp1UqJTTihiRsPlKO3ihPnDxa51uSqVjTZe4wKWKGgZ9STvLsfhwzc7vMnZLHmTAmxzAVMm4N8k6s7SLKhdreImMuho3okZ1HUeOeDQr7oj8nxVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 684FB12FC;
	Mon,  2 Jun 2025 03:46:58 -0700 (PDT)
Received: from [10.57.95.206] (unknown [10.57.95.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 717153F673;
	Mon,  2 Jun 2025 03:47:13 -0700 (PDT)
Message-ID: <953c5369-ef91-4f86-924a-20f5788643fc@arm.com>
Date: Mon, 2 Jun 2025 11:47:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
 <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
 <2ab5f65c-b9dc-471c-9b61-70d765af285e@os.amperecomputing.com>
 <239d4e93-7ab6-4fc9-b907-7ca9d71f81fd@arm.com>
 <1141d96c-f785-48ee-a0f6-9ec658cc11c2@os.amperecomputing.com>
 <9cdb027c-27db-4195-825d-1d63bec1b69b@os.amperecomputing.com>
 <e3e6a3e0-3012-4d95-9236-4b4d57c7974c@arm.com>
 <0769dbcb-bd9e-4c36-b2c1-a624abaeb5ce@os.amperecomputing.com>
 <f31792bf-3b54-408c-9deb-7058a79c60d4@arm.com>
 <a27776ed-4b45-4269-9e3c-5ca1463e4841@os.amperecomputing.com>
 <bfae581e-3988-44b5-af5e-8e2de4db68ed@arm.com>
 <cc1522f8-85b9-48e5-951f-9a1bb2075918@os.amperecomputing.com>
 <e0960267-0dd5-412a-be54-1afaacc6bace@arm.com>
 <4b2278d8-d627-47af-ae90-9d62ad249c88@os.amperecomputing.com>
 <ca1673c4-1c8d-40d5-bc40-abc6489b2fdd@arm.com>
 <ce0ae0fd-3a9e-4cc2-8a60-f4ff434f3872@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ce0ae0fd-3a9e-4cc2-8a60-f4ff434f3872@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/05/2025 18:18, Yang Shi wrote:
> 
> 
> On 5/30/25 12:59 AM, Ryan Roberts wrote:
>> On 29/05/2025 21:52, Yang Shi wrote:
>>>>>>>>> The split_mapping() guarantees keep block mapping if it is fully
>>>>>>>>> contained in
>>>>>>>>> the range between start and end, this is my series's responsibility. I
>>>>>>>>> know
>>>>>>>>> the
>>>>>>>>> current code calls apply_to_page_range() to apply permission change and it
>>>>>>>>> just
>>>>>>>>> does it on PTE basis. So IIUC Dev's series will modify it or provide a new
>>>>>>>>> API,
>>>>>>>>> then __change_memory_common() will call it to change permission. There
>>>>>>>>> should be
>>>>>>>>> some overlap between mine and Dev's, but I don't see strong dependency.
>>>>>>>> But if you have a block mapping in the region you are calling
>>>>>>>> __change_memory_common() on, today that will fail because it can only
>>>>>>>> handle
>>>>>>>> page mappings.
>>>>>>> IMHO letting __change_memory_common() manipulate on contiguous address
>>>>>>> range is
>>>>>>> another story and should be not a part of the split primitive.
>>>>>> I 100% agree that it should not be part of the split primitive.
>>>>>>
>>>>>> But your series *depends* upon __change_memory_common() being able to change
>>>>>> permissions on block mappings. Today it can only change permissions on page
>>>>>> mappings.
>>>>> I don't think split primitive depends on it. Changing permission on block
>>>>> mappings is just the user of the new split primitive IMHO. We just have no
>>>>> real
>>>>> user right now.
>>>> But your series introduces a real user; after your series, the linear map is
>>>> block mapped.
>>> The users of the split primitive are the permission changers, for example,
>>> module, bpf, secret mem, etc.
>> Ahh, perhaps this is the crux of our misunderstanding... In my model, the split
>> primitive is called from __change_memory_common() (or from other appropriate
>> functions in pageattr.c). It's an implementation detail for arm64 and is not
>> exposed to common code. arm64 knows that it can split live mappings in a
>> transparent way so it uses huge pages eagerly and splits on demand.
>>
>> I personally wouldn't want to be relying on the memory user knowing it needs to
>> split the mappings...
> 
> We are actually on the same page...
> 
> For example, when loading module, kernel currently does:
> 
> vmalloc() // Allocate memory for module
> module_enable_text_rox() // change permission to ROX for text section
>     set_memory_x
>         change_memory_common
>             for every page in the vmalloc area
>                 __change_memory_common(addr, PAGE_SIZE, ...) // page basis
>                     split_mapping(addr, addr + PAGE_SIZE)
>                     apply_to_page_range() // apply the new permission
> 
> __change_memory_common() has to be called on page basis because we don't know
> whether the pages for the vmalloc area are contiguous or not. So the split
> primitive is called on page basis.

Yes that makes sense for the case where we are setting permissions on a
virtually contiguous region of vmalloc space; in that case we must set
permissions on the linear map page-by-page. Agreed.

I was thinking of the cases where we are changing the permissions on a virtually
contiguous region of the *linear map*. Although looking again at the code, it
seems there aren't as many places as I thought that actually do this. I think
set_direct_map_valid_noflush() is the only one that will operate on multiple
pages of the linear map at a time. But this single case means that you could end
up wanting to change permissions on a large block mapping and therefore need
Dev's work, right?

Thanks,
Ryan

> 
> 
> So we need do the below in order to keep large mapping:
> check whether the vmalloc area is huge mapped (PMD/CONT PMD/CONT PTE) or not
> if (it is huge mapped)
>     __change_memory_common(addr, HUGE_SIZE, ...)
>         split_mapping(addr, addr + HUGE_SIZE)
>         change permission on (addr, addr + HUGE_SIZE)
> else
>     fallback to page basis
> 
> 
> To have huge mapping for vmalloc, we need use vmalloc_huge() or the new
> implementation proposed by you to allocate memory for module in the first place.
> This is the "user" in my understanding.
> 
> Thanks,
> Yang
> 
> 

