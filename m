Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF652E5424
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539163; cv=pass; b=VTUvlgWKlJtPIoAUt8FS8P3IzeNvDD8lQx9612mzIsDy8rf/SbgLsjMgIURW9u4a9E+yfQVjawtJZHKbJdEq3VyY/ighthhAUi6pc3cu+lHD5gdlOJp2IYna9mvqajlrRAZjSsFM+MyNvBmpaET5QOQVLoQrMLIMHDUabBtUGZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539163; c=relaxed/simple;
	bh=J/vbYDbPU3juWbr/LwjVCLU1cq1NokQV/yI+R7rcD0I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bcUeZ7YqNaD4f7Y+Lj3+SdNURs9hEupETcibVShLqW3f4If0MsLEQLZMtpjpONSozVkM+LesbckXx7vGjZQhMoJmzp2blOZ5xSQkuSxcsQDa5NzSKutSlMw5uS2IM9BCaKUdZIu1DYRQWh02+o17JR/zEqVxPx7bqM4C7b7v0OI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b=Ua4joRz7; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="Ua4joRz7"
ARC-Seal: i=1; a=rsa-sha256; t=1751539145; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OGmTYjb87a/HQQfJ80nuoMM3J5giu9DFlFLheBZM1lWvnWDiOMp9wWhc6sM77tEy1ydXz087rntZgP0XRPFayh7/+6AIYl4/GsM1wkQ3n8qa6H0FCKLoRUVY6HRRJ61CZ9b1OB/QBYNTWJ3UA09pcCeMVrIaAE3yG/LAQMsMunA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751539145; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PUMUxTQyz4Rw+I/k6r4nKllDMvLQcH1q/9NQSkvh/Tc=; 
	b=gYW8iVfmd0xLbwpe/lltOymsMhP2xnfMuf9kG5gDgz4TIM77kd5B/HOrZYUOxLvR/HxU5dRuW5kbHKrZAECfrY4FR6TvgZRFrBMwIyVjXu0l4aNreUspfiSwGUYHgp026ULp0m84Y1wDGwJtZOeb9kzDr9ML2p9IyKB0j+jh7IE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751539145;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=PUMUxTQyz4Rw+I/k6r4nKllDMvLQcH1q/9NQSkvh/Tc=;
	b=Ua4joRz7J0WXVyQAc9oiuwImuog9VPquGVoKz8hsGX4MlyXyvGKyYEWhXUMYSB1b
	bxWzSzqxKFQXqxPM/+iZ+zse3v9BlcQY/CYJ239YdacuajaqPPZhXqldqhvDkvEt+pJ
	elYxIhb16kp8exk5hBD/X4HuM6rC5REb8wCqfDBU=
Received: by mx.zohomail.com with SMTPS id 1751539143453232.01329008697712;
	Thu, 3 Jul 2025 03:39:03 -0700 (PDT)
Message-ID: <8958966b96140aaaae97b480b7a6c1698a6d2ae2.camel@collabora.com>
Subject: Re: [PATCH] MFD: mt6397: do not use generic name for keypad
 sub-devices
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, Yassine Oudjana
	 <y.oudjana@protonmail.com>, =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado"
	 <nfraprado@collabora.com>, Fabien Parent <fparent@baylibre.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Thu, 03 Jul 2025 12:38:59 +0200
In-Reply-To: <r4k3pgd3ew3ypne7ernxuzwgniiyvzosbce4cfajbcu7equblt@yato35tjb3lw>
References: 
	<r4k3pgd3ew3ypne7ernxuzwgniiyvzosbce4cfajbcu7equblt@yato35tjb3lw>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

Hi Dmitry,

