Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBB02F5313
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750218082; cv=none; b=DdsWK55AvhTUgoawdGAygRieTLZWZ+ZHsjl2ufDFL2ybFo5LX+UCQFilcQL2oF/Ze2qk/EJXWSuOvcZQ+/ycJoxuN+/AfZor1AFhwzPzCGuONOdBUSbdBm52t3wTp9dmH61G7IAcxG8rgbYr2EY45iF9gSBqyX49GF+2brBAUUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750218082; c=relaxed/simple;
	bh=jJ6Rn2VcBI2pFg/H97oG9nA6P2Njoqqtp/BQ4BhQzHg=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZAAzJ2l5o4EtDhl65yn5tWXJkRT778aYyB+337EIfxXtcsuqQgYLpTdijh2jnLvWl6I52fGV6Qk6SBaeuLkom6bWd/wP0nY/mH+hnoEV9lzL1WL0oFDfqnwlCNsOzDt9gjMfbPhkjBpMfhUDOH+SMQPD/RGMWFY8yZy9GmIg8Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iC8+uMw+; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iC8+uMw+"
X-UUID: 1467f4604bf611f0b910cdf5d4d8066a-20250618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=0mo63V3QovSHkpNE8wUbgfm1mAKC72zCbSTyRHS1N38=;
	b=iC8+uMw+daTGob0NNqe25JWr1gmfaYe/do1VzhKVvzpFEnX+30gLRSI+4q42i8dQJDdU1a3WSGgQBJlB3rn0DrLoM9LY8/wBfhQnkVUfIrrjhDzYT0rmC2c11TBEOVdy/BGyuJVaZ6STDqLvk1kflG646eMUZ2ZCcjKvyJNGqzc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:dc3d16c2-3651-4111-95a2-28de5dc3eb48,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:1f99cd58-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1467f4604bf611f0b910cdf5d4d8066a-20250618
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 600500351; Wed, 18 Jun 2025 11:41:12 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 18 Jun 2025 11:41:11 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Wed, 18 Jun 2025 11:41:11 +0800
Message-ID: <bbb9a1f3b796e8d7bd0010bf0f4862d67368516a.camel@mediatek.com>
Subject: Re: [PATCH v2 1/1] sched/deadline: Fix dl_server runtime
 calculation formula
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: John Stultz <jstultz@google.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 18 Jun 2025 11:41:11 +0800
In-Reply-To: <CANDhNCrUtLCU86hNk4qyfbqn9eXsmbzgzJCxYmXGRCko0r=VbQ@mail.gmail.com>
References: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
	 <CANDhNCrUtLCU86hNk4qyfbqn9eXsmbzgzJCxYmXGRCko0r=VbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-06-17 at 14:02 -0700, John Stultz wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> On Tue, Jun 17, 2025 at 8:54=E2=80=AFAM Kuyo Chang <kuyo.chang@mediatek.c=
