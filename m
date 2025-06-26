Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9490224F6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750905520; cv=none; b=dyyOwfpbbZrljvhgA7fOpAJIvENz0gseR6QayNs5JvLrlewLBALzSIDJOdnyCJ8O1Dhr2BgU/8VA4kj7xRf8uodJ0JHpx4u/QRNGnIfqRdkN95SyyXryambQ/270VSwxaAZWzO0mNJT+/j9HBtNsIjwUPciaoxTN4o6FAlM5IQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750905520; c=relaxed/simple;
	bh=ZyDp82KCRlSHuCEPLpsxX1AlbNKLH6w0nwFm++2Pqzg=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CTB7TZlymssyrpG5jOfRh7fQiUUKPMoHRNpl2wKlJ6ishi8OLILz5sZsVwIT6xe5+dgysTQQNCuM8pZOV2/TxK06v/BGzahL1dqGfAK3FdmnAh7g9/lkMBSerS9+PKRCGAljiz6TN0rLpcb0SxN5aCGNkBo9C7uBz6Opy/wmZb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ldvoke6y; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ldvoke6y"
X-UUID: 86ab1fb8523411f0b910cdf5d4d8066a-20250626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ZyDp82KCRlSHuCEPLpsxX1AlbNKLH6w0nwFm++2Pqzg=;
	b=ldvoke6y4aLhExvCAcLJZTVNh5E9UVdOKUhdxXdz2QGvZvXDfl2nh0klGLHObobnCjChtzGknDw0vmMWSnpp3Re2kdfnJYHAO3yxtVvc1GFqsvlAdCgSYLJ8Ni05Bv/c/KwYCoHBcWuwC9O9HwQ3/b7fzFHdD84LD3wwCjlnQ+U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:3ded2082-b489-40c3-9bf9-4e06d6447499,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:2c2da55f-2aa0-4c76-8faa-804d844c7164,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 86ab1fb8523411f0b910cdf5d4d8066a-20250626
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1211599256; Thu, 26 Jun 2025 10:23:19 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 26 Jun 2025 10:23:18 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Thu, 26 Jun 2025 10:23:18 +0800
Message-ID: <78d351cf981255e48cdf7f5da79ba1eb54dcb42e.camel@mediatek.com>
Subject: Re: [SPAM]Re: [PATCH 1/1] sched/core: Fix migrate_swap() vs. hotplug
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
Date: Thu, 26 Jun 2025 10:23:18 +0800
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
>=20
Gentle ping if forgotten.

It works well during both regular and hotplug tests(more than two
week).

May I know if this patch can be merged into the mainline?

Thanks!

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

