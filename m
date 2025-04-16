Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BEC1A8F94
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812900; cv=none; b=J8K9Bhq2uxE75m1dQ4tnAmpiJo7WNY/1wn1Nyg92I17bx7vNITZw73axmawUXHF3Do5ZiPLFHjmRXZ8u+JLP/LOuof7nPFxfkGWHFUjoVkJX2//v9S/MkEydE8DOFpPVbxZw4iIh09Ozivj7G15gL/Np7/rKyr+zBfttWuccUpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812900; c=relaxed/simple;
	bh=3x5OaYQDwIeAIXvSiLkHybStHbAsU4aIhwnAD3hO8Os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+rW0yCC+OlWIy0G48H8GpS3G5ErNjV6e6vJH4QPhkdH65szuZgRyb8e1MWxvwr9R454dAWeyBDu53oQevkw+/IeEtltwb/26eFt1NZRFSIeMnUIxzgmDJXhbfYnps8EBM5tRyJqzsv0lUNHm1RC5HH/qvtUD+/Yb8vT6Qp1p40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Q76sJtIO; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Q76sJtIO"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GAPjeJ019213;
	Wed, 16 Apr 2025 14:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fw+4qA
	IeH8GppoB3Dpdxl65rHsOdNDXHqXD7J2qvEck=; b=Q76sJtIO5hJCE5U0y8uqBY
	oFDv/Vi0+LdIJEkYSDBrp/LkxxTTWlaoCu1O7FqO0rHfxIxW83Y+/PIx/9FzRggn
	r8GK13tbepbT8JtK3XOVjWhO+Kvefwm+liuV3kLnoyaa3MXAig7lxLxj2G5fIFgg
	kVAB2iYcjFhg1imnwOXL9VvT2bIUaL/hAPM17qTPh/fktWz4UfCQlVcW0S4LdJYT
	LMW8Z4do6ZW8IGQizwadSiQb1Jl5N6x9hg9ZrTZnMajkIQcRQ0cvyoyhFq4Ww98C
	DJU0aWLSESFnAV+f32RxPvlgRyrzlWqgU1igy7hDR2AaWRARVUisOHbod70YTDTA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461yj545ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 14:14:51 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GB987b017199;
	Wed, 16 Apr 2025 14:14:50 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46040m0h9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 14:14:50 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GEElDt58720610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 14:14:47 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94C1120043;
	Wed, 16 Apr 2025 14:14:47 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF8F620040;
	Wed, 16 Apr 2025 14:14:45 +0000 (GMT)
Received: from [9.124.210.196] (unknown [9.124.210.196])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 14:14:45 +0000 (GMT)
Message-ID: <6fe46df2-2c80-4e2f-89a4-43f79e554f65@linux.ibm.com>
Date: Wed, 16 Apr 2025 19:44:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Tim Chen
 <tim.c.chen@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
        Doug Nelson <doug.nelson@intel.com>,
        Mohini Narkhede <mohini.narkhede@intel.com>,
        linux-kernel@vger.kernel.org
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
 <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
 <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com>
 <517b6aac-7fbb-4c28-a0c4-086797f5c2eb@linux.ibm.com>
 <CAKfTPtBF353mFXrqdm9_QbfhDJKsvOpjvER+p+X61XEeAd=URA@mail.gmail.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <CAKfTPtBF353mFXrqdm9_QbfhDJKsvOpjvER+p+X61XEeAd=URA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -t1FaXVzCoHKNwnSILZpg_OYQMiSIEdE
X-Proofpoint-ORIG-GUID: -t1FaXVzCoHKNwnSILZpg_OYQMiSIEdE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160115



