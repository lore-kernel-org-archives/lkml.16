Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19329242D91
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579987; cv=none; b=USWwQjMLA9KVK3IUfVHgDd+RWh9zLSzd8/HHOdyqe/2ybnsQjjJ+zNNe3g7OHeIueREGlLlvWD/3Qx5YKaTwlVS83jmWfR3SqIaLmGvMETDFnzZthAWq+/wBZMng1QxagncIZV1q1Wr/o3tx7969SXfflR5pcdKryd4KstO/RaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579987; c=relaxed/simple;
	bh=g/mKJnjLwh1iFuzOnQmTiTSPCk30+N0bU+5dLrzttpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPaWxIxnOgi7xB8RMYK3Rvwo/t0osmPIeDSeCSGdlASP7Xj1SLq8yZobVu37NBLfqie86qMA1GJBRbc0hdsXH2w1XvxbGO1T+Tz4fJrgkBF9F1XB3ock0XuatL/1FmLQK8lPWix4rYvvs8uSKaTXhtkYVjEqk9f0MCKdFrnusHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=jGGrBrao; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="jGGrBrao"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PBDqxP005548;
	Fri, 25 Apr 2025 11:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8unaqp
	G0ibvONjElzlpt6tPYGpyOuENG6lJbthHgR1s=; b=jGGrBraod/Z/AdT/9GU2Fp
	VTJnLDvr+LvHbDKyQBowHBBVQ273x0MHnUaqoMYm9LonlzXAmEVj0JRxN8kAD9b1
	2M+qWXiJJslwIN2CA1LjKw1mOCFW9EnS7PsvHafcMtHjRPtZkG2AZgOusGFLVm5T
	9b77Du93qjn7k4w1Zt5E8Kqe0bOm9mCuky+w0+KiRIKzmWzuuFDhk20RcUqNwESc
	o+oEHZm84F4j1VX1yxKsuSXHxawg6rlZeiGwHpSOPo+qQcUCPMvBTTlW195ieTL2
	/1+4wpmwuDijwxGlpWgKA0O4OfhGQT6My+T6PJNPalGuVh5EraZo3/A23aIXFeow
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467wd9jw1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 11:19:27 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53PAk1wc014428;
	Fri, 25 Apr 2025 11:19:26 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467wd9jw1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 11:19:26 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8SvrY004052;
	Fri, 25 Apr 2025 11:19:25 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jg04xm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 11:19:25 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53PBJM2236897062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 11:19:22 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D7A820043;
	Fri, 25 Apr 2025 11:19:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3580720040;
	Fri, 25 Apr 2025 11:19:20 +0000 (GMT)
Received: from [9.124.216.146] (unknown [9.124.216.146])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Apr 2025 11:19:19 +0000 (GMT)
Message-ID: <2891b989-6249-4e84-969e-f11af3f92b0b@linux.ibm.com>
Date: Fri, 25 Apr 2025 16:49:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc: kvm: use generic transfer to guest mode work
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, npiggin@gmail.com,
        vaibhav@linux.ibm.com
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        christophe.leroy@csgroup.eu, gautam@linux.ibm.com,
        linux-kernel@vger.kernel.org
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
 <20250421102837.78515-2-sshegde@linux.ibm.com>
 <20250424144215._ooDjDz9@linutronix.de>
 <365ba747-9311-45ab-b798-80ba4e578796@linux.ibm.com>
 <20250424183811.7_MLThpt@linutronix.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250424183811.7_MLThpt@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cx1VfQmGNAhcusdJaRXTRRD9t2kyCkm4
X-Proofpoint-ORIG-GUID: 7YQTdeyph4rNLvKYxsGqv4u9ofVTFhYg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA4MCBTYWx0ZWRfX5NiF2ET2JvkA aizkwUzZLqCMSVNRuvO5OHZHoQ6eHuHN4nxQ+CRNZGGXCB4sVQrOeOrPDquAtHd7neevhy/BIzG grBqrRMrtMLHE/nGZ9dWjS4lRfCKwhukhPyXWlPQL795YuCf22jUotWz0GT1JPhLJN+cNy1FyOe
 OWpshZIt+b0p64lE7hLFqagiZBlA3/+XjrwYKkxcTkhgXowZSbkXe4CAbMP8HSEgNDima1M7r76 j9VcgMKCHPvbF+PAFVP2NVGa63eu2xEOyDzZ5vpsRlYraxkCd8eS9wVnvmXELrsiObmVE0Ut8Gb tTVhTZbq1EnsLz6RhvkLIQ9Y3bABv0WNboSK7isJMZVBLN71Onc9LC+jAVwkB4qJCINrQIA1hl1
 +VB2YU/9PHdi3f0BQiZlTmx9xWzrRxEBmLVuypPMUfw/EoTUXEuJhSM4Q6MC9Q+8enunXM5p
X-Authority-Analysis: v=2.4 cv=M5lNKzws c=1 sm=1 tr=0 ts=680b6fbf cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=cYoGapK-EUoakugsZR0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250080




On 4/25/25 00:08, Sebastian Andrzej Siewior wrote:
> On 2025-04-24 21:27:59 [+0530], Shrikanth Hegde wrote:
>>>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>>>> index 19f4d298d..123539642 100644
>>>> --- a/arch/powerpc/kvm/book3s_hv.c
>>>> +++ b/arch/powerpc/kvm/book3s_hv.c
>>>> @@ -4901,7 +4901,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>>>>    	}
>>>>    	if (need_resched())
>>>> -		cond_resched();
>>>> +		schedule();
>>>
>>
>>
>>> This looks unrelated and odd. I don't why but this should be a
>>> cond_resched() so it can be optimized away on PREEMPT kernels.
>>
>> This is needed, otherwise KVM on powerVM setup gets stuck on preempt=full/lazy.
> 
> But this makes no sense. On preempt=full the cond_resched() gets patched
> out while schedule() doesn't. Okay, this explains the stuck.

cond_resched works. What you said is right about schedule and preemption models.
Initially I had some other code changes and they were causing it get stuck. i retested it.


But looking at the semantics of usage of xfer_to_guest_mode_work
I think using schedule is probably right over here.
Correct me if i got it all wrong.

on x86:
kvm_arch_vcpu_ioctl_run
	vcpu_run
		for () {
			.. run guest..
			xfer_to_guest_mode_handle_work
				schedule
		}


on Powerpc:  ( taking book3s_hv flavour):
kvm_arch_vcpu_ioctl_run
kvmppc_vcpu_run_hv  *1
	do while() {
		kvmhv_run_single_vcpu or kvmppc_run_vcpu
			-- checking for need_resched and signals and bails out *2
	}


*1 - checks for need resched and signals before entering guest
*2 - checks for need resched and signals while running the guest


This patch is addressing only *1 but it needs to address *2 as well using generic framework.
I think it is doable for books3s_hv atleast. (though might need rewrite)

__kvmppc_vcpu_run is a block box to me yet. I think it first makes sense
to move it C and then try use the xfer_to_guest_mode_handle_work.
nick, vaibhav, any idea on __kvmppc_vcpu_run on how is it handling signal pending, and need_resched.


So this is going to need more work specially on *2 and doing that is also key for preempt=lazy/full to work
for kvm on powepc. will try to figure out.


