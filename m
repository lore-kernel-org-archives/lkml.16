Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206DC35942
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743683834; cv=none; b=SwjmsIsdPCzKmfph67ALq7bclk4Ddz05+pP1ff80/YSYg8QOQ/ExHglbU5VZAePl5ZnWpzvYRpDmhhpIZGaD53Wgr3G3bepYSXH1RaKHJ+IMepb2s/m2dmdDFNpUTFKxlvWqMsXrvuQVxZEUxHyb1vVto/PFbRVB+05wLpxFnOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743683834; c=relaxed/simple;
	bh=9JfbGM5lU7PuxknVqe46Se3WgOsZiWSxCpdCcxfyr90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3YrBN62T+9aI94uTyW8nHyiLY6B4mmVC4sOOXn3w2505Dtx4YG1Ne1U6eNtF1o9S6yg0iz1wX4hE+kxa6+658nTeJQ4aBJh4ykAzGILPMFDA9nioCAi6muQgysoluGE51XZOmoGOV6HBhFeMbpOPl1FegGj0vfr/q0p6Pm9bIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E69BC106F;
	Thu,  3 Apr 2025 05:37:05 -0700 (PDT)
Received: from [10.1.31.52] (e127648.arm.com [10.1.31.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B82B3F59E;
	Thu,  3 Apr 2025 05:36:59 -0700 (PDT)
Message-ID: <54919a25-b898-407c-a4d7-4ce53907cf75@arm.com>
Date: Thu, 3 Apr 2025 13:36:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7 v5] sched/fair: Rework EAS to handle more cases
To: Vincent Guittot <vincent.guittot@linaro.org>, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, lukasz.luba@arm.com, rafael.j.wysocki@intel.com,
 pierre.gondois@arm.com, linux-kernel@vger.kernel.org
Cc: qyousef@layalina.io, hongyan.xia2@arm.com, luis.machado@arm.com,
 qperret@google.com
References: <20250302210539.1563190-1-vincent.guittot@linaro.org>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20250302210539.1563190-1-vincent.guittot@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/2/25 21:05, Vincent Guittot wrote:
> The current Energy Aware Scheduler has some known limitations which have
> became more and more visible with features like uclamp as an example. This
> serie tries to fix some of those issues:
> - tasks stacked on the same CPU of a PD
> - tasks stuck on the wrong CPU.
> 
> Patch 1 fixes the case where a CPU is wrongly classified as overloaded
> whereas it is capped to a lower compute capacity. This wrong classification
> can prevent periodic load balancer to select a group_misfit_task CPU
> because group_overloaded has higher priority.
> 
> Patch 2 creates a new EM interface that will be used by Patch 3
> 
> Patch 3 fixes the issue of tasks being stacked on same CPU of a PD whereas
> others might be a better choice. feec() looks for the CPU with the highest
> spare capacity in a PD assuming that it will be the best CPU from a energy
> efficiency PoV because it will require the smallest increase of OPP.
> This is often but not always true, this policy filters some others CPUs
> which would be as efficients because of using the same OPP but with less
> running tasks as an example.
> In fact, we only care about the cost of the new OPP that will be
> selected to handle the waking task. In many cases, several CPUs will end
> up selecting the same OPP and as a result having the same energy cost. In
> such cases, we can use other metrics to select the best CPU with the same
> energy cost. Patch 3 rework feec() to look 1st for the lowest cost in a PD
> and then the most performant CPU between CPUs. At now, this only tries to
> evenly spread the number of runnable tasks on CPUs but this can be
> improved with other metric like the sched slice duration in a follow up
> series.
> 
> perf sched pipe on a dragonboard rb5 has been used to compare the overhead
> of the new feec() vs current implementation.
> 
> 9 iterations of perf bench sched pipe -T -l 80000
>                 ops/sec  stdev 
> tip/sched/core  16634    (+/- 0.5%)
> + patches 1-3   17434    (+/- 1.2%)  +4.8%
> 
> 
> Patch 4 removed the now unused em_cpu_energy()
> 
> Patch 5 solves another problem with tasks being stuck on a CPU forever
> because it doesn't sleep anymore and as a result never wakeup and call
> feec(). Such task can be detected by comparing util_avg or runnable_avg
> with the compute capacity of the CPU. Once detected, we can call feec() to
> check if there is a better CPU for the stuck task. The call can be done in
> 2 places:
> - When the task is put back in the runnnable list after its running slice
>   with the balance callback mecanism similarly to the rt/dl push callback.
> - During cfs tick when there is only 1 running task stuck on the CPU in
>   which case the balance callback can't be used.
> 
> This push callback mecanism with the new feec() algorithm ensures that
> tasks always get a chance to migrate on the best suitable CPU and don't
> stay stuck on a CPU which is no more the most suitable one. As examples:
> - A task waking on a big CPU with a uclamp max preventing it to sleep and
>   wake up, can migrate on a smaller CPU once it's more power efficient.
> - The tasks are spread on CPUs in the PD when they target the same OPP.
> 
> Patch 6 adds task misfit migration case in the cfs tick and push callback
> mecanism to prevent waking up an idle cpu unnecessarily.
> 
> Patch 7 removes the need of testing uclamp_min in cpu_overutilized to
> trigger the active migration of a task on another CPU.
> 
> Compared to v4:
> - Fixed check_pushable_task for !SMP
> 
> Compared to v3:
> - Fixed the empty functions
> 
> Compared to v2:
> - Renamed the push and tick functions to ease understanding what they do.
>   Both are kept in the same patch as they solve the same problem.
> - Created some helper functions
> - Fixing some typos and comments
> - The task_stuck_on_cpu() condition remains unchanged. Pierre suggested to
>   take into account the min capacity of the CPU but the is not directly
>   available right now. It can trigger feec() when uclamp_max is very low
>   compare to the min capacity of the CPU but the feec() should keep 
>   returning the same CPU. This can be handled in a follow on patch
> 
> Compared to v1:
> - The call to feec() even when overutilized has been removed
> from this serie and will be adressed in a separate series. Only the case
> of uclamp_min has been kept as it is now handled by push callback and
> tick mecanism.
> - The push mecanism has been cleanup, fixed and simplified.
> 
> This series implements some of the topics discussed at OSPM [1]. Other
> topics will be part of an other serie
> 
> [1] https://youtu.be/PHEBAyxeM_M?si=ZApIOw3BS4SOLPwp
> 
> Vincent Guittot (7):
>   sched/fair: Filter false overloaded_group case for EAS
>   energy model: Add a get previous state function
>   sched/fair: Rework feec() to use cost instead of spare capacity
>   energy model: Remove unused em_cpu_energy()
>   sched/fair: Add push task mechanism for EAS
>   sched/fair: Add misfit case to push task mecanism for EAS
>   sched/fair: Update overutilized detection
> 
>  include/linux/energy_model.h | 111 ++----
>  kernel/sched/fair.c          | 721 ++++++++++++++++++++++++-----------
>  kernel/sched/sched.h         |   2 +
>  3 files changed, 518 insertions(+), 316 deletions(-)
> 

Hi Vincent,
so I've invested some time into running tests with the series.
To further narrow down which patch we can attribute a change in
behavior I've compared the following:
- Patches 1 to 3 applied, comparing your proposed feec() (B)
only to the baseline feec() (A).
- All patches applied, using a static branch to enable (C) and
disable (D) push mechanism for misfit tasks (if disabled only
the 'tasks stuck on CPU' mechanism triggers here).

I've looked at
1) YouTube 4K video playback
2) Dr.Arm (in-house ARM game)
3) VideoScroller which loads a new video every 3s
4) Idle screen on
5) Speedometer2.0 in Chromium

