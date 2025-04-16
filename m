Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A48D946F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744841562; cv=none; b=s7FiYSioOmelmvXxM4nNxDOBkRnwrjEzo0TLl1RccOA0hp93hF5EtQv9W880dWurgIrtnphsVYLmx89wDdy1OmZOkHjkuU+dqjv7jWWYI2c/llsaTFO0r1bNk8WOVX+kDz33OK6A0+vRKY6NqvPQ7JVIIGlv1Nk6dGNhiOMj5+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744841562; c=relaxed/simple;
	bh=+djmq/65MXaFk74ZdFkRIEnNr7KrEi62o3NkXvf2dIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9biq5wH3Y4XOeIyKNWUDEEVln8qewnIJ5vaDEvKv3gFgxLzU0nuoWCB+6D/R7xQ/fZnpF6V07SLpZimRJ2QcxxP04yZ8JjADTLLlkou0wzbNeUf/p8Uehe7nhVz4lz4Ylu8UHRgNghHiZRTRKjmIZ+3WPcfTiraxRBWhpcm6xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6CCF1595;
	Wed, 16 Apr 2025 15:12:29 -0700 (PDT)
Received: from [192.168.178.115] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEF873F66E;
	Wed, 16 Apr 2025 15:12:28 -0700 (PDT)
Message-ID: <acef778c-a359-484d-a61d-aeca81bdae1d@arm.com>
Date: Thu, 17 Apr 2025 00:12:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched/uclamp: Align uclamp and util_est and call
 before freq update
To: Vincent Guittot <vincent.guittot@linaro.org>,
 Xuewen Yan <xuewen.yan94@gmail.com>
Cc: Xuewen Yan <xuewen.yan@unisoc.com>, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 hongyan.xia2@arm.com, qyousef@layalina.io, ke.wang@unisoc.com,
 di.shen@unisoc.com, linux-kernel@vger.kernel.org
References: <20250325014733.18405-1-xuewen.yan@unisoc.com>
 <CAKfTPtA06D1EGg2VdVHt-P0PDE-1XZVJOp3myZPSNknnFT3nNg@mail.gmail.com>
 <CAB8ipk_uOKn+U0ozZyaQ8J9OjifoZWSh-9NUQ9UD+K-kLV28vw@mail.gmail.com>
 <CAKfTPtD2T8Qm-6Nq-9qODQASoU9Wn1Ujk4uQbbN1Dvo3+EFZFA@mail.gmail.com>
 <CAB8ipk-G_Q20Cyx69GRY5pdTj9C4SyVyiuRVFi-i-otQ1zBVFg@mail.gmail.com>
 <CAKfTPtC2XA_DUy5zjPo4Xr1r7W-CFiZEwabEQcZPk0FDLxc3QQ@mail.gmail.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <CAKfTPtC2XA_DUy5zjPo4Xr1r7W-CFiZEwabEQcZPk0FDLxc3QQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/04/2025 14:19, Vincent Guittot wrote:
> On Wed, 16 Apr 2025 at 13:07, Xuewen Yan <xuewen.yan94@gmail.com> wrote:
>>
>> On Wed, Apr 16, 2025 at 5:42 PM Vincent Guittot
>> <vincent.guittot@linaro.org> wrote:
>>>
>>> On Wed, 16 Apr 2025 at 04:55, Xuewen Yan <xuewen.yan94@gmail.com> wrote:
>>>>
>>>> On Wed, Apr 16, 2025 at 1:05 AM Vincent Guittot
>>>> <vincent.guittot@linaro.org> wrote:
>>>>>
>>>>> On Tue, 25 Mar 2025 at 02:48, Xuewen Yan <xuewen.yan@unisoc.com> wrote:

[...]

>>> Why is testing sched_delayed enough for migrating/prio_change ?
>>> With your change, we will remove then add back util_est when changing
>>> prio of the task which is useless
>>
>> I sincerely apologize for any misunderstanding my previous description
>> may have caused.
>> When changing prio without changing class, the delayed_task's
>> sched_delayed flag is not changed,
>> we would not remove then add back util_est.
>> If the class was changed：
>>
>> if (prev_class != next_class && p->se.sched_delayed)
>>                  dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED |
>> DEQUEUE_NOCLOCK);
>>
>> It will dequeue the delayed-task first, and will not enqueue it.
>>
>> As for normal tasks which are not delayed, indeed, the issue you
>> mentioned can occur, but it seems that this problem has always
>> existed. Perhaps this is a new issue that has come up.
> 
> I have been confused by the patch that added  the condition "if
> (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags &
> ENQUEUE_RESTORE))))". I wrongly thought it was for
> dequeue_save/enqueue_restore

No, this was just for sched_delayed. I convinced myself that the
logic stays the same with the following tests:

-->8--

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index eb5a2572b4f8..65692938696f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6930,6 +6930,19 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
        int rq_h_nr_queued = rq->cfs.h_nr_queued;
        u64 slice = 0;
 
+       bool D = !!p->se.sched_delayed;
+       bool M = task_on_rq_migrating(p);
+       bool Er = !!(flags & ENQUEUE_RESTORE);
+       bool Ed = !!(flags & ENQUEUE_DELAYED);
+
+       /* won't be called */
+       BUG_ON(D && M && Er);                           // [1]
+       BUG_ON(!D && M && Er);                          // [2]
+
+       BUG_ON(D && ((M || Er) == Ed));                 // [3]
+       BUG_ON(!(D && (M || Er)) != (!D || Ed));        // [4]
+       BUG_ON(!(D && (M || Er)) != (!(D && !Ed)));
+
        /*
         * The code below (indirectly) updates schedutil which looks at
         * the cfs_rq utilization to select a frequency.
@@ -7178,6 +7191,17 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
  */
 static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 {
+       bool D = !!p->se.sched_delayed;
+       bool M = task_on_rq_migrating(p);
+       bool Ds = !!(flags & DEQUEUE_SAVE);
+
+       /* won't be called */
+       BUG_ON(D && M && Ds);                           // [5]
+       BUG_ON(!D && M && Ds);                          // [6]
+       BUG_ON(D && !M && !Ds);                         // [7]
+
+       BUG_ON(!(D && (M || Ds)) != !D);                // [8]
+
        if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & DEQUEUE_SAVE))))
                util_est_dequeue(&rq->cfs, p);

-->8--

In enqueue, when D is true, M or Er is never set with Ed. [3], [4].
In dequeue, since [7] is never true, [8] is never true as well.

> Could you please split this in 2 patches :
> patch 1 updates condition for util_est_dequeue/enqueue  and a
> description why it's safe
> patch 2 for aligning uclamp with util_est

+1

[...]
