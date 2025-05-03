Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904DC1E0DEB
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746281040; cv=none; b=MDHSeUVVCgM8VNkoypsIf3a2rc4UhDAyYdZpNilpBRmwPOvAxyklJOYy9f9OIptOGbe+2yTW95bcXuc+0ooTcCJpUOg89xG30u8LnEJWZCYZRMuGbrGv8q1Mfcs334f4PwSkplH12bKssuMWLVIdF3QSfjFouryOVE4EFfgrrjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746281040; c=relaxed/simple;
	bh=EMrs8wHAxIwazzNrklKhbJssyCiqWrFWNMoW8lVGmUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVl2/U7LbWSqcItVdiKvUDW/VPtD1TQpB9HNOasTO6ez9i5wrv7U1FI3pN2k7rD3t9qouX5975KgvbMBCcFan5sbHiau7wvPljM72Xdh3GkF64hhVC0NvWcNVPrMQ+CD4i9JFB1l0Znh3flAIuqknpljlXwUxiF/fvG41Qee4vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uBDSo-0004un-FQ; Sat, 03 May 2025 16:03:34 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uBDSm-000uwH-1H;
	Sat, 03 May 2025 16:03:32 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 010774074C8;
	Sat, 03 May 2025 14:03:31 +0000 (UTC)
Date: Sat, 3 May 2025 16:03:31 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vishal Mahaveer <vishalm@ti.com>, 
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
	Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
	Simon Horman <horms@kernel.org>, Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/4] can: m_can: Add am62 wakeup support
Message-ID: <20250503-petite-echidna-from-hyperborea-cfd7fc-mkl@pengutronix.de>
References: <20250421-topic-mcan-wakeup-source-v6-12-v7-0-1b7b916c9832@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="msi7s5izy7ouaffb"
Content-Disposition: inline
In-Reply-To: <20250421-topic-mcan-wakeup-source-v6-12-v7-0-1b7b916c9832@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org


--msi7s5izy7ouaffb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 0/4] can: m_can: Add am62 wakeup support
MIME-Version: 1.0

On 21.04.2025 10:10:36, Markus Schneider-Pargmann wrote:

[...]

> Devicetree Bindings
> -------------------
> The wakeup-source property is used with references to
> system-idle-states. This depends on the dt-schema pull request that adds
> bindings for system-idle-states and updates the binding for wakeup-source:
>   https://github.com/devicetree-org/dt-schema/pull/150

How can we get an Ack for patch 1 by the DT people?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--msi7s5izy7ouaffb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgWIjAACgkQDHRl3/mQ
kZzihggAjm7BmW/gTNjnz7/mLUDVwqHN3vnG3QhYzxEcY2FBA6MgB61J03UbA0y0
XSRp9R1WqWFpBn0no67iaoU3AFSeG3cTqVi8688dvhN/7GG4Tdy9QjAuEpTzaJUG
rSKZuHf82aSMxE3/2FbS3MV18YbZCty29kTaTUdkpk4YS28wa5+nDGSSyvYLqy98
DVE/2elgBNkO0DEBKtiNr8NDtljgfutKCq02mhGklVuz07tj430xJh9T4BBZKA6M
oJ6FxIGyiN5sSGj41WJ+ixkuL/L4zob4ji73p3lMVbkr0UZnE5wTo8sAbT0mBzmK
x/+zfIi7bMwR/HMVddln20TQ0ZeGxw==
=s7eO
-----END PGP SIGNATURE-----

--msi7s5izy7ouaffb--
