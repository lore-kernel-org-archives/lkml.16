Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AF179C0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743452287; cv=none; b=E1wAZ01Wb847wA1dPWbCs9fuQzxSMGD1PKa5YyRtmFIRsMZ0tLXqJMykx9NBJ8GbUZ4i1xsDMGhxZJ0wFw4uMel06MVcyvrWR8KVPmJUeumvvq7qOhzxSYfU2VpTaVgIMwTkIite8e0AMWuVrZyUb1sEA2CANU1j8UdA/26e6bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743452287; c=relaxed/simple;
	bh=VhHDZqBCGLeSlUNu57Lq4nqXkpUOEI9NDQBkZcsHZUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNlfJTksRM3/fclrKQ7YhjhvF4UjpoSNeE48uHOf672I25oZsNT9/DzyoqIglh0PfGBqqNiznQ2+4a7SzQ59P9V0KHJrIQQfWAe3U4ck2ngETio2FLh4iDHcVMPWq3ashXVau40dZo0qb70V1+yJsgLPIle8xz8gGV7hbk6UZPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pecJf1rL; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pecJf1rL"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VE3JvX007899;
	Mon, 31 Mar 2025 20:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=j/m9jvURVMvfx7xmNzDMGDOJlNXXXdi/6kzspCrCnls=; b=pecJf1rLqAh3
	Odizz/rTu3uHSpNlEbGFQ+I03Ynmjj8y3+OwnqVNalLGJpQzgGltBeoCHvYNwiHk
	ke/zMrVd5nx/KS7/Aw3laMDhYZCoVogbfVsdka9xcCQop/8CHM34OZl1j+gT1L9J
	KqDb3X8TPwR9q287AdKao/Ocsf7h4rP6nEKwApb96TXC/Gl/i9hsT9UEBAdGhpGR
	uFBIyOVk1PEMLKMUTCUsFgmtDzZKpk6YVaFmrz2t66sudogC+kuBuvmw4vuoGSvR
	5jiF/aMgYXVi9cV0ThNyXP9lElR0QxZYp8rXeCBLBbejYfBrwxE6f5EvdJo/d1HY
	FisrDR7qbA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qvfpsrqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 20:17:37 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52VK8cR0028501;
	Mon, 31 Mar 2025 20:17:36 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qvfpsrqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 20:17:36 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52VHOhM8019392;
	Mon, 31 Mar 2025 20:17:35 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45pu6sym9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 20:17:35 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52VKHZ9A17040114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 20:17:35 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 091CA58062;
	Mon, 31 Mar 2025 20:17:35 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D88B758052;
	Mon, 31 Mar 2025 20:17:28 +0000 (GMT)
Received: from [9.43.91.45] (unknown [9.43.91.45])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Mar 2025 20:17:28 +0000 (GMT)
Message-ID: <0d7fa00e-587e-4ac8-90d0-115f30fdf0ac@linux.ibm.com>
Date: Tue, 1 Apr 2025 01:47:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] sched: Cache aware load-balancing
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: mingo@kernel.org, gautham.shenoy@amd.com, kprateek.nayak@amd.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
        tim.c.chen@linux.intel.com, tglx@linutronix.de,
        Peter Zijlstra <peterz@infradead.org>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
 <8f5f01cc-c88d-40e6-bc64-74d0e2093bf3@linux.ibm.com>
 <457a6070-b34e-4467-8251-f69c4015fccb@intel.com>
Content-Language: en-US
Reply-To: 457a6070-b34e-4467-8251-f69c4015fccb@intel.com
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
In-Reply-To: <457a6070-b34e-4467-8251-f69c4015fccb@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V2sTUqE94spvxMYruqA5yc24uxi9YFtd
X-Proofpoint-GUID: n2mFqPASfA9AZCynkF_eBdJv68bWng5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310135

Hi Chen Yu,

On 27/03/25 16:44, Chen, Yu C wrote:
> Hi Madadi,
> 
> On 3/27/2025 10:43 AM, Madadi Vineeth Reddy wrote:
>> Hi Peter,
>>
>> On 25/03/25 17:39, Peter Zijlstra wrote:
>>> Hi all,
>>>
>>> One of the many things on the eternal todo list has been finishing the
>>> below hackery.
>>>
>>> It is an attempt at modelling cache affinity -- and while the patch
>>> really only targets LLC, it could very well be extended to also apply to
>>> clusters (L2). Specifically any case of multiple cache domains inside a
>>> node.
>>>
>>> Anyway, I wrote this about a year ago, and I mentioned this at the
>>> recent OSPM conf where Gautham and Prateek expressed interest in playing
>>> with this code.
>>>
>>> So here goes, very rough and largely unproven code ahead :-)
>>>
>>> It applies to current tip/master, but I know it will fail the __percpu
>>> validation that sits in -next, although that shouldn't be terribly hard
>>> to fix up.
>>>
>>> As is, it only computes a CPU inside the LLC that has the highest recent
>>> runtime, this CPU is then used in the wake-up path to steer towards this
>>> LLC and in task_hot() to limit migrations away from it.
>>>
>>> More elaborate things could be done, notably there is an XXX in there
>>> somewhere about finding the best LLC inside a NODE (interaction with
>>> NUMA_BALANCING).
>>
>> Tested the patch on a 12-core, 96-thread Power10 system using a real-life
>> workload, DayTrader.
> 
> Do all the Cores share the same LLC within 1 node? If this is the case,
> the regression might be due to over-migration/task stacking within 1 LLC/node. This patch should be modified that cache aware load balancing/wakeup will not be triggered if there is only 1 LLC within the node IMO.

Are you asking whether LLC is shared at the node level?

In Power10, the LLC is at the small core level, covering 4 threads.

In my test setup, there were 4 nodes, each with 24 CPUs, meaning there
were 6 LLCs per node.

Went through the patch in more detail and will check if task stacking
is an issue using micro-benchmarks.

Thanks for your feedback.

Thanks,
Madadi Vineeth Reddy

> 
> thanks,
> Chenyu
> 
>>
>> Here is a summary of the runs:
>>
>> Users | Instances | Throughput vs Base | Avg Resp. Time vs Base
>> --------------------------------------------------------------
>> 30    | 1        | -25.3%              | +50%
>> 60    | 1        | -25.1%              | +50%
>> 30    | 3        | -22.8%              | +33%
>>
>> As of now, the patch negatively impacts performance both in terms of
>> throughput and latency.
>>
>> I will conduct more extensive testing with both microbenchmarks and
>> real-life workloads.
>>
>> Thanks,
>> Madadi Vineeth Reddy
>>

