Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE43D23026B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749729578; cv=none; b=QFXcg8ktR4GgrcoK20PTuaOEHGgINm4E2Ba8efUugrhQSnHf9BsMPsM/dth0KkQBbFMWJrfP7IyJb5X2tdkjYW+/4IRz4KsPZV4Lwh6TTPXvLmXoV3MhGMNoyuNTTKFVJT0WZ4e+unIJ06Ww7BNZCDeQLzOaSaM36Cv7b3WTh1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749729578; c=relaxed/simple;
	bh=FKOlBvAwUREHDR/8KhJup1MEyA23nPKaBwO+OQk6+/g=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=R/9V/l7CLahW/aEGV3A0/zkz8r3D2H2jrbrCd9yPSq5KEg/urryDV49CcoiuRXSwq/lwsfIlZnsN7BROJ91qfVvhpDCt2BohRe0ShZEyJb9jxVlhjbk+UYub6di9AyPx5qzYdjv4NxNSns4nl9HHjrPjlCCq2IulFhhOmO657x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIbqRhcg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIbqRhcg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1180BC4CEEA;
	Thu, 12 Jun 2025 11:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749729575;
	bh=FKOlBvAwUREHDR/8KhJup1MEyA23nPKaBwO+OQk6+/g=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=YIbqRhcguOtZ9iqaHcXctAB+Yw/FCOtuCHuyQ/UR3abQ2D6R/qZzsknTmUQEWTZwZ
	 uYre7eOHfOETOND0mHkFnxP6f3T2piJQwsCSt7+Szd/pgrwakjz3pU5fOCxzWMUo8z
	 HfCzq0TCH5Gk/qloZskgXgTGTLcd9rp39SqKZdenywHE5NWpfeD3zOVPblOPB7h1Kb
	 5SOk0wLhao7W0TjclAs5iot5ZAHNogMHhzRWjKtfdZO7XBJOooblS66RyAfn/zdfZt
	 idynOzAHyQX+wFqI1lCb113SZMkkEnPXx9esSJ47Hdp9L/yUCte8kIBN4SMGSs3GTT
	 oRUMhbObQtZ/Q==
Content-Type: multipart/signed;
 boundary=8857958cc2b3b1e14f9588e336e03fd15d02f1cc0813e76c9a0ecfbe0aa8;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 12 Jun 2025 13:59:31 +0200
Message-Id: <DAKJD89W5O3D.1WXVSY2RLLEFZ@kernel.org>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix REFCLK setting
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Jayesh Choudhary" <j-choudhary@ti.com>, "Doug Anderson"
 <dianders@chromium.org>
X-Mailer: aerc 0.16.0
References: <20250528132148.1087890-1-mwalle@kernel.org>
 <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
 <9272e36e-e764-4007-9d9e-8e09b9c08d34@ti.com>
 <c0027ff0e63bcc0fd21aab37af991baf@kernel.org>
 <affbef6e-f253-4dbb-bf64-3cc7d244acbb@ti.com>
In-Reply-To: <affbef6e-f253-4dbb-bf64-3cc7d244acbb@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

--8857958cc2b3b1e14f9588e336e03fd15d02f1cc0813e76c9a0ecfbe0aa8
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Jayesh,

> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * After EN is deasserted=
 and an external clock is detected,=20
> >>>> the bridge
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * will sample GPIO3:1 to=
 determine its frequency. The=20
> >>>> driver will
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * overwrite this setting=
. But this is racy. Thus we have to=20
> >>>> wait a
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * couple of us. Accordin=
g to the datasheet the GPIO lines=20
> >>>> has to be
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * stable at least 5 us (=
td5) but it seems that is not=20
> >>>> enough and the
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * refclk frequency value=
 is lost/overwritten by the bridge=20
> >>>> itself.
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Waiting for 20us seems=
 to work.
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usleep_range(20, 30);
> >>>
> >>> It might be worth pointing at _where_ the driver overwrites this
> >>> setting, or maybe at least pointing to something that makes it easy t=
o
> >>> find which exact bits you're talking about.
> >=20
> > Yeah, Jayesh just pointed that out below. I'll add add it to the commen=
t.
> >=20
> >>> This looks reasonable to me, though.
> >>
> >> I think we are talking about SN_DPPLL_SRC_REG[3:1] bits?
> >=20
> > Yes.
> >=20
> >> What exact mismatch are you observing in register value?
> >=20
> > The one set by the chip itself vs the one from the driver, see below.
> >=20
> >> I am assuming that you have a clock at REFCLK pin. For that:
> >=20
> > Yes, I'm using an external clock.
> >=20
> >> If refclk is described in devicetree node, then I see that
> >> the driver modifies it in every resume call based solely on the
> >> clock value in dts.
> >=20
> > Exactly. But that is racy with what the chip itself is doing. I.e.
> > if you don't have that usleep() above, the chip will win the race
> > and the refclk frequency setting will be set according to the
> > external GPIOs (which is poorly described in the datasheet, btw),
> > regardless what the linux driver is setting (because that I2C write
> > happens too early).
>
> I am a little confused here.
> Won't it be opposite?
> If we have this delay here, GPIO will stabilize and set the register
> accordingly?

