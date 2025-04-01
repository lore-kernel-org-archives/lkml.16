Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473B41B0F20;
	Tue,  1 Apr 2025 06:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743488409; cv=none; b=k/qdttJ45QYr7Iw8DOIaFrcRogWEIUoD0XFIUxZscCOQpmQeF/37CRiQX9y/v7wVoLunOzZsqECqCg3zMi79iru3HIE5jyypq03C5bH5WkeGZ/lX0b0PpyI59MYbDbw0Vviyf8M3KYFsLk7kcbq9YY/gGccaC9hht6OrbB/V7Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743488409; c=relaxed/simple;
	bh=dTB1LkdaHYhKeBp8RW+H8cwXDQYd31I062iUErSVSVY=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=tAYaq0fq1nY7hbFuS1fCWaneDJb9k6+RWBlSpy+vNFTQK3aLgsEYKNwAx9dsmJItrGjsT/EWhvcAjaAlqUEgN4qNff2NSg1Tr3eEOb3Rxe04GxrxWKSzL41FsR5bxlr/lmnKM+4HPsWqcY6GypcLPIfJs3mmff/X4AAm1HBJKzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gz7wAA6U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gz7wAA6U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68046C4CEE8;
	Tue,  1 Apr 2025 06:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743488408;
	bh=dTB1LkdaHYhKeBp8RW+H8cwXDQYd31I062iUErSVSVY=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=Gz7wAA6USP8ewDFFeflTH5OPGhu3BdQrL61rJoUMluPZ6qAdN0fTn72GgyLQjLUuy
	 wTHyz2n/xWJHxjkWVrZLNmV/3YpZNKH3uDcPeJ/4vN6oRJCzQyJ8EYmp2WvZBR1DRf
	 qdnwR00ZR6UU00NotYdO0BPr0SHC87MFdbIl7PMhmfmzR+O+pvqq/tLBouD+BDTnga
	 8DGRgMWOWL6LGz1OnO7kq7W3Smto1Ko7do+93L9aMHOlskb/trMKRt7eoSTZvZFWbc
	 +QPoMwa5Q2HtTK4ZnaYiMrzDzAveXnZsTCAoRIRZZ2nOJnRLXt64wT79ZeBdwqt5Wl
	 yNhb7sAVj7L6A==
Content-Type: multipart/signed;
 boundary=469ce2c5ee7b2eb876e9826f3995ee5ce86afad1f0f363e3357fd49a768e;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 01 Apr 2025 08:20:04 +0200
Message-Id: <D8V323NBB32P.3P8H103L83HZK@kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Kumar, Udit" <u-kumar1@ti.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250313144155.2382316-1-mwalle@kernel.org>
 <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
 <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
 <1ad2d8c2-6a0d-419d-984d-4974adb0e1f0@ti.com>
In-Reply-To: <1ad2d8c2-6a0d-419d-984d-4974adb0e1f0@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

--469ce2c5ee7b2eb876e9826f3995ee5ce86afad1f0f363e3357fd49a768e
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Udit,

> >>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> >>> [..]
> >> For completeness , this is ok to add this node but should be kept disa=
bled
> > Shouldn't it be "reserved" then, see [1].
>
> yes, should be reserved.
>
> With marking status as reserved.
>
> Please use Reviewed-by: Udit Kumar <u-kumar1@ti.com>

Thanks.

> >> similar to
> >>
> >> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k=
3-j7200-mcu-wakeup.dtsi#L662
> > j784s4, j721e and j721s2 have them enabled. What is the rule here?
>
> J784s4, j721e and j721s2 SOCs has two TRNG blocks,
>
> example for j721e, one is used by kernel [0] and another by optee [1].
>
>
> >
> > You also disable the hwrng in optee in your evm according to [2]:
> > CFG_WITH_SOFTWARE_PRNG=3Dy
>
> We are planning to use this hardware block by secure firmware.
>
> Therefore request not to use by optee as well

How will you be able to access the RNG from linux and u-boot? I'm
asking because I'll need it in u-boot for the lwip stack and the
HTTPS protocol.

-michael

--469ce2c5ee7b2eb876e9826f3995ee5ce86afad1f0f363e3357fd49a768e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ+uFlBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/huuAGA6VxJSqcfwEyp/l9Eacmq8DPaOSDcw5jB
HiLqus4Fg9DFl1wj0Zb6OF3HAbHYx/b/AYDCesqMKY8du6brSiVP+2172bjOgXHc
VLGr5Zn13LMKzakCwP54O+nZSy0OjYhrx2o=
=MziH
-----END PGP SIGNATURE-----

--469ce2c5ee7b2eb876e9826f3995ee5ce86afad1f0f363e3357fd49a768e--
