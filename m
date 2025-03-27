Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8AB1A8F60
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743068146; cv=none; b=K0+C2nvYZA3mKHVO0Cgc29tdDSgV1JHSpOw4EvrH/flK5Sl/h6AQiAp/aD+1XOhc0l78eycBnLz/1V+SF6IrMFUbLxm4CJvjA2INVvwnLcW3mglyb/c8pnpUI+PgPxHrSzJzHDPZzYSJkN33JXGRDaM3mRKLlpyBlSYFQW189mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743068146; c=relaxed/simple;
	bh=Yz/tUxwIyLQ7HNXu+dzXfyR3JnuM1gjbS67S+hWQWqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OnXg0H7NV6rDi7HI4P09XhPCDwTx301/GeDr2NOAxxQNXmdwckDrUmNks6hADVX8Ev4YFjpRGedDTFRhTPBrJhNU7KeaiwF/8TkGt09cK2DRtBrpds8d+/ar33Fgxk9225/dhjbIxNylOzpxYvhxN7FCmHsR+ALuSpYT1yGqEiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23B4A106F;
	Thu, 27 Mar 2025 02:35:48 -0700 (PDT)
Received: from [10.34.129.27] (e126645.nice.arm.com [10.34.129.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5097C3F63F;
	Thu, 27 Mar 2025 02:35:40 -0700 (PDT)
Message-ID: <3c21871b-4936-4143-bc78-38495a7995a6@arm.com>
Date: Thu, 27 Mar 2025 10:35:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: Allow decaying util_est when util_avg > CPU
 capa
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux-kernel@vger.kernel.org, Chritian Loehle <christian.loehle@arm.com>,
 Hongyan Xia <hongyan.xia2@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
References: <20250325150542.1077344-1-pierre.gondois@arm.com>
 <CAKfTPtCfaH6SvBesbKBHRNfjZHJXXC1h4NF8GoFUczE5NiRunQ@mail.gmail.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <CAKfTPtCfaH6SvBesbKBHRNfjZHJXXC1h4NF8GoFUczE5NiRunQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/26/25 18:25, Vincent Guittot wrote:
> On Tue, 25 Mar 2025 at 16:06, Pierre Gondois <pierre.gondois@arm.com> wrote:
>>
>> commit 10a35e6812aa ("sched/pelt: Skip updating util_est when
>> utilization is higher than CPU's capacity")
>> prevents util_est from being updated if util_avg is higher than the
>> underlying CPU capacity to avoid overestimating the task when the CPU
>> is capped (due to thermal issue for instance). In this scenario, the
>> task will miss its deadlines and start overlapping its wake-up events
>> for instance. The task will appear as always running when the CPU is
>> just not powerful enough to allow having a good estimation of the
>> task.
>>
>> commit b8c96361402a ("sched/fair/util_est: Implement faster ramp-up
>> EWMA on utilization increases")
>> sets ewma to util_avg when ewma > util_avg, allowing ewma to quickly
>> grow instead of slowly converge to the new util_avg value when a task
>> profile changes from small to big.
>>
>> However, the 2 conditions:
>> - Check util_avg against max CPU capacity
>> - Check whether util_est > util_avg
>> are placed in an order such as it is possible to set util_est to a
>> value higher than the CPU capacity if util_est > util_avg, but
>> util_est is prevented to decay as long as:
>> CPU capacity < util_avg < util_est.
>>
>> Just remove the check as either:
>> 1.
>> There is idle time on the CPU. In that case the util_avg value of the
>> task is actually correct. It is possible that the task missed a
>> deadline and appears bigger, but this is also the case when the
>> util_avg of the task is lower than the maximum CPU capacity.
>> 2.
>> There is no idle time. In that case, the util_avg value might aswell
>> be an under estimation of the size of the task.
>> It is possible that undesired frequency spikes will appear when the
>> task is later enqueued with an inflated util_est value, but the
>> frequency spike might aswell be deserved. The absence of idle time
>> prevents from drawing any conclusion.
>>
>> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> 
> This change looks reasonable to me. Did you face problems related to
> this in a particular use case ?

I think it was more related to the fact util_est is not decayed when:
(runnable - util_avg) > margin

This patch slightly helps to decay, but not that much.

> 
> Reviewed-by: Vincent Guittot <vincent.guittot@linaro.rog>

Thanks!
> 
> 
>> ---
>>   kernel/sched/fair.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index c798d2795243..de7687e579c2 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -4918,13 +4918,6 @@ static inline void util_est_update(struct cfs_rq *cfs_rq,
>>          if (last_ewma_diff < UTIL_EST_MARGIN)
>>                  goto done;
>>
>> -       /*
>> -        * To avoid overestimation of actual task utilization, skip updates if
>> -        * we cannot grant there is idle time in this CPU.
>> -        */
>> -       if (dequeued > arch_scale_cpu_capacity(cpu_of(rq_of(cfs_rq))))
>> -               return;
>> -
>>          /*
>>           * To avoid underestimate of task utilization, skip updates of EWMA if
>>           * we cannot grant that thread got all CPU time it wanted.
>> --
>> 2.25.1
>>
