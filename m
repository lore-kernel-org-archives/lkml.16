Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FF6101F2
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 04:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748838361; cv=none; b=sBzJyz/2OSyF/H8bJsBY3wv5N5VQqG0rxrI2NjysoePuJ56zi8543lGPMLlu/mP4xsXHkD30zm2HYA79OF/RTAfaZuVOOVHI4tRXtdyY82coAXHOzITLPNhRQcbakHPb4cMfaNVpVNHgmCvRQppRPRiI6Q6z2zmhgxrt5IbvHxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748838361; c=relaxed/simple;
	bh=UvTEUnaqQjpZm5WXOnHUTKWF6hbCE/V2vfgao7XKhaI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CWd75z4leW++cRPrWfIzP/UzgvniIa+9cA9Ag4YFo0UV/w992YzQ8wSOOzc0NqGvnuiAnJg5hOK6Hqsu6iPSJd7AoRU0xlFKeiz7PUcwmATN9FhvFm2zOl8KugZ7TyAFA9eeUDTlyvdInuikmisp6d9eFHbWn8cpf/L9z4byx3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=GD0JwAES; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="GD0JwAES"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551LHjR2009549;
	Mon, 2 Jun 2025 04:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LaNED7
	PqF1qyB92brBr7HqFgwAMpN5WHze6i/RCLsUM=; b=GD0JwAESDoK24kIYOQXqGk
	JCL2yFuDG/3xf/IqugRt90V83sUFIG64U/vbexscon8tTvw3Nc2mpA+BkxIP8Uu6
	LximVOMW3OY1juSOh+8oentHYHd7bLmv02QzspcvxAhZwkVV4gF/Y0t7f2YicvwV
	FXlxBA1wx9Zwe0YAiRLObmnGnKhFvz8b7CiWO833/cO4thpbKWNIw4jwu19Y/BSF
	SdiXZFGHsGOu+snN3n8YTITwtMcUevAS0zJGnTWCFJdwu2YvwYi6CE7ZUhsu5TYW
	qwUwtQNPo5Uel96+XJTRaQxpEE8nk2BdycQhPxyuCs2+Fb5CiV7n0+AMomS8A7VA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46yq6sybe1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 04:25:35 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5524LJb6014246;
	Mon, 2 Jun 2025 04:25:35 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46yq6sybdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 04:25:35 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55209qGo020553;
	Mon, 2 Jun 2025 04:25:34 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 470et2498b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 04:25:34 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5524PURl12714412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Jun 2025 04:25:30 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9E482004B;
	Mon,  2 Jun 2025 04:25:30 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD6F420043;
	Mon,  2 Jun 2025 04:25:27 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  2 Jun 2025 04:25:27 +0000 (GMT)
Message-ID: <27865aa8-71b9-4ddc-b3be-312e4ac3814a@linux.ibm.com>
Date: Mon, 2 Jun 2025 09:55:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] sched: cpu parked and push current task mechanism
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: Yury Norov <yury.norov@gmail.com>, Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
        tglx@linutronix.de, maddy@linux.ibm.com, vschneid@redhat.com,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, jstultz@google.com,
        kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk
References: <20250523181448.3777233-1-sshegde@linux.ibm.com>
 <20250527151020.GV24938@noisy.programming.kicks-ass.net>
 <aDXelhCbIvKjZyqG@yury> <f6f122cf-daf4-4e31-af42-4f12761aa1da@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <f6f122cf-daf4-4e31-af42-4f12761aa1da@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Fo0F/3rq c=1 sm=1 tr=0 ts=683d27bf cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=sZj7IcCAvcMJORwBWfYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ShvfOZ2OTIxWkPzkaR96F6tsl9kHobjV
X-Proofpoint-ORIG-GUID: FJBjf765ikJS1vLlAv_NN19SWWGyKLhW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDAzMCBTYWx0ZWRfXzKPgYpGEdo6h NxJMXrlFlafxHGbfoU4/vlWQZntmdkaH/1mXpIn/KCj120+I0Sn4bSwxxZOsM+OpbY6rixAIkXE aI9JiOhQJrj70GtLkNmMaBTUIGrrDEPVPo2aGTq7ZOC2Lo0Ytt+yqAFQlNPVl4kRbE28hR7jb1T
 H9o7CU3/sDO32lwkj/HYIyWkBQ40idLBflf0N8ky4lO0PR7OhBzmXHDndqf8zsQmnH9iAe90+Pl VrqTFgYnb7TMwXWEsTx08tut0fGVwv1hZiyGzuXOsJsjQtbyg/z49PL4GABMb5UtVdxxr3E806W M0C2UMcHSgGtHXEhk3l1HpsWIVSZYQIuYcH+5+ukkR0oUgV1fTTJ4njKJPMqWJSRDPzYtWmKBki
 2mPGHK6gI4uO3P5/nZ4EqahbVP18YmlgV3wrNlY548tiFQIhfg5ef8SKY7QOmX32iuh1saOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_01,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=709 impostorscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506020030



Hi.

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

I hope this helped to set the problem context. I am trying to get feedback if the approach makes sense.
I will go through other push mechanism we have (example in rt/dl).
