Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE55FBE67
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178520; cv=none; b=ItCkQVqJ0oWGrMdZ0fQ7vrbwL08zyJJzafLpV5fPHbkGSjRXtpmCRcvdGigZWloXYiMn7r6VorHwTMfrWmrtcjqSMdxigfc/UlICTdn8FELgOZeqBrP9yrKNrpeLMcNrWfilIBBDp6W/e7Ha+2U5oqSxnM3f4gMiF4cf8s6hxj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178520; c=relaxed/simple;
	bh=/kneOOVnoQvMgkDLEuvrDnqlkf9nZVMLvBtOfhblxOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOYrp7Ip4XIqgU8cA6hBNtdl1ScNHm46dNKcqnP6uamodLlrOnTjyYs1XInOrWZdR7HIcijHFSWisoqYa5H+r8aisMnh2y206gdq/sQgzYl9kLRCWYRZBLJvYzWSYKTLRketa5zksunrFdJLG68HFrU8h5XjM8zl1DMmxkuk9EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tT2KjERK; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tT2KjERK"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538HBkem003773;
	Wed, 9 Apr 2025 06:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=4SJDde8lmrR4An3lPvJudvTE1bu8YDqlBSrMEx0VFxI=; b=tT2KjERKUSGz
	zrCfxVOWSpTFlqEXdI6pgFzoHaNtDYIY4JsHesdCvGgAG6YpLyPlaz+DUlnmYSuZ
	b2K50OoVWogo9P/1yK2BIfVQtirAI7j603wgbP9F0m1OXzdb0eVfyE8nrThRsniA
	1UkMDIJnzDrU5VSoUXp4uzPx3gZV8vdzwYZLLbGGqjwgw0f0CLRxS3fXidN1XQQ7
	88C6m8vfHbxjneRPyNb/H4uE0BKXnhGjqtcPNBgl+TKLtwaTg9mSZxyqEuItsk0j
	xgC45CgBTT//PZMlHEj/akERZyljqI0xdkWkbU/TVve7V4azyAQX+jPSbxnnz4TK
	BZAIb1odIQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45w7yxarr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 06:01:39 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53961dYK020353;
	Wed, 9 Apr 2025 06:01:39 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45w7yxarqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 06:01:39 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53954Q95025562;
	Wed, 9 Apr 2025 06:01:38 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ugbkx8vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 06:01:38 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53961cHr39912010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 06:01:38 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C10C580DF;
	Wed,  9 Apr 2025 06:01:38 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31193580D7;
	Wed,  9 Apr 2025 06:01:33 +0000 (GMT)
Received: from [9.43.21.2] (unknown [9.43.21.2])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Apr 2025 06:01:32 +0000 (GMT)
Message-ID: <e52847fc-8aae-4fd7-90e4-494be02e214b@linux.ibm.com>
Date: Wed, 9 Apr 2025 11:31:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/1] sched: Remove unreliable wake_cpu check in
 proxy_needs_return
To: hupu <hupu.gm@gmail.com>
Cc: jstultz@google.com, linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
        peterz@infradead.org, vschneid@redhat.com, mingo@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        hupu@transsion.com, Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <20250407134654.92841-1-hupu.gm@gmail.com>
Content-Language: en-US
Reply-To: 20250407134654.92841-1-hupu.gm@gmail.com
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
In-Reply-To: <20250407134654.92841-1-hupu.gm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7KLj8l9Nty7nwh56AyH3noRUkiRSXAJ2
X-Proofpoint-GUID: UVxoA-B7r40WyAgbpA3huDgpKqZ_dbxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090020

On 07/04/25 19:16, hupu wrote:
> The (p->wake_cpu != cpu_of(rq)) check in proxy_needs_return() is unsafe
> during early wakeup phase. When called via ttwu_runnable() path:
> 
> |-- try_to_wake_up
>     |-- ttwu_runnable
>         |-- proxy_needs_return    //we are here
>     |-- select_task_rq
>     |-- set_task_cpu              //set p->wake_cpu here
>     |-- ttwu_queue
> 
> The p->wake_cpu at this point reflects the CPU where donor last ran before
> blocking, not the target migration CPU. During blocking period:
> 1. CPU affinity may have been changed by other threads
> 2. Proxy migrations might have altered the effective wake_cpu
> 3. set_task_cpu() hasn't updated wake_cpu yet in this code path
> 
> This makes the wake_cpu vs current CPU comparison meaningless and potentially
> dangerous. Rely on find_proxy_task()'s later migration logic to handle CPU
> placement based on up-to-date affinity and scheduler state.
> 
> Signed-off-by: hupu <hupu.gm@gmail.com>
> ---
>  kernel/sched/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 3c4ef4c71cfd..ca4ca739eb85 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4047,7 +4047,7 @@ static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
>  
>  	raw_spin_lock(&p->blocked_lock);
>  	if (__get_task_blocked_on(p) && p->blocked_on_state & BO_NEEDS_RETURN) {
> -		if (!task_current(rq, p) && (p->wake_cpu != cpu_of(rq))) {
> +		if (!task_current(rq, p)) {
>  			if (task_current_donor(rq, p)) {
>  				put_prev_task(rq, p);
>  				rq_set_donor(rq, rq->idle);

Which tree is this change based on? I don't see `proxy_needs_return` in tip/sched/core.

Thanks,
Madadi Vineeth Reddy

