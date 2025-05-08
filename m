Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7B427A93D;
	Thu,  8 May 2025 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716587; cv=none; b=mkJu8xc2xpd/mUp07hH+3ejdUXq4BzVD7FEcLP4YCQy9xZOMuJDs2JAcNs3boI/zD4yEdv8Ytx5lE+lFkfR0q62/Agd3lKpc+kzHnCBZrmInS9EONj+ghzFK6QaPs4mMb27LVm01Id5vik/R/9Yw9404upmyBKFoAaxgIYlB8Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716587; c=relaxed/simple;
	bh=3DNsZF/rv9M8mb8kdwzH/JQLJ+WZ40H/gUZWj96QXyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGO8e5wrwFq7cprobbz/p5bYffzxz97LYkgBSpjHDtaZLYtKYSUlv2OLxY7pmO/l0xdU0auhFY9UFAv6B2Xt0P9o1A2F8I8q7ft6Ls1AKeI1F2IvQyjk96FzJh0Dhr179j87+Da5OiTsfyBt/4WQSpzphTTpYdGJMGKkvrsNqiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dR+pekXD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dR+pekXD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54750C4CEE7;
	Thu,  8 May 2025 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716587;
	bh=3DNsZF/rv9M8mb8kdwzH/JQLJ+WZ40H/gUZWj96QXyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dR+pekXDvSag6gWmTVpXa6O20ICVVYkjfE/GasaYdL3+F9TUw3Tb9Q2d/SZqrD+zM
	 aGntAW6TR3VfEKycYDJZaKFxhppvioZFVjEhyGG5D5Vo6/ys9f1oGSR+w7CAMfHD9M
	 w4MapSDD2uUtXbNV6a2Q5/e6KHabQXFbr3GOvbOMMRZQ0DSM0U49BZjbe832edfQOu
	 77wgx9FbMWc3xcpmh8TrxjM4L+WaO+Dj/7Cq6wYHQG+1MXNWz1K0+Sly/3gjHK+kmB
	 KFjDG9k6h3582IC8z+H3Tnctafob54WWCEmncdlU4wyu173Ie1njqRvH3jHx03nEb3
	 fix7C51qweXlQ==
Date: Thu, 8 May 2025 16:03:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yannic Moog <y.moog@phytec.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, upstream@lists.phytec.de,
	Benjamin Hahn <b.hahn@phytec.de>,
	Teresa Remmet <t.remmet@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>,
	Jan Remmet <j.remmet@phytec.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: add imx95-libra-rdk-fpsc
Message-ID: <20250508-harsh-refusal-523e1a67d5d0@spud>
References: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de>
 <20250507-wip-y-moog-phytec-de-imx95-libra-v1-1-4b73843ad4cd@phytec.de>
 <20250508-statistic-creation-ba17442921de@spud>
 <7819efd4-bf7f-45d3-b2b3-a3d33092f476@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xPi/7yiMGX4/St+Y"
Content-Disposition: inline
In-Reply-To: <7819efd4-bf7f-45d3-b2b3-a3d33092f476@kernel.org>


--xPi/7yiMGX4/St+Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 04:59:08PM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 16:57, Conor Dooley wrote:
> > On Wed, May 07, 2025 at 03:13:12PM +0200, Yannic Moog wrote:
> >> imx95-libra-rdk-fpsc is a development board based on the phyCORE-i.MX =
95
> >> Plus FPSC SoM. Add its description and binding.
> >>
> >> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> >> ---
> >>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Document=
ation/devicetree/bindings/arm/fsl.yaml
> >> index 447054b52ea391f69d11409d51751a88bb8b539a..783550c61cd7e9aa12ffe7=
8bfaa74478c19e0797 100644
> >> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> >> @@ -1366,6 +1366,13 @@ properties:
> >>                - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
> >>            - const: fsl,imx95
> >> =20
> >> +      - description: PHYTEC i.MX 95 FPSC based Boards
> >> +        items:
> >> +          - enum:
> >> +            - phytec,imx95-libra-rdk-fpsc     # Libra-i.MX 95 FPSC
> >> +          - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
> >> +          - const: fsl,imx95
> >=20
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
>=20
> Yes, but this still needs indentation fixes.

Oh true, I didn't notice that the bot was actually warning here, not
borked.

--xPi/7yiMGX4/St+Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzHpQAKCRB4tDGHoIJi
0n2jAP97O/s8ByCOsS91A2ZRQ4MCxwcULpEMDFOih3J5T6H1qQEA+tXf7LZjNWop
dlDT8OjObbKJwd/QRKHvuESKTwmRSAI=
=Sp3/
-----END PGP SIGNATURE-----

--xPi/7yiMGX4/St+Y--
