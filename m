Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A5221C18A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744998941; cv=none; b=aatg5HvbXzjylTfStVy/JanyNyWsT4jv9aGlwQUsikLPDQBHnDR5ry4c2RTxwS6ZFQu5GZyPXCt1Ju8Ka38UNbuvGIBhpgE+NOgbvWmAQ0EC4jvi8/Fyd9/VFacpKqM+Dg+YgI1jTFvM+DY/f/kiNSSZZ4AmmV+y+VtB32D+PAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744998941; c=relaxed/simple;
	bh=Az61ZHcAwecu5GZZSEsrTNNYt6sl7xOgpx6OI4SLP2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2G5tEeXf3JlNzOriO3WZCRM8c6rsoFg1TgsyowWnj3YHg1VJ+PVFAFMOcXeM7LhSUwr6FgG1ADEPDX2VUFjX8why7mmwSavK6O46zBRfb+4hw5iGjDsYWO+c89Oz2ggj8utnmHPRapMCGm09WNAlYV3/2dyUiRxxv7KLV3eRlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=jItW/q6g; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="jItW/q6g"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IAfUFh012886;
	Fri, 18 Apr 2025 17:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/lob/8
	we70Ns3kqHcUBD6hmGaTTXYcT9VkQCaO5LOSU=; b=jItW/q6gzSRG+aSRYRZ6IK
	YBfqPM/lDBYA4psKDngkfzpsawCgDG82uHzkNa8LbtVw1hB68NCG73omT0P7fluR
	koCMFZTM4hwOWE5G18TZhPGnHQBAfqkwYw1DDKIrTWQTTKSLjiMa9hBTr9+q7nUV
	MB0YvUoFh+Tl4w2wb/4kbVWl9KQTkM37C7NHz9McWRP6pMf68ok3AzpDThQKR9nr
	ny6h7rzruA88STBum7HKHgtNyeGV9Ndd/sjAgL5XyInUaDFZXFuOryqBfcGhOXr6
	WeQMIusjuntEnwQKWak8KSt6Sm8sKSwTaHFaHErdapNKcB4u80MzJOXP6yG9dXoQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 463n6sss3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 17:55:25 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53IGUS1V010424;
	Fri, 18 Apr 2025 17:55:24 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4604qkks6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 17:55:24 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53IHtMIA46727474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 17:55:22 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9C5A20040;
	Fri, 18 Apr 2025 17:55:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89A5220043;
	Fri, 18 Apr 2025 17:55:20 +0000 (GMT)
Received: from [9.39.29.55] (unknown [9.39.29.55])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Apr 2025 17:55:20 +0000 (GMT)
Message-ID: <a7dca9ec-9f7b-4d7f-aa3f-9a68cf6430a7@linux.ibm.com>
Date: Fri, 18 Apr 2025 23:25:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Vincent Guittot <vincent.guittot@linaro.org>,
        K Prateek Nayak <kprateek.nayak@amd.com>
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
 <6fe46df2-2c80-4e2f-89a4-43f79e554f65@linux.ibm.com>
 <CAKfTPtDcFTGai=HsFUgrrUWZ-Dxq0D3RtCSSVsyXaXBXc2W=sw@mail.gmail.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <CAKfTPtDcFTGai=HsFUgrrUWZ-Dxq0D3RtCSSVsyXaXBXc2W=sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=cd/SrmDM c=1 sm=1 tr=0 ts=6802920d cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=QyXUC8HyAAAA:8 a=J8b-sVnshJJiTtD9ZN8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: C84alTp7_3AoT5AJVsQ-qLBZFChD52Lg
X-Proofpoint-GUID: C84alTp7_3AoT5AJVsQ-qLBZFChD52Lg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_06,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180131



