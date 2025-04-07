Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B621A3147
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744046126; cv=none; b=uJq9gs4ejFCWX2RPnOaJmlcKGrlKQFbmVCussFZAZEivJLP7SkgqEXo5KNaV6tdQ6OFXRd66fqV47oNIg+Dv0+NexcWarwUU+tje7ZmoL1t7wRpESje00apXuyENF3tiRpBA5+tidU6BmiGuKAc/51KcuS1w++p7uGB5g/Jrd08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744046126; c=relaxed/simple;
	bh=FBf8d6GmtzoSZBA564GSGTOKGO8MRaoTtdTjhNhP9Nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dPn/zVS9+0erDMOB8//YWti3bk2/T83Oep5WThvxzVxqNdBb3pddMGFaULhFwuJCOk5gWJx5lKiljqG3Wv7BUr/K5WRNREO9p1Ajge1dsx7QvBxK6pXTmhCybN89OPSBeT22ZtZN6XbNT2h8HuXFC9xFz5ZYh1HK59313DWtjZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqTYHCOQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqTYHCOQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223f4c06e9fso41914855ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 10:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744046123; x=1744650923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RDztHXsSxInBuiG0VJUxLFQ4eSoKWwt9SARTo131tWY=;
        b=JqTYHCOQ2M6ATjpN9WKvEwCbou34v8vsk7FC0idDFbrqstSGJuSAv063e7yFtk/0gY
         yUeNi2J+/4OyJtmfMn8N8NT78yBbDdpGoHyNu1W81lAzczigXaZcUwX6pWDdoYb8rUS1
         rwF66Yumn8OmQ4MtQAA/pO2olo6ogFltnD6sO2NP/f7Od/a+pJsuip7Fu7BH7ReM5P5Z
         NP1nyktu4c1SNOImJLnNZF4uaLfLIrjbocxhYBJUBX47gnhRNxYcR3weWdWCpleS7tUA
         nMmu2BDqrthb2wttfpArJ1RqTXqCLEh9Gtaeb1Lq9cjOTg1AknVAcSXY5nKsQ3MojnIT
         8DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744046123; x=1744650923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDztHXsSxInBuiG0VJUxLFQ4eSoKWwt9SARTo131tWY=;
        b=Lru5hD+7YT3xfz0AbrpfGUmG8ZHsVxV+4ANkMo7+q2yd4fuedROFA8jx4peMHgmH0j
         TxI56wqZQ2bK1cgVlOcHTh4wLTjYWV7OeMleH/NUafISo4Skv4+pPvTFSxJSeF+qJU6/
         lp7kt9lhd8YA8k38buTpwKtP0Vw16npEzqpbizWdDTTxW9qRjs0SD4E+r1q5th89rn0j
         OTskL9N/YMLY1+YzCQUAqULKfC1Bg29HC5lIkvTZk2qjU+zKH80PbyMD4CzavjxPLqpI
         BqGByyClyirKgGULv5NA+ciqUeCcUZ0arGvW13muzdPVwq/k0M1/r/zh/KkYY8H6YoTr
         Lfug==
X-Gm-Message-State: AOJu0Yx2kXxiik5mXTKWHeN+BAw0fJPVjmsM2TQZt2JTD0uel/nIw2vK
	C4/se3IBdBKqy04x0H7w1giSbUm4Gu96ZuiwLRiGYAeqrgDvFzv0
X-Gm-Gg: ASbGnctG1Ta/KzbFnric68l0/nXP2BavGjw/k7G+ddmAbFLGYwZ96dKq27nIAGikCwG
	ZEiHlOyz7Z11pdSZreNIO/9jWdGuxw1q3W/i/X8JXkYvTMj++f1EHRPQ8naBpau7h62yf7sf+tY
	3R/B300svK6vlj85O09jT9JKUL6atzxx7fGh25ZbHYzU8tafPrIBrDXMNUjjQN031nYYHtw54qo
	SBa9dHWIEE/7Ji9EluBmv7O4rcdoalOj9DEX2XmYJIN+yAmFY1Z5RsSvkirf5ee+SosaIvtpJwE
	Y2IZ/UJPS56x7j/+fF5ja0M30ZlXQHTr83JH5OFKWWTqOtytJ8egmSq+F4x5UA1M3ZLCKcwWWyG
	jSJJyIFAn0DZ9XSGLcg==
