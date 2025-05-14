Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40137270EAD
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226330; cv=none; b=WcpD6fSQJEYS5Bqt2z+o2jSudfFMwxiDqZfn+fLYR/I4aI67Pb65hH8q5IKTS1cEbB0EXJhk3zGLB3fi0+nki9gEUQFM9tIFE9pyHc14ZmSMBcfJicXQcNAzL1ZW/c65AnAGTGPfkesrzE2RORbzeBXqrdsttMTuGq2SHc2yTd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226330; c=relaxed/simple;
	bh=CCfNfJ5bb7qCHfRJizyQOx3CnzJAaVM58ug6LQ5hZEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VTZIWocalCDwYD+rCwp3Llztq20wwbC7wi/q30unSfU0XiLxXURI5b3ql9FtS/IWd0jANVrT4F0V0hhgxY4dVPdMzrSK6u71VB2FU1YYMJUSA0yT8hPVRBAIl3TH74tlXBXns8YeHQbgyMReixOVD6jZOCu4zfWro+RWLNJjS/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pd+jKYcK; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pd+jKYcK"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E841If017405;
	Wed, 14 May 2025 12:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bxX0vL
	xS6Jo7Bb6L7DQCh6f0IX5p4iN4W6BATOc3hjE=; b=pd+jKYcK6VVmTWK8fo1cml
	AKgh6HSqX3qT4QlkMSjmMwo6LGWp+wAX1pBuSyZq4PLbDSV2T2XvMl/LmXZnrIYG
	+qhklX58pj9kD+c0VI2OzbFf1/UEHcHXIx8G9/6RDcQ3DMzQFsYQ8AmSul6IAOAY
	ZYUOd+1RUFJCeWcQssYILwWTqgUlJM533REUUKTwgp8i18xkSPRan9JaplOh3SV6
	yuY1ulUnQ+oHPjPafkzqXSl5pMcq8HX6tW72GP1p8Vl0Yc52BEDe24IQxqXobvDq
	rON/xWjyn3A2Qdki3qhmln5dE3r5q7FTC1RjaOqAQ+235JXlpOkKNEXM8D3mHC8A
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbq8m7k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 12:38:02 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54EA64AA021574;
	Wed, 14 May 2025 12:38:01 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfrm593-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 12:38:01 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54ECc0CI32637636
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 12:38:00 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71E2058057;
	Wed, 14 May 2025 12:38:00 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B74C658058;
	Wed, 14 May 2025 12:37:57 +0000 (GMT)
Received: from [9.204.206.228] (unknown [9.204.206.228])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 May 2025 12:37:57 +0000 (GMT)
Message-ID: <d3bb8ecd-3ac2-4025-bd81-4d612bb26995@linux.ibm.com>
Date: Wed, 14 May 2025 18:07:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/6] Sched: Add scheduler stat for cpu time slice
 extension
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        linux-kernel@vger.kernel.org,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
 <20250513214554.4160454-5-prakash.sangappa@oracle.com>
Content-Language: en-US
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
In-Reply-To: <20250513214554.4160454-5-prakash.sangappa@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -QDDZYzDNeHwMWmy81_oDstfQx7pGSOL
X-Authority-Analysis: v=2.4 cv=GrRC+l1C c=1 sm=1 tr=0 ts=68248eaa cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=yPCof4ZbAAAA:8 a=tvvlUZRM0BAFnUtkwMwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDExMSBTYWx0ZWRfXximS2Yh56Paf 9XOw6zqdDUn+b9Sb/Yn09/Bme3sNPMxZ7yUdjhbyQA6ebnQD4Eysmb2ZT48R5F8IJbRSg3V54FS 5/LF0O81hsNIX1OgZjUy7Bf69IG3G6HMQqbREtoz/3THr3ZRDNLxXOnqUIOSdaEk9q0SqD3PO7I
 F3Llmtapki28E4hyiRdhqEFf7DCA1rQeRjdAt39HDbeoHlInFuE54xretI+LwGwqpqMbr+/UWEU 6zj5osP+KZC956lFBLVZ2oIn4CTPMJrqhtSN3w4YL9WiBuGDd2K5GYWXlmR0Rf2MUxCCx9Vglsv OaO5NiHcTVX0fZ+pw76g67/NrWBXvVkQTMm9kmTsfPnluEfC7rQG1hJ2/gspvKJo3fBq7bpJBgY
 c1/ZSJyCjhtENbtabbKFUrJrdIx22EnbPHjWoT1Ifgq8+QEgKJqiRUT7tjhbup+xRi5RVIfz
X-Proofpoint-GUID: -QDDZYzDNeHwMWmy81_oDstfQx7pGSOL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140111

On 14/05/25 03:15, Prakash Sangappa wrote:
> Add scheduler stat to record number of times the thread was granted
> cpu time slice extension.
> 
> Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
> ---
>  include/linux/sched.h | 2 ++
>  kernel/rseq.c         | 1 +
>  kernel/sched/core.c   | 5 +++++
>  kernel/sched/debug.c  | 1 +
>  4 files changed, 9 insertions(+)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index c279232ca6a2..8cf756e80ae9 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -340,6 +340,7 @@ extern void io_schedule_finish(int token);
>  extern long io_schedule_timeout(long timeout);
>  extern void io_schedule(void);
>  extern void hrtick_local_start(u64 delay);
> +extern void update_stat_preempt_delayed(struct task_struct *t);
>  
>  /* wrapper function to trace from this header file */
>  DECLARE_TRACEPOINT(sched_set_state_tp);
> @@ -563,6 +564,7 @@ struct sched_statistics {
>  	u64				nr_wakeups_affine_attempts;
>  	u64				nr_wakeups_passive;
>  	u64				nr_wakeups_idle;
> +	u64				nr_preempt_delay_granted;
>  
>  #ifdef CONFIG_SCHED_CORE
>  	u64				core_forceidle_sum;
> diff --git a/kernel/rseq.c b/kernel/rseq.c
> index 44d0f3ae0cd3..c4bc52f8ba9c 100644
> --- a/kernel/rseq.c
> +++ b/kernel/rseq.c
> @@ -475,6 +475,7 @@ bool rseq_delay_resched(void)
>  		return false;
>  
>  	t->sched_time_delay = 1;
> +	update_stat_preempt_delayed(t);
>  
>  	return true;
>  }
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 31928cbcd907..880368756b48 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -938,6 +938,11 @@ void hrtick_local_start(u64 delay)
>  	rq_unlock(rq, &rf);
>  }
>  
> +void update_stat_preempt_delayed(struct task_struct *t)
> +{
> +	schedstat_inc(t->stats.nr_preempt_delay_granted);

I think schedstat documentation also needs to be updated
and may be bump the version number.

Thanks,
Madadi Vineeth Reddy

> +}
> +
>  static void hrtick_rq_init(struct rq *rq)
>  {
>  #ifdef CONFIG_SMP
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index 4cba21f5d24d..6b753f56c312 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -1216,6 +1216,7 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
>  		P_SCHEDSTAT(nr_wakeups_affine_attempts);
>  		P_SCHEDSTAT(nr_wakeups_passive);
>  		P_SCHEDSTAT(nr_wakeups_idle);
> +		P_SCHEDSTAT(nr_preempt_delay_granted);
>  
>  		avg_atom = p->se.sum_exec_runtime;
>  		if (nr_switches)

