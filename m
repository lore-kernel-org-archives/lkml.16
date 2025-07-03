Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31A5291C37
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537667; cv=none; b=O2b5XKkXvxAYHD7dGicn9p32MfvArL5argtE8J2+4xnm3JI6n13HFd2impNX8vkN7aqfzqBHzDtm8dhIJlUIwlTNWEGtp3Tpj+2TqtyFblgjMWYSGSDoct1lW/GU43ZUPVqGiMv3lh+DweRaCDBXC4YAHGtJRYxMfkC7W+fx9zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537667; c=relaxed/simple;
	bh=1SyaE8X7sL1OoajKeDkoTMe0SoZJKBQj8Xqr0p5F82k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RoctH1TsOVjMSjGsqn1qqcMscx8SMCT4paJYyC+sx/wCNDQIWc0ZsiRwcmINrPuyRZgORRGeji8bI6dlhwgUqNMTchBM9OD+pPv4lXDGPfZW5Mur4cN6OOffXlIMT6VykCZU6YtAK/7gpcGWr+zDtydyRl0uGqmYY9xnIJhoJkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7a1103cc57f611f0b29709d653e92f7d-20250703
X-CID-CACHE: Type:Local,Time:202507031807+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:8d03a6f1-8376-4126-9f68-6b37c01e0ed3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:c5391f75d4344f6a4e0bf28554583991,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7a1103cc57f611f0b29709d653e92f7d-20250703
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1384937523; Thu, 03 Jul 2025 18:14:16 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id B5F79E008FA2;
	Thu,  3 Jul 2025 18:14:16 +0800 (CST)
X-ns-mid: postfix-686657F8-34930727
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id E1834E008FA1;
	Thu,  3 Jul 2025 18:14:14 +0800 (CST)
Message-ID: <eab45ccf-c9f5-4dff-bc36-40133783d369@kylinos.cn>
Date: Thu, 3 Jul 2025 18:14:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/uclamp: Exclude kernel threads from uclamp logic
To: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: xuewen.yan@unisoc.com, vincent.guittot@linaro.org, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 hongyan.xia2@arm.com, linux-kernel@vger.kernel.org, ke.wang@unisoc.com,
 di.shen@unisoc.com, kprateek.nayak@amd.com, kuyo.chang@mediatek.com,
 juju.sung@mediatek.com, qyousef@layalina.io
References: <20250703091437.79861-1-zhangzihuan@kylinos.cn>
 <CAB8ipk_MZ8j_HNtPL4zB3FXVKHMLxCkn_9ohGhhHqrx8xTRnYA@mail.gmail.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <CAB8ipk_MZ8j_HNtPL4zB3FXVKHMLxCkn_9ohGhhHqrx8xTRnYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Xuewen,

Thanks for your feedback =E2=80=94 that makes a lot of sense.

=E5=9C=A8 2025/7/3 17:42, Xuewen Yan =E5=86=99=E9=81=93:
> Hi zihuan,
>
> On Thu, Jul 3, 2025 at 5:15=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylino=
s.cn> wrote:
>> Kernel threads (PF_KTHREAD) are not subject to user-defined utilizatio=
n
>> clamping. They do not represent user workloads and should not particip=
ate
>> in any uclamp logic, including:
> Indeed, some driver would use set_scheduler() to set some kthread to
> improve performance.
> It is not a good idea to exclude it.
>
> Thanks=EF=BC=81
>
I agree that kernel threads may need explicit scheduling control, so=20
it=E2=80=99s indeed not a good idea to exclude them unconditionally.
Our main concern was that uclamp_rq_inc() is a performance-sensitive=20
path, and letting default-initialized kthreads participate in clamp=20
aggregation could lead to unnecessary overhead and distort frequency=20
decisions.

We=E2=80=99ll rework the patch to be more selective =E2=80=94 possibly sk=
ipping only=20
those kernel threads that don=E2=80=99t have user-defined clamp values.

