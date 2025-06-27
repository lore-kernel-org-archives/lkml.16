Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5284E29AB10
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024965; cv=none; b=OnZJjiYOf/+aAV3fYuNoeLeNSKEeD259pCHkOoDB51V8aZfIPJYeKzIkQm4al6Xw+NVK5+4fwp6yatmSpDhAKz+/JhLZr8pRc/3XzCszBelAqH+TnLWfiy90cYJH9cx3GCKrXoMo7RyRxqlqn2ueZKkduv0ZCXVxm41RjmQphmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024965; c=relaxed/simple;
	bh=QSPA9Vq9QwLyFxZjw2c7vBxmpc8LwxweFdE+X7XBa94=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UiTzLjrAODe7xRfp+NNdZQtC8fC4n6c8vdduc4Tnt+Sfbp9oDJBaqpEIZP7iT9BRcaG9FGXR3r8RUxNvZ42pnPhYJZ5Ie4AwgM4GioW98Ddz3xQIJ6xjEaK2pmeCw9Rcse5FsVmmW/Zt23HJCTsZlkyePJMckQxYh9sSdFF9ZTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uV7Zv-0008OW-6o; Fri, 27 Jun 2025 13:49:11 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uV7Zu-005bfA-0b;
	Fri, 27 Jun 2025 13:49:10 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uV7Zu-000Cjy-0K;
	Fri, 27 Jun 2025 13:49:10 +0200
Message-ID: <d21382cf4ff508fb4b21536373875f5566b6d35e.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] drm/bridge: samsung-dsim: Small cleanups
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>,  Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de
Date: Fri, 27 Jun 2025 13:49:09 +0200
In-Reply-To: <20250527-samsung-dsim-v1-0-5be520d84fbb@pengutronix.de>
References: <20250527-samsung-dsim-v1-0-5be520d84fbb@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Di, 2025-05-27 at 16:21 +0200, Philipp Zabel wrote:
> Replace an open-coded goto-again construct with a while loop and a
> custom MHZ macro with the common HZ_PER_MHZ.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Philipp Zabel (2):
>       drm/bridge: samsung-dsim: use while loop in samsung_dsim_transfer_s=
tart
>       drm/bridge: samsung-dsim: Use HZ_PER_MHZ macro from units.h
>=20
>  drivers/gpu/drm/bridge/samsung-dsim.c | 77 +++++++++++++++--------------=
------
>  1 file changed, 33 insertions(+), 44 deletions(-)
> ---
> base-commit: 99764593528f9e0ee9509f9e4a4eb21db99d0681
> change-id: 20250527-samsung-dsim-2bae3b45f77b
>=20
> Best regards,

Applied to drm-misc-next.

[1/2] drm/bridge: samsung-dsim: use while loop in samsung_dsim_transfer_sta=
rt
      commit: bafc628678796e3a05bd54c30280f4ecdaf3ebba
[2/2] drm/bridge: samsung-dsim: Use HZ_PER_MHZ macro from units.h
      commit: b462b0ef4d788d56f0e575406e58450358dcbd96

regards
Philipp
