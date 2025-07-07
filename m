Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B24F189919;
	Mon,  7 Jul 2025 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869012; cv=none; b=FT/oIro41nnVdc7E6MXPxRBPNOpKGriqC74IezDKPSOt8z0oPK4RRXEZKfVxnGjukvXjpR6z3r+LLDMaEOVQ7RHMnEjDJZmgq8g7uwl/rWd5cReSekIzNzOo9RkvOOBXAc7U5o5kKrvOOLRPx0w2G6VAMkiNiSnQQ++l2lGP8y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869012; c=relaxed/simple;
	bh=RTb1GysruvfffIrScYvKwPRxv8wNzkYER6dRCtTCUzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlT2adcWQCv02VQF7WjhP1+6oAAzMCVwsKci3tL4kjWlkcLagC/wG+M7zMfaHCh24HonnWK4Zul9A12thHOKuuukkzGnXkgZzs/b9DwwvrNb8KzhR75DE+uWw5Vf3H2C824GNgEgCme9l2+H7UAIekYFYyTD+O6TwyY22JQ4h7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFBUGkvS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFBUGkvS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52164C4CEE3;
	Mon,  7 Jul 2025 06:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751869011;
	bh=RTb1GysruvfffIrScYvKwPRxv8wNzkYER6dRCtTCUzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFBUGkvSqaQT39PsZEPK/Bgw2cKHKby/1QXHqwO4Iw83xnI1OmG6CAf0203qd23or
	 B+J24mruyiTOzXyV5vEuca/3XAP4hlWShSxasJfcQhZUTNDhyVUr+Xry8PYCkRmHHH
	 LB2wrFGDG5FR6aM4X/SpYHbmF5TsZSrEx0UEE/2KihsSaxjtbZY6wqAKbV6/GCz9AG
	 EPzcLo9u1XR5e3xNeM9XL3cQl6UG+mboGROIT+37XZV95r4xDf7kaaiT9o8jwV/a4I
	 gOVQm+8h1Cg3XSg1UZjCgeYM9hxnyyL07htMcm7Z03O8n/nb38SUNO/w/rUG5iWttV
	 vG336ZVm7XEkw==
Date: Mon, 7 Jul 2025 08:16:49 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 00/32] drm/mipi-dsi: avoid DSI host drivers to have
 pointers to DSI devices
Message-ID: <20250707-strange-warm-bear-cb4ee8@houat>
References: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="jbjb7flgq4mjqz2o"
Content-Disposition: inline
In-Reply-To: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>


--jbjb7flgq4mjqz2o
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/32] drm/mipi-dsi: avoid DSI host drivers to have
 pointers to DSI devices
MIME-Version: 1.0

Hi Luca,

