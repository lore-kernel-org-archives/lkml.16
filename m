Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65FC1C6FE9
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877756; cv=none; b=TmIKEyMGFw32P90Je81o2cbh+GrLNDapbs3px52XA6a3GWFUkqfxUEotrGlCPpTR2tMO353onFPdinC71LweCWx1C34hGezrINgQwEOJ4rSVT+1LB6z5aCMkvnrs+lYwr+LKosbWOAKgit63Fe5aJLOO9WLR7ADrXVckzE2vHKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877756; c=relaxed/simple;
	bh=g9WOMBkmMG8BclD+4LVAq3Z8bUO9U2znlJqwHtM6kmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRh4wgWigFsWo8JxA30jvlgRz1nk+71qZyOXsLyFPIuDorQLVeUtDEIdsg5xCcDkJQ/RrdTn9tB1wlqyl7jGC8VsFqbiwHnsDEJaU2AnCiX1EpuWTBJqn84c+U++gyWC6ce5YQLxYVoD3Ezw0r1oQ1rSCzWdAmxIf0iTt32hqiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3635E4393F;
	Mon,  2 Jun 2025 15:22:29 +0000 (UTC)
Message-ID: <c6d4e881-d258-41f2-a7c3-d993caf892ae@ghiti.fr>
Date: Mon, 2 Jun 2025 17:22:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: uaccess: do not do misaligned accesses in
 get/put_user()
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250530205658.624195-1-cleger@rivosinc.com>
 <20250530205658.624195-3-cleger@rivosinc.com>
 <718fb1d7-9f0c-4637-abe8-5a34305c3ae2@ghiti.fr>
 <cea8cdf2-4b1e-4628-a5df-249adf4387b5@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <cea8cdf2-4b1e-4628-a5df-249adf4387b5@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkedtvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepuefffedvleetleetjefhjeehudejteetvedtvddvtdfhieetffelvdffgefgieeinecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemfeeifhdvmeeijeehgeemvdeiieekmegsieeksgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemfeeifhdvmeeijeehgeemvdeiieekmegsieeksgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemfeeifhdvmeeijeehgeemvdeiieekmegsieeksggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdri
 hhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughu
X-GND-Sasl: alex@ghiti.fr

Hi Clément,

On 6/2/25 09:37, Clément Léger wrote:
>
> On 31/05/2025 14:35, Alexandre Ghiti wrote:
>> On 5/30/25 22:56, Clément Léger wrote:
>>> Doing misaligned access to userspace memory would make a trap on
>>> platform where it is emulated. Latest fixes removed the kernel
>>> capability to do unaligned accesses to userspace memory safely since
>>> interrupts are kept disabled at all time during that. Thus doing so
>>> would crash the kernel.
>>>
>>> Such behavior was detected with GET_UNALIGN_CTL() that was doing
>>> a put_user() with an unsigned long* address that should have been an
>>> unsigned int*. Reenabling kernel misaligned access emulation is a bit
>>> risky and it would also degrade performances. Rather than doing that,
>>> we will try to avoid any misaligned accessed by using copy_from/to_user()
>>> which does not do any misaligned accesses. This can be done only for
>>> !CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS and thus allows to only generate
>>> a bit more code for this config.
>>>
>>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>>> ---
>>>    arch/riscv/include/asm/uaccess.h | 28 ++++++++++++++++++++++------
>>>    1 file changed, 22 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/
>>> asm/uaccess.h
>>> index 046de7ced09c..b542c05f394f 100644
>>> --- a/arch/riscv/include/asm/uaccess.h
>>> +++ b/arch/riscv/include/asm/uaccess.h
>>> @@ -169,8 +169,21 @@ do {                                \
>>>      #endif /* CONFIG_64BIT */
>>>    +unsigned long __must_check __asm_copy_to_user(void __user *to,
>>> +    const void *from, unsigned long n);
>>> +unsigned long __must_check __asm_copy_from_user(void *to,
>>> +    const void __user *from, unsigned long n);
>>> +
>>>    #define __get_user_nocheck(x, __gu_ptr, label)            \
>>>    do {                                \
>>> +    if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
>>> {            \
>>> +        if (!IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr)))
>>> {        \
>>
>> Nit: I would use && instead of 2 ifs.
>>
>>
>>> +            if (__asm_copy_from_user(&(x), __gu_ptr,
>>> sizeof(*__gu_ptr)))    \
>>> +                goto label;            \
>>> +            else                    \
>>> +                break;                \
>>
>> Here I would remove the else
> Hi Alex,
>
> The "else" is needed to break from the outer do/while loop or it will go
> though the next switch case (and it will crash due to misaligned accesses).


I meant only the "else", not the "break"!

Thanks,

Alex


>
>>
>>> +        }                        \
>>> +    }                            \
>>>        switch (sizeof(*__gu_ptr)) {                \
>>>        case 1:                            \
>>>            __get_user_asm("lb", (x), __gu_ptr, label);    \
>>> @@ -297,6 +310,15 @@ do {                                \
>>>      #define __put_user_nocheck(x, __gu_ptr, label)            \
>>>    do {                                \
>>> +    if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
>>> {            \
>>> +        if (!IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr)))
>>> {        \
>>> +            unsigned long val = (unsigned long)(x);                \
>>
>> Here it sems like __inttype(*(__gu_ptr)) is more accurate than unsigned
>> long, even though I think unsigned long works fine too.
> Wasn't aware of __inttype, but it sounds good.
>
> Thanks,
>
> Clément
>
>>
>>> +            if (__asm_copy_to_user(__gu_ptr, &(val),
>>> sizeof(*__gu_ptr)))    \
>>> +                goto label;            \
>>> +            else                    \
>>> +                break;                \
>>> +        }                        \
>>> +    }                            \
>>>        switch (sizeof(*__gu_ptr)) {                \
>>>        case 1:                            \
>>>            __put_user_asm("sb", (x), __gu_ptr, label);    \
>>> @@ -385,12 +407,6 @@ err_label:                            \
>>>            -EFAULT;                    \
>>>    })
>>>    -
>>> -unsigned long __must_check __asm_copy_to_user(void __user *to,
>>> -    const void *from, unsigned long n);
>>> -unsigned long __must_check __asm_copy_from_user(void *to,
>>> -    const void __user *from, unsigned long n);
>>> -
>>>    static inline unsigned long
>>>    raw_copy_from_user(void *to, const void __user *from, unsigned long n)
>>>    {
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
