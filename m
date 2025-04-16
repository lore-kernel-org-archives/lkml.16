Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3709E22D4E0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800697; cv=none; b=BkFPkHKUCnOevFDI81BCJvd1HO5xSTvaWKJ8RwRv0T2h4o3yLycbUF+YtZQ/3aZy1Ns4fZV92dmrc8LeioiCfiPN8sHBzkU5teuuXz1Fjz8yG8KJfk1vicaSpCSK7ZqApSAcO6hBif/1oT+mh1f6r4BmSSoeSB2WMvAe6fVZ+6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800697; c=relaxed/simple;
	bh=ahT9wI9fOESw4vQlm+WcV/yM3wjsrK83TikSywaLj0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=anQ5F/WgybvaGDI3OacOfFMQPK3FDfw2upptc6292P3ow0Fbx6dZxPgI8dq9wGKKYEXzRmv0UmXoHgjN40n+Hk2u+UOuuuSYBIM9m6Ra38MQ09j9HtUZ9CgpyHVMatTBi2IUEQEjv1PXNaW+qm2EbAFwu/u89u95vyzeMCOkcV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F3DE152B;
	Wed, 16 Apr 2025 03:51:32 -0700 (PDT)
Received: from [10.57.70.193] (unknown [10.57.70.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F8C73F66E;
	Wed, 16 Apr 2025 03:51:30 -0700 (PDT)
Message-ID: <c86d2b0e-9640-46ff-b069-1ffa1805117a@arm.com>
Date: Wed, 16 Apr 2025 11:51:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7 v5] sched/fair: Rework EAS to handle more cases
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, lukasz.luba@arm.com,
 rafael.j.wysocki@intel.com, pierre.gondois@arm.com,
 linux-kernel@vger.kernel.org, qyousef@layalina.io, hongyan.xia2@arm.com,
 luis.machado@arm.com, qperret@google.com
References: <20250302210539.1563190-1-vincent.guittot@linaro.org>
 <54919a25-b898-407c-a4d7-4ce53907cf75@arm.com>
 <CAKfTPtAL+jomuj7nuoOkoGCDPURiKmmL51uZqj-wwY4hBuanOQ@mail.gmail.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <CAKfTPtAL+jomuj7nuoOkoGCDPURiKmmL51uZqj-wwY4hBuanOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/15/25 14:49, Vincent Guittot wrote:
> Hi Christian,
> 
> On Thu, 3 Apr 2025 at 14:37, Christian Loehle <christian.loehle@arm.com> wrote:
>>
>> On 3/2/25 21:05, Vincent Guittot wrote:
>>> The current Energy Aware Scheduler has some known limitations which have
>>> became more and more visible with features like uclamp as an example. This
>>> serie tries to fix some of those issues:
>>> - tasks stacked on the same CPU of a PD
>>> - tasks stuck on the wrong CPU.
>>>
> 
> ...
> 
>>>
>>>  include/linux/energy_model.h | 111 ++----
>>>  kernel/sched/fair.c          | 721 ++++++++++++++++++++++++-----------
>>>  kernel/sched/sched.h         |   2 +
>>>  3 files changed, 518 insertions(+), 316 deletions(-)
>>>
>>
>> Hi Vincent,
>> so I've invested some time into running tests with the series.
>> To further narrow down which patch we can attribute a change in
>> behavior I've compared the following:
>> - Patches 1 to 3 applied, comparing your proposed feec() (B)
>> only to the baseline feec() (A).
>> - All patches applied, using a static branch to enable (C) and
>> disable (D) push mechanism for misfit tasks (if disabled only
>> the 'tasks stuck on CPU' mechanism triggers here).
>>
>> I've looked at
>> 1) YouTube 4K video playback
>> 2) Dr.Arm (in-house ARM game)
>> 3) VideoScroller which loads a new video every 3s
>> 4) Idle screen on
>> 5) Speedometer2.0 in Chromium
>>
>> The device tested is the Pixel6 with 6.12 kernel + backported
>> scheduler patches.
> 
> What do you mean by "6.12 kernel + backported scheduler patches" ? Do
> you mean android mainline v6.12 ?