On Wed, Jun 25, 2025 at 06:45:04PM +0200, Luca Ceresoli wrote:
> This series is the first attempt at avoiding DSI host drivers to have
> pointers to DSI devices (struct mipi_dsi_device), as discussed during the
> Linux Plumbers Conference 2024 with Maxime and Dmitry.
>=20
> It is working, but I consider this a draft in order to discuss and
> challenge the proposed approach.
>=20
> Overall work
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This is part of the work towards removal of bridges from a still existing
> DRM pipeline without use-after-free. The grand plan as discussed in [1].
> Here's the work breakdown (=E2=9E=9C marks the current series):
>=20
>  1. =E2=80=A6 add refcounting to DRM bridges (struct drm_bridge)
>     (based on devm_drm_bridge_alloc() [0])
>     A. =E2=9C=94 add new alloc API and refcounting (in v6.16-rc1)
>     B. =E2=9C=94 convert all bridge drivers to new API (now in drm-misc-n=
ext)
>     C. =E2=9C=94 kunit tests (now in drm-misc-next)
>     D. =E2=80=A6 add get/put to drm_bridge_add/remove() + attach/detach()
>          and warn on old allocation pattern (under review)
>     E. =E2=80=A6 add get/put on drm_bridge accessors
>        1. =E2=80=A6 drm_bridge_chain_get_first_bridge() + add a cleanup a=
ction
>        2. =E2=80=A6 drm_bridge_chain_get_last_bridge()
>        3. drm_bridge_get_prev_bridge()
>        4. drm_bridge_get_next_bridge()
>        5. drm_for_each_bridge_in_chain()
>        6. drm_bridge_connector_init
>        7. of_drm_find_bridge
>        8. drm_of_find_panel_or_bridge, *_of_get_bridge
>     F. debugfs improvements
>  2. handle gracefully atomic updates during bridge removal
>  3. =E2=9E=9C avoid DSI host drivers to have dangling pointers to DSI dev=
ices
>       (this series)
>  4. finish the hotplug bridge work, removing the "always-disconnected"
>     connector, moving code to the core and potentially removing the
>     hotplug-bridge itself (this needs to be clarified as points 1-3 are
>     developed)
>=20
> [0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e=
629b715ea3d1ba537ef2da95eec
> [1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9=
c3058@bootlin.com/t/#u
>=20
> Motivation
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The motivation for this series is that with hot-pluggable hardware a DSI
> device can be disconnected from the DSI host at runtime, and later on
> reconnected, potentially with a different model having different bus
> parameters.
>=20
> DSI host drivers currently receive a struct mipi_dsi_device pointer in the
> attach callback and some store it permanently for later access to the bur
> format data (lanes, channel, pixel format etc). The stored pointer can
> become dangling if the device is removed, leading to a use-after-free.
>=20
> Currently the data exchange between DSI host and device happens primarily
> by two means:
>=20
>  * the device requests attach, detach and message transfer to the host by
>    calling mipi_dsi_attach/detach/transfer which in turn call the callbac=
ks
>    in struct mipi_dsi_host_ops
>     - for this to work, struct mipi_dsi_device has a pointer to the host:
>       this is OK because the goal is supporting hotplug of the "remote"
>       part of the DRM pipeline
>  * the host accesses directly the fields of struct mipi_dsi_device, to
>    which it receives a pointer in the .attach and .detach callbacks
>=20
> The second bullet is the problematic one, which we want to remove.
>=20
> Strategy
> =3D=3D=3D=3D=3D=3D=3D=3D
>=20
> I devised two possible strategies to address it:
>=20
>  1. change the host ops to not pass a struct mipi_dsi_device, but instead
>     to pass only a copy of the needed information (bus format mainly), so
>     the host driver does never access any info from the device
>    =20
>  2. let the host get info from the device as needed, but without having a
>     pointer to it; this is be based on:
>      - storing a __private mipi_dsi_device pointer in struct mipi_dsi_host
>      - adding getters to the DSI core for the host to query the needed
>        info, e.g. drm_mipi_dsi_host_get_device_lanes(host) (the getters
>        would be allowed to dereference the device pointer)
>=20
> This series implements strategy 1. It does so by adding a .attach_new host
> op, which does not take a mipi_dsi_device pointer, and converting most ho=
st
> drivers to it. Once all drivers are converted, the old op can be removed,
> and .attach_new renamed to .attach.

I don't recall discussing this particular aspect at Plumbers, so sorry
if we're coming back to the same discussion we had.

I'm not necessarily opposed to changing the MIPI-DSI bus API, but I
don't think changing the semantics to remove the fact that a particular
device is connected or not is a good idea.

I would have expected to have bus driver (maybe) take a device pointer
at attach, and drop it at detach.

Then, when we detect the hotplug of a DSI device, we detach it from its
parent, and we're done.

What prevents us from using that approach?

Maxime

--jbjb7flgq4mjqz2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGtmTAAKCRAnX84Zoj2+
dpi4AYC8hyZHRaL4DgbyXSUW8SXl+GxbqmRSMfw0nVVNCe6EK0pfkLmT2EbDNLj/
Sni6oEIBf3gEv+z3YZoTrjS8cH+0yjB1OhW9/KW40vAUIc3EoJHWRVCAqU3UkqIO
aQiNoKl5Hw==
=O5sI
-----END PGP SIGNATURE-----

--jbjb7flgq4mjqz2o--
