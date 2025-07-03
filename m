Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BDF2E3390;
	Thu,  3 Jul 2025 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540167; cv=none; b=S0Fx5BvFgzZOVVKFwC74z5AAa8m67RvUWidUeEJHoLF1cXMOcHuiwWMKs9BY9Ra/rhjgBRSI0bsDWUNfXMIRVpN0zWO4iOogOWl3bepYI22ZpUP4Z9ocBjubLDKe15VhqZPQkfQ24Zzsput/qVADfLoHwPIwyqBAIX/cb3RvY2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540167; c=relaxed/simple;
	bh=Kw2PheC9E/MMW8eMFElXfvA9R2LFtPQHkGQfw1x647A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTUG82Ys7lJXR0bkuE5noqhrmdRoE2QDxOFDrNkDRGG5s/ONnvBxEdinOrm1J7wjSgygYVmfb2k3zB1+ib3Uy2tUfSAMWiCwg0q1Bif5SizT1d8LfsxY2o1hxrIpqqjmC4l7HvmStyc7ZsL/Qp1hJ1DHdCloPXApJzzDQa4MzMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rihWwu2S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rihWwu2S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023C9C4CEE3;
	Thu,  3 Jul 2025 10:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751540167;
	bh=Kw2PheC9E/MMW8eMFElXfvA9R2LFtPQHkGQfw1x647A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rihWwu2S05zHYot+UsCmVXJMi0ZgyEPMtCEd877BRgignOfQo8CYUX9Oo6IrexS+V
	 Zed595xMMlKcVUZ1ym1ltx5jIJq6oqVS5icakUpon9Zb6EgTkatxFWfOPt/QeLxdpE
	 n3L6i2eQGnTKotyH0MCNNjYrgVlWVxxBqKf3Ct98sHQtzl1NkvpcOQK4viukuawcvN
	 Xf7Wyy55CsZCphDZvCGxDYnT9X7e8mP+TZuCJanp6SALIGbyYQp3HiiAWEbXUmJws2
	 uNfrSiYlKkBWS3fUkWDV1vUc6Y6ReSayXWC45IZtqXjRMHejpvtRUujfE2khNr83zf
	 uK5tUpzOjnrRA==
Date: Thu, 3 Jul 2025 11:56:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <84a56059-9aed-47f6-b06e-bd5752ee4a0f@sirena.org.uk>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
 <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/OzG7Gq/P3EQSxoI"
Content-Disposition: inline
In-Reply-To: <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!


--/OzG7Gq/P3EQSxoI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 10:54:09PM +0300, Laurentiu Mihalcea wrote:
> On 7/2/2025 9:49 PM, Mark Brown wrote:

> >> attempting to configure the security-related registers.
> > I'm seeing failures to probe the audio devices on the i.MX8MP Verdin
> > system in -next which seem to bisect down to this commit,  I'm seeing
> > separate boot failures on the EVK so haven't been able to confirm the
> > status there.  There's no obvious logging, the dt selftest shows:

> After browsing through the provided logs it would seem like no device und=
er the
> AIPSTZ bus gets probed. Right now, my guess is that the AIPSTZ driver is =
not being
> compiled since CONFIG_IMX_AIPSTZ might be set to 'n'.
>=20
> Which defconfig is the CI using? Is it arch/arm64/configs/defconfig?

Yes, it's covering defconfig here.

--/OzG7Gq/P3EQSxoI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhmYcAACgkQJNaLcl1U
h9B3/Af9GmKYHJUj2YUz9rcqkYCIFaTj+Bcdv9as3xUcaU3jCMDuKPsE9TnCGaRn
ocbfagpvAQZSWYGOrXWnSTXjiPNtJ1tK9YjBqJr/AHoKIIA1iPlams7pvTc+tcew
u1+u5qBHT46ehvmrh1ux7lEXcd8pjnLj45PipsMZ+i8eHCxeT6X5Wbc3lA0MVo1q
QYG6V4xpcfpzNgHpZQXxkvxQ7gHUKQ+sgzNhxpaEMX49wku7rSxkqr940Rbn9hr8
SfixRjLRr8wadKk4K5ERJoNIOCg1d2WIETdl3Dvk69GQ+5ybdxNEdmwZsG9ZGR3v
sAyvw097HAvp0lpcFAOPRSKeigC/7A==
=nB+8
-----END PGP SIGNATURE-----

--/OzG7Gq/P3EQSxoI--