On 4/18/25 20:32, Vincent Guittot wrote:
> On Wed, 16 Apr 2025 at 16:14, Shrikanth Hegde <sshegde@linux.ibm.com> wrote:
>>
>>
>>
>> On 4/16/25 15:17, Vincent Guittot wrote:
>>> On Wed, 16 Apr 2025 at 11:29, Shrikanth Hegde <sshegde@linux.ibm.com> wrote:
>>>>
>>>>
>>>>
>>>> On 4/16/25 14:46, Shrikanth Hegde wrote:
>>>>>
>>>>>
>>>>> On 4/16/25 11:58, Chen, Yu C wrote:
>>>>>> Hi Shrikanth,
>>>>>>
>>>>>> On 4/16/2025 1:30 PM, Shrikanth Hegde wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 4/16/25 09:28, Tim Chen wrote:
>>>>>>>> At load balance time, balance of last level cache domains and
>>>>>>>> above needs to be serialized. The scheduler checks the atomic var
>>>>>>>> sched_balance_running first and then see if time is due for a load
>>>>>>>> balance. This is an expensive operation as multiple CPUs can attempt
>>>>>>>> sched_balance_running acquisition at the same time.
>>>>>>>>
>>>>>>>> On a 2 socket Granite Rapid systems enabling sub-numa cluster and
>>>>>>>> running OLTP workloads, 7.6% of cpu cycles are spent on cmpxchg of
>>>>>>>> sched_balance_running.  Most of the time, a balance attempt is aborted
>>>>>>>> immediately after acquiring sched_balance_running as load balance time
>>>>>>>> is not due.
>>>>>>>>
>>>>>>>> Instead, check balance due time first before acquiring
>>>>>>>> sched_balance_running. This skips many useless acquisitions
>>>>>>>> of sched_balance_running and knocks the 7.6% CPU overhead on
>>>>>>>> sched_balance_domain() down to 0.05%.  Throughput of the OLTP workload
>>>>>>>> improved by 11%.
>>>>>>>>
>>>>>>>
>>>>>>> Hi Tim.
>>>>>>>
>>>>>>> Time check makes sense specially on large systems mainly due to
>>>>>>> NEWIDLE balance.
>>>>>
>>>>> scratch the NEWLY_IDLE part from that comment.
>>>>>
>>>>>>>
>>>>>>
>>>>>> Could you elaborate a little on this statement? There is no timeout
>>>>>> mechanism like periodic load balancer for the NEWLY_IDLE, right?
>>>>>
>>>>> Yes. NEWLY_IDLE is very opportunistic.
>>>>>
>>>>>>
>>>>>>> One more point to add, A lot of time, the CPU which acquired
>>>>>>> sched_balance_running,
>>>>>>> need not end up doing the load balance, since it not the CPU meant to
>>>>>>> do the load balance.
>>>>>>>
>>>>>>> This thread.
>>>>>>> https://lore.kernel.org/all/1e43e783-55e7-417f-
>>>>>>> a1a7-503229eb163a@linux.ibm.com/
>>>>>>>
>>>>>>>
>>>>>>> Best thing probably is to acquire it if this CPU has passed the time
>>>>>>> check and as well it is
>>>>>>> actually going to do load balance.
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> This is a good point, and we might only want to deal with periodic load
>>>>>> balancer rather than NEWLY_IDLE balance. Because the latter is too
>>>>>> frequent and contention on the sched_balance_running might introduce
>>>>>> high cache contention.
>>>>>>
>>>>>
>>>>> But NEWLY_IDLE doesn't serialize using sched_balance_running and can
>>>>> endup consuming a lot of cycles. But if we serialize using
>>>>> sched_balance_running, it would definitely cause a lot contention as is.
>>>>>
>>>>>
>>>>> The point was, before acquiring it, it would be better if this CPU is
>>>>> definite to do the load balance. Else there are chances to miss the
>>>>> actual load balance.
>>>>>
>>>>>
>>>>
>>>> Sorry, forgot to add.
>>>>
>>>> Do we really need newidle running all the way till NUMA? or if it runs till PKG is it enough?
>>>> the regular (idle) can take care for NUMA by serializing it?
>>>>
>>>> -               if (sd->flags & SD_BALANCE_NEWIDLE) {
>>>> +               if (sd->flags & SD_BALANCE_NEWIDLE && !(sd->flags & SD_SERIALIZE)) {
>>>
>>> Why not just clearing SD_BALANCE_NEWIDLE in your sched domain when you
>>> set SD_SERIALIZE
>>
>> Hi Vincent.
>>
>> There is even kernel parameter "relax_domain_level" which one can make use of.
>> concern was newidle does this without acquiring the sched_balance_running,
>> while busy,idle try to acquire this for NUMA.
>>
>>
>>
>> Slightly different topic: It(kernel parameter) also resets SHCED_BALANCE_WAKE. But is it being used?
>> I couldn't find out how it is used.
> 
> Hi Shrikanth,
> 
> The define below does the link
> 
> #define WF_TTWU 0x08 /* Wakeup;            maps to SD_BALANCE_WAKE */
> 
> int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
> ..
>    wake_flags |= WF_TTWU;
> ..
>    cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
>          select_task_rq_fair()
>            int sd_flag = wake_flags & 0xF;
> ..
>            for_each_domain(cpu, tmp) {
> ..
>              if (tmp->flags & sd_flag)
> 

Thanks Vincent, Prateek.

>>
>>>
>>>>
>>>>                            pulled_task = sched_balance_rq(this_cpu, this_rq,
>>>>                                                       sd, CPU_NEWLY_IDLE,
>>>>
>>>>
>>>> Anyways, having a policy around this SD_SERIALIZE would be a good thing.
>>>>
>>>>>> thanks,
>>>>>> Chenyu
>>>>>>
>>>>>>>> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
>>>>>>>> Reported-by: Mohini Narkhede <mohini.narkhede@intel.com>
>>>>>>>> Tested-by: Mohini Narkhede <mohini.narkhede@intel.com>
>>>>>>>> ---
>>>>>>>>     kernel/sched/fair.c | 16 ++++++++--------
>>>>>>>>     1 file changed, 8 insertions(+), 8 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>>>>>>> index e43993a4e580..5e5f7a770b2f 100644
>>>>>>>> --- a/kernel/sched/fair.c
>>>>>>>> +++ b/kernel/sched/fair.c
>>>>>>>> @@ -12220,13 +12220,13 @@ static void sched_balance_domains(struct
>>>>>>>> rq *rq, enum cpu_idle_type idle)
>>>>>>>>             interval = get_sd_balance_interval(sd, busy);
>>>>>>>> -        need_serialize = sd->flags & SD_SERIALIZE;
>>>>>>>> -        if (need_serialize) {
>>>>>>>> -            if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
>>>>>>>> -                goto out;
>>>>>>>> -        }
>>>>>>>> -
>>>>>>>>             if (time_after_eq(jiffies, sd->last_balance + interval)) {
>>>>>>>> +            need_serialize = sd->flags & SD_SERIALIZE;
>>>>>>>> +            if (need_serialize) {
>>>>>>>> +                if (atomic_cmpxchg_acquire(&sched_balance_running,
>>>>>>>> 0, 1))
>>>>>>>> +                    goto out;
>>>>>>>> +            }
>>>>>>>> +
>>>>>>>>                 if (sched_balance_rq(cpu, rq, sd, idle,
>>>>>>>> &continue_balancing)) {
>>>>>>>>                     /*
>>>>>>>>                      * The LBF_DST_PINNED logic could have changed
>>>>>>>> @@ -12238,9 +12238,9 @@ static void sched_balance_domains(struct rq
>>>>>>>> *rq, enum cpu_idle_type idle)
>>>>>>>>                 }
>>>>>>>>                 sd->last_balance = jiffies;
>>>>>>>>                 interval = get_sd_balance_interval(sd, busy);
>>>>>>>> +            if (need_serialize)
>>>>>>>> +                atomic_set_release(&sched_balance_running, 0);
>>>>>>>>             }
>>>>>>>> -        if (need_serialize)
>>>>>>>> -            atomic_set_release(&sched_balance_running, 0);
>>>>>>>>     out:
>>>>>>>>             if (time_after(next_balance, sd->last_balance + interval)) {
>>>>>>>>                 next_balance = sd->last_balance + interval;
>>>>>>>
>>>>>
>>>>
>>

