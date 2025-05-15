Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9481F873B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320732; cv=none; b=f8r/2P2UytMQnUTm7NDHMeKXD7rlGEMdYapW8TabJneee5NEkGXnRWxHj5r0TvEjUrtLThKRDaoEBn5zqrtOk0nysRfi/50uTOel8pcbCXq8MDSGYcY7jPXDc6zqMM1aXYJCEa+idrCVWioZo/phqTxMiyx/NGZsoQSF1UfsHJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320732; c=relaxed/simple;
	bh=hZDYOdxvakc1x6FXmTGmDIipla/+VXcOKRnwGlndQ2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCUqTUx918K7Fr2k1PX8WDJM1yKwAllkylzEJ4P8oy1wzNI0Bhiy8X/L9umHvC84D2/cbX4cC7pcO9/v1/P4DQ5z5KOhhjWgKYywyL1PQqLphUe6NluxzLVZ2p9Ieb/ahKFjj6f912LWJEJEqiqL2rYkDsI8Z2ySkGm6pZhgiK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBhyPu62; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBhyPu62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB25C4CEE7;
	Thu, 15 May 2025 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747320730;
	bh=hZDYOdxvakc1x6FXmTGmDIipla/+VXcOKRnwGlndQ2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBhyPu62roivi4KAZ4+eM+ZlxVoYrn38XVK0ALZqFsxIA1+wHzyTCs8UAwuqbn6f6
	 BQs/BxUiDUKNSYChrXrXnFdSksdRa80m1m86xWbOO/MkBitMmiMVpd1bzVCaY51oq1
	 2duykOu70MC6nOcgJYwj7KerCowVEjaRrcBmD+cXILcDi5qLcd07GqYWNRMbra2P5i
	 eZRtsathUnZUSz8kqDgZyqAzqiJs8KlMLGZ33Wb1mPR8tZnqNaxIq2KVFb+qZdbltZ
	 68WvrMZVPkzM0TwEfEaW7+3TO2uGthlWLzhkT6AKP34QIhubNd2dvD4Q1p7MCyAdim
	 v+rIIHtCjUWpA==
Date: Thu, 15 May 2025 16:52:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/23] drm/connector: hdmi: Use YUV420 output format
 as an RGB fallback
Message-ID: <etqrbspmy2s75b7lxj3frcjxfnyciawzlxm7im4gvnj6t7z3fx@vx3dfsxitwdn>
References: <7729efd6-fa88-4022-b8d8-b32fe49bf4aa@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="pjfx5ef52ycqbxy3"
Content-Disposition: inline
In-Reply-To: <7729efd6-fa88-4022-b8d8-b32fe49bf4aa@collabora.com>


--pjfx5ef52ycqbxy3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 06/23] drm/connector: hdmi: Use YUV420 output format
 as an RGB fallback
MIME-Version: 1.0

On Thu, May 15, 2025 at 03:44:18PM +0300, Cristian Ciocaltea wrote:
> Hi Maxime,
>=20
> On 5/13/25 4:35 PM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Fri, Apr 25, 2025 at 01:26:57PM +0300, Cristian Ciocaltea wrote:
> >> Try to make use of YUV420 when computing the best output format and
> >> RGB cannot be supported for any of the available color depths.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 22 ++++++++++++++++=
+-----
> >>  1 file changed, 17 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers=
/gpu/drm/display/drm_hdmi_state_helper.c
> >> index 9e0a468073acbb2477eff1abef1c09d63620afaa..1fba10b92a6baa49150b6f=
f1e96bf2c2739bf269 100644
> >> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> >> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> >> @@ -648,14 +648,26 @@ hdmi_compute_config(const struct drm_connector *=
connector,
> >>  				       8, connector->max_bpc);
> >>  	int ret;
> >> =20
> >> -	/*
> >> -	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
> >> -	 * devices, for modes that only support YCbCr420.
> >> -	 */
> >>  	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> >>  				      HDMI_COLORSPACE_RGB);
> >> +	if (!ret)
> >> +		return 0;
> >=20
> > Sorry, I missed it on the previous iteration, but this condition
> > inversion compared to the rest of the function is throwing me off :)
> >=20
> > I believe something like
> >=20
> > If (ret) {
> >    if (connector->ycbcr_420_allowed) {
> >       hdmi_compute_format_bpc(..., HDMI_COLORSPACE_YUV420)
> >    } else {
> >      drm_dbg_kms("Can't use YUV420")
> >    }
> > }
> >=20
> > Would be more natural
>=20
> Yep, will do.
>=20
> Please let me know if I can start preparing v5, as I'm not sure if you
> managed to also check the test-related patches.

I haven't gotten through the whole series yet, sorry. I hope to finish
it by ~ the middle of next week.

Maxime

--pjfx5ef52ycqbxy3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCX/lgAKCRAnX84Zoj2+
dljkAX9k8e33BoB5CKna9kwtem7pAB+YOUyyEWaDIaS3EhQOa6oqmhEnRjMkkkOM
yoUkb/ABgP0kalwCj+x/n4gfJrJGjX33tipO9CI7D/R95N22lK0gBgaRcnQrO2jG
yFiwra4Ffw==
=4wat
-----END PGP SIGNATURE-----

--pjfx5ef52ycqbxy3--
