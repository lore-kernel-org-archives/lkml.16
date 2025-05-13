Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC57520D4F2
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143339; cv=none; b=IHdYYr0GgvCNpTXRkUNM0lCYdcHaYo6Df8FInjbBeYZH/pOn8UNLxuDasEckjZ6i3AxpqvLc5Khy33OfN6Hg+dutj07ImHZ6pnQQqzqD2Rks5bZ++gjh1yeU36FuXEQHaLzuu/JxsryP+/rF9vxh3bYOAVNSnq1tRUbirTsHuQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143339; c=relaxed/simple;
	bh=b7LHb4Pmxiyc7l5hvh5otR4XT6HHh2SBDPcCv+MjmRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bglighLa4QK/NHF6Kwd+FSlCEMCJao68qtQKtxLVGlJRhlsSAyXVP+fsukcpYRTuwEP1nMcTmzzFT1vKP6k6Rs0GDP2uvpLqsrRIyLmpoBM+zaaETVY7HeK2RvyCQ80uouFYDdVbmSDxxNzrM7sUz5CZDcb3As7LqQFgeX4CmIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDlE6BHf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDlE6BHf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DAAC4CEE4;
	Tue, 13 May 2025 13:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747143339;
	bh=b7LHb4Pmxiyc7l5hvh5otR4XT6HHh2SBDPcCv+MjmRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDlE6BHf80VL2UxT3Z5Rci9OLasSa1LxRRIyYbmCc1IhM4CIT9/EBiUdn3FwlQWd0
	 fzQia6mwz5uABgIB4L0UATk3NUIm8zqhVabu8rcMWyZnRob3k67WsoNxxDOcYCk5Jg
	 4DlciWciZskwdmVNV9+05XnEsmm5BVHweQPY4pzcd2nPH2sRLhXuviEmh4MockgMMd
	 erYQ6npHu1N9iOkLwD/TBeA1Zak1UYWEbhHwX6+JJjs3FdbVudPXAhDNzvP9Llv4+e
	 eqKJ3w1SkZV9k/8hUy0AHuwY/spi4EggWkVfvAL8voi5D3toyH4gLmjopndD4n1Wmr
	 KV9cqsEKfycSg==
Date: Tue, 13 May 2025 15:35:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/23] drm/connector: hdmi: Use YUV420 output format
 as an RGB fallback
Message-ID: <amnwcb3sxo7nbfobag3v2ojowqvrpqqkqykg3qfhxwxzp5olur@fibxgdcs2mee>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-6-5e55e2aaa3fa@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="a6hlm72fbua64am5"
Content-Disposition: inline
In-Reply-To: <20250425-hdmi-conn-yuv-v4-6-5e55e2aaa3fa@collabora.com>


--a6hlm72fbua64am5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 06/23] drm/connector: hdmi: Use YUV420 output format
 as an RGB fallback
MIME-Version: 1.0

Hi,

On Fri, Apr 25, 2025 at 01:26:57PM +0300, Cristian Ciocaltea wrote:
> Try to make use of YUV420 when computing the best output format and
> RGB cannot be supported for any of the available color depths.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 22 +++++++++++++++++--=
---
>  1 file changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 9e0a468073acbb2477eff1abef1c09d63620afaa..1fba10b92a6baa49150b6ff1e=
96bf2c2739bf269 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -648,14 +648,26 @@ hdmi_compute_config(const struct drm_connector *con=
nector,
>  				       8, connector->max_bpc);
>  	int ret;
> =20
> -	/*
> -	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
> -	 * devices, for modes that only support YCbCr420.
> -	 */
>  	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
>  				      HDMI_COLORSPACE_RGB);
> +	if (!ret)
> +		return 0;

Sorry, I missed it on the previous iteration, but this condition
inversion compared to the rest of the function is throwing me off :)

I believe something like

If (ret) {
   if (connector->ycbcr_420_allowed) {
      hdmi_compute_format_bpc(..., HDMI_COLORSPACE_YUV420)
   } else {
     drm_dbg_kms("Can't use YUV420")
   }
}

Would be more natural

Maxime

--a6hlm72fbua64am5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCNKpwAKCRAnX84Zoj2+
dt8XAYCOK4IaWG7FU/T+LFNtb5zU7MH+Hu374lCyL9mTlGlP2QdW+T+sRNb1X9mu
ATM7X3MBf2D94Re1pgtxyZAB5MMOeacGQm8l6wb01iw06zEDVYH/Nbe7mUwLP03+
WQsWb4+KbQ==
=NAym
-----END PGP SIGNATURE-----

--a6hlm72fbua64am5--
