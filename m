Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB31526C3A9
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355730; cv=none; b=ayfC81dKjsORztFNfpwpYlUVGXcpdeefNhIrQI6vcb7O84T+XFhpYPEQMq6UkOdnzy+lV7rCrifx8NUwz/Tj+Ra+TSEZPlkCuyoPAJhpG1of9F2oakGKu4S9dzgrnudj77gc9NhLyJn2xQ0gSEGHkcn4VWUTN4i4RuGabtK84rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355730; c=relaxed/simple;
	bh=FG+7I0grQiHY2grVhSfeYv+z2r9fJ/zchWiOdeNz9SM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fFatgCetxuQ1Ybn4cW9uyazq7kX94NotHUV6/eZWEYC9R6HZzDoU3NMAE6EUICb0xpvOMQ3jlT6aZ8WCsjqB3DawRwpEC66KnHyTLlD13ehuQbRyANwatC/F4R+/WNsneAkC7DTU6+yaqmNVeVf0SCgHeYaWWmUauxH2v1/Hl/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uJvBo-00048s-US; Tue, 27 May 2025 16:22:00 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/2] drm/bridge: samsung-dsim: Small cleanups
Date: Tue, 27 May 2025 16:21:46 +0200
Message-Id: <20250527-samsung-dsim-v1-0-5be520d84fbb@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHrKNWgC/x3MQQqAIBBA0avIrBPMEqGrRAvN0WaRhUMRSHdPW
 r7F/xUYCyHDJCoUvInpyA19J2DdXE4oKTSDVtooo61kt/OVkwxMu9Te4eBHE6310JKzYKTn383
 L+35gJF9MXgAAAA==
X-Change-ID: 20250527-samsung-dsim-2bae3b45f77b
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Replace an open-coded goto-again construct with a while loop and a
custom MHZ macro with the common HZ_PER_MHZ.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Philipp Zabel (2):
      drm/bridge: samsung-dsim: use while loop in samsung_dsim_transfer_start
      drm/bridge: samsung-dsim: Use HZ_PER_MHZ macro from units.h

 drivers/gpu/drm/bridge/samsung-dsim.c | 77 +++++++++++++++--------------------
 1 file changed, 33 insertions(+), 44 deletions(-)
---
base-commit: 99764593528f9e0ee9509f9e4a4eb21db99d0681
change-id: 20250527-samsung-dsim-2bae3b45f77b

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>

