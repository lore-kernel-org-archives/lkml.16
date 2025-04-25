Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DA91DFDAB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582371; cv=none; b=lfAYwnxC3px+jb+VdVtcJnGZ8NSgGDY61VHASw/DP9stMTrLR/PYuzxK0Nd89mbc1upqptcFV/rxig/fIDQTzRUU7rvfUBw60LxNOV1YU6bDuXVaoC8ke1u2AQPoSRfBbDiVP8JusKqXzyRMIH8cG9JBuKRtj+sdM4fczJZZTeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582371; c=relaxed/simple;
	bh=OrK+DvF689UqfSSIY1P2lSSI9ygH9bOfuWGn9CE8Fbo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uo5g6deDaQHQ7gDwIXGwsWW+ABmX/y7YRHAwq+IWfRMt0JD2FXzxU5sdx2WTQbucalT3RuarzQSBOz3C8yv2BEDGALd7aRY+XLGrMNUkNvEyHV0vDX/XlzrRibfGfR1aj8dGampFeZkf4Y3bGPAO/kKtTWkE6hyOLiSyGEBSh/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RETbntMZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RETbntMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745582367;
	bh=OrK+DvF689UqfSSIY1P2lSSI9ygH9bOfuWGn9CE8Fbo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RETbntMZsItntHquRM2Uky6C0lFfkp6DCJMJ/sardBOp9RXSNK0n942QAliT3rheB
	 XaVCOPa0uEYSKjQPBcE2ILU15LbCnY+vnVSMZxJI13Ajg2jjUJeKOk4U0O3r3CIR/w
	 2FFmRMdR4RWbQkODbzBOjwJMc7DKGBUv/PDm7urQdkHgiB97y7gf5pQ1z4llwUAc4b
	 j2qTI/h8UkfglAvz0GUexSDY0PYYcc9dRrUqMCYfYBIr8Kmv0uLmGRi17BfQRyuEks
	 dH3GPfh33UgC3Hhr/RIjYvn4/P/OUwXiTSPS4c+ur3npErGQGFHRv9Yd8yaplogVRY
	 jcm32cW2AsFDA==
Received: from eldfell (unknown [194.136.85.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pq)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 448AB17E0F66;
	Fri, 25 Apr 2025 13:59:27 +0200 (CEST)
Date: Fri, 25 Apr 2025 14:59:15 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko
 <anatoliy.klymenko@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250425145915.40c8c1ac@eldfell>
In-Reply-To: <20250425-xilinx-formats-v5-3-c74263231630@ideasonboard.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
	<20250425-xilinx-formats-v5-3-c74263231630@ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JSQZW.oAKGXjXlVbB.Z8zQ3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JSQZW.oAKGXjXlVbB.Z8zQ3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Apr 2025 14:01:23 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Add greyscale Y8 format.
>=20
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  |  1 +
>  include/uapi/drm/drm_fourcc.h | 10 ++++++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index e101d1b99aeb..355aaf7b5e9e 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -267,6 +267,7 @@ const struct drm_format_info *__drm_format_info(u32 f=
ormat)
>  		{ .format =3D DRM_FORMAT_YVU422,		.depth =3D 0,  .num_planes =3D 3, .c=
pp =3D { 1, 1, 1 }, .hsub =3D 2, .vsub =3D 1, .is_yuv =3D true },
>  		{ .format =3D DRM_FORMAT_YUV444,		.depth =3D 0,  .num_planes =3D 3, .c=
pp =3D { 1, 1, 1 }, .hsub =3D 1, .vsub =3D 1, .is_yuv =3D true },
>  		{ .format =3D DRM_FORMAT_YVU444,		.depth =3D 0,  .num_planes =3D 3, .c=
pp =3D { 1, 1, 1 }, .hsub =3D 1, .vsub =3D 1, .is_yuv =3D true },
> +		{ .format =3D DRM_FORMAT_Y8,		.depth =3D 8,  .num_planes =3D 1, .cpp =
=3D { 1, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .is_yuv =3D true },
>  		{ .format =3D DRM_FORMAT_NV12,		.depth =3D 0,  .num_planes =3D 2, .cpp=
 =3D { 1, 2, 0 }, .hsub =3D 2, .vsub =3D 2, .is_yuv =3D true },
>  		{ .format =3D DRM_FORMAT_NV21,		.depth =3D 0,  .num_planes =3D 2, .cpp=
 =3D { 1, 2, 0 }, .hsub =3D 2, .vsub =3D 2, .is_yuv =3D true },
>  		{ .format =3D DRM_FORMAT_NV16,		.depth =3D 0,  .num_planes =3D 2, .cpp=
 =3D { 1, 2, 0 }, .hsub =3D 2, .vsub =3D 1, .is_yuv =3D true },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 1247b814bd66..5af64a683dd7 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -405,6 +405,16 @@ extern "C" {
>  #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsamp=
led Cb (1) and Cr (2) planes */
>  #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsamp=
led Cr (1) and Cb (2) planes */
> =20
> +/*
> + * Y-only (greyscale) formats
> + *
> + * The Y-only formats are handled similarly to the YCbCr formats in the =
display
> + * pipeline, with the Cb and Cr implicitly neutral (0.0 in nominal value=
s). This
> + * also means that COLOR_RANGE property applies to the Y-only formats.
> + *
> + */
> +
> +#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only =
*/
> =20
>  /*
>   * Format Modifiers:
>=20

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/JSQZW.oAKGXjXlVbB.Z8zQ3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgLeRMACgkQI1/ltBGq
qqdEDQ//dymbV1AaVc1uZviLxZPiwEKEaX3Yn350tWej+EKakdNVsWnpBIKuoaET
BGW+KzCbP+Za7hPbDC2wIUNhthPeGnpysrxH4EQ+Zp+GXOXLZoB8/cudpKsf4cmc
HZnkEQiPw67xNzi8ylHdvEtRMpyRI5bPxXR5oNeFviwVDo+ob9Qo2YcE+M38yDD1
IxyjhxVYpZP4vfF1zzq3dOmo+RmoOwFy2nLz2v6syL2bCwRuKgIO4KjRYP5rUbOs
mag51hyJL1G2lWuBvupIwwaka6ch0rVb5LwlcJTXynWHcVyGJf7FkHzm7zh8LMtB
A/nT+dxkEwIElg94c1Tl1DWP3ZRD+hWTdrPKen8p890qGdEvxsPtkzAU2jb5Ym7q
RyxBRojyZTA56zRUBaL5+fs1JGVv9qsR2wSVkjNdGaqiKAu0xFjscRuNZKUwkEWH
fpJcJbcMpfnVxLcWvDsHTR3ERHSU/BTNWQlLU37cGbn9iDrEWTBnffQ/3KHjd/As
aE6z+tQt3JEqopNFsc5U85DMr7rhFpZnHUHkhood/tT6O3YI/EgIwIzlcIbRDko0
iM883QsDu4Z5cud3fSA/Y9ysdvgubJ2IAXmMLs7vjZ0ZeA5K1u7Zma45J1qVhYWc
DEQUSmoJ10NInI3VMbKOQwGvv5pE6Lm4IGYvk3rznLw1QXNcmdk=
=riT8
-----END PGP SIGNATURE-----

--Sig_/JSQZW.oAKGXjXlVbB.Z8zQ3--