The device tested is the Pixel6 with 6.12 kernel + backported
scheduler patches.
For power measurements the onboard energy-meter is used [1].

Mainline feec() A is the baseline for all. All workloads are run for
10mins with the exception of Speedometer 2.0
(one iteration each for 5 iterations with cooldowns).

1) YouTube 4K video
+4.5% power with all other tested (the regression already shows with B,
no further change with C & D).
(cf. +18.5% power with CAS).
The power regression comes from increased average frequency on all
3 clusters.
No dropped frames in all tested A to D.

2)  Dr.Arm (in-house ARM game)
+9.9% power with all other tested (the regression already shows with B,
no further change with C & D).
(cf. +3.7% power with CAS, new feec() performs worse than CAS here.)
The power regression comes from increased average frequency on all
3 clusters.

3) VideoScroller
No difference in terms of power for A to D.
Specifically even the push mechanism with misfit enabled/disabled
doesn't make a noticeable difference in per-cluster energy numbers.

4) Idle screen on
No difference in power for all for A to D.

5) Speedometer2.0 in Chromium
Both power and score comparable for A to D.

As mentioned in the thread already the push mechanism
(without misfit tasks) (D) triggers only once every 2-20 minutes,
depending on the workload (all tested here were without any
UCLAMP_MAX tasks).
I also used the device manually just to check if I'm not missing
anything here, I wasn't.
This push task mechanism shouldn't make any difference without
UCLAMP_MAX.

The increased average frequency in 1) and 2) is caused by the
deviation from max-spare-cap in feec(), which previously ensured
as much headroom as possible until we have to raise the OPP of the
cluster.

So all in all this regresses power on some crucial EAS workloads.
I couldn't find a real-world workload where the
'less co-scheduling/contention' strategy of feec() showed a benefit.
Did you have a specific workload for this in mind?

[1]
https://tooling.sites.arm.com/lisa/latest/sections/api/generated/lisa.analysis.pixel6.Pixel6Analysis.html#lisa.analysis.pixel6.Pixel6Analysis.df_power_meter
