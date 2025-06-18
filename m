Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358472DFF3E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240796; cv=none; b=S2we+pgGdTQtko8eTzUf21Nlt8Fb+pz02m7SrOqCPLTJ0PWuZl4P+OarCu9M4cPRwoDIbMdL/cFpma/8a9j6H7GY+9lvqW0BPNUbCjZFTfeJudR1JmtOD/oqibiDf0Ii3h64AHShujOGY/GeF4d6gC4moxWsxRNMAslwXrzLJsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240796; c=relaxed/simple;
	bh=oj6zxN/DaiB+xfnV2bQHrSQ1cRZOpHdgAlqJjJnAEgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SE+Y+pXOt6G6O7avyWtYMI+xf3ys/OLl0U7a2/8NiOr1k6MiN+mxkYqu4uJ+z4HFD1Km+lexOjY+SjeeskwQ/YEMKRpj1QHI7XSUnNqLJREdTFnjQep0KvfB6Z24w5oKIANq0gep61I6y/jcgqUXk81J2Su44wTk4gFbFocKajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d56yAncQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d56yAncQ"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 318F01FB2;
	Wed, 18 Jun 2025 11:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750240772;
	bh=oj6zxN/DaiB+xfnV2bQHrSQ1cRZOpHdgAlqJjJnAEgw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d56yAncQg2yYWIbrypCDWSYz1kGVEEdvCLPYUCzhgFICB80ET4q5O5o5F/cLT1B2A
	 NMyN9FOi6s8RGojFND3/sZrMwOChZ4Cs71dWA2krLet9mpHqFVTADKcGvRjMSUBjjp
	 /7iRZ5PEUb9WS8KW95bph5bPst6JQiTTz8Z5t6Zc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:13 +0300
Subject: [PATCH v4 10/17] drm/bridge: cdns-dsi: Update htotal in
 cdns_dsi_mode2cfg()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-10-862c841dbe02@ideasonboard.com>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
In-Reply-To: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1954;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oj6zxN/DaiB+xfnV2bQHrSQ1cRZOpHdgAlqJjJnAEgw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo3/suGvBk17slNEtWBJ5PFTQAkWbkFlJqZtQ
 lSMaRhcEKSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKN/wAKCRD6PaqMvJYe
 9WoDD/wI2gJv6JHMXyz2Q6LXHWvu4iUUDU9F6tliNxCyPfiFf1iUMXVjTsdMbR3GFyuayjOlXUM
 mnSMs2ZQww7gCj2w97NFsZ15FliiAo3ZmA4eUP3UnaE8aB9J5//vPYel1KlOEtW4oKmshZnkUX7
 oG2SCg9JkzIrs1mSOm0f7bNp9dqIL/30KhWTIbxhr9iltjz32wOelYErASUTgTrTY0U40ZHP9EM
 oOtnNehGXP+ssOSEBzv2uAiVFhsKPHsvlKk4NUCq3L4l5rDjzMRdw4zWgo5wUNs5XZNs4Er1+wh
 JWfOQmnwrizO1B4OWhCcf5gmVqu7J8zb9N1w+8N42tnT3EKOYWW9ENd6mzzflbCBOIiGx5fJ1Ea
 y/jhVywC+N2sW/nnau3i/rpx8FFKcUiP5tHF9Yy0P4vX0/xf5uSWWB2i7LfN8Q/EEciZ+N3MjjV
 nr1itM5wWrh5nhwKJUsb8zBJC+jHs3sFxAqnjtr9dqAITN9XDQFAZ8XB8+Hl0JTJ0w12XQmwKqe
 Gyf8pgLZANW14fODE20DBdhDdeDFBgGVpCYgo8R0kuj3vYfM8lktJSVPkl4tvngfdNfOI1fLfeQ
 wiVGLYPlsII4MwIPK1OK9zUHHqrJwIIGKl2LnvlohX/AsPXC/3rWJZTWdNTnkNw6mEhfW9V7Gr2
 qHi47bNK/gONoAA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

cdns_dsi_mode2cfg() calculates the dsi timings, but for some reason
doesn't set the htotal based on those timings. It is set only later, in
cdns_dsi_adjust_phy_config().

As cdns_dsi_mode2cfg() is the logical place to calculate it, let's move
it there. Especially as the following patch will remove
cdns_dsi_adjust_phy_config().

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index b2b6529b1c70..7103878df1e7 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -498,6 +498,13 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 	dsi_cfg->hfp = dpi_to_dsi_timing(mode->hsync_start - mode->hdisplay,
 					 bpp, DSI_HFP_FRAME_OVERHEAD);
 
+	dsi_cfg->htotal = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
+	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+		dsi_cfg->htotal += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
+
+	dsi_cfg->htotal += dsi_cfg->hact;
+	dsi_cfg->htotal += dsi_cfg->hfp + DSI_HFP_FRAME_OVERHEAD;
+
 	return 0;
 }
 
@@ -514,12 +521,7 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 	unsigned int dsi_hfp_ext;
 	unsigned int lanes = output->dev->lanes;
 
-	dsi_htotal = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		dsi_htotal += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
-
-	dsi_htotal += dsi_cfg->hact;
-	dsi_htotal += dsi_cfg->hfp + DSI_HFP_FRAME_OVERHEAD;
+	dsi_htotal = dsi_cfg->htotal;
 
 	/*
 	 * Make sure DSI htotal is aligned on a lane boundary when calculating

-- 
2.43.0