On 4/16/25 15:17, Vincent Guittot wrote:
> On Wed, 16 Apr 2025 at 11:29, Shrikanth Hegde <sshegde@linux.ibm.com> wrote:
>>
>>
>>
>> On 4/16/25 14:46, Shrikanth Hegde wrote:
>>>
>>>
>>> On 4/16/25 11:58, Chen, Yu C wrote:
>>>> Hi Shrikanth,
>>>>
>>>> On 4/16/2025 1:30 PM, Shrikanth Hegde wrote:
>>>>>
>>>>>
>>>>> On 4/16/25 09:28, Tim Chen wrote:
>>>>>> At load balance time, balance of last level cache domains and
>>>>>> above needs to be serialized. The scheduler checks the atomic var
>>>>>> sched_balance_running first and then see if time is due for a load
>>>>>> balance. This is an expensive operation as multiple CPUs can attempt
>>>>>> sched_balance_running acquisition at the same time.
>>>>>>
>>>>>> On a 2 socket Granite Rapid systems enabling sub-numa cluster and
>>>>>> running OLTP workloads, 7.6% of cpu cycles are spent on cmpxchg of
>>>>>> sched_balance_running.  Most of the time, a balance attempt is aborted
>>>>>> immediately after acquiring sched_balance_running as load balance time
>>>>>> is not due.
>>>>>>
>>>>>> Instead, check balance due time first before acquiring
>>>>>> sched_balance_running. This skips many useless acquisitions
>>>>>> of sched_balance_running and knocks the 7.6% CPU overhead on
>>>>>> sched_balance_domain() down to 0.05%.  Throughput of the OLTP workload
>>>>>> improved by 11%.
>>>>>>
>>>>>
>>>>> Hi Tim.
>>>>>
>>>>> Time check makes sense specially on large systems mainly due to
>>>>> NEWIDLE balance.
>>>
>>> scratch the NEWLY_IDLE part from that comment.
>>>
>>>>>
>>>>
>>>> Could you elaborate a little on this statement? There is no timeout
>>>> mechanism like periodic load balancer for the NEWLY_IDLE, right?
>>>
>>> Yes. NEWLY_IDLE is very opportunistic.
>>>
>>>>
>>>>> One more point to add, A lot of time, the CPU which acquired
>>>>> sched_balance_running,
>>>>> need not end up doing the load balance, since it not the CPU meant to
>>>>> do the load balance.
>>>>>
>>>>> This thread.
>>>>> https://lore.kernel.org/all/1e43e783-55e7-417f-
>>>>> a1a7-503229eb163a@linux.ibm.com/
>>>>>
>>>>>
>>>>> Best thing probably is to acquire it if this CPU has passed the time
>>>>> check and as well it is
>>>>> actually going to do load balance.
>>>>>
>>>>>
>>>>
>>>> This is a good point, and we might only want to deal with periodic load
>>>> balancer rather than NEWLY_IDLE balance. Because the latter is too
>>>> frequent and contention on the sched_balance_running might introduce
>>>> high cache contention.
>>>>
>>>
>>> But NEWLY_IDLE doesn't serialize using sched_balance_running and can
>>> endup consuming a lot of cycles. But if we serialize using
>>> sched_balance_running, it would definitely cause a lot contention as is.
>>>
>>>
>>> The point was, before acquiring it, it would be better if this CPU is
>>> definite to do the load balance. Else there are chances to miss the
>>> actual load balance.
>>>
>>>
>>
>> Sorry, forgot to add.
>>
>> Do we really need newidle running all the way till NUMA? or if it runs till PKG is it enough?
>> the regular (idle) can take care for NUMA by serializing it?
>>
>> -               if (sd->flags & SD_BALANCE_NEWIDLE) {
>> +               if (sd->flags & SD_BALANCE_NEWIDLE && !(sd->flags & SD_SERIALIZE)) {
> 
> Why not just clearing SD_BALANCE_NEWIDLE in your sched domain when you
> set SD_SERIALIZE

Hi Vincent.

There is even kernel parameter "relax_domain_level" which one can make use of.
concern was newidle does this without acquiring the sched_balance_running,
while busy,idle try to acquire this for NUMA.



Slightly different topic: It(kernel parameter) also resets SHCED_BALANCE_WAKE. But is it being used?
I couldn't find out how it is used.

> 
>>
>>                           pulled_task = sched_balance_rq(this_cpu, this_rq,
>>                                                      sd, CPU_NEWLY_IDLE,
>>
>>
>> Anyways, having a policy around this SD_SERIALIZE would be a good thing.
>>
>>>> thanks,
>>>> Chenyu
>>>>
>>>>>> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
>>>>>> Reported-by: Mohini Narkhede <mohini.narkhede@intel.com>
>>>>>> Tested-by: Mohini Narkhede <mohini.narkhede@intel.com>
>>>>>> ---
>>>>>>    kernel/sched/fair.c | 16 ++++++++--------
>>>>>>    1 file changed, 8 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>>>>> index e43993a4e580..5e5f7a770b2f 100644
>>>>>> --- a/kernel/sched/fair.c
>>>>>> +++ b/kernel/sched/fair.c
>>>>>> @@ -12220,13 +12220,13 @@ static void sched_balance_domains(struct
>>>>>> rq *rq, enum cpu_idle_type idle)
>>>>>>            interval = get_sd_balance_interval(sd, busy);
>>>>>> -        need_serialize = sd->flags & SD_SERIALIZE;
>>>>>> -        if (need_serialize) {
>>>>>> -            if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
>>>>>> -                goto out;
>>>>>> -        }
>>>>>> -
>>>>>>            if (time_after_eq(jiffies, sd->last_balance + interval)) {
>>>>>> +            need_serialize = sd->flags & SD_SERIALIZE;
>>>>>> +            if (need_serialize) {
>>>>>> +                if (atomic_cmpxchg_acquire(&sched_balance_running,
>>>>>> 0, 1))
>>>>>> +                    goto out;
>>>>>> +            }
>>>>>> +
>>>>>>                if (sched_balance_rq(cpu, rq, sd, idle,
>>>>>> &continue_balancing)) {
>>>>>>                    /*
>>>>>>                     * The LBF_DST_PINNED logic could have changed
>>>>>> @@ -12238,9 +12238,9 @@ static void sched_balance_domains(struct rq
>>>>>> *rq, enum cpu_idle_type idle)
>>>>>>                }
>>>>>>                sd->last_balance = jiffies;
>>>>>>                interval = get_sd_balance_interval(sd, busy);
>>>>>> +            if (need_serialize)
>>>>>> +                atomic_set_release(&sched_balance_running, 0);
>>>>>>            }
>>>>>> -        if (need_serialize)
>>>>>> -            atomic_set_release(&sched_balance_running, 0);
>>>>>>    out:
>>>>>>            if (time_after(next_balance, sd->last_balance + interval)) {
>>>>>>                next_balance = sd->last_balance + interval;
>>>>>
>>>
>>

