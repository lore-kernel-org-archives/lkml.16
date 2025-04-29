Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849AE242917
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745942816; cv=none; b=oofwPrfkCfwAjwtB5BzwIe9b+7j62RKsmsGYssaQ0KB8+3IoMz6qoPa4RiYHKulZZrslQvjThuadXENnKPwPikEV60YNBHbFpUca+KlE7U6Hm/ABWokg9TIsJK3awzmJltV2DNJIJrHGour36Ue2yKWEsuSkmZ9cEAok+0s3qcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745942816; c=relaxed/simple;
	bh=SbxUmzQDjpdWgXNW648mViR6ApjtgoTdBjGQY5wczao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAonwXEDbQN+gCKQWjcPFxd2HVss+ShOUdbI3j8/ggF5WbJRC0i0rQGtmXpehILSOLS9kHY7eO1OZwQxelfNSHUDucOo7TS7Yk2C9PG+RVH3/yJhvP2DraM8vfmaAPUM4ghjNfiAFUCXaXhx6tDcEVtwlQcoUKOJa4SIoRXe3nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNAGb6Dy; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNAGb6Dy"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72b82c8230aso1622966a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745942812; x=1746547612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0y1uS/4UQLFoz6lufgWT2BHmRa+Ve2aFRZxvFyt9eZw=;
        b=aNAGb6DyuQY+HSgcTiDDQiTofgCg+QiFK5hXUmgPqNz3agpk0mOyGVZJn2LtW/wAUs
         T8J6t5Td+kK+HpAwyalDf+cEzGTFwIihGkSMylpebMMG+9FWq6h1Qlw+E3IcfhQukA0M
         s1zqC6zbgUytl1JTCdUrVUMH1/j6FzatSj60teM91F4m5tOjQgOpWEiC55v5AoHzMnM8
         YCfipD7BriSx+Jm9LAGuVowiq3oCdpU0NoBpc5P3uhbMdMegsa7mhQ+GZSXhBjPb5mRd
         8Moe2CC/ET/S6skAwe2qRBS0sqI3KxmWYDVtS0UMHPryZDIJgip/6i/Lmpfp5I/xames
         ZIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745942812; x=1746547612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0y1uS/4UQLFoz6lufgWT2BHmRa+Ve2aFRZxvFyt9eZw=;
        b=UlU/BkufGxR2imylbCXTHxSOk48KdPsycX/e/H40ZYq2MZ2N14t83Wzq14W3fMlFUC
         mleodZ7ohAkG4RA3TieqpU70RJCxn8jQ64U50PhKGa5ao7Kl1j7om9nSosHiXm3/GJuA
         y49P37B4oWyuIubqVS1NoSQGzl4MFzPUBcDSwXvO8qB/zak9OPmWaUVfnOr7jcEJ5P+u
         DegBtFFdKfHWtoqPjOMBMI65CDh6fBTQk/6sTSlB4Spyji8no3AYdkn3VryQWtH9U5Hy
         SQS/DmgPN75gKjiupH9NitUkOzKZTVOObZNpB1PS6lrItnBAZ/sNBMAG3AvCmzaiZbpm
         UfFg==
X-Forwarded-Encrypted: i=1; AJvYcCVFwsV+oxZeffNdsqyMtv5ihA236E2319u/RyHkZSg7tLN/IgjTVLTlWr9Jop0TTT+KK+nrABg9bOK4mDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVqjQWC4FMTJ0buoUIz6xQglb6mJPcKGyld7h6Lc0WbaxWkden
	Aa3sOL6GcxRyrSjE/0dXkcvifVy2DG1tYUfQREzT2B19/6SPC7kU
X-Gm-Gg: ASbGncthhAty3l7mFaCBQSOFr6eaU5YQxO8lfixmZVAHLLTJ/wbee8W9K56amat0aTl
	3bXKln3ezESU8TX+Eb0toDuKl1k8JXMjV9QUjdmMvNlZjO2knBhT9BkSMwzCetB/v30qjXp05Eb
	DRsID2lrjkccLhTFmni931FPAnX1oT4KY3BxGAwM8Fr4ksHfuSaQnmHzfQa8QN1rj5yKDEZAVNE
	6EfrcY46oOoEiVaoju31O104hmySysj2Gdri7jp4o0d17OwhFm81eKI24oHgjbpeMMAIcjJ+72s
	427/IWWBt6SghsasP4atNQZaJ76SEufQ/4cr/QURZmHJMrxj0DIpCI6zAv7cOZqpsVN4CLuz1Me
	R4nnn3lVKsfXJ6SAlpSPgIOtHACVw1WSOCUK4khY=
