Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE0B1A7046
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257962; cv=none; b=qYKaLo9OubB7N3Mfks/+u6QNRtepiQWLmiJE3QAb1k8iWxV1Ms9p5xEs+Pg2bcRUwekyCqjLfX6GtQUxRs/lB5Q6oITOyraSHqE8Mt7lqYCbHvdNJ8pO3IdcOQFJfvINGrxFfF8CE+pX0aNf4H6gHuluGoSbWmmlKz3i3baqNZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257962; c=relaxed/simple;
	bh=FQtTGttXCfsOZDEItu05WX5hOv+6wntTMfgSC2UxIVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=putZteOQuUeBzH8SDjVcb5FSvdQMGSG7djCu6jklcHcYbz2hrqVIsT+aUtFfJBIwoVCsmIlC3oU9w9s9gQuFuNxnK+7QU/Gsgie+j3mKcgf20XwWj7cmVVTNHGIf6DmiZxMhtagiERG48Xf+wv9ApmYosbo8jeewktBYf311g+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=X1ulZn9L; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="X1ulZn9L"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UH2G3W030278;
	Thu, 30 Jan 2025 17:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1g2lbC
	bfeU0yGMbox0cDgfCA9exUWOvdyJXbAJj4wqQ=; b=X1ulZn9LzzqcpzSYrMSeUE
	TrpYvgxE2UGyPLjmukMkD8hcyVh61ySXB9pBdlB8qdWWuLX2H5rRxIa8ffMG7ugv
	kdj2Zgm3vUaDo8zCZewuxaAXEUctJoDtss3MsXCTnCp15d5gK49Hlj+ytIhGPQer
	B+ymRmYgJNXe+nC2ZtB140eO8y5+/srLOknpp9BRDiTRauB6EpSeewpW2Nat3l5w
	y32O6KPdvnpHrFb8TSnxSM2zVIUEO52S6Se+VsNGpU8BDHg9nc13Fz488HuH8N0i
	PsyztZRLFFk2Q8+bQWWZ+ss1+b7dobgSzfLuRLVkTts/AMDZSXxq5gA/2rXSie1A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44g54ntqn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 17:25:32 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50UHPWtb028540;
	Thu, 30 Jan 2025 17:25:32 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44g54ntqn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 17:25:32 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50UDpfbv022538;
	Thu, 30 Jan 2025 17:25:31 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44dcgjxwq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 17:25:31 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50UHPTVG43123132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 17:25:29 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 837392006A;
	Thu, 30 Jan 2025 16:57:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17E4320063;
	Thu, 30 Jan 2025 16:57:09 +0000 (GMT)
Received: from [9.124.215.164] (unknown [9.124.215.164])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jan 2025 16:57:08 +0000 (GMT)
Message-ID: <b73b5143-1a7f-4032-ac06-43db3bf4abea@linux.ibm.com>
Date: Thu, 30 Jan 2025 22:27:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] powerpc: Enable dynamic preemption
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: mpe@ellerman.id.au, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org
References: <20250106051919.55020-1-sshegde@linux.ibm.com>
 <20250106051919.55020-2-sshegde@linux.ibm.com>
 <20250130145409.D_so_mR1@linutronix.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250130145409.D_so_mR1@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _qriNWSwMSuCta2ZlCxLOYz4N7mExA2e
X-Proofpoint-ORIG-GUID: GUz7QDRcA0WjZJGm_VcJzT05drjya8aF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_07,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501300125



On 1/30/25 20:24, Sebastian Andrzej Siewior wrote:
> On 2025-01-06 10:49:19 [+0530], Shrikanth Hegde wrote:
>> --- a/arch/powerpc/kernel/interrupt.c

> 

Thanks for taking a look.

>> +
>>   #ifdef CONFIG_PPC_BOOK3S_64
>>   DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
>>   static inline bool exit_must_hard_disable(void)
>> @@ -396,7 +400,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>>   		/* Returning to a kernel context with local irqs enabled. */
>>   		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>>   again:
>> -		if (IS_ENABLED(CONFIG_PREEMPTION)) {
>> +		if (preempt_model_preemptible()) {
> 
> CONFIG_HAVE_PREEMPT_DYNAMIC_KEY is the only option, right? Wouldn't
> 
> | #DEFINE need_irq_preemption() \
> |          (static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> |
> | 	if (need_irq_preemption()) {
> 
> be a bit smaller/ quicker? This could be a fast path ;)

I am okay with either way. I did try both[1], there wasn't any significant difference,
hence chose a simpler one. May be system size, workload pattern might matter.

Let me do some more testing to see which one wins.
Is there any specific benchmark which might help here?

[1]: https://lore.kernel.org/all/b98b7795-070a-4d9c-9599-445c2ff55fd7@linux.ibm.com/

> 
>>   			/* Return to preemptible kernel context */
>>   			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
>>   				if (preempt_count() == 0)
>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>> index edf5cabe5dfd..2556fa8ec019 100644
>> --- a/arch/powerpc/kernel/traps.c
>> +++ b/arch/powerpc/kernel/traps.c
>> @@ -266,7 +266,11 @@ static int __die(const char *str, struct pt_regs *regs, long err)
>>   	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
>>   	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>>   	       PAGE_SIZE / 1024, get_mmu_str(),
>> -	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
>> +	       preempt_model_none()      ? "none" :
>> +	       preempt_model_voluntary() ? "voluntary" :
>> +	       preempt_model_full()      ? "full" :
>> +	       preempt_model_lazy()      ? "lazy" :
>> +	       "",
> 
> So intend to rework this part. I have patches stashed at
> 	https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git/log/?h=preemption_string
> 
> which I didn't sent yet due to the merge window. Just a heads up ;)

Makes sense. I had seen at-least two places where this code was there, ftrace/powerpc.
There were way more places..

You want me to remove this part?

> 
>>   	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>>   	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
>>   	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
> 
> Sebastian