Yes, in particular with the following patches backported:
(This series is here in the shortlog)
PM: EM: Add min/max available performance state limits  
sched/fair: Fix variable declaration position  
sched/fair: Do not try to migrate delayed dequeue task  
sched/fair: Rename cfs_rq.nr_running into nr_queued  
sched/fair: Remove unused cfs_rq.idle_nr_running  
sched/fair: Rename cfs_rq.idle_h_nr_running into h_nr_idle  
sched/fair: Removed unsued cfs_rq.h_nr_delayed  
sched/fair: Use the new cfs_rq.h_nr_runnable  
sched/fair: Add new cfs_rq.h_nr_runnable  
sched/fair: Rename h_nr_running into h_nr_queued  
sched/eevdf: More PELT vs DELAYED_DEQUEUE  
sched/fair: Fix sched_can_stop_tick() for fair tasks  
sched/fair: optimize the PLACE_LAG when se->vlag is zero  

> 
> I run my test with android mainline v6.13 + scheduler patches for
> v6.14 and v6.15-rc1. Do you mean the same ? v6.12 misses a number of
> important patches in regards to threads accounting

Which ones in particular do you think are critical?
I'm also happy to just use your branch for testing, so we align on
a common base, if you're willing to share it.
I'm not happy about having to test on backported kernels either, but
as long as this is necessary we might as well just share branches of
Android mainline kernel backports for EAS patches, we all do the
backports anyway.

> 
>> For power measurements the onboard energy-meter is used [1].
> 
> same for me
> 
>>
>> Mainline feec() A is the baseline for all. All workloads are run for
>> 10mins with the exception of Speedometer 2.0
>> (one iteration each for 5 iterations with cooldowns).
> 
> What do you mean exactly by (one iteration each for 5 iterations with
> cooldowns) ?

So for Speedometer 2.0 I do:
Run one iteration.
Wait until device is cooled down (all temp sensors <30C).
Repeat 5x.

> 
>>
>> 1) YouTube 4K video
> 
> I'd like to reproduce this use case because my test with 4k video
> playback shows similar or slightly better power consumption (2%) with
> this patch.
> 
> Do you have details about this use case that you can share ?

Sure, in that case it's just a 5 hour long sample video without
ads in between. I then static-branch between e.g. the two feec()s.
to collect the numbers.
1m of stabilising between static branch switches were energy numbers
are disregarded.

> 
> 
>> +4.5% power with all other tested (the regression already shows with B,
>> no further change with C & D).
>> (cf. +18.5% power with CAS).
>> The power regression comes from increased average frequency on all
>> 3 clusters.
> 
> I'm interested to understand why the average frequency increases as
> the OPP remains the 1st level of selection and in case of light loaded
> use cases we should not see much difference. That's what I see on my
> 4k video playback use case

Well the OPPs may be quite far apart and while max-spare-cap strategy
will optimally balance the util within the cluster, this series deviates
from that, so you will raise OPP earlier once the util of the CPUs in
the cluster grow.
For illustration here's the OPP table for the tested Pixel 6:
CPU    Freq (kHz)    ΔFreq   Capacity   ΔCap 
cpu0   300000        0        26         0     
cpu0   574000        274000   50         24    
cpu0   738000        164000   65         15    
cpu0   930000        192000   82         17    
cpu0   1098000       168000   97         15    
cpu0   1197000       99000    106        9     
cpu0   1328000       131000   117        11    
cpu0   1401000       73000    124        7     
cpu0   1598000       197000   141        17    
cpu0   1704000       106000   151        10    
cpu0   1803000       99000    160        9  
cpu4   400000        0        88         0     
cpu4   553000        153000   122        34    
cpu4   696000        143000   153        31    
cpu4   799000        103000   176        23    
cpu4   910000        111000   201        25    
cpu4   1024000       114000   226        25    
cpu4   1197000       173000   264        38    
cpu4   1328000       131000   293        29    
cpu4   1491000       163000   329        36    
cpu4   1663000       172000   367        38    
cpu4   1836000       173000   405        38    
cpu4   1999000       163000   441        36    
cpu4   2130000       131000   470        29    
cpu4   2253000       123000   498        28   
cpu6   500000        0        182        0     
cpu6   851000        351000   311        129   
cpu6   984000        133000   359        48    
cpu6   1106000       122000   404        45    
cpu6   1277000       171000   466        62    
cpu6   1426000       149000   521        55    
cpu6   1582000       156000   578        57    
cpu6   1745000       163000   637        59    
cpu6   1826000       81000    667        30    
cpu6   2048000       222000   748        81    
cpu6   2188000       140000   799        51    
cpu6   2252000       64000    823        24    
cpu6   2401000       149000   877        54    
cpu6   2507000       106000   916        39    
cpu6   2630000       123000   961        45    
cpu6   2704000       74000    988        27    
cpu6   2802000       98000    1024       36

