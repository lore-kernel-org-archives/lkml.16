Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A41F4C9F;
	Fri,  4 Apr 2025 17:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743786071; cv=none; b=Hp5un9k+F/7GJgdhi6NwyImGRU71Ct7UHCGoOBKrgCvBGbEZHEnNiqXXJBGKaZSsH6gOgDORguWmrxk4g2GPnSjLHrpZOV/J9n4sIgOiOWMAmYoEurmDp1YjzXD+ZvfXblKnK2raawNSVG7zHVnJpmxLft9/8W892O7PV693jPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743786071; c=relaxed/simple;
	bh=sHdcmXIXtpmvHQJ+EnU+MSmzNnepwGHCsSwlCicQsao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnumWf9p9Yamcb9hvuWIuNbVh/QkLe2aKcVFka5/ZXeBFsqhHSBlCFmO0Ed2DXm/C77Gk3/QJeIsAyftVb00qQA/SCTf8FGtMDBZn3iNVoZ4HgrJQINtU2bIQOfZXtUeNUD2GP3rUb2cZuh1ZpW1/Ngj0f6+alOklajHKycepdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oh/N3wqR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oh/N3wqR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCAAC4CEDD;
	Fri,  4 Apr 2025 17:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743786071;
	bh=sHdcmXIXtpmvHQJ+EnU+MSmzNnepwGHCsSwlCicQsao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oh/N3wqRebmbffUw+LNY/J1qQEjtrRwzzBxFPazjXofJDmbm9zuY5wWHJTfXbTcUr
	 YRxI20PKmV5ldLd+xfpCMnHKnXs3yndij5r+R6RKf8Wt0xO7g5BP+nyTHyc/iRQqlf
	 kH/2i6ktNFUCJdpvz44L98qHMnw5I/xOmXI+WcivUa0nd7yq5xA64CFod+ZsJKWdX4
	 B7Ya8X0T3v8aRV7gu2JcfPT5yxFcqKfe52I/jB+tMxBxoH7L8Irwpnq+JSn8umQM8Z
	 Ey77k70SB7llEfZroCfGUorvFTz3lEaF+/biNSNE83fB/xccbb7+R4197TOypn3qMB
	 1jEZT+muboJrA==
Date: Fri, 4 Apr 2025 18:01:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: fsl: add Toradex SMARC iMX8MP
 SoM and carrier
Message-ID: <20250404-breeching-flatly-91ba9bae3759@spud>
References: <y>
 <20250404105359.18632-1-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0FGlMtFg0OyEXee7"
Content-Disposition: inline
In-Reply-To: <20250404105359.18632-1-ivitro@gmail.com>


--0FGlMtFg0OyEXee7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04, 2025 at 11:53:58AM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
>=20
> Add DT compatible strings for Toradex SMARC iMX8MP SoM and
> Toradex SMARC Development carrier board.
>=20
> Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-im=
x-8m-plus
> Link: https://www.toradex.com/products/carrier-board/smarc-development-bo=
ard-kit
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--0FGlMtFg0OyEXee7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/AQUwAKCRB4tDGHoIJi
0gJ+AQCGEcrxxmfA8goYFrTQgrh/3wHIbrbK590i9nv8z05oqwEA8g016Xt7u4/V
yv3kaqnwg2EknqDzGU8cxfUVcGJLXg4=
=+XnQ
-----END PGP SIGNATURE-----

--0FGlMtFg0OyEXee7--