On Mon, 2025-06-30 at 16:01 -0700, Dmitry Torokhov wrote:
> Do not use "mtk-pmic-keys" when creating sub-device for the keypad to
> make sure the keypad driver will only bind to the sub-device if it
> has
> support for the variant/has matching compatible.
>=20
> Reported-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
> Fixes: de58cee8c6b8 ("mfd: mt6397-core: Add MT6357 PMIC support")
> Fixes: 4a901e305011 ("mfd: mt6397-core: Add resources for PMIC keys
> for MT6359")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>=20
> This is not tested so if someone with hardware could try it out that
> would be great. I *think* it should work...
>=20
> =C2=A0drivers/mfd/mt6397-core.c | 12 ++++++------
> =C2=A01 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 5f8ed8988907..3e58d0764c7e 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -136,7 +136,7 @@ static const struct mfd_cell mt6323_devs[] =3D {
> =C2=A0		.name =3D "mt6323-led",
> =C2=A0		.of_compatible =3D "mediatek,mt6323-led"
> =C2=A0	}, {
> -		.name =3D "mtk-pmic-keys",
> +		.name =3D "mt6323-keys",
> =C2=A0		.num_resources =3D ARRAY_SIZE(mt6323_keys_resources),
> =C2=A0		.resources =3D mt6323_keys_resources,
> =C2=A0		.of_compatible =3D "mediatek,mt6323-keys"
> @@ -153,7 +153,7 @@ static const struct mfd_cell mt6328_devs[] =3D {
> =C2=A0		.name =3D "mt6328-regulator",
> =C2=A0		.of_compatible =3D "mediatek,mt6328-regulator"
> =C2=A0	}, {
> -		.name =3D "mtk-pmic-keys",
> +		.name =3D "mt6328-keys",
> =C2=A0		.num_resources =3D ARRAY_SIZE(mt6328_keys_resources),
> =C2=A0		.resources =3D mt6328_keys_resources,
> =C2=A0		.of_compatible =3D "mediatek,mt6328-keys"
> @@ -175,7 +175,7 @@ static const struct mfd_cell mt6357_devs[] =3D {
> =C2=A0		.name =3D "mt6357-sound",
> =C2=A0		.of_compatible =3D "mediatek,mt6357-sound"
> =C2=A0	}, {
> -		.name =3D "mtk-pmic-keys",
> +		.name =3D "mt6357-keys",
> =C2=A0		.num_resources =3D ARRAY_SIZE(mt6357_keys_resources),
> =C2=A0		.resources =3D mt6357_keys_resources,
> =C2=A0		.of_compatible =3D "mediatek,mt6357-keys"
> @@ -196,7 +196,7 @@ static const struct mfd_cell mt6331_mt6332_devs[]
> =3D {
> =C2=A0		.name =3D "mt6332-regulator",
> =C2=A0		.of_compatible =3D "mediatek,mt6332-regulator"
> =C2=A0	}, {
> -		.name =3D "mtk-pmic-keys",
> +		.name =3D "mt6331-keys",
> =C2=A0		.num_resources =3D ARRAY_SIZE(mt6331_keys_resources),
> =C2=A0		.resources =3D mt6331_keys_resources,
> =C2=A0		.of_compatible =3D "mediatek,mt6331-keys"
> @@ -240,7 +240,7 @@ static const struct mfd_cell mt6359_devs[] =3D {
> =C2=A0	},
> =C2=A0	{ .name =3D "mt6359-sound", },
> =C2=A0	{
> -		.name =3D "mtk-pmic-keys",
> +		.name =3D "mt6359-keys",
> =C2=A0		.num_resources =3D ARRAY_SIZE(mt6359_keys_resources),
> =C2=A0		.resources =3D mt6359_keys_resources,
> =C2=A0		.of_compatible =3D "mediatek,mt6359-keys"
> @@ -272,7 +272,7 @@ static const struct mfd_cell mt6397_devs[] =3D {
> =C2=A0		.name =3D "mt6397-pinctrl",
> =C2=A0		.of_compatible =3D "mediatek,mt6397-pinctrl",
> =C2=A0	}, {
> -		.name =3D "mtk-pmic-keys",
> +		.name =3D "mt6397-keys",
> =C2=A0		.num_resources =3D ARRAY_SIZE(mt6397_keys_resources),
> =C2=A0		.resources =3D mt6397_keys_resources,
> =C2=A0		.of_compatible =3D "mediatek,mt6397-keys"
> --=20
> 2.50.0.727.gbf7dc18ff4-goog
>=20
Thanks for the patch.

I've tested it with a kernel based on next-20250702 on both Mediatek
Genio 350-EVK and Genio 1200-EVK boards with mtk-pmic-keys driver
enabled either as builtin or module.

With the Genio 350-EVK, the mtk-pmic-keys driver probes OK:=20
```
[    0.601874] input: mtk-pmic-keys as
/devices/platform/soc/1000d000.pwrap/1000d000.pwrap:pmic/mt6357-
keys/input/input0
```
The keys work too.

For the Genio 1200-EVK, it fails to probe as expected (because
'mediatek,mt6359-keys' compatible is missing) and there is indeed no
kernel panic in the builtin case (the issue I reported with my patch)
```
[    0.459178] mt6359-keys: Failed to locate of_node [id: -1]
```

Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> # on
Mediatek Genio 350-EVK and Genio 1200-EVK

Regards,
Louis-Alexis
