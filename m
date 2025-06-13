Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D628F10F9;
	Fri, 13 Jun 2025 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826049; cv=none; b=R2Vk1QLjjNF3NLTJZRqQMn6UgTBQsaFLY6XMlO+8qexLXV4Fokofr2vMnz/dYGqEFojFLL8y2okFog+JCJZRV7tTe6AaKJuBXPC99fFafxBRGVXsjww04DFkaaw5b33oPETDhl4LXFZ8mg8v52u63s/Aic4D3xm0JHkisHtddEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826049; c=relaxed/simple;
	bh=Vck2Z3Pn+YuFhuarhlC9R7s/5ZP8BvkQdzh7LJHwePE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHMArMafbW1qJuy9FfWnbHvSpNsL1AWe9FDd+pVAhHrJmKRJMsG2VfdknYPexMavLRV+YccPxhWm7Ocvy3y3Jv5ewEnX6stlYWQpk8+/OmEWZUHvQL+XJC3dOnF1+xj4lSvOWGgWsxMfZ/lZOL3ycPqseFvcLnYuvp4P4cP/BOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOCpuMA9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOCpuMA9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7429EC4CEE3;
	Fri, 13 Jun 2025 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749826048;
	bh=Vck2Z3Pn+YuFhuarhlC9R7s/5ZP8BvkQdzh7LJHwePE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dOCpuMA9hqXLFa9KJ4I8LAiuqIqbK9S4cdhLImmLbzbfKzK8jRS8CV1UyQopxGbiN
	 yVyxhdY+/hP/4EO25XmBvKRIuh/Eh/h6YD0ES3F4Nj7eL1AExBJoWeMKDPrtuBWCgY
	 WWjMRT/gCVZ+V5py9J3LYhZDBcYLdXxFk5ds3i3g7FdNkcgmpZhLPsa8bun1qvRTTj
	 06zocGTvj6/uVH9i8DuviVVvAfoPr2rddauLoXAdU1CoGOMX/8UT6oNglLwdHtQsVd
	 OhU7RgX8iv5aiQ0MzVVX5Yj01npyM8A1Bdyk3FNruwn6OuDEzdellbktWbaH4TXl9g
	 4Gv2EvDdo8qZw==
Date: Fri, 13 Jun 2025 15:47:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Ghennadi Procopciuc <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 1/3 v2] dt-bindings: usb: Add compatible strings for
 s32g2/s32g3
Message-ID: <20250613-alongside-remark-819b10305ca7@spud>
References: <cover.1749747898.git.dan.carpenter@linaro.org>
 <cb3970d93f2df0d350f3f3de27d9f0cdb41d0d3b.1749747898.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GK+9otxDYzRic2k2"
Content-Disposition: inline
In-Reply-To: <cb3970d93f2df0d350f3f3de27d9f0cdb41d0d3b.1749747898.git.dan.carpenter@linaro.org>


--GK+9otxDYzRic2k2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 09:50:51PM +0300, Ghennadi Procopciuc wrote:
> From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>=20
> Add the compatible strings for the NXP s32g2 and s32g3.  These chips
> are mostly compatible.  The one difference is that the s32g2-usbmisc
> device has an errata ERR050474 which requires a special flag to be set
> for handling packages that aren't 4 byte aligned.
>=20
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

This signoff chain is absolutely wrong, what were the contributions of
Larisa, Ionut or Dan to this patch? If they were co-authors (surely not
4 people for a trivial 4 line diff) they need co-developed-by tags.
You sent it, so your name should be last.=20
> ---
> Changes since v1:
> 1: Alphabetize
> 2: Update the commit message a bit.
>=20
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 2 ++
>  Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml  | 2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Do=
cumentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index cc5787a8cfa3..f6372b76ed5a 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -23,6 +23,8 @@ properties:
>            - nvidia,tegra30-udc
>            - nvidia,tegra114-udc
>            - nvidia,tegra124-udc
> +          - nxp,s32g2-usb
> +          - nxp,s32g3-usb
>            - qcom,ci-hdrc
>        - items:
>            - enum:
> diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Doc=
umentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> index 019435540df0..ca677d1a8274 100644
> --- a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> +++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> @@ -21,6 +21,8 @@ properties:
>            - fsl,imx53-usbmisc
>            - fsl,imx6q-usbmisc
>            - fsl,vf610-usbmisc
> +          - nxp,s32g2-usbmisc
> +          - nxp,s32g3-usbmisc
>        - items:
>            - enum:
>                - fsl,imx6ul-usbmisc
> --=20
> 2.47.2
>=20

--GK+9otxDYzRic2k2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEw5+wAKCRB4tDGHoIJi
0jfHAQCkXsavnoWfTZY4GsGpIgS9OIp2XucKbJDZfr4z7ZRpHAD6A6tUb10kViaP
x6MhqceZjJ2qIXckKfk7V3lgR3mCjQg=
=V3nJ
-----END PGP SIGNATURE-----

--GK+9otxDYzRic2k2--
