Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5CC1E22E9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085512; cv=none; b=VVhpWW4Mso1QpcDVN0th1OpgO/kKy9IOJ/+WFsXeclB+r6b3W+05w0YPLkLY5Bz7VVFtJmLDAJ3gcyt4DW4xswVvLZsvnIHivNyMeAhQKmPyCPbwXjYbPPdQWPz7eCt/I0yH7iX2NGofMTRemx/GyTZdm44jRQbKi95XFlGzuVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085512; c=relaxed/simple;
	bh=ThgAw0Vd8B1dzK8aSfK8gWzmo6yApRql2Kb8Xa27X54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qODbJi4nUATwr2Jx652CP5aLIT31eCbrcXGyIwyNNv4i2O2BNEjfAS/1V0jM4lj9EMqOOTzoOhMqZd8GML2x9hrBBUQ3VKk1kf2RIsTV0y8mOQbjylKvUhEIlLVbO1yQOLvo6hxqnW2fJYoKlaPvwI+vZ+VyjI+xgBVXrHAb9cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ayL1UG3E; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ayL1UG3E"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-adb2e9fd208so931558566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750085508; x=1750690308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThgAw0Vd8B1dzK8aSfK8gWzmo6yApRql2Kb8Xa27X54=;
        b=ayL1UG3ELB+gdpZFJhCMokZ4y7Zge+LQBp4ebl6REXlpEBjlbPm51vpsRH0loXGHrv
         /nIMtUlR4qQT/csuywj3QH81XBWi7YtR5yVN2XAQkCxMwEBKZ0i5qtitaONkMM+p843E
         4S/7Nq29WOSA7JocpaHNrMKYKUEuVRs8jZriJvwlxOiWhOJurkRPFynrQVfWTjIZroRn
         bhEwQRQ60etfTVmuznvi2mQEtPW794/J0iRzFIsQf9f1hvt7ncTiH5P3oV93DIFDEemO
         mQQZx9P6cZaDI6/+WbX/zGDiYYenAZUmG0AE5/Yw/T3DoDya+dg3vL+mASGV8g8j/z6r
         5czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750085508; x=1750690308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThgAw0Vd8B1dzK8aSfK8gWzmo6yApRql2Kb8Xa27X54=;
        b=MGPNOfcZzeLcXzIZI501a5DXYll1Xidf6V5j+HtteakXS2n0MoE6eQPsYmi28lBdxJ
         OwrIZSxGWH+IiTA7Oe9NinB3mz1xt0pZjQaoToeLkMNViGKXinScuuVWy3Y/t5g38a+f
         m7rEJpIVnLHcIgbVz/eFiHg8Bd4UjS5D7SZIySlVmo4iaxA5COXk1vuaeC23qay1Qnx1
         Nxgh3j3IZ/ETA1djr7iIWDCm2F3JHJzydkUC31hHDJ+S/gUiNzVrFShP+fQIrervcX5u
         vAfnerjA7odz0pNpR5ae3OTtBoh+7IX/ye5102Ob1Tf91hyEF/ghkg19R3IAInW6vXmg
         ApwA==
X-Forwarded-Encrypted: i=1; AJvYcCVpVyWhv9WyVQo1Q8th9AcHGuo4YfOhWQBgHndHusb9iBskD8iv8tZZ+02WZWR7N6S+hkmmT1X0FJlKDkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YymAviBh2E9XThBanZ/r++gGRARQ8OIN4luI9GB8aRyb1pmqukv
	JxumHHGm6s0dvetC4HrP/c6r81JIqoASOrt/QUBob1aEtQrgwIydllAVSNqqjJFB6ObsHsYSjUc
	yXQ9v2Pybb2wwbmO50B1SSKnPB6auZx/6r8XTYKDqew==
X-Gm-Gg: ASbGnctqLPx43hsr/8PbyluobCJOgNvK+uJ0O2DUtImRWl/iB0XIzPdhxZsctOilAdJ
	m8Ffc0yABspNrF90VQMjWEazr0Kcuf910CLnhwg5d6A0VfYhrdN7CHRvLsbL8s7B++YGKaFqnYl
	RatjTv8o6OkJQ60pFObvcq382kvDcrrDlSdm1xjqSnnd/6iSYVdmvBA5fQN11qYJK9GEmlMgo=
