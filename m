Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89901215772
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823481; cv=none; b=tIo/mWP2+oCe9/mQjKfzKmAm3tVdZLtuQa+sFmXxZr9gwm4GUwZ8NUUvo51ZCZJn/HD9WTai/eRpU+KiHr37yALp3uhA4XMkWD8Bm9lMMOdTXG5+/+iTvPLfgTJ01LGME5uS7p4rCs3G3bLFfEprmQQ4wBBIZeV54osKB2mCjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823481; c=relaxed/simple;
	bh=H+QJKyrakfmxDrSkZ8vpU4JemR3kQTXrUUsKDmte2rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLiywMW2XPbouODPF6nUjpiZpQYDo/OnIC9fZ793B1UU/DAAErD5vgU0Ruhgpo8R4oUH/It3CEntMJfzzRtmzrPYWoDxIVVnuwL94su/CB5F162fWCC3Hebeyaw5xtlNssQvRM5Yx8u5I/EYfqcs3od6CKvlOll3U2oRKYrsEy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CZ362OOU; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CZ362OOU"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9ODvU019181;
	Wed, 16 Apr 2025 17:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PIatWZ
	tnYeQbd5VpD51SRziN68IBvZ63HBtr0WYfAxA=; b=CZ362OOUO7zPRkdeQpCEIZ
	rPlssh/1Ziqm2HK9/tC5/FwwP998mMutRRc5JQw2H/G4p8mZeoRP4Dh1UQDacXe6
	ckt0vJYqR0DGzYbADtKIq3rsvvTRxRiNytKpwbzM7QacqT4U/EinBOkGuhTHWa6Q
	hRaPBg+ptT6JXm2p+MVisKgRPIOWmx4G34KgJJEsfbEUk1WF42XtnrZN4PIghfpZ
	jf2CCnu5nZJ0d9fho5j3N/5UBh6lKoQUWuBj4DJyt0TPaXtdjSPEzhm9CW0GJlem
	v6Wu3Qkc1Wz4OrJj4z+hspw9gID7R8+r5VfFQwD11rXN+b+m2ut+5fCZ8W74WmsA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461y1gd81v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 17:11:11 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GFxPjq010438;
	Wed, 16 Apr 2025 17:11:11 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4604qk946f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 17:11:10 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GHB9Ae13173020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 17:11:09 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39E582004B;
	Wed, 16 Apr 2025 17:11:09 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5425C20040;
	Wed, 16 Apr 2025 17:11:07 +0000 (GMT)
Received: from [9.124.210.196] (unknown [9.124.210.196])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 17:11:07 +0000 (GMT)
Message-ID: <ec3390d8-0431-46cb-a38c-a7764dff0f29@linux.ibm.com>
Date: Wed, 16 Apr 2025 22:41:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Tim Chen <tim.c.chen@linux.intel.com>, "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Doug Nelson <doug.nelson@intel.com>,
        Mohini Narkhede <mohini.narkhede@intel.com>,
        linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
 <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
 <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com>
 <23e05939e7a19151d9b17d011e48a85d650b4e8a.camel@linux.intel.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <23e05939e7a19151d9b17d011e48a85d650b4e8a.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O7DSBvjm48uaMSWlJL_S15X8CwY7laMJ
X-Proofpoint-GUID: O7DSBvjm48uaMSWlJL_S15X8CwY7laMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504160139



On 4/16/25 21:49, Tim Chen wrote:
> On Wed, 2025-04-16 at 14:46 +0530, Shrikanth Hegde wrote:
>>
>> On 4/16/25 11:58, Chen, Yu C wrote:
>>> Hi Shrikanth,
>>>
>>> On 4/16/2025 1:30 PM, Shrikanth Hegde wrote:
>>>>
>>>>
>>>> On 4/16/25 09:28, Tim Chen wrote:
>>>>> At load balance time, balance of last level cache domains and
>>>>> above needs to be serialized. The scheduler checks the atomic var
>>>>> sched_balance_running first and then see if time is due for a load
>>>>> balance. This is an expensive operation as multiple CPUs can attempt
>>>>> sched_balance_running acquisition at the same time.
>>>>>
>>>>> On a 2 socket Granite Rapid systems enabling sub-numa cluster and
>>>>> running OLTP workloads, 7.6% of cpu cycles are spent on cmpxchg of
>>>>> sched_balance_running.  Most of the time, a balance attempt is aborted
>>>>> immediately after acquiring sched_balance_running as load balance time
>>>>> is not due.
>>>>>
>>>>> Instead, check balance due time first before acquiring
>>>>> sched_balance_running. This skips many useless acquisitions
>>>>> of sched_balance_running and knocks the 7.6% CPU overhead on
>>>>> sched_balance_domain() down to 0.05%.  Throughput of the OLTP workload
>>>>> improved by 11%.
>>>>>
>>>>
>>>> Hi Tim.
>>>>
>>>> Time check makes sense specially on large systems mainly due to
>>>> NEWIDLE balance.
>>
>> scratch the NEWLY_IDLE part from that comment.
>>
>>>>
>>>
>>> Could you elaborate a little on this statement? There is no timeout
>>> mechanism like periodic load balancer for the NEWLY_IDLE, right?
>>
>> Yes. NEWLY_IDLE is very opportunistic.
>>
>>>
>>>> One more point to add, A lot of time, the CPU which acquired
>>>> sched_balance_running,
>>>> need not end up doing the load balance, since it not the CPU meant to
>>>> do the load balance.
>>>>
>>>> This thread.
>>>> https://lore.kernel.org/all/1e43e783-55e7-417f-
>>>> a1a7-503229eb163a@linux.ibm.com/
>>>>
>>>>
>>>> Best thing probably is to acquire it if this CPU has passed the time
>>>> check and as well it is
>>>> actually going to do load balance.
>>>>
>>>>
>>>
>>> This is a good point, and we might only want to deal with periodic load
>>> balancer rather than NEWLY_IDLE balance. Because the latter is too
>>> frequent and contention on the sched_balance_running might introduce
>>> high cache contention.
>>>
>>
>> But NEWLY_IDLE doesn't serialize using sched_balance_running and can
>> endup consuming a lot of cycles. But if we serialize using
>> sched_balance_running, it would definitely cause a lot contention as is.
>>
>>
>> The point was, before acquiring it, it would be better if this CPU is
>> definite to do the load balance. Else there are chances to miss the
>> actual load balance.
>>
> You mean doing a should_we_balance() check?  I think we should not
> even consider that if balance time is not due and this balance due check should
> come first.