Thanks again for the helpful input!
>>   - clamp initialization during fork/post-fork
>>   - effective clamp value computation
>>   - runtime aggregation (uclamp_rq_inc/dec)
>>
>> Allowing kernel threads into these paths may pollute the rq->uclamp[]
>> statistics, mislead schedutil governor's frequency selection, and
>> complicate debugging or trace interpretation.
>>
>> This patch ensures that:
>>   - uclamp_fork() and uclamp_post_fork() skip kernel threads
>>   - uclamp_eff_value() return default values
>>   - uclamp_rq_inc() and uclamp_rq_dec() skip kernel threads
>>
>> This aligns the semantics of uclamp with its original intent:
>> user-space task-specific clamping.
>>
>> dmesg in uclamp_rq_inc_id:
>> [   76.373903] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 va=
lue:0 kthread:1
>> [   76.375905] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 =
value:1024 kthread:1
>> [   76.379837] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 =
value:0 kthread:1
>> [   76.379839] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 =
value:1024 kthread:1
>> [   76.379839] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 va=
lue:0 kthread:1
>> [   76.379841] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 va=
lue:1024 kthread:1
>> [   76.383897] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 va=
lue:0 kthread:1
>> [   76.383897] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 =
value:0 kthread:1
>> [   76.383900] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 va=
lue:1024 kthread:1
>> [   76.383901] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 =
value:1024 kthread:1
>> [   76.387885] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 va=
lue:0 kthread:1
>> [   76.387885] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 =
value:0 kthread:1
>> [   76.387888] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 =
value:1024 kthread:1
>> [   76.387889] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 va=
lue:1024 kthread:1
>> [   76.388139] uclamp_rq_inc_id: task:jbd2/sda3-8 pid:316 clamp_id:0 v=
alue:0 kthread:1
>> [   76.388140] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 =
value:0 kthread:1
>> [   76.388142] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 =
value:1024 kthread:1
>> [   76.388143] uclamp_rq_inc_id: task:jbd2/sda3-8 pid:316 clamp_id:1 v=
alue:1024 kthread:1
>> [   76.388169] uclamp_rq_inc_id: task:kworker/u48:6 pid:93 clamp_id:0 =
value:0 kthread:1
>> [   76.388171] uclamp_rq_inc_id: task:kworker/u48:6 pid:93 clamp_id:1 =
value:1024 kthread:1
>> [   76.388891] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 va=
lue:0 kthread:1
>> [   76.388893] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 va=
lue:1024 kthread:1
>> [   76.392900] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 va=
lue:0 kthread:1
>> [   76.392902] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 va=
lue:1024 kthread:1
>> [   76.398850] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 =
value:0 kthread:1
>> [   76.398852] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 =
value:1024 kthread:1
>> [   76.401880] uclamp_rq_inc_id: task:ksoftirqd/8 pid:67 clamp_id:0 va=
lue:0 kthread:1
>> [   76.401883] uclamp_rq_inc_id: task:ksoftirqd/8 pid:67 clamp_id:1 va=
lue:1024 kthread:1
>> [   76.409053] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 =
value:0 kthread:1
>> [   76.409054] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 =
value:1024 kthread:1
>> [   76.410881] uclamp_rq_inc_id: task:kworker/u48:10 pid:97 clamp_id:0=
 value:0 kthread:1
>> [   76.410884] uclamp_rq_inc_id: task:kworker/u48:10 pid:97 clamp_id:1=
 value:1024 kthread:1
