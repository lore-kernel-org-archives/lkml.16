Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D0125A627
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748367055; cv=none; b=dOvOJOYgJkVH6F4VKBiWwtA4H6KYphLVBdWoO9DcEc1/X8rhUVDEBGCiHmiwX8E4MJeDbHLCbkgfdV+gzd4ZJyh5lVVinJrKUongZ9iVAVPBDm+b98/t5ifLuV0MXyHm+H8PMF5io4CNh8DP0AVwnSqAdmvtVxEHSCGcNITfbbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748367055; c=relaxed/simple;
	bh=FmJSeMciCQW5ZhJ88Z+1Y9gZB9p8Rlx7z0Oi17eXULw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOen4ZXl1yqhT7sf2kqr3Eayx5UN73RnSmA8Jl0kzl5W5Tkaw3o0FHE9d+o3XKzZDn8+VehjdOMySzG7zh+ROcErn4g+TAtn/fxgfHKYcaev8TTUeLUbjwEsbUVwN4SmbrwpWhnKPygGrYmdRBngOseCOlz3nSxNax/xlmEHgC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Kj9TUiMd; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Kj9TUiMd"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RGHUX5012554;
	Tue, 27 May 2025 17:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qbUi1u
	1EKD9pUQa6VidP1b4nnc26rVpwBE8SlMorMxo=; b=Kj9TUiMdDQcdNZjsh7dUy7
	WSfh4RkW60a/0YxqhMzX0ZJe5aODREO5B9cBMUQ0UtfPKA4w1C/hBXnrKo9PmvZg
	wkVFDb0udgUu+h+xrPLIBu7x8QkQcvxBAv8gO1D7jYIZ4qckhd/5SB4XHJy57U/F
	0c3sjHPgYeGiL0A4CYESPm/V0qSL1nhax0Et41OeL1ZJIIcXdxUszSl8EQ/wmu6F
	datAzn4RzaypQ0XjuaNQcRYWwpxEQbl6WNDod/woZEwDzQJ16ABWgam6l72Q1eXP
	AJ+HPVvuE6gH4EqM17nJ/yOHEXRSvAWOMg2YnWBMRUw5jv/Odkyy6TbFJQwRhNfA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsg8b99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 17:30:31 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54RH8nDh023156;
	Tue, 27 May 2025 17:30:30 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsg8b91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 17:30:30 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54RHOlhK028925;
	Tue, 27 May 2025 17:30:29 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46usepump3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 17:30:29 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54RHUPsu35127724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 17:30:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0776120043;
	Tue, 27 May 2025 17:30:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39A1520040;
	Tue, 27 May 2025 17:30:22 +0000 (GMT)
Received: from [9.124.208.37] (unknown [9.124.208.37])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 May 2025 17:30:22 +0000 (GMT)
Message-ID: <f6f122cf-daf4-4e31-af42-4f12761aa1da@linux.ibm.com>
Date: Tue, 27 May 2025 23:00:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] sched: cpu parked and push current task mechanism
To: Yury Norov <yury.norov@gmail.com>, Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
        tglx@linutronix.de, maddy@linux.ibm.com, vschneid@redhat.com,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, jstultz@google.com,
        kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk
References: <20250523181448.3777233-1-sshegde@linux.ibm.com>
 <20250527151020.GV24938@noisy.programming.kicks-ass.net>
 <aDXelhCbIvKjZyqG@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <aDXelhCbIvKjZyqG@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=OIIn3TaB c=1 sm=1 tr=0 ts=6835f6b7 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=eopaWqG3cE2iixywgS8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: pi22yjOaZh5s4LjOUKHGWJmqI21ylnM8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE0MCBTYWx0ZWRfX+7bTa87zBXor AYhtW3eqCHP2nllkP9cDHUvlYU55X63z1XQFk3Bq+MEuC5DY7R4Lnw93lki6N49mazWn0+owdDU gWXqfJT4cE/CaUdpbKcqvfCRJpHO9i7lUxmcPKijBOu5zLAgenlO1FwiyJs2BdqPG/N1Xc+wCa5
 RBX0RqQwra8RvhpxI7ErkoFxdAfAmQspSXCiS9gl9JW1z4NT2JP3pVmCiEYRKfaGoWz93nZrI/3 DHonpg2oUGSfkLZQM2p5/tcRcGXvXIN98GU3Yp2TfgZQsgxr49cifYpgYYecRBWDa8Qo2yde2Od 3JFC5D0JgULJ0eYEd23U16tS2C8OZOnr+hGkEZTSyQB7oZyd5+QzfX9OGDVc8loKdAm+H3MCdCR
 LNfKL9FNk6nFOrOzEsUGbDRN/te4Y4rkpH1Cwczo9N6d1bWEvGL3V9yPZLvmW1mUb6Qtbcq7
