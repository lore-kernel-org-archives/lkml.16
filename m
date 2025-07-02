Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D22716E863
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 02:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751423786; cv=none; b=VHot/QnR/BppQ9NET1woWjAQHxL15F2/p5nlUiWbug1zm1hRF/TynWiHDhgqXaArF9yWcXvj+L4n3z/W/GCus+JMgyTTCKF2wIn7mOWp2bNSDvL5usIoVt6nRkeVbu8F0b0VPRpmKamJ4R0+83X21db6M0QhAdhhiedhijU4M8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751423786; c=relaxed/simple;
	bh=77p7M9umS3J+/3ObTGRJCqc6auPs2iEQ+ZeZ7lurq9c=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cvk/VD/Xtug8WNrsgH6Jm4HWoRe8rSBRuAuNyQ+XdkzYzRdFq9D9VYKSK0kKCWmVLWosxbi1HBkRztFA3B7qvCbBuwEVe/Qo95mOnzy73Ri1A4Osq3zUMaRwnsXR4WntKCX//r+6ZOiG4HZi9iaBnU3hYHAKxr4Ky4DQb7SIBIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gwMHFrA4; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gwMHFrA4"
X-UUID: 5435780456ed11f0b1510d84776b8c0b-20250702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=77p7M9umS3J+/3ObTGRJCqc6auPs2iEQ+ZeZ7lurq9c=;
	b=gwMHFrA4RyL6iGzGsMMgfXydsbzmPEhnFZg6rNcNSClLlqL4xt6EPZtHmPmhwRRx3nnipx0hv5qDKcMPFWFmD7GFLUXX4faacqZSm5KzFQu4jG6osqEqW06AHFEZ+j+IP80jBLO4Sz/GeOCjGjXujaDAiC0pBUFG7fiOK7DE9i4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:ebd89f5b-5474-4758-9fb5-03786b271ce5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:8cba6a82-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5435780456ed11f0b1510d84776b8c0b-20250702
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 765888462; Wed, 02 Jul 2025 10:36:16 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 2 Jul 2025 10:36:15 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Wed, 2 Jul 2025 10:36:15 +0800
Message-ID: <fbfc47b461a890eb38552e94b0d07a8315ecdff3.camel@mediatek.com>
Subject: Re: [PATCH V4 1/1] sched/deadline: Fix dl_server runtime
 calculation formula
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Juri Lelli <juri.lelli@redhat.com>, John Stultz <jstultz@google.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Date: Wed, 2 Jul 2025 10:36:15 +0800
In-Reply-To: <aGO9KyiJNAm7DLb0@jlelli-thinkpadt14gen4.remote.csb>
References: <20250627022837.3331827-1-kuyo.chang@mediatek.com>
	 <CANDhNCorm58L9CqHyNORgfk=++HkCttmyCkM23Pn8rXV7cF41Q@mail.gmail.com>
	 <aGO9KyiJNAm7DLb0@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-07-01 at 11:49 +0100, Juri Lelli wrote:
Hi John/Juri,
>=20
> >=20
> > > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > > index ad45a8fea245..96a21f38fcc3 100644
> > > --- a/kernel/sched/deadline.c
> > > +++ b/kernel/sched/deadline.c
> > > @@ -1624,7 +1626,9 @@ void dl_server_update_idle_time(struct rq
> > > *rq, struct task_struct *p)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (delta_exec < 0)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return;
> > >=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D dl_scaled=
_delta_exec(rq, &rq-
> > > >fair_server, delta_exec);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D delta_exe=
c;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!rq->fair_server.dl_server)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq-
> > > >fair_server, delta_exec);
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rq->fair_server.runtime -=
=3D scaled_delta_exec;
> >=20
> > As I mentioned earlier, I still don't see this conditional as
> > making a
> > lot of sense, as I don't believe there is time when this function
> > would be called and (!rq->fair_server.dl_server) would be true.
> > And even if there were, I'm not sure it makes sense to scale the
> > time
> > interval based on the fair_server.dl_server flag.
> >=20
> > From a separate discussion, you highlighted that it might be useful
> > once we have multiple dl_server types, which may want scaled
> > accounting, but I think in that case we should use an explicit flag
> > instead of the dl_server bit to denote if the accounting should be
> > scaled or not.
> >=20
> > So, since your patch is a fix for a pretty bad bug, I think it
> > should
> > be focused on fixing the issue in the simplest and clearest way for
> > the existing code, and not be too worried about integrating with
> > future changes that haven't landed.
> >=20
> > Then, as those future changes land, we can see how best to
> > generalize
> > the decision to scale or not scale the accounting on a dl_server.
> >=20
> > That said, the conditional is a bit of a moot point, since I don't
> > think we'll actually hit it, and I'm motivated to get the bug you
> > are
> > fixing resolved, so I wouldn't object if this went in as-is, but it
> > seems like it would be much cleaner to just drop that conditional
> > as
> > you did in the original version of this patch.
>=20
> I agree. It would be better to drop the conditional.
>=20

Thanks for your feedback and suggestion.
So the original version of this patch for fair_server is much better &
cleaner.
Updated to v5 as below link
https://lore.kernel.org/all/20250702021440.2594736-1-kuyo.chang@mediatek.co=
m/

> Thanks!
> Juri
>=20

