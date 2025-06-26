Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D121C683
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750908074; cv=none; b=pdrIrpv2U69qmPO4l4lMYigAzdXx9dvmq0uGDbyCEmumsLdUrO1Ua8Alw430gvQjhbKYb/F/+C/iCNvyaeWpBwm41/FAkce8OiW+RlQ1Hb3x4wJbUOHuxVho+zo5xfnT/vaYtRW3FPaqM0u7e27vkkofSnYI2XksUJh6qUj8AL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750908074; c=relaxed/simple;
	bh=iGmppVbfQXEVfD4NjfBQCgJ2Cox5OpI2ijSICGXeG4s=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K1XF7PEVorG+eEQwoGJKsoLcCwR8G2TZjUX06jt2e1w/4TkT9z6skgLilYp62cEA3OfEtoII+obuqp2/k5kWUl6dY0J/2tlv2+LZSekKXM7qNwIcXuGTevGj+pglwX7+Bq2WI/HGkMsF+N6Uhc0QoFKxRuVTkkTCr1Ws/9PJXME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=rwhNx0XH; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rwhNx0XH"
X-UUID: 9413a208523c11f0b33aeb1e7f16c2b6-20250626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=iGmppVbfQXEVfD4NjfBQCgJ2Cox5OpI2ijSICGXeG4s=;
	b=rwhNx0XHcj9GSoZylZE7NzED/bfr5ni5KbGJ+djEbDYZJ4/mYiY9M0KXC5vvIU2fu5lfru7MoulJdcpvp66XNbbYMAvZoRY2oz6R9Lxe6jHh8hynGZKbfGkv0U0vATMVuHo+2Kr/jUm/n6T7Y8iB4gxTVpksCDgZnJ3QjqKiENw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:4adea384-256b-4d3a-9a87-98eae4068e6b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:68953682-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:99|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9413a208523c11f0b33aeb1e7f16c2b6-20250626
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 55561097; Thu, 26 Jun 2025 11:20:58 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 26 Jun 2025 11:20:56 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Thu, 26 Jun 2025 11:20:56 +0800
Message-ID: <b28fe126340b4a5e63b21f131ee70806e673d83b.camel@mediatek.com>
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
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	"Team, Android" <kernel-team@android.com>
Date: Thu, 26 Jun 2025 11:20:57 +0800
In-Reply-To: <CANDhNCoMUrZppodAa0bAdds=M3S7u3VqAmiR_Qd-ow=kxDD9=g@mail.gmail.com>
References: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
	 <CANDhNCoMUrZppodAa0bAdds=M3S7u3VqAmiR_Qd-ow=kxDD9=g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-06-18 at 14:45 -0700, John Stultz wrote:
>=20
> >=20
>=20
Hi=20
> Coding nits aside, I put together a quick test that affines to a
> single cpu a SCHED_NORMAL and SCHED_FIFO spinner task to illustrate
> the issue.
>=20
> You can quickly see the requested 50ms/sec dl_sever runtime on the
> big
> cpu, ends up being scaled out to 323ms/sec, blocking RT tasks on that
> little cpu for quite awhile.
> =C2=A0
> https://urldefense.com/v3/__https://github.com/johnstultz-work/misc/blob/=
main/images/2025-06-18_illustration-of-problem-dl-server-scaling.png__;!!CT=
RNKA9wMg0ARbw!lPy4srzoAcjFBktsYnAx92nK9niGz-Im3xUxfnorT3tEv4TGg2uSPBQFEOPu2=
l6CrGwO-zFiuMyDz-8jcc0$
>=20
> The wild thing with the example illustration of the issue above is
> that since my test uses cpu spinners, the cpufreq quickly maxes out.
> So it's only really considering the capacity scaling between the big
> (cpu 7) and little (cpu 0) cpus at their top frequency.
>=20
> When I capped the cpu 0 max frequency to the lowest available,
> without
> the patch the behavior is crazy:
> =C2=A0
> https://urldefense.com/v3/__https://github.com/johnstultz-work/misc/blob/=
main/images/2025-06-18_dl-server-scaling-with-cpufreq-lowered.png__;!!CTRNK=
A9wMg0ARbw!lPy4srzoAcjFBktsYnAx92nK9niGz-Im3xUxfnorT3tEv4TGg2uSPBQFEOPu2l6C=
rGwO-zFiuMyDA9vSf_I$
>=20
> Though the image alone maybe isn't as clear, in that case we see the
> RT task once it runs ~650ms, the dl_server kicks in and blocks it and
> any other RT task from running for over *10 minutes*!
>=20
> And with the fix to avoid scaling the fair_server, the results looks
> much more sane:
> https://urldefense.com/v3/__https://github.com/johnstultz-work/misc/blob/=
main/images/2025-06-18_with-patch-to-not-scale-dl-server-fixed.png__;!!CTRN=
KA9wMg0ARbw!lPy4srzoAcjFBktsYnAx92nK9niGz-Im3xUxfnorT3tEv4TGg2uSPBQFEOPu2l6=
CrGwO-zFiuMyDpr-NplY$
>=20
> So I'm very happy to add:
> =C2=A0 Tested-by: John Stultz <jstultz@google.com>
>=20
> And hope this gets upstream (and -stable) in some form quickly.
>=20
> Thanks so much to Kuyo and others on his team for reporting and
> root-causing this issue!
>=20
update to patch v3 as below
https://lore.kernel.org/all/20250626030746.2245365-1-kuyo.chang@mediatek.co=
m/

Please help to review, and if anyone have any concerns, please let me
know.

> thanks
> -john

