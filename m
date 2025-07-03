Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48D2258CE9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 17:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751562733; cv=none; b=j2OP+l21wnWMrBMNSjaex5MOQhEHGfVHjN4jTC/YHNOD/hZ9uU0EEknTql4ccNgoT90/OI0NmoRXZQn6CqeRN22ctH4qHK9+n/y2dn63eJ+MkFfv97wLFn99U/fxc4zlhHXYmj9fgh8AT0Al50Tjb9Npoyxn9xcYDo6ZFEIWj2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751562733; c=relaxed/simple;
	bh=Y+5PBjp3L+A/0PWkGIZorEGSdIsFWG49/tCq8S+8KQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWS5YjyAS9GIV/afyF2/YpGk6bnhEnIayDg2OudMIo1RaRACFrLyPeVpXk5cFBDRxja0QEIKR/wI0kdQ9TeX31bWYZsv19CxLuv/YdxL+avAYHFgCyuIrPQQUViOgvp23v+Avo+Onm6VqnwfRoVOP1kFv+H+oTEuelgl0l3LRj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bP2/7uC8; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bP2/7uC8"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553affea534so12392e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 10:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751562729; x=1752167529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8JHsACmNVQDqMzth3zHYUx+TIWM589NbxHC9P7ivfVY=;
        b=bP2/7uC8w1PaFxaY13Qj0L002wTMrAcjtVxbgyzU8doqcsqaBXKLAZCMRCgXU1cXw2
         X0kxLfBt5rBSanHjBV7/xCGrS+n8gyuTglSh3rN+BQQCOTnweE11Dxp3uuPUQwjLDSfl
         DM8KYjzNAhiEAuOnRl29dyMalxgfwSyAHzUmW+YDhh7rvzsFPTme38WKfYTXuGW+Ezcq
         wxO2jPZ7CAmPzFEkg/q4Xiu5MNWBM+CVNr2EUeN25aX5W6sQbrF1D/SRDb/Dju7WcOlK
         d6TUOPyHAWLmCXCKWm3dPjR3xp9n3neEcbTdbyVoRoxWDRsDhciRpvsOz4A4C588XTu2
         AKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751562729; x=1752167529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JHsACmNVQDqMzth3zHYUx+TIWM589NbxHC9P7ivfVY=;
        b=eDRE2t1fU9gqeSF+wBRE19MfcD2jT/SzU8NRMrrjIYqfbgy7XCSCm+icnv8NdEEWgx
         1VcwfrxLlLZod+UoGLplOerWMcMl4KwbZCYuOZ51uypuLPu/wQNRrg0aS3KE3nTpi0Ye
         h2ZctRvr82JkFkws/o5T+kp1NXCEr5cw+qSlnWac8kSLimribbbHhi+6p82O4On5VfS4
         z6uIKyBID88La7S5m+SfYxkYImMzqNwrGq2fsjjmPEB8W8A5GD29JXPEWN7X8P9G0JS6
         sp33D+CHVNKnDOQAvNaFLhq7z6Wj7t5tkByBn57Z/yToeoy5q1jVu4nn+TdTUE4uruei
         DqUg==
X-Forwarded-Encrypted: i=1; AJvYcCURBDWOnAXFHM2QGww03Ca5kiEcTuh6/CE5vIR6nSBm5jR4LLOzsJld8U/zuCcIoIRpmGiVm6D/sZGb7kE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyORzhp3ncaXrgakORfN8nBmc6WPpbvZss/+KN7q0YYkkgzxhu2
	MBGKRzjZqYb0Dco5hCALpCkdtS1W+QmSxeJZfCo822aykjH027NXpX9w
X-Gm-Gg: ASbGncsx3LjBvhf4cwNbcV+cMUDQh1XokKzAB9XAKo/IsapNUJ3AfRE2FvR0af61M0g
	xJXX52DsP8z64K3JfpVwasv6N69svQwwvGT8kmfhAT1r4fkr9SfJA/Je6845yOQWCZgxHgldWYA
	7Pnfm4uaodejPee+Jvsd/1+WGhQaVFKu9jO3ZWLxZkTV0jvBFL9j9DoIQEdItjCacjdd6HpQA1z
	9d74BrfGW81yeSIH+koYH4T2kGhg68onde9jzBcORX7ZH7rSU5HL1MBxAIYPAGlUmzKXA25JESZ
	FMUd9qAKp1buBMwOsKh57zjK00zOAYrQKeMt04WUfJ4N4vPSAvmqP2qNEqIXn/nJpOyx
