Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A92EAE7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 03:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744859424; cv=none; b=q8rpQ07EGWXPqIJncRHUL0LYcVjmZCjr2TvCJzL/nRnGeF9iIvZaYvq9wLc9auxqR7XOS5fNuB+u4CFFmmFQqdBe8s47OIAYQOTH7AwejABHv0wfs/m7ghkRIAcNST0JYeu32Llg8PwOFx1jrxrx8Yypu7Coim9odezjgHASNSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744859424; c=relaxed/simple;
	bh=5SRB6p0yJx704MDegX83svJTCWIGAky8kJQ/cgfpt2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWNrNulYrt/5Mw3zrSb7mDwizMjkUnxuanfcaE8jNO60yIFOWl6JUwpsl3/3H3jtR71ALZbYtkiPax3y7d7NFfTbPerl0W4v5ExOXPZzNEoJEQ9KVo///d5YQS2qJs9unTdc32V7a3faXogZhscbKfPvW+qIG/TLdKF1/1YSALU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTmRz0mu; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTmRz0mu"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so201871b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744859421; x=1745464221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AkgcOD0s8sY0OqEBhP6EzDl8Yl3YNlrB/xY8BfBUKys=;
        b=MTmRz0muCZInK91bbgj5GvG7E2XkwXtoy/R1AmbuYL+tkoXVrqsADTSH9EsdHExY41
         DllXzcw2RUjrV0O8vLOwg7TBaclel5jfGPKsEbzBDFQj1NxMJFdtD4tOvnlCCznLqKK0
         FU1D2+7GDFZseI4OyBc+fpskS7KGEdsKtCTuV170ers41dbNx41aIZqqpYKDpFzgDGzS
         pQz8z+9b1IaS+9dIl4zPp6KVAVs/8wpnm2Zxz6fQCiomTML/1ZS7j6D6K+BO96n/cv3G
         praxSbbxZgEpSyLvf/QBjOGOU/TaA5ltQ8ud6DRY5cm2TGF//m9+1i3gzbnrkjWWad1w
         MzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744859421; x=1745464221;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkgcOD0s8sY0OqEBhP6EzDl8Yl3YNlrB/xY8BfBUKys=;
        b=RwfIZsMne2SN2jXXtLHautLviqnONf/P9kws2qWELfw6egSZmACWoxqrmicDQhKHEh
         VSmnuPQsTZ5OFzMCbPzumV+N0Vi89c17AWbRjBRIrQHQYliQFUzOwwxCT1nHWTHahnNi
         YeDVqkWynUEb5x19y5gPdwnbcCNcyhsCM/9gOpUt3alaBqdoLYQjR+xklVFDe7t17paT
         FCWiTg0q6z8DrjoOjRKB8auS4H95YlbJ6664ueF3MrNz7qLwnUwx81GKrmHEPqtPV/Uh
         X7ws2mitzPpPORN5fNVZylp/xwXJ2BImF5lJBiQXgmtHx8TP4Zi2ehmVZevqYA7IRNTC
         xv4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0fWWrEa0OsI+LsycVcb6/eOnN4BOhXkDHv2aK20cdUzEc5KRpDKoGoGQ8mRrdyrLvlVxlsD/hfK9Jc9g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4pZN0Vk9LDZaY69dqKScflCfTi+qqwXCy4im2eIhYv5I2VqY5
	LtiXoJSrc2jy6N0HGLbwEHce1irHI3UCrzknegmYVE3c7kPnZ/Uj
X-Gm-Gg: ASbGncvtnWQzoGtrUOvyQQdeWLrV1/fXxdQnVyqxoURmlBbtBde0R4oZ2Zd3zkKOOkz
	cmnS6Db5gAA7sh7ox1qnTaDyUORsjm/z6uaz4elgjtTShtZtlCTqpCD4r0/efMDpwm7uT3uOXW7
	5EOLdj7i9FblRADGfGzZr2En/kG6b+GmfsuzQHGrc7yhJfioC3klYBWhCUuyhQdwXdtwbbmrWFn
	4YWcIg+Y+RrCPJ4numNqu79RRFylCezt8Ik7dOGCnTZXHRhOVja38OYelgvW3rGBddZsaR5MXgj
	hE/46Ifa88De8macajtnmCvJPFj82ohy634ZkaxORgrRVg0/JCShkVEFmIx/QY93w0xZvYyR5Km
	U3DYIV0i2ZG7IYA==
