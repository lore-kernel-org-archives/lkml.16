Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344AB1537DA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744770305; cv=none; b=cvddaBmr5LsTjI2mkQMQjHXJSmCfk8yxjrZwUq7YRJzc9Jrw2ImLkzIIPBfDmpuad+WQIK98dCsw/yH3LlHD9dKthMPh7zO1CmJGZW7wPBLKz4Zj+JPdno5lZk0nYWfHOacnZiKBrU5e56ha2GoD5dG9Roh3BQzMxI+A5vSHU4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744770305; c=relaxed/simple;
	bh=GLf3oyzDZQ9ukAuUGTST4DL4bbDfXWw5ttiFpc//sF8=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:References:
	 In-Reply-To:Content-Type; b=YZbH+edF8oA037n/GHg59eM51AByHQ60RcaZeRfK9B1pGMMWQkDK2aHkJ8bmK1kWokd/yPWpvRoEgECfyawINxnvzAIGKoMWmQg698VSXfGw8N1beISlV3iiGoOFcdfBSnN0xPPxRSKbXiY2PvWup2yq2RUDjiQgZITOG3kqRLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RDhnClMM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RDhnClMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744770300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vdBn+mMOUdny+OQK5SQUEYMMXaG5xgewoIiUpNNg8ws=;
	b=RDhnClMMg/0B9PBYDft7q5OSSKr0tlFECboIrCtJISboOtd8apwZiBK9EXy8Z9VX9/49bh
	M6jz/S1dJ3gVCwRDsVssnCpBr31qBfHXs2gAvrlEBJ92i4ADNfnvVQihjQgw5SVqM+uN3y
	Nfk864Oo4sn5RQPOxAqMBHbC6d/HwYI=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-Sqcur2KlOxuJpyI-Px8r3w-1; Tue, 15 Apr 2025 22:24:59 -0400
X-MC-Unique: Sqcur2KlOxuJpyI-Px8r3w-1
X-Mimecast-MFC-AGG-ID: Sqcur2KlOxuJpyI-Px8r3w_1744770298
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b3b781313so945925339f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744770298; x=1745375098;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdBn+mMOUdny+OQK5SQUEYMMXaG5xgewoIiUpNNg8ws=;
        b=IO1qxV7CNeDmMBwSWylMzCXsskfrpWr+0rODuKEU9xDHYAWk7ggELLZ95jt2fmotgx
         wTT/VSYkA1SBadrT/xY7oH+Bzqqt2bjn281C7Np0M6TUUGEtRZJ4fkXdTFL59HMmJDT3
         fNiCdE0/RtPvTEqz3vkZ5sis0o0A7r7ZFQ6m/K5mDfO/rgUJJ9mLDD7In4U1lFG5RX5E
         /6Gu4qV4wIVkl+/8RE+JyU6MFzG2dQ/jU3m4WhNyiJbyV5hhPtzBVVGfqO5wM4gbnMVx
         LUb8os5HUS3jyJLGv6yzadshJ1Pc37dHjMHwk4vdzzbZsuTZY5+JbOyOROcG73RdvMYV
         cOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA67pi9J9vM3DryRQ2VKDI1Kfo710KYifuvSmdvRp+ngMmRVpYoPvJ2R/0vtSdk+IlmdBmNEo+G6wg9ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdWgHBfZlhm3okctLM1qH8bUi88Q79McJm0PcHwmc7UJ/CTGVa
	VHKNRnsLgyalVQmbNsczL0Qr1/g+Mz3K5PC6jwvs/CicpgYRZaApc/GxWwFXa8VOBMUCGRgLwiR
	C3JOLJrxX8v4cFaBNyY9pDgXwsU6K7uUnYpniFtoWBjx2w+rd+qskOGBUB/9b8Q==
