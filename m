Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E3922DFBE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744846687; cv=none; b=NAd/Abb2TAK8RebqZPjBMZDXdjZtokczKWECv19iZ96VVv+NUwHdXhGRN3wrxJlzXEVVkMREh1oShbKuaDtaLkPrVwx8k7OtS/CK7nfi9vkv+TDDJE4tfqwUbRKefqHM5TU7Th4bBWzxRr46wepesPHEJA5r4bycQABQk0ULjuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744846687; c=relaxed/simple;
	bh=ofszS4bA7rlERPUm6YaeoGlWH81i/S4heNB4ve75F+U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=alyMO7cd3YqAb6TF8Am8qwPrM3EFfYk2VP85coS8Nmqs+ouDca/d2lCP5EIaQXIujGZSMXKuVju6hLXiP2Qgi3xTsZbMWc/J68uqOEp63g0aue2NY0zjskxatMaia9XCtn6CO3cAK6ZayMAqtxpPG0xPuieiEG6QF7qs2MxhCDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=GX9D9trz; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="GX9D9trz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1744846683;
	bh=ofszS4bA7rlERPUm6YaeoGlWH81i/S4heNB4ve75F+U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GX9D9trzR8oU8W9+viRx7K6I+Z8bm9iDE0KwDyIleKfvcyBFjMEljoQ8nk7r2vaOn
	 Fo9aYhuvrmoFewJq/Xvl1S/9+I/bPL82kHlNfZ0Tc7msCUyq+a/uRTjRFS8+leNvTu
	 ky+Uwu1emPMHDGaGA53RSUATet7pjLgkEvK/4zp7lXRT9MQkEulZO55X5w2yk1GwJN
	 2Kw62B40VMpEy1ygj1wUEjdN79y9mUykm3tMSqv0TCS6zk9MhmVqS18Vt1U9KgiHya
	 m59Cp9/8DuJFSj1PAKUUxQ1J601yyQABNf1jeDfxGnMd1TzUINclaSGqd5ZRu19MHl
	 4LBxdyDUgnWUw==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BBDA57E323;
	Thu, 17 Apr 2025 07:38:02 +0800 (AWST)
Message-ID: <6a4e31eeed722f9c36302d3d097cb054465c82c2.camel@codeconstruct.com.au>
Subject: Re: [PATCH 4/7] soc: aspeed: lpc-snoop: Constrain parameters in
 channel paths
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jean Delvare <jdelvare@suse.de>
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, Andrew Geissler
 <geissonator@yahoo.com>, Ninad Palsule <ninad@linux.ibm.com>, Patrick
 Venture <venture@google.com>, Robert Lippert <roblip@gmail.com>,
 linux-kernel@vger.kernel.org
Date: Thu, 17 Apr 2025 09:07:59 +0930
In-Reply-To: <20250416143712.4e4666f4@endymion>
References: 
	<20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
	 <20250411-aspeed-lpc-snoop-fixes-v1-4-64f522e3ad6f@codeconstruct.com.au>
	 <20250416143712.4e4666f4@endymion>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-16 at 14:37 +0200, Jean Delvare wrote:
> On Fri, 11 Apr 2025 10:38:34 +0930, Andrew Jeffery wrote:
> > Ensure pointers and the channel index are valid before use.
> >=20
> > Fixes: 9f4f9ae81d0a ("drivers/misc: add Aspeed LPC snoop driver")
>=20
> Please don't abuse Fixes tags. Here you are hardening the code just in
> case, but this isn't fixing any actual bug, as functions
> aspeed_lpc_enable_snoop() and aspeed_lpc_disable_snoop() were never
> called with an incorrect channel index.

I'll drop the tag.

>=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> > =C2=A0drivers/soc/aspeed/aspeed-lpc-snoop.c | 7 +++++++
> > =C2=A01 file changed, 7 insertions(+)
> >=20
> > diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed=
/aspeed-lpc-snoop.c
> > index 28f034b8a3b7226efe20cbe30a7da0c2b49fbd96..6ab362aeb180c8ad356422d=
8257717f41a232b3c 100644
> > --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > @@ -182,6 +182,7 @@ static int aspeed_lpc_snoop_config_irq(struct aspee=
d_lpc_snoop *lpc_snoop,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > =C2=A0}
> > =C2=A0
> > +__attribute__((nonnull))
> > =C2=A0static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_s=
noop,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device =
*dev,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int channel, u=
16 lpc_port)
> > @@ -190,6 +191,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lp=
c_snoop *lpc_snoop,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 hicr5_en, snpwadr_m=
ask, snpwadr_shift, hicrb_en;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int rc =3D 0;
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (channel < 0 || channel >=
=3D ARRAY_SIZE(lpc_snoop->chan))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (lpc_snoop->chan[cha=
nnel].enabled)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EBUSY;
> > @@ -252,9 +255,13 @@ static int aspeed_lpc_enable_snoop(struct aspeed_l=
pc_snoop *lpc_snoop,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return rc;
> > =C2=A0}
> > =C2=A0
> > +__attribute__((nonnull))
> > =C2=A0static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc=
_snoop,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
t channel)
> > =C2=A0{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (channel < 0 || channel >=
=3D ARRAY_SIZE(lpc_snoop->chan))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return;
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!lpc_snoop->chan[ch=
annel].enabled)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > =C2=A0
> >=20
>=20
> TBH I'm not sure if this has much value, as any error in the channel
> index (or passing NULL pointers for lpc_snoop or dev) would likely be
> caught very early during driver development or update. And silently
> returning early is not going to fix the problem if this ever happens.
>=20
> But well, I'm not much into defensive programming anyway, so maybe this
> is just me. As I'm not maintaining this driver, this ain't my decision.
>=20
> Acked-by: Jean Delvare <jdelvare@suse.de>
>=20

Given there's some other minor cleanups in your review of the series
I'll reconsider this approach as well.

Andrew

