Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F60B847B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692376; cv=none; b=DLyAXiweIi9Kbui6CdcD7aYrPy6/Zimw9pniPj5T6Me1dhl3kjEUdXMSf7WUKaxMm/ZPeik5SWyCr62AvldM90uv45l4UEm03r+58EvRClbwA5H+0unene+yMKKjgHg+yNXr13yT2GqGnD5ORIVa0BMckUnTSNBCdgAYgzSjO3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692376; c=relaxed/simple;
	bh=12dIK4IDDxkHymWycq4Ktg9zaxgm1LEYEl5ko1Z6VGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmFotcG4g8FFVP7ZZCBbR3h+WIG4wtwoUTvBXs4B9/yHEZ3inVtx/CToOImEPJl4Lamz0k8409m22Ij/0fRt2CSfXlg37eZgkBR060GUVfAiVF5FSO8bwW2Wh7HUxawFyH+PElceV6Cmniup0Hp+LBarmYQnWnKEl8tK7ai5uLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ljxM02K0; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ljxM02K0"
Message-ID: <b1508b89-69fe-4d92-9854-5787186de603@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749692368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fDaLoebKXYq1dhWh0U4LSCfiXioc71GWbSJENfRMRds=;
	b=ljxM02K01UuAJs38k0Uj76PvRaegxhg+IoFOPX7g5cdn2lv8wy7HbvFZNTYpQlHIbKTywn
	TfibyxnagfDXkXUhocJ3w5iUj67ZpqapaQZY6XfVcs0tP8kofRXslDVVmqudq9/zHTJR1d
	7uifdhIuKTKINZXxppt+VsC3TJrnBNQ=
Date: Thu, 12 Jun 2025 09:38:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mm/alloc_tag: add the ARCH_NEEDS_WEAK_PER_CPU macro when
 statically defining the percpu variable alloc_tag_counters.
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Hao Ge <gehao@kylinos.cn>
References: <20250529073537.563107-1-hao.ge@linux.dev>
 <177e1f6b-50f0-4c0a-bb0b-514283e009a2@linux.dev>
 <CAJuCfpE9Y6iMt5sDd+NUuXAeqXiQXaYZOobGDvi7LYRqm=7-KA@mail.gmail.com>
 <b132dd1f-984b-452e-b19b-18cdecb2842a@linux.dev>
 <CAJuCfpGueFFKwyhG6Lz44dtJOZbicFoB5S=44GV_oyLUn8oQtA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <CAJuCfpGueFFKwyhG6Lz44dtJOZbicFoB5S=44GV_oyLUn8oQtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 2025/6/11 23:24, Suren Baghdasaryan wrote:
