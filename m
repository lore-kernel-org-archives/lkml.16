Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170DD242927;
	Tue, 10 Jun 2025 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568735; cv=none; b=V3cT9MvzEc59H86tbYJZQz34wypGAE9QmOZWmjmfp2tcGTeEuoanAE66AvkLx2EeBMHFYkJWxU6IspYY7obVXFLyr5RhNe+Ur5JeVzO7wzhIdgP5yZwV79tqKfR2/mPM6ADXqAkZ8nkIKGSf0kojU9sEQifHgw4tiTJcUsv9/TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568735; c=relaxed/simple;
	bh=vtK4N2nV0cyw0wDbbUBhQ5HdwbhCZwPcY+S9Qz9vAuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dONXJWtdR7dhyPXc2CsI4auu9sc4q72Tbt1UDqB6dcStVgq0HfMEZsRg9Ubl2LjqCOwELEDvLl/N9VTHQo5bNXpSo+L3DTRvNcMV0L/kXWUyzbdsoiQUGsTMLjqVQ5Stwpp9O+WcqDX0DLIkbl9LXZ9BsPtM/ciPBr12ovrfpEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCdD1UIF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCdD1UIF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CAFC4CEED;
	Tue, 10 Jun 2025 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749568734;
	bh=vtK4N2nV0cyw0wDbbUBhQ5HdwbhCZwPcY+S9Qz9vAuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCdD1UIF3pT9KlgGAozGLVfxpQY8eOmtWkSY4Z59Kck1u5g9v9xQ5uagNzvLhW3ZH
	 uK2UY/wkqxFIsuelWSaxH2SlmYipdfb11/Y/e/AqfTuJaaKvwR0a0GIrnnn4rDiM0o
	 WLRkI5i1I7aeD/UvW6QsgP7zBlSK3cQKkezSxFqu/bTXuSvhNDhxpaNWXVsh0ydEwD
	 0NPzKlXb1xOQ/vImGoNO+SiR/Ov7gsLwzt/f5UxH9s8i4P7PyFyRCG3R4/Dg6Z+ufl
	 WVmFD+kjZTHucIOqQfQutA+hAL//nPK/E39ud1svGLtV7X88+t1m2XLRReu1V//9wU
	 cYl36aeUzSdIQ==
Date: Tue, 10 Jun 2025 16:18:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johnson Wang <johnson.wang@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: nvmem: mediatek: efuse: split
 MT8186/MT8188 from base version
Message-ID: <20250610-magnifier-petty-6c5a2703a05b@spud>
References: <20250610063431.2955757-1-wenst@chromium.org>
 <20250610063431.2955757-2-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DM5pv65IWOkWZD6g"
Content-Disposition: inline
In-Reply-To: <20250610063431.2955757-2-wenst@chromium.org>


--DM5pv65IWOkWZD6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 02:34:29PM +0800, Chen-Yu Tsai wrote:
> On MT8186 and MT8188 one of the NVMEM cells contains the GPU speed bin
> value. In combination with the GPU OPP bindings, on these two platforms
> there is an implied scheme of converting the cell value to what the GPU
> OPP "opp-supported-hw" property matches. This does not apply to the base
> mediatek,efuse hardware, nor does it apply to any of the other platforms
> that do not have the GPU speed bin cell. The platform maintainer argues
> that this makes the compatibles incompatible with the base
> "mediatek,efuse" compatible, as shown in the link given.
>=20
> Deprecate the MT8186/MT8188 + "mediatek,efuse" combination, and add
> new entries with MT8186 being the base model and MT8188 falling back
> to MT8186.
>=20
> Link: https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@co=
llabora.com/
> Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add support fo=
r MT8188")
> Cc: Johnson Wang <johnson.wang@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--DM5pv65IWOkWZD6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhM2QAKCRB4tDGHoIJi
0oO9AP9azxR15Z4FWTzZIHXzTVLpSbkeveExJbyNmwEG9jz1YgEA7QM4o5Pznk8M
kkIC1s0vwuNnCCBmMQrcnoicWNN5zQQ=
=3doB
-----END PGP SIGNATURE-----

--DM5pv65IWOkWZD6g--
