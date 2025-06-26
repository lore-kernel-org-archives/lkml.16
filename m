Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0CB28BA9C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949206; cv=none; b=tMKJz1nCIRZc2Ws/HglxfWNdJYXV5NyMgr30Y+Vcnbvtqb1toxIVxPq9M/WawtckRS4Uom7vVtLSuHqGK27Es0yUzu2OzBsO7S0kAOp7yyBeIcenTYZvpIRYNhiu1viQcTsoEQPR6CVkzKNe0U4pGU+i8279fgGQZ7gHQy0RDT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949206; c=relaxed/simple;
	bh=WYhdaHivbvq1TD7YbmmW5muFA+zw6eu68ZiCH8y5iIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SsRvoqgzxEq0lwHwvaJScQQlAPZjQvLW3yOez1mp0lG8tuRl9PGPBjv4dYIrNPr1Q/bgefYrk+nMm1PelJViet+5Y+KbVXdCiXf2CJDlURCb2WrNIw9yk/BplG+HUgJUUMuXVtK6+bjbePyM5nBm1xF6hyYtkmtOGJDVs1AZTGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=RmUGXmgo; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="RmUGXmgo"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QCLaRR015789;
	Thu, 26 Jun 2025 14:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3PBNcY
	qVG8q1lbVR+5gNQQ/T5/i3ccSpv4GZaNVQIrY=; b=RmUGXmgozSdP/cZlEiD0L3
	e+/ayjvK1L0+HHMWfHCYtqmEX80bQIqRGcWNkOO4XjkmZBMDvKGXCmbCsoEw444D
	/03P9zo1gvPmOPp1a5i2NolMZekuO00U6g16mss1zSCE8OZEB0h4In2pt/5FGA3X
	MTMrhlphw54uFVBKqt9CmBbFotiApPbJQmyutrxvrs0xsQZASuIadJfYozOnloqB
	y1BBPshN7SaOJSk0yZqezzZbGmsEyw55+n+VafgcwQQI5wdG0rFZr/qzKCaPhG/7
	u9nJZJBAtqfqgJ/wQ7NLw43AC0Iqv5u8vfElwkqyMYd4nu6vHwUS4CfEvQqiPMbQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jqc51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:46:41 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55QEe49Z004195;
	Thu, 26 Jun 2025 14:46:41 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jqc4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:46:41 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55QEFrTD014698;
	Thu, 26 Jun 2025 14:46:40 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e9s2q3qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:46:40 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55QEkc0E14877136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 14:46:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 830AE20040;
	Thu, 26 Jun 2025 14:46:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9038020043;
	Thu, 26 Jun 2025 14:46:37 +0000 (GMT)
Received: from [9.39.23.153] (unknown [9.39.23.153])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Jun 2025 14:46:37 +0000 (GMT)
Message-ID: <15328540-0c0a-4076-8ec8-77661b984fba@linux.ibm.com>
Date: Thu, 26 Jun 2025 20:16:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 1/9] sched/docs: Document avoid_cpu_mask and avoid CPU
 concept
To: Hillf Danton <hdanton@sina.com>
Cc: peterz@infradead.org, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <20250626062749.1854-1-hdanton@sina.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250626062749.1854-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyNSBTYWx0ZWRfX3n0pfCb7oUEy ErKRh/fPGnLpzqFA8e0ghT5p0w8zy6iKKyw8K9dEliEvY8rIh0rHB36D2g/BvQHlslMB9g8ylcw cKg8MW9t5shtupu5epynURLXkW3gsbm7qGZe0JhdVOQOKWe4ZBbNXK/1IFZ0Mr58b7+Op8hv+q8
 3vtTq9mdlLQ5dfeyw1M7EKhV5NK5Pb+BA+mONR6ZCSEtMxNwLtqJtN5BDA0S7najnzbJdju+vxi SHA6vqnZJ82f5lnz6Ao06U/pzpMpowFQZmzYmRzxCkmSR34c1nM45CVnLzPwFZAn5o8s4G33t05 /prLrlehbAhhI0gJQhJInSjnMU3yGw5pVetrMZd0MCME7aW6y0FiyUjLOJLAYYbyjcHpNwG2AIf
 cZ6A09pgpgxrO/EeOe/mSts6Lh9ZGiPlggaIrxXhjGByfBkEsao8s+ppdBrecLvbndJEl6DM