X-Google-Smtp-Source: AGHT+IEVR8gsTBHg5ptQUbmhBkGvXe0B9c3TfML7wwnt+iv16PV5Tw2Pg3QZ2I3wWcL1Z5cd35yshCgkm3l4qSBJUzw=
X-Received: by 2002:a17:907:6088:b0:ad5:5302:4023 with SMTP id
 a640c23a62f3a-adfad5a09f1mr873073566b.44.1750085507650; Mon, 16 Jun 2025
 07:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613140514.2781138-1-vincent.guittot@linaro.org>
 <20250613140514.2781138-3-vincent.guittot@linaro.org> <yaV6Pl8Nz9T25r41NdQTNSmI2lbTQ6VG0XmOoKTw77RLE0pRZAorDIQU1Cgv3XpvPpUkAPHWeJyEXwaEChcctVoxuzS_24jaMzI8-yds744=@gianis.ca>
In-Reply-To: <yaV6Pl8Nz9T25r41NdQTNSmI2lbTQ6VG0XmOoKTw77RLE0pRZAorDIQU1Cgv3XpvPpUkAPHWeJyEXwaEChcctVoxuzS_24jaMzI8-yds744=@gianis.ca>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 16 Jun 2025 16:51:35 +0200
X-Gm-Features: AX0GCFuzC8uzwL1GsEztnPTD3BohoL4CYl7lg1Si-_ebBT96YCWRuIKzJ8o3_D4
Message-ID: <CAKfTPtC8Vg9WJ-hZZ5is-q2Tfi8BEScXGXNvUz9Pz6pxLCWmvw@mail.gmail.com>
Subject: Re: [PATCH 2/4] sched/fair: Increase max lag clamping
To: dhaval@gianis.ca
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Jun 2025 at 23:00, <dhaval@gianis.ca> wrote:
>
>
>
>
>
>
> On Friday, June 13th, 2025 at 7:14 AM, Vincent Guittot <vincent.guittot@l=
inaro.org> wrote:
>
> >
> >
> > From: Peter Zijlstra peterz@infradead.org
> >
> >
> > sched_entity's lag is currently limited to the maximum between the tick
> > and twice its slice. This is too short compared to the maximum custom
> > slice that can be set and accumulated by other tasks.
> > A task can accumulate up to its slice of negative lag while running to
> > parity and the other runnable tasks can accumulate the same positive la=
g
> > while waiting to run. This positive lag could be lost during dequeue wh=
en
> > clamping it to twice task's slice if a task's slice is 100ms and others
> > use a smaller value like the default 2.8ms.
> > Clamp the lag of a task to the maximum slice of enqueued entities plus
> > a tick as the update can be delayed to the next tick.
> >
> > Signed-off-by: Peter Zijlstra (Intel) peterz@infradead.org
> >
> >
> > [ Rebased and Fix max slice computation ]
> >
> > Signed-off-by: Vincent Guittot vincent.guittot@linaro.org
> >
> > ---
> > include/linux/sched.h | 1 +
> > kernel/sched/fair.c | 41 +++++++++++++++++++++++++++++++++++++----
> > 2 files changed, 38 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index 4f78a64beb52..89855ab45c43 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -576,6 +576,7 @@ struct sched_entity {
> > u64 deadline;
> > u64 min_vruntime;
> > u64 min_slice;
> > + u64 max_slice;
> >
>
> I am just wondering if it makes sense to maybe add a few comments here on=
 what each of these fields are for. Maybe not this series, but if you are o=
pen to it, I will spin one up next week.

Yes, make sense


>
> > struct list_head group_node;
> > unsigned char on_rq;
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 44a09de38ddf..479b38dc307a 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -676,6 +676,8 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
> > return cfs_rq->min_vruntime + avg;
> >
> > }
> >
> > +static inline u64 cfs_rq_max_slice(struct cfs_rq cfs_rq);
> > +
> > /
> > * lag_i =3D S - s_i =3D w_i * (V - v_i)
> > *
> > @@ -689,17 +691,16 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
> > * EEVDF gives the following limit for a steady state system:
> > *
> > * -r_max < lag < max(r_max, q)
> > - *
> > - * XXX could add max_slice to the augmented data to track this.
> > */
> > static void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entit=
y *se)
> > {
> > + u64 max_slice =3D cfs_rq_max_slice(cfs_rq) + TICK_NSEC;
> > s64 vlag, limit;
> >
> > WARN_ON_ONCE(!se->on_rq);
> >
> >
> > vlag =3D avg_vruntime(cfs_rq) - se->vruntime;
> >
> > - limit =3D calc_delta_fair(max_t(u64, 2*se->slice, TICK_NSEC), se);
> >
> > + limit =3D calc_delta_fair(max_slice, se);
> >
> > se->vlag =3D clamp(vlag, -limit, limit);
> >
>
> As an aside, I have a test for Theorem 1 from the paper which shows we ar=
e clamping here even in conditions I do not expect. Almost always a cgroup =
seems to be involved. I was out dealing with sickness last couple of weeks,=
 so I have not debugged further.
>
> > }
> > @@ -795,6 +796,21 @@ static inline u64 cfs_rq_min_slice(struct cfs_rq *=
cfs_rq)
> > return min_slice;
> > }
> >
> > +static inline u64 cfs_rq_max_slice(struct cfs_rq *cfs_rq)
> > +{
> > + struct sched_entity *root =3D __pick_root_entity(cfs_rq);
> > + struct sched_entity *curr =3D cfs_rq->curr;
> >
> > + u64 max_slice =3D 0ULL;
> > +
> > + if (curr && curr->on_rq)
> >
> > + max_slice =3D curr->slice;
> >
> > +
> > + if (root)
> > + max_slice =3D max(max_slice, root->max_slice);
> >
> > +
> > + return max_slice;
> > +}
> > +
> > static inline bool __entity_less(struct rb_node *a, const struct rb_nod=
e *b)
> > {
> > return entity_before(__node_2_se(a), __node_2_se(b));
> > @@ -820,6 +836,16 @@ static inline void __min_slice_update(struct sched=
_entity *se, struct rb_node *n
> > }
> > }
> >
> > +static inline void __max_slice_update(struct sched_entity *se, struct =
rb_node *node)
> > +{
> > + if (node) {
> > + struct sched_entity *rse =3D __node_2_se(node);
> > +
> > + if (rse->max_slice > se->max_slice)
> >
> > + se->max_slice =3D rse->max_slice;
> >
> > + }
> > +}
> > +
> > /*
> > * se->min_vruntime =3D min(se->vruntime, {left,right}->min_vruntime)
> >
> > */
> > @@ -827,6 +853,7 @@ static inline bool min_vruntime_update(struct sched=
_entity *se, bool exit)
> > {
> > u64 old_min_vruntime =3D se->min_vruntime;
> >
> > u64 old_min_slice =3D se->min_slice;
> >
> > + u64 old_max_slice =3D se->max_slice;
> >
> > struct rb_node *node =3D &se->run_node;
> >
> >
> > se->min_vruntime =3D se->vruntime;
> >
> > @@ -837,8 +864,13 @@ static inline bool min_vruntime_update(struct sche=
d_entity *se, bool exit)
> > __min_slice_update(se, node->rb_right);
> >
> > __min_slice_update(se, node->rb_left);
> >
> >
> > + se->max_slice =3D se->slice;
> >
> > + __max_slice_update(se, node->rb_right);
> >
> > + __max_slice_update(se, node->rb_left);
> >
> > +
> > return se->min_vruntime =3D=3D old_min_vruntime &&
> >
> > - se->min_slice =3D=3D old_min_slice;
> >
> > + se->min_slice =3D=3D old_min_slice &&
> >
> > + se->max_slice =3D=3D old_max_slice;
> >
> > }
> >
> > RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
> > @@ -852,6 +884,7 @@ static void __enqueue_entity(struct cfs_rq *cfs_rq,=
 struct sched_entity *se)
> > avg_vruntime_add(cfs_rq, se);
> > se->min_vruntime =3D se->vruntime;
> >
> > se->min_slice =3D se->slice;
> >
> > + se->max_slice =3D se->slice;
> >
> > rb_add_augmented_cached(&se->run_node, &cfs_rq->tasks_timeline,
> >
> > __entity_less, &min_vruntime_cb);
> > }
>
> otherwise
>
> Reviewed-by: Dhaval Giani (AMD) <dhaval@gianis.ca>
>
> > --
> > 2.43.0
>
>
