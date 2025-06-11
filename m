Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2215A923
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626282; cv=none; b=OpSS7KWlsGjP4T2uPVa3EWvd0EOwDyzTpNuF23zmBRpeKkLFZc+Z7CK73cUK/FGZFEbfgSfPUw3bmp0pIcj6+AtchbPJgSA+pbE7poSAvmDYooGPbSEeiHZYo/diMSFHrGo0XZcR2ABvNtIL/IttE1M2wGxnMp9hoDO+3tF8F3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626282; c=relaxed/simple;
	bh=HJsP7ADj8csgR3J7GogH9hoFV9ymJ0d0pPmCGkXcIa0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UO/74ujFGrUr/QGuadjCx5ky4lIrlAcEasfGvN329vQW5mEbPApKFi5qhgYXGl/Z+Z8ixBP9reMxIpuX1aXCjY98OAJouP8D1Dtmd+xgwe0srFPrI/x4r3e0t859WAi9Cpvi5LJ7DU6pmIw+T1oQGTHZrDVXHKT3KIXPjtk8Yl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w011.hihonor.com (unknown [10.68.20.122])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bHH4j6GWFzYmHcj;
	Wed, 11 Jun 2025 15:15:49 +0800 (CST)
Received: from a006.hihonor.com (10.68.23.242) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 11 Jun
 2025 15:17:57 +0800
Received: from a007.hihonor.com (10.68.22.31) by a006.hihonor.com
 (10.68.23.242) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 11 Jun
 2025 15:17:57 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Wed, 11 Jun 2025 15:17:57 +0800
From: liuwenfang <liuwenfang@honor.com>
To: 'Andrea Righi' <arighi@nvidia.com>
CC: 'Tejun Heo' <tj@kernel.org>, 'David Vernet' <void@manifault.com>,
	'Changwoo Min' <changwoo@igalia.com>, 'Ingo Molnar' <mingo@redhat.com>,
	'Peter Zijlstra' <peterz@infradead.org>, 'Juri Lelli'
	<juri.lelli@redhat.com>, 'Vincent Guittot' <vincent.guittot@linaro.org>,
	'Dietmar Eggemann' <dietmar.eggemann@arm.com>, 'Steven Rostedt'
	<rostedt@goodmis.org>, 'Ben Segall' <bsegall@google.com>, 'Mel Gorman'
	<mgorman@suse.de>, 'Valentin Schneider' <vschneid@redhat.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] sched_ext: Fix NULL pointer dereferences in
 put_prev_task_scx
Thread-Topic: [PATCH] sched_ext: Fix NULL pointer dereferences in
 put_prev_task_scx
Thread-Index: AQHb2qD0e5nB9n8NLUKmUsA/aeb7GQ==
Date: Wed, 11 Jun 2025 07:17:57 +0000
Message-ID: <a04892df1ad94df2bbddd7378c39342a@honor.com>
References: <dc2d908cd429473a9d46255272231f38@honor.com>
 <aEbO3DmwY4Tg6HT1@gpd4> <4f5b6cf9dca0492aad16472cbd49a528@honor.com>
 <aEkkPNKtS9tRnkgR@gpd4>
In-Reply-To: <aEkkPNKtS9tRnkgR@gpd4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

>=20
> Hi liuwenfang,
>=20
> On Tue, Jun 10, 2025 at 06:22:22AM +0000, liuwenfang wrote:
> > Thanks for your feedback.
> > This is triggered in kernel modules developed In the mobile scenario:
> > tasks on rq are migrated while the current cpu should be halted for pow=
er
> saving policy.
> > Its migration logic:
> > drain_rq_cpu_stop -- migrate_all_tasks :
> > for (;;) {
> > 	if (rq->nr_running =3D=3D 1)
> > 		break;
> > 	for_each_class(class) {
> > 		next =3D class->pick_next_task(rq);
> > 		if (next) {
> > 			next->sched_class->put_prev_task(rq, next, NULL);
>=20
> Can you do something like this instead?
>=20
>   next->sched_class->put_prev_task(rq, next, next);
>=20
> this should give you the same behavior you're relying on, without requiri=
ng the
> extra check in ext.c.

Yes, this can help me.

>=20
> > 			break;
> > 		}
> > 	}
> > 	if (is_idle_task(next))
> > 		break;
> > 	dest_cpu =3D select_task_rq(next...);
> > 	move_queued_task(rq, rf, next, dest_cpu);
> > 	...
> > }
> >
> > put_prev_task in this function is selected to update util and
> > statistics info for each runnable tasks, here they are not dequeued yet=
.
>=20
> I see, so it's an optimization/workaround to update utilization info with=
out fully
> dequeuing the tasks. Is this out-of-tree code, I guess?
>=20

Yes, this is out-of-tree code.=20

> When you say the CPU is halted, we're not talking about CPU hotplugging, =
right?
> We're just migrating tasks off the CPU?
>=20

Yes, this is one power-saving method to control tasks placement by bypassin=
g
Certain CPUs in software, simply letting the halted CPU enter an idle state=
.
It replaces CPU hotplugging to reduce costs in mobile gaming scenario.=20

> Also, if you're running sched_ext there are ways to exclude certain CPUs =
at the
> scheduler's level via ops.select_cpu() / ops.dispatch(). Do you think thi=
s could be
> a viable solution for your specific use case?
>=20

Yes, Thanks very much, This is exactly the approach we have implemented.

Best regards

> Thanks,
> -Andrea
>=20
> PS https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replyi=
ng
>=20
> >
> > Best regards,
> >
> > > On Mon, Jun 09, 2025 at 11:36:15AM +0000, liuwenfang wrote:
> > > > As put_prev_task can be used in other kernel modules which can
> > > > lead to a NULL pointer. Fix this by checking for a valid next.
> > >
> > > Actually, put_prev_task() should be used only within kernel/sched/
> > > and, in theory, you should have done a dequeue_task() before
> > > put_prev_task() in this scenario, so SCX_TASK_QUEUED shouldn't be set=
 in
> p->scx.flags.
> > >
> > > The change might still make sense, but can you clarify how you
> > > triggered the NULL pointer dereference?
> > >
> > > Thanks,
> > > -Andrea
> > >
> > > >
> > > > Signed-off-by: l00013971 <l00013971@hihonor.com>
> > > > ---
> > > >  kernel/sched/ext.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c index
> > > > f5133249f..6a579babd 100644
> > > > --- a/kernel/sched/ext.c
> > > > +++ b/kernel/sched/ext.c
> > > > @@ -3262,7 +3262,7 @@ static void put_prev_task_scx(struct rq *rq,
> > > > struct
> > > task_struct *p,
> > > >  		 * ops.enqueue() that @p is the only one available for this cpu,
> > > >  		 * which should trigger an explicit follow-up scheduling event.
> > > >  		 */
> > > > -		if (sched_class_above(&ext_sched_class, next->sched_class)) {
> > > > +		if (next && sched_class_above(&ext_sched_class,
> > > > +next->sched_class)) {
> > > >
> 	WARN_ON_ONCE(!static_branch_unlikely(&scx_ops_enq_last));
> > > >  			do_enqueue_task(rq, p, SCX_ENQ_LAST, -1);
> > > >  		} else {
> > > > --
> > > > 2.17.1
