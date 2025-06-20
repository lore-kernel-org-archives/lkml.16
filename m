Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04535819
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750388462; cv=none; b=W1ku2gceM6WR+xlvWAVwMlv6CAHgWp+uzPF/r4va2lxMYavOld3B8dmq7UoxKb8mYOYGHGRI0eCXlERFlAKZ2rYRDe6X9GaaLcf4hnJDa9dmZAl6yYQmyUWI2HNBmzXcfBTH5HH0gsZ6GWgw3vUOfJFK8RVpVB7xaqBV83C4mX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750388462; c=relaxed/simple;
	bh=yK0QfK4ZZxsvW9hBbrEOHPwZIvhCT7JXP6hfmrcRiuA=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ijDUTzyQHq2pmKMZY1dePI3FXY6MomLMkp913905OMONVlMqM6NbI3GqNvpDG6BNa6arkG7YjDxf5usoPrVr6W6J0qA3TZlRm1ay0wW5nNEsTe9kEthl5QXKnxeICRf4Epz1G3tepaUaGQz5mO09IYUAi7o2VQU3myVleLoT9L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=pi1JJyOn; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pi1JJyOn"
X-UUID: c83ec1a24d8211f0b33aeb1e7f16c2b6-20250620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=yK0QfK4ZZxsvW9hBbrEOHPwZIvhCT7JXP6hfmrcRiuA=;
	b=pi1JJyOnWxkyPEfTE5AYixZMXKSt8WyfyXAcX9lineZ2knnwS9U7whZmzzoSIwAX65vp2htCCLc+WoCugLimEHbs5xRjZ17tsfAxLtwcSl0o/osDblSy/OlDcUnMoaVxS6Epk34o5v9+WhU94/6soy9DdKgA7Qls4PkzMoBNUPo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:4749fcf9-ad0f-4c20-8efd-db8f9ab52877,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:f4b8a828-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c83ec1a24d8211f0b33aeb1e7f16c2b6-20250620
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 453986597; Fri, 20 Jun 2025 11:00:54 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 20 Jun 2025 11:00:53 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Fri, 20 Jun 2025 11:00:53 +0800
Message-ID: <6ec534be0618de3e2b4d81555e5f24155326c0b9.camel@mediatek.com>
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
Date: Fri, 20 Jun 2025 11:00:53 +0800
In-Reply-To: <aFQM8TdZIIvvGv8T@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
	 <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
	 <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
	 <aFQM8TdZIIvvGv8T@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-06-19 at 15:13 +0200, Juri Lelli wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> On 18/06/25 22:20, Kuyo Chang wrote:
>=20
> ...
>=20
> > When dl_defer_running =3D 1 and the running time has been exhausted,
> > it means that the dl_server should stop at this point.
> > However, if start_dl_timer() returns a failure, it indicates that
> > the
> > actual time spent consuming the running time was unexpectedly long.
> >=20
> > At this point, there are two options:
> > [as-is] 1. re-enqueuing the dl entity with ENQUEUE_REPLENISH will
> > clear
> > the throttled flag
> > and re-enqueue the dl entity to keep the fair_server running.
> > enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
> > =3D> replenish_dl_entity
> > =C2=A0 =3D> replenish_dl_new_period(dl_se, rq);
> > =C2=A0 =3D> dl_se->dl_yielded =3D 0;
> > =C2=A0 =3D> dl_se->dl_throttled =3D 0;
> > =3D> __enqueue_dl_entity(dl_se);
> >=20
> > [to-be] 2. To avoid RT latency, the fair_server should remain
> > throttled
> > while replenishing the dl_se.
> > Once replenishing is complete, we can ensure that a timer is
> > successfully started.
> > When the timer is triggered, the throttled state will be cleared,
> > ensuring that RT tasks can execute during this interval.
> >=20
> > It is a policy decision for dealing with the case of failure in
> > start_dl_timer().
> > The second approach is better for real-time (RT) latency in my
> > opinion,
> > as RT tasks must be prioritized.
>=20
> OK, I think I see your points, but I am still not sure I fully
> understand the link with the issue you describe in the changelog -
> the
> relation with "DL replenish lagged too much", that is.
>=20
> Could you please expand on the details of the situation that is
> opening
> up for the issue your patch is addressing? Do you know why we hit the
> corner case that causes the warning in the first place?
>=20

"DL replenish lagged too much" means the fair_server took much longer
than expected to use up its running time,
so the deadline fell way behind the clock (which is also why
start_dl_timer() failed).=20
In this situation, just replenishing one dl_period isn=E2=80=99t enough to
catch up.
=20
A corner case is when there are too many IRQs or IPIs in the system.
In this case, runtime gets consumed very slowly, and the fair_server
keep running without being throttled.
Even the runtime is exhausted finally, the fair_server would be
restarted immediately.
In the end, IRQs, IPIs, and fair tasks can take over the whole system,
no chance for RT tasks to run.

> I would like to understand exactly what we are trying to fix before
> deciding how to fix it, sorry if I am being dense. :-)
>=20
> Thanks,
> Juri
>=20

