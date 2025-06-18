Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFE023B61B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750235259; cv=none; b=gnPTaXL+oFmXe7eDHNXHn25D9hDP70I5licWb02bDzWF4nnOD3QGktEf1AbPyelc6C4sBhZR9n5k2tDyU2FMRekLnpGplvXiw+Wl8lMChxbX1/ALEFaqiXyS5CPrip71hxecxXVFj87t/VEODjBHrafri/mwyPiJSrml2Y/A4wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750235259; c=relaxed/simple;
	bh=kpbFuyronYx4WqaCOXcmArGTDXwxpcw1dFYS6oUoq2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqNnU2aPxwAZXEej2c85wIffsbkJK7IqOz/kCt0L9O55719pUOGYuAOCHuR0uewDXBXqmuCx1UKvMqPQsrLRnOU5y223t7ZoZZ1weTb/Z6hJslZY2UARL1dXVqMNmrSS4O2X3vovk8agopz/RN8ag+9d32zmSG++u5lgLPDGbiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ET/cBAI/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ET/cBAI/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DADC4CEE7;
	Wed, 18 Jun 2025 08:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750235258;
	bh=kpbFuyronYx4WqaCOXcmArGTDXwxpcw1dFYS6oUoq2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ET/cBAI/4PdmQXgKUdpf7Aq+7hduBZsquH8BDMKkNSsRNEtntVOT0NGgbqEbaY7nP
	 wad/A36DuBIaQMEM7AlyoWegvBZsRcY30//yAlPreT+tDW2/gIKD3bHooGfq7CYUJU
	 AIcGa00OfjgxeZy9nsn5JLxAq1+9see65gZanUtAr32CeM7+h1NE3AmotJ77w/iPuT
	 j+NTKXiJtvmFxxkToyba9HhqDfaBdqFM/dWEjaDNZQFImdtqLMMseUHb47tVG8GnPI
	 cqpVZQXewGwGGZtrWWH3QHrx+/SJ3zo5TK+u0utMX1wSOPwTYXdsJ7oznu43D12D7l
	 2rgDvPTaO9y2w==
Date: Wed, 18 Jun 2025 10:27:34 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Aradhya Bhatia <aradhya.bhatia@linux.dev>, DRI Development List <dri-devel@lists.freedesktop.org>, 
	Linux Kernel List <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Jayesh Choudhary <j-choudhary@ti.com>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v13 3/4] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
Message-ID: <20250618-silent-oriole-of-fertility-3cbbd6@houat>
References: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
 <20250605171524.27222-4-aradhya.bhatia@linux.dev>
 <CGME20250611104512eucas1p22450fccf3bb7521760bd2d9a2a56ba19@eucas1p2.samsung.com>
 <2c51cf39-13cb-413f-8dd5-53bc1c11467a@samsung.com>
 <306f142f-f9c9-44ab-a5b9-c71db76b2b80@ideasonboard.com>
 <b4d8c5b2-3ad7-4327-9985-d097d095ccb5@samsung.com>
 <3adb1d12-7cd5-4beb-9978-c3cae702f338@ideasonboard.com>
 <d005ad5c-aded-4dea-b6eb-a9ce78c04728@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="srkvtn4pcvx6dzsz"
Content-Disposition: inline
In-Reply-To: <d005ad5c-aded-4dea-b6eb-a9ce78c04728@samsung.com>


--srkvtn4pcvx6dzsz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 3/4] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
MIME-Version: 1.0

