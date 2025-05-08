Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2F66F073
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746691664; cv=none; b=QELdeSFCIxxXp3mUSuy98Ijg5TWxB04ZR6YN13OqUMlViYzZT7Nfr7ad1Dz9oLAjsacJr+6n6KJLyDI+SZRn4fLGqD8hh49oKYHx91MLELBG94f1sERB6O4+Yog52E6HkY6Xnx8uXtn1/+iaFbl4OmM2AkOkZou7urQ7p035e9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746691664; c=relaxed/simple;
	bh=VvJyVgfwE/tf2nM/arkeHG8DCYPZCnFmpe2XLdCrC7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Npruzs9gcOgEj8haOcdAhXqrUsSTSSG+DdKbQMQEO7HAM1raTzr7c0fTY8Z7U6Ovofw0Ci4UFJQAFhIBYtqQV3E0u8hTwJZ+mDGKRil5ojlpgiVdfzFlzPkgFLbiG4xxpmGJnmL6vtKZ/MZUhiW1pqZyklXRVHDdjcIeYfcnDK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=MXoXnw+s; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=YIElGG9t reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="MXoXnw+s";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="YIElGG9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746691661; x=1778227661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VvJyVgfwE/tf2nM/arkeHG8DCYPZCnFmpe2XLdCrC7A=;
  b=MXoXnw+sMy4gwRu6TFIrKRkvGuSO+suqFHfTEVTOwM/U1d+SjL2K53M3
   NvI7qdeDtjoljzHwKTZO/bkQrlU27/AoNM0u2yclACDNouNIv2z6bDw8u
   myREWJrzKNkYev4R+YRvqwWLaI4PUp6dKZi2HeQuTAQFAlcJ98nDQGrsF
   W+Gnh6ILJxR3b+N/5YcjKpby3o6Z0v5GHz5QWqIo+98W7nJ6eIQO8TNRx
   A4/9RmUUnx3n7FsT9qwPNOvG9FWld+bHKCFZJusFqSHjV+J2nz6+zAtB8
   YSW0b87Gih4eJOqC5FuWHlPS5ALProVLuSrsVVOPfU19f18Rah47PVNBB
   A==;
X-CSE-ConnectionGUID: /Ws5gQ/3TvilkfRlpMhvfg==
X-CSE-MsgGUID: wmq3LZIoTQyzYU0idt8Iag==
X-IronPort-AV: E=Sophos;i="6.15,271,1739833200"; 
   d="scan'208";a="43954413"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 May 2025 10:07:37 +0200
X-CheckPoint: {681C6649-29-45F3AE15-E90F7DFA}
X-MAIL-CPID: D73B9C706E3199116FADD3609FEEBAFF_5
X-Control-Analysis: str=0001.0A006397.681C664B.007D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57469163F01;
	Thu,  8 May 2025 10:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746691653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvJyVgfwE/tf2nM/arkeHG8DCYPZCnFmpe2XLdCrC7A=;
	b=YIElGG9tOSf2sQm9x2MY4rRj808ZLuGpYNcjuuWV87kPfDdkUN9n+YPiQMilp5DVMngDeT
	Im7/Xkc2J0QUZ4Y7+st8iGeyNLN0AOwblOxZ1nyXuN8ZYYsQvTUJp0vKEIolnkyr5aPlsS
	7mcBiNut12c8Uus8N7ZctNdlPb3p3pSlL5kgzBS/DMpAPwWD/++KIPduBhongFKEO1m767
	KVIo0UJP/uSMICrpV5PYxosl5Lc5+vMnC1iwYnVjZeHGpECzEtXSHOB8hesipWinbPa2/L
	IrSgMeKDRhfvkZ+RTszSxJKJKZwolwH7dH9mEWOyti0m3hAGIk62gp8PJnvpvA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
Date: Thu, 08 May 2025 10:07:27 +0200
Message-ID: <7023673.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <87ikmby52x.fsf@geanix.com>
References:
 <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
 <8259306.DvuYhMxLoT@steina-w> <87ikmby52x.fsf@geanix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Esben,

Am Donnerstag, 8. Mai 2025, 08:44:22 CEST schrieb Esben Haabendal:
> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>=20
> > Hi Stefan,
> >
> > Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
> >> Hi Alexander,
> >>
> >> [add Shawn and Esben]
> >>
> >> Am 07.05.25 um 14:44 schrieb Alexander Stein:
> >> > Select PINCTRL for NXP i.MX SoCs.
> >> could you please explain the motivation behind your change?
> >>
> >> Is it related to this commit 17d21001891402 ("ARM: imx: Allow user to
> >> disable pinctrl")?
> >
> > Ah, thanks for the pointer. It might be the case.
>=20
> The goal of the patch mentioned above was to be able to build a kernel
> for LS1021A without pinctrl framework enabled, as LS1021A does not have
> a pinctrl driver.
>=20
> With your patch, that would not be possible anymore.

Why? LS1021A is arm, not arm64 which this patch is touching only.

BTW: Commit b77bd3ba762f3 ("ARM: imx: Re-introduce the PINCTRL selection")
is actually doing the same for arm as there is some fallout from
17d21001891402.

> > I noticed that, when using arch/arm64/defconfig and disabling all
> > platforms despite ARCH_MXC before running make olddefconfig,
> > CONFIG_PINCTRL gets disabled as well. No platform is enabling it. I
> > noticed this when building in yocto and non-IMX platforms are disabled
> > for build time reasons.
>=20
> But is that something that needs to be fixed?
>=20
> It sounds like quite a special use-case, and why not simply enable
> CONFIG_PINCTRL in that case then?

PINCTRL is crucial for any SoC to even boot, so this is an option which has
to be set if that platform is enabled.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