> On Tue, Jun 10, 2025 at 10:27 PM Hao Ge <hao.ge@linux.dev> wrote:
>>
>> On 2025/6/10 00:39, Suren Baghdasaryan wrote:
>>> On Sun, Jun 8, 2025 at 11:08 PM Hao Ge <hao.ge@linux.dev> wrote:
>>>> On 2025/5/29 15:35, Hao Ge wrote:
>>>>> From: Hao Ge <gehao@kylinos.cn>
>>>>>
>>>>> Recently discovered this entry while checking kallsyms on ARM64:
>>>>> ffff800083e509c0 D _shared_alloc_tag
>>>>>
>>>>> If ARCH_NEEDS_WEAK_PER_CPU is not defined,there's no need to statically
>>>>> define the percpu variable alloc_tag_counters.
>>>>>
>>>>> Therefore,add therelevant macro guards at the appropriate location.
>>>>>
>>>>> Fixes: 22d407b164ff ("lib: add allocation tagging support for memory allocation profiling")
>>>>> Signed-off-by: Hao Ge <gehao@kylinos.cn>
>>>>> ---
>>>>>     lib/alloc_tag.c | 2 ++
>>>>>     1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
>>>>> index c7f602fa7b23..d1dab80b70ad 100644
>>>>> --- a/lib/alloc_tag.c
>>>>> +++ b/lib/alloc_tag.c
>>>>> @@ -24,8 +24,10 @@ static bool mem_profiling_support;
>>>>>
>>>>>     static struct codetag_type *alloc_tag_cttype;
>>>>>
>>>>> +#ifdef ARCH_NEEDS_WEAK_PER_CPU
>>>>>     DEFINE_PER_CPU(struct alloc_tag_counters, _shared_alloc_tag);
>>>>>     EXPORT_SYMBOL(_shared_alloc_tag);
>>>>> +#endif /* ARCH_NEEDS_WEAK_PER_CPU */
>>>>>
>>>>>     DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
>>>>>                         mem_alloc_profiling_key);
>>>> Hi Suren
>>>>
>>>>
>>>> I'm sorry to bother you. As mentioned in my commit message,
>>>>
>>>> in fact, on the ARM64 architecture, the _shared_alloc_tag percpu
>>>> variable is not needed.
>>>>
>>>> In my understanding, it will create a copy for each CPU.
>>>>
>>>>     The alloc_tag_counters variable will occupy 16 bytes,
>>>>
>>>> and as the number of CPUs increases, more and more memory will be wasted
>>>> in this segment.
>>>>
>>>> I realized that this modification was a mistake. It resulted in a build
>>>> error, and the link is as follows:
>>>>
>>>> https://lore.kernel.org/all/202506080448.KWN8arrX-lkp@intel.com/
>>>>
>>>> After I studied the comments of DECLARE_PER_CPU_SECTION, I roughly
>>>> understood why this is the case.
>>>>
>>>> But so far, I haven't come up with a good way to solve this problem. Do
>>>> you have any suggestions?
>>> Hi Hao,
>>> The problem here is that ARCH_NEEDS_WEAK_PER_CPU is not a Kconfig
>>> option, it gets defined only on 2 architectures and only when building
>>> modules here https://elixir.bootlin.com/linux/v6.15.1/source/arch/alpha/include/asm/percpu.h#L14
>>> and here https://elixir.bootlin.com/linux/v6.15.1/source/arch/s390/include/asm/percpu.h#L21.
>>> A nicer way to deal with that is to make if a Kconfig option which is
>>> enabled only for alpha and s390 and then do something like this:
>>>
>>>    #if defined(MODULE) && defined(ARCH_NEEDS_WEAK_PER_CPU)
>>> #define MODULE_NEEDS_WEAK_PER_CPU
>>> #endif
>>>
>>> and change all the usages of ARCH_NEEDS_WEAK_PER_CPU with
>>> MODULE_NEEDS_WEAK_PER_CPU.
>>> Did I explain the idea clearly?
>>> Thanks,
>>> Suren.
>>>
>> Hi Suren
> Hi Hao,
>
>> Thanks for your guidance.
>> I understand this train of thought.
>>
>> I've been thinking about a problem: I only added the
>> ARCH_NEEDS_WEAK_PER_CPU
>>
>> macro to isolate the definition of _shared_alloc_tag.
>>
>> Since s390 defines this macro, why did this build error occur?
Hi Suren
> The problem is that ARCH_NEEDS_WEAK_PER_CPU is not a Kconfig option,
> it's just a definition, for s390 it's here:
> https://elixir.bootlin.com/linux/v6.15.1/source/arch/s390/include/asm/percpu.h#L21
> So, even for s390 if you are building core kernel code (not a module),
> ARCH_NEEDS_WEAK_PER_CPU will be undefined, however if you are building
> a module on s390 then it is defined. So, your change effectively
> results in _shared_alloc_tag being compiled out in the core kernel
> while it's used when you build a module. Therefore during linking
> modules can't link to that symbol in the core kernel. Hope this
> explains the issue.


Thank you so, so, so much! I understand now, and thank you for such a 
detailed explanation.


> The way I would fix this is by making ARCH_NEEDS_WEAK_PER_CPU a
> Kconfig option and enable it for s390 and alpha, would replace old
> definitions from
> https://elixir.bootlin.com/linux/v6.15.1/source/arch/s390/include/asm/percpu.h#L21
> and https://elixir.bootlin.com/linux/v6.15.1/source/arch/alpha/include/asm/percpu.h#L14
> with:
>
> #if defined(MODULE) && defined(ARCH_NEEDS_WEAK_PER_CPU)
> #define MODULE_NEEDS_WEAK_PER_CPU
> #endif
>
> Then use MODULE_NEEDS_WEAK_PER_CPU instead of ARCH_NEEDS_WEAK_PER_CPU
> in all the current places in the kernel code. Lastly, to compile out
> _shared_alloc_tag your current patch should work fine because on s390
> and alpha ARCH_NEEDS_WEAK_PER_CPU will be defined after all these
> changes.
> Does that make sense?


I quite agree with this approach.

Thanks
Best Regards
Hao

>> Could you please help explain it again?
>>
>> Thanks
>> Best Regards
>> Hao
>>
>>>> Thanks
>>>>
>>>> Best Regards
>>>>
>>>> Hao
>>>>
>>>>
>>>>
>>>>