>> [   76.419947] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 =
value:0 kthread:1
>> [   76.419949] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 =
value:1024 kthread:1
>> [   76.419976] uclamp_rq_inc_id: task:kworker/u48:6 pid:93 clamp_id:0 =
value:0 kthread:1
>> [   76.419979] uclamp_rq_inc_id: task:kworker/u48:6 pid:93 clamp_id:1 =
value:1024 kthread:1
>> [   76.420119] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 =
value:0 kthread:1
>> [   76.420121] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 =
value:1024 kthread:1
>> [   76.420642] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 =
value:0 kthread:1
>> [   76.420644] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 =
value:1024 kthread:1
>> [   76.434914] uclamp_rq_inc_id: task:kcompactd0 pid:108 clamp_id:0 va=
lue:0 kthread:1
>> [   76.434916] uclamp_rq_inc_id: task:kcompactd0 pid:108 clamp_id:1 va=
lue:1024 kthread:1
>> [   76.447689] uclamp_rq_inc_id: task:kworker/3:2 pid:244 clamp_id:0 v=
alue:0 kthread:1
>> [   76.447691] uclamp_rq_inc_id: task:kworker/3:2 pid:244 clamp_id:1 v=
alue:1024 kthread:1
>> [   76.447705] uclamp_rq_inc_id: task:ksoftirqd/3 pid:37 clamp_id:0 va=
lue:0 kthread:1
>> [   76.447707] uclamp_rq_inc_id: task:ksoftirqd/3 pid:37 clamp_id:1 va=
lue:1024 kthread:1
>> [   76.448809] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 va=
lue:0 kthread:1
>> [   76.448811] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 va=
lue:1024 kthread:1
>> [   76.451260] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 =
value:0 kthread:1
>> [   76.451263] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 =
value:1024 kthread:1
>> [   76.452806] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 va=
lue:0 kthread:1
>> [   76.452808] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 va=
lue:1024 kthread:1
>> [   76.488052] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 =
value:0 kthread:1
>> [   76.488054] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 =
value:1024 kthread:1
>> [   76.488767] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 =
value:0 kthread:1
>> [   76.488770] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 =
value:1024 kthread:1
>> [   76.490847] uclamp_rq_inc_id: task:kworker/3:2 pid:244 clamp_id:0 v=
alue:0 kthread:1
>> [   76.490848] uclamp_rq_inc_id: task:kworker/2:1 pid:143 clamp_id:0 v=
alue:0 kthread:1
>> [   76.490849] uclamp_rq_inc_id: task:kworker/1:3 pid:462 clamp_id:0 v=
alue:0 kthread:1
>> [   76.490848] uclamp_rq_inc_id: task:kworker/7:2 pid:687 clamp_id:0 v=
alue:0 kthread:1
>> [   76.490849] uclamp_rq_inc_id: task:kworker/11:1 pid:146 clamp_id:0 =
value:0 kthread:1
>> [   76.490850] uclamp_rq_inc_id: task:kworker/2:1 pid:143 clamp_id:1 v=
alue:1024 kthread:1
>> [   76.490851] uclamp_rq_inc_id: task:kworker/3:2 pid:244 clamp_id:1 v=
alue:1024 kthread:1
>> [   76.490851] uclamp_rq_inc_id: task:kworker/11:1 pid:146 clamp_id:1 =
value:1024 kthread:1
>> [   76.490851] uclamp_rq_inc_id: task:kworker/7:2 pid:687 clamp_id:1 v=
alue:1024 kthread:1
>> [   76.490853] uclamp_rq_inc_id: task:kworker/1:3 pid:462 clamp_id:1 v=
alue:1024 kthread:1
>> [   76.490857] uclamp_rq_inc_id: task:kworker/5:1 pid:141 clamp_id:0 v=
alue:0 kthread:1
>> [   76.490859] uclamp_rq_inc_id: task:kworker/5:1 pid:141 clamp_id:1 v=
alue:1024 kthread:1
>> [   76.491850] uclamp_rq_inc_id: task:kworker/4:2 pid:534 clamp_id:0 v=
alue:0 kthread:1
>> [   76.491852] uclamp_rq_inc_id: task:kworker/4:2 pid:534 clamp_id:1 v=
alue:1024 kthread:1
>> [   76.504848] uclamp_rq_inc_id: task:kworker/10:2 pid:228 clamp_id:0 =
value:0 kthread:1
>> [   76.504852] uclamp_rq_inc_id: task:kworker/10:2 pid:228 clamp_id:1 =
value:1024 kthread:1
>> [   76.508785] uclamp_rq_inc_id: task:kworker/9:1 pid:142 clamp_id:0 v=
alue:0 kthread:1
>> [   76.508787] uclamp_rq_inc_id: task:kworker/9:1 pid:142 clamp_id:1 v=
alue:1024 kthread:1
>> [   76.514856] uclamp_rq_inc_id: task:kworker/u48:10 pid:97 clamp_id:0=
 value:0 kthread:1
>> [   76.514859] uclamp_rq_inc_id: task:kworker/u48:10 pid:97 clamp_id:1=
 value:1024 kthread:1
>> [   76.522742] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 =
value:0 kthread:1
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   kernel/sched/core.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 8988d38d46a3..a1e6b4157682 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -1630,6 +1630,9 @@ unsigned long uclamp_eff_value(struct task_struc=
t *p, enum uclamp_id clamp_id)
>>   {
>>          struct uclamp_se uc_eff;
>>
>> +       if (p->flags & PF_KTHREAD)
>> +               return uclamp_none(clamp_id);
>> +
>>          /* Task currently refcounted: use back-annotated (effective) =
value */
>>          if (p->uclamp[clamp_id].active)
>>                  return (unsigned long)p->uclamp[clamp_id].value;
>> @@ -1769,6 +1772,9 @@ static inline void uclamp_rq_inc(struct rq *rq, =
struct task_struct *p, int flags
>>          if (unlikely(!p->sched_class->uclamp_enabled))
>>                  return;
>>
>> +       if (p->flags & PF_KTHREAD)
>> +               return;
>> +
>>          /* Only inc the delayed task which being woken up. */
>>          if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
>>                  return;
>> @@ -1797,6 +1803,9 @@ static inline void uclamp_rq_dec(struct rq *rq, =
struct task_struct *p)
>>          if (unlikely(!p->sched_class->uclamp_enabled))
>>                  return;
>>
>> +       if (p->flags & PF_KTHREAD)
>> +               return;
>> +
>>          if (p->se.sched_delayed)
>>                  return;
>>
>> @@ -1977,6 +1986,8 @@ static void uclamp_fork(struct task_struct *p)
>>   {
>>          enum uclamp_id clamp_id;
>>
>> +       if (p->flags & PF_KTHREAD)
>> +               return;
>>          /*
>>           * We don't need to hold task_rq_lock() when updating p->ucla=
mp_* here
>>           * as the task is still at its early fork stages.
>> @@ -1995,6 +2006,8 @@ static void uclamp_fork(struct task_struct *p)
>>
>>   static void uclamp_post_fork(struct task_struct *p)
>>   {
>> +       if (p->flags & PF_KTHREAD)
>> +               return;
>>          uclamp_update_util_min_rt_default(p);
>>   }
>>
>> --
>> 2.25.1
>>
>>
Best regards,
Zihuan

