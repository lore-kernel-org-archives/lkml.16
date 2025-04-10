Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE10281529
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294873; cv=none; b=S56djLYA0PD9dIUXykkdCErNjCPtD1E+VdslBmz1DxlHyCkxainf18tUG0SvfPzENd2hWTr7cc9yGE0Ma1zk/ZOn6M8x7FYc4oFEDwfCo6QbR+47Dm1z+62vP8QByfV3nO7oEfYiA+Gx7Rh0J+x9wqE0SxRlgNXZrwlTfPjPHPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294873; c=relaxed/simple;
	bh=k19zo6NgN1RtJdI2WGGkCm/U2LISnu98hMuh6FAH3wk=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:References:
	 In-Reply-To:Content-Type; b=Or8mzStxYgUfRvhROh4eC+u4vZgMDh75bko79v9G78H8UlnW313kgO8SagL1ccUkwgaE1wo+08kkKXHQTzPmdjLRHgYUpv8it39+uOtcjb3JnIZJ2Lrogu2i5RFn9KCdjApy9zjrE5Ev6cN/y0U4ugftVdfQ4EuN6YMvhBKayGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DVV3XASq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DVV3XASq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744294869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bx7lIoicn5a+UucE6tR2RPS9aJDJFej1A4OLz4rnBRA=;
	b=DVV3XASq3oG5lRztoSZq876s79LziCenzgfxC/Nk2eD9ZsQlhcDYqOdl+hN+6t4rWYrjC4
	Ffz2KomzF7UH+rYh6UbIlWm/LJ0126MEp62ydbrHAYtm19j+aLPolA9g2sLXmtHoGixFo3
	9S6KAoj8IGxdwwR5O7vhYmvVTBvIuOY=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-a0EsvDTZPtKEdlzqkk0HDw-1; Thu, 10 Apr 2025 10:21:08 -0400
X-MC-Unique: a0EsvDTZPtKEdlzqkk0HDw-1
X-Mimecast-MFC-AGG-ID: a0EsvDTZPtKEdlzqkk0HDw_1744294868
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b4dc23f03so261484539f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294868; x=1744899668;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bx7lIoicn5a+UucE6tR2RPS9aJDJFej1A4OLz4rnBRA=;
        b=KO/cGooMBP8+InFiPFZ4oA7+HqV4f1nCGfPiQUXKCWEn7+RzLuHe4JnCEXXAr/Ra0L
         9qUSpgu7DzMXtCfpSMiw00Y95jStXNHx/CX7jACOS05KhMe4m8QcEy8WEIjM7tgKcgZi
         d+eTeYyC/KdNMbG0BTIRZ2CmqGgo/ZlVry0ddc9N1lggaTsM4nCWikW8dGMogO3Jml0l
         Y+nmrtXi8SVTvJcZHr7Iwzs0Ie4vDjTIi5c3X+41F05Ct1Ge23YlyrInZ5Ms9z7toPcm
         x89xrhuFvMALx3IXawee64mzna6v2aOTx+9FHewt3VohZ9h1LEoDcNnCQD8DG4T+KTjC
         WERg==
X-Forwarded-Encrypted: i=1; AJvYcCXgP+ezpWUWIIMyuoN5ieCzdkAMqctJ4OY9LfG5C2oyM2chwaRsAiW/YV6UjpJKFSbXOKIJgcRRU2de5Xc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1KCZvma255j0M/4ZFCdvWHDOlV+y8BD/khzA4rcPmmjZ/IwLR
	qBKO4mJBd3BBZwHaMQOxaESIuFLOMZPB7kTkw2B3T9e7zSlB5tr/pneiX1ql1nOjZ5fav1oxAtC
	2hY3wYzfGS/sKj/E5l/hZQpCNEk5lUAg8GFWKfNfXaDw/o9lMw39fX+5tDxrWh/RSMDkc9A==
X-Gm-Gg: ASbGncuwlgMtuJVqC1h2bWnldW8ezhpe1IsQrh5ZMmaURswpT974EGDrZJ/YgtIne9C
	U5ZPAjZUbpKyi7zQWEHnp52DpiajafbVV/uv/XB1+TenzAIIR1WqWj7KGE6sEov4u8W5tMTck/a
	VjCEbuLz9LTclLZ/7StRQDUNxq2CzlpLlfTjALpphbjg3yBJ3SoVzH2sqE+0egu8NljXInHz4XN
	RkSJT+QtAhxbAn2BxEYohGfk2JTAa6G6PcQEiAFGvXCnzmqultT3+AnyumE2Sp1uvgyGYCllQg2
	XdOhesml0LZsped/DpBLAqJd4J69vjo1+r9xkYI2nJUz9AE5UYZoFHFnNg==
X-Received: by 2002:a05:6e02:1805:b0:3d6:cbc5:a102 with SMTP id e9e14a558f8ab-3d7e470e5b5mr29394115ab.13.1744294867532;
        Thu, 10 Apr 2025 07:21:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE49InDiBLldEWuQzeORJqip5faN/utQ1tUNiX8ccWkeFNyddhUAWGUeh74VDTGP+JeR0Tvgw==
X-Received: by 2002:a05:6e02:1805:b0:3d6:cbc5:a102 with SMTP id e9e14a558f8ab-3d7e470e5b5mr29393705ab.13.1744294867160;
        Thu, 10 Apr 2025 07:21:07 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e79504sm746516173.144.2025.04.10.07.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 07:21:06 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <b122fbf7-14b9-49a0-a727-97adcca9924b@redhat.com>
