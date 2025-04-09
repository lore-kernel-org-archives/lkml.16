Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C7815A87C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211592; cv=none; b=Uaot2qsiU30dS2fAsNb293tH7cZj4mawdYaT4Bu3AE137s62AjMS5N7SfyiePeXjbTdUJb1A2+3wo8EwKb2KiqTHdpwjepps99v/S3CYYQadp4giS7jcR6c87T/xDoKIoODZhHzLsPonSkquxDzoZg2FLChrmu5lFHHZp9aOeBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211592; c=relaxed/simple;
	bh=vURl54tmhm1LG/cXuku2TmO+h+L71jiI2WiTrWJLNME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ggzf7drO2vkY32L56T+saHm0Cpm3l+3OXr9yxIA/qsjEdFRsdQe0Fd3wdgwSFl1DOVdmpJTQjvDIaB/UuoMNd6pEJXxL4ptkOVPOXwIRZjCf1HxZ/kqd7ASZcZkiYu2q9+p1ocLTDg/pWMemBwrjBGArEXr1/K3KIjP4HCkDSyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0ZN+CqM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0ZN+CqM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22393C4CEE2;
	Wed,  9 Apr 2025 15:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744211592;
	bh=vURl54tmhm1LG/cXuku2TmO+h+L71jiI2WiTrWJLNME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I0ZN+CqM9B0h0OpCqxBqsm9N7+WFKofnQkX4osxckUY4HC0+I/tWCEAkm/tQZ+QB/
	 9nqAqKdkHrWfK24Pv2K824GnQ3fLJcWRZx6CiGDF15AvW+pTyHIyeZI4seT8NKPaNF
	 uQ8LwBrOdMHP7xpnirteWzxlxGIZbT55qcklckBy9gXmW1uaVM9VgdguHjXXEjzQkX
	 eJjbTGI65xBV0neq4PFLLfgCvBU4OCJJRQHbogiitIVtrFxlARvidS6PWKWH7O9IqQ
	 Ph2eTfXgITlFUjFHXxef1dWW4pGN4OAuoih5dbSCfyd4MfIXymQLIxt14REe97p18w
	 XPTmq8CDx4A/Q==
Date: Wed, 9 Apr 2025 17:13:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/15] drm/tests: hdmi: Fixup CamelCase warning
Message-ID: <20250409-accomplished-vivacious-ant-3c03c3@houat>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-9-294d3ebbb4b2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wk32e2w6gih3rjbo"
Content-Disposition: inline
In-Reply-To: <20250326-hdmi-conn-yuv-v3-9-294d3ebbb4b2@collabora.com>


--wk32e2w6gih3rjbo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 09/15] drm/tests: hdmi: Fixup CamelCase warning
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 12:19:58PM +0200, Cristian Ciocaltea wrote:
> Rename the reject_100_MHz_connector_hdmi_funcs variable to make
> checkpatch.pl happy:
>=20
>   CHECK: Avoid CamelCase: <reject_100_MHz_connector_hdmi_funcs>
>=20
> While at it, also rename reject_100MHz_connector_tmds_char_rate_valid()
> for consistency.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

In this case, checkpatch is wrong. mhz !=3D MHz.

And since it's not a warning, I'd just ignore it.

Maxime

--wk32e2w6gih3rjbo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/aOhQAKCRDj7w1vZxhR
xS/oAQDNvPAAWV3pPWhcc0JHu56bTPRmm75apuUGPAuTQd5a9QD/f0WGPgtwqns6
cIibIcrn2Dun+RWTJLUqu2Na0Mjj0Ag=
=6qT/
-----END PGP SIGNATURE-----

--wk32e2w6gih3rjbo--
