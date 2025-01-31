Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1318B1BE238;
	Fri, 31 Jan 2025 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738331464; cv=none; b=Eq/8v+BfV0lY+aWjceQGPPPA87q3aCXuphk4NsQKGrU2OYmP5/8fegcx4YiIrmpAcFVyEdxvWKjOw8R9jlfOn7DncLkoiOUOwtTt1xAgf6ZIcVjsD28Kn8iBkNBCTxqW8dYnjJ7vzB7xwHsldDk4TYCpcf0DR84yHooEZY9b88M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738331464; c=relaxed/simple;
	bh=i5/PxM6BpFp735zXjwSxAuyz/3OjYTl5AW4EX03icco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hjksGvak49wGUzQlOajjBWWTevzI6soQNB4q21w7QofcMYWJ217MKV3hNxvXBvbGwPUKpAB57wFGTc43JIxiOrx3mQpRiaBng1A6eT9DmiTlo/1EVP6BTEp39is6OoHOzL8AuT20GddR9R+DxEId8b/xdx3cBtgM6AwBTc2duDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=PpKh1Iy4; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=EVsc4krd reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="PpKh1Iy4";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="EVsc4krd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738331461; x=1769867461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pGPC/hW5rIZq2gK7yDJbioksTlO1e7DjzYy5/dkDYdU=;
  b=PpKh1Iy4IQN4VknncQulU2msWHaUxjqfg6n/2eg/MUJfPlLrKNOGdCT6
   w5jeCRKGhJ/I4IX/GDSPbjwoi1pwsVNVzBKWXKs6Zjmc1fQMjbMsm6PfY
   Wx9KtAk2gQPoaehZ1AmEwA+A8hgV9p2U7SBRpZ2MgjRjZs2sebvkqvqdF
   eXrt7nQA9vOOywanF19wqxslDLVRb72eb/UKacVnMVtNXZ6iiiPbaqaky
   RCIpAh5UvC7jce8z9mqoMxKEVX/X4lT3N4shGEBv2JZ+oc5Rxq3kKWVZl
   2waMpn6fxRiFk/yRWq+6ODaN8tSH1WSS+A2OWZSJixGXd5s86h0qZQCjn
   A==;
X-CSE-ConnectionGUID: VPJl4Oi8QxuRrbOgBPYfKw==
X-CSE-MsgGUID: OkSFhy6DTdGm4UslsPUvag==
X-IronPort-AV: E=Sophos;i="6.13,248,1732575600"; 
   d="scan'208";a="41406883"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 31 Jan 2025 14:50:52 +0100
X-CheckPoint: {679CD53C-1A-9B2B6168-EB6F31C5}
X-MAIL-CPID: 34B68224B8FC38765AC27969C122FFD7_5
X-Control-Analysis: str=0001.0A682F21.679CD53C.0098,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6628516B72B;
	Fri, 31 Jan 2025 14:50:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738331448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGPC/hW5rIZq2gK7yDJbioksTlO1e7DjzYy5/dkDYdU=;
	b=EVsc4krdjIMtoDa0hRHx1mKilyp25g9YTglPKr9VfffkrxA40Ccm8NQuxhWl30vKnRXuoP
	ab3NHzUAB0LkHuMtwjOlh1Sxg+tDPDoJ4gjOkXA7LGRilx59MNf59ropLqwcI4VRR+qvll
	Cjj7llTIJrf7cwoz5FX3+Ca9fmeqGT0IuUoZAPi0o/nbeoAJbhNYgl0mnStE2vA/FGSl4x
	sDrURZAkbblN0ctVutb8j+wUsHWjDQw0c3zxLSk0GIXFwxZ0hylHWxN3Ou36bQg4f5w1Hf
	jH5ZfcYh4HBqw52MAFH4UN2vh6qxs3R46gzXyQH6d6BxvgYtQ/C/vNJS3WtHpQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] nvmem: imx-ocotp: Support accessing controller for i.MX8M Nano
Date: Fri, 31 Jan 2025 14:50:46 +0100
Message-ID: <4989387.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <deef6dcd-27a0-4109-9788-a755fd390f55@kernel.org>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com> <20250130130101.1040824-4-alexander.stein@ew.tq-group.com> <deef6dcd-27a0-4109-9788-a755fd390f55@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Freitag, 31. Januar 2025, 08:20:40 CET schrieb Krzysztof Kozlowski:
> On 30/01/2025 14:01, Alexander Stein wrote:
> > +
> > +static int imx_ocotp_grant_access(struct ocotp_priv *priv, struct devi=
ce_node *parent)
> > +{
> > +	struct device *dev =3D priv->dev;
> > +
> > +	for_each_available_child_of_node_scoped(parent, child) {
> > +		struct of_phandle_args args;
> > +		u32 id, idx =3D 0;
> > +
> > +		while (!of_parse_phandle_with_args(child, "access-controllers",
> > +						   "#access-controller-cells",
> > +						   idx++, &args)) {
> > +			of_node_put(args.np);
> > +			if (args.np !=3D dev->of_node)
>=20
> You are using args.np after dropping the reference.

Indeed, but is it really a problem? The args.np pointer is still the same.
So the comparison is unaffected.

Both branches need to drop the reference, no?
But the following looks awefull as well.
> if (args.np !=3D dev->of_node) {
> 	of_node_put(args.np);
> 	continue;
> }
> of_node_put(args.np);

Best regards,
Alexander

>=20
> > +				continue;
> > +
> > +			/* Only support one cell */
> > +			if (args.args_count !=3D 1) {
> > +				dev_err(dev, "wrong args count\n");
> > +				continue;
> > +			}
> > +
>=20
>=20
> Best regards,
> Krzysztof
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


