Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2312A1F1927;
	Mon, 26 May 2025 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748273880; cv=none; b=fvcypybPHvw9v4rL0DAC+KsDXVOyL8paGTHvbFdKQuxIvYEW0vW5VUCrrTUGi8MS3KxdpR+2Fnn/Q5O2AdTF5i/XjThECVK4qnm0H3Oj0wZHkEiOIoTekpCBFY6XaHbZ6AJLdQhoFIjkgpDFJnVuwP+oKv2/TvkWZhzPNCSkmeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748273880; c=relaxed/simple;
	bh=gZEdcFi4AWB0mQGqJiR9Una+jbLgbOAii8cHYJwyyCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ke6D5KOSG4bb5KNflLPRUHuG8yfvEir0LQ5rqXUNvl17ECWVXT5tlINvdMXkbllbM3u9Sit97giP90/d83KcN8J6uXvZMLz8gmaUMBFlvyhRLy0dchi83rXzB3FV1+51lTY69CmQEwr/by28HN3uqe0Z0nyetqGmgoRDMNeqAOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVeCCn9+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVeCCn9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6DAC4CEE7;
	Mon, 26 May 2025 15:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748273879;
	bh=gZEdcFi4AWB0mQGqJiR9Una+jbLgbOAii8cHYJwyyCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eVeCCn9+rEbLc+qkCLUyuKo8t7aaVRIHh8jR9LpDHzzYDoqaBW3s9r2BswWH9GnMd
	 3gg7sgvdnF6/qZLxmzHgW3Uja/7UvtdMu5u5FluGEamqmzXavPG23XcjlMcDKEvXfu
	 TTHg+YrIGqvY99JX+v12NT3qFpKX9FCegRjhdleaFfUbCJ8NqFUboqRAyoN5RKCPE9
	 IcCUu2l79NzYNq3ZYXg/1Yo42Cb3zaVVHWhAh2pjDG1M2xP/36hMvAheFksko9zrdi
	 21KNzoHJhQ8CUrzQiK6N9wiCrYWEuL8gHrCo6PA/R/7a6cFbJpPRaVBcvf5awtAOks
	 cIrwKfgrhDvLg==
Date: Mon, 26 May 2025 16:37:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mtd: jedec,spi-nor: Add atmel,at26*
 compatible string
Message-ID: <20250526-custodian-extruding-3b1889adc7f3@spud>
References: <20250523155258.546003-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UXH9PATu1F7hJsVg"
Content-Disposition: inline
In-Reply-To: <20250523155258.546003-1-Frank.Li@nxp.com>


--UXH9PATu1F7hJsVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 11:52:58AM -0400, Frank Li wrote:
> Add atmel,at26* compatible string to fix below CHECK_DTB warning:
>=20
> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/spi@4002c000/at=
26df081a@0:
>     failed to match any schema with compatible: ['atmel,at26df081a']
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--UXH9PATu1F7hJsVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSK0gAKCRB4tDGHoIJi
0rMbAP46/aPf2cqfy3ZoD9HgTAgaGU7QaE0uUCfsNN9liR6RWgEAzie7LzEH2tOs
Accn0UQQ+IRbSANsvdQYP2eIHvaBegw=
=lH/v
-----END PGP SIGNATURE-----

--UXH9PATu1F7hJsVg--
