Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFBC216386
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940797; cv=none; b=oWjPCUtQLDxQEa253HYCcHYdsYDC3aKCJC+qekktKHa5lvgt+zteGNgx2edSiovVdgK3Q7VCL/aoCss1kgpbRsIaMdyZwHaS71a9RHfghIzs/zHHpkS5Aldv7lb8bxG8KzD0lCOM1wIp59qH0YIif0pQYnniAJ71VTV1DPvyKlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940797; c=relaxed/simple;
	bh=QRc538ahWb8AMl4t/fqcG4itSbaOR0buUFsVMWElxNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NavN6Qj+aUbisEcv82tBOztTBrBm7BgeYrjh+9iA0Nd8FwpLdwLj0jkLxLBat4oHjH+MgMb3F+2ZWZgcteT6JfvqjKVKwZL0ZyVZqMybjqBupCdCDGTZHUjmchVIldsz8ozjJarUkMFrR3hjIMU4EIqB1OxXdEsXTBiI5w6i8CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=As0clNKB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="As0clNKB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A17BC4CEE3;
	Tue, 29 Apr 2025 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745940797;
	bh=QRc538ahWb8AMl4t/fqcG4itSbaOR0buUFsVMWElxNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=As0clNKBo8KGh/FMC2d3vvXI5kA5xPIXGrWZI1QE+A+sN/lm4TiRe6fWTnnBnFOQy
	 BaT11ATRyz3H5ZS5EMMQfn35ROu5xHIPj2ovzvI2Xomk6nCEzNReWivdAQAQxCh9/h
	 yA1m9aEOvDFn5y5KVE4mk4f+Pnye510RA9Mj62vMtC44VKLtkpatStAFjYQWO6eWum
	 0bJeNmOGz0kOa8l6kKYwmpclecEXUvUlzanfVQrAwFesd61DDmJfXL9EytOd2Y0jyA
	 8HNxw59BRcAkMTNhmc97rtSz3NoV1DVlf4kP5+0ge6TFK0VXS2KjM8iTQrHQnM5MEA
	 f+tTOHtRnpKtA==
Date: Tue, 29 Apr 2025 17:33:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 03/11] drm/connector: add CEC-related fields
Message-ID: <20250429-rainbow-jumping-boar-dbbb3c@houat>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-3-04809b10d206@oss.qualcomm.com>
 <20250414-augmented-origami-fulmar-acb97b@houat>
 <ac890d36-f61a-456b-9833-4615f691eed6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="366y4vsvvysta3b6"
Content-Disposition: inline
In-Reply-To: <ac890d36-f61a-456b-9833-4615f691eed6@oss.qualcomm.com>


--366y4vsvvysta3b6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 03/11] drm/connector: add CEC-related fields
MIME-Version: 1.0

On Tue, Apr 15, 2025 at 12:10:06PM +0300, Dmitry Baryshkov wrote:
> On 14/04/2025 17:52, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Apr 07, 2025 at 06:11:00PM +0300, Dmitry Baryshkov wrote:
> > > +/**
> > > + * struct drm_connector_cec - DRM Connector CEC-related structure
> > > + */
> > > +struct drm_connector_cec {
> > > +	/**
> > > +	 * @mutex: protects all fields in this structure.
> > > +	 */
> > > +	struct mutex mutex;
> > > +
> > > +	/**
> > > +	 * @funcs: CEC Control Functions
> > > +	 */
> > > +	const struct drm_connector_cec_funcs *funcs;
> > > +
> > > +	/**
> > > +	 * @data: CEC implementation-specific data
> > > +	 */
> > > +	void *data;
> >=20
> > Is there a reason we don't just skip that data? The only user I'm seeing
> > so far are the helpers, and they only put the cec_adapter pointer in
> > there.
> >=20
> > Can't we pass the connector to CEC and make the adapter part of drm_con=
nector_cec?
>=20
> It will be either cec_notifier or cec_adapter +
> drm_connector_hdmi_cec_funcs. Initially I sketched a union here, but then=
 I
> thought that a void pointer makes more sense. It allows us to make CEC da=
ta
> helper-specific. For example, cec-pin might store platform callbacks here.
> DP CEC might need to store AUX pointer, etc.

Ah I see, that makes sense.

Thanks!
Maxime

--366y4vsvvysta3b6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBDxOgAKCRAnX84Zoj2+
dl/aAYCik51xsbDezLJo8jlJ5MHP+NTPYmBAZuSpj83lu4TBoUOJKS9aywuMfhJa
pT0FJZwBgOb3tH0d4pJUW2Ke9bYpnhbnLv5UiQg0UKm9KtB9JLtFM5mFNAu3hWj9
QwgA3/uQhw==
=//IR
-----END PGP SIGNATURE-----

--366y4vsvvysta3b6--