X-Proofpoint-ORIG-GUID: FkrexHL_KhPSW13ok5gZYu_UmK2Ms77T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 mlxlogscore=927 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270140


Hi Peter, Yury.

Thanks for taking a look at this series.


On 5/27/25 21:17, Yury Norov wrote:
> On Tue, May 27, 2025 at 05:10:20PM +0200, Peter Zijlstra wrote:
>> On Fri, May 23, 2025 at 11:44:43PM +0530, Shrikanth Hegde wrote:
>>> In a para-virtualised environment, there could be multiple
>>> overcommitted VMs. i.e sum of virtual CPUs(vCPU) > physical CPU(pCPU).
>>> When all such VMs request for cpu cycles at the same, it is not possible
>>> to serve all of them. This leads to VM level preemptions and hence the
>>> steal time.
>>>
>>> Bring the notion of CPU parked state which implies underlying pCPU may
>>> not be available for use at this time. This means it is better to avoid
>>> this vCPU. So when a CPU is marked as parked, one should vacate it as
>>> soon as it can. So it is going to dynamic at runtime and can change
>>> often.
>>
>> You've lost me here already. Why would pCPU not be available? Simply
>> because it is running another vCPU? I would say this means the pCPU is
>> available, its just doing something else.
>>
>> Not available to me means it is going offline or something like that.
>>
>>> In general, task level preemption(driven by VM) is less expensive than VM
>>> level preemption(driven by hypervisor). So pack to less CPUs helps to
>>> improve the overall workload throughput/latency.
>>
>> This seems to suggest you're 'parking' vCPUs, while above you seemed to
>> suggest pCPU. More confusion.

Yes. I meant parking of vCPUs only. pCPU is running one of those vCPU at any point in time.

>>
>>> cpu parking and need for cpu parking has been explained here as well [1]. Much
>>> of the context explained in the cover letter there applies to this
>>> problem context as well.
>>> [1]: https://lore.kernel.org/all/20250512115325.30022-1-huschle@linux.ibm.com/
>>
>> Yeah, totally not following any of that either :/
>>
>>
>> Mostly I have only confusion and no idea what you're actually wanting to
>> do.
> 
> My wild guess is that the idea is to not preempt the pCPU while running
> a particular vCPU workload. But I agree, this should all be reworded and
> explained better. I didn't understand this, either.
> 
> Thanks,
> YUry

Sorry, Apologies for not explaining it clearly. My bad.
Let me take a shot at it again:

----------------------------

vCPU - Virtual CPUs - CPU in VM world.
pCPU - Physical CPUs - CPU in baremetal world.

A hypervisor is managing these vCPUs from different VMs. When a vCPU requests for CPU, hypervisor does the job
of scheduling them on a pCPU.

So this issue occurs when there are more vCPUs(combined across all VMs) than the pCPU. So when *all* vCPUs are
requesting for CPUs, hypervisor can only run a few of them and remaining will be preempted(waiting for pCPU).


If we take two VM's, When hypervisor preempts vCPU from VM1 to run vCPU from VM2, it has to do
save/restore VM context.Instead if VM's can co-ordinate among each other and request for *limited*  vCPUs,
it avoids the above overhead and there is context switching within vCPU(less expensive). Even if hypervisor
is preempting one vCPU to run another withing the same VM, it is still more expensive than the task preemption within
the vCPU. So *basic* aim to avoid vCPU preemption.


So to achieve this, use this parking(we need better name for sure) concept, where it is better
if workloads avoid some vCPUs at this moment. (vCPUs stays online, we don't want the overhead of sched domain rebuild).


contention is dynamic in nature. When there is contention for pCPU is to be detected and determined
by architecture. Archs needs to update the mask regularly.

When there is contention, use limited vCPUs as indicated by arch.
When there is no contention, use all vCPUs.

