Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934844C92
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710296; cv=none; b=NRuHpQKUUd3XhLVUirD++XjX6AOoGKoeLZJFaYcR6ljPPeruLYRmTc5aJ4a0FV5xYfbd4ncIW4u9tgFlgiLQ715jxcqx/ivRibOSV2litjL5Du4nvHTLKezChwO8tQOV4dfQsEp51TmlJsfUqR7NDoni1eRe3Y22+Jv2+Wubs7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710296; c=relaxed/simple;
	bh=MSKi6HVp57FER7oekvaq/37trOD/ciVYt389Jyo3OlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gkp09c4rvVGk5Pr8WC6jQm3fBbawYadfS1Eu7ObKOM7OqrhSTnIl6xfWQV+1aMerLa5t+ntDX/qoHqlyrZbBjTwO81q1jGWmeBIoV4cb5iHWfiiEneKQWGYIXeVYRJGCZuvpc8nGZUrPPQqdxSS+VeGQ+DRERa3xRKEGwJp8HZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=OXS7Xy6V; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=aWA2k+AZ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="OXS7Xy6V";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="aWA2k+AZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746710292; x=1778246292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=POjYqgXRwbYBAO0i/Vef4iBDO4ORLm/SUKYKwW4Piz8=;
  b=OXS7Xy6VJMRdm/0CMDTASAFvi3i3GQ3CkH5vAH/Ga7VOSixU07ftsG9w
   2IGoUku4Lpaf4gboUOXHBE/Y+6lpOIrNfZAyZ2wsYEAJXd7qWCoXrQ+OY
   IxqqXDbx65vEASg1bd8U4tp8Tx2EBpB3Sdl2qvzj76hE3fvnVOXkc8UQc
   3Li2un18ur6mCvQETIoWWaY+Myw4vWfxXaUC46NGIghxNp6qMOELVaQIn
   eUKYiNfnlc8RVtVjLzKuvsxbaok9qyGhYW3l/rkkfmG34/r1rhl1N//im
   zBxe+0w42uApzRhg9cq2162+TpjpQdff1qWobM1pBeTySCyotgQPy5O8C
   A==;
X-CSE-ConnectionGUID: 6NI85Ig4TOyf0qRk8pnm9w==
X-CSE-MsgGUID: lEc3wvynRw+11SJ8/K/fRg==
X-IronPort-AV: E=Sophos;i="6.15,272,1739833200"; 
   d="scan'208";a="43963318"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 May 2025 15:18:09 +0200
X-CheckPoint: {681CAF11-22-45F3AE15-E90F7DFA}
X-MAIL-CPID: 716EA28B452B08A8085D4D6410096CC6_5
X-Control-Analysis: str=0001.0A006377.681CAF12.000A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FD45160A07;
	Thu,  8 May 2025 15:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746710285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POjYqgXRwbYBAO0i/Vef4iBDO4ORLm/SUKYKwW4Piz8=;
	b=aWA2k+AZ0JpTpW02HhdxQEthPrktKgGw0y+Gaio5PblfqZlJE0DPipM+e0Bg1wC9j/HF9b
	qt9gg/LIq3to/iaNvpE0SI9M9SVKvktDhqd5Qk34tLL0A3cwnYelqKc0Tj2JhFb5DTGOTB
	4Sl5pFY3wGSCy9gR7UUDLZepuspTlfIkdOCNc2zZpgiSKLs2PhIlZh2Mvn9PyTixcj6KYB
	YrhmCVvlLZGk0WK4XOUxLvf+ya58/mceqf/X60mQcf6Ajh5wR1QHCrbGmxPUiSIVXXbGEL
	3zG6T1kTkNITdtEX4NeyH4SOVl6aLBvCcxsYihjiqXjfrJOBV7DlhHf0t4J/Cw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
Date: Thu, 08 May 2025 15:18:04 +0200
Message-ID: <6002097.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <87a57nxogy.fsf@geanix.com>
References:
 <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
 <5724399.aeNJFYEL58@steina-w> <87a57nxogy.fsf@geanix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Donnerstag, 8. Mai 2025, 14:43:09 CEST schrieb Esben Haabendal:
> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>=20
> > Hi Esben,
> >
> > Am Donnerstag, 8. Mai 2025, 10:18:35 CEST schrieb Esben Haabendal:
> >> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
> >>
> >> > Hi Esben,
> >> >
> >> > Am Donnerstag, 8. Mai 2025, 08:44:22 CEST schrieb Esben Haabendal:
> >> >> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
> >> >>
> >> >> > Hi Stefan,
> >> >> >
> >> >> > Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
> >> >> >> Hi Alexander,
> >> >> >>
> >> >> >> [add Shawn and Esben]
> >> >> >>
> >> >> >> Am 07.05.25 um 14:44 schrieb Alexander Stein:
> >> >> >> > Select PINCTRL for NXP i.MX SoCs.
> >> >> >> could you please explain the motivation behind your change?
> >> >> >>
> >> >> >> Is it related to this commit 17d21001891402 ("ARM: imx: Allow us=
er to
> >> >> >> disable pinctrl")?
> >> >> >
> >> >> > Ah, thanks for the pointer. It might be the case.
> >> >>
> >> >> The goal of the patch mentioned above was to be able to build a ker=
nel
> >> >> for LS1021A without pinctrl framework enabled, as LS1021A does not =
have
> >> >> a pinctrl driver.
> >> >>
> >> >> With your patch, that would not be possible anymore.
> >> >
> >> > Why? LS1021A is arm, not arm64 which this patch is touching only.
> >>
> >> Good point :)  Sorry about that.
> >>
> >> > BTW: Commit b77bd3ba762f3 ("ARM: imx: Re-introduce the PINCTRL selec=
tion")
> >> > is actually doing the same for arm as there is some fallout from
> >> > 17d21001891402.
> >> >
> >> >> > I noticed that, when using arch/arm64/defconfig and disabling all
> >> >> > platforms despite ARCH_MXC before running make olddefconfig,
> >> >> > CONFIG_PINCTRL gets disabled as well. No platform is enabling it.=
 I
> >> >> > noticed this when building in yocto and non-IMX platforms are dis=
abled
> >> >> > for build time reasons.
> >> >>
> >> >> But is that something that needs to be fixed?
> >> >>
> >> >> It sounds like quite a special use-case, and why not simply enable
> >> >> CONFIG_PINCTRL in that case then?
> >> >
> >> > PINCTRL is crucial for any SoC to even boot, so this is an option wh=
ich has
> >> > to be set if that platform is enabled.
> >>
> >> Yes, but PINCTRL (framework) does not by itself do anything meaningful.
> >> You need the correct pinctrl driver.
> >>
> >> Making the various SOC's select the corresponding pinctrl drivers makes
> >> sense if it is required for booting under all circumstances. And this
> >> should then indirectly enable/select PINCTRL and anything else needed
> >> for that driver.
> >
> > If you prefer I don't mind enabling PINCTRL and the SoC-specific driver
> > (e.g. PINCTRL_IMX8MP) depending on each SoC-support, e.g. SOC_IMX35 or
> > SOC_IMX8M.
>=20
> For SOC_IMX35, it should be selected by default.
>=20
>     config PINCTRL_IMX35
>             bool "IMX35 pinctrl driver"
>             depends on OF
>             depends on SOC_IMX35 || COMPILE_TEST
>             default SOC_IMX35
>=20
> For the IMX8M* SoC's, that is not done, as there is only a common
> SOC_IMX8M config entry, which corresponds to multiple pinctrl drivers,
> which we probably don't want to select all of by default.

Well, is the SoC support is enabled, it makes totally sense to enable a
crucial driver like pinctrl by default. It's still deselectable after all.

> >> Having ARCH_MXC select PINCTRL as such is mostly pointless IMHO.
> >> Enabling a driver framework without enabling any drivers for it, when
> >> building a kernel where no SOC's requiring any pinctrl drivers is kind
> >> of weird. If you want to do that, why not simply enable both ARCH_MXC
> >> and PINCTRL in your yocto recipe?
> >
> > PINCTRL is currently only enabled because other SoCs happen to enable i=
t,
> > just this feels just plain wrong. If these platforms are disabled or
> > removed for whatever reason, the other platforms should still work.
>=20
> As it is now, to build for let's say i.MX 8M Plus, you have to enable
>     SOC_IMX8M
>     PINCTRL_IMX8MP
> to get a kernel that is likely to boot.

Both SOC_IMX8M and SOC_IMX9 are enabled by default if ARCH_MXC is enabled
too, even though you might not want to use both SoC families.

> If you enable
>     SOC_IMX8M
>     PINCTRL
> but not
>     PINCTRL_IMX8MP
> you won't have pinctrl support, and the kernel will probably not work as
> expected.
>=20
> What am I missing?

PINCTRL is not enabled bydefault if only ARCH_MXC is enabled. It just happe=
ns
that defconfig enables other platforms which in turn enable PINCTRL.
If you prefer to explicitely enable CONFIG_PINCTRL=3Dy in defconfig
I'm fine with that as well.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


