Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1405524B26
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749114595; cv=none; b=buE6lxb21xBtbNXgR1w8QGgdm0VKkKf35jl2zBcah4SBt1n2+MDnVEP7k7LAoyEp0/LTsp0QkK/GjSpogsd62dOGzSvQd1l9K1q4t/cN/VA0Po7WrD3wwXK5mC3e51BBJt+HmntkNgnbVcZn8Z64pfYzmIn18PgTER14kgALD9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749114595; c=relaxed/simple;
	bh=mCjoWuebx0PcOzpCw0gCTN1krlJxno2MJhT6o6KwSBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cozNrZV4fsYKFbcPclqXqSL9RAJEuEgAfBSA1hCSMoLz+VwhyHb7OfPqw1xwBI38PPVTA7HDXPJnq9AtQsYH273aYvuNaJOuI/4IQW++vMrfCS7GxC0QadTZbNIdgBFJIrgi5M1vRxPu70ihdFqamfK5QO4PKjIRcEeY7XtO0ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=CzvpafTi; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="CzvpafTi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lFnyGKQ7Q02jzZZRwr2jhT5wRGgubTJQ4Txgj4rRdXk=; b=CzvpafTiANrBOYf19hZC6hi4+2
	zIqokCGc9Cn122UvFJQfWbQ0lZTZMVKIBluLPtzoR9/rKiQ5rzzGc1av0IiRfCOdmbuPNkMYexNUT
	gY7PLGbRQ7Hf+GLrxAZO8afgkh4IBqlnVPcMpDPdpYqWPk5UNmaA0mDrx8TWlrkc8qhI3Fcksn4HX
	MvTvNoEGXhYlbyvbYVNElqlNDRaF/evraHwa1ubuKPwJed47fVYLSWjTJK51rUU9taBYBymGVpKaT
	8sSFndxV4G7RjeT3BpyqsfFYzy1FayQb/LM0KdX/Yh2WgxD14aAt29x2CmTfpNHrZViC8rUzCpUPS
	7qnVOt+g==;
Received: from i53875ad6.versanet.de ([83.135.90.214] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uN6bU-0002kI-RQ; Thu, 05 Jun 2025 11:09:40 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: jonas@kwiboo.se, dsimic@manjaro.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm64: dts: rockchip: add regulator-enable-ramp-delay to
 RK860-2/-3 regulators
Date: Thu, 05 Jun 2025 11:09:40 +0200
Message-ID: <49977521.MN2xkq1pzW@diego>
In-Reply-To: <e4a1bf0a-0fc5-4c15-96dc-7e9c7ae3ccd5@cherry.de>
References:
 <20250604202425.239924-1-heiko@sntech.de>
 <e4a1bf0a-0fc5-4c15-96dc-7e9c7ae3ccd5@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 5. Juni 2025, 10:57:13 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Quentin Schulz:
> Hi Heiko,
>=20
> On 6/4/25 10:24 PM, Heiko Stuebner wrote:
> > The RK860-2/-3 regulators are used on rk3588 boards to supply components
> > like the big cpu-clusters and npu individually.
> >=20
> > Most of these things will be, and in fact most regulator nodes right no=
w are,
> > always-on - probably nobody has tried completely turning of the big clu=
sters
> > for example.
> >=20
>=20
> This is a bit of a confusing wording here. If most things will be (and=20
> are) always-on, then the ramp-up typically shouldn't be an issue I=20
> assume? I'm not too familiar with the regulator subsystem but I guess=20
> for the first initial enable this could be an issue?

The regulators normally are all boot-on, so we normally start with all
of them running. But I'll try to improve the wording overall :-) .

> > This changed with the new NPU driver, which does combined runtime-suspe=
nds
> > with the regulator being tied to the power-domain (it supplies the pd).
> >=20
> > If the NPU runtime-suspends while running a load and then starts again
> > hangs can be observed with messages like
> >=20
> >    rockchip-pm-domain fd8d8000.power-management:power-controller: faile=
d to set domain 'nputop' on, val=3D0
> >=20
> > Removing the regulator from the domain and instead setting it to always=
=2Don
> > "fixes" the issue, which suggests that the domain is trying to get curr=
ent
> > from the regulator before it is ready when it gets turned back on.
> >=20
>=20
> If I'm not mistaken, this is also misleading as nothing currently uses=20
> that (NPU support not merged yet and most if not all NPU regulators=20
> currently are always-on so typically not impacted by this issue).
>=20
> I assume this will be an issue the moment we add support for suspending=20
> the NPU regulator, which would anyway require modification of the=20
> various DT. Is that correct?

Only when the regulator is not set to always-on, so gets disabled by
runtime-pm. But yes, the npu driver was triggering this quite easily.


> > And in fact the datasheet for the regulator defines an "Internal soft-s=
tart
> > time". For a target output voltage of 1.0V the _typical_ time to reach =
at
> > least 92% of the output is given as 260uS.
> >=20
>=20
> Indeed. Now looking at the existing Device Trees, it seems some set the=20
> ramp-up delay already, but to 2300 and not 500 like suggested here.=20
> Maybe it'd be safer to go for 2300 by default then?

enable-ramp-delay is a totally different beast than the ramp-delay.
ramp-delay is needed when changing the running voltage and uses a unit
of "uV/us", so microvolt per microsecond ... where the enable-ramp-delay
is the one for enabling the regulator and uses uS.


> > So that value is dependent on the target voltage (up to 1.5V for the ty=
pe)
> > and also the rest of the board design.
> >=20
> > So add a regulator-enable-ramp-delay to all rk860-2/-3 nodes we have in
>=20
> Maybe mention that there's currently no rk8601 node upstream, and the=20
> only rk8600 (arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi)=20
> already has a ramp-up delay configured. Otherwise reading this I'm=20
> wondering why the rk860-0 and rk860-1 while being handled by the same=20
> datasheet are implicitly excluded from this change.

in turn with the above paragraph, I should probably check again for the
Radxa, because that variant has the same enable-ramp-delay.

> > mainline right now. I've chosen 500uS to be on the safe side, as
> > 260uS is the "typical" value for 1.0V and sadly no max value is given
> > in the datasheet.
> >=20
>=20
> Reading the rk808 regulator driver... maybe we should also set the=20
> typical delay as default in the fan53555.c driver? See rk805_reg which=20
> sets the enable_time for some (typically the LDO with 400 and the DCDC=20
> at 0). I assume those can be overridden from the DT anyway, but at least=
=20
> we would have some decently safe defaults?
>=20
> If we do not do this, then we should probably force the presence of=20
> regulator-ramp-delay property for the rk860x DT binding so we don't=20
> forget for future Device Trees?

that is scope-creep (rk808 !=3D rk860) ... but I find the idea of trying to
set the enable-ramp-delay as required for the rk860-x interesting :-) .


Heiko