X-Gm-Gg: ASbGncshSB6x0At5iuzeMjWdHHsmjPeGQLnvX1iulqlDvxop781NcmXanbvlyR279XW
	/RrVK7Gnd+ZpDP9MuazQVfxsJX19q3VU2zQepWxCkd6DR/c9PGwMredZezhTnfmuGiUFSUASFvU
	7hV5qFmiRG3u6k/hYgADbjsRjHDvsncK2rStqwBQuJD+K23fcVcQm6MprxT8QE9VLWYl1aEzjBo
	JXiKW5V64Nn7XjzrrHU8+hCM1xfuR/oWGkekfNU3H1JJeaO3Q+X1KiVLl2CL09BxKHBkfNwlKzm
	PEiv0/cC5xetZ73gW5x0T2iAsnwjFMcZdlAQ56dTvD+pTZwaGI2deUJZqw==
X-Received: by 2002:a05:6602:6a8d:b0:85d:115b:bb3f with SMTP id ca18e2360f4ac-861bfc2a160mr258319839f.6.1744770298574;
        Tue, 15 Apr 2025 19:24:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5/J5VmwmwbcNjFJ4ge1a86zf8qi5yA90GT5nD8QO+HfWhqdsqDI56izgp72O2rEUBQLG1DA==
X-Received: by 2002:a05:6602:6a8d:b0:85d:115b:bb3f with SMTP id ca18e2360f4ac-861bfc2a160mr258317839f.6.1744770298305;
        Tue, 15 Apr 2025 19:24:58 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8616522dcf2sm275430839f.3.2025.04.15.19.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 19:24:57 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <593e1001-09fa-452f-a8f9-1dfd4f2111d7@redhat.com>
Date: Tue, 15 Apr 2025 22:24:56 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] timers: Exclude isolated cpus from timer migation
To: Gabriele Monaco <gmonaco@redhat.com>, Waiman Long <llong@redhat.com>,
 linux-kernel@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250415102500.100415-5-gmonaco@redhat.com>
 <20250415102500.100415-8-gmonaco@redhat.com>
 <6c9ee628-26d1-423e-801a-2922683d004d@redhat.com>
 <24ae2496778a207faad9edb36dbfef0f02578d72.camel@redhat.com>
