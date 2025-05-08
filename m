Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0A586323
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683596; cv=none; b=DybLJiKxjOZVkFvPgJ9End22IKIeWjnpXbpqjHPPCZ5yEOZY19cfI9kSMsXZ8etT1ffTGnW7Xe0mSOXpFFCBhEsNpnKOcfj4adYehgnae6HvcvjrumcvExdczZiZruUfKUs/wdSVzqB1X7nm085q5JCMltoqzEs0wSPjRdrMSkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683596; c=relaxed/simple;
	bh=ub2iVlb4SHKAW5jPjSlFRvkrNnm7zCxFEv3lOgzebyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sZgqCaj6HQnacsyJgpJhOGVarMr1wvTLkpNAZcE0CWKIwz7YKiDk3Qs/eJMdOtprkU1Xhmvl7CD3pTXLPIAv1juPVVV8CRYjaEyrO71iMvkbPy6WlKSMKFMG0eKcthFppYG2pn1qh0FZiRz1YJkdd8O/gSpR7F+WiLJzXKx/fC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=qRyc2OxS; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Sd5BdEik reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="qRyc2OxS";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Sd5BdEik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746683593; x=1778219593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+EhF6K8iP9mfpQBTanjU88sfd+KY8wpvCiD31HubBpA=;
  b=qRyc2OxSLZi+LouVn9qT4rguAi5L9LYDXwTRc9dSGR4niih8l9H50+pC
   /X6Vq2BMbH2s1ncfFeVeA7+Sb9AecTEkJyqqsDs6ARxmPtkQR4bunPqSx
   ry68C759f461ad0ZJOdvBtFrrEpetRTfVjAB4+zkmaeyBtQSMc3+9mjU5
   jRiOzvk0OwtwiwvukuGIlmvVes8Gq+eJ4zx33ZdO0RN/bViT/QVYM4c7i
   HysacnbBPGBS7yNqvDy2jJCVR7HR8sp5+NtkBLun1FwDmjhRuTq6cnViw
   J/kUlIM2NtuEE5pqFrsw+dViwZQIqG8hp1WJlKUVJbji9LtiYFCFKnmvu
   A==;
X-CSE-ConnectionGUID: xbpkzIP9R/qC6etNh8IRJA==
X-CSE-MsgGUID: xnb0ZSFgTwGbn6c0RXGptw==
X-IronPort-AV: E=Sophos;i="6.15,271,1739833200"; 
   d="scan'208";a="43949933"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 May 2025 07:53:04 +0200
X-CheckPoint: {681C46BF-47-C7E25413-F4312D34}
X-MAIL-CPID: 66C688438851F16310F03349BE687D8C_4
X-Control-Analysis: str=0001.0A006376.681C46D2.0053,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D59C3160024;
	Thu,  8 May 2025 07:52:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746683579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EhF6K8iP9mfpQBTanjU88sfd+KY8wpvCiD31HubBpA=;
	b=Sd5BdEikxwjpfFOj5IDvtC61NMJMYM5wDSpY2TWONg2qb7ny0tda0jQ0U/BEhlxRGGE+7P
	XW/dv833vlG0UHzsmvAcUnjVXkRfzUhoVaEkfVn/k1K4pxnYrajjYvE4BfbLXIolmes41a
	EaK2z8Y2c+lh0Xce+PTj7Uv/U3zROYrdbqviMh+I5QvCkaK0W+6HunIBhdj7N9l/pPNHOm
	EKQ5Vd8mojrABJIElm/eMihNfWj+gWIJzSrXIISS0qU7vUA2NN2sYjhW/dlStAPG+190dY
	s9XMiITFk/nPaD9XI097goS2FMZ0E+i2eYFn+yHMmdeWVWqO9QTObi+GbsIpxA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Esben Haabendal <esben@geanix.com>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
Date: Thu, 08 May 2025 07:52:58 +0200
Message-ID: <8259306.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <5af33290-e7d8-437c-a22f-5b873596d67a@gmx.net>
References:
 <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
 <5af33290-e7d8-437c-a22f-5b873596d67a@gmx.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Stefan,

Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
> Hi Alexander,
>=20
> [add Shawn and Esben]
>=20
> Am 07.05.25 um 14:44 schrieb Alexander Stein:
> > Select PINCTRL for NXP i.MX SoCs.
> could you please explain the motivation behind your change?
>=20
> Is it related to this commit 17d21001891402 ("ARM: imx: Allow user to=20
> disable pinctrl")?

Ah, thanks for the pointer. It might be the case. I noticed that, when
using arch/arm64/defconfig and disabling all platforms despite ARCH_MXC
before running make olddefconfig, CONFIG_PINCTRL gets disabled as well.
No platform is enabling it. I noticed this when building in yocto and
non-IMX platforms are disabled for build time reasons.

Best regards,
Alexader

> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >   arch/arm64/Kconfig.platforms | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> > index a541bb029aa4e..49c3bc25e5f68 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -219,6 +219,7 @@ config ARCH_MXC
> >   	select ARM64_ERRATUM_845719 if COMPAT
> >   	select IMX_GPCV2
> >   	select IMX_GPCV2_PM_DOMAINS
> > +	select PINCTRL
> >   	select PM
> >   	select PM_GENERIC_DOMAINS
> >   	select SOC_BUS
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