A hypothetical util distribution on the little for OPP0
would be:
0:5 1:16 2:17 3:18
when now placing a util=2 task max-spare-cap will obviously
pick CPU0, while you may deviate form that also picking any
of CPU1-3. For CPU3 even a single util increase will raise
the OPP of the cluster.
As util are never that stable the balancing effect of
max-spare-cap is helping preserve energy.

On big (CPU6) OPP0 -> OPP1 the situation is even worse if the
util numbers above are too small to be convincing.

> 
> And I will also look at why the CAS is better in your case
> 
>> No dropped frames in all tested A to D.
>>
>> 2)  Dr.Arm (in-house ARM game)
>> +9.9% power with all other tested (the regression already shows with B,
>> no further change with C & D).
>> (cf. +3.7% power with CAS, new feec() performs worse than CAS here.)
>> The power regression comes from increased average frequency on all
>> 3 clusters.
> 
> I supposed that I won't be able to reproduce this one

Not really, although given that the YT case is similar I don't
think this would be a one-off. Probably any comparable 3D action
game will do (our internally is just really nice to automate
obviously).

> 
>>
>> 3) VideoScroller
>> No difference in terms of power for A to D.
>> Specifically even the push mechanism with misfit enabled/disabled
>> doesn't make a noticeable difference in per-cluster energy numbers.
>>
>> 4) Idle screen on
>> No difference in power for all for A to D.
> 
> I see a difference here mainly for DDR power consumption with 7%
> saving compared to mainline and 2% on the CPU clusters

Honestly the stddev on these is so high that something needs to go
quite badly to show something significant in this, just wanted to
include it.

> 
>>
>> 5) Speedometer2.0 in Chromium
>> Both power and score comparable for A to D.
>>
>> As mentioned in the thread already the push mechanism
>> (without misfit tasks) (D) triggers only once every 2-20 minutes,
>> depending on the workload (all tested here were without any
>> UCLAMP_MAX tasks).
>> I also used the device manually just to check if I'm not missing
>> anything here, I wasn't.
>> This push task mechanism shouldn't make any difference without
>> UCLAMP_MAX.
> 
> On the push mechanism side, I'm surprised that you don't get more push
> than once every 2-20 minutes. On the speedometer, I've got around 170
> push fair and 600 check pushable which ends with a task migration
> during the 75 seconds of the test and much more calls that ends with
> the same cpu. This also needs to be compared with the 70% of
> overutilized state during the 75 seconds of the time during which we
> don't push. On light loaded case, the condition is currently to
> conservative to trigger push task mechanism but that's also expected
> in order to be conservative

Does that include misfit pushes? I'd be interested if our results
vastly differ here. Just to reiterate, this is without misfit pushes,
only the "stuck on CPU" case introduced by 5/7.

> 
> The fact that OU triggers too quickly limits the impact of push and feec rework

I'm working on a series here :)

> 
> uclamp_max sees a difference with the push mechanism which is another
> argument for using it.

I don't doubt that, but there's little to test with real-world use-cases
really...

> 
> And this is 1st step is quite conservative before extending the cases
> which can benefit from push and feec rework as explained  at OSPM
> 

Right, I actually do see an appeal of having the push mechanism in fair/EAS,
but of course also the series introducing it should have sufficient convincing
benefits.

