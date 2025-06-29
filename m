Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84A51DFCB
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 23:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751238505; cv=none; b=pa6FHHx58vhzrId+RNhJLoxQacUCuPua0MZGJqqmpEGuCX17REtIOT0XXxYYv79goHjnClqUAHdFirwU4iCEz+sRKPfAdJD67BoOs6t3T/TeOI94aTUf0GV+l6bgFZEfwNfJUQfQ7pxyNxXwKIB2+x4SLkNxZ22nJ4Xop3D557I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751238505; c=relaxed/simple;
	bh=OZXsHrFSM4+Ship8C4ND4nwrCr5qxqNxzU0KghHQ1bw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WWtoX4+ZbB0VOIhyy/Pj4diTLqaaHApfQeZoC3iAM1Dos17+ASsmJsiHxsHru3bTMnjtUgXgq6vaOgp0zP9awivqcjlE+45ETBqVJk256U8A22r6WRRAWbFKJdqF4nqcJtq5p9bV1NA8QcpXROumayHdoH71qqdpNr9X8LIdapE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C3sKg8eJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C3sKg8eJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751238501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BuuqTAfMtUiF+6U6niY1E+CfmNvnpTe10muLSTKhmJA=;
	b=C3sKg8eJ74BYwDFSsWtDup1/REM7+fYU33D127D4FskfTxZjaj5N0xdXrU6G+OCkIO29L6
	GMPUaoA420sKPrUMapbNbNuQA4CJS14I5zIiEIg0E94UQNLnT/dMsKVa4e2SX8g29uQv3k
	SyGoD7kH4YNX1mKZxxwPoAApV4x6dsk=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-36CodzuRPiC7EMshGq4CLg-1; Sun, 29 Jun 2025 19:08:20 -0400
X-MC-Unique: 36CodzuRPiC7EMshGq4CLg-1
X-Mimecast-MFC-AGG-ID: 36CodzuRPiC7EMshGq4CLg_1751238499
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74ad608d60aso1274486b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 16:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751238499; x=1751843299;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BuuqTAfMtUiF+6U6niY1E+CfmNvnpTe10muLSTKhmJA=;
        b=UTXB/ztr2g1JVAp+qo9W5JjfdZRQ3I5yPtNq7ErJI1t8BjFjlFo6/EsIa2SQidceLa
         b0nLO7ExYn8INGsLP4uJOLfc/db8d/lQgcvx2+1vckWwWuxnjrPcbwOHdATlioxWo12W
         1xry7Js0/qTl9oKx05rfyyNTVWuii8pIGh5QyXIa+E6YPnb1GqEO7aqV8bYWPpIM0rHl
         q6y4iuV9C6aPUmQ4IFqihCqy5jCYU2aqbrdGdOTQE51q5pE9D1xoU+/Al96q/8pmGbH6
         Q990Aeoo7B/dhgYyj+JJHLVCuT8rsCtuQkuxnDTeqvMUkvh/Zr/vBUGBioQtXE3PcAnW
         4+Dw==
X-Gm-Message-State: AOJu0YxgXmJpnH3BF0rjouGZnutBDv4jLE22S88RtXjALkKchszntY4f
	Da7NWCBIFvIUPoHBdlaoYpoIaik6JsoQkKiMMTc/GUEMbgp9lCkRYJQudwqvAb5ULAA07EkJB5S
	bRdyv1LYtNO+AAFxaM/ZAqJ/W27gb/0qGWqfaFPRnkTTLNECajyWZCPOzqI/yELC5iA==
X-Gm-Gg: ASbGnct5l+73zAHTp6AQps01LlHhbFwUI3iMyhpW6WdDNzhkLQfkq2yv54XbZHE4iRO
	dz6a+W5365I2QiWIGUsJ/Pn1Kvw6BJEJ9UHgCwMGGjKAwnug9ZYuT24sJsaQcAAF7tYkJG15Z3Z
	ttptofW6WdgW+MiXx5/eTbR+pBRXVkA5ReMNTybiqd/dWO3zHWiQiH5oN2cAb0XRX/Tc9e1oCDY
	PPYZM2hx3VMfblHIzSJOK3Gd9O3e/iHC7HrfKxCBY42oCsjpskg+36qyQ9wKQPX2GbM2yEhpT/i
	Mc4ddcPfcEDD7KQVQb+LEL2qYkkc7nOkfUo+pPMuXWAINgwC668qAdf9jl9jv6ZFcq+S
X-Received: by 2002:a05:6a00:889:b0:748:6a1f:6d3b with SMTP id d2e1a72fcca58-74af6f43cb7mr15950450b3a.19.1751238499028;
        Sun, 29 Jun 2025 16:08:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHewLdpj1kiOhtFFEPk7DRWJgi5Bl/6H5dAEvqL67GoOKmwZYZuTNe81JVMRIOF2y640aWybA==
X-Received: by 2002:a05:6a00:889:b0:748:6a1f:6d3b with SMTP id d2e1a72fcca58-74af6f43cb7mr15950427b3a.19.1751238498683;
        Sun, 29 Jun 2025 16:08:18 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55786e3sm7263114b3a.72.2025.06.29.16.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 16:08:17 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <1e4d39d0-8905-4ede-9c9b-c771b0b6016b@redhat.com>
Date: Sun, 29 Jun 2025 19:08:17 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] sched/deadline: Initialize dl_servers after SMP
To: Waiman Long <llong@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org,
 Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
 Luca Abeni <luca.abeni@santannapisa.it>
