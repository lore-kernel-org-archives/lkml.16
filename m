Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD5C296D27
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308270; cv=none; b=P+QVpkJ2q7JMIgaZ26nAP6+bvEGRWRGyMevtI8/+/xUIMwDyTW6zkzjawgcIlGJ5IDq3VRf3Z0TCg/dEE0fXo8i8L/vuEINs2jQ8cTWU3euLicwFT48tnCHWX/O7r778Z9/Nh1hEZfClnyOCB7LogrHKfA5Jd6aOanJ9/LeyfEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308270; c=relaxed/simple;
	bh=ImtyEelXTfk5GFXydBAucagBXjdcQTTFKMCCmtAc0PY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=onO3yeU3wptGdfNZYk5pcabac3MMkVkvG895IRsUP3cp492yaoH9A1wovr0xVgqhtwLoU+ifxKU8rdyTPMOnkNYZIHXWGyXGUfAylzdtE0LVvX8Z8dKAAChNOD7QGOl51A+kS3iHVVvFxOSIRVKCisb9b5E7Lu94ZbbyleZG+jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9xzFHwd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9xzFHwd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso8245595e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747308266; x=1747913066; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Oq3luUbNQrh4sO37NnuDYHxjHPc8/KBLQt1bSPbX55c=;
        b=b9xzFHwdS+cqvBRrtbDl7d9CEMiaj9Z2oze/nL/Lax8YgcMjbZOQ1sevfOqL+5aqAf
         fKV7KIzkT1l3ezSGZVKRS5kEjYhkrlJcs5O3QfiqFLdsFagTqbCSAmzvuMQAzW+uiivr
         df4SidGUbehEi7+j4PPH39S4bioEtBeHA0CC/fAfPpQqt7wInLPVvhj3GmoVTHwVGynd
         MZ1pBXw0CPNgcy2+0B+m+rU6UhyyoUgjNJxq5kJp36YuYco7cqQjLovCyX9Q09XTcUVy
         XwBqlanTDplsue7KiSEMbSjrDtopGypaA4JLXEm6CVMW/6wxQD3yCuUby8LQjaGC4jUB
         qXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308266; x=1747913066;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oq3luUbNQrh4sO37NnuDYHxjHPc8/KBLQt1bSPbX55c=;
        b=CN8nLvppFGlsYozkQlMqZsn+0WQyejxXBmwJkxtM5CFqaLyCBRrmMD+S8yvV5tfJJO
         1clGnyW+XNFwMYToDWvejWzyfJnk227d4v+c9FVhqAKNnTYH+I6ZCO/OI5yCbZ/Xs8Mi
         t0ypLKwTBWxzsEDwahwti1rImYXuphCpqTeAMVOarlPAy0sAZ3HddPYzVEeUMOov1vm3
         Tdxak6CFMf8NtHNxAp7k3RHeU/X1fyqRglG/+FuMJowC3KFGrNDBefVyDaP7JIB9Xdwi
         yi8Ij8uyj5zcbeT3yYNhycKxhJzW7EMGGRVi3Pa99+ERYIvuQmrrBEnagTjnLPt+qEiF
         ChLA==
X-Forwarded-Encrypted: i=1; AJvYcCWRyUZU59bl0mcksvnvY9xYMeo6/TDzw+O9LbyhxuhKafvkQmpSL3Jq90es33auHmqZSE7p3F2BUtYU9HE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+77TkAbcqQ9JdT2az1OIQkVFTbmSO0NLbexeouszgekdWkfOT
	SjD0pXQoOQ/o+toD1ymOUv5yIVeFgpA3NlLHFJrg6kiof/h1n/tU9Ch43i4hA58=
