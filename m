Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469411E2312;
	Thu, 19 Jun 2025 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750329107; cv=none; b=mFq+7c8ed+Pm/Jk1wq2zSUPKWjQxhEj/kppIvnaN0wnUbPcP02QtnKLYYc9MHC/9W8jAI66ioZkwuye8G1L6SyJIV4n5VwiROQeP+ZivufoDShjYTlQcHcSY1qT/sWSMh81FJ44+wX41N4EnmNKAZddeDjQIyJOFpF36qAPvX8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750329107; c=relaxed/simple;
	bh=xkmi7WTsSXagv5IZJW/ccnVltWO4yEgOk5fV/cts4nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h/wSUYSNaNfdK5Cz1ctH0XWelukwEpPKXz0+CG6unpEvY8Rjg44RHUSRIj+JTf0kPwGpOMOyVcTH5U1XP/kd4koh5wzQ0MMOumhuH86DCZ0u0K8EkrYPbRCz5x3UHIecyOavJhVz9tNnfUd3ydWNcC9p/CmQO3h5u0kbHoGSWCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=qhUUmaua; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="qhUUmaua"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uHc7BspCc4VebX3+yVBmPaBO4Z3SMOpLQiryABMTzXg=; b=qhUUmauacre6f0NDbZEh0A209v
	PUSFAm69IOwcfWsONe8VRlmUFter+1RNbipSRBRx8Pkz1eqM7uPExZ/Jv9yT3+3VspkNVZzlc9SDk
	Abq3dkD7mVqK/P0ZUX4fivIyplQ/yR373A/gvQRZfAG28HjumuSX1eAd90imC2PqWw+ivvezsgZFq
	92/1onaEVis29tvgAVcXw2KIhbQ/HZ/kEjC+jIRjRxfMC01VaSuPxNS2zc/M80yqs5HL2xbA7Y22O
	GaeTm8Hek/Gm0+lj59FMeDzKmoSgOLyG/WU2Luea9XKiGkTRohtkk170iYUPznw/y6I/AVZwX13i2
	XMMlbEQw==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSCYS-0008Oq-0k; Thu, 19 Jun 2025 12:31:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Diederik de Haas <didi.debian@cknow.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2] arm64: dts: rockchip: Fix the PinePhone Pro DTS' panel
 description
Date: Thu, 19 Jun 2025 12:31:35 +0200
Message-ID: <5461462.0VBMTVartN@phil>
In-Reply-To: <DAQEX04P5320.CQDU7SL7AV4A@cknow.org>
References:
 <20250619-dtb_fixes-v2-1-abd711d11b67@bootlin.com>
 <DAQEX04P5320.CQDU7SL7AV4A@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 19. Juni 2025, 11:46:15 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Diederik de Haas:
> Hi,
>=20
> Thanks for working on upstreaming PPP things :-)
>=20
> On Thu Jun 19, 2025 at 7:21 AM CEST, Olivier Benjamin wrote:
> > Fix a few issues in the panel section of the PinePhone Pro DTS:
> >   - add the second part of the Himax HX8394 LCD panel controller
> >     compatible
> >   - as proposed by Diederik de Haas, reuse the mipi_out and ports
> >     definitions from rk3399-base.dtsi instead of redefining them
> >   - add a pinctrl for the LCD_RST signal for LCD1, derived from
> >     LCD1_RST, which is on GPIO4_D1, as documented on pages 11
> >     and 16 of the PinePhone Pro schematic
> >
> > Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>

> > +	lcd {
> > +		lcd_reset_pin: reset-pin {
>=20
> I don't know if there's a 'hard rule' for it, but I'd recommend to use
> ``lcd1_rst_pin: lcd1-rst-pin {`` as that would match the naming from
> the schematics. I realize that some but not all (other) pinctrl nodes
> follow that 'rule', but it helps with traceability.

not a "hard" rule, but a strong preference.
I.e. we want people to ideally be able to just hit search in the
schematics PDFs for the name they saw in the devicetree.

Sometimes that is not possible, because of naming conventions or
overly strange schematic-names ... and sometimes things slip through
as well.

But following the schematic names, is the general goal.


If this stays the only suggestion though, I can fix that when
applying. Or you can send a v3 - up to you :-)


Heiko


>=20
> > +			rockchip,pins =3D <4 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> >  	leds {
> >  		red_led_pin: red-led-pin {
> >  			rockchip,pins =3D <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
>=20
> Otherwise,
>=20
> Reviewed-by: Diederik de Haas <didi.debian@cknow.org>
>=20
> Cheers,
>   Diederik
>=20




