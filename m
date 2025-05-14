Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563BE282ED;
	Wed, 14 May 2025 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237845; cv=none; b=mdyqPxdB7/pqh2E12JjKGiWxAWdz8Zfi8pFJfIiC6BtqhPlQ3oyUqzF34u1nRFvBD9g9LSUOaimbMh5LJ/r4o8x93MLzvmAGabSWTHiof9lf2y4fdY5BVEMLNwGg/ui6hJXGXmpXKR6jZwguvZJru3BdZkox5SHVY9Y6xnfC6Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237845; c=relaxed/simple;
	bh=M3woz04Pv9OqB7s5d5XN3SM8aX7++vAPSKJ2i0HXWMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0pYopvBnRyZ/ICWS+i8oxB6Hz+XNfyHokXzhj2dKZEbNXaqhqws8CFmCxp1aV6ydv3V9I+SzcriLYY53m5EqxOoUAKxw7+3M+z9WPdubunLbnSmTlb5si2OZzOX+FM+U1Z9NdCDpgCCs97OZANTC/W9Bpbu7MWfTVqEKpA6DnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yw6lBK8w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yw6lBK8w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05264C4CEED;
	Wed, 14 May 2025 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237842;
	bh=M3woz04Pv9OqB7s5d5XN3SM8aX7++vAPSKJ2i0HXWMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yw6lBK8wkLDW8v1I/JLiN8afunRJZg5PZW9nhqlzybGETE51+sgaGZ7d+tcW7cMhI
	 nBTtxybN9FYVZowX+ODaqGqHiOrst8TO03GFRjiQk4nzyC6TonnBVgF5egMU11XGtP
	 9YsDB3MeNHgg/5LJ0Ex4/cUtzS2/OBSboIB9gh/Qp6Q8okW8W6GgnlZG/kEDxmwOR2
	 m2Jvh3omi5R2w0y4+WNRNytT+TZvZ3P+4f1oXVfi+UFg1TJv49bVNdw+r1zHmSVCxl
	 1VZ+yfF4ymBVTewvnNpfX+2Zj3ONBRtMiNpMq65+xRmQxDyeA/NF8A7UsHkVRyxlW1
	 YUxHqc7A/EPww==
Date: Wed, 14 May 2025 16:50:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: Simplify
 mediatek,clk-provider
Message-ID: <20250514-stir-porridge-b52d88b50ae1@spud>
References: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5CRYNW3obN/3u7l6"
Content-Disposition: inline
In-Reply-To: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>


--5CRYNW3obN/3u7l6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 12:57:03PM +0200, Krzysztof Kozlowski wrote:
> "mediatek,clk-provider" property is a string, not an string array, thus
> "items" is not really correct.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--5CRYNW3obN/3u7l6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCS7zQAKCRB4tDGHoIJi
0vucAP0ZLj98/0xHcsnZq3ruzOd9P3Y0Z5wyirXAYCFjg+5G2QEA92rfx6Wpafbl
JUg58i+SRsWf56f7tK0VKcHUSIbJPAk=
=KTct
-----END PGP SIGNATURE-----

--5CRYNW3obN/3u7l6--
