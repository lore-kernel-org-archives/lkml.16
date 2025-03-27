Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42AA322B;
	Thu, 27 Mar 2025 13:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743083195; cv=none; b=nMLCGIIZcA88gPvQQ3ZY4526zvcsduyifZaMaYa1bRArUKHH8XgXKwpDf45x/Sd+po+THOPyILEah28g7gmIlc6mx+428N3wCQhHrKh8r5AK1BGGyNWGm5cOVpFv11lEn6+Rz9qFDBX01SaTTrGtsSHc6iI0C+FRBkNFgCs4w44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743083195; c=relaxed/simple;
	bh=fr5eXsH4ELM22q1VLft6cUDbRKWKY32EKB07b+nOwck=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=GRs24/3h97MGJkRvFID0iLymvmvJCElrKSKMJR8/BOwaaO+86DFNh1EqD8amdktjWIkZm3EIDLgQR7LkK1xOW7kcf0+kWSHbN4qG9Pjjw6u6FGyNDXbk0I6aDEtIHml1YG8IBZkK6/FANjUtDEW/QltAYcx1gMn8zjXsYfppvGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPkC2YPU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPkC2YPU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2B5C4CEDD;
	Thu, 27 Mar 2025 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743083194;
	bh=fr5eXsH4ELM22q1VLft6cUDbRKWKY32EKB07b+nOwck=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=fPkC2YPUg6U1AWk9VoIftitF2W8fruvym/IKkmjX44261oCL16avJfPPvNR+jI5Tb
	 UsL2oVSbef3S+bgau3fT50BH6OGqrb5X6T/WYREVoCsx07BeG5G2xpqzjTbs5APdbZ
	 H9wMIkF+Fln42CnAhH4aP0Cb29myQ7YecUgJMKUMSz5HWB4SPP/8WBOMhfR3B3lAyn
	 VXzFJ1XllztFp7fpDSIpHm88cB2DdTHrgZadIz67ZmEsjW0PJ0h0IcWlDEhGWujPMU
	 np0GeMOYWCBV4qZDS3XQzG24ZbafxAmmjZeY6ETvZM/PBYbtHx9O6I3ZCoXAoj7pDM
	 6gVvqZ/3LM6zQ==
Message-ID: <cdf2955f1b9143566ba4eb7b87551441@kernel.org>
Date: Thu, 27 Mar 2025 13:46:31 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9 3/5] drm/bridge: make devm_drm_bridge_alloc()
 mandatory for bridge allocation
In-Reply-To: <20250326-drm-bridge-refcount-v9-3-5e0661fe1f84@bootlin.com>
References: <20250326-drm-bridge-refcount-v9-3-5e0661fe1f84@bootlin.com>
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
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Wed, 26 Mar 2025 18:47:37 +0100, Luca Ceresoli wrote:
> All DRM bridges are now supposed to be allocated using
> devm_drm_bridge_alloc(), which is cleaner and necessary to support
> refcounting.
> 
> In the absence of a drm_bridge_init() or such initialization function,
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