On Wed, Jun 18, 2025 at 08:30:39AM +0200, Marek Szyprowski wrote:
> On 16.06.2025 17:40, Tomi Valkeinen wrote:
> > On 12/06/2025 09:31, Marek Szyprowski wrote:
> >> On 12.06.2025 07:49, Tomi Valkeinen wrote:
> >>> On 11/06/2025 13:45, Marek Szyprowski wrote:
> >>>> On 05.06.2025 19:15, Aradhya Bhatia wrote:
> >>>>> From: Aradhya Bhatia <a-bhatia1@ti.com>
> >>>>>
> >>>>> Move the bridge pre_enable call before crtc enable, and the bridge
> >>>>> post_disable call after the crtc disable.
> >>>>>
> >>>>> The sequence of enable after this patch will look like:
> >>>>>
> >>>>> 	bridge[n]_pre_enable
> >>>>> 	...
> >>>>> 	bridge[1]_pre_enable
> >>>>>
> >>>>> 	crtc_enable
> >>>>> 	encoder_enable
> >>>>>
> >>>>> 	bridge[1]_enable
> >>>>> 	...
> >>>>> 	bridge[n]_enable
> >>>>>
> >>>>> And, the disable sequence for the display pipeline will look like:
> >>>>>
> >>>>> 	bridge[n]_disable
> >>>>> 	...
> >>>>> 	bridge[1]_disable
> >>>>>
> >>>>> 	encoder_disable
> >>>>> 	crtc_disable
> >>>>>
> >>>>> 	bridge[1]_post_disable
> >>>>> 	...
> >>>>> 	bridge[n]_post_disable
> >>>>>
> >>>>> The definition of bridge pre_enable hook says that,
> >>>>> "The display pipe (i.e. clocks and timing signals) feeding this bri=
dge
> >>>>> will not yet be running when this callback is called".
> >>>>>
> >>>>> Since CRTC is also a source feeding the bridge, it should not be en=
abled
> >>>>> before the bridges in the pipeline are pre_enabled. Fix that by
> >>>>> re-ordering the sequence of bridge pre_enable and bridge post_disab=
le.
> >>>>>
> >>>>> While at it, update the drm bridge API documentation as well.
> >>>>>
> >>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>>> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> >>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> >>>>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> >>>> This patch landed in today's linux-next as commit c9b1150a68d9
> >>>> ("drm/atomic-helper: Re-order bridge chain pre-enable and
> >>>> post-disable"). In my tests I found that it breaks booting of Samsung
> >>>> Exynos 5420/5800 based Chromebooks (Peach-Pit and Peach-Pi). Both of
> >>>> them use Exynos DRM with Exynos_DP sub-driver (Analogix DP) and EDP
> >>>> panel. Booting stops at '[drm] Initialized exynos 1.1.0 for exynos-d=
rm
> >>>> on minor 0' message. On the other hand, the Samsung Exynos5250 based
> >>>> Snow Chromebook boots fine, but it uses dp-lvds nxp,ptn3460 bridge a=
nd
> >>>> lvds panel instead of edp panels. This looks like some sort of deadl=
ock,
> >>>> because if I disable FBDEV emulation, those boards boots fine and I'm
> >>>> able to run modetest and enable the display. Also the DRM kernel log=
ger
> >>>> seems to be working fine, although I didn't check the screen output =
yet,
> >>>> as I only have a remote access to those boards. I will investigate it
> >>>> further and let You know.
> >>> Thanks for the report. I was trying to understand the pipeline, but I=
'm
> >>> a bit confused. Above you say Peach-Pit uses DP and EDP panel, but if=
 I
> >>> look at arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts, it connec=
ts
> >>> a dp->lvds bridge (parade,ps8625). Peach-Pi seems to connect to an eDP
> >>> panel.
> >>>
> >>> Is the above correct? Do both Peach-Pi and Peach-Pit fail?
> >> Yes, sorry, my fault. I much have checked the same (peach-pi) dts 2
> >> times. Both Peach-Pi and Peach-Pit fails, while Snow works fine. All
> >> three use the same Exynos DP (based on analogix dp) driver. I will try
> >> to play a bit more with those boards in the afternoon, hopefully getti=
ng
> >> some more hints where the issue is.
> > Did you get a chance to test this more? Any hints what happens will hel=
p =3D)
>=20
> I've spent some time debugging this issue, but so far I only got=20
> something I don't really understand. This issue is somehow related with=
=20
> the DP clock enabling and disabling, what is being done from=20
> exynos_dp_poweron() and exynos_dp_poweroff() functions, which are called=
=20
> from analogix_dp_resume() and analogix_dp_suspend(). The lockup happens=
=20
> somewhere while registering the fbdev console, with console lock held,=20
> what makes debugging much harder.

You can skip the locking part with the fb.lockless_register_fb=3D1 kernel
parameter. It's of course not meant for anything but debugging, but it's
useful :)

Maxime

--srkvtn4pcvx6dzsz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFJ4cgAKCRAnX84Zoj2+
duP5AYC+rLDwkCpwsUlhFRbv4bnc/8Ppp+L8VIchHfy/uPiLFcUaxqhFy2HIGYHh
Ie/wRgcBgNhFkUByyHFT4QHOXTgIEnQcqZ5nhHjnkEmcqMkrpkU2udUPFG6JYAmJ
ZAS3kP2Wbg==
=hKdL
-----END PGP SIGNATURE-----

--srkvtn4pcvx6dzsz--
