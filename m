Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C51233718
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800957; cv=none; b=hOlQhGwgHk4sX++p+FRocGuAVfiBvafFa/uSJXWsV1VoaSsz9I8nf9BinFVPSdcxlBagotXlNYGh2jDk+ukLzPffa8EiJ8JD2xA+EWHPO342XVGhtSjRouCFFjQHlmZVQW0Vja+Wxy8ZGI4Xbjgsi+LpWzb+78fIG6kYvqNVujw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800957; c=relaxed/simple;
	bh=BX29mFmxNs7GRBvA+Nt3iMZeGvNwbVcTiCJ/uRpP9/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hiRQP3pmuOa+53zfCth+3sF5M0NKlsmPyca+GKHnzhL2Ou3Sc5GT+PiT38f8TaolT0zgq75vRfoAr+k+Bvgd+dPNXlsumMmgfahjmLUkvWAijR8Z5zdcGIZdhiS6WI/Euv2ivyxCthryD/k00hiSoIGTJDVUN8+SSQKCT4ayyMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB693152B;
	Wed, 16 Apr 2025 03:55:52 -0700 (PDT)
Received: from [192.168.178.115] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 053793F66E;
	Wed, 16 Apr 2025 03:55:51 -0700 (PDT)
Message-ID: <d71b49d3-78a0-44c6-bac8-2619f8d0c4f0@arm.com>
Date: Wed, 16 Apr 2025 12:55:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] sched/util_est: Do not sub the delayed-task's
 util-est
To: Hongyan Xia <hongyan.xia2@arm.com>, Xuewen Yan <xuewen.yan@unisoc.com>,
 vincent.guittot@linaro.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com
Cc: rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.co, linux-kernel@vger.kernel.org, qyousef@layalina.io,
 ke.wang@unisoc.com, di.shen@unisoc.com, xuewen.yan94@gmail.com
References: <20250314090909.8404-1-xuewen.yan@unisoc.com>
 <be0cace9-d173-4de3-959e-861876ad77fc@arm.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <be0cace9-d173-4de3-959e-861876ad77fc@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/04/2025 15:39, Hongyan Xia wrote:
> On 14/03/2025 09:09, Xuewen Yan wrote:
>> In cpu_util_without, When the task is in rq, we should
>> sub the task's util_est, however, the delayed_task->on_rq
>> is true, however, the delayed_task's util had been sub
>> when sleep, so there is no need to sub the delayed task's
>> util-est. So add the checking of delayed-task.
>>
>> On the other hand, as said in [1], the logic of util_est's
>> enqueue/dequeue could be simplified.
>> So simplify it by aligning with the conditions of uclamp.
>>
>> [1]https://lore.kernel.org/all/CAB8ipk8pEvOtCm-d0o1rsekwxPWUHk9iBGtt9TLTWW-iWTQKiA@mail.gmail.com/
>>
>> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
>> ---
>>   kernel/sched/fair.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index c798d2795243..bebf40a0fa4e 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -6930,7 +6930,7 @@ enqueue_task_fair(struct rq *rq, struct
>> task_struct *p, int flags)
>>        * Let's add the task's estimated utilization to the cfs_rq's
>>        * estimated utilization, before we update schedutil.
>>        */
>> -    if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags &
>> ENQUEUE_RESTORE))))
>> +    if (!p->se.sched_delayed || (flags & ENQUEUE_DELAYED))
>>           util_est_enqueue(&rq->cfs, p);
>>         if (flags & ENQUEUE_DELAYED) {
>> @@ -7168,7 +7168,7 @@ static int dequeue_entities(struct rq *rq,
>> struct sched_entity *se, int flags)
>>    */
>>   static bool dequeue_task_fair(struct rq *rq, struct task_struct *p,
>> int flags)
>>   {
>> -    if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags &
>> DEQUEUE_SAVE))))
>> +    if (!p->se.sched_delayed)
>>           util_est_dequeue(&rq->cfs, p);
>>         util_est_update(&rq->cfs, p, flags & DEQUEUE_SLEEP);
>> @@ -8037,7 +8037,8 @@ cpu_util(int cpu, struct task_struct *p, int
>> dst_cpu, int boost)
>>            */
>>           if (dst_cpu == cpu)
>>               util_est += _task_util_est(p);
>> -        else if (p && unlikely(task_on_rq_queued(p) || current == p))
>> +        else if (p && unlikely(current == p ||
>> +             (task_on_rq_queued(p) && !p->se.sched_delayed)))
>>               lsub_positive(&util_est, _task_util_est(p));
>>             util = max(util, util_est);
> 
> Tested this patch on several workloads and added util_est warnings. No
> util_est overflow or underflow warnings were seen.
> 
> Tested-by: Hongyan Xia <hongyan.xia2@arm.com>

Just to make sure, does this 'Tested-by' also apply to the current v2
version of this patch?

https://lkml.kernel.org/r/20250325014733.18405-1-xuewen.yan@unisoc.com

In this case Xuewen should apply it on his next version.



