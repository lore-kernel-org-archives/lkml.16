Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15365B67F;
	Mon,  9 Jun 2025 16:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487639; cv=none; b=nCBA+2S4pG0EfmpnsG3vLHp/wPe4yYOKYt/07EPUmGI1wvVcz6EQdkge6+5EfmyAe9mGCWLb/6I1dPlJ0LfsOxsvPxjHtTOX4lPBWy4ldG3x1WHUyU7LoaMxq9rcfnXhqqoLJsVmJS+MfuvEXXiwe+Y/zyKyEG4cqvYv0TCX4Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487639; c=relaxed/simple;
	bh=FDlrwPCGqdtcmZ0+vL6XtgOX8Ef1LSQXZoSWQmeO7Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6i3kEsohlS11H1qNWIlZLzh5LcgUQ8qC3R/MThF0/56tHffH9vsPtTanjf6fl4INb2UQ5Lj9qscz7vfnQemYJhF0flqirPGoyY0cBQVFL17q3vcZolSYvAtMrrW/CksCfXJmHcJj9Ex9Eb554peYNbnWaGkyy77PQy1E54ixfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIZjaVvh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIZjaVvh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D239C4CEEB;
	Mon,  9 Jun 2025 16:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749487638;
	bh=FDlrwPCGqdtcmZ0+vL6XtgOX8Ef1LSQXZoSWQmeO7Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mIZjaVvhw7rjq6Mg3uIX5WPhrayMfsxpa/4WujLtfyN0VZSp0QWnrGYiObdiFAd8V
	 7Oj7ZJpALiGjdeJ4XCC7KuMZeqzlLiXwPN3Jq8KSqufDq0nuSJYu4CN79ap6y9XayB
	 p7z7kwHX3t9l46PgE8YDiNZnBD++xeAgZGqJ9hh2b4qhouMOcCBQTjg9rTF0VpMN1V
	 wrVEUjErwz4wmoBuRfICXPod6TUAWhDdJA6mlxxh88v+tfvyINarK+Ov3XUYc5eSXQ
	 3NfVPgO2QY5F58VSlg5/s9wn0Ee3mJSGqZv+E37BYFnt4RTKxTTAmmMn8cL0OxGQzA
	 Cz4w4JH1M4Bqw==
Date: Mon, 9 Jun 2025 17:47:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 06/10] dt-bindings: arm: fsl: support Engicam MicroGEA
 RMM board
Message-ID: <20250609-armband-amber-8e99ad5fb61c@spud>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
 <20250607093342.2248695-7-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U8YuxeyKxmCPCQxF"
Content-Disposition: inline
In-Reply-To: <20250607093342.2248695-7-dario.binacchi@amarulasolutions.com>


--U8YuxeyKxmCPCQxF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 07, 2025 at 11:33:18AM +0200, Dario Binacchi wrote:
> Add devicetree bindings for Engicam MicroGEA RMM board based on the
> Engicam MicroGEA SoM (System-on-Module).
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--U8YuxeyKxmCPCQxF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcQEAAKCRB4tDGHoIJi
0uQqAQCgeENFdhncUQrc/wea5pNLgXjDQGql/RGwS8yCbI9ufgEAiwqa4EGAzXSJ
m9+HqU7S8XnG8RwO5zNH3MyyQGI6AAA=
=LKbN
-----END PGP SIGNATURE-----

--U8YuxeyKxmCPCQxF--