om>
> wrote:
> >=20
> > From: kuyo chang <kuyo.chang@mediatek.com>
> >=20
> > [Symptom]
> > The calculation formula for dl_server runtime is based on
> > Frequency/capacity scale-invariance.
> > This will cause excessive RT latency (expect absolute time).
> >=20
> > [Analysis]
> > Consider the following case under a Big.LITTLE architecture:
> >=20
> > Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> > scale-invariance defined as below:
> >=20
> > Frequency scale-invariance: 100
> > Capacity scale-invariance: 50
> > First by Frequency scale-invariance,
> > the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,812
> > Then by capacity scale-invariance,
> > it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
> >=20
> > So it will scaled to 238,418 ns.
> >=20
> > [Solution]
> > The runtime for dl_server should be fixed time
> > asis RT bandwidth control.
> > Fix the runtime calculation formula for the dl_server.
>=20
> Thanks again for iterating on this patch! I've got a few minor nits
> below.
>=20
> > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > Acked-by: Juri Lelli <juri.lelli@redhat.com>
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> >=20
> > v1:
> > https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediatek=
.com/
> >=20
> > ---
> > =C2=A0kernel/sched/deadline.c | 8 ++++++--
> > =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index ad45a8fea245..f68a158d01e9 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -1504,7 +1504,9 @@ static void update_curr_dl_se(struct rq *rq,
> > struct sched_dl_entity *dl_se, s64
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dl_entity_is_special(dl_=
se))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D dl_scaled_d=
elta_exec(rq, dl_se,
> > delta_exec);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D delta_exec;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dl_se->dl_server)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se,
> > delta_exec);
>=20
> Just a nit, but would
> =C2=A0=C2=A0=C2=A0 if (!dl_server(dl_se))
>=20
> be a little cleaner/consistent with other readers?
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dl_se->runtime -=3D scaled_d=
elta_exec;
> >=20
> > @@ -1624,7 +1626,9 @@ void dl_server_update_idle_time(struct rq
> > *rq, struct task_struct *p)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (delta_exec < 0)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D dl_scaled_d=
elta_exec(rq, &rq-
> > >fair_server, delta_exec);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D delta_exec;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!rq->fair_server.dl_server)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq-
> > >fair_server, delta_exec);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rq->fair_server.runtime -=3D=
 scaled_delta_exec;
>=20
Thanks for cleaner code suggestion, how about this?


diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index f68a158d01e9..3ccffdf4dec6 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1505,7 +1505,7 @@ static void update_curr_dl_se(struct rq *rq,
struct sched_dl_entity *dl_se, s64
 		return;
=20
 	scaled_delta_exec =3D delta_exec;
-	if (!dl_se->dl_server)
+	if (!dl_server(dl_se))
 		scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se,
delta_exec);
=20
 	dl_se->runtime -=3D scaled_delta_exec;
@@ -1614,12 +1614,13 @@ static void update_curr_dl_se(struct rq *rq,
struct sched_dl_entity *dl_se, s64
 void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
 {
 	s64 delta_exec, scaled_delta_exec;
+	struct sched_dl_entity *dl_se =3D &rq->fair_server;
=20
-	if (!rq->fair_server.dl_defer)
+	if (!dl_se->dl_defer)
 		return;
=20
 	/* no need to discount more */
-	if (rq->fair_server.runtime < 0)
+	if (dl_se->runtime < 0)
 		return;
=20
 	delta_exec =3D rq_clock_task(rq) - p->se.exec_start;
@@ -1627,14 +1628,14 @@ void dl_server_update_idle_time(struct rq *rq,
struct task_struct *p)
 		return;
=20
 	scaled_delta_exec =3D delta_exec;
-	if (!rq->fair_server.dl_server)
-		scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq-
>fair_server, delta_exec);
+	if (!dl_server(dl_se))
+		scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se,
delta_exec);
=20
-	rq->fair_server.runtime -=3D scaled_delta_exec;
+	dl_se->runtime -=3D scaled_delta_exec;
=20
-	if (rq->fair_server.runtime < 0) {
-		rq->fair_server.dl_defer_running =3D 0;
-		rq->fair_server.runtime =3D 0;
+	if (dl_se->runtime < 0) {
+		dl_se->dl_defer_running =3D 0;
+		dl_se->runtime =3D 0;
 	}
=20
 	p->se.exec_start =3D rq_clock_task(rq);

If it's ok, should I split it into two separate patches
1.Fix dl_server runtime calculation formula
2.cleaner code patch

or just submit it as a single patch?

> I'm a little confused on the conditional here. Is
> fair_server.dl_server ever not true (after the first call to
> dl_server_start())?
>=20
For now, it's true.

But based on our previous discussion,
use the dl_server flag to identify and handle a 'fixed time' type of
isolation.
This approach makes it easier to extend and allows multiple servers to
configure it as needed.

> Also, in the discussion on your first version, it seemed there might
> be a need for different servers to have different requirements, but
> it
> seemed like fair_server would always not want to be scaled.
>=20
> thanks
> -john

