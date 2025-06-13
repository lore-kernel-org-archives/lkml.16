Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch [79.135.106.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3C522E3E8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 21:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848420; cv=none; b=J5FSmhxQ3vFf2qn5FmQ3h63JJU2GeIANSq7Bwe8gVZ5FaRU/J/NKQ7eClv+UTh6Z2NfhsFntDdY2PGTv3tQ9ssY1CtrcQFFrms7EIZeVnuSwjQqH8oDq6ch/xGww6dNwdok1OEZ4p70hQapu036g5JBU9fHjiiHENvcIVhNAjcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848420; c=relaxed/simple;
	bh=C5INVxTN3i9TinbiyttmYCtTvarHSwnt7ggmuh4hcDo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MO4YHLroKndFvhpsf5bFAEht3m+JJKgHY+jOohwtCB6MPEwFKNYtxRWhoU8qhZJ9k8eF89wFVSR5Fzi9cwSrXB5n59cOBN6FFCzcCmaxsKcJ5tBlojHPJKxFivBWq1xwnVF4CtyOrYKUiWT46hkRkE+LDsidSV32SK3DFLXB1iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca; spf=pass smtp.mailfrom=gianis.ca; dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b=KBIrKz5Y; arc=none smtp.client-ip=79.135.106.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gianis.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b="KBIrKz5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gianis.ca;
	s=protonmail; t=1749848408; x=1750107608;
	bh=C5INVxTN3i9TinbiyttmYCtTvarHSwnt7ggmuh4hcDo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=KBIrKz5YmjSdNIw8QGslRLkCgdFwNVRQcd2rb6SDokDiGiJio75kNPZKPlkYoc0e7
	 hnAEuvy6G6A/5X25uMal49sjgwuBXMwTXOKIeSKhsQlBz+zVTAhWdOACoObmQmdQHo
	 ll1vgg+YB8jeC6Tfe3486oIgP6vBcd739TyXl9Zxz/BQFpeJao2zvIuwXzxTp3Inur
	 4BTwXtnLT/w829X5hPKHGfPPjuGSICzI3HInoIsIqflQXaDp4TazIYoQHzO/SU8Owg
	 AeSrD7Umq2cvRqzRV9Fvn8IhNSM3EzcvDI7bMz1w/bp80OlP2qE8lsayT1sagTb86N
	 GDtkOKOE6LMAQ==
Date: Fri, 13 Jun 2025 21:00:02 +0000
To: Vincent Guittot <vincent.guittot@linaro.org>
From: dhaval@gianis.ca
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] sched/fair: Increase max lag clamping
Message-ID: <yaV6Pl8Nz9T25r41NdQTNSmI2lbTQ6VG0XmOoKTw77RLE0pRZAorDIQU1Cgv3XpvPpUkAPHWeJyEXwaEChcctVoxuzS_24jaMzI8-yds744=@gianis.ca>
In-Reply-To: <20250613140514.2781138-3-vincent.guittot@linaro.org>
References: <20250613140514.2781138-1-vincent.guittot@linaro.org> <20250613140514.2781138-3-vincent.guittot@linaro.org>
Feedback-ID: 128275035:user:proton
X-Pm-Message-ID: 26529d53c215b8acd269a1975c0a6ced1a8a6443
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Friday, June 13th, 2025 at 7:14 AM, Vincent Guittot <vincent.guittot@lin=
aro.org> wrote:

>=20
>=20
> From: Peter Zijlstra peterz@infradead.org
>=20
>=20
> sched_entity's lag is currently limited to the maximum between the tick
> and twice its slice. This is too short compared to the maximum custom
> slice that can be set and accumulated by other tasks.
> A task can accumulate up to its slice of negative lag while running to
> parity and the other runnable tasks can accumulate the same positive lag
> while waiting to run. This positive lag could be lost during dequeue when
> clamping it to twice task's slice if a task's slice is 100ms and others
> use a smaller value like the default 2.8ms.
> Clamp the lag of a task to the maximum slice of enqueued entities plus
> a tick as the update can be delayed to the next tick.
>=20
> Signed-off-by: Peter Zijlstra (Intel) peterz@infradead.org
>=20
>=20
> [ Rebased and Fix max slice computation ]
>=20
> Signed-off-by: Vincent Guittot vincent.guittot@linaro.org
>=20
> ---
> include/linux/sched.h | 1 +
> kernel/sched/fair.c | 41 +++++++++++++++++++++++++++++++++++++----
> 2 files changed, 38 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 4f78a64beb52..89855ab45c43 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -576,6 +576,7 @@ struct sched_entity {
> u64 deadline;
> u64 min_vruntime;
> u64 min_slice;
> + u64 max_slice;
>=20

I am just wondering if it makes sense to maybe add a few comments here on w=
hat each of these fields are for. Maybe not this series, but if you are ope=
n to it, I will spin one up next week.

> struct list_head group_node;
> unsigned char on_rq;
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 44a09de38ddf..479b38dc307a 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -676,6 +676,8 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
> return cfs_rq->min_vruntime + avg;
>=20
> }
>=20
> +static inline u64 cfs_rq_max_slice(struct cfs_rq cfs_rq);
> +
> /
> * lag_i =3D S - s_i =3D w_i * (V - v_i)
> *
> @@ -689,17 +691,16 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
> * EEVDF gives the following limit for a steady state system:
> *
> * -r_max < lag < max(r_max, q)
> - *
> - * XXX could add max_slice to the augmented data to track this.
> */
> static void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity =
*se)
> {
> + u64 max_slice =3D cfs_rq_max_slice(cfs_rq) + TICK_NSEC;
> s64 vlag, limit;
>=20
> WARN_ON_ONCE(!se->on_rq);
>=20
>=20
> vlag =3D avg_vruntime(cfs_rq) - se->vruntime;
>=20
> - limit =3D calc_delta_fair(max_t(u64, 2*se->slice, TICK_NSEC), se);
>=20
> + limit =3D calc_delta_fair(max_slice, se);
>=20
> se->vlag =3D clamp(vlag, -limit, limit);
>=20

As an aside, I have a test for Theorem 1 from the paper which shows we are =
clamping here even in conditions I do not expect. Almost always a cgroup se=
ems to be involved. I was out dealing with sickness last couple of weeks, s=
o I have not debugged further.

> }
> @@ -795,6 +796,21 @@ static inline u64 cfs_rq_min_slice(struct cfs_rq *cf=
s_rq)
> return min_slice;
> }
>=20
> +static inline u64 cfs_rq_max_slice(struct cfs_rq *cfs_rq)
> +{
> + struct sched_entity *root =3D __pick_root_entity(cfs_rq);
> + struct sched_entity *curr =3D cfs_rq->curr;
>=20
> + u64 max_slice =3D 0ULL;
> +
> + if (curr && curr->on_rq)
>=20
> + max_slice =3D curr->slice;
>=20
> +
> + if (root)
> + max_slice =3D max(max_slice, root->max_slice);
>=20
> +
> + return max_slice;
> +}
> +
> static inline bool __entity_less(struct rb_node *a, const struct rb_node =
*b)
> {
> return entity_before(__node_2_se(a), __node_2_se(b));
> @@ -820,6 +836,16 @@ static inline void __min_slice_update(struct sched_e=
ntity *se, struct rb_node *n
> }
> }
>=20
> +static inline void __max_slice_update(struct sched_entity *se, struct rb=
_node *node)
> +{
> + if (node) {
> + struct sched_entity *rse =3D __node_2_se(node);
> +
> + if (rse->max_slice > se->max_slice)
>=20
> + se->max_slice =3D rse->max_slice;
>=20
> + }
> +}
> +
> /*
> * se->min_vruntime =3D min(se->vruntime, {left,right}->min_vruntime)
>=20
> */
> @@ -827,6 +853,7 @@ static inline bool min_vruntime_update(struct sched_e=
ntity *se, bool exit)
> {
> u64 old_min_vruntime =3D se->min_vruntime;
>=20
> u64 old_min_slice =3D se->min_slice;
>=20
> + u64 old_max_slice =3D se->max_slice;
>=20
> struct rb_node *node =3D &se->run_node;
>=20
>=20
> se->min_vruntime =3D se->vruntime;
>=20
> @@ -837,8 +864,13 @@ static inline bool min_vruntime_update(struct sched_=
entity *se, bool exit)
> __min_slice_update(se, node->rb_right);
>=20
> __min_slice_update(se, node->rb_left);
>=20
>=20
> + se->max_slice =3D se->slice;
>=20
> + __max_slice_update(se, node->rb_right);
>=20
> + __max_slice_update(se, node->rb_left);
>=20
> +
> return se->min_vruntime =3D=3D old_min_vruntime &&
>=20
> - se->min_slice =3D=3D old_min_slice;
>=20
> + se->min_slice =3D=3D old_min_slice &&
>=20
> + se->max_slice =3D=3D old_max_slice;
>=20
> }
>=20
> RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
> @@ -852,6 +884,7 @@ static void __enqueue_entity(struct cfs_rq *cfs_rq, s=
truct sched_entity *se)
> avg_vruntime_add(cfs_rq, se);
> se->min_vruntime =3D se->vruntime;
>=20
> se->min_slice =3D se->slice;
>=20
> + se->max_slice =3D se->slice;
>=20
> rb_add_augmented_cached(&se->run_node, &cfs_rq->tasks_timeline,
>=20
> __entity_less, &min_vruntime_cb);
> }

otherwise

Reviewed-by: Dhaval Giani (AMD) <dhaval@gianis.ca>

> --
> 2.43.0


