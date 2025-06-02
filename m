Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F87221FC7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748874189; cv=none; b=hA3P3P65HDsxUJ2mi5ruiLe7GTgFZccP8oZ7VtxY9ubC+p239AMceyswjqErwtLWut9ArLJAskBKsOnes8hBcJbYai7GUF2223F8pGP2gDMWI+mY8AZ6BkN8ZFvVm8muqvpuAGlK3oyscCyWjdpJZoDm5SIq0VodqL94fCqfBb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748874189; c=relaxed/simple;
	bh=90VcKJBNd79lZxa7XGwqANUh3OtebRZq2UOjETJMQI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fV8Rqupct1Q0rIOi30MaujJVUH7C+OOdL02m55JqkwnaDGO3/Lw4lPHMfFJxAadN/p4ZmKe5tIHQiESs47S6BVE4FfeIXlwF9MItDBofQinuN9ehUAnyDepJNLfSuMZlQ63Z8YK38sO/bLtoACKL8KnN/KR4y7q14OXljp2kynM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=a8MjORT7; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="a8MjORT7"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5525vsgN003864;
	Mon, 2 Jun 2025 14:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1jH5qk
	wFJvMYiUuKDQ8rGfeSgnHZ/gZvVT0D6KrU+sY=; b=a8MjORT7TApoAnQYEN6yhG
	48LpYIShVYnXAhvqeMXSdSTpyrTcW+/ALeCGptaUC+Z66komsvubf0drP/G2ZauV
	mx31zuuTBGdNDehnzAymhSvyRCdnQx9URcWv6/As2PctT+9C4EsHcpyoZUmxDNfK
	WIPoezR1Jn9tyw30jdKE3/CZXyXcehfhG5deLWnhAg5FVJJqeYPBEE0ATRIoNvBx
	ampbovP6jKfbLzVjFqNtpXPjObZfzSq3b5cuQY2D8GwIf3uE0irW6uskPubBOccc
	JMvriCR9WmfM96yv5yCkdt/LA63MK/WE8Ag5kahY5tll0dY4UHYsh8Pe7ceVdtTA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46yq6t1ws6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 14:22:50 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 552EJ9Jq000883;
	Mon, 2 Jun 2025 14:22:50 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46yq6t1ws1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 14:22:50 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 552AgDIH031636;
	Mon, 2 Jun 2025 14:22:49 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 470cfypph7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 14:22:49 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 552EMjlC52756868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Jun 2025 14:22:45 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 852E520043;
	Mon,  2 Jun 2025 14:22:45 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5F5C20040;
	Mon,  2 Jun 2025 14:22:44 +0000 (GMT)
Received: from [9.111.70.35] (unknown [9.111.70.35])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  2 Jun 2025 14:22:44 +0000 (GMT)
Message-ID: <aaa3b775-0cd7-4b6a-bcc0-186baf90fa2c@linux.ibm.com>
Date: Mon, 2 Jun 2025 16:22:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] sched: cpu parked and push current task mechanism
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
        Yury Norov
 <yury.norov@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
        tglx@linutronix.de, maddy@linux.ibm.com, vschneid@redhat.com,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, jstultz@google.com,
        kprateek.nayak@amd.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk
References: <20250523181448.3777233-1-sshegde@linux.ibm.com>
 <20250527151020.GV24938@noisy.programming.kicks-ass.net>
 <aDXelhCbIvKjZyqG@yury> <f6f122cf-daf4-4e31-af42-4f12761aa1da@linux.ibm.com>
From: Tobias Huschle <huschle@linux.ibm.com>
In-Reply-To: <f6f122cf-daf4-4e31-af42-4f12761aa1da@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Fo0F/3rq c=1 sm=1 tr=0 ts=683db3ba cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=bvpuoPOteRzz9vtNvxwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: m8wVm81ZWzuTxjqdtZN7GO4sCIcXCLAK
X-Proofpoint-ORIG-GUID: Tzvuk2N4taSbhDti1RB3_WQsg5SR8YcQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDExNCBTYWx0ZWRfX1PvU2xlF/Prx 2ri5OKTl5k2PJt91bc3nnagpvaPQ5ntw7YuwLyxIP696K7DQdV3gNj5gPeBmM3MY1fZ0a5+4x1M 0V91sZYDTkj3KLlwTCcu+Rbpn2RZD7ReO8vCoYDHKwkJiPC6Wv0lee5n6wLQbAJO18NQ+9Il80B
 4bxITivzq2wmtgP8SRr3kE/FutZeLlB01V97TE/ynpQaCKRMI05t8qX3i4np20nf+RKPNbTbP8T XABIgcg09os31+WlIWyn6sbhI6E8debHqL031f9hUTgYV0u8yKW7p8KmLaEeXn8wFtvKfS17asV 87WAz5hsc7GwiNGbB23HNHhpOn3xTzSsBAce1kvLiBavbwaAFmFUo9IkvSweIErJVFpg4zw6yT1
 S+uxxwjcBbRi9GDCZYThuAPTMtDdotIpZvIF3kEFX2WtvRqH5ypnL3b1T1FFpiUI7KGF5cJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_05,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506020114



