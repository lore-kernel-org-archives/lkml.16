Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4727722A7E9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359885; cv=none; b=WcUsWIlJpdyVgk820oKwOuel5JGey+Mnrwfk3q7rdIE31nJ2byexGtrxUgi0WgnsNbi21nQODEkh3vSSO7T7U78CUNbjWrdzI10rr6vxz+E2c37l83YqZRY0Xj/EIEJcPkG6Mzt7q4eK2n4phzoANTFYC39JCh8pqyP8KSogr8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359885; c=relaxed/simple;
	bh=a8dUA8AQN4IiNoUrmJw0vwsYuwyniVP6q+4ut/6dFT0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qLyY90UkGSg8Xkcl0++0xNvLrncSFzCpO1b5jF1W+eTalirjqBzx5pUJAiS6UMDM/PJOkS0EmN17G8+qZKkX77lJp7J2RlescEA1Jqib4QnLvBdgy9A1BVs80dv29e3jNm3Crd4QPw4A2hhCGGAdTq5AgMa7JAr7udFXLIXMIYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWWhi-0006IB-Mc; Tue, 01 Jul 2025 10:51:02 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWWhg-006F2S-27;
	Tue, 01 Jul 2025 10:51:00 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWWhb-0004aR-1k;
	Tue, 01 Jul 2025 10:50:55 +0200
Message-ID: <aafdb0e9dee2041ae64b2fe8677b4b3d45401bc8.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/4] drm/bridge: samsung-dsim: Stop controlling vsync
 display FIFO flush in panels
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>,  Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Artur Weber
 <aweber.kernel@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de
Date: Tue, 01 Jul 2025 10:50:55 +0200
In-Reply-To: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
References: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
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

On Fr, 2025-06-27 at 13:45 +0200, Philipp Zabel wrote:
> This series enables the vsync flush feature in the samsung-dsim driver
> unconditionally and removes the MIPI_DSI_MODE_VSYNC_FLUSH flag.

Applied to drm-misc-next.

[1/4] drm/bridge: samsung-dsim: Always flush display FIFO on vsync pulse
      commit: a36c533ad3e1b8c0326d665d2d02d2ef7aea8f92
[2/4] drm/panel: samsung-s6d7aa0: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
      commit: f488640e51312fbca02f9229d238a2aed7a8aac9
[3/4] drm/panel: samsung-s6e8aa0: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
      commit: 5c449ddbaba1c807c4674f92e5ebf6a887edb58c
[4/4] drm/mipi-dsi: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
      commit: 12853b279100adc7074b51db23bf62a41cb84cb8
