Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3311D262FD0;
	Tue, 20 May 2025 15:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756184; cv=none; b=F4R08woqsvmGI0ySbiyoPPi7nyVb75BMeGyTpzW09IuSZ1MkNyqTNdnKxIWEIftx/IqzznBwDHc29Vvv2B2NXSOsm4YJyMEazps0HdAXRKOzDrIHwnPomCFxDzr4iYaYeTfB49ZLeuEe7ToRBq8ZrtDL8YTxAPEgJtJYBO6odlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756184; c=relaxed/simple;
	bh=x/xcA2v5rT9pwMsxq/8r5xiUmJQA9aym0rnhAdmD3Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjGbBP2T+uR9px6xhV6QuUN9rcTtpHEA7nygjcPqBU/OHZxsEqUImRuoIKVzEzBg/BZhHoZZNSRGeHK4MaznogmlTSK9WlVEwL6fJp3eYugeY66EdJtbMRpTahzLNmFosNOiKQNXY9djgaybNDUxzimpXcQs7ZR202FGbgURIyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+ax18VU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+ax18VU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DB1C4CEEB;
	Tue, 20 May 2025 15:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747756184;
	bh=x/xcA2v5rT9pwMsxq/8r5xiUmJQA9aym0rnhAdmD3Yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M+ax18VU+RapQy1TPRGI7d0iNYYDgrm9n4D23yzzpavnmHlIoBx3UDsNGB28r6Zlv
	 Txx/bUModBFHoFNXdzBUFtZi8/L716fwB8mPvmeWfA8kfZHRkX0nkjL5pgzdelYj20
	 Bx1UQ6uFLAsAYwGa1M7p9NvBkSYt//xnEEF5xK+BG/LzsJroxLOkpqv5Q1ywhsSZ+G
	 RMe5y+mcakhck0stZrOzJ1cEmaYy6r8RQdkdzm9Q7vbLV9OvIAs1DBhz5wGhwwraYV
	 L6iGRdjZV5N0Ti/S5tAyzzOFMuRmFOZ5GL+Xip4Yp4vH44pdIGiZ1iQELQnC5eCL30
	 lQTjgebaFPo5A==
Date: Tue, 20 May 2025 16:49:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: add AUO P238HAN01 panel
Message-ID: <20250520-certify-womanhood-678edc4a37a5@spud>
References: <20250520074439.655749-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bTHU5tE0Xeo7TnAi"
Content-Disposition: inline
In-Reply-To: <20250520074439.655749-1-mwalle@kernel.org>


--bTHU5tE0Xeo7TnAi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 09:44:38AM +0200, Michael Walle wrote:
> Add AUO P238HAN01 23.8" 1920x1080 LVDS panel compatible string.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 5542c9229d54..1ac1f0219079 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -57,6 +57,8 @@ properties:
>        - auo,g121ean01
>          # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
>        - auo,g156xtn01
> +        # AU Optronics Corporation 23.8" FHD (1920x1080) TFT LCD panel
> +      - auo,p238han01
>          # AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
>        - auo,p320hvn03
>          # AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD p=
anel

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--bTHU5tE0Xeo7TnAi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCykkgAKCRB4tDGHoIJi
0tKCAP9ow8y7bFpTF9AFOfz3Q47pX+fn3qmAmfaO2AAm4BuOlAD/XKSPjiHCNN0s
ft5UMQAypauFLdS+TlIB4DgD2yquRQQ=
=r6Sy
-----END PGP SIGNATURE-----

--bTHU5tE0Xeo7TnAi--
