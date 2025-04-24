Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7964B1805B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745510307; cv=none; b=l9q5NMlPI40RBh0GmvS35rx9LYqu4OZUn86Xge4xG4qrqhhCs7R/jTCxmfw+RhhgFkDcCSuoRSRYYucmUxC7RK2ZpoI0aACZ2/lI8lgsjNif8LOf/1WSd5kBN3h7LUqVRGvX4evh9gXsAMOYw6tLam/3mZ00gDvaYR6SFVsD/5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745510307; c=relaxed/simple;
	bh=hGn5TZPzUXh2UE6Ua37oAM8ekjIXxJZVqcwYwC5z9Hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HurpPfE6P0MCwPKx6VHNVMCsoHkmZAen3pWZovx/tojllYxGdt8vLoGwbRx1r7Wpx+gklnAm6oatw46tmB3VOINkBWFk7aCVcMPAk48YLC7BTycZ8YulK9Pz3FfVJUaXSlfjn76/Y3C018wkumNbT0ZWTIufonvG8NSbNqgWB/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=IyOZRVbE; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="IyOZRVbE"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9EZeA014502;
	Thu, 24 Apr 2025 15:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=R30PE/
	pVh5sh9qCfJc7TEhJ9R4WvOk+j2vyXVmxXjVc=; b=IyOZRVbEGP3EeKVESk9joo
	jm3E+m4rseCttspJbkYvKgXyDjchLcjKNAnvbw7998GS2xNZnuEMO3uZOATnxMqb
	IcBNtc+b+j6MF5dD+kSWOgMbgLzjWAsZdkn9mljinnUIpACuZSPz4Zt9SR9VxKCj
	hmzliHqJZkbu/rs/2C1MW1pIu4J0ffu3S7EUIldWymdqo7IaAbIVnDelxP77ZZb1
	EfJQ6AfZ7hZh8NRVA0LdU0/Oo59LiMQCWE9SVaDOJJx9WmnjTUAO96Mhn+6s1fLZ
	B3sCKjWbFesANK99MIUw+M/NXfc2l0yffk8vIDkxald7dPIHXdT/KUMrGlsUMP3A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4678bwcedk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 15:58:08 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53OFq6t8010040;
	Thu, 24 Apr 2025 15:58:07 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4678bwcedg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 15:58:07 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53OFTqJ9022281;
	Thu, 24 Apr 2025 15:58:06 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jfxgwbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 15:58:06 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53OFw3N643909608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 15:58:03 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1889B20043;
	Thu, 24 Apr 2025 15:58:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E57D20040;
	Thu, 24 Apr 2025 15:58:01 +0000 (GMT)
