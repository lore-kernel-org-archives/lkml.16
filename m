Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A98F1EA65
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749605619; cv=none; b=IYDcTY17WO7DZT5NXIEkP7gr8UrkViNJJ2PXYXP5OO7EQDGuGyrRTfU9qUmcTBfhIBCGMbaeh+ALzdan6xl5OKdSc89rZUj51FaH5mzFs37jviGNRjE+E9ZTNAUHad4vNSnjma1gTGdaI/rdOiMMmlVFTq77zt59ExvMWADoU2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749605619; c=relaxed/simple;
	bh=a7zLtHKT5M6Fl3wADrK0Ts5XKmk+GX6S7QhB7fNtI6c=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Yz46hNkeyqF9SiKK7v4RHrSykNZu5A07QWnLBeeOYVMxnrwK57zOAo7Yg+vW8X+eEDPq793p8LI46gqEiHXdtBXHAkjY5mdQ9tgrnLnR248ZauE8cIyVrEedgriEn/UrF8Uaw8fmJoMVQgDI/fkNQvqS62hekxe0HcRKIPvZ164=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=isZxnGSE; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="isZxnGSE"
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250611013328epoutp01c882bc166aaa72fb1951d810b06d04f4~H2Qf7BptU2857028570epoutp01h
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:33:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250611013328epoutp01c882bc166aaa72fb1951d810b06d04f4~H2Qf7BptU2857028570epoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749605608;
	bh=GZco/lD0FO9ZEx8hZGGAoWY76+lWGAijqGbtBh8HY20=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=isZxnGSEAPS0VdnIYBMbw8wI9Ky7Vo0q9LmLTp6BlyVvCghvGmuBKvEp98xY+/fnj
	 jZBK66EfhFI5NhWR8u0jMaVvgMN30QnS+ks9GxFqFGWuB3wvffUV5wAYcnJ2qQS/mF
	 MyhzWBbZvsukI6Qskhe+R2Na8pEQ1GrANajcwPD0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPS id
	20250611013328epcas1p1df9a149c0fe9eac90f7a17460419b367~H2QfdPUs21275512755epcas1p1v;
	Wed, 11 Jun 2025 01:33:28 +0000 (GMT)
Received: from epcas1p1.samsung.com (unknown [182.195.38.242]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bH7Tg4wjTz6B9m6; Wed, 11 Jun
	2025 01:33:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250611013327epcas1p239a2fad32789064beb3769e03737c60d~H2QelxTjN3179331793epcas1p2E;
	Wed, 11 Jun 2025 01:33:27 +0000 (GMT)
Received: from yjjunylee03 (unknown [10.252.68.99]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250611013327epsmtip1afc64bcde70abfea04b654dffb76bb0f~H2QejLa7h1630516305epsmtip1K;
	Wed, 11 Jun 2025 01:33:27 +0000 (GMT)
From: <yjjuny.lee@samsung.com>
To: "'Laurent Pinchart'" <laurent.pinchart@ideasonboard.com>, "'Ricardo
 Ribalda'" <ribalda@chromium.org>
Cc: <hdegoede@redhat.com>, <mchehab@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250610213058.GG24465@pendragon.ideasonboard.com>
Subject: RE: [PATCH] usb: uvc: Fix 1-byte out-of-bounds read in
 uvc_parse_format()
Date: Wed, 11 Jun 2025 10:33:27 +0900
Message-ID: <01b501dbda70$d47d5ee0$7d781ca0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJyD9DS5gI4YbVKzdNc8WxXy/HMZgKBOkd2AiccIVgCUixxMrKY7JfA
Content-Language: ko
X-CMS-MailID: 20250611013327epcas1p239a2fad32789064beb3769e03737c60d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250610124111epcas1p18fe9fd8ab47a424c2143d4e2912a8179
References: <CGME20250610124111epcas1p18fe9fd8ab47a424c2143d4e2912a8179@epcas1p1.samsung.com>
	<20250610124107.37360-1-yjjuny.lee@samsung.com>
	<CANiDSCsaQCJCzfjjnMvVRAde0ZrMZC753y7m2MPQJuK=dVqQBQ@mail.gmail.com>
	<20250610213058.GG24465@pendragon.ideasonboard.com>

The buffer length check before calling uvc_parse_format() only ensured
that the buffer has at least 3 bytes (buflen > 2), buf the function
accesses buffer=5B3=5D, requiring at least 4 bytes.

This can lead to an out-of-bounds read if the buffer has exactly 3 bytes.

Fix it by checking that the buffer has at least 4 bytes in
uvc_parse_format().

Signed-off-by: Youngjun Lee <yjjuny.lee=40samsung.com>
Reviewed-by: Ricardo Ribalda <ribalda=40chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart=40ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c =7C 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc=
_driver.c
index da24a655ab68..1100469a83a2 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
=40=40 -344,6 +344,9 =40=40 static int uvc_parse_format(struct uvc_device *=
dev,
 	u8 ftype;
 	int ret;
=20
+	if (buflen < 4)
+		return -EINVAL;
+
 	format->type =3D buffer=5B2=5D;
 	format->index =3D buffer=5B3=5D;
 	format->frames =3D frames;
--=20
2.43.0


> On Tue, Jun 10, 2025 at 02:58:25PM +0200, Ricardo Ribalda wrote:
> > Hi Youngjun
> >=20
> > You still miss the v2 (v3 in this case). and the trailers.
> >=20
> > In the future you can use the b4 tool to take care of most of the detai=
ls.
> > https://b4.docs.kernel.org/en/latest/contributor/overview.html
> > It has =22dry-run=22 option that let you review the mails before you se=
nd=20
> > them to the mailing list
> >=20
> > Please do not resubmit a new patch to fix this, only send a new patch=
=20
> > to fix more comments for other people.
> >=20
> > Regards=21
> >=20
> > On Tue, 10 Jun 2025 at 14:41, Youngjun Lee <yjjuny.lee=40samsung.com> w=
rote:
> > >
> > > The buffer length check before calling uvc_parse_format() only=20
> > > ensured that the buffer has at least 3 bytes (buflen > 2), buf the=20
> > > function accesses buffer=5B3=5D, requiring at least 4 bytes.
> > >
> > > This can lead to an out-of-bounds read if the buffer has exactly 3 by=
tes.
> > >
> > > Fix it by checking that the buffer has at least 4 bytes in=20
> > > uvc_parse_format().
> >
> > Fixes: c0efd232929c (=22V4L/DVB (8145a): USB Video Class driver=22)
> > Cc: stable=40vger.kernel.org
> > Reviewed-by: Ricardo Ribalda <ribalda=40chromium.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart=40ideasonboard.com>
>
> > > Signed-off-by: Youngjun Lee <yjjuny.lee=40samsung.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c =7C 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c=20
> > > b/drivers/media/usb/uvc/uvc_driver.c
> > > index da24a655ab68..1100469a83a2 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > =40=40 -344,6 +344,9 =40=40 static int uvc_parse_format(struct uvc_de=
vice *dev,
> > >         u8 ftype;
> > >         int ret;
> > >
> > > +       if (buflen < 4)
> > > +               return -EINVAL;
> > > +
> > >         format->type =3D buffer=5B2=5D;
> > >         format->index =3D buffer=5B3=5D;
> > >         format->frames =3D frames;

--
Thanks & Regards,

Youngjun Lee

