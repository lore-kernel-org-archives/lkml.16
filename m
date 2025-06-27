Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322782D8DAF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027635; cv=pass; b=ZBUadvKkLlSz2lWRtgzESP5wvZSKtq4QShmEnzseiFiuwTKA9d/fP+SapXI8DdUAIy36fRYAD7R5dgW/uIGx12Fk9GVQdcAaoF0yYp0J6P7POa5PjXICro+HKmb3vB61JacbUWFnpWPsYEijuMPbhiTxuIElbjq8XCwVNcPcQTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027635; c=relaxed/simple;
	bh=uyGlLJdsrpOs/6Btu8IbtzbV/xEAGIn+2sLR12eDSg8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CKnneNTcjt2+Nqq70XPMTPL6c7XjNzrihjP5poOvsxl2jnXWLj09do4wJ4uZAYC1/8OPbQQ0SabMrVznw3EnTDJsyMOdlWo6XjE3wHOMIRy7KYL3Qs18pfYOBuXufY5q5IS99LVaXzEJfhtqFnA2jwaCyMgtkwOmSn6dNQqsrVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=E3dXl/We; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="E3dXl/We"
ARC-Seal: i=1; a=rsa-sha256; t=1751027616; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n0u3gQ+u4hMzUNZXXQjCKP3SqP5F8ouXUwuImCJNtZvInphx8eik+K8fJ1kM5w1JKFkVUzujLOKqL3cuTG7xHlGhsz/I7JU0CBSXu2B+FL1OW9lvHpKZtqRjURGTfXIIekm5VWN1CdU4Vmlg5nSR1m55n7TILI84Am31IMmImrI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751027616; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uyGlLJdsrpOs/6Btu8IbtzbV/xEAGIn+2sLR12eDSg8=; 
	b=kZGv/3cJp7bClypPYKjoB1yijMLBAUe6Q1JVfLu8BLHkKH4YKtr7UrUsJIl2HEcSrt2UhE78iDp/74e4BGs+fdg+SgkE0pw/MZH4RWIEf9gFciXkKqNxudlK6HwoT2Z4v63d32pWffOYg856JTbk7CX7utcjRHpnezz/4fHpIo8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751027616;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=uyGlLJdsrpOs/6Btu8IbtzbV/xEAGIn+2sLR12eDSg8=;
	b=E3dXl/WeONf/z8ONGbf/KQ2C2ljVFtrhJ3u5b5nmIVUvXWp11UosU5iqquCLAw0Q
	8lxvbE/rT5Pzx7mFcdQtJheVcU6jouIzZ8A/XRcMlO73XZWRu738olHwDg3x0aYe/93
	CEGiNT3V+UgH5iyVO/AOyHyfj9IqMxe8j+DwZZiA=
Received: by mx.zohomail.com with SMTPS id 1751027612875820.9172933784699;
	Fri, 27 Jun 2025 05:33:32 -0700 (PDT)
Message-ID: <a5a3a27882a8ea8a147bd56f8250f6dc9391377d.camel@collabora.com>
Subject: Re: [PATCH v4 1/1] drm/mediatek: Adjust bandwidth limit for DP
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?=
 <ck.hu@mediatek.com>,  Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,  "simona@ffwll.ch"
 <simona@ffwll.ch>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
 <airlied@gmail.com>, Mac Shen =?UTF-8?Q?=28=E6=B2=88=E4=BF=8A=29?=
 <Mac.Shen@mediatek.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
  "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Peng Liu
 =?UTF-8?Q?=28=E5=88=98=E9=B9=8F=29?= <Peng.Liu@mediatek.com>, LIANKUN YANG
 =?UTF-8?Q?=28=E6=9D=A8=E8=BF=9E=E5=9D=A4=29?= <Liankun.Yang@mediatek.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Fri, 27 Jun 2025 08:33:30 -0400
In-Reply-To: <667a201e7893d6d4bf9ae0267a5afaf06faa5db8.camel@mediatek.com>
References: <20250625095446.31726-1-liankun.yang@mediatek.com>
	 <f3135961b2fe2c2b5cb3c29d76eb3d818d7a766a.camel@collabora.com>
	 <667a201e7893d6d4bf9ae0267a5afaf06faa5db8.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Fri, 2025-06-27 at 01:32 +0000, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) wrot=
e:
> On Wed, 2025-06-25 at 14:49 -0400, N=C3=ADcolas F. R. A. Prado wrote:
> > External email : Please do not click links or open attachments
> > until you have verified the sender or the content.
> >=20
> >=20
> > On Wed, 2025-06-25 at 17:54 +0800, Liankun Yang wrote:
> > > By adjusting the order of link training and relocating it to HPD,
> > > link training can identify the usability of each lane in the
> > > current
> > > link.
> > >=20
> > > It also supports handling signal instability and weakness due to
> > > environmental issues, enabling the acquisition of a stable
> > > bandwidth
> > > for the current link. Subsequently, DP work can proceed based on
> > > the actual maximum bandwidth.
> > >=20
> > > It should training in the hpd event thread.
> > > Check the mode with lane count and link rate of training.
> > >=20
> > > If we're eDP and capabilities were already parsed we can skip
> > > reading again because eDP panels aren't hotpluggable hence the
> > > caps and training information won't ever change in a boot life
> > >=20
> > > Therefore, bridge typec judgment is required for edp training in
> > > atomic_enable function.
> > >=20
> > > Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> > > ---
> > > Change in V4:
> > > - Tested the internal eDP display on MT8195 Tomato and it is
> > > fine.
> > > Per suggestion from the previous thread:
> > > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linu=
x-mediatek/patch/20250318140236.13650-2-liankun.yang@mediatek.com/__;!!CTRN=
KA9wMg0ARbw!g0Ii2UaT9Wu1FktoGneG4gHV_zwIAwcqEihEA0W4XHKOW2vv7i5MLlekFB9AbbB=
JvWKvbyaiQFkF-JpPcq0$
> >=20
> > Hi,
> >=20
> > I tested this patch on MT8195 Tomato, on top of next-20250625.
> > Indeed
> > the internal eDP display is unaffected by this commit: it still
> > works
> > fine.
> >=20
> > The external displays though not so much. I tested 3 different
> > displays, using 2 different USBC-to-HDMI adapters, and in all cases
> > the
> > behavior was the same:
> > - Before the patch, the image on the display is completely
> > corrupted
> > and unusable. The only discernible element on the display is the
> > mouse
> > cursor, which shows perfectly fine. Occasionally no image will be
> > shown
> > at all, but most of the times, the behavior is as described.
> > - After the patch, nothing ever shows at all on the display. It is
> > always black.
> >=20
> > So while the external display support on Tomato is basically broken
> > as
> > of the latest next, this patch seems to regress the support even
> > further.
>=20
> Hi, Nicolas:
>=20
> Have external display worked normally in previous version?
> If no, I think this patch just let external display change from one
> bad state to another bad state.
> If yes, I think we should fix this problem first, and then apply this
> patch to test.

Hi,

I do remember the external display working on Tomato before, but it's
been a long time since I'd last tested.

In any case, as I've described it is currently basically broken (just
the mouse cursor renders fine), so indeed this patch is bringing the
display from one bad state to another bad state. The bad state after
the patch is even worse than before, since nothing even shows, so
personally I think it'd make more sense to fix this issue before
merging this patch, so we can actually make sure the patch works well,
but I'll leave it for you to decide the best way forward.


--=20
Thanks,

N=C3=ADcolas
