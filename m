Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E1423E326
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600694; cv=none; b=UIIPl9dYHswSLTtYm7pV0hp0nfpigK+UmLpZoHpJsTC3hVh7RJ0kB1KtRzWMpN4t+V56JFE8Vt2hlhqVuWYGiiO0YJ7n9UVT3hROEIeeQV0D+coxmWfkDIoKTP2Qf2iwFTMuAMP7wHzvmRr4zs68Q5sxq2sfI/4Oci2w3nGOnJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600694; c=relaxed/simple;
	bh=PM3qn/s33KHnLl3YvY8GLYvLdFsywv9G587wE6W8Bwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmoLxPLQuYmAs7T+VXir//JHe6/gnQgyieNVJF+kBYGxfrARQAKS2e9JQxm2QCkFM7w0y1axq2bH+zOUFwoRLCEA/m124gM7xnEPWTrs9nV5kTiFbCJW4DJWbqZ5bY0578kWsPU/qtSp7kRLtZ7sclskxq2j+SemZGCEdyGG/V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cS+v1bTa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cS+v1bTa"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 292E36A2;
	Wed,  2 Apr 2025 15:29:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743600573;
	bh=PM3qn/s33KHnLl3YvY8GLYvLdFsywv9G587wE6W8Bwk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cS+v1bTaOhJ5Kp2CgKyh5zPS5svmlJ/aP6I9Cvu6DKZ1ZNWZphx9epAGK3SbZ2gn0
	 uxmTWepbQDW/2gJm7GnutZJzLGLNKbVp56ClQMR0iTxf/dsVRrYOL9VinZOIXY5vV+
	 GFx+jReLqTq7SXVoeIXk0+cLdaq8uWYIaGQ09NQA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:30:51 +0300
Subject: [PATCH v2 09/18] drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-9-4a093eaa5e27@ideasonboard.com>
References: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
In-Reply-To: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=PM3qn/s33KHnLl3YvY8GLYvLdFsywv9G587wE6W8Bwk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7TweyQPovNekJjG70A8r4TqzcJ/RzGV+MzpSO
 QLm9FkmlieJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08HgAKCRD6PaqMvJYe
 9fM1D/4rcbNWQXxfqSvs7aVKIohHjvYtU5pKE0RDzydbYhHTW4n9F8Se/x3T++shXnKUfTrT7V/
 OaKm9e7AeocvNtPdkY0/lfRAtvEpuMH3J7U0CTl9/CsGjq253/4lKVW+j+gEhDeCb+Ip8ipjX8j
 H3YbzlQZtlZF93gVx4d/jS1pBje+g7T26nYv1402EBbsAJSUlCdUwDgxbEr1PCSERZylv2BzBlP
 NSl4HzotvY/0zrcATP1p8ENDex8BltYmFdVAtIuHqz8mg6PhiIxDkj0PgNWdVxmkCN272jspYvU
 MTxHVPTYitYsmjtq1CLuCt2vvxbzZRKXUWB8lwx4IKYBpxOGrqz+Y2f2p27Bv7qWfCj78pY5f68
 Iaczz8yQpXJDkn8X8CjZRk3ZJ5UMXDdzm7sSoNMnzhtLIvwtTEjRdJ5LyUdGWl2tm9e6sdfaVZb
 jxRWeD+MWpg5D40omp2fx2FNZS3ebsQ4G8yxSuD+eaUgLnpZlUgJZdqN7DdzT7gBpqKVa9wW+cT
 2Hi8D9/WhbWBpuCqgSvwvInujJ/aizA8ExOnB7eP/NuYtBsm6Ov/Lb+Xm+RsmHTPXCXOjROmJgg
 GUapoY8ePDu6Kg6dUv24ULQOiBpHuDNuOjGujm7Lg1SYNjPiG6BCe2JPUsi5PSvXYu0Cgd2W2mK
 Avghy47TW0sOWNg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver tries to calculate the value for REG_WAKEUP_TIME. However,
the calculation itself is not correct, and to add on it, the resulting
value is almost always larger than the field's size, so the actual
result is more or less random.

According to the docs, figuring out the value for REG_WAKEUP_TIME
requires HW characterization and there's no way to have a generic
algorithm to come up with the value. That doesn't help at all...

However, we know that the value must be smaller than the line time, and,
at least in my understanding, the proper value for it is quite small.
Testing shows that setting it to 1/10 of the line time seems to work
well. All video modes from my HDMI monitor work with this algorithm.

Hopefully we'll get more information on how to calculate the value, and
we can then update this.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 0aaa1d06b21c..62811631341b 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -882,7 +882,13 @@ static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	tx_byte_period = DIV_ROUND_DOWN_ULL((u64)NSEC_PER_SEC * 8,
 					    phy_cfg->hs_clk_rate);
-	reg_wakeup = (phy_cfg->hs_prepare + phy_cfg->hs_zero) / tx_byte_period;
+
+	/*
+	 * Estimated time [in clock cycles] to perform LP->HS on D-PHY.
+	 * It is not clear how to calculate this, so for now,
+	 * set it to 1/10 of the total number of clocks in a line.
+	 */
+	reg_wakeup = dsi_cfg.htotal / nlanes / 10;
 	writel(REG_WAKEUP_TIME(reg_wakeup) | REG_LINE_DURATION(tmp),
 	       dsi->regs + VID_DPHY_TIME);
 

-- 
2.43.0

