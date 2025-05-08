Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA67223DDA
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707158; cv=none; b=ta+ATRow8KKN+1tflKoX5S+MPmvo4lYhOFubLRDimPrEKC5HR2V70y2K2Rde5hLorLlPAUGltfWd9UxfzkQ+lweEfUQIwGOEBpJFeWSvdhgB0LearqHsbv7/atH2edlT/POfvUMGrUtdBH4kAvu+1rOnhp30d1Ri7k5h+KWecn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707158; c=relaxed/simple;
	bh=4Wuc/P9mUch6ODmF/VyZwbyyPMSwd47tldN+ugpP5m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oGWAEVzKT3Hy92SgVaHAL9h8yzYmwouBskXokm+Dj+Stw70ZDr0xXtvlXcDQ7t8y/aiq0+wbiBMmZMRrB6sucHTTzbRUBQH49ggxiIphvlqe1mgi1E5Wxp4RiVvbB6wbU/6/Pe7QRpRS80TnKmueaB+joLXiEEv9BaIfQqrQ3IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=S4dwas3c; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Az+GZTnJ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="S4dwas3c";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Az+GZTnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746707154; x=1778243154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iazNB0ru7xiYzMbvmWPsjBe7wXldlYA4oQHJzMndgtk=;
  b=S4dwas3cdLE0hhw0Rso18gELS7Muy0mLripYGvSrvhBeT2SrPeCw+KaL
   NZhATQINBnEJobv7d8DXuC+hWSovnF70psCkXvzE+zPbtZnsOGWh0mhyL
   iZutWb5wP6VxfmVchhWHW/C1IibuKiRGzdy9wMxQzne49EFjf80dSSbN8
   Z5+XxDe3YiG6/pxTUXUhc2ECnQ0LMT7ISv/Uwg3ehqK5t5ifdd07jgzON
   Coy/eEpGAz5l7F8APQKQ4+6JABHyB9hN0/qsTgp2/mtzbL9ZQ8f0897Ht
   66cgowWehyksOmAGRCClcfPV5tAzBDU7dA+nTJn/rZyJSCAZuo09EcaEC
   A==;
X-CSE-ConnectionGUID: Hs9Xg0CLRzKT52w3yTw6mw==
X-CSE-MsgGUID: 7jHM8xN9Q229D6e6YN8zPA==
X-IronPort-AV: E=Sophos;i="6.15,272,1739833200"; 
   d="scan'208";a="43961769"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 May 2025 14:25:50 +0200
X-CheckPoint: {681CA2CE-A-BF62DDF1-CB8BF55F}
X-MAIL-CPID: 0F9D536A0AAB13CF6862A92CB39405EA_1
X-Control-Analysis: str=0001.0A00639F.681CA2D1.007A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 687A2161554;
	Thu,  8 May 2025 14:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746707145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iazNB0ru7xiYzMbvmWPsjBe7wXldlYA4oQHJzMndgtk=;
	b=Az+GZTnJmysGwF3eHtTA+X6IURuBK/lQ4cB6+o89SVM/HDGejsNwSHjWl2zryRtgu4KMyz
	q6OWQzz37I3s0ADm5CP+q/moDBg2ZtDFPq++cDel5CB62/qvCgy3t18kIjJNu1Nom9LV+e
	KtUDHGyMexklde//R3LeGhWdHlz448V0lQ9434Hu8mSY7NEOBCe4VkhNWyjTj70Z+mDC7i
	UScO8QlIS/gNpEGG07Z5gXEdLJYZCutZUqQMCK8huz5Zg2EHlSvo1YNBMq0aboICG97cwl
	vS3R2LJUy2ieZ/9yobaRitbrqC5Eyiey8lbwIRfXLkl1ZCNlbdF1X+/cKZVQDA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
Date: Thu, 08 May 2025 14:25:44 +0200
Message-ID: <5724399.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <87ecwzy0pw.fsf@geanix.com>
References:
 <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
 <7023673.LvFx2qVVIh@steina-w> <87ecwzy0pw.fsf@geanix.com>
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

Am Donnerstag, 8. Mai 2025, 10:18:35 CEST schrieb Esben Haabendal:
> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>=20
> > Hi Esben,
> >
> > Am Donnerstag, 8. Mai 2025, 08:44:22 CEST schrieb Esben Haabendal:
> >> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
> >>
> >> > Hi Stefan,
> >> >
> >> > Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
> >> >> Hi Alexander,
> >> >>
> >> >> [add Shawn and Esben]
> >> >>
> >> >> Am 07.05.25 um 14:44 schrieb Alexander Stein:
> >> >> > Select PINCTRL for NXP i.MX SoCs.
> >> >> could you please explain the motivation behind your change?
> >> >>
> >> >> Is it related to this commit 17d21001891402 ("ARM: imx: Allow user =
to
> >> >> disable pinctrl")?
> >> >
> >> > Ah, thanks for the pointer. It might be the case.
> >>
> >> The goal of the patch mentioned above was to be able to build a kernel
> >> for LS1021A without pinctrl framework enabled, as LS1021A does not have
> >> a pinctrl driver.
> >>
> >> With your patch, that would not be possible anymore.
> >
> > Why? LS1021A is arm, not arm64 which this patch is touching only.
>=20
> Good point :)  Sorry about that.
>=20
> > BTW: Commit b77bd3ba762f3 ("ARM: imx: Re-introduce the PINCTRL selectio=
n")
> > is actually doing the same for arm as there is some fallout from
> > 17d21001891402.
> >
> >> > I noticed that, when using arch/arm64/defconfig and disabling all
> >> > platforms despite ARCH_MXC before running make olddefconfig,
> >> > CONFIG_PINCTRL gets disabled as well. No platform is enabling it. I
> >> > noticed this when building in yocto and non-IMX platforms are disabl=
ed
> >> > for build time reasons.
> >>
> >> But is that something that needs to be fixed?
> >>
> >> It sounds like quite a special use-case, and why not simply enable
> >> CONFIG_PINCTRL in that case then?
> >
> > PINCTRL is crucial for any SoC to even boot, so this is an option which=
 has
> > to be set if that platform is enabled.
>=20
> Yes, but PINCTRL (framework) does not by itself do anything meaningful.
> You need the correct pinctrl driver.
>=20
> Making the various SOC's select the corresponding pinctrl drivers makes
> sense if it is required for booting under all circumstances. And this
> should then indirectly enable/select PINCTRL and anything else needed
> for that driver.

If you prefer I don't mind enabling PINCTRL and the SoC-specific driver
(e.g. PINCTRL_IMX8MP) depending on each SoC-support, e.g. SOC_IMX35 or
SOC_IMX8M.

> Having ARCH_MXC select PINCTRL as such is mostly pointless IMHO.
> Enabling a driver framework without enabling any drivers for it, when
> building a kernel where no SOC's requiring any pinctrl drivers is kind
> of weird. If you want to do that, why not simply enable both ARCH_MXC
> and PINCTRL in your yocto recipe?

PINCTRL is currently only enabled because other SoCs happen to enable it,
just this feels just plain wrong. If these platforms are disabled or
removed for whatever reason, the other platforms should still work.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


