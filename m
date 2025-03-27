Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC8420CCEA;
	Thu, 27 Mar 2025 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743083230; cv=none; b=ht2fKMrvBHL23zFPlrh6KBNWMYsGNfmB/KN84oOqYjMwTBpN27CzMp75iD7FXmn0rMbP8OfJV+wu4ND+imeYpw8LNU3RlKlBF4lEcI6PW4HEjj4Oh3sDEfa0e22lAj9ALrdJI9EEizEfU+cR5D+NHdA2WMZvi1kjU6b+6jGijEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743083230; c=relaxed/simple;
	bh=RF3wdOFzL4vQqrB1B0vZ2iCYv5b2RA5x1OV5kLSU3FE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=bRNrZpZ+2F8i8iDlA7ZwesLxYd/Ndo7gR5U328agm3BetwtRtm1R9RdqZIvV5fqjgrJf8KDPoYFlXDYEF7+Lca6Nv0obPQztkzmfQuHD7dnHkl/DtzaOhKhYksxpl6DRUgf+QFLNIz1G7ps/+e0Swj+Aitc+VsxOicm8uRZbt5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRYR+wJJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRYR+wJJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91924C4CEDD;
	Thu, 27 Mar 2025 13:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743083230;
	bh=RF3wdOFzL4vQqrB1B0vZ2iCYv5b2RA5x1OV5kLSU3FE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=TRYR+wJJTnUYnvc1ODN4B9vpFKwvFoCczHvPyqf3uyWcee9vc7G3HqduxGVF99hGj
	 2Anar/GswBgL04kQZ9wHQpotK+vz0ZpPE6+J7Eb/VTi2PcOmI2BZq3zNIwPhwtQdXG
	 QbWKDgA4NBm1Wl/MModaDXner0J3IDHY/sZSU8C+1n6tLKZCMO4ElsgXDUpeelYVmE
	 cv8Vp7Iain2yESM5cV0XyZbYHErfh63L4j48/Ex3hgmA1YRD5vqNgxkueELk2ceCHU
	 7vcG8O9KKTohmlyEUFTgtyiTklRJvINQ1fdoDiG+RpkeAFVVaw9+WescKG+IQ5mZKj
	 gfYcPqQWUU29A==
Message-ID: <83d859d94aeedacc2d5fb058a84bfdac@kernel.org>
Date: Thu, 27 Mar 2025 13:47:07 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9 2/5] drm/bridge: add support for refcounting
In-Reply-To: <20250326-drm-bridge-refcount-v9-2-5e0661fe1f84@bootlin.com>
References: <20250326-drm-bridge-refcount-v9-2-5e0661fe1f84@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Fabio
 Estevam" <festevam@gmail.com>, =?utf-8?b?SGVydsOpIENvZGluYQ==?= <herve.codina@bootlin.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Stefan Agner" <stefan@agner.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Wed, 26 Mar 2025 18:47:36 +0100, Luca Ceresoli wrote:
> DRM bridges are currently considered as a fixed element of a DRM card, and
> thus their lifetime is assumed to extend for as long as the card
> exists. New use cases, such as hot-pluggable hardware with video bridges,
> require DRM bridges to be added to and removed from a DRM card without
> tearing the card down. This is possible for connectors already (used by DP
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
