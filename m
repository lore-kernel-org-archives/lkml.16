Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAFD2D1F79
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629163; cv=none; b=i+hnxUbXXRo0yExMLw05RcP5c5gQrwHImehT9AW+XzsfqTscir1mXJcUhxFOW46bKX9eGH+KM+3jWiC0MSmwCHsw9/9oI1uKbIrJ4MlM5GNcuNrOnv1lJsk3iMkAhJd41905xoSS/xnB8UtbiVuVUrpDpKPI9tTaBtrhXMFauTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629163; c=relaxed/simple;
	bh=69nrMG5DnbkaVL38Gl4wYJj2zhVHWKcMLP3+Q92DfPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YGppyr4P3H7UTyFRxTBU9hqZeZcU6wESa8A7FM61yjZ3W1H2+zxwVlQaXTQhnZdOPNqXRBmwctibcTUUHdCx4l+kgV4qbh/+YwbSVx5SULItQusL56kJ+Agy6gC2YleaAO7kKIsjGTpe4IwTJJ1Ie+50yYQaUcW7qqooSm3OpNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fWJCysBS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fWJCysBS"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40ABC669;
	Mon, 14 Apr 2025 13:10:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744629023;
	bh=69nrMG5DnbkaVL38Gl4wYJj2zhVHWKcMLP3+Q92DfPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fWJCysBSfI+kVgo0L+RE5IIl4JzC0AyzYPn/PHMJNtX9pNy4zIdsAPTHL4D03DO4X
	 PK79+GXrinwrGii3mEXSbMisE/sfGfnE7EBGVAY3p3iKMK72l1b0E5WLOkLbJAfIob
	 wDL4WmdJse8ZBGAkTKBDjyFEXa0e1bEGuBmBHyxM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 14 Apr 2025 14:11:26 +0300
Subject: [PATCH v3 17/17] drm/bridge: cdns-dsi: Don't fail on
 MIPI_DSI_MODE_VIDEO_BURST
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-cdns-dsi-impro-v3-17-4e52551d4f07@ideasonboard.com>
References: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
In-Reply-To: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=69nrMG5DnbkaVL38Gl4wYJj2zhVHWKcMLP3+Q92DfPk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/O2CA9ju1mYvxCiAXlgpo8emf0J0rL9HT0ENz
 8Ap8etsQu+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/ztggAKCRD6PaqMvJYe
 9fCfD/49wbu4aplPobRJ8G+hCTlR4U5TI1rUjnLWOIuxloqP+pFk+nCh4CcuUdicNckYUzGK5g4
 2vDdtb8FhrEfIreBXzTsgg6krnxIi5hzRI3FWFqZtwCn7ikYHlALhim6uiZlVPEsspzfg8a6KbO
 cI9OptfzRtoiMxXkhGY07Qyf6/aZ2bfJ9V1ANn7kg/APJGYoMHid5tGWTZgJdYwe2v9M2XY80A5
 dp11F+AaOcV5C5dqmLes/HLnyTBX3SkPGjQfln5FRsxFUSsuLDEZAvvgJCxCs6lVPjQVrzjSC/9
 0lFPTlMFtamqmXYaf6tVJLNTIzEDKWqCuLZx6mJ7AcLhE1Ojti3rjQKTgqXSp0ggSG61fFCXJ8f
 RcqR+vJByBYVN3m9dPStR82+bDpt5gcQzhOzt+ZedYtFsB6DxSVGQXQDZ2aTq8E52/I1/rLXyuM
 pa0FDGI4jhcidCW05Yyc3T0ezStVThwXOqsjC9wHQNuj3zAT10E4DMVGy32YpDfC+tEQ9Lgh65f
 T1FWk6MOW7HarffnUMssEK7YkwRiRxXqZ6S0dv6OLUgohOFodZwnqXxRyyrpyY+CNMrf8zyqQAZ
 CxKfOwo6XOCv6BH8x7GwzBIlQ9PbmHz0aTlFzasGkTZMMIPiqT2rl+mXA0tmvsGKcfeeTNmk7ej
 3O9hTKeqXoQatzg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

While the cdns-dsi does not support DSI burst mode, the burst mode is
essentially DSI event mode with more versatile clocking and timings.
Thus cdns-dsi doesn't need to fail if the DSI peripheral driver requests
MIPI_DSI_MODE_VIDEO_BURST.

In my particular use case, this allows the use of ti-sn65dsi83 driver.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 165df5d595b8..0e9545139af9 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1045,10 +1045,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	if (output->dev)
 		return -EBUSY;
 
-	/* We do not support burst mode yet. */
-	if (dev->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
-		return -ENOTSUPP;
-
 	/*
 	 * The host <-> device link might be described using an OF-graph
 	 * representation, in this case we extract the device of_node from

-- 
2.43.0

