Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282084B5AE;
	Wed, 14 May 2025 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212883; cv=none; b=LMrnaY4TJLlAO5ibJYkVIV2eaav2Ip+6oZZh3HEvqHB/NfXMjf/LGG9rYxwqQsTNWpLzOpBK8wZdJK5WpeJhGsso/5tWjAbnkGLaS2Ll38vmB+2e62lG7CZGt69wb59wbwR/yYTjH45T2EoWKx4wlZtSZJitlzA/rQk8NjlLflA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212883; c=relaxed/simple;
	bh=xw5uD58QST9stWyPF9wBRPxKJjr7Ja1UDw/xcOocFfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejHYK31xdQIuUCFn/v6+K8KJwhAeTeoHOuvohJAixAzZZ1SOL9WMr2mpZJeUQL+Q/LKjTZyPrpOwYHBzeD+m0flframRYcYPNn/JLvxxClzMIKzUGohtuYca2CryXLclETcbiZAmkaRIA4CM8ycjtsUYMDoAszb28DBznmxqtbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZ11nnEj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZ11nnEj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3C5C4CEE9;
	Wed, 14 May 2025 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212882;
	bh=xw5uD58QST9stWyPF9wBRPxKJjr7Ja1UDw/xcOocFfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZ11nnEjAdHJMfSucx20z0NavXjnsj8DnmLykqMROz0e5BiM9ovpfHz5mrhf+4daL
	 uxGbwU1YtnjSrpltFMHNdPtxoLslRr/Wbj1xEZWNZkSiRFNpRAMU8Zp50B1Esopl9B
	 zMxud3HoZ/1ooyXaWwinfk9uNcM+Uto4AJmrA6ioKJLN6X+cuUdHUfvcIBwu/vgAR3
	 j8STdXt93KWcwE2q8zay6QWAaa88kkL8DXb9Q5QgiPTZm/bSwMg5w2wl+6Naf0qwlW
	 I9/FWnnru/FvjwFqWrC3nxzh0FkMmiH65NR4X4GpLb1xT+P9muguD50bACwx7Qbips
	 pNB31oJ6FfWeg==
Date: Wed, 14 May 2025 10:54:37 +0200
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/13] ASoC: mediatek: use reserved memory or enable
 buffer pre-allocation
Message-ID: <aCRaTY76dnaavsrd@finisterre.sirena.org.uk>
References: <20250424102509.1083185-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U6cHvsBIp+ec+dLN"
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
X-Cookie: Well begun is half done.


--U6cHvsBIp+ec+dLN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 06:24:54PM +0800, Chen-Yu Tsai wrote:

> This is v2 of what was just a single patch "ASoC: mediatek: re-enable
> buffer pre-allocation on some platforms". Link to v1:
>=20
>     https://lore.kernel.org/all/20250401085659.1222008-1-wenst@chromium.o=
rg/
>=20
> Angelo requested that these platforms use reserved memory regions if
> possible, and fall back to pre-allocated buffers only if that fails,
> to align with other MediaTek SoCs / platforms that already use reserved
> memory. The series covers MediaTek's MT8173, MT8183, MT8186, and MT8192
> SoCs.

AngeloGioacchino?

--U6cHvsBIp+ec+dLN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkWk0ACgkQJNaLcl1U
h9DPngf9HFu/3ZkDnoocrHYYu5p+eGsgCT9kWQ5SHJS29c9lsMZ30HwQZo/2vDhr
LDZ87sH8is2iPnBLPKzC5eJTKi7IHkj15yVKd3yWn050kVCPM3GICvomDajGSSr9
byq5kvn7QdweGf0pLByBQuowHY6cG3ogpFmihc3YJiNxfpGDSATvAht6P9dRNJSD
UxzlHu9i5iEz1h9J3SHF/ywynx897V9X3JgmB8ygPA2kqen58+D6uecKrGCJYpjf
0e1GaIuq5ZPDzo0uDXz+s1rWUydrVSs9So23cBxhuWirlc+LkzQUvPULwUWlWV9A
uR+j5rrJ6Bqy9TXGYNLkZ/W4dp63dA==
=pmSJ
-----END PGP SIGNATURE-----

--U6cHvsBIp+ec+dLN--
