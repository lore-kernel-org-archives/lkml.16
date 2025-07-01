Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF9026A0ED
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357998; cv=none; b=Xrv51gp7J44wAOmsNWg09fFBIImFm3j5RZeBle1+ZOKRlurGJVPUDKmPWLomHOtSwOXNT4p9R6FFXWCU649GX4iWqV3llHE671xtQjM6tG9UmoyXlCGUAB7dEXPGt3n6a5Awh/BXUgKRmdCimTgadwhO//5U4Q0XL9L+5uxr7us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357998; c=relaxed/simple;
	bh=9kLBJIY1j0nyDfSn8DjLT/zr1ebptC24eyJqaN32CvM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VbNvmVnR8f8qW+sVxHorDa1vJiPGmxm7VUuOwRo/sIYQKyw2c4vw7A5VT4X9GZvYMqrsqDeA9gib1n33nqkYS8pUFBJgC8+siMrcum9cvVsPM1Oep5b83awHPZ+IZdFe81cbbfCWAPOPC8/mxuXnCsnKHstPS9f/MHq9bQLU4XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=f/t6qj6p; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="f/t6qj6p"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751357992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5lG1lZ4wTBqNQl0EYVKKzdzGkBoFkZNZqcyt1z8734U=;
	b=f/t6qj6pKG54lCbY53Sunp7mqaPSbRc5H1X0tEQklgAq5suOFxddzV80NWrxXyAvmr/lRV
	1Dto+v4xBF4t+Zhh3RHFuQ/JDSF8+J9AOVdNOvNaeQOoPCyzhn6YjoG9w0fwNpUoQotP3T
	no2BXMcOLzWFkEKXPJ/i0tv/yPWXDPzDMRhe4Lp9mjhtB1JKJQ6NtSB23/UcJwi2uc2s2/
	8hZWN1LMgeF2sP890h5JCSwNsE6KJcnFotTSoGE+FDEMHUAZCrlMaTOLRk/ChdnvaXQUcc
	WVQm/80AdIhv2xRdsUFr58hIIEOADfl3f0WtGoAHj6FcWIg/r6idjSaCIfws5w==
Content-Type: multipart/signed;
 boundary=38693364ded63ed777e864851ae1da7c89f5b94f050aba042d5a6802b722;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 01 Jul 2025 10:19:33 +0200
Message-Id: <DB0KL629S4E4.3ENNM27XN3IYM@cknow.org>
Cc: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <kernel@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: adjust dcin regulator on ROCK
 4D
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
References: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
 <20250630-rock4d-reg-usb-wifi-v1-1-1057f412d98c@collabora.com>
 <DB02KKR1VK9H.1Q1Y5A98FKGLK@cknow.org>
 <5acizoywvjolaffojiawqlzixiclrqzohuhq55lbsjm6yhhlwi@w2amqugl3ee2>
In-Reply-To: <5acizoywvjolaffojiawqlzixiclrqzohuhq55lbsjm6yhhlwi@w2amqugl3ee2>
X-Migadu-Flow: FLOW_OUT

--38693364ded63ed777e864851ae1da7c89f5b94f050aba042d5a6802b722
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Jul 1, 2025 at 1:10 AM CEST, Sebastian Reichel wrote:
> On Mon, Jun 30, 2025 at 08:12:27PM +0200, Diederik de Haas wrote:
>> On Mon Jun 30, 2025 at 5:36 PM CEST, Nicolas Frattaroli wrote:
>> > The ROCK 4D's actual DC input is 5V, and the schematic names it as bei=
ng
>> > 5V as well.
>> >
>> > Rename the regulator, and change the voltage it claims to be at.
>>=20
>> Shouldn't it have a fixes tag then? Providing 12V where 5V is expected
>> sounds problematic ;-)
>
> This is basically "just" documentation, as the DT just describes
> a fixed regulator (i.e. nothing software controllable). This just
> changes a number in sysfs :)
>
> Note, that the 5V DCIN is a USB-C port, which does not do any PD
> negotiation, but has the 5K1 resistors on the CC lines to "request"
> 5V. If for whatever reason a higher voltage is applied (which does
> not happen as long as the power is provided by anything remotely
> following the USB specifications) there also is an over-voltage
> protection chip. So it's not problematic :)

I was worried about and wondered why I/we did NOT receive reports about
boards being fried. Good to know, thanks!

> OTOH adding a Fixes tag does not hurt ;)

Cheers,
  Diederik

--38693364ded63ed777e864851ae1da7c89f5b94f050aba042d5a6802b722
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaGOaGQAKCRDXblvOeH7b
brm5AQDBQgTI6i56C46hjlIfyd5URIiHLipsV2TsQBP3ETCBSAD/S76s5EMy093j
72Dzr2Gp3zlu93a5HL9EgvMHM4K/YwE=
=0tkF
-----END PGP SIGNATURE-----

--38693364ded63ed777e864851ae1da7c89f5b94f050aba042d5a6802b722--