X-Google-Smtp-Source: AGHT+IHSUdgs8rkjr+uLDoqm0WJNQiSMXBB+h8aK0WD+wavVOnlqZxsO6zfCCjPgM4KKxosilHQWvA==
X-Received: by 2002:a05:6512:3ba6:b0:553:a2a2:21b6 with SMTP id 2adb3069b0e04-55632c86b8bmr327098e87.4.1751562728608;
        Thu, 03 Jul 2025 10:12:08 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384a9e43sm24902e87.173.2025.07.03.10.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 10:12:07 -0700 (PDT)
Message-ID: <1a7f32a8-16ff-406c-9542-8d2ad628d7f4@gmail.com>
Date: Thu, 3 Jul 2025 19:10:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kasan: don't call find_vm_area() in in_interrupt() for
 possible deadlock
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, akpm@linux-foundation.org, bigeasy@linutronix.de,
 clrkwllms@kernel.org, rostedt@goodmis.org, byungchul@sk.com,
 max.byungchul.park@gmail.com, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, Yunseong Kim <ysk@kzalloc.com>
References: <20250701203545.216719-1-yeoreum.yun@arm.com>
 <4599f645-f79c-4cce-b686-494428bb9e2a@gmail.com>
 <aGVYoEueYjoC1hQh@e129823.arm.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <aGVYoEueYjoC1hQh@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/2/25 6:04 PM, Yeoreum Yun wrote:
> Hi Andrey,
> 
>>
>> FYI some of email addresses in CC look corrupted, e.g. "kpm@linux-foundation.org", "nd@arm.com"
> 
> Sorry and Thanks to let me know :)
> 
>>
>>> In below senario, kasan causes deadlock while reporting vm area informaion:
>>>
>>> CPU0                                CPU1
>>> vmalloc();
>>>  alloc_vmap_area();
>>>   spin_lock(&vn->busy.lock)
>>>                                     spin_lock_bh(&some_lock);
>>>    <interrupt occurs>
>>>    <in softirq>
>>>    spin_lock(&some_lock);
>>>                                     <access invalid address>
>>>                                     kasan_report();
>>>                                      print_report();
>>>                                       print_address_description();
>>>                                        kasan_find_vm_area();
>>>                                         find_vm_area();
>>>                                          spin_lock(&vn->busy.lock) // deadlock!
>>>
>> ...
>>
>>> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
>>> index 8357e1a33699..61c590e8005e 100644
>>> --- a/mm/kasan/report.c
>>> +++ b/mm/kasan/report.c
>>> @@ -387,7 +387,7 @@ static inline struct vm_struct *kasan_find_vm_area(void *addr)
>>>  	static DEFINE_WAIT_OVERRIDE_MAP(vmalloc_map, LD_WAIT_SLEEP);
>>>  	struct vm_struct *va;
>>>
>>> -	if (IS_ENABLED(CONFIG_PREEMPT_RT))
>>> +	if (IS_ENABLED(CONFIG_PREEMPT_RT) || in_interrupt())
>>
>> in_interrupt() returns true if BH disabled, so this indeed should avoid the deadlock.
>> However, it seems we have similar problem with 'spin_lock_irq[save](&some_lock)' case and
>> in_interrupt() check doesn't fix it.
>> And adding irqs_disabled() check wouldn't make sense because print_report() always
>>  runs with irqs disabled.
>> I see no obvious way to fix this rather than remove find_vm_area() call completely and just
>> print less info.
> 
> Right. unless there is API -- find_vm_area() with spin_trylock(),
> kasan_find_vm_area() should be removed.
> 
> But, I'm not sure adding the new API used only bv kasan is better then
> just remove kasan_find_vm_area().
> 
> Do you have any idea for this?
> 

I'd say the info from vm_struct is nice to have, but it's not essential for debugging.
It's probably not worth trying to keep it, so I'd vote for for removing kasan_find_vm_area().


> Thanks.
> 
> --
> Sincerely,
> Yeoreum Yun