On 27/05/2025 19:30, Shrikanth Hegde wrote:
> 
> Hi Peter, Yury.
> 
> Thanks for taking a look at this series.
> 
> 
> On 5/27/25 21:17, Yury Norov wrote:
>> On Tue, May 27, 2025 at 05:10:20PM +0200, Peter Zijlstra wrote:
>>> On Fri, May 23, 2025 at 11:44:43PM +0530, Shrikanth Hegde wrote:
>>>> In a para-virtualised environment, there could be multiple
>>>> overcommitted VMs. i.e sum of virtual CPUs(vCPU) > physical CPU(pCPU).
>>>> When all such VMs request for cpu cycles at the same, it is not 
>>>> possible
>>>> to serve all of them. This leads to VM level preemptions and hence the
>>>> steal time.
>>>>
>>>> Bring the notion of CPU parked state which implies underlying pCPU may
>>>> not be available for use at this time. This means it is better to avoid
>>>> this vCPU. So when a CPU is marked as parked, one should vacate it as
>>>> soon as it can. So it is going to dynamic at runtime and can change
>>>> often.
>>>
>>> You've lost me here already. Why would pCPU not be available? Simply
>>> because it is running another vCPU? I would say this means the pCPU is
>>> available, its just doing something else.
>>>
>>> Not available to me means it is going offline or something like that.
>>>
>>>> In general, task level preemption(driven by VM) is less expensive 
>>>> than VM
>>>> level preemption(driven by hypervisor). So pack to less CPUs helps to
>>>> improve the overall workload throughput/latency.
>>>
>>> This seems to suggest you're 'parking' vCPUs, while above you seemed to
>>> suggest pCPU. More confusion.
> 
> Yes. I meant parking of vCPUs only. pCPU is running one of those vCPU at 
> any point in time.
> 
>>>
>>>> cpu parking and need for cpu parking has been explained here as well 
>>>> [1]. Much
>>>> of the context explained in the cover letter there applies to this
>>>> problem context as well.
>>>> [1]: https://lore.kernel.org/all/20250512115325.30022-1- 
>>>> huschle@linux.ibm.com/
>>>
>>> Yeah, totally not following any of that either :/
>>>
>>>
>>> Mostly I have only confusion and no idea what you're actually wanting to
>>> do.
>>
>> My wild guess is that the idea is to not preempt the pCPU while running
>> a particular vCPU workload. But I agree, this should all be reworded and
>> explained better. I didn't understand this, either.
>>
>> Thanks,
>> YUry
> 
> Sorry, Apologies for not explaining it clearly. My bad.
> Let me take a shot at it again:
> 
> ----------------------------
> 
> vCPU - Virtual CPUs - CPU in VM world.
> pCPU - Physical CPUs - CPU in baremetal world.
> 
> A hypervisor is managing these vCPUs from different VMs. When a vCPU 
> requests for CPU, hypervisor does the job
> of scheduling them on a pCPU.
> 
> So this issue occurs when there are more vCPUs(combined across all VMs) 
> than the pCPU. So when *all* vCPUs are
> requesting for CPUs, hypervisor can only run a few of them and remaining 
> will be preempted(waiting for pCPU).
> 
> 
> If we take two VM's, When hypervisor preempts vCPU from VM1 to run vCPU 
> from VM2, it has to do
> save/restore VM context.Instead if VM's can co-ordinate among each other 
> and request for *limited*  vCPUs,
> it avoids the above overhead and there is context switching within 
> vCPU(less expensive). Even if hypervisor
> is preempting one vCPU to run another withing the same VM, it is still 
> more expensive than the task preemption within
> the vCPU. So *basic* aim to avoid vCPU preemption.
> 

There is a dilemma for the hypervisor scheduler, as it has not too many 
good indicators on when to preempt a vCPU in favor of another one.

Assume we have a hypervisor facing high load. Among others, 1 VM with 2 
vCPUs running 2 tasks. Naturally, the scheduler in the VM would place 
each task on one of the vCPUs.

Assume further that, due to the high load, the hypervisor scheduler 
cannot schedule both vCPUs at the same time consistently. This means, 
that the hypervisor scheduler now decides which of the 2 tasks gets to run.

The scheduler in the VM on the other hand has better insights into which 
of the two tasks should execute. If the hypervisor can guarantee the 
guest, that certain vCPUs will be granted runtime on pCPUs consistently, 
the VM scheduler has a clear expectancy on the availability of its vCPUs 
and can make use of that information.

Essentially, we avoid forcing the hypervisor scheduler to take decisions 
which it does not have good information on. We'd rather let the VM 
scheduler take those decisions.

This requires of course, that the hypervisor can give a somewhat 
accurate estimate to the VM on how many CPUs it can safely use, which it 
should be able to do as it has the information on how much overall load 
is on the system, which the VM does not have necessarily.
A naive approach would be to just divide the available pCPUs through the 
number of VMs. The more interesting part will be to derive how many 
vCPUs can be overconsumed if other VMs are underconsuming.

In the end, both layers, hypervisor and VM, would take decisions which 
they have accurate information on. The VM scheduler knows about its 
tasks, the hypervisor knows about the overall system load.

I played around with the concept quite a bit. Especially if there is a 
lot of load on the VM itself and it tries to squeeze in short-running 
networking operations.
In this case the VM scheduler can take better decisions if it runs less 
vCPUs, but stays in full control, instead of relying on the hypervisor 
scheduler to schedule all its vCPUs.

> 
> So to achieve this, use this parking(we need better name for sure) 
> concept, where it is better
> if workloads avoid some vCPUs at this moment. (vCPUs stays online, we 
> don't want the overhead of sched domain rebuild).
> 
> 
> contention is dynamic in nature. When there is contention for pCPU is to 
> be detected and determined
> by architecture. Archs needs to update the mask regularly.
> 
> When there is contention, use limited vCPUs as indicated by arch.
> When there is no contention, use all vCPUs.
> 

The patches work as expected on s390.