Received: from [9.39.28.91] (unknown [9.39.28.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Apr 2025 15:58:01 +0000 (GMT)
Message-ID: <365ba747-9311-45ab-b798-80ba4e578796@linux.ibm.com>
Date: Thu, 24 Apr 2025 21:27:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc: kvm: use generic transfer to guest mode work
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, gautam@linux.ibm.com,
        vaibhav@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
 <20250421102837.78515-2-sshegde@linux.ibm.com>
 <20250424144215._ooDjDz9@linutronix.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250424144215._ooDjDz9@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDEwNiBTYWx0ZWRfX4dggBOUBP4Fo htQ/BokLdhbpY+X0AdK+/tH2C+X3swTgmk1M2mzFNu6K1i2ouwdPHnvfl2jOOAp7FuNLTFG9Xuy uKqfhQcXt+IXxJIo78NHdMiieZKhJ4y2clYf9/d/KhI0LIo13SxV7+BAmh3wAZ6Adp+Rh7HhdcH
 Lo6h6cZx92qh/bIHKrvUwA9VWscYAxJM9bqS4jL7z0r7XopDzMpRffY/ih5eUn6nM5YM40i3OiN C8xsjkscwJ0GAYA1YHakaS8Way1OSgDd+kfeegLRHz/3z6A+UaBQ4sT2sqoeYLnT55NjgqnVnwm n1CoN9xl9xGp7rC98TsgPwwAKeDQvO+1/gIjVVNTbvGjbash6QL6HpKQG3euJQtb3RPe9FzVMYE
 N3su4q2fcRD8z3amEkKa1+dk/61v15Yxif1Ge0kJLMGbiFBb8zvJbwHnY1zyLbOah143M4Rj
X-Proofpoint-ORIG-GUID: yLCGgi62YEacsIUiGMg_GRfHcyoIlg2J
X-Authority-Analysis: v=2.4 cv=KZzSsRYD c=1 sm=1 tr=0 ts=680a5f90 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=aRSudAjuEQCHUFqpYEwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4jsIiudgz4lPelbXPqhO5DiJGVp0_3Wh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240106



On 4/24/25 20:12, Sebastian Andrzej Siewior wrote:

Thanks Sebastian for taking a look.

> On 2025-04-21 15:58:36 [+0530], Shrikanth Hegde wrote:
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 19f4d298d..123539642 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -80,8 +80,8 @@
>>   #include <asm/ultravisor.h>
>>   #include <asm/dtl.h>
>>   #include <asm/plpar_wrappers.h>
>> -
>>   #include <trace/events/ipi.h>
>> +#include <linux/entry-kvm.h>
>>   
>>   #include "book3s.h"
>>   #include "book3s_hv.h"
>> @@ -4901,7 +4901,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>>   	}
>>   
>>   	if (need_resched())
>> -		cond_resched();
>> +		schedule();
> 


> This looks unrelated and odd. I don't why but this should be a
> cond_resched() so it can be optimized away on PREEMPT kernels.

This is needed, otherwise KVM on powerVM setup gets stuck on preempt=full/lazy.

> 
>>   	kvmppc_update_vpas(vcpu);
>>   
>> @@ -5097,10 +5097,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>>   		return -EINVAL;
>>   	}
>>   
>> -	/* No need to go into the guest when all we'll do is come back out */
>> -	if (signal_pending(current)) {
>> -		run->exit_reason = KVM_EXIT_INTR;
>> -		return -EINTR;
>> +	/* use generic frameworks to handle signals, need_resched  */
>> +	if (__xfer_to_guest_mode_work_pending()) {
>> +		r = xfer_to_guest_mode_handle_work(vcpu);
> This could be unconditional.
> 
>> +		if (r)
>> +			return r;
>>   	}
>>   
>>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>> index 153587741..4ff334532 100644
>> --- a/arch/powerpc/kvm/powerpc.c
>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -34,6 +34,7 @@
>>   #endif
>>   #include <asm/ultravisor.h>
>>   #include <asm/setup.h>
>> +#include <linux/entry-kvm.h>
>>   
>>   #include "timing.h"
>>   #include "../mm/mmu_decl.h"
>> @@ -80,24 +81,17 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>>   {
>>   	int r;
>>   
>> +	/* use generic framework to handle need resched and signals */
>> +	if (__xfer_to_guest_mode_work_pending()) {
>> +		r = xfer_to_guest_mode_handle_work(vcpu);
> 
> there is nothing special you do checking and handling the work. Couldn't
> you invoke xfer_to_guest_mode_handle_work() unconditionally?
> 

I followed what was in arch/x86/kvm/x86.c. Since xfer_to_guest_mode_handle_work does the same check
it makes sense to call it without checks too.

Will update in v2.

>> +		if (r)
>> +			return r;
>> +	}
>> +
>>   	WARN_ON(irqs_disabled());
>>   	hard_irq_disable();
>>   
>>   	while (true) {
>> -		if (need_resched()) {
>> -			local_irq_enable();
>> -			cond_resched();
>> -			hard_irq_disable();
>> -			continue;
>> -		}
>> -
>> -		if (signal_pending(current)) {
>> -			kvmppc_account_exit(vcpu, SIGNAL_EXITS);
>> -			vcpu->run->exit_reason = KVM_EXIT_INTR;
>> -			r = -EINTR;
>> -			break;
> 
> I don't how this works but couldn't SIGNAL_EXITS vanish now that it
> isn't updated anymore? The stat itself moves in kvm_handle_signal_exit()
> to a different counter so it is not lost. The reader just needs to look
> somewhere else for it.

ok. thanks for pointing out.

AFAIU it is updating the stats mostly. But below could keep the stats happy.
I will update that in v2.

         if (__xfer_to_guest_mode_work_pending()) {
                 r = xfer_to_guest_mode_handle_work(vcpu);
+               /* generic framework doesn't update ppc specific stats*/
+               if (r == -EINTR)
+                       kvmppc_account_exit(vcpu, SIGNAL_EXITS);
                 if (r)
                         return r;

> 
>> -		}
>> -
>>   		vcpu->mode = IN_GUEST_MODE;
>>   
>>   		/*
> 
> Sebastian

