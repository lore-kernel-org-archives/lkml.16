Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C108E17D7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 02:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855659; cv=none; b=m1orXM7inu8/PFSt7EMncGTzEN7ktkJO9/+MusVswwpCxEfu+XBmoSYzcl6oK2nIThWL7iKIwxmm1WRQo++FP1AjQLbAlEWQm6upggrXomCyiIL/VztW7hl5Avh701jJwkqlypAkegxOktEC0r6ZVqY3JZfVzsFPzHsCcNkENQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855659; c=relaxed/simple;
	bh=nVWtJ2pwpgHwfEVgi3VsH5d4JHY4Z3H2osyztStCp4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+jjW7iHyOjCeaqB9s8oSOrkPdHOOgES34Yw8NVKQaCq8CZoSA40Ckm9QXW2Uvs+/1qIj3rPQV608YsVdqOs3vgwRwCdv3x5i1wJMeXNDYMcLu371ltquoFMQ7jsmARNEzor0XiGuGsQLoHBwZr2kKRitl/YOM6XeZMxu6CNudc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KC3qIZyb; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KC3qIZyb"
Message-ID: <ac47ba40-0b5e-4273-af7a-a34086ae4a80@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751855644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVWtJ2pwpgHwfEVgi3VsH5d4JHY4Z3H2osyztStCp4Y=;
	b=KC3qIZybjr7t2gHu6+oHYKLSbVc0J/VxAjWOmRMPaYQXYpxqRy04NDl0FWLGWM5ZkDm++D
	OPAt0sBnrl7xKZXGcC2cmXgX0Nt6ZoWeRuaZPIWhWcLlTAaAu8DyynrwOOmnmfhtjqY6kj
	2HwGvemc75GIWp6LPQKpIv4QnmUjF/U=
Date: Mon, 7 Jul 2025 10:33:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] LoongArch: Support mem=SIZE kernel parameter
To: Ming Wang <wangming01@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>,
 Bibo Mao <maobibo@loongson.cn>, Hari Bathini <hbathini@linux.ibm.com>,
 Guo Weikang <guoweikang.kernel@gmail.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Usama Arif
 <usamaarif642@gmail.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: lixuefeng@loongson.cn, chenhuacai@loongson.cn, gaojuxin@loongson.cn
References: <20250701090449.2426151-1-wangming01@loongson.cn>
 <0561da2c-a4d7-49bb-8394-930f10880610@linux.dev>
 <e89f6ce6-d9f4-4744-b6a6-9a82412795a0@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <e89f6ce6-d9f4-4744-b6a6-9a82412795a0@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 7/3/25 9:36 AM, Ming Wang 写道:
> Hi Yanteng,
>
> Thanks for reviewing the patch and for your insightful question.
>
> On 7/2/25 10:11, Yanteng Si wrote:
>> 在 7/1/25 5:04 PM, Ming Wang 写道:
>>> The LoongArch mem= parameter parser was previously limited to the
>>> mem=SIZE@START format. This was inconvenient for the common use case
>>> of simply capping the total system memory, as it forced users to
>>> manually specify a start address. It was also inconsistent with the
>>> behavior on other architectures.
>>>
>>> This patch enhances the parser in early_parse_mem() to also support the
>>> more user-friendly mem=SIZE format. The implementation now checks for
>>> the presence of the '@' symbol to determine the user's intent:
>>>
>>> - If mem=SIZE is provided (no '@'), the kernel now calls
>>>    memblock_enforce_memory_limit(). This trims memory from the top down
>>>    to the specified size.
>>> - If mem=SIZE@START is used, the original behavior is retained for
>>>    backward compatibility. This allows for defining specific memory
>>>    banks.
>>>
>>> This change introduces an important usage rule reflected in the code's
>>> comments: the mem=SIZE format should only be specified once on the
>>> kernel command line. It acts as a single, global cap on total memory. In
>>> contrast, the mem=SIZE@START format can be used multiple times to
>>> define several distinct memory regions.
>>>
>>> Signed-off-by: Ming Wang <wangming01@loongson.cn>
>>> ---
>>>   arch/loongarch/kernel/setup.c | 18 ++++++++++--------
>>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/ setup.c
>>> index b99fbb388fe0..af59ba180dc2 100644
>>> --- a/arch/loongarch/kernel/setup.c
>>> +++ b/arch/loongarch/kernel/setup.c
>>> @@ -191,6 +191,16 @@ static int __init early_parse_mem(char *p)
>>>           return -EINVAL;
>>>       }
>>> +    start = 0;
>>> +    size = memparse(p, &p);
>>> +    if (*p == '@')    /* Every mem=... should contain '@' */
>>> +        start = memparse(p + 1, &p);
>>> +    else {            /* Only one mem=... is allowed if no '@' */
>>> +        usermem = 1;
>>> +        memblock_enforce_memory_limit(size);
>>> +        return 0;
>>> +    }
>>> +
>>>       /*
>>>        * If a user specifies memory size, we
>>>        * blow away any automatically generated
>>> @@ -201,14 +211,6 @@ static int __init early_parse_mem(char *p)
>>>           memblock_remove(memblock_start_of_DRAM(),
>>>               memblock_end_of_DRAM() - memblock_start_of_DRAM());
>>>       }
>>> -    start = 0;
>>> -    size = memparse(p, &p);
>>> -    if (*p == '@')
>>> -        start = memparse(p + 1, &p);
>>> -    else {
>>> -        pr_err("Invalid format!\n");
>>> -        return -EINVAL;
>>> -    }
>> I don't understand. Isn't it better to modify the else{} directly here?
>>
> You've raised a very good point. The reason for moving the parsing logic to the top, rather than just modifying the original else block, is to handle the fundamentally different behaviors required for mem=SIZE versus mem=SIZE@START. The key lies in thisexisting block of code which handles the mem=SIZE@START case:
>
> ```
> /*
> * If a user specifies memory size, we
> * blow away any automatically generated
> * size.
> */
> if (usermem == 0) {
>     usermem = 1;
>     memblock_remove(memblock_start_of_DRAM(),
>             memblock_end_of_DRAM() - memblock_start_of_DRAM());
> }
> ```
>
> This code is destructive. As the comment says, it "blows away" the entire memory map discovered from the firmware (UEFI/ACPI). After this call, memblock is essentially empty, waiting for new regions to be added via memblock_add(). This is the correct behavior for mem=SIZE@START.
>
> However, the new mem=SIZE functionality is meant to be non-destructive. It should take the existing firmware-provided memory map and simply trim it down to the desired size. The function memblock_enforce_memory_limit() is designed for this purpose—it operates on the current state of memblock.
>
> If we were to keep the parsing logic at the end and only modify the else block, the destructive memblock_remove() call would have already executed for both cases. By that point, calling memblock_enforce_memory_limit() would be meaningless, as there would be no memory regions left in memblock to limit.
>
> Therefore, the patch moves the parsing logic to the very beginning to create a clean separation:
> 1. It first checks if the format is mem=SIZE (no '@').
> 2. If it is, it performs the non-destructive limit on the intact memory map and returns immediately, completely bypassing the destructive memblock_remove() logic.
> 3. If the format is mem=SIZE@START, it falls through to the original destructive path as before.

I have an idea: what if we move the destructive code into the if block?


Thanks,

Yanteng

>
> I hope this explanation clarifies why the code structure was changed this way. It's crucial to ensure the non-destructive path is handled before any memory map information is lost.
>
> Best regards,
> Ming
>
>
>> Thanks,
>> Yanteng
>>
>
