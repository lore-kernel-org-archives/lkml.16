Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC82C2F433B;
	Thu, 12 Jun 2025 15:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742367; cv=none; b=QChiNQ2rnCAhHXREwm2l9FdqaLHNwI+dQjQuVBnqjYoEaLlozJwJMGOPwmxF7dyod+nHauHOLO37B8Pm1DdgWNo4aJKJ2Cdhjsn47fwn+l2n31fQBNH1KSz/ac4ea+N/dyDPceFZWkBUK11noEULAjaUhBx320+X2TOPeAtc/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742367; c=relaxed/simple;
	bh=ph6Qm/Zu8qima9WKxdl5cyVv5qHWsu81Bj3LUOBhyKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWNK0nb7m9CENp/EYQG8cbo7pt6DQrewSMGCyXZkMsyXA7NI8dP9dD3cSAd26DXDpocq3XJd5orCGHuvz/OboJsZerHHooc4bixCrwyaRlfnMHeNs4CkCtrlhBi3RoYRaa/1nCMURgoZB0r8QDnM+I0ozTrNEzGG/Y2AIFB9qrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z76ZSExR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z76ZSExR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08E2C4CEEA;
	Thu, 12 Jun 2025 15:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749742367;
	bh=ph6Qm/Zu8qima9WKxdl5cyVv5qHWsu81Bj3LUOBhyKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z76ZSExR2NJPvxfNLitwVNJ5/gkyfINE0FpXuI7C7oGqvl8Zn1ZyMS/9uVC2IpR3X
	 09bfN1i2mar7nJEWgySKEKpoTa/nTnNwSkqxfk70ftJo5X8GIHAU5VswfQVQIOz1+l
	 8NtZ2bjR6isp5W7bsPpmVofipF2S4kMB/mgB8W814UthCVjfFGusQE032+AC6ap4QG
	 vk0U/oSHFQMh+cJlifm4SNJAn4BclvKe0pCgcPapGFPk5ATt3WZTA20wZD+p+FM6v0
	 gwalPJTCRN8jwH0Ji6T1iAlMgO/zBMWQ4cL7Azo29AIBQHj2KqHbKJbi1Zm4psxM9k
	 mTPuIUKuwqlog==
Date: Thu, 12 Jun 2025 16:32:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document Synaptics TDDI
 panel driver
Message-ID: <20250612-agency-mothball-3830177fd43b@spud>
References: <20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org>
 <20250612-panel-synaptics-tddi-v1-1-dfb8a425f76c@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VDw7BB0FAKwf3bbg"
Content-Disposition: inline
In-Reply-To: <20250612-panel-synaptics-tddi-v1-1-dfb8a425f76c@disroot.org>


--VDw7BB0FAKwf3bbg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 08:09:40PM +0530, Kaustabh Chakraborty wrote:
> Document the driver for Synaptics TDDI (Touch/Display Integration) panels.
> Along with the MIPI-DSI panel, these devices also have an in-built LED
> backlight device and a touchscreen, all packed together in a single chip.
> Also, add compatibles for supported panels - TD4101 and TD4300.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/display/panel/synaptics,tddi.yaml     | 92 ++++++++++++++++=
++++++
>  1 file changed, 92 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,td=
di.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,tddi.ya=
ml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3aae1358a1d764361c072d3b5=
4f74cdf634f7fa8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,tddi.yaml

File called synaptics,tddi

> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,tddi.yaml#

id of samsung,tddi

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics TDDI Display Panel Controller
> +
> +maintainers:
> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - syna,td4101-panel
> +      - syna,td4300-panel

compatibles are syna,td####-panel

These should be consistent and tooling should have complained about the
mismatch between id and filename at the least.


--VDw7BB0FAKwf3bbg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaErzGgAKCRB4tDGHoIJi
0h3oAP9CB4FuHC6Rw0Tmtlumy5MJLtCuVVJfVPJHDzHi2EHfSwEAj7OX7AU+mI7c
+Vxcu5Bly5SfP5x+z5e0plVKW4Jh6Qk=
=2rxw
-----END PGP SIGNATURE-----

--VDw7BB0FAKwf3bbg--