X-Gm-Gg: ASbGncutdZrFKO5xzEy7DiSVPU4p9rdXKp7pNch1Dvf/bmKl9f4KkYYdM2orddC8rGQ
	8OdU4wLtg4QItPSfyoZ7cA/ZTMrdTfr4mflFwWVcXII7aPx2tD7lhYMVLC243vfot4rDR+O6Fuz
	NzgRsJri7PVoFhgY37eXeKe2FagFKhkOKMqJR/+esKDeqiixvS6kCibyX0v3vlFE0WV9rkrtUXB
	vyTSm9OJc0FkuDVjjRkQqMb92LGk3c3rXJLghkuDg0rPLJLjMKpgaCRRQFB5pSiYdBB8CqTo70A
	TkRy9sqRoLFkf6oJ7yN1XaD3TGDpq8i+kK4c3cCXnWLg/kbjgKQxUyW5lZKA3lBqkmWDzek+I0Q
	0PWyq3R3iL1GZ92AOXx9U
X-Google-Smtp-Source: AGHT+IHewJ1yK2km4hF4XJnukjwH9B+t5DFAbmZFcOJDYUefiqQ+fuKodfexjRPHQzwg8kOClUt6eg==
X-Received: by 2002:a05:600c:4691:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-442f2168cc3mr58378255e9.25.1747308265655;
        Thu, 15 May 2025 04:24:25 -0700 (PDT)
Received: from [10.61.0.59] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebd47d39sm62595095e9.1.2025.05.15.04.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 04:24:25 -0700 (PDT)
Message-ID: <7cb062aefa6f8287b30c95bb12274c83ff6df34e.camel@linaro.org>
Subject: Re: [PATCH 2/2] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org, 
	kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	alim.akhtar@samsung.com, peter.griffin@linaro.org,
 kauschluss@disroot.org, 	m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, 	faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
Date: Thu, 15 May 2025 12:24:23 +0100
In-Reply-To: <20250514134813.380807-3-pritam.sutar@samsung.com>
References: <20250514134813.380807-1-pritam.sutar@samsung.com>
		<CGME20250514133847epcas5p41a1c413aecefa2fab32357c6c69e999c@epcas5p4.samsung.com>
	 <20250514134813.380807-3-pritam.sutar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.55.2-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Wed, 2025-05-14 at 19:18 +0530, Pritam Manohar Sutar wrote:
> This SoC has a single USB 3.1 DRD combo phy and three USB2.0
> DRD HS phy controllers those only support the UTMI+ interface.
>=20
> Support only UTMI+ for this SoC which is very similar to what
> the existing Exynos850 supports.
>=20
> The combo phy supports both UTMI+ (HS) and PIPE3 (SS) and is
> out of scope of this commit.
>=20
> Add required change in phy driver to support HS phy for this SoC.
>=20
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
> =C2=A0drivers/phy/samsung/phy-exynos5-usbdrd.c | 85 +++++++++++++++++++++=
+++
> =C2=A01 file changed, 85 insertions(+)
>=20
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index 634c4310c660..7b4b80319c5c 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -177,6 +177,9 @@
> =C2=A0#define HSPHYPLLTUNE_PLL_P_TUNE			GENMASK(3, 0)
> =C2=A0
> =C2=A0/* Exynos850: USB DRD PHY registers */
> +#define EXYNOSAUTOv920_DRD_CTRL_VER		0x00
> +#define GET_CTRL_MAJOR_VERSION(_x)		(((_x) >> 24) & 0xff)

I suggest using standard GENMASK() and FIELD_GET() for the version bits ins=
tead.

Cheers,
A.