X-Google-Smtp-Source: AGHT+IFfnVHfamVoiiRmZ5+FgSigcjsjxsqKIGFXp7XA+4bitEikcPre083l8RqSDgAPA0Q+Pi1tqA==
X-Received: by 2002:a17:903:1c5:b0:215:44fe:163d with SMTP id d9443c01a7336-22ab5e676a5mr2691405ad.17.1744046123477;
        Mon, 07 Apr 2025 10:15:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e8f7sm83463725ad.205.2025.04.07.10.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 10:15:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <637b45cd-9de4-48f7-ab72-ac0ed7b80f09@roeck-us.net>
Date: Mon, 7 Apr 2025 10:15:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.15-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Johannes Berg <johannes.berg@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>
References: <CAHk-=wgv_rS5dT8QY7Yh3V5UGup4BLHYToXNKWoH3C9+3YhY9w@mail.gmail.com>
 <75ec6d07-24f3-47b1-9632-ff53ef12c1ab@roeck-us.net>
 <CAHk-=whwuVsXiCV30yU-Jk-PDJBozdKRu=XDuocHtq5rbyaLxQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAHk-=whwuVsXiCV30yU-Jk-PDJBozdKRu=XDuocHtq5rbyaLxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/25 08:55, Linus Torvalds wrote:
> On Mon, 7 Apr 2025 at 08:14, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Build failures:
>>
>> In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/utils.c:18:
>> drivers/net/wireless/intel/iwlwifi/mld/tests/../iface.h:169:5: warning: "CONFIG_PM_SLEEP" is not defined, evaluates to 0 [-Wundef]
>>    169 | #if CONFIG_PM_SLEEP
>> [...]
>> Triggered by commit d1e879ec600f9 ("wifi: iwlwifi: add iwlmld sub-driver").
>> The code was not build tested with CONFIG_PM disabled.
> 
> Ok, should be trivial to fix, let's get the guilty parties involved..
> 
>> Building x86_64:allyesconfig ... failed
>> --------------
>> Error log:
>> x86_64-linux-ld: kernel image bigger than KERNEL_IMAGE_SIZE
>>
>> No idea what to do here. Increase KERNEL_IMAGE_SIZE ? Disable some options ?
> 
> Hmm. It's a fairly random #define, and I suspect we could just
> increase it for COMPILE_TEST.
> 
> allyesconfig is kind of useless, but it does occasionally find the
> "same name used in different modules" case and other random things,
> and disabling options seems overly complicated for this odd case.
> 
> Adding x86 people to see if there are preferences.
> 
>> Building xtensa:allmodconfig ... failed
>>
>> ERROR: modpost: "__divdi3" [drivers/gpu/drm/xe/xe.ko] undefined!
>> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/xe/xe.ko] undefined!
>>
>> Commit 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
>> didn't watch out for 64-bit divide operations.
> 
> Hmm. Why didn't that show up on x86-32? Or maybe it did and you're
> just quoting the xtensa case.
> 

I didn't see the problem on x86. I didn't check others.
Let's see.... openrisc and parisc are affected as well. I don't build
allmodconfig for all architectures, so that may miss some.

> Adding Oak and Matthew.
> 
> I assume it's the DIV_ROUND_UP(entries, 0x1ff) thing.
> 
Yes, using DIV_ROUND_UP_ULL instead fixes the problem. I submitted a patch
a week or so ago, but didn't get any feedback (unless I missed it).

Guenter

