Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBFE2EA17A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256442; cv=none; b=EMBIuMHqWanXKqWf9Vahb8n1qHIjtlNMlC/Z4YnFN2S5an3CmDCTTW7SBQxyJuFkE8AP2X1h7Qjnn2tMpz+BybMvi95refirYfbGMZPwEDzZaPB3Vdqsi21vGNV1eKzTuf2oWkHfLdCShcoaCo+KGJdUpoL3mxgOrrkDBV6AURk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256442; c=relaxed/simple;
	bh=bUg/Zmb/ePvz+Q4Q/JvRrQE99mqMxI5jazB+1RokVeM=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oKfjaGu023pKtg84A8w4YrBVf+eRKstEqYS7asIf6BIjIaztGYPSd5CmhAoPLxTsp4QT1Ui7JFqUbJJphTvme6tw0EwsfmzdYMo0G/JAAtmP0O7X5wkq2Qdt4qNUV4E5fylJoWGyPyZahnP3hdeEBK7j136OJOUtmV+9axy1hN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=sDaHsAuq; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sDaHsAuq"
X-UUID: 6041c5ce4c4f11f0b910cdf5d4d8066a-20250618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=361/w2s39uIsBSkc/Vfv0lndyaZuHMALTiabihSnPGs=;
	b=sDaHsAuqFAi5Cd4vH8mhpoAbQgBCSRaFcOwdbayC5+Ae9jw7nZYJ9WaXzX3YDggpfvY5P803+e6QX5tmXA51Zj4gTvOFJdj2+t+jvgG7cAo1glmq16ceJvgvMv+VvfhfZ/GSa3UF56r6jxs8tz+pK0vU7T+LQ+8qsk/uXGuxp/k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:8a3b34ac-610f-4af5-b4a3-d7099bf7b468,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:b5859928-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6041c5ce4c4f11f0b910cdf5d4d8066a-20250618
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1209876132; Wed, 18 Jun 2025 22:20:24 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 18 Jun 2025 22:20:22 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Wed, 18 Jun 2025 22:20:22 +0800
Message-ID: <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
Subject: Re: [RFC PATCH 1/1] sched/deadline: Fix RT task potential
 starvation when expiry time passed
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Juri Lelli <juri.lelli@redhat.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, jstultz
	<jstultz@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 18 Jun 2025 22:20:23 +0800
In-Reply-To: <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
	 <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-06-16 at 17:03 +0200, Juri Lelli wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> Hello,
>=20
> >=20
> > [Proposed Solution]:
> > ------------------
> > Instead of immediately re-enqueuing the DL entity on timer
> > registration
> > failure, this change ensures the DL entity is properly replenished
> > and
> > the timer is restarted, preventing RT potential starvation.
> >=20
> > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > ---
> > =C2=A0kernel/sched/deadline.c | 8 +++++---
> > =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index ad45a8fea245..e50cb76c961b 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -1556,10 +1556,12 @@ static void update_curr_dl_se(struct rq
> > *rq, struct sched_dl_entity *dl_se, s64
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 }
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (unlikely(is_dl_boosted(dl_se) ||
> > !start_dl_timer(dl_se))) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dl_server(dl_se))
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 enqueue_dl_entity(dl_se,
> > ENQUEUE_REPLENISH);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dl_server(dl_se)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 replenish_dl_new_period(dl_se, rq);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 start_dl_timer(dl_se);
>=20
> But, even today, enqueue_dl_entity() is called with ENQUEUE_REPLENISH
> flag, so I don't get why you say 're-enqueues the DL entity without
> properly replenishing'.
>=20
> Also, why restarting the replenishing timer right after having
> replenished the entity?
>=20

When dl_defer_running =3D 1 and the running time has been exhausted,=20
it means that the dl_server should stop at this point.
However, if start_dl_timer() returns a failure, it indicates that the
actual time spent consuming the running time was unexpectedly long.=20
=20
At this point, there are two options:
[as-is] 1. re-enqueuing the dl entity with ENQUEUE_REPLENISH will clear
the throttled flag=20
and re-enqueue the dl entity to keep the fair_server running.=20
enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
=3D> replenish_dl_entity
  =3D> replenish_dl_new_period(dl_se, rq);
  =3D> dl_se->dl_yielded =3D 0;
  =3D> dl_se->dl_throttled =3D 0;
=3D> __enqueue_dl_entity(dl_se);

[to-be] 2. To avoid RT latency, the fair_server should remain throttled
while replenishing the dl_se.=20
Once replenishing is complete, we can ensure that a timer is
successfully started.=20
When the timer is triggered, the throttled state will be cleared,
ensuring that RT tasks can execute during this interval.
=20
It is a policy decision for dealing with the case of failure in
start_dl_timer().
The second approach is better for real-time (RT) latency in my opinion,
as RT tasks must be prioritized.

> Thanks,
> Juri
>=20

