Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F9DAD5A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228033; cv=none; b=c3e3tKd5188RD3FW2yq6iwozU68NYynf9b7kzslr2tGJFqjqzlHdIlN7mUr8BFDLn4fLieRCLSHFtDkkL6OQXckTOfba8c5BYpv2wX7zoB1JPggS3CC9d6gMn7cEVXOgSQDisjS/tdH4j21+CbdfUrVe1M4IhsA/rQAzB1pupGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228033; c=relaxed/simple;
	bh=BMWCTnrbswhAIoIlD9yTM51haeoisElLrndTygbZ+aA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ETwuvHPDpt1YoRiO8ixCEmmWy46kvijDKIA4Sx9awtOIvrI1DA0O9JTsK6xo2ORCJQSzxsM1yaMAhu/iBCmiujaeTT7h0pXVkPy7DjeOyw8nzfW9tMEfy/mkZi/A/6RTXBmp8g50h1ZeSaGWzuIK9UMYlYX0naEONM9iLAqeOl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uFBos-0005kf-Gu; Wed, 14 May 2025 15:06:46 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uFBop-002iQl-34;
	Wed, 14 May 2025 15:06:44 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uFBoq-000Bls-10;
	Wed, 14 May 2025 15:06:44 +0200
Message-ID: <0197d176fa7a6498bdc138dca6ba881648a7e30d.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/4] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ze Huang <huangze@whut.edu.cn>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Wed, 14 May 2025 15:06:44 +0200
In-Reply-To: <20250418-b4-k1-usb3-phy-v2-v2-4-b69e02da84eb@whut.edu.cn>
References: <20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn>
	 <20250418-b4-k1-usb3-phy-v2-v2-4-b69e02da84eb@whut.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Fr, 2025-04-18 at 21:19 +0800, Ze Huang wrote:
> Add support for USB 3.0 mode on the K1 PCIe/USB3 combo PHY. Currently,
> only USB mode is supported; PCIe support is not included in this change.
>=20
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  drivers/phy/spacemit/Kconfig          |   8 ++
>  drivers/phy/spacemit/Makefile         |   1 +
>  drivers/phy/spacemit/phy-k1-combphy.c | 251 ++++++++++++++++++++++++++++=
++++++
>  3 files changed, 260 insertions(+)
>=20
[...]
> diff --git a/drivers/phy/spacemit/phy-k1-combphy.c b/drivers/phy/spacemit=
/phy-k1-combphy.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a291b7a78fae2f4072b74c1d2=
cc65847ed821bec
> --- /dev/null
> +++ b/drivers/phy/spacemit/phy-k1-combphy.c
> @@ -0,0 +1,251 @@
[...]
> +static int spacemit_combphy_probe(struct platform_device *pdev)
> +{
> +	struct spacemit_combphy_priv *priv;
> +	struct phy_provider *phy_provider;
> +	struct device *dev =3D &pdev->dev;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->phy_ctrl =3D devm_platform_ioremap_resource_byname(pdev, "ctrl");
> +	if (IS_ERR(priv->phy_ctrl))
> +		return PTR_ERR(priv->phy_ctrl);
> +
> +	priv->phy_sel =3D devm_platform_ioremap_resource_byname(pdev, "sel");
> +	if (IS_ERR(priv->phy_sel))
> +		return PTR_ERR(priv->phy_sel);
> +
> +	priv->lfps_threshold =3D COMBPHY_USB_LFPS_THRES_DEFAULT;
> +	device_property_read_u8(&pdev->dev, "spacemit,lfps-threshold", &priv->l=
fps_threshold);
> +
> +	priv->rx_always_on =3D device_property_read_bool(&pdev->dev, "spacemit,=
rx-always-on");
> +	priv->type =3D PHY_NONE;
> +	priv->dev =3D dev;
> +
> +	priv->phy_rst =3D devm_reset_control_get(dev, NULL);

Please use devm_reset_control_get_exclusive() directly.

regards
Philipp