X-Proofpoint-GUID: RyiolXDrH9HxcnLSGY4vZP07lZIfbOzT
X-Proofpoint-ORIG-GUID: yLcGBipEqA8xS5PCzZgSxJdIqysqs_KV
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=685d5d51 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=D-tfdNA0c9R1JAUw7BAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260125

Hi Hillf.

> On Thu, 26 Jun 2025 00:41:00 +0530 Shrikanth Hegde wrote
>> This describes what avoid CPU means and what scheduler aims to do
>> when a CPU is marked as avoid.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   Documentation/scheduler/sched-arch.rst | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/Documentation/scheduler/sched-arch.rst b/Documentation/scheduler/sched-arch.rst
>> index ed07efea7d02..d32755298fca 100644
>> --- a/Documentation/scheduler/sched-arch.rst
>> +++ b/Documentation/scheduler/sched-arch.rst
>> @@ -62,6 +62,31 @@ Your cpu_idle routines need to obey the following rules:
>>   arch/x86/kernel/process.c has examples of both polling and
>>   sleeping idle functions.
>>   
>> +CPU Avoid
>> +=========
>> +
>> +Under paravirt conditions it is possible to overcommit CPU resources.
>> +i.e sum of virtual CPU(vCPU) of all VM is greater than number of physical
>> +CPUs(pCPU). Under such conditions when all or many VM have high utilization,
>> +hypervisor won't be able to satisfy the requirement and has to context switch
>> +within or across VM. VM level context switch is more expensive compared to
>> +task context switch within the VM.
>> +
> Sounds like VMs not well configured (or pCPUs not well partationed).

No. That's how VMs under paravirtulized case configured as i understand.
Correct me if i am wrong.

On powerpc, we have Shared Processor Logical partitions (SPLPAR) which allows overcommit.
When other LPAR(VM) are idle, by having overcommit one could get more work done. This allows one
to configure more VMs too. The said issue happens only when every/most VMs ask for
CPU at the same time.

> 
>> +In such cases it is better that VM's co-ordinate among themselves and ask for
>> +less CPU request by not using some of the vCPUs. Such vCPUs where workload
>> +can be avoided at the moment are called as "Avoid CPUs". Note that when the
>> +pCPU contention goes away, these vCPUs can be used again by the workload.
>> +
> In the car cockpit scenario for example with type1 hypervisor, there is app
> kicking watchdog bound to every vCPU, so no vCPU should be avoided.

I don't understand what is meant here. Any reference links? Also in such cases,
arch shouldn't set any CPU as avoid. But it may not get this feature benefit.

> 
>> +Arch need to set/unset the vCPU as avoid in cpu_avoid_mask. When set, avoid
>> +the CPU and when unset, use it as usual.
>> +
>> +Scheduler will try to avoid those CPUs as much as it can.
>> +This is achived by
>> +1. Not selecting those CPU at wakeup.
>> +2. Push the task away from avoid CPU at tick.
>> +3. Not selecting avoid CPU at load balance.
>> +
>> +This works only for SCHED_RT and SCHED_NORMAL.
>>   
> Sounds like forcing a pill down through Peter's throat because Steve's headache.

I meant, this series till now address only RT and NORMAL. It could be made work for other classes too.
But i didn't see a point.

Since the mask is available, SCHED_EXT one could design their BPF hooks accordingly and SCHED_DL isn't designed to
work under such conditions. I don't know any user/workload which deploys SCHED_DL in CPU over-commited cases.

