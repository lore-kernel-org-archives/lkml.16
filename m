Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FF621CC61
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785550; cv=none; b=rKwSCqWqe3JXojqmicSrSKPELoG5rQb9hMhTaMWv4rffESkCLTtJ4eJApLJnjNJHxarfQO4FqAPFvBFRas6yRB9CIQ6UGhuSu+zjMPhJjgPct4Pl5AsBzRe3E/D/X0D9uzkWoeRFvyC5AtSBE/koXGDkM71rBXTTYKk6klZZObk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785550; c=relaxed/simple;
	bh=dmJfaFWKGBZehIwKosAvF/Na3B9Ce89SGJJRuZa0qQA=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UWdyHiKIaumW4DeB+NFe7cE1ZvV6CKzmbXdGxIxCGXEkpxV+TcqrZb18ReA0o322YoggHdXcohEG6snZ3o/Ad4FOMiUmB8Jbvz56FsByLtYkJjKA2TQBVzpfL5OEic1/7geMrWIqzku/77j4xj5MUc+KcDFUwgGe4usTzI7eIfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iEiMZ2dL; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iEiMZ2dL"
X-UUID: 787eea161a8d11f0aae1fd9735fae912-20250416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=/wp8dqIWmKwm0eesBWIANDjshHHWRLpZ66OZDRw7OOI=;
	b=iEiMZ2dLa1+gsh9C9MmIVpXb0wDrH+jYXntqyjV5y21LoBwrpxtn91S1Qswv+7uKLET1n7LvWn34HFD/qPbuTZzbtA8RfPPieUkkOo9nYfSh0dHO+AMR23i7T0VhaiRn42Gm8WpoGXyxsjVE+iXy2mUtj3OLKsQQz7YzgkLxe68=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:00f60b07-e8b0-4d26-8a08-3c75e51f0a3d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:33fd4e8b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 787eea161a8d11f0aae1fd9735fae912-20250416
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 985112823; Wed, 16 Apr 2025 14:38:56 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 16 Apr 2025 14:38:55 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Wed, 16 Apr 2025 14:38:55 +0800
Message-ID: <813901445537b9a2fed9854ca8f91b46d3845346.camel@mediatek.com>
Subject: Re: [PATCH v2] sched/uclamp: Align uclamp and util_est and call
 before freq update
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Xuewen Yan <xuewen.yan@unisoc.com>, <dietmar.eggemann@arm.com>,
	<mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>
CC: <rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <hongyan.xia2@arm.com>, <qyousef@layalina.io>,
	<ke.wang@unisoc.com>, <di.shen@unisoc.com>, <linux-kernel@vger.kernel.org>,
	<xuewen.yan94@gmail.com>, =?UTF-8?Q?=E5=BB=BA=E5=9D=87_=E5=AE=8B?=
	<juju.sung@mediatek.com>