What do you mean by GPIO? Maybe we are talking about the very same
thing. From my understanding there are two "parties" involved here:

(1) the linux driver
(2) the bridge IC that comes out of reset when EN is asserted

And both are trying to write to the same setting.

From what I understand, is that (2) is running some kind of state
machine or even firmware that will figure out if there is a refclk
present. If so it will sample the GPIOs and set the refclk frequency
setting accordingly. This happens autonomously after EN is asserted.

Now there is also (1) which will assert the EN signal and shortly
after trying to write the refclk frequency setting.

With this patch we will delay the register write from (1) to a point
after (2) updated its refclk setting. Thus (1) will win.

> In the driver, I came across the case when we do not have refclk.
> (My platform does have a refclk, I am just removing the property from
> the dts node to check the affect of GPIO[3:1] in question because clock
> is not a required property for the bridge as per the bindings)

I'd expect that in this case the refclk is set according to the GPIO
strapping. Correct?

> In the ti_sn65dsi86_probe(), before we read SN_DEVICE_ID_REGS,
> when we go to resume(), we do not do enable_comms() that calls
> ti_sn_bridge_set_refclk_freq() to set SN_DPPLL_SRC_REG.
> I see that register read for SN_DEVICE_ID_REGS fails in that case.

Does it work with the property still in the device tree? I might try
that on my board later.

> Adding this delay fixes that issue. This made me think that we need
> the delay for GPIO to stabilize and set the refclk.
>
> Is my understanding incorrect?

Unfortunately, the datasheet is really sparse on details here, but
maybe the bridge needs some time after EN is assert to respond on
the I2C bus in general. I'm basing my guesswork on the td5 timing
with the vague description "GPIO[3:1] stable after EN assertion". I
assume that somewhere during that time the chip will sample the
GPIOs and do something with that setting (presumable setting its
internal refclk frequency setting). FWIW there is also a td4
("GPIO[3:1] stable before EN assertion"). Both td4 and td5, makes
me believe that this is not some setting which is sampled (and hold)
at reset, otherwise td5 wouldn't make much sense.

> I am totally on board with your change especially after observing the
> above but is my understanding incorrect somewhere?
>
> Warm Regards,
> Jayesh
>
> >=20
> >> If refclk is not described in dts, then this register is modified by t=
he
> >> driver only when pre_enable() calls enable_comms(). Here also, the
> >> value depends on crtc_mode and the refclk_rate often would not be equa=
l
> >> to the values in "ti_sn_bridge_dsiclk_lut" (supported frequencies), an=
d
> >> you would fallback to "001" register value.
> >=20
> >> Rest of time, I guess it depends on reading the status from GPIO and
> >> changing the register.
> >=20
> > Not "rest of the time", the reading of the strapping option from the
> > GPIO always happens if an external refclk is detected. It's part of
> > the chip after all. It will just sometimes be overwritten by the
> > linux driver.
> >=20
> >> Is the latter one your usecase?
> >=20
> > My use case is that the GPIO setting is wrong on my board (it's really
> > non-existent) and I'm relying on the linux driver to set the correct
> > frequency.
> >=20
> > HTH,
> > -michael


--8857958cc2b3b1e14f9588e336e03fd15d02f1cc0813e76c9a0ecfbe0aa8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaErBIxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/it1wF/eikbWKB9PK6T8iVBtE7h6BTi0wl8nMri
Z8hsMY+70ZYucENExgnqak+aWH33RCAFAX9WF+8buyy+I7L6xPtnNxLyD8A3COwt
uMflT8Slu+lnp4nqBAzTE4uIdI9AWfIhcyQ=
=1Y6Q
-----END PGP SIGNATURE-----

--8857958cc2b3b1e14f9588e336e03fd15d02f1cc0813e76c9a0ecfbe0aa8--
