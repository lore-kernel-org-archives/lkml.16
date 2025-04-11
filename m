Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0226278E46;
	Fri, 11 Apr 2025 11:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371160; cv=none; b=HrrdhfmEHG4fi8S70NG3/Y4bdhSywLlzeGEBeQwRG/yqvnxVYiNZ50JdlALzesr+dcxrzK6fBFLppAIMG96NUPEBsCoSQq0Oi8cqcnSbppRpXLLXNcTvV7apGa+JReDe41Oh2G/Mnomsue4i/WtK8+VRc+TgUjjyAxcKYc7PAdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371160; c=relaxed/simple;
	bh=sBHaRK1ZSaePqPWfOxpeh758N6t00RqzZqnAqRGNd1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaMpZo4sM0dwbkiw+1enBpm9k7o5i0kmAY3oGAzn3oQWZu0iQnFjHSGmrhefCwzRgoQAw0M6LdB8FNXGkvFUoUgFNmQJfooUp1o9dhKKVDgDE7UmjWGGgY9IiEtB/H8hYWCEeTQUg6B2/Vl/JNS1uEpmWK3f1qemtIAR85p2OOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhK7cIJZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhK7cIJZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAA1C4CEE8;
	Fri, 11 Apr 2025 11:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744371160;
	bh=sBHaRK1ZSaePqPWfOxpeh758N6t00RqzZqnAqRGNd1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhK7cIJZ/W0PSsedfPxgtdl2bq2qi+Wq/k7Lnf2dFuVCBcr3IfUXbuslOOiawVNOX
	 5Oa37ery2tgVkVyBlzbr930+4d3NwrFytyoloZmCzfBceuP1Kec6Ir/lhaZ0kk/X4X
	 rbOsD5cbx1LcbYwvj+WPwCdU020ZCqfPpBKg5qaoxP0IkDVZFWMHC8fL6+P2c3kMnT
	 5bUWtRyDXEnpQ2iyalL/jzpNjA8j9HNRfnCVG5WRsdjp65U7ZmEZy5qLh6i7I2TOiC
	 5L6NNIrzaBILfPAJoE9hLnxKX1bujgtzw+L1c2mJaFyGODxu6NFZKKmZgcQ5U/GtOF
	 S4T46qTf/A+Yw==
Date: Fri, 11 Apr 2025 12:32:34 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lgirdwood@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 3/5] regulator: mtk-dvfsrc: Add support for Dimensity
 1200 MT6893
Message-ID: <109a821d-b788-4bce-96af-caa69083ff40@sirena.org.uk>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
 <20250410144019.475930-4-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C9TEpmot+cqsq/pX"
Content-Disposition: inline
In-Reply-To: <20250410144019.475930-4-angelogioacchino.delregno@collabora.com>
X-Cookie: You will be awarded some great honor.


--C9TEpmot+cqsq/pX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 10, 2025 at 04:40:17PM +0200, AngeloGioacchino Del Regno wrote:
> The MediaTek Dimensity 1200 (MT6893) features the same DVFSRC
> regulators as the other currently supported SoCs, but with a
> different select value: add an array describing the possible
> voltages for the VCORE and VSCP regulators, and assign it to
> a new compatible for this SoC.

Acked-by: Mark Brown <broonie@kernel.org>

Though it looks like there's no build time dependency here so I could
just go ahead and apply, it's just needed as part of this for testing?

--C9TEpmot+cqsq/pX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf4/dEACgkQJNaLcl1U
h9DQDAf/TFk3iR7DcvM01gNImhlPDyqjWf+/6e6un52shNdNlgJticu6IC7vJ16o
B0fwLTVg5P2rc5wAhCiCR8IK3EHhpZD5yPCCYNiLDK32bM7QdG2vptB1gWNt81JU
/RpBP4Q1WJZn4iT3cylo2Ek+YIbs6AW8yTBaT7yASAtmRkLqnf+LOzKaovJSXIiM
WzZY5N7CoYbl8kWyDHd1fFhBWMT+L0yiX0vBAJ78hSJ1M9ol+hs/5RyfML7pA4y6
Yu8M245swOHt373I3SAsKZMC9DTXciiI+WPlrc+UpIziqtp+iB/vK0pWKHxajYAR
eOxm0c561+Zs8Pt7RS+azFZq6JYHOA==
=dnlk
-----END PGP SIGNATURE-----

--C9TEpmot+cqsq/pX--
