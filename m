Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1957A21D00A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882584; cv=none; b=HRGpp933SlAPPlorg5eirA2bYFGkObbZxIDI8V+X+x4VlEKniv+/772wOBistIFBehyOAO8pzwP9sWX44PT9Q32AJim5w0YLMusMcCDI5YpWlmen/vpfwBa+X4vMW9701e8x9UjAcqgUd4T8IdPMFGwYOd5mzT5oBAcDYCYmKgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882584; c=relaxed/simple;
	bh=dp6wcNgmC+/O9DlSETPF214n6u6nsyq4eNZepuIDczY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wr5cZmjdR8Z7N32wnIJNedX9h34qDx3JmbHIsRrQKMsIKe13Aog6Tk5MH8gquGabrfCEJiJ4UFJySe5lL1WSbdmzCuMa+5OUyIw95a2jZan6Ofp+UVprDZjlwYoSvkI0fbW5Z0Cw+0hqzs0KpdEjJTZs+c4igY+ea3J5fraEGuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [1.202.122.95])
	by gateway (Coremail) with SMTP id _____8BxlmlSm2toqXMjAQ--.10922S3;
	Mon, 07 Jul 2025 18:02:58 +0800 (CST)
Received: from [192.168.187.221] (unknown [1.202.122.95])
	by front1 (Coremail) with SMTP id qMiowJAxleRRm2toiqwMAA--.10442S2;
	Mon, 07 Jul 2025 18:02:57 +0800 (CST)
Message-ID: <d2097a44-bd1a-47b3-bf1a-d2b9d241fa5c@loongson.cn>
Date: Mon, 7 Jul 2025 18:02:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: Support mem=SIZE kernel parameter
To: Yanteng Si <si.yanteng@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
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
 <ac47ba40-0b5e-4273-af7a-a34086ae4a80@linux.dev>
Content-Language: en-US
From: Ming Wang <wangming01@loongson.cn>
In-Reply-To: <ac47ba40-0b5e-4273-af7a-a34086ae4a80@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxleRRm2toiqwMAA--.10442S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAgEQEmhrYYMFOgAAsf
X-Coremail-Antispam: 1Uk129KBj93XoW3XF13Cry8Aw4ruw47KFWxuFX_yoWxAr4UpF
	ykA3WYyrZ8GFn7uw1I9wn8Xryayw4rJ3W7Wr1UWF15Ar1YyF1IgF40qr1q9FyUWr4Iqr10
	qF1Utr9xZ3WDAFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUXVWUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082
	IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUciF4DUUUU

Hi Yanteng, Huacai,