X-Google-Smtp-Source: AGHT+IFh0+T5Gd+4cRWPINK+2WBoodQXt786o46R/wK9FQFzK2WVcosDANx67GsA+xadi5LIf4OAMg==
X-Received: by 2002:a05:6830:6990:b0:72f:ff8b:e123 with SMTP id 46e09a7af769-7308a4fece7mr2464328a34.12.1745942812618;
        Tue, 29 Apr 2025 09:06:52 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7308b133d1asm341487a34.37.2025.04.29.09.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 09:06:51 -0700 (PDT)
Message-ID: <5a5b1825-2ee7-455e-b52f-edc1a138d0dd@gmail.com>
Date: Tue, 29 Apr 2025 09:25:04 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] panic: Allow for dynamic custom behavior after
 panic
To: Sean Christopherson <seanjc@google.com>, carlos.bilbao@kernel.org
Cc: tglx@linutronix.de, jan.glauber@gmail.com, bilbao@vt.edu,
 pmladek@suse.com, akpm@linux-foundation.org, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 takakura@valinux.co.jp, john.ogness@linutronix.de
References: <20250428215952.1332985-1-carlos.bilbao@kernel.org>
 <20250428215952.1332985-2-carlos.bilbao@kernel.org>
 <aBDoJLyiBcSZiAHm@google.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <aBDoJLyiBcSZiAHm@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,


Sean, thanks for getting back to me so fast!


On 4/29/25 09:54, Sean Christopherson wrote:
> On Mon, Apr 28, 2025, carlos.bilbao@kernel.org wrote:
>> diff --git a/kernel/panic.c b/kernel/panic.c
>> index a3889f38153d..2cdd83b4afb6 100644
>> --- a/kernel/panic.c
>> +++ b/kernel/panic.c
>> @@ -276,6 +276,30 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
>>  		crash_smp_send_stop();
>>  }
>>  
>> +/*
>> + * This is the default function called after a kernel panic has been
>> + * handled. Higher priority alternatives can be set with function
>> + * panic_set_handling()
>> + *
>> + */
>> +static void after_panic_handling(void)
>> +{
>> +	mdelay(PANIC_TIMER_STEP);
>> +}
>> +
>> +static void (*panic_halt)(void) = after_panic_handling;
> The default implementation clearly doesn't halt, which makes this unnecessarily
> confusing.  And if you're going to provide a default implementation, why bother
> checking for NULL in panic()?  Just leave panic_halt NULL.


Agreed.


>
>> +static int panic_hlt_priority;
> Uber nit, pick one of halt or hlt.


True, will use halt.


>> +
>> +void panic_set_handling(void (*fn)(void), int priority)
>> +{
>> +	if (priority <= panic_hlt_priority)
> If panic_halt is NULL by default, maybe do?
>
> 	if (panic_halt && priority <= panic_halt_priority)
>
>> +		return;
>> +
>> +	panic_hlt_priority = priority;
>> +	panic_halt = fn;
>> +}
>> +EXPORT_SYMBOL_GPL(panic_set_handling);
> This doesn't seem like something that should be exported unless it's absolutely
> necessary, and it shouldn't be necessary as of this series.
>
>> +
>>  /**
>>   *	panic - halt the system
>>   *	@fmt: The text string to print
>> @@ -467,6 +491,9 @@ void panic(const char *fmt, ...)
>>  	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
>>  	nbcon_atomic_flush_unsafe();
>>  
>> +	if (panic_halt)
>> +		panic_halt();
>> +
>>  	local_irq_enable();
>>  	for (i = 0; ; i += PANIC_TIMER_STEP) {
>>  		touch_softlockup_watchdog();
>> -- 
>> 2.47.1
>>

Agree with all. Will fix in v3.


Thanks,

Carlos

