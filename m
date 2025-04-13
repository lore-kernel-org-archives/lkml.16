Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A68291E
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 04:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744517465; cv=none; b=u22nU/DRfkHsz1JhOwHXOxNx4nvJ289AwlGSsLX1Lg904RaB8OCwG+6Bzr5fYRCdtLjT9yx2XrAhJLaD3CgRThlN9rD27M65AkIOm46U5qYN8lIZ7d9uGBYwZWbRDSJeAslQVcA4AUgjIKG4l7h1/T6VK7KMWXR/6XKxN2FEi/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744517465; c=relaxed/simple;
	bh=Z2dDT7ToMC3wfE63mGlvuduEhZAD4mWTcaJA8Y+121c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qBFvai8/Q/38u4QOY0pUNsTTh7Fnn6uMxQ6o5AEpL+rQXRFljqbe71gGG4np2TLcWh/H80r9vIbzjDO6ORfxiW2ShO+RSkrhT+nYwu1eoynv69t3BVpipCBbhTf9yACG6glsJYYBu9DExFxSmALEc0W7MdqX54+KELwjecmvZAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PmHIIOd0; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PmHIIOd0"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53D3DJJV031327;
	Sun, 13 Apr 2025 04:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=xSZhAYtDPobB/tcATmEkkZLZKJVK0wgD6iqpq5cikoA=; b=PmHIIOd0Ij7J
	NCsHH/OigIy3J1ofQj2wU/kNXAB4loYitlnELN3eIPvG1BP1BJl3+TWf0ZKz3rmt
	g2Qa7N6Mdmm2GeZhkRsKnD6uTKWUa6L2xxHKklw9cQlWPpExWwnNJ+UnxufvIh3q
	FaLMRDSlMZEtyb2EA5mcSmI45+LuN9OAvhnASxBmDOAP8Y2+EjZFHJGldhv1c7ID
	W7bFM3f0LZf2rr0uFTNcAfV2UMeOYREtXwsLKCMbfM6bSeP3Tje4G+PqkSqoHOYS
	IGIF2zyuSWZ5xjpXM1Z7amvA7jFC6vu2ge6Cd8mkpBSV4MzEZnbLF3g/LTJ62VnH
	De+BWOSyjQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ypmpbnar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Apr 2025 04:10:52 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53D4ApdX014258;
	Sun, 13 Apr 2025 04:10:51 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ypmpbnan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Apr 2025 04:10:51 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53D0bT0C001272;
	Sun, 13 Apr 2025 04:10:51 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4602vygnp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Apr 2025 04:10:51 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53D4Aokj10158700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 13 Apr 2025 04:10:50 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F5BA5804B;
	Sun, 13 Apr 2025 04:10:50 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6613A58055;
	Sun, 13 Apr 2025 04:10:46 +0000 (GMT)
Received: from [9.43.111.221] (unknown [9.43.111.221])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 13 Apr 2025 04:10:46 +0000 (GMT)
Message-ID: <4da6d43b-59f6-48e4-b58c-2f0792035851@linux.ibm.com>
Date: Sun, 13 Apr 2025 09:40:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: Remove stale references to LAST_BUDDY and
 SKIP_BUDDY
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Adam Li
 <adamli@os.amperecomputing.com>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <20250314090128.25141-1-vineethr@linux.ibm.com>
Content-Language: en-US
Reply-To: 20250314090128.25141-1-vineethr@linux.ibm.com
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
In-Reply-To: <20250314090128.25141-1-vineethr@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wmwTjYeqZfRS9iC4-6RUXg9LTTkaMkdS
X-Proofpoint-GUID: ksDGHrEE1nTBlhH7Y4-Y47NUkwX0fPuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=758 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504130028

Hi Peter, Ingo,

Ping.

Any thoughts on this? Can it be picked up?

Thanks,
Madadi Vineeth Reddy

On 14/03/25 14:31, Madadi Vineeth Reddy wrote:
> Commit 5e963f2bd465 ("sched/fair: Commit to EEVDF") removed the
> functionality associated with LAST_BUDDY and SKIP_BUDDY. However,
> some outdated references remained in the comments for pick_next_entity
> and check_preempt_wakeup_fair. This commit cleans up those comments
> to maintain clarity and correctness.
> 
> No functional change intended.
> 
> Co-developed-by: Adam Li <adamli@os.amperecomputing.com>
> Signed-off-by: Adam Li <adamli@os.amperecomputing.com>
> Signed-off-by: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
> ---
>  kernel/sched/fair.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 9dafb374d76d..379dbcbb24e9 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5578,8 +5578,6 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags);
>   * Pick the next process, keeping these things in mind, in this order:
>   * 1) keep things fair between processes/task groups
>   * 2) pick the "next" process, since someone really wants that to run
> - * 3) pick the "last" process, for cache locality
> - * 4) do not run the "skip" process, if something else is available
>   */
>  static struct sched_entity *
>  pick_next_entity(struct rq *rq, struct cfs_rq *cfs_rq)
> @@ -8780,9 +8778,7 @@ static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int
>  	 *
>  	 * Note: this also catches the edge-case of curr being in a throttled
>  	 * group (e.g. via set_curr_task), since update_curr() (in the
> -	 * enqueue of curr) will have resulted in resched being set.  This
> -	 * prevents us from potentially nominating it as a false LAST_BUDDY
> -	 * below.
> +	 * enqueue of curr) will have resulted in resched being set.
>  	 */
>  	if (test_tsk_need_resched(rq->curr))
>  		return;

