Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0333F227E98;
	Tue,  8 Apr 2025 15:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127076; cv=none; b=ShBFeXvmCkqk0mz8MOLiwa5m4TNt5TeJZ31pNxM8GX/vtNC8itcQBbKTeawqPWCkNSoUP9j22B7fLIaswDSK++YsdyIQjbbXBuBng7DSoypGHbVw96uLtYQEpr+mii/Lo1V0EaIFtSzMTjHsnyM3oarJX4WYSvFyBRO2thvSua0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127076; c=relaxed/simple;
	bh=G8wk56TGud9rHoSNEW8UY1VtUECn2NoFygWu15JtULs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvnrLSHzBpK+orFYsSfP+c6oSTs8KeDhDRDXHViKytw1j7opA3T9g+A1Y+NY6O1A9klXbtxru22ytxQrK1O8lm0WAxt0TsxDd3RlsKGKVo4AqvY59ZJOViFYC4znqDh9ZndukJ6iDoXbJd0zo4YvOGwgHpFFgsDIMUY5/3EjHHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYljaMId; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYljaMId"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE02FC4CEE5;
	Tue,  8 Apr 2025 15:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744127075;
	bh=G8wk56TGud9rHoSNEW8UY1VtUECn2NoFygWu15JtULs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZYljaMIdULyniQr4RNSq/irzs7yzuoCVria0BPrUmcRijGVaIHZFkHo3TEBcosHsJ
	 ryvOd1adZTIJEFB5nPq942zrQTvj3sXcTr0iKUi7ZxQ/JnBEvDjnlk+BfP0EQ6kmv4
	 dq7RfWtlXT0M6ofeb2EcYJInJbf6+9NgZL/E7z2ntYLdhxaCDqnsi1jw63KY9HPtir
	 PCns7ofz5YlmHotO4IB7qhjeSMvbTnrOuwD3MbUYOU0yspP+qirazvRkqSYxV7cwUF
	 kGoHCsOFIfJfNCMgBDzgIqKbjYvQa8G8sGqyCgDA+zcbfE9LDtLdqhjwlFV/rAf36k
	 LvCzGwZplFTMw==
Date: Tue, 8 Apr 2025 17:44:32 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: ili9881c: Add dsi-lanes
 property
Message-ID: <20250408-statuesque-poised-firefly-ed8db1@houat>
References: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
 <20250408-feature_sfto340xc-v1-1-f303d1b9a996@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ewdpo6mzqq4hfc4b"
Content-Disposition: inline
In-Reply-To: <20250408-feature_sfto340xc-v1-1-f303d1b9a996@bootlin.com>


--ewdpo6mzqq4hfc4b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: ili9881c: Add dsi-lanes
 property
MIME-Version: 1.0

hi,

On Tue, Apr 08, 2025 at 05:27:00PM +0200, Kory Maincent wrote:
> Add the dsi-lanes property to specify the number of DSI lanes used by the
> panel. This allows configuring the panel for either two, three or four
> lanes.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 5=
 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili98=
81c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.=
yaml
> index baf5dfe5f5ebdd92f460a78d0e56e1b45e7dd323..e36550616f6aac86c79832a48=
132ce8c11ebcf7a 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> @@ -27,6 +27,11 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  dsi-lanes:
> +    description: Number of DSI lanes to be used must be <2>, <3> or <4>
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [2, 3, 4]
> +

We have the data-lanes property for that already

Maxime

--ewdpo6mzqq4hfc4b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/VEYAAKCRDj7w1vZxhR
xS9/AP9EMIfcRTTSX4RRpS+AQwAkdMgo5C06Wa7dpi5u86T7xQD+NZxqjENpRkCr
c4NE2azRMmu/2S+PcdUP6ZbJuCARnQc=
=Cc2N
-----END PGP SIGNATURE-----

--ewdpo6mzqq4hfc4b--
