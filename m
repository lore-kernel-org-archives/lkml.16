Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792FF33C9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 05:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745212854; cv=none; b=EviJ11vEe6wEIUnavi3DWSyTnJUWIhxbdSE7zlXu1ErpkBYZRmPHNnzMzoqEnXx1tfIwkKqXn2kyAOFtuxm8dDh4jGr96Mm6sDKIj0UqJkuUTWhqLsrwl7zTs4HYUGo2z+iq2VWW3xNubdsmMWzXISNCoaubfatIn1+RWNLhvgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745212854; c=relaxed/simple;
	bh=KnUO/LX/95E7aRLD9HruvCQk4jPxuppj51JJTZ8jPQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRAIKF/W5WIOoKxIFpruxG0ENiOl9RzxpvM0fFfqrwJf+6YOGxgux/uhyMdqUh0YeHyQ5MakrEY4S5xuUfxUoBGA14IA805YIoLULZY3SGBkK5OXrKYpkkyFzNre7imTizAp2o4H2eXCQ4w38rbFMSXoR808OAoOv0tGdgg4dHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=KHHPoBhR; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="KHHPoBhR"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KJnV83013827;
	Mon, 21 Apr 2025 05:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=k4cuq8
	wZxFlqPTwNPwFRnzjGGRumIOcbNkbHQA90so0=; b=KHHPoBhRKvGW6fpNaV1H+h
	1zFLAKGkkIOujRWx9lag/5CAP7i1cob0lSFqY9WHwcAA8PI9RFQrOqlUC2K0jD9I
	Zm83pmAHdOxzjgzUbp+ObQxzK6qLK/esqa0SWJloiP6wXWlAqDKJJgcdYUR0idhp
	igLSsrIcmkgoQR6GAlRDKo8A0yJa3fsDpEwwDX1zmyDmhkdFKY3tsJR475fR34Pv
	9mLeXZIsXBuuSZugFJgEYZuf6cve4RVwwrBtygRUqf8T7FDuFiXZE+RLhAGIJzgL
	SOcjalNXuZfP5TPICwNEnEAaDwYYF1DFaYnzKppAlb0njQfeysd0J9WQk5oJFqWg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464xuhtud7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 05:20:25 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53L5ApnN000618;
	Mon, 21 Apr 2025 05:20:25 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464xuhtud2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 05:20:24 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53L21H9u032622;
	Mon, 21 Apr 2025 05:20:23 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464phyd25b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 05:20:23 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53L5KL6453412160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 05:20:21 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 921562004B;
	Mon, 21 Apr 2025 05:20:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7949320040;
	Mon, 21 Apr 2025 05:20:19 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 05:20:19 +0000 (GMT)
Message-ID: <2dae733a-689c-4574-a4dc-f59f11fb0893@linux.ibm.com>
Date: Mon, 21 Apr 2025 10:50:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] sched/fair: Update overloaded mask in presence of
 pushable task
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
 <20250409111539.23791-4-kprateek.nayak@amd.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250409111539.23791-4-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MUmlaygNZG4z8zpqN8ciDQ5qEOmDG0_p
X-Proofpoint-ORIG-GUID: 8Awm6miAw-NMA3Ojvd3PSga_3vYNSsqr
X-Authority-Analysis: v=2.4 cv=LbY86ifi c=1 sm=1 tr=0 ts=6805d599 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=zd2uoN0lAAAA:8 a=AL8CKfK0g7BONiVoCLkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=897 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210037



On 4/9/25 16:45, K Prateek Nayak wrote:

Hi Prateek. Feel free to cc me in the future versions.
This seems interesting way if it can get us rid of newidle balance overheads.

> In presence of pushable tasks on the CPU, set it on the newly introduced
> "overloaded+mask" in sched_domain_shared struct. This will be used by
> the newidle balance to limit the scanning to these overloaded CPUs since
> they contain tasks that could be run on the newly idle target.
> 
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>   kernel/sched/fair.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 98d3ed2078cd..834fcdd15cac 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8559,6 +8559,24 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>   	return target;
>   }
>   
> +static inline void update_overloaded_mask(int cpu, bool contains_pushable)
> +{
> +	struct sched_domain_shared *sd_share = rcu_dereference(per_cpu(sd_llc_shared, cpu));
> +	cpumask_var_t overloaded_mask;
> +
> +	if (!sd_share)
> +		return;
> +
> +	overloaded_mask = sd_share->overloaded_mask;
> +	if (!overloaded_mask)
> +		return;
> +
> +	if (contains_pushable)
> +		cpumask_set_cpu(cpu, overloaded_mask);
> +	else
> +		cpumask_clear_cpu(cpu, overloaded_mask);
> +}
> +

I was getting below error when compiling. Noticed that overloaded_mask is a local update and it wouldn't
update the actual overloaded_mask.

Compilation Error:
kernel/sched/fair.c: In function ‘update_overloaded_mask’:
kernel/sched/fair.c:8570:25: error: assignment to expression with array type
  8570 |         overloaded_mask = sd_share->overloaded_mask;
       |                         ^
kernel/sched/fair.c:8571:13: warning: the address of ‘overloaded_mask’ will always evaluate as ‘true’ [-Waddress]
  8571 |         if (!overloaded_mask)



Made the below change. Also you would need rcu protection for sd_share i think.

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index bca3db5d0ac0..818d4769ec55 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8562,19 +8562,18 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
  static inline void update_overloaded_mask(int cpu, bool contains_pushable)
  {
         struct sched_domain_shared *sd_share = rcu_dereference(per_cpu(sd_llc_shared, cpu));
-       cpumask_var_t overloaded_mask;
  
         if (!sd_share)
                 return;
  
-       overloaded_mask = sd_share->overloaded_mask;
-       if (!overloaded_mask)
+       if (!sd_share->overloaded_mask)
                 return;
  
+       guard(rcu)();
         if (contains_pushable)
-               cpumask_set_cpu(cpu, overloaded_mask);
+               cpumask_set_cpu(cpu, sd_share->overloaded_mask);
         else
-               cpumask_clear_cpu(cpu, overloaded_mask);
+               cpumask_clear_cpu(cpu, sd_share->overloaded_mask);
  }

>   static inline bool fair_push_task(struct task_struct *p)
>   {
>   	if (!task_on_rq_queued(p))
> @@ -8606,11 +8624,17 @@ static inline void fair_queue_pushable_tasks(struct rq *rq)
>   static void fair_remove_pushable_task(struct rq *rq, struct task_struct *p)
>   {
>   	plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> +
> +	if (!has_pushable_tasks(rq))
> +		update_overloaded_mask(rq->cpu, false);
>   }
>   
>   static void fair_add_pushable_task(struct rq *rq, struct task_struct *p)
>   {
>   	if (fair_push_task(p)) {
> +		if (!has_pushable_tasks(rq))
> +			update_overloaded_mask(rq->cpu, true);
> +
>   		plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
>   		plist_node_init(&p->pushable_tasks, p->prio);
>   		plist_add(&p->pushable_tasks, &rq->cfs.pushable_tasks);

