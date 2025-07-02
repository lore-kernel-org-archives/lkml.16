Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF69286A1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 00:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751417620; cv=none; b=WnmszsrUP2xgTWCzoR8B+0HjPN5SdJIRA/XLGvEY0gUTPUFtkEcMjrt3MO1sgh+uj2cYug+gp54H6ouCVJ9cKolNg1m0W7tnXd1kPBc5wpqmKyj2E2u3iiwvprvQ/sAwDwZe+4VpKCF1WEiwDVL09XqeWVX2MgMnVvkw9b2nd+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751417620; c=relaxed/simple;
	bh=Z/Ywx4EWHtnh78HCX130icrKNZ3s6LoK9EIR8fLau20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEhD51+zRt37hXWO0e78/5Yhq5nTugXgx6MJNOVawbtn75h9NjUsmxqqguKeeD+mSo/7QumHI26L0ESacuO0Ptldw7lR5CrZflrzw0R/0jnirgL6JkZ3EAT8GDwJOA2iDj7HhO101sFxJLtqzc/uRqVP/iL8m3uIx90F/BdRYlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f79066a856de11f0b29709d653e92f7d-20250702
X-CID-CACHE: Type:Local,Time:202507020848+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:d20cc16e-efb1-4a78-b20a-0108e9b34018,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:d4f5b0115cd3846af30a0c658f968e18,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f79066a856de11f0b29709d653e92f7d-20250702
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1290868660; Wed, 02 Jul 2025 08:53:28 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 38D73E008FA2;
	Wed,  2 Jul 2025 08:53:28 +0800 (CST)
X-ns-mid: postfix-68648308-1177937
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 552CAE008FA1;
	Wed,  2 Jul 2025 08:53:26 +0800 (CST)
Message-ID: <0396755a-58be-4f7d-99f9-6b63d35e6e65@kylinos.cn>
Date: Wed, 2 Jul 2025 08:53:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/uclamp: Skip uclamp_rq_dec() for non-final
 dequeue of delayed tasks
To: K Prateek Nayak <kprateek.nayak@amd.com>, xuewen.yan@unisoc.com,
 vincent.guittot@linaro.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com
Cc: rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, hongyan.xia2@arm.com, linux-kernel@vger.kernel.org,
 ke.wang@unisoc.com, di.shen@unisoc.com, xuewen.yan94@gmail.com,
 kuyo.chang@mediatek.com, juju.sung@mediatek.com, qyousef@layalina.io
References: <20250701093407.211500-1-zhangzihuan@kylinos.cn>
 <3882929e-d4a1-48b3-b518-1582e6e1c872@amd.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <3882929e-d4a1-48b3-b518-1582e6e1c872@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Prateek,