Time check first makes sense.

> 
> Do you have objection to switching the order of the time due check and serialization/sched_balance_running
> around as in this patch?  Adding a change to see if this is the right balancing CPU could be
> an orthogonal change.

This check could come after the time check. Even after the time check, 
CPU may acquire it only to release later, while a legit CPU couldn't 
acquire it and bailed out.

> 
> 97% of CPU cycles in sched_balance_domains() are not spent doing useful load balancing work,
> but simply in the acquisition of sched_balance_running in the OLTP workload we tested.
> 
>           :
>           : 104              static __always_inline int arch_atomic_cmpxchg(atomic_t *v, int old, int new)
>           : 105              {
>           : 106              return arch_cmpxchg(&v->counter, old, new);
>      0.00 :   ffffffff81138f8e:       xor    %eax,%eax
>      0.00 :   ffffffff81138f90:       mov    $0x1,%ecx
>      0.00 :   ffffffff81138f95:       lock cmpxchg %ecx,0x2577d33(%rip)        # ffffffff836b0cd0 <sched_balance_running>
>           : 110              sched_balance_domains():
>           : 12146            if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
>     97.01 :   ffffffff81138f9d:       test   %eax,%eax
>      0.00 :   ffffffff81138f9f:       jne    ffffffff81138fbb <sched_balance_domains+0x20b>
>           : 12150            if (time_after_eq(jiffies, sd->last_balance + interval)) {
>      0.00 :   ffffffff81138fa1:       mov    0x16cfa18(%rip),%rax        # ffffffff828089c0 <jiffies_64>
>      0.00 :   ffffffff81138fa8:       sub    0x48(%r14),%rax
>      0.00 :   ffffffff81138fac:       cmp    %rdx,%rax
>      0.00 :   ffffffff81138faf:       jns    ffffffff8113900f <sched_balance_domains+0x25f>
>           : 12155            raw_atomic_set_release():
> 
> So trying to skip this unnecessary acquisition and consider load balancing only when time is due.
> 
> Tim
> 
>>
>>> thanks,
>>> Chenyu
>>>
>>>>> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
>>>>> Reported-by: Mohini Narkhede <mohini.narkhede@intel.com>
>>>>> Tested-by: Mohini Narkhede <mohini.narkhede@intel.com>
>>>>> ---
>>>>>    kernel/sched/fair.c | 16 ++++++++--------
>>>>>    1 file changed, 8 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>>>> index e43993a4e580..5e5f7a770b2f 100644
>>>>> --- a/kernel/sched/fair.c
>>>>> +++ b/kernel/sched/fair.c
>>>>> @@ -12220,13 +12220,13 @@ static void sched_balance_domains(struct rq
>>>>> *rq, enum cpu_idle_type idle)
>>>>>            interval = get_sd_balance_interval(sd, busy);
>>>>> -        need_serialize = sd->flags & SD_SERIALIZE;
>>>>> -        if (need_serialize) {
>>>>> -            if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
>>>>> -                goto out;
>>>>> -        }
>>>>> -
>>>>>            if (time_after_eq(jiffies, sd->last_balance + interval)) {
>>>>> +            need_serialize = sd->flags & SD_SERIALIZE;
>>>>> +            if (need_serialize) {
>>>>> +                if (atomic_cmpxchg_acquire(&sched_balance_running,
>>>>> 0, 1))
>>>>> +                    goto out;
>>>>> +            }
>>>>> +
>>>>>                if (sched_balance_rq(cpu, rq, sd, idle,
>>>>> &continue_balancing)) {
>>>>>                    /*
>>>>>                     * The LBF_DST_PINNED logic could have changed
>>>>> @@ -12238,9 +12238,9 @@ static void sched_balance_domains(struct rq
>>>>> *rq, enum cpu_idle_type idle)
>>>>>                }
>>>>>                sd->last_balance = jiffies;
>>>>>                interval = get_sd_balance_interval(sd, busy);
>>>>> +            if (need_serialize)
>>>>> +                atomic_set_release(&sched_balance_running, 0);
>>>>>            }
>>>>> -        if (need_serialize)
>>>>> -            atomic_set_release(&sched_balance_running, 0);
>>>>>    out:
>>>>>            if (time_after(next_balance, sd->last_balance + interval)) {
>>>>>                next_balance = sd->last_balance + interval;
>>>>
>>
>>
> 