Date: Wed, 16 Apr 2025 14:38:54 +0800
In-Reply-To: <20250325014733.18405-1-xuewen.yan@unisoc.com>
References: <20250325014733.18405-1-xuewen.yan@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-03-25 at 09:47 +0800, Xuewen Yan wrote:
> When task's uclamp is set, we hope that the CPU frequency
> can increase as quickly as possible when the task is enqueued.
> Because the cpu frequency updating happens during the enqueue_task(),
> so the rq's uclamp needs to be updated before the task is enqueued,
> just like util_est.
> So, aline the uclamp and util_est and call before freq update.
>=20
> For sched-delayed tasks, the rq uclamp/util_est should only be
> updated
> when they are enqueued upon being awakened.
> So simply the logic of util_est's enqueue/dequeue check.
>=20
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> ---
> v2:
> - simply the util-est's en/dequeue check;
> ---
> Previous discussion:
> https://lore.kernel.org/all/CAB8ipk8pEvOtCm-d0o1rsekwxPWUHk9iBGtt9TLTWW-i=
WTQKiA@mail.gmail.com/
> https://lore.kernel.org/all/84441660bef0a5e67fd09dc3787178d0276dad31.1740=
664400.git.hongyan.xia2@arm.com/T/#u
> https://lore.kernel.org/all/CAB8ipk9LpbiUDnbcV6+59+Sa=3DAi7tFzO=3D=3D=3Dm=
pLD3obNdV4=3DJ-A@mail.gmail.com/T/#u
> https://lore.kernel.org/all/aa8baf67-a8ec-4ad8-a6a8-afdcd7036771@arm.com/
> ---
> =C2=A0kernel/sched/core.c | 17 ++++++++++-------
> =C2=A0kernel/sched/fair.c |=C2=A0 4 ++--
> =C2=A02 files changed, 12 insertions(+), 9 deletions(-)
>=20
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 042351c7afce..72fbe2031e54 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1747,7 +1747,7 @@ static inline void uclamp_rq_dec_id(struct rq
> *rq, struct task_struct *p,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct
> *p)
> +static inline void uclamp_rq_inc(struct rq *rq, struct task_struct
> *p, int flags)
> =C2=A0{
> =C2=A0	enum uclamp_id clamp_id;
> =C2=A0
> @@ -1763,7 +1763,8 @@ static inline void uclamp_rq_inc(struct rq *rq,
> struct task_struct *p)
> =C2=A0	if (unlikely(!p->sched_class->uclamp_enabled))
> =C2=A0		return;
> =C2=A0
> -	if (p->se.sched_delayed)
> +	/* Only inc the delayed task which being woken up. */
> +	if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
> =C2=A0		return;
> =C2=A0
> =C2=A0	for_each_clamp_id(clamp_id)
> @@ -2031,7 +2032,7 @@ static void __init init_uclamp(void)
> =C2=A0}
> =C2=A0
> =C2=A0#else /* !CONFIG_UCLAMP_TASK */
> -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct
> *p) { }
> +static inline void uclamp_rq_inc(struct rq *rq, struct task_struct
> *p, int flags) { }
> =C2=A0static inline void uclamp_rq_dec(struct rq *rq, struct task_struct
> *p) { }
> =C2=A0static inline void uclamp_fork(struct task_struct *p) { }
> =C2=A0static inline void uclamp_post_fork(struct task_struct *p) { }
> @@ -2067,12 +2068,14 @@ void enqueue_task(struct rq *rq, struct
> task_struct *p, int flags)
> =C2=A0	if (!(flags & ENQUEUE_NOCLOCK))
> =C2=A0		update_rq_clock(rq);
> =C2=A0
> -	p->sched_class->enqueue_task(rq, p, flags);
> =C2=A0	/*
> -	 * Must be after ->enqueue_task() because ENQUEUE_DELAYED
> can clear
> -	 * ->sched_delayed.
> +	 * Can be before ->enqueue_task() because uclamp considers
> the
> +	 * ENQUEUE_DELAYED task before its ->sched_delayed gets
> cleared
> +	 * in ->enqueue_task().
> =C2=A0	 */
> -	uclamp_rq_inc(rq, p);
> +	uclamp_rq_inc(rq, p, flags);
> +
> +	p->sched_class->enqueue_task(rq, p, flags);
> =C2=A0
> =C2=A0	psi_enqueue(p, flags);
> =C2=A0
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index c798d2795243..c92fee07fb7b 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6930,7 +6930,7 @@ enqueue_task_fair(struct rq *rq, struct
> task_struct *p, int flags)
> =C2=A0	 * Let's add the task's estimated utilization to the
> cfs_rq's
> =C2=A0	 * estimated utilization, before we update schedutil.
> =C2=A0	 */
> -	if (!(p->se.sched_delayed && (task_on_rq_migrating(p) ||
> (flags & ENQUEUE_RESTORE))))
> +	if (!p->se.sched_delayed || (flags & ENQUEUE_DELAYED))
> =C2=A0		util_est_enqueue(&rq->cfs, p);
> =C2=A0
> =C2=A0	if (flags & ENQUEUE_DELAYED) {
> @@ -7168,7 +7168,7 @@ static int dequeue_entities(struct rq *rq,
> struct sched_entity *se, int flags)
> =C2=A0 */
> =C2=A0static bool dequeue_task_fair(struct rq *rq, struct task_struct *p,
> int flags)
> =C2=A0{
> -	if (!(p->se.sched_delayed && (task_on_rq_migrating(p) ||
> (flags & DEQUEUE_SAVE))))
> +	if (!p->se.sched_delayed)
> =C2=A0		util_est_dequeue(&rq->cfs, p);
> =C2=A0
> =C2=A0	util_est_update(&rq->cfs, p, flags & DEQUEUE_SLEEP);


The HW composer detects the frame status and uses uclamp to adjust the
CPU frequency for specific tasks.
After applying this patch, there is a significant improvement in the
performance of the dispatch system.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Test          : FHD(1920x1080) video playback 30fps in 60hz frame rate.
Units         : jank(frame drop)
Interpretation: lower is better
Statistic     : AMean in one minutes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
asis        with patch
6-janks     0-janks