Content-Language: en-US
In-Reply-To: <24ae2496778a207faad9edb36dbfef0f02578d72.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/15/25 11:49 AM, Gabriele Monaco wrote:
>
> On Tue, 2025-04-15 at 11:30 -0400, Waiman Long wrote:
>> On 4/15/25 6:25 AM, Gabriele Monaco wrote:
>>> The timer migration mechanism allows active CPUs to pull timers
>>> from
>>> idle ones to improve the overall idle time. This is however
>>> undesired
>>> when CPU intensive workloads run on isolated cores, as the
>>> algorithm
>>> would move the timers from housekeeping to isolated cores,
>>> negatively
>>> affecting the isolation.
>>>
>>> This effect was noticed on a 128 cores machine running oslat on the
>>> isolated cores (1-31,33-63,65-95,97-127). The tool monopolises
>>> CPUs,
>>> and the CPU with lowest count in a timer migration hierarchy (here
>>> 1
>>> and 65) appears as always active and continuously pulls global
>>> timers,
>>> from the housekeeping CPUs. This ends up moving driver work (e.g.
>>> delayed work) to isolated CPUs and causes latency spikes:
>>>
>>> before the change:
>>>
>>>    # oslat -c 1-31,33-63,65-95,97-127 -D 62s
>>>    ...
>>>     Maximum:     1203 10 3 4 ... 5 (us)
>>>
>>> after the change:
>>>
>>>    # oslat -c 1-31,33-63,65-95,97-127 -D 62s
>>>    ...
>>>     Maximum:      10 4 3 4 3 ... 5 (us)
>>>
>>> Exclude isolated cores from the timer migration algorithm, extend
>>> the
>>> concept of unavailable cores, currently used for offline ones, to
>>> isolated ones:
>>> * A core is unavailable if isolated or offline;
>>> * A core is available if isolated and offline;
>> I think you mean "A core is available if NOT isolated and NOT
>> offline".
>> Right?
> Yes, of course.. My bad. Thanks for spotting.
>
>>> A core is considered unavailable as idle if:
What do you mean by "unavailable as idle"? An idle CPU is different from 
an unvailable CPU, I think.
>>> * is in the isolcpus list
>>> * is in the nohz_full list
>>> * is in an isolated cpuset
>>>
>>> Due to how the timer migration algorithm works, any CPU part of the
>>> hierarchy can have their global timers pulled by remote CPUs and
>>> have to
>>> pull remote timers, only skipping pulling remote timers would break
>>> the
>>> logic.
>>> For this reason, we prevents isolated CPUs from pulling remote
>>> global
>>> timers, but also the other way around: any global timer started on
>>> an
>>> isolated CPU will run there. This does not break the concept of
>>> isolation (global timers don't come from outside the CPU) and, if
>>> considered inappropriate, can usually be mitigated with other
>>> isolation
>>> techniques (e.g. IRQ pinning).

BTW, I am not that familiar with the timer migration code. Does marking 
an isolated CPU as unavailable (previously offline) make the above 
behavior happen?

Now unavailable CPUs include the isolated CPUs. We may need to look at 
some of the online (now available) flag check within the timer migration 
code to make sure that they are still doing the right thing.


>>> diff --git a/kernel/time/timer_migration.c
>>> b/kernel/time/timer_migration.c
>>> index 1fae38fbac8c2..6fe6ca798e98d 100644
>>> --- a/kernel/time/timer_migration.c
>>> +++ b/kernel/time/timer_migration.c
>>> @@ -10,6 +10,7 @@
>>>    #include <linux/spinlock.h>
>>>    #include <linux/timerqueue.h>
>>>    #include <trace/events/ipi.h>
>>> +#include <linux/sched/isolation.h>
>>>       #include "timer_migration.h"
>>>    #include "tick-internal.h"
>>> @@ -1445,7 +1446,7 @@ static long tmigr_trigger_active(void
>>> *unused)
>>>       static int tmigr_cpu_unavailable(unsigned int cpu)
>>>    {
>>> -    struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
>>> +    struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
>>>        int migrator;
>>>        u64 firstexp;
>>>    @@ -1472,15 +1473,18 @@ static int tmigr_cpu_unavailable(unsigned
>>> int cpu)
>>>       static int tmigr_cpu_available(unsigned int cpu)
>>>    {
>>> -    struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
>>> +    struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
>>>           /* Check whether CPU data was successfully initialized */
>>>        if (WARN_ON_ONCE(!tmc->tmgroup))
>>>            return -EINVAL;
>>>    +    /* Isolated CPUs don't participate in timer migration */
>>> +    if (cpu_is_isolated(cpu))
>>> +        return 0;
>> There are two main sets of isolated CPUs used by cpu_is_isolated() -
>> boot-time isolated CPUs via "isolcpus" and "nohz_full" boot command
>> time
>> options and runtime isolated CPUs via cpuset isolated partitions. The
>> check for runtime isolated CPUs is redundant here as those CPUs won't
>> be
>> passed to tmigr_cpu_available().
> Since tmigr_cpu_available is shared between isolated and offline CPUs,
> I added this check also to make sure bringing an isolated CPU back
> online won't make it available for tmigr.
Good point, so the check is indeed needed.

>
>> So this call is effectively removing
>> the boot time isolated CPUs away from the available cpumask
>> especially
>> during the boot up process. Maybe you can add some comment about this
>> behavioral change.
>>
> Do you mean I should make clear that the check in tmigr_cpu_available
> is especially meaningful at boot time (i.e. when CPUs are first brought
> online)?

The current timgr code doesn't look at boot time isolated CPUs. The 
cpu_is_isolated() check skips those boot time isolated CPUs from the 
mask. I think this should be noted.

>
> Yeah, I probably should, good point. I had that kind of comment in v1
> while allocating the mask and removed it while changing a few things.
>
> I'm going to make that comment more verbose to clarify when exactly
> it's needed.
Thanks,
Longman

