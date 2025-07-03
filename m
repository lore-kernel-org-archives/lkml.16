Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27862E4991
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545376; cv=none; b=or6uR+pczLVFQ8sm1kSrtFhLWI/7wEth7uCRjE/jGqHB0XpuAt5+GSbXfUbHSuJWclWCBmTKWSEfvWUuFafXLv1uUcsGLCObP1yEmlyBu8wKj6VDT4I/WxD/UqISsSLsqgJ4yiHLuJKFXXBCY36rgVPpfz482GbbA1i2ACj3ej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545376; c=relaxed/simple;
	bh=QB60aKZBUzAZ0FQBYE9g+hOl1EwxMnVpB9qG/o8gJGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3SbLqnqWhA9gJsKO5frM6WgK0zv0Kg5G0er+D0M3gnm+ADs7hvXIr4POhSRf0k/MYP5IdtZJC2IQkgcfWU/on4fo9VfjFsuHiGdksotFL8lRx+3CbOTqexNvPyjRs+qGOOjXfu2W9HETPm+WOFFUdMj68mUIyB4K7lZki0XaTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96B4C1596;
	Thu,  3 Jul 2025 05:22:38 -0700 (PDT)
Received: from [10.1.37.73] (e127648.arm.com [10.1.37.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21B833F6A8;
	Thu,  3 Jul 2025 05:22:48 -0700 (PDT)
Message-ID: <5abb0870-2fd0-44bd-8abc-410d77cddfb7@arm.com>
Date: Thu, 3 Jul 2025 13:22:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/uclamp: Skip uclamp_rq_dec() for non-final
 dequeue of delayed tasks
To: Zihuan Zhang <zhangzihuan@kylinos.cn>,
 K Prateek Nayak <kprateek.nayak@amd.com>, xuewen.yan@unisoc.com,
 vincent.guittot@linaro.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com
Cc: rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, hongyan.xia2@arm.com, linux-kernel@vger.kernel.org,
 ke.wang@unisoc.com, di.shen@unisoc.com, xuewen.yan94@gmail.com,
 kuyo.chang@mediatek.com, juju.sung@mediatek.com, qyousef@layalina.io
References: <20250701093407.211500-1-zhangzihuan@kylinos.cn>
 <3882929e-d4a1-48b3-b518-1582e6e1c872@amd.com>
 <0396755a-58be-4f7d-99f9-6b63d35e6e65@kylinos.cn>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <0396755a-58be-4f7d-99f9-6b63d35e6e65@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/2/25 01:53, Zihuan Zhang wrote:
> Hi Prateek,
> 
> 在 2025/7/1 19:00, K Prateek Nayak 写道:
>> Hello Zihuan Zhang,
>>
>> On 7/1/2025 3:04 PM, Zihuan Zhang wrote:
>>> Currently, uclamp_rq_inc() skips updating the clamp aggregation for
>>> delayed tasks unless ENQUEUE_DELAYED is set, to ensure we only track the
>>> real enqueue of a task that was previously marked as sched_delayed.
>>>
>>> However, the corresponding uclamp_rq_dec() path only checks
>>> sched_delayed, and misses the DEQUEUE_DELAYED flag. As a result, we may
>>> skip dec for a delayed task that is now being truly dequeued, leading to
>>> uclamp aggregation mismatch.
>>>
>>> This patch makes uclamp_rq_dec() consistent with uclamp_rq_inc() by
>>> checking both sched_delayed and DEQUEUE_DELAYED, ensuring correct
>>> accounting symmetry.
>>>
>>> Fixes: 90ca9410dab2 ("sched/uclamp: Align uclamp and util_est and call before freq update")
>>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>>> ---
>>>   kernel/sched/core.c | 9 +++++----
>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>> index 8988d38d46a3..99f1542cff7d 100644
>>> --- a/kernel/sched/core.c
>>> +++ b/kernel/sched/core.c
>>> @@ -1781,7 +1781,7 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
>>>           rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
>>>   }
>>>   -static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
>>> +static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p, int flags)
>>>   {
>>>       enum uclamp_id clamp_id;
>>>   @@ -1797,7 +1797,8 @@ static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
>>>       if (unlikely(!p->sched_class->uclamp_enabled))
>>>           return;
>>>   -    if (p->se.sched_delayed)
>>> +    /* Skip dec if this is a delayed task not being truly dequeued */
>>> +    if (p->se.sched_delayed && !(flags & DEQUEUE_DELAYED))
>>>           return;
>>
>> Consider the following case:
>>
>> - p is a fair task with uclamp constraints set.
>>
>>
>> - P blocks and dequeue_task() calls uclamp_rq_dec() and later
>>   p->sched_class->dequeue_task() sets "p->se.sched_delayed" to 1.
>>
>>   uclamp_rq_dec() is called for the first time here and has already
>>   decremented the clamp_id from the hierarchy.
>>
>>
>> - Before P can be completely dequeued, P is moved to an RT class
>>   with p->se.sched_delayed still set to 1 which invokes the following
>>   call-chain:
>>     __sched_setscheduler() {
>>     dequeue_task(DEQUEUE_DELAYED) {
>>       uclamp_rq_dec() {
>>         if (p->se.sched_delayed && !(flags & DEQUEUE_DELAYED)) /* false */
>>           return;
>>
>>         /* !! Decrements clamp_id again !! */
>>       }
>>       /* Dequeues from fair class */
>>     }
>>     /* Enqueues onto the RT class */
>>   }
>>
>>
>> From my reading, the current code is correct and the special handling in
>> uclamp_rq_inc() is required because enqueue_task() does a
>> uclamp_rq_inc() first before calling p->sched_class->enqueue_task()
>> which will clear "p->se.sched_delayed" if ENQUEUE_DELAYED is set.
>>
>> dequeue_task() already does a uclamp_rq_dec() before task is delayed and
>> any further dequeue of a delayed task should not decrement the
>> uclamp_id.
>>
>> Please let me know if I've missed something.
>>

Thank you Prateek for the detailed explanation, I've stresstested the entire
uclamp delayed dequeue path the last couple days and I also couldn't trigger
any imbalance FWIW.

