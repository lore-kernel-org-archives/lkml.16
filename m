Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6A51754B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745222632; cv=none; b=HQj8VeC5X1rmb8pU1atVgeewFVVZt779vr3GNhgUzIOJHJGHx7H5hPQVxrSXH0pdmKe6Gs5CfPjmA2iuRvYuMdlWJIjTvLB2eE9BphIvpBqv9ukb+VrZL+01xhsHW6fK5Rr6FZPZyw5tDd3cCL0C7WPAlrIHnC1k13kzpJy2DWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745222632; c=relaxed/simple;
	bh=mTSSOjc9BY7rv9+dObcUALYPGq6xd5S1Y5htJx2AGrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CU+HiMkeGVlC8dNLxGQLy6hP7VEHpkIWFo2btmvmEdDaiYJ7horQtS0KX6k+wkW6xCAQ5ouYZh53u3jyP1ehaciquYIbSV4tM0eA9CiG/WaVve4q+Sosof8mglitCqA7d6I8ait//vupbNfR88asnO8gRNdiNWo/+cIWvUKAy9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Sarh4Hij; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Sarh4Hij"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L5EwRS012225;
	Mon, 21 Apr 2025 08:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ekmguc
	FaKnkabu4SsiziAwLD5BsMPOiaOigLsjeC+Ww=; b=Sarh4HijhG4cQmcSzaRYKR
	JZpsdUKayMDKIyvxJ+cg/Bzri9rViOtxS+UijZicKj+R/5TnRlNMiime5eWwJr++
	f87D0dfLF/KTg/1t/dkVQyiNDRUToYXMjvEC6uCLtrKrap2IS3naEjAKBo6a4Z3+
	Siz3dalp2+7lwBbrLrfE7Wa7C7UXo6m0XcVIwCy8QekK0En3Nnc8TFUjclHYaK6x
	v4v38ATIpQ1CEFQXVQp10EKZAsHqEYluCjhX6WpUL7QiBeE4N6cskT0inai5j2gq
	2Tcb7fgcUeMTgTBE6lcLcdNyxlpU8WhcveGfhZIvfYvT/XWBfuO423gRjdHLnoUQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464ycrk7t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 08:03:39 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53L7VOIg012056;
	Mon, 21 Apr 2025 08:03:38 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464ycrk7t4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 08:03:38 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53L4Bxg8027743;
	Mon, 21 Apr 2025 08:03:37 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 464rv1w3ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 08:03:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53L83ZF533554710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 08:03:35 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE2B120043;
	Mon, 21 Apr 2025 08:03:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1E2A20040;
	Mon, 21 Apr 2025 08:03:33 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 08:03:33 +0000 (GMT)
Message-ID: <97aaf3e5-22d7-4020-964c-891ad619bf4f@linux.ibm.com>
Date: Mon, 21 Apr 2025 13:33:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] sched/fair: Update overloaded mask in presence of
 pushable task
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
 <20250409111539.23791-4-kprateek.nayak@amd.com>
 <2dae733a-689c-4574-a4dc-f59f11fb0893@linux.ibm.com>
 <616187d5-e178-4fa5-a0a2-1509f11d1a37@amd.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <616187d5-e178-4fa5-a0a2-1509f11d1a37@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Jp7xrN4C c=1 sm=1 tr=0 ts=6805fbdb cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=zd2uoN0lAAAA:8 a=GRa1xJVZynX9AYvoUZ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Npsl2Xh1SCjYY8FLZggRuGGOtcPXbVaV
X-Proofpoint-ORIG-GUID: oAtxLDNTajegtEpC0zIyP3rK4y7qFsNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_03,2025-04-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210062



On 4/21/25 11:24, K Prateek Nayak wrote:
> Hello Shrikanth,
> 
> On 4/21/2025 10:50 AM, Shrikanth Hegde wrote:
>>
>>
>> On 4/9/25 16:45, K Prateek Nayak wrote:
>>
>> Hi Prateek. Feel free to cc me in the future versions.
> 
> 
> Will do! Thank you for taking a look at the series.
> 
>> This seems interesting way if it can get us rid of newidle balance 
>> overheads.
>>
>>> In presence of pushable tasks on the CPU, set it on the newly introduced
>>> "overloaded+mask" in sched_domain_shared struct. This will be used by
>>> the newidle balance to limit the scanning to these overloaded CPUs since
>>> they contain tasks that could be run on the newly idle target.
>>>
>>> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
>>> ---
>>>   kernel/sched/fair.c | 24 ++++++++++++++++++++++++
>>>   1 file changed, 24 insertions(+)
>>>
>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>> index 98d3ed2078cd..834fcdd15cac 100644
>>> --- a/kernel/sched/fair.c
>>> +++ b/kernel/sched/fair.c
>>> @@ -8559,6 +8559,24 @@ static int find_energy_efficient_cpu(struct 
>>> task_struct *p, int prev_cpu)
>>>       return target;
>>>   }
>>> +static inline void update_overloaded_mask(int cpu, bool 
>>> contains_pushable)
>>> +{
>>> +    struct sched_domain_shared *sd_share = 
>>> rcu_dereference(per_cpu(sd_llc_shared, cpu));
>>> +    cpumask_var_t overloaded_mask;
>>> +
>>> +    if (!sd_share)
>>> +        return;
>>> +
>>> +    overloaded_mask = sd_share->overloaded_mask;
>>> +    if (!overloaded_mask)
>>> +        return;
>>> +
>>> +    if (contains_pushable)
>>> +        cpumask_set_cpu(cpu, overloaded_mask);
>>> +    else
>>> +        cpumask_clear_cpu(cpu, overloaded_mask);
>>> +}
>>> +
>
>> I was getting below error when compiling. Noticed that overloaded_mask 
>> is a local update and it wouldn't
>> update the actual overloaded_mask.
> 
> Interesting! Question: Do you have "CONFIG_CPUMASK_OFFSTACK" enabled in
> your config? (me makes a note to test this too in the next iteration)
> Looking at the arch specific Kconfigs, there is a slight difference in
> how this is toggled on x86 vs powerpc and I'm wondering if that is why
> I haven't seen this warning in my testing.
> 

Yes, that's the reason you didn't run into.
for me, CONFIG_CPUMASK_OFFSTACK is not set.

>>
>> Compilation Error:
>> kernel/sched/fair.c: In function ‘update_overloaded_mask’:
>> kernel/sched/fair.c:8570:25: error: assignment to expression with 
>> array type
>>   8570 |         overloaded_mask = sd_share->overloaded_mask;
>>        |                         ^
>> kernel/sched/fair.c:8571:13: warning: the address of ‘overloaded_mask’ 
>> will always evaluate as ‘true’ [-Waddress]
>>   8571 |         if (!overloaded_mask)
>>
>>
>>
>> Made the below change. Also you would need rcu protection for sd_share 
>> i think.

Or you need to use like below. This also works (Not tested on x86)

struct cpumask*  overloaded_mask;

> 
> You are right! Thank you for the pointers and spotting my oversight.
> Aaron too pointed some shortcomings here. I'll make sure to test
> these bits more next time (LOCKDEP, hotplug, and
> !CONFIG_CPUMASK_OFFSTACK)
> 