References: <20250627115118.438797-1-juri.lelli@redhat.com>
 <20250627115118.438797-2-juri.lelli@redhat.com>
 <1e39c473-d161-4ad0-bfdc-8a306f57135f@redhat.com>
Content-Language: en-US
In-Reply-To: <1e39c473-d161-4ad0-bfdc-8a306f57135f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Resend again.

On 6/29/25 6:48 PM, Waiman Long wrote:
> On 6/27/25 7:51 AM, Juri Lelli wrote:
>> dl-servers are currently initialized too early at boot when CPUs are not
>> fully up (only boot CPU is). This results in miscalculation of per
>> runqueue DEADLINE variables like extra_bw (which needs a stable CPU
>> count).
>>
>> Move initialization of dl-servers later on after SMP has been
>> initialized and CPUs are all online, so that CPU count is stable and
>> DEADLINE variables can be computed correctly.
>>
>> Fixes: d741f297bceaf ("sched/fair: Fair server interface")
>> Reported-by: Marcel Ziswiler<marcel.ziswiler@codethink.co.uk>
>> Signed-off-by: Juri Lelli<juri.lelli@redhat.com>
>> ---
>>   kernel/sched/core.c     |  2 ++
>>   kernel/sched/deadline.c | 50 ++++++++++++++++++++++++++---------------
>>   kernel/sched/sched.h    |  1 +
>>   3 files changed, 35 insertions(+), 18 deletions(-)
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 2f8caa9db78d5..89b3ed637465b 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -8371,6 +8371,8 @@ void __init sched_init_smp(void)
>>   	init_sched_rt_class();
>>   	init_sched_dl_class();
>>   
>> +	sched_init_dl_servers();
>> +
>>   	sched_smp_initialized = true;
>>   }
>>   
>> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
>> index 0f30697ad7956..c1f223f372968 100644
>> --- a/kernel/sched/deadline.c
>> +++ b/kernel/sched/deadline.c
>> @@ -761,6 +761,8 @@ static inline void setup_new_dl_entity(struct sched_dl_entity *dl_se)
>>   	struct dl_rq *dl_rq = dl_rq_of_se(dl_se);
>>   	struct rq *rq = rq_of_dl_rq(dl_rq);
>>   
>> +	update_rq_clock(rq);
>> +
>>   	WARN_ON(is_dl_boosted(dl_se));
>>   	WARN_ON(dl_time_before(rq_clock(rq), dl_se->deadline));
>>   
>> @@ -1580,23 +1582,7 @@ void dl_server_start(struct sched_dl_entity *dl_se)
>>   {
>>   	struct rq *rq = dl_se->rq;
>>   
>> -	/*
>> -	 * XXX: the apply do not work fine at the init phase for the
>> -	 * fair server because things are not yet set. We need to improve
>> -	 * this before getting generic.
>> -	 */
>> -	if (!dl_server(dl_se)) {
>> -		u64 runtime =  50 * NSEC_PER_MSEC;
>> -		u64 period = 1000 * NSEC_PER_MSEC;
>> -
>> -		dl_server_apply_params(dl_se, runtime, period, 1);
>> -
>> -		dl_se->dl_server = 1;
>> -		dl_se->dl_defer = 1;
>> -		setup_new_dl_entity(dl_se);
>> -	}
>> -
>> -	if (!dl_se->dl_runtime)
>> +	if (!dl_server(dl_se))
>>   		return;
>>   
>>   	dl_se->dl_server_active = 1;
>> @@ -1607,7 +1593,7 @@ void dl_server_start(struct sched_dl_entity *dl_se)
>>   
>>   void dl_server_stop(struct sched_dl_entity *dl_se)
>>   {
>> -	if (!dl_se->dl_runtime)
>> +	if (!dl_server(dl_se) || !dl_server_active(dl_se))
>>   		return;
>>   
>>   	dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);
>> @@ -1626,6 +1612,32 @@ void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
>>   	dl_se->server_pick_task = pick_task;
>>   }
>>   
>> +void sched_init_dl_servers(void)
>> +{
>> +	int cpu;
>> +	struct rq *rq;
>> +	struct sched_dl_entity *dl_se;
>> +
>> +	for_each_online_cpu(cpu) {
>> +		u64 runtime =  50 * NSEC_PER_MSEC;
>> +		u64 period = 1000 * NSEC_PER_MSEC;
>> +
>> +		rq = cpu_rq(cpu);
>> +
>> +		guard(rq_lock_irq)(rq);
>> +
>> +		dl_se = &rq->fair_server;
>> +
>> +		WARN_ON(dl_server(dl_se));
>> +
>> +		dl_server_apply_params(dl_se, runtime, period, 1);
>> +
>> +		dl_se->dl_server = 1;
>> +		dl_se->dl_defer = 1;
>> +		setup_new_dl_entity(dl_se);
>> +	}
>> +}
>> +
>>   void __dl_server_attach_root(struct sched_dl_entity *dl_se, struct rq *rq)
>>   {
>>   	u64 new_bw = dl_se->dl_bw;
>> @@ -1652,6 +1664,8 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
>>   	int retval = 0;
>>   	int cpus;
>>   
>> +	guard(rcu)();
>> +
>
> Your patch doesn't explain why a RCU guard is needed here? 
> sched_init_dl_servers() is the changed caller, but it is called with 
> rq_lock_irq held which should implies a RCU read critical section as 
> IRQ is disabled.
>
> Cheers, Longman
>