Date: Thu, 10 Apr 2025 10:21:05 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
To: Gabriele Monaco <gmonaco@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Frederic Weisbecker <frederic@kernel.org>
References: <20250410065446.57304-2-gmonaco@redhat.com> <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
Content-Language: en-US
In-Reply-To: <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/10/25 6:38 AM, Gabriele Monaco wrote:
> On Thu, 2025-04-10 at 10:26 +0200, Thomas Gleixner wrote:
>> On Thu, Apr 10 2025 at 08:54, Gabriele Monaco wrote:
>>>   
>>> +/*  cpumask excluded from migration */
>>> +static cpumask_var_t tmigr_unavailable_cpumask;
>> Why is this a negated mask instead of being the obvious and intuitive
>> available mask?
> Well, the way I started writing the patch I found it easier to do the
> double andnot in tmigr_isolated_exclude_cpumask to see what changed.
> I see the way it evolved is just messier..
> I'll apply your solution which seems much neater!
>
>>>    if (firstexp != KTIME_MAX) {
>>> - migrator = cpumask_any_but(cpu_online_mask, cpu);
>>> + migrator = cpumask_nth_andnot(0, cpu_possible_mask,
>>> +       tmigr_unavailable_cpumask);
>> That's exactly what this negated mask causes: incomprehensible code.
>>
>>   cpumask_clear_cpu(cpu, available_mask);
>>          ...
>>   migrator = cpumask_first(available_mask);
>>
>> is too simple and obvious, right?
>>
>>> + /* Fall back to any online in case all are isolated. */
>> How can that happen? There is always at least _ONE_ housekeeping,
>> non-isolated, CPU online, no?
>>
> In my understanding it shouldn't, but I'm not sure there's anything
> preventing the user from isolating everything via cpuset.
> Anyway that's something no one in their mind should do, so I guess I'd
> just opt for the cpumask_first (or actually cpumask_any, like before
> the change).

No, cpuset is not allowed to take all the CPUs from the cgroup root 
(housekeeping CPUs). So it can't happen.


>>> + if (migrator >= nr_cpu_ids)
>>> + migrator = cpumask_any_but(cpu_online_mask, cpu);
>>>    work_on_cpu(migrator, tmigr_trigger_active, NULL);
>>>    }
>>>   
>>>    return 0;
>>>   }
>>>   
>>> -static int tmigr_cpu_online(unsigned int cpu)
>>> +static int tmigr_cpu_available(unsigned int cpu)
>>>   {
>>> - struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
>>> + struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
>>>   
>>>    /* Check whether CPU data was successfully initialized */
>>>    if (WARN_ON_ONCE(!tmc->tmgroup))
>>>    return -EINVAL;
>>>   
>>> + /* Silently ignore online requests if isolated */
>> This comment makes no sense.
>>
>>       /* Isolated CPUs are not participating in timer migration */
>>
>> makes it entirely clear what this is about, no?
>>
>> That brings me to the general design decision here. Your changelog
>> explains at great length WHAT the change is doing, but completely
>> fails
>> to explain the consequences and the rationale why this is the right
>> thing to do.
>>
>> By excluding the isolated CPUs from migration completely, any
>> 'global'
>> timer, which is armed on such a CPU, has to be expired on that
>> isolated
>> CPU. That's fundamentaly different from e.g. RCU isolation.
>>
>> It might be the right thing to do and harmless, but without a proper
>> explanation it's a silent side effect of your changes, which leaves
>> people scratching their heads.
> Mmh, essentially the idea is that global timer should not migrate from
> housekeeping to isolated cores. I assumed the opposite never occurs (as
> global timers /should/ not even start on isolated cores on a properly
> isolated system), but you're right, that's not quite true.
>
> Thinking about it now, since global timers /can/ start on isolated
> cores, that makes them quite different from offline ones and probably
> considering them the same is just not the right thing to do..
>
> I'm going to have a deeper thought about this whole approach, perhaps
> something simpler just preventing migration in that one direction would
> suffice.
>
>>> + if (cpu_is_isolated(cpu))
>>> + return 0;
>>>    raw_spin_lock_irq(&tmc->lock);
>>> - trace_tmigr_cpu_online(tmc);
>>> + trace_tmigr_cpu_available(tmc);
>>>    tmc->idle = timer_base_is_idle();
>>>    if (!tmc->idle)
>>>    __tmigr_cpu_activate(tmc);
>>> - tmc->online = true;
>>> + tmc->available = true;
>>> + tmc->idle = true;
>> How so?
>>
>>> + cpumask_clear_cpu(cpu, tmigr_unavailable_cpumask);
>>>    raw_spin_unlock_irq(&tmc->lock);
>>>    return 0;
>>>   }
>>>   
>>> +int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask)
>> cpumask_var_t is wrong here. 'const struct cpumask *' is what you
>> want.
> You mean in the function argument? That's exactly how it is handled in
> workqueue_unbound_exclude_cpumask. I get cpumask_var_t is not
> necessarily a pointer, perhaps it's worth changing it there too..
> Or am I missing your point?

cpumask_var_t can be interchangeable with "struct cpumask *" as long as 
the passed-in cpumask is not being modified.

Cheers,
Longman

