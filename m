Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFFA1DE4D2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834459; cv=none; b=sBKUR4gNndVstYnM+B9rjr/uPqUY9WRVfxbQpgVLHGIfcCa876bcAd569cAfqnZYLYIO4skQXj9JVbLYgHewkUajrkKyAIhrMz6Cwn6AXBcJDxVr2RUyZkCWLoiBR9ZTczXGqNdvOQ7jl/hNTRABzW8UOFwd5bHCMd7J9pI27XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834459; c=relaxed/simple;
	bh=EJ6IID65Z59BonlU2Wioe3+d9CPG513VPf/OtFb1x3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z03ch3LdwFplKgboWWsdn6CxR/96nzxhvuq4JIEKv27caseJ8JgmEP3ovQ7O3NQBlKyELCvlJyCVn+WoVX5yc8GNmr7xNo0OsbrUHVTJedWht0RLliQpil63aF2O19EEgzVtQ7zP5hultvMVaSSojP22Q3qyX3s0YSYoM3eVr44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Op9KWhD7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Op9KWhD7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AE4C4CEEA;
	Wed, 25 Jun 2025 06:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750834458;
	bh=EJ6IID65Z59BonlU2Wioe3+d9CPG513VPf/OtFb1x3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Op9KWhD7Tl8bgWQE/7eKqgkVQFEMl8g7KVNycN1XQVNQXfrB4tbP37rEwZX7RtHKX
	 peFUjIUsdNDzCEsBTh3X5Ygtz70+gw6wWPn3pzQTHIAOCG71bnzOl4x7ekCvS13Ewf
	 6wexrg/3Ehuj+yoNoJvuIiag66Qvmz1L9XtQPjFY0G+hRaPe3oYRQmwEqG82LF6zfh
	 0ZxdW5Fl+Ym1pD0a52HKqX/VJl9snMIhKjsiLpUkDHHKCpYfcXn28MUxSEL67uf9Re
	 BCfJk2T8Scde9eHHNoWEhkuBzBRpGn76Lq8wnabe/ZFiavLuyAFhbd84sK1WOyLUZb
	 pupmyI1NdOlww==
Date: Wed, 25 Jun 2025 08:54:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] drm/bridge: microchip-lvds: migrate to atomic
 bridge ops
Message-ID: <20250625-fuzzy-expert-mackerel-6edb0a@houat>
References: <20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com>
 <20250625-microchip-lvds-v5-2-624cf72b2651@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="6z6sx6lev5afoa2i"
Content-Disposition: inline
In-Reply-To: <20250625-microchip-lvds-v5-2-624cf72b2651@microchip.com>


--6z6sx6lev5afoa2i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/4] drm/bridge: microchip-lvds: migrate to atomic
 bridge ops
MIME-Version: 1.0

On Wed, Jun 25, 2025 at 10:26:10AM +0530, Dharma Balasubiramani wrote:
> Replace legacy .enable and .disable callbacks with their atomic
> counterparts .atomic_enable and .atomic_disable.
>=20
> Also, add turn off the serialiser inside atomic_disable().
>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

As a rule of thumb, if you have "Also, do X" in your commit log, you
need a separate patch.

And you need to explain why turning off the serialiser inside
atomic_disable() is needed. It might make sense to you, it's not really
obvious to me from that patch, and it will definitely not be to someone
trying to identify fixes and doing backports.

Maxime

--6z6sx6lev5afoa2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFudFwAKCRAnX84Zoj2+
dg3pAX4y3Yi3BylDrRvImHJ6tZO2C6bUIS4QiSNbxE0IbU8hkmLYjQgwjgDXDOZG
CkX75UABgLmdldLD92owbUSs1wsQekEjYvEW7r6qN3JEABjnRR4qqdjRzJtXApxT
rVeZAqqImg==
=Ag6x
-----END PGP SIGNATURE-----

--6z6sx6lev5afoa2i--
