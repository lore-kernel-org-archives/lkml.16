Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E4017C21B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750993364; cv=none; b=IVrZ68CasOEmRbuwc5yvx1BSlqfUFZON1h0mbDRpp74+QFJRRutDzZ9DtX3QQCvW3fP972Zo7X4ayildInojC9+vk4c1DjwkolWKQVy+duCbp9jGPf7pTgnsbzXuHrOB9OdS4UQB0Ec2fFTIUfB9HKW+ggmlWCDvCD5pn/+hME4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750993364; c=relaxed/simple;
	bh=OV4Vv1j62T0J9EDR2MBzhy7KvS/mL5uJgVrkoezDvk4=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jepcS3zAoQKZ1wbiqyPmUeiHpAw8LP3gjI8gQOWi2/+ZGvJ5Z6yGWKBkDTnXHulgnGfyDFJAraARkmwTbR/fzH8QIsWMmrj3AbFGLj5JeKAXlgnVU2kt78DYvtCMSarVwCQr8RE6mCI+AbchB3y9bWM+LKA7sd0rxs0lMFALmnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=o9dNvPwp; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="o9dNvPwp"
X-UUID: 2f365c0a530311f0b33aeb1e7f16c2b6-20250627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=OV4Vv1j62T0J9EDR2MBzhy7KvS/mL5uJgVrkoezDvk4=;
	b=o9dNvPwpSbmiE8l6zluijkcE2FcSLAqpk2KZ986d7dbSVWRceIGYj/DDeZWkDWaXV7npTioza0WO4GzIaebM+/plz3KBrBF56MUoUZe1UB4fdJJsN0IJm9h6eInhzXyAbYMi3U0fzmV8xVKiYBB2amTbsV7xHvi4R0C7MLSbiOE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:3702e25b-eb87-4cab-9138-86a37c05b3b8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:28e84082-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2f365c0a530311f0b33aeb1e7f16c2b6-20250627
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 266055417; Fri, 27 Jun 2025 11:02:39 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 27 Jun 2025 11:02:36 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Fri, 27 Jun 2025 11:02:36 +0800
Message-ID: <c057bbc383ab5525172b22a4f3480acbcac12045.camel@mediatek.com>
Subject: Re: [PATCH v3 1/1] sched/deadline: Fix dl_server runtime
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
Date: Fri, 27 Jun 2025 11:02:37 +0800
In-Reply-To: <CANDhNCpNZd+s9+ZXU=+4t3CyV=7weFsbWQEx2=M9yphx6szt8Q@mail.gmail.com>
References: <20250626030746.2245365-1-kuyo.chang@mediatek.com>
	 <CANDhNCpNZd+s9+ZXU=+4t3CyV=7weFsbWQEx2=M9yphx6szt8Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-06-25 at 22:25 -0700, John Stultz wrote:
>=20
>=20
>=20
> On Wed, Jun 25, 2025 at 8:08=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.c=
om>
> wrote:
> > [Symptom]
> > The calculation formula for dl_server runtime is based on
> > Frequency/capacity scale-invariance.
> > This will cause excessive RT latency (expect absolute time).
>=20
> I appreciate your symptom/analysis/solution markers, but they are a
> little unconventional for commit messages, so you might consider
> dropping them.
>=20
> Further, you're explaining the cause of the problem before you
> describe what you were seeing.
>=20
> I might suggest rewording as:
> "In our testing with 6.12 based kernel on a big.LITTLE system, we
> were
> seeing instances of RT tasks being blocked from running on the LITTLE
> cpus for multiple seconds of time, apparently by the dl_server. This
> far exceeds the default configured 50ms per second runtime."
>=20
> Then you can get into the analysis where you can state as you had
> above:
> "This is due to the fair dl_server runtime calculation being scaled
> for frequency & capacity of the cpu"
>=20
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
>=20
> This part is all good, but you might want to make it more clear why
> the smaller scaled "runtime" value here results in longer delays for
> RT tasks.
> ie:
>=20
> This smaller "accounted runtime" value is what ends up being
> subtracted against the fair-server's runtime for the current period.
> Thus after 50ms of real time, we've only accounted ~238us against the
> fair servers runtime. This 209:1 ratio in this example means that on
> the smaller cpu the fair server is allowed to continue running,
> blocking RT tasks, for over 10 seconds before it exhausts its
> supposed
> 50ms of runtime.=C2=A0 And on other hardware configurations it can be eve=
n
> worse.
>=20
> > [Solution]
> > The runtime for dl_server should be fixed time
> > asis RT bandwidth control.
> > Fix the runtime calculation formula for the dl_server.
>=20
> I think this can be stated more simply as:
> "For the fair deadline_server, to prevent realtime tasks from being
> unexpectedly delayed, we really do want to use fixed time, and not
> scaled time for smaller capacity/frequency cpus. So remove the
> scaling
> from the fair server's accounting to fix this."
>=20
> > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > Acked-by: Juri Lelli <juri.lelli@redhat.com>
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > Suggested-by: John Stultz <jstultz@google.com>
> > Tested-by: John Stultz <jstultz@google.com>
> >=20
> > v1:
> > https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediatek=
.com/
> > v2:
> > https://lore.kernel.org/all/20250617155355.1479777-1-kuyo.chang@mediate=
k.com/
>=20
> Please add a "---" line above the version data so it doesn't get
> added
> to the commit history.
>=20
> > Change-Id: Iaaa1ec78f405586c22ba56230ef1143206daa2d0
>=20
> Also no Change-Ids in upstream targeted commits.
> ./scripts/checkpatch.pl should warn you about this, and its a good
> idea in general to run that before submitting.
>=20
> > ---
> > =C2=A0kernel/sched/deadline.c | 8 ++++++--
> > =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index ad45a8fea245..96a21f38fcc3 100644
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dl_server(dl_se))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se,
> > delta_exec);
> >=20
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
>=20
> I still feel like these lines don't make much sense, and it seems
> like
> they could be dropped.=C2=A0 When is (!rq->fair_server.dl_server) true?
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rq->fair_server.runtime -=3D=
 scaled_delta_exec;
> >=20
> > --
>=20
> Thanks so much again for finding this issue and resubmitting this
> patch! I really do want to see this land quickly as it addresses a
> pretty big issue.

Thanks for your reminder and suggestion.
Update to v4 as below link :)

https://lore.kernel.org/all/20250627022837.3331827-1-kuyo.chang@mediatek.co=
m/

> -john