在 2025/7/7 10:33, Yanteng Si 写道:
> 
> 在 7/3/25 9:36 AM, Ming Wang 写道:
>> Hi Yanteng,
>>
>> Thanks for reviewing the patch and for your insightful question.
>>
>> On 7/2/25 10:11, Yanteng Si wrote:
>>> 在 7/1/25 5:04 PM, Ming Wang 写道:
>>>> The LoongArch mem= parameter parser was previously limited to the
>>>> mem=SIZE@START format. This was inconvenient for the common use case
>>>> of simply capping the total system memory, as it forced users to
>>>> manually specify a start address. It was also inconsistent with the
>>>> behavior on other architectures.
>>>>
>>>> This patch enhances the parser in early_parse_mem() to also support the
>>>> more user-friendly mem=SIZE format. The implementation now checks for
>>>> the presence of the '@' symbol to determine the user's intent:
>>>>
>>>> - If mem=SIZE is provided (no '@'), the kernel now calls
>>>>    memblock_enforce_memory_limit(). This trims memory from the top down
>>>>    to the specified size.
>>>> - If mem=SIZE@START is used, the original behavior is retained for
>>>>    backward compatibility. This allows for defining specific memory
>>>>    banks.
>>>>
>>>> This change introduces an important usage rule reflected in the code's
>>>> comments: the mem=SIZE format should only be specified once on the
>>>> kernel command line. It acts as a single, global cap on total 
>>>> memory. In
>>>> contrast, the mem=SIZE@START format can be used multiple times to
>>>> define several distinct memory regions.
>>>>
>>>> Signed-off-by: Ming Wang <wangming01@loongson.cn>
>>>> ---
>>>>   arch/loongarch/kernel/setup.c | 18 ++++++++++--------
>>>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/ 
>>>> setup.c
>>>> index b99fbb388fe0..af59ba180dc2 100644
>>>> --- a/arch/loongarch/kernel/setup.c
>>>> +++ b/arch/loongarch/kernel/setup.c
>>>> @@ -191,6 +191,16 @@ static int __init early_parse_mem(char *p)
>>>>           return -EINVAL;
>>>>       }
>>>> +    start = 0;
>>>> +    size = memparse(p, &p);
>>>> +    if (*p == '@')    /* Every mem=... should contain '@' */
>>>> +        start = memparse(p + 1, &p);
>>>> +    else {            /* Only one mem=... is allowed if no '@' */
>>>> +        usermem = 1;
>>>> +        memblock_enforce_memory_limit(size);
>>>> +        return 0;
>>>> +    }
>>>> +
>>>>       /*
>>>>        * If a user specifies memory size, we
>>>>        * blow away any automatically generated
>>>> @@ -201,14 +211,6 @@ static int __init early_parse_mem(char *p)
>>>>           memblock_remove(memblock_start_of_DRAM(),
>>>>               memblock_end_of_DRAM() - memblock_start_of_DRAM());
>>>>       }
>>>> -    start = 0;
>>>> -    size = memparse(p, &p);
>>>> -    if (*p == '@')
>>>> -        start = memparse(p + 1, &p);
>>>> -    else {
>>>> -        pr_err("Invalid format!\n");
>>>> -        return -EINVAL;
>>>> -    }
>>> I don't understand. Isn't it better to modify the else{} directly here?
>>>
>> You've raised a very good point. The reason for moving the parsing 
>> logic to the top, rather than just modifying the original else block, 
>> is to handle the fundamentally different behaviors required for 
>> mem=SIZE versus mem=SIZE@START. The key lies in thisexisting block of 
>> code which handles the mem=SIZE@START case:
>>
>> ```
>> /*
>> * If a user specifies memory size, we
>> * blow away any automatically generated
>> * size.
>> */
>> if (usermem == 0) {
>>     usermem = 1;
>>     memblock_remove(memblock_start_of_DRAM(),
>>             memblock_end_of_DRAM() - memblock_start_of_DRAM());
>> }
>> ```
>>
>> This code is destructive. As the comment says, it "blows away" the 
>> entire memory map discovered from the firmware (UEFI/ACPI). After this 
>> call, memblock is essentially empty, waiting for new regions to be 
>> added via memblock_add(). This is the correct behavior for 
>> mem=SIZE@START.
>>
>> However, the new mem=SIZE functionality is meant to be non- 
>> destructive. It should take the existing firmware-provided memory map 
>> and simply trim it down to the desired size. The function 
>> memblock_enforce_memory_limit() is designed for this purpose—it 
>> operates on the current state of memblock.
>>
>> If we were to keep the parsing logic at the end and only modify the 
>> else block, the destructive memblock_remove() call would have already 
>> executed for both cases. By that point, calling 
>> memblock_enforce_memory_limit() would be meaningless, as there would 
>> be no memory regions left in memblock to limit.
>>
>> Therefore, the patch moves the parsing logic to the very beginning to 
>> create a clean separation:
>> 1. It first checks if the format is mem=SIZE (no '@').
>> 2. If it is, it performs the non-destructive limit on the intact 
>> memory map and returns immediately, completely bypassing the 
>> destructive memblock_remove() logic.
>> 3. If the format is mem=SIZE@START, it falls through to the original 
>> destructive path as before.
> 
> I have an idea: what if we move the destructive code into the if block?

@Yanteng,
That's an excellent suggestion. You are right. Moving the destructive 
memblock_remove() logic inside the if (*p == '@') block is indeed a much 
cleaner way to structure the code. It improves readability by making the 
logic for each case self-contained within a direct if/else structure.

@Huacai,
Yanteng proposed a great improvement to the patch structure.

```
static int __init early_parse_mem(char *p)
{
     // ...
     size = memparse(p, &p);
     if (*p == '@') {
         // Handle 'mem=SIZE@START'
         // The destructive memblock_remove() goes here.
         // ...
         // memblock_add_node()
     } else {
         // Handle 'mem=SIZE'
         // The non-destructive memblock_enforce_memory_limit() goes here.
     }
     return 0;
}
```

Before I send out a v2, I'd like to ask for your opinion on this 
proposed change as well. Do you agree that this revised structure is the 
better approach?

Best regards,
Ming

> 
> 
> Thanks,
> 
> Yanteng
> 
>>
>> I hope this explanation clarifies why the code structure was changed 
>> this way. It's crucial to ensure the non-destructive path is handled 
>> before any memory map information is lost.
>>
>> Best regards,
>> Ming
>>
>>
>>> Thanks,
>>> Yanteng
>>>
>>