> +
> =C2=A0#define EXYNOS850_DRD_LINKCTRL			0x04
> =C2=A0#define LINKCTRL_FORCE_RXELECIDLE		BIT(18)
> =C2=A0#define LINKCTRL_FORCE_PHYSTATUS		BIT(17)
> @@ -1772,6 +1775,10 @@ static const char * const exynos5_regulator_names[=
] =3D {
> =C2=A0	"vbus", "vbus-boost",
> =C2=A0};
> =C2=A0
> +static const char * const exynosautov920_clk_names[] =3D {
> +	"ext_xtal",
> +};
> +
> =C2=A0static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_ph=
y =3D {
> =C2=A0	.phy_cfg		=3D phy_cfg_exynos5,
> =C2=A0	.phy_ops		=3D &exynos5_usbdrd_phy_ops,
> @@ -1847,6 +1854,81 @@ static const struct exynos5_usbdrd_phy_drvdata exy=
nos850_usbdrd_phy =3D {
> =C2=A0	.n_regulators		=3D ARRAY_SIZE(exynos5_regulator_names),
> =C2=A0};
> =C2=A0
> +static void exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *p=
hy_drd)
> +{
> +	u32 version;
> +
> +	version =3D readl(phy_drd->reg_phy + EXYNOSAUTOv920_DRD_CTRL_VER);
> +	dev_info(phy_drd->dev, "usbphy: version:0x%x\n", version);
> +
> +	if (GET_CTRL_MAJOR_VERSION(version) =3D=3D 0x3)
> +		/* utmi init for exynosautov920 HS phy */
> +		exynos850_usbdrd_utmi_init(phy_drd);
> +}
> +
> +static int exynosautov920_usbdrd_phy_init(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
> +	int ret =3D 0;
> +
> +	ret =3D clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clk=
s);
> +	if (ret)
> +		return ret;
> +
> +	/* UTMI or PIPE3 specific init */
> +	inst->phy_cfg->phy_init(phy_drd);
> +
> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
> +
> +	return 0;
> +}
> +
> +static void exynosautov920_v3p1_phy_dis(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
> +	void __iomem *reg_phy =3D phy_drd->reg_phy;
> +	u32 version;
> +
> +	version =3D readl(reg_phy + EXYNOSAUTOv920_DRD_CTRL_VER);
> +
> +	if (GET_CTRL_MAJOR_VERSION(version) =3D=3D 0x3)
> +		exynos850_usbdrd_phy_exit(phy);
> +}
> +
> +static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> +
> +	if (inst->phy_cfg->id =3D=3D EXYNOS5_DRDPHY_UTMI)
> +		exynosautov920_v3p1_phy_dis(phy);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops exynosautov920_usbdrd_phy_ops =3D {
> +	.init		=3D exynosautov920_usbdrd_phy_init,
> +	.exit		=3D exynosautov920_usbdrd_phy_exit,
> +	.owner		=3D THIS_MODULE,
> +};
> +
> +static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] =
=3D {
> +	{
> +		.id		=3D EXYNOS5_DRDPHY_UTMI,
> +		.phy_init	=3D exynosautov920_usbdrd_utmi_init,
> +	},
> +};
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_p=
hy =3D {
> +	.phy_cfg		=3D phy_cfg_exynosautov920,
> +	.phy_ops		=3D &exynosautov920_usbdrd_phy_ops,
> +	.clk_names		=3D exynosautov920_clk_names,
> +	.n_clks			=3D ARRAY_SIZE(exynosautov920_clk_names),
> +	.core_clk_names		=3D exynos5_core_clk_names,
> +	.n_core_clks		=3D ARRAY_SIZE(exynos5_core_clk_names),
> +};
> +
> =C2=A0static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] =3D {
> =C2=A0	{
> =C2=A0		.id		=3D EXYNOS5_DRDPHY_UTMI,
> @@ -2047,6 +2129,9 @@ static const struct of_device_id exynos5_usbdrd_phy=
_of_match[] =3D {
> =C2=A0	}, {
> =C2=A0		.compatible =3D "samsung,exynos850-usbdrd-phy",
> =C2=A0		.data =3D &exynos850_usbdrd_phy
> +	}, {
> +		.compatible =3D "samsung,exynosautov920-usb31drd-phy",
> +		.data =3D &exynosautov920_usb31drd_phy
> =C2=A0	},
> =C2=A0	{ },
> =C2=A0};