X-Google-Smtp-Source: AGHT+IHUO5iPIBI2bP8tjC354ymaB7K7cWv5lfX/rIJVWoygMEAwsc+paqYs2xiOvyydK8DXoF7BUA==
X-Received: by 2002:a05:6a00:240c:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-73c266b9927mr5874992b3a.5.1744859421318;
        Wed, 16 Apr 2025 20:10:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e8b1sm11580740b3a.148.2025.04.16.20.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 20:10:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b35dc3bb-71ca-4f5e-af29-8e1605ec5bde@roeck-us.net>
Date: Wed, 16 Apr 2025 20:10:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/Kconfig: Fix allyesconfig
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
References: <20250416230559.2017012-1-linux@roeck-us.net>
 <20250416170359.a0267b77d3db85ff6d5f8ac0@linux-foundation.org>
 <4d9cb937-2a8a-4b3c-af32-f8fae922aa5c@roeck-us.net>
 <20250416182828.9e2b312a75ed90b706483250@linux-foundation.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250416182828.9e2b312a75ed90b706483250@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 18:28, Andrew Morton wrote:
> On Wed, 16 Apr 2025 17:17:00 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 4/16/25 17:03, Andrew Morton wrote:
>>> On Wed, 16 Apr 2025 16:05:59 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>>> 64-bit allyesconfig builds fail with
>>>>
>>>> x86_64-linux-ld: kernel image bigger than KERNEL_IMAGE_SIZE
>>>>
>>>> Bisect points to commit 6f110a5e4f99 ("Disable SLUB_TINY for build
>>>> testing") as the responsible commit. Reverting that patch does indeed
>>>> fix the problem. Further analysis shows that disabling SLUB_TINY enables
>>>> KASAN, and that KASAN is responsible for the image size increase.
>>>>
>>>> Solve the build problem by disabling KASAN for test builds.
>>>>
>>>
>>> Excluding KASAN from COMPILE_TEST builds is regrettable.
>>>
>>> Can we address this some other way?  One way might be to alter or
>>> disable the KERNEL_IMAGE_SIZE check if COMPILE_TEST?  That will be sad
>>> for anyone who tries to boot a COMPILE_TEST kernel, but who the heck
>>> does that?
>>
>> I tried increasing the limit. It didn't work. With the RFC I sent earlier
>> I made it dependent on allmodconfig, but Linus said I should just disable
>> it for test builds (which was the cases anyway until commit 6f110a5e4f99).
>>
>> Personally I don't have a preference either way. I can also do nothing and
>> stop testing allyesconfig. That would help reducing the load on my testbed,
>> so I would be all for it.
> 
> How about this?
> 
> 
> 
> --- a/arch/x86/kernel/vmlinux.lds.S~a
> +++ a/arch/x86/kernel/vmlinux.lds.S
> @@ -466,10 +466,19 @@ SECTIONS
>   }
>   
>   /*
> - * The ASSERT() sink to . is intentional, for binutils 2.14 compatibility:
> + * COMPILE_TEST kernels can be large - CONFIG_KASAN, for example, can cause
> + * this.  Let's assume that nobody will be running a COMPILE_TEST kernel and
> + * let's assert that fuller build coverage is more valuable than being able to
> + * run a COMPILE_TEST kernel.
> + */
> +#ifndef CONFIG_COMPILE_TEST
> +/*
> +/*
> + * The ASSERT() sync to . is intentional, for binutils 2.14 compatibility:
>    */
>   . = ASSERT((_end - LOAD_OFFSET <= KERNEL_IMAGE_SIZE),
>   	   "kernel image bigger than KERNEL_IMAGE_SIZE");
> +#endif
>   

Yes, that is what I ended up doing with v3 (thanks for the idea), lacking the comment.
Guess I'll need to send v4, but I'll wait a bit to see if there is feedback from others.

>   /* needed for Clang - see arch/x86/entry/entry.S */
>   PROVIDE(__ref_stack_chk_guard = __stack_chk_guard);
> _
> 
> 
> (contains gratuitous s/sink/sync/)
> 
> 
> I'd like to add
> 
> #else
> 	WARN((_end - LOAD_OFFSET <= KERNEL_IMAGE_SIZE),
>   	   "kernel image bigger than KERNEL_IMAGE_SIZE - kernel probably will not work");
> #endif	/* CONFIG_COMPILE_TEST */
> 
> but I lack the patience to figure out how to do that.

WARN is a define which declares C code. That doesn't work in linker scripts.
I only got #ifdef to work. I did not find a linker script command which would
be equivalent to WARN(). Maybe someone else knows if it is possible and how
to do it.

Guenter

