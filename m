Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD541F0E3A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510892; cv=none; b=PvFVKj1X2QfN9SfiMXWdH4M9y50P4N/jMwtO7PeIlVddXeJ8rr3MPgfIuFCMRHpsheMSVrODzvqivjgQvz4ivdp1PImub156o9NtTICUzlHCYVT+gX/sy/DCCh9roQShhj8untLOXoG1TpCY4J8FNrkzpJ70OUI7kW6Di0Cz40w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510892; c=relaxed/simple;
	bh=VEaRDqyDtJkimhCoGryHOz5n52bnkCWw+iDYB3KM1rE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BB37mytubH8AfFNN260fieQXouOJ0jxR9KOuvEo5shJ57XZ3C9FS7fk6rh1cNAFGc3056sLT2XoWK4pUo37lr5lhfi2Tfiym/rG5v/RuilwnlfBA+z+EDRO/AELEQPFbkUJ8s4L4Zi0lDw/kJY17GDDGBy6GtwDYDd53H1HjR8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=T+3/vF3B; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="T+3/vF3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1743510888;
	bh=VEaRDqyDtJkimhCoGryHOz5n52bnkCWw+iDYB3KM1rE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=T+3/vF3BMizRLMfkXws9EWGyu1uSGndtShkJotqFGA6cRlavaZepCLMk+YVZiZ8Cr
	 mztTE9WPmFG0P8Kyk8Y8ivj6y72nTvb4OpcnqLvlIK9oVCAsNIZtz8yI9wPXkFeu8M
	 v8kPjJ3sEZXLk3ZZ51nZ65k2aM+IgfgDEzZJEWMI=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 7F247659C8;
	Tue,  1 Apr 2025 08:34:47 -0400 (EDT)
Message-ID: <92d0a120d3303243d7bd72188c4f5974f525975a.camel@xry111.site>
Subject: Re: [PATCH] arm64: Add overrride for MPAM
From: Xi Ruoyao <xry111@xry111.site>
To: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, James Morse
	 <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Shameer Kolothum
	 <shameerali.kolothum.thodi@huawei.com>, Mingcong Bai <jeffbai@aosc.io>
Date: Tue, 01 Apr 2025 20:34:43 +0800
In-Reply-To: <87plhwytgf.wl-maz@kernel.org>
References: <20250401055650.22542-1-xry111@xry111.site>
		<409f6d27-3efe-4c45-8319-d360ded80f16@arm.com>
		<46ed31b37b4b92720b26be66f3e6366a714024cf.camel@xry111.site>
	 <87plhwytgf.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-04-01 at 13:09 +0100, Marc Zyngier wrote:
> On Tue, 01 Apr 2025 12:47:03 +0100,
> Xi Ruoyao <xry111@xry111.site> wrote:
> >=20
> > On Tue, 2025-04-01 at 14:04 +0530, Anshuman Khandual wrote:
> > > On 4/1/25 11:26, Xi Ruoyao wrote:
> > > > As the message of the commit 09e6b306f3ba ("arm64: cpufeature: disc=
over
> > > > CPU support for MPAM") already states, if a buggy firmware fails to
> > > > either enable MPAM or emulate the trap as if it were disabled, the
> > > > kernel will just fail to boot.=C2=A0 While upgrading the firmware s=
hould be
> > > > the best solution, we have some hardware of which the vender have m=
ade
> > > > no response 2 months after we requested a firmware update.=C2=A0 Al=
low
> > > > overriding it so our devices don't become some e-waste.
> > >=20
> > > There could be similar problems, where firmware might not enable arch
> > > features as required. Just wondering if there is a platform policy in
> > > place for enabling id-reg overrides for working around such scenarios
> > > to prevent a kernel crash etc ?
> >=20
> > In https://lore.kernel.org/all/87jzcfsuep.wl-maz@kernel.org/:
> >=20
> > =C2=A0=C2=A0 > For such cases, when MPAM is incorrectly advertised, can=
 we have kernel
> > =C2=A0=C2=A0 > command line parameter like mpam=3D0 to override it's de=
tection?
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 We could, but only when we can confirm what the problem is=
.
> >=20
> > And there was prior arts like:
> >=20
> > commit 892f7237b3ffb090f1b1f1e55fe7c50664405aed
> > Author: Marc Zyngier <maz@kernel.org>
> > Date:=C2=A0=C2=A0 Wed Jul 20 11:52:19 2022 +0100
> >=20
> > =C2=A0=C2=A0=C2=A0 arm64: Delay initialisation of cpuinfo_arm64::reg_{z=
cr,smcr}
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 Even if we are now able to tell the kernel to avoid =
exposing SVE/SME
> > =C2=A0=C2=A0=C2=A0 from the command line, we still have a couple of pla=
ces where we
> > =C2=A0=C2=A0=C2=A0 unconditionally access the ZCR_EL1 (resp. SMCR_EL1) =
registers.
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 On systems with broken firmwares, this results in a =
crash even if
> > =C2=A0=C2=A0=C2=A0 arm64.nosve (resp. arm64.nosme) was passed on the co=
mmand-line.
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 To avoid this, only update cpuinfo_arm64::reg_{zcr,s=
mcr} once
> > =C2=A0=C2=A0=C2=A0 we have computed the sanitised version for the corre=
sponding
> > =C2=A0=C2=A0=C2=A0 feature registers (ID_AA64PFR0 for SVE, and ID_AA64P=
FR1 for
> > =C2=A0=C2=A0=C2=A0 SME). This results in some minor refactoring.
>=20
> That particular patch has caused quite a few issues, see d3c7c48d004f.
> So don't use it as a reference.
>=20
> Now, while I think an option is probably acceptable in the face of an
> unresponsive vendor, I don't think the way you implement it is the
> correct approach.
>=20
> It should be possible to handle the override in the assembly code,
> like we do for other bits and pieces, and deal with MPAMIDR_EL1 later
> down the line, once the sanitised ID registers are known to be valid.

Ok I'll try it.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
