Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C557A2D77E3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471265; cv=none; b=MNTTotYmXDTN4RKZwan5jh0MxATH9NnALSg3NfMh+X6A+500uHUhOtuoosJlO3GR6VMOwufolE2hEokEyVK/dhS8K27J5QcH/ZGz1FpvSuKFIy/yxiHjbtrLBgooSuiVmRKCocFepyP0aUS9/M7HlXk+oZLh0jgy3wj6a5mkA/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471265; c=relaxed/simple;
	bh=IECqy1n9vDysW/RzHb6Mf8qqQgPCCqgFmtKFE1V6L0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mb7JKXK71ufw38f7sgfKFkGEXmvVkmqTtgJbj9ZyaOnbVR6DTAF3gE1yxJ+mRDKb1rULyN3admRdLOfTb8vgM08oybX/sLAw9nqpwwivuUKDsbrosjxnDj97m/ukHXZmCr4BjlpJsizw50aP69+3v9We+qYoy+rA9jcNEB2MsMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDuJhcp+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDuJhcp+"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553bbbdc56bso1205608e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751471261; x=1752076061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dg0qjgsbd25kQ2WMiX3ztjtV7rTNZWqsHlNRU5eCd2k=;
        b=GDuJhcp+QF4mBPf4kocF84pc7gkJHz6JuKswrVpMTlfhR018A57g/bf8kHcmo1SL3m
         GwHRiNK6H8XC08/Xb3zwOmJqfaw+4p92d7t+iWNWgTeN+mCRHrs8I/jv9S+SuPJUXCD1
         zPcGZteIQeTWOVFYOt2ir0Psacm06a2h8xuJNTjAS0NXMwxfu4C6IMiXeWW1RXOXYfow
         juevxVr87q0pmCAMJj3E3pLCyiSa4lVxQd1kj14IXaT0SAi48scSKmCTrNFc5Uzg0BrP
         /Tc2RfVO38rDERmnh80WXTfL5czU2ba/lQyA41dZIgOO8KKApFdArmqlUPyFrQ/tNVLv
         rLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751471261; x=1752076061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dg0qjgsbd25kQ2WMiX3ztjtV7rTNZWqsHlNRU5eCd2k=;
        b=B5GNU7/lFn2kaAZIEUEnI7r7K/LqhRbmHUsgAQgeZvFfBxSHaw5k/Bg5h+6gsU82wp
         WJSJtlWFDs8Bx3gLwaxQakOpSPqBcOFEtm69wB6RqfSYsgpPa9AMkHZQWzHg7e/CeyUz
         2xKf+3BJRwrlyumXy3nibi1fYg7Yx3Zo+TXh9U0x67uXSEZTQmF1ws+B/hs+eOlKn4yu
         wyU6i2rXuXIUUa8RdI6QyU84F+S18DvO5HUnVczzxHodrZ7TZLJKW3XfHh2CBlr3zMid
         GbpMI5tm2mikK8YMoO2KE+RFK5CHIfnlMJK0cHQzWUkEg3wqj49NkYm8WOeQDHu5zoTa
         VxyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/kxUTD5PNWAcULVT7cs7lpMVV1jOykxpvvb+29Ci23sE0rYMKVdmOJqwqk2sixEitqI8+omFGHhZwFZY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze75mSEpEBEfatA5fD9fXKOCWmeGkItkIa1Q64kjkvD1B6af5k
	0+AU/Y+pDWUg+C+42QdQIlBzYoKFutyyRm7cSVyyvekFi+/tYFuZKd9c
X-Gm-Gg: ASbGncufZquIEZgr3sLsBNyGErJ8xbuLoeI7XMT9hTcIPtVcbrTGcQJpdI3+9sKHO+Q
	6jQ/0HsUADvm+quN9xfxtII++H5AQZKOd5MfqpSZ5nrTbH0Gi+pVuh9moxHMOckq4RvA3ZQ8xMb
	UhtxofA4F0S0bk+qjYh/4aUhErGUpeRmMaqQVjwh5zv97qrWV56ccXN6HAivZV/3BHrM84phPDE
	hAq800jkDggH6wSWaI5BZqGDl+OzW53CUXT6hN/EaGhxZfrP5vWpMVQ6QUWJirYTd+ojcIwGACz
	oFzyeBue1H0NTUc6rg/WssDm/s7CGnni5NdVo/47ij8DIOmwHe+2qdCOnxMrJbzaMudDA8ki74L
	5WCo=
X-Google-Smtp-Source: AGHT+IHio6wfWnZlK4Mo3609S6+5VtjeT/3ln1hTQpayl9k1KGIhzopKfzGQ6qBGtftk0/WnBOd/qQ==
X-Received: by 2002:a05:6512:3191:b0:553:6514:669e with SMTP id 2adb3069b0e04-556282950d5mr421178e87.14.1751471260535;
        Wed, 02 Jul 2025 08:47:40 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2eec3dsm2160750e87.242.2025.07.02.08.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:47:40 -0700 (PDT)
Message-ID: <4599f645-f79c-4cce-b686-494428bb9e2a@gmail.com>
Date: Wed, 2 Jul 2025 17:46:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kasan: don't call find_vm_area() in in_interrupt() for
 possible deadlock
To: Yeoreum Yun <yeoreum.yun@arm.com>, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 akpm@linux-foundation.org, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, byungchul@sk.com, max.byungchul.park@gmail.com
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, nd@arm.com,
 Yunseong Kim <ysk@kzalloc.com>
References: <20250701203545.216719-1-yeoreum.yun@arm.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250701203545.216719-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/1/25 10:35 PM, Yeoreum Yun wrote:

FYI some of email addresses in CC look corrupted, e.g. "kpm@linux-foundation.org", "nd@arm.com"

> In below senario, kasan causes deadlock while reporting vm area informaion:
> 
> CPU0                                CPU1
> vmalloc();
>  alloc_vmap_area();
>   spin_lock(&vn->busy.lock)
>                                     spin_lock_bh(&some_lock);
>    <interrupt occurs>
>    <in softirq>
>    spin_lock(&some_lock);
>                                     <access invalid address>
>                                     kasan_report();
>                                      print_report();
>                                       print_address_description();
>                                        kasan_find_vm_area();
>                                         find_vm_area();
>                                          spin_lock(&vn->busy.lock) // deadlock!
> 
...

> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 8357e1a33699..61c590e8005e 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -387,7 +387,7 @@ static inline struct vm_struct *kasan_find_vm_area(void *addr)
>  	static DEFINE_WAIT_OVERRIDE_MAP(vmalloc_map, LD_WAIT_SLEEP);
>  	struct vm_struct *va;
> 
> -	if (IS_ENABLED(CONFIG_PREEMPT_RT))
> +	if (IS_ENABLED(CONFIG_PREEMPT_RT) || in_interrupt())

in_interrupt() returns true if BH disabled, so this indeed should avoid the deadlock.
However, it seems we have similar problem with 'spin_lock_irq[save](&some_lock)' case and
in_interrupt() check doesn't fix it.

And adding irqs_disabled() check wouldn't make sense because print_report() always
 runs with irqs disabled.

I see no obvious way to fix this rather than remove find_vm_area() call completely and just
print less info.

