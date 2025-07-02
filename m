Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA9C8F0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 00:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751417336; cv=none; b=Ag8oaDLRgLccNlfRIa28Z8K7TJ3acWHMJXul7GxMNHEwU4+FqGqyzTojNu938X34f5V34O+rxievZtOJbBUKaXAqXaYpGzn4ziMMdfyJjWEMB57rTGQMSOxSX0K21MfDaVJ11oae1KR9L6EzeQYl9OUL3RGZQtmL1SKtoipjqLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751417336; c=relaxed/simple;
	bh=6kuAXrVwlWCUlWktA6cZXoWDEMds+HqiJZnKgyNEx2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oYGHSSUWuiECwVA9HOCTG+tJZ1Mycjqeh3hy3EOqkR8uAnligzXDUgNW5H/b9orYxHVR11RbQboBeBP8DBCJPRGckALNhlOXD6hFbaJdFPlb4hmI3+NP+jX7Cn0hYMmXOIvQ4npW/qERVb06mKAw7MGe4xrxmU2F/3Av81rStS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4fcccaf656de11f0b29709d653e92f7d-20250702
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ae49145e-63ed-4ef1-91c0-b2eb22744e76,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:d4f5b0115cd3846af30a0c658f968e18,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4fcccaf656de11f0b29709d653e92f7d-20250702
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 858647554; Wed, 02 Jul 2025 08:48:47 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id B411AE008FA2;
	Wed,  2 Jul 2025 08:48:46 +0800 (CST)
X-ns-mid: postfix-686481EE-6301662
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 84A2EE008FA1;
	Wed,  2 Jul 2025 08:48:42 +0800 (CST)
Message-ID: <40d9ebed-1090-4772-a83a-18a12f35ecc0@kylinos.cn>
Date: Wed, 2 Jul 2025 08:48:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/uclamp: Skip uclamp_rq_dec() for non-final
 dequeue of delayed tasks
To: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: xuewen.yan@unisoc.com, vincent.guittot@linaro.org, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 hongyan.xia2@arm.com, linux-kernel@vger.kernel.org, ke.wang@unisoc.com,
 di.shen@unisoc.com, kprateek.nayak@amd.com, kuyo.chang@mediatek.com,
 juju.sung@mediatek.com, qyousef@layalina.io
References: <20250701093407.211500-1-zhangzihuan@kylinos.cn>
 <CAB8ipk-6=jZt5LZ9q9ehCE2PhhrBz4xV7BSLiqUda7=arm2rDQ@mail.gmail.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <CAB8ipk-6=jZt5LZ9q9ehCE2PhhrBz4xV7BSLiqUda7=arm2rDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Xuewen,

=E5=9C=A8 2025/7/1 18:49, Xuewen Yan =E5=86=99=E9=81=93:
> Hi zihuan,
>
> On Tue, Jul 1, 2025 at 5:34=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylino=
s.cn> wrote:
>> Currently, uclamp_rq_inc() skips updating the clamp aggregation for
>> delayed tasks unless ENQUEUE_DELAYED is set, to ensure we only track t=
he
>> real enqueue of a task that was previously marked as sched_delayed.
>>
>> However, the corresponding uclamp_rq_dec() path only checks
>> sched_delayed, and misses the DEQUEUE_DELAYED flag. As a result, we ma=
y
>> skip dec for a delayed task that is now being truly dequeued, leading =
to
>> uclamp aggregation mismatch.
>>
>> This patch makes uclamp_rq_dec() consistent with uclamp_rq_inc() by
>> checking both sched_delayed and DEQUEUE_DELAYED, ensuring correct
>> accounting symmetry.
>>
>> Fixes: 90ca9410dab2 ("sched/uclamp: Align uclamp and util_est and call=
 before freq update")
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   kernel/sched/core.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 8988d38d46a3..99f1542cff7d 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -1781,7 +1781,7 @@ static inline void uclamp_rq_inc(struct rq *rq, =
struct task_struct *p, int flags
>>                  rq->uclamp_flags &=3D ~UCLAMP_FLAG_IDLE;
>>   }
>>
>> -static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p=
)
>> +static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p=
, int flags)
>>   {
>>          enum uclamp_id clamp_id;
>>
>> @@ -1797,7 +1797,8 @@ static inline void uclamp_rq_dec(struct rq *rq, =
struct task_struct *p)
>>          if (unlikely(!p->sched_class->uclamp_enabled))
>>                  return;
>>
>> -       if (p->se.sched_delayed)
>> +       /* Skip dec if this is a delayed task not being truly dequeued=
 */
>> +       if (p->se.sched_delayed && !(flags & DEQUEUE_DELAYED))
>>                  return;
> Consider the __sched_setscheduler()=EF=BC=8Cwhen changing the delayed-t=
ask's
> sched-class=EF=BC=8Cyour patch would dec the uclamp twice.

Thanks for your clarification. I=E2=80=99ve understood that the kernel=20
unconditionally decrements the uclamp counter when dequeuing a task,

regardless of whether it=E2=80=99s currently enqueued. That makes sense.

Appreciate your time and explanation!
> BR
> ---
> xuewen
>
>>          for_each_clamp_id(clamp_id)
>> @@ -2039,7 +2040,7 @@ static void __init init_uclamp(void)
>>
>>   #else /* !CONFIG_UCLAMP_TASK */
>>   static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *=
p, int flags) { }
>> -static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p=
) { }
>> +static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p=
, int flags) { }
>>   static inline void uclamp_fork(struct task_struct *p) { }
>>   static inline void uclamp_post_fork(struct task_struct *p) { }
>>   static inline void init_uclamp(void) { }
>> @@ -2112,7 +2113,7 @@ inline bool dequeue_task(struct rq *rq, struct t=
ask_struct *p, int flags)
>>           * Must be before ->dequeue_task() because ->dequeue_task() c=
an 'fail'
>>           * and mark the task ->sched_delayed.
>>           */
>> -       uclamp_rq_dec(rq, p);
>> +       uclamp_rq_dec(rq, p, flags);
>>          return p->sched_class->dequeue_task(rq, p, flags);
>>   }
>>
>> --
>> 2.25.1
>>
Best regards,
Zihuan

