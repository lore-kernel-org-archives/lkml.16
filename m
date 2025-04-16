Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C928373
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744781461; cv=none; b=AuT9qtDct51d9IgYSppFUdC/hZAiwHZQGm0iT8qW1o1hSukf4HhTYqcpmkNaiDAY/PHm6LjMUKnBKnRx5/GemNjTq7T4SX4bWVotViS/mg09GFtWn2F7Sk2LDRv9JooyySrdkQ98/rTbi1ttAh6XN3C9w+LLi6OvyiA1FBJct1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744781461; c=relaxed/simple;
	bh=wdH1FVCvIN1svgj8KGIKMnzOSSyrxuHOskvD7t8tOBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzaeZdvDybhI4C11PyLTye/+dvKwLaKJIDWc3lkQtApPWXQu3TVmb+XmrFh4vNR+DbMzdzw6J4ZgntEzTJEKHzUPIFbOSEPTN3vSww7zvaK2O63YcRaeyho0qqiPX3+bkHub9NEbavcghSG4v3PBTDZQKlebcrLPupBhfKn1vnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=DWsoA7SX; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DWsoA7SX"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FLd4oj018923;
	Wed, 16 Apr 2025 05:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=G+86xd
	LG//LVhLeV3NWAWkjvHSCNCYZoLaa9nQ8N86U=; b=DWsoA7SXs/fHizCNU9MePF
	NxS+YC7TpaE3vz2Oc4D68CQ4T5UN62j/gV7WvvrNZcDShge3nkTJw5PtO+j9SMe/
	HBEGKhKoGSFJDAeMESAttvDBZUOa3pqLuap1coo/2nzIZOM+rTmLPJsVey45Noz1
	gUAVdMKU29oGKsde8U/lnwm8F9EmHOeD52IipmyhXfnV4nhBW79YcfXKthKyRSV4
	009ltxPRYpGDGd1iRpYXmtZOZYQ5mMUe44aua4hoaO2RaZIJRKna0L+CFzwkNAqk
	yh9km8ctrJ42cwVMHQwdhJzHo14tB2USdbJBNaJCDuvwoMQcxtuKQvKew5cLZ+8w
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461yj51hqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 05:30:51 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53G4RakE016689;
	Wed, 16 Apr 2025 05:30:50 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4605726bsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 05:30:50 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53G5Unph50135416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 05:30:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8C7220043;
	Wed, 16 Apr 2025 05:30:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92EB820040;
	Wed, 16 Apr 2025 05:30:47 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 05:30:47 +0000 (GMT)
Message-ID: <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
Date: Wed, 16 Apr 2025 11:00:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Chen Yu <yu.c.chen@intel.com>, Doug Nelson <doug.nelson@intel.com>,
        Mohini Narkhede <mohini.narkhede@intel.com>,
        linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h1m0N3jnifiFFdNV8SNNwHvrLF7DSeRi
X-Proofpoint-ORIG-GUID: h1m0N3jnifiFFdNV8SNNwHvrLF7DSeRi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160039



On 4/16/25 09:28, Tim Chen wrote:
> At load balance time, balance of last level cache domains and
> above needs to be serialized. The scheduler checks the atomic var
> sched_balance_running first and then see if time is due for a load
> balance. This is an expensive operation as multiple CPUs can attempt
> sched_balance_running acquisition at the same time.
> 
> On a 2 socket Granite Rapid systems enabling sub-numa cluster and
> running OLTP workloads, 7.6% of cpu cycles are spent on cmpxchg of
> sched_balance_running.  Most of the time, a balance attempt is aborted
> immediately after acquiring sched_balance_running as load balance time
> is not due.
> 
> Instead, check balance due time first before acquiring
> sched_balance_running. This skips many useless acquisitions
> of sched_balance_running and knocks the 7.6% CPU overhead on
> sched_balance_domain() down to 0.05%.  Throughput of the OLTP workload
> improved by 11%.
> 

Hi Tim.

Time check makes sense specially on large systems mainly due to NEWIDLE balance.

One more point to add, A lot of time, the CPU which acquired sched_balance_running,
need not end up doing the load balance, since it not the CPU meant to do the load balance.

This thread.
https://lore.kernel.org/all/1e43e783-55e7-417f-a1a7-503229eb163a@linux.ibm.com/


Best thing probably is to acquire it if this CPU has passed the time check and as well it is
actually going to do load balance.


> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> Reported-by: Mohini Narkhede <mohini.narkhede@intel.com>
> Tested-by: Mohini Narkhede <mohini.narkhede@intel.com>
> ---
>   kernel/sched/fair.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index e43993a4e580..5e5f7a770b2f 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12220,13 +12220,13 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
>   
>   		interval = get_sd_balance_interval(sd, busy);
>   
> -		need_serialize = sd->flags & SD_SERIALIZE;
> -		if (need_serialize) {
> -			if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
> -				goto out;
> -		}
> -
>   		if (time_after_eq(jiffies, sd->last_balance + interval)) {
> +			need_serialize = sd->flags & SD_SERIALIZE;
> +			if (need_serialize) {
> +				if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
> +					goto out;
> +			}
> +
>   			if (sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {
>   				/*
>   				 * The LBF_DST_PINNED logic could have changed
> @@ -12238,9 +12238,9 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
>   			}
>   			sd->last_balance = jiffies;
>   			interval = get_sd_balance_interval(sd, busy);
> +			if (need_serialize)
> +				atomic_set_release(&sched_balance_running, 0);
>   		}
> -		if (need_serialize)
> -			atomic_set_release(&sched_balance_running, 0);
>   out:
>   		if (time_after(next_balance, sd->last_balance + interval)) {
>   			next_balance = sd->last_balance + interval;