=E5=9C=A8 2025/7/1 19:00, K Prateek Nayak =E5=86=99=E9=81=93:
> Hello Zihuan Zhang,
>
> On 7/1/2025 3:04 PM, Zihuan Zhang wrote:
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
>> Fixes: 90ca9410dab2 ("sched/uclamp: Align uclamp and util_est and=20
>> call before freq update")
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>> =C2=A0 kernel/sched/core.c | 9 +++++----
>> =C2=A0 1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 8988d38d46a3..99f1542cff7d 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -1781,7 +1781,7 @@ static inline void uclamp_rq_inc(struct rq *rq,=20
>> struct task_struct *p, int flags
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rq->uclamp_flag=
s &=3D ~UCLAMP_FLAG_IDLE;
>> =C2=A0 }
>> =C2=A0 -static inline void uclamp_rq_dec(struct rq *rq, struct task_st=
ruct=20
>> *p)
>> +static inline void uclamp_rq_dec(struct rq *rq, struct task_struct=20
>> *p, int flags)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum uclamp_id clamp_id;
>> =C2=A0 @@ -1797,7 +1797,8 @@ static inline void uclamp_rq_dec(struct r=
q=20
>> *rq, struct task_struct *p)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(!p->sched_class->uclamp_en=
abled))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (p->se.sched_delayed)
>> +=C2=A0=C2=A0=C2=A0 /* Skip dec if this is a delayed task not being tr=
uly dequeued */
>> +=C2=A0=C2=A0=C2=A0 if (p->se.sched_delayed && !(flags & DEQUEUE_DELAY=
ED))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>
> Consider the following case:
>
> - p is a fair task with uclamp constraints set.
>
>
> - P blocks and dequeue_task() calls uclamp_rq_dec() and later
> =C2=A0 p->sched_class->dequeue_task() sets "p->se.sched_delayed" to 1.
>
> =C2=A0 uclamp_rq_dec() is called for the first time here and has alread=
y
> =C2=A0 decremented the clamp_id from the hierarchy.
>
>
> - Before P can be completely dequeued, P is moved to an RT class
> =C2=A0 with p->se.sched_delayed still set to 1 which invokes the follow=
ing
> =C2=A0 call-chain:
> =C2=A0 =C2=A0 __sched_setscheduler() {
> =C2=A0=C2=A0=C2=A0 dequeue_task(DEQUEUE_DELAYED) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uclamp_rq_dec() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p->se.sched_delayed && !=
(flags & DEQUEUE_DELAYED)) /*=20
> false */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* !! Decrements clamp_id ag=
ain !! */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Dequeues from fair class */
> =C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 /* Enqueues onto the RT class */
> =C2=A0 }
>
>
> From my reading, the current code is correct and the special handling i=
n
> uclamp_rq_inc() is required because enqueue_task() does a
> uclamp_rq_inc() first before calling p->sched_class->enqueue_task()
> which will clear "p->se.sched_delayed" if ENQUEUE_DELAYED is set.
>
> dequeue_task() already does a uclamp_rq_dec() before task is delayed an=
d
> any further dequeue of a delayed task should not decrement the
> uclamp_id.
>
> Please let me know if I've missed something.
>

Thanks a lot for the detailed explanation!
You're absolutely right =E2=80=94 uclamp_rq_dec() is unconditionally call=
ed at=20
the top of dequeue_task(), and any further delayed dequeues should not=20
trigger an additional dec.
I now understand the subtle but important difference between the enqueue=20
and dequeue paths.
As a follow-up question: would it make sense to defensively guard=20
uclamp_rq_dec() with something like:
if (!task_on_rq_queued(p))
return;
I understand this is not required with the current call structure, but I=20
wonder whether such a check would be reasonable to prevent accidental=20
double-dec in case of future changes or obscure paths.
Or would this be considered unnecessary runtime overhead and better=20
caught by path analysis?
Looking forward to your thoughts.
Thanks again for the insightful review!

>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_clamp_id(clamp_id)
>> @@ -2039,7 +2040,7 @@ static void __init init_uclamp(void)
>> =C2=A0 =C2=A0 #else /* !CONFIG_UCLAMP_TASK */
>> =C2=A0 static inline void uclamp_rq_inc(struct rq *rq, struct task_str=
uct=20
>> *p, int flags) { }
>> -static inline void uclamp_rq_dec(struct rq *rq, struct task_struct=20
>> *p) { }
>> +static inline void uclamp_rq_dec(struct rq *rq, struct task_struct=20
>> *p, int flags) { }
>> =C2=A0 static inline void uclamp_fork(struct task_struct *p) { }
>> =C2=A0 static inline void uclamp_post_fork(struct task_struct *p) { }
>> =C2=A0 static inline void init_uclamp(void) { }
>> @@ -2112,7 +2113,7 @@ inline bool dequeue_task(struct rq *rq, struct=20
>> task_struct *p, int flags)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Must be before ->dequeue_task()=
 because ->dequeue_task() can=20
>> 'fail'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * and mark the task ->sched_delay=
ed.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0 uclamp_rq_dec(rq, p);
>> +=C2=A0=C2=A0=C2=A0 uclamp_rq_dec(rq, p, flags);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return p->sched_class->dequeue_task(rq,=
 p, flags);
>> =C2=A0 }
>

Best regards,
Zihuan

