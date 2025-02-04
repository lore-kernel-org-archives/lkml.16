Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F87204698;
	Tue,  4 Feb 2025 19:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738697957; cv=none; b=jbyV43/oyCfqfJ8a2ylM1D+R4ivYKlkKQUAHcVM/UdNDVTdEabXx9ZApFVXMCm7fjP1ldOfJZ/q4CqW6N1mreAv44ZnZUkLZFIoX3IjNHWFperNE7Jv5iug15HFRWVZ5P1xzS2ef4HbG34f3DcLLEPfEUecclkeDkUvilPc4LgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738697957; c=relaxed/simple;
	bh=sNIr7E1EOGW6+JLXzu+l8I3qSiaeoXZdrs5cQc+nLo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oO3L/hCEaMvWQ5oggalnnpUqTAhTQ6iykP/HDn+9ge74XNH165EFF2kyAz1zBWhV5F4qbXotJT9q6vPxa61hHO3FaUKwEbuxfOj6pEXbPYwoqVxCMzn53ngLpDxD+bSLpcknA7S6q/woFPMrWbJ3Qz+sUa/IouTtDpu20MiP/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiJ4OfWE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiJ4OfWE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD47C4CEDF;
	Tue,  4 Feb 2025 19:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738697954;
	bh=sNIr7E1EOGW6+JLXzu+l8I3qSiaeoXZdrs5cQc+nLo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiJ4OfWEcCC1CohJGgsg1/2cyogyorT2ExrJ2P2MpHot7RLl7TaV40/U1z2fCtE55
	 OmKDiw5yG29N/FHW/p75MXSnfalzdo5dmuW7hokZIzJgPJvoTPVkM5hmIYCX6O/LCJ
	 sTzXMB82EGKUE0yVUG1f22omMDpPDj9HBoWQd3aAc/9b+GCsjllyzVEo+/YNhBUxvx
	 /rWMIdtjFE9skhtiZhCvAX7gtjXW6JGheZ8Dy6OgxF5P9hAAlpB6q+2Gn8todMZYXQ
	 xG2qbXgp692BQx/e34d+VGPIyvbVnW/Q3uARAi175QEWPLGJSSjkZtF/5pB/nUU2n6
	 cslrxdbYr6lag==
Date: Tue, 4 Feb 2025 19:39:09 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: imx: fsl,aips-bus: Ensure all properties
 are defined
Message-ID: <20250204-unclaimed-crook-9119c6e07ba7@spud>
References: <20250203213027.8284-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZqKUl5802oiVuaPY"
Content-Disposition: inline
In-Reply-To: <20250203213027.8284-1-robh@kernel.org>


--ZqKUl5802oiVuaPY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 03:30:26PM -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add a reference to
> simple-bus.yaml which has the additional properties used, and fix this
> constraint.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ZqKUl5802oiVuaPY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6Js3QAKCRB4tDGHoIJi
0u1OAPwP4dDgkZt6eKCDjQgofROOS9PimClqi9SO16o1+uArKQEArhXEWoKCBuP9
ZmQGi5sCHIdO4890WefAROi9f33aEQk=
=zzn5
-----END PGP SIGNATURE-----

--ZqKUl5802oiVuaPY--
