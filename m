Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64FD1A01B9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800880; cv=none; b=k/BPBexc4/BaOpQxacDky1l0rKGisn5/CbIPAg+6lYYfHRh4F+I8vyCbXrQcevzCG7GX8CzArztWQ2r9pYsRO7ecnuXmBje6AtCNxLUHkoLKmVQprE4q8mzN5TGxUGh13wD+Bm6Iul9gfAX+acdpwRnTOfVVxoVIy9bxH6uMuzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800880; c=relaxed/simple;
	bh=GV5IiH1lX/tVnEyhZKXJm4snMe5XD+W9EpFTNssURzc=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IBv9sVHwCHYWyqukjG+4Q/9pa7AzDQZJ7Zt4uPoVegbwqStxBkg+K9lZ2An/d9D3JAKssnBqgZCK9vw8Y1IqyOwz6uBPnqY3pff3tCfUNTH23hQBmZnkf4OM9yX0pJfNpUvqwiN5kMZmoNCvTDOh8ttMD0EG8MVsoDzosLaJZco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PdyK+4mM; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PdyK+4mM"
X-UUID: b372d8ba482a11f0b33aeb1e7f16c2b6-20250613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=GV5IiH1lX/tVnEyhZKXJm4snMe5XD+W9EpFTNssURzc=;
	b=PdyK+4mM1oc1I9BPeVs75+3anIPHYhq+C8lxZOMSwykkzH34K/5xQ2RWxUka6eFSioRlg6b5Xo2mZt1qjuaA08CA/EbST3ztjVKMRsmAi7hWuH7UFvOm7xUxEoypaY3j/nEfMxq4KjQG7fD60PTgwtgKSviydtA4STLBYW8fTsI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:f7354e2d-910b-4b3a-8762-da40294c50a1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:ba69a558-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b372d8ba482a11f0b33aeb1e7f16c2b6-20250613
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 188918454; Fri, 13 Jun 2025 15:47:48 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 13 Jun 2025 15:47:45 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Fri, 13 Jun 2025 15:47:45 +0800
Message-ID: <c32fcf451dad1cac40ad827e53ac6c027403b07e.camel@mediatek.com>
Subject: Re: [PATCH 1/1] sched/core: Fix migrate_swap() vs. hotplug
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Date: Fri, 13 Jun 2025 15:47:47 +0800
In-Reply-To: <20250606082834.GM30486@noisy.programming.kicks-ass.net>
References: <20250602072242.1839605-1-kuyo.chang@mediatek.com>
	 <20250605100009.GO39944@noisy.programming.kicks-ass.net>
	 <8e1018116ad7c5c325eced2cb17b65c73ca2ceca.camel@mediatek.com>
	 <20250606082834.GM30486@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-06-06 at 10:28 +0200, Peter Zijlstra wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> On Fri, Jun 06, 2025 at 11:46:57AM +0800, Kuyo Chang wrote:
>=20
> > Thank you for your patch.
> > I believe this patch also effectively addresses this race
> > condition.
> > I will queue it in our test pool for testing.
>=20
> Thank you; I shall await the results!
>=20
It works well during both regular and hotplug tests(one week).
I believe the patch is workable.
Please help to merge, thx.

>=20
> > > @@ -101,12 +98,12 @@ static bool cpu_stop_queue_work(unsigned int
> > > cpu, struct cpu_stop_work *work)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raw_spin_lock_irqsave(&sto=
pper->lock, flags);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled =3D stopper->enabl=
ed;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (enabled)
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __cpu_stop_queue_work(stopper, work, &wakeq);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __cpu_stop_queue_work(stopper, work);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (work->done)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cpu_stop_signal_done(work->done);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raw_spin_unlock_irqrestore=
(&stopper->lock, flags);
> > >=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wake_up_q(&wakeq);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wake_up_process(stopper->thread=
);
> >=20
> > BTW, should we add enabled check here?
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (enabled)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 wake_up_process(stopper->thread);
>=20
> Ah yes. Spuriously waking the stopper thread is harmless, but
> wasteful.
>=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 preempt_enable();
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return enabled;

