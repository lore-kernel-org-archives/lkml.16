Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B218194098
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750999056; cv=none; b=rFN99SbygeIl2tRvg0bRFUC3w48ns+ekWewEcaP0l+AJ6dAC5o+vsPaNV5FZ6abx4ybOVNMP6FXH61X0pBwdoPpDQ5rHhyOk6knmVlVkjAM9Dq3tAQmgXssfaR8voWnGTAtwwJ8aAuzclNQBYupqN68SVb0xV7IKf3q30o3ugCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750999056; c=relaxed/simple;
	bh=sZ0kvo5hj0wCWOxADzWX3B9YV9ONtNMk6KjctCFj06A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZBHJPctB4VzKk4jTsQWzGYFcqSzdmW88sFqru7xygv+QGjRpinkGw0z5Pv8BTGJHDgqqZllcbxLniRk8yQcLlg7CLPWS3l2QAOGieaggg0n4awxTzmxGpaREhMEAkgp7yyh7Z6um3CVMHHaFe59wUx5cRNqPfle1mVLWPKTibA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BfGEgJxC; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BfGEgJxC"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R09d3p015800;
	Fri, 27 Jun 2025 04:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CyiHVQ
	FLyI59jtvBxhOTNXv4t4lAv7K1w4rximKfsXE=; b=BfGEgJxCpSOoGqVGIJlGjH
	4dwS/VlfFkwLKuV59ZI55qbwA2bKflGC6yYAAZlX++EQlRr9W5ZTbGdQaSg2kHi2
	fIt8/z5K8WvS6u0I6a92pM3BLw1FaRdmlXcv37bJoQmv7ElkNoz1ZTAFLgidEXMr
	Rwkftuye71CBV06lr0+CFtjc5IjyvlEoEEtmjRXdKf1y3cbn6/d05jZNOtJOi/rW
	LzF6b8AVr/OQfGozn7OKD6OWM5IONT3UnvKE9QlSpV8JyHxuNj18Xu7xr6EcjRSw
	OeA9kMckca2LT69Cg181MzwUI04ucsSg7rDSKvE31dsO2rNovqX7SjygDhindRYg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8ju47n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 04:37:28 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55R4bE9l018849;
	Fri, 27 Jun 2025 04:37:27 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8ju47k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 04:37:27 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4Cmgt002499;
	Fri, 27 Jun 2025 04:37:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e8jmjags-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 04:37:26 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55R4bOiZ60227982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 04:37:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42DEA20043;
	Fri, 27 Jun 2025 04:37:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53B2920040;
	Fri, 27 Jun 2025 04:37:23 +0000 (GMT)
Received: from [9.124.209.126] (unknown [9.124.209.126])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Jun 2025 04:37:23 +0000 (GMT)
Message-ID: <90456362-ad16-4fa8-bba5-ec40aba88aa4@linux.ibm.com>
Date: Fri, 27 Jun 2025 10:07:22 +0530
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
 <20250627002702.1942-1-hdanton@sina.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250627002702.1942-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAzMSBTYWx0ZWRfX55oGt9pu1R11 JTfLmXtxf6yzF0bF7kxK+aa0KLV8GeHrXNb73FeZWCX+OSZ8bKfQa8LmE7pUcEb1OoBeC0Z6PoK jO7snhBEAuhgo7zIY0vWrBM5Q+I5YBHG4qcK+iAdL7PLuW0uz6a1mifzwmoPM3x9E5jQ7rFR6Hi
 RtJXzepXpG1I/SkAcMiIM9j1mBi+iCE9UvZ2eAysNzRI6LiVhX7sD1PGu3EWygQHXLeqBUADh3Y He/Np+7S551U3r0GtlB7+vGM13jr64+UvmAjBz61gf+IeUPiLY3uGSYUtrIv3BNBnoIkhGmgmi/ 2t5NWwHZoUrInP8/PMyGZ8YUYSb8FNjVd7gatx8czWGCrGqLyILu/nRW/iSl65Td8Ret9ZhEPFR
 wXuC+7aD3mCXcrZrGDgCVx/xVFJJrxcJrhhFxfVUnSeBb60rugwl/FV0bNwhfR0ijDUh1ZaR
X-Proofpoint-GUID: vKuR8QaYkHQE0au9ISstXZEOjXI8r76X
X-Proofpoint-ORIG-GUID: KvGaF0RuXIZoSVxKA7O-SIUxC1hLVnBV
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=685e2008 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=pUQdj10GKJCR0CtNze0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270031



On 6/27/25 05:57, Hillf Danton wrote:
> On Thu, 26 Jun 2025 20:16:36 +0530 Shrikanth Hegde wrote
>>> On Thu, 26 Jun 2025 00:41:00 +0530 Shrikanth Hegde wrote
>>>> This describes what avoid CPU means and what scheduler aims to do
>>>> when a CPU is marked as avoid.
>>>>
>>>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>>> ---
>>>>    Documentation/scheduler/sched-arch.rst | 25 +++++++++++++++++++++++++
>>>>    1 file changed, 25 insertions(+)
>>>>
>>>> diff --git a/Documentation/scheduler/sched-arch.rst b/Documentation/scheduler/sched-arch.rst
>>>> index ed07efea7d02..d32755298fca 100644
>>>> --- a/Documentation/scheduler/sched-arch.rst
>>>> +++ b/Documentation/scheduler/sched-arch.rst
>>>> @@ -62,6 +62,31 @@ Your cpu_idle routines need to obey the following rules:
>>>>    arch/x86/kernel/process.c has examples of both polling and
>>>>    sleeping idle functions.
>>>>    
>>>> +CPU Avoid
>>>> +=========
>>>> +
>>>> +Under paravirt conditions it is possible to overcommit CPU resources.
>>>> +i.e sum of virtual CPU(vCPU) of all VM is greater than number of physical
>>>> +CPUs(pCPU). Under such conditions when all or many VM have high utilization,
>>>> +hypervisor won't be able to satisfy the requirement and has to context switch
>>>> +within or across VM. VM level context switch is more expensive compared to
>>>> +task context switch within the VM.
>>>> +
>>> Sounds like VMs not well configured (or pCPUs not well partationed).
>>
>> No. That's how VMs under paravirtulized case configured as i understand.
>> Correct me if i am wrong.
>>
>> On powerpc, we have Shared Processor Logical partitions (SPLPAR) which allows overcommit.
>> When other LPAR(VM) are idle, by having overcommit one could get more work done. This allows one
>> to configure more VMs too. The said issue happens only when every/most VMs ask for
>> CPU at the same time.
>>
> After putting virtualization aside, lets see a simpler case where more
> than 1024 apps are bound to a single (ppc having 4 CPUs for instance) CPU,
> what can we do wrt app responsibility in kernel? 

In this case you will not likely have vCPU preemption. you will have 
task preemption. That is ok. Patch doesn't aim to solve the case you 
have mentioned above.

In the generic SPLPAR configuration virtual processor usually have large 
number of vCPUs and powerpc systems are fairly large in terms of CPU as 
well.

I hope that answers.
