Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460A4298CD8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629140; cv=none; b=MKVOfB3Q9b+hWC9okF3LM3JAVLeshy6/w1IYJEXgogcrNb56OgB+i0MTD9o2mHjP+EStC2Tn3qIH0biyL/deaILeHNL/lOYN0iQ/aHY+JNfOWM4d0ySijmeZVZ8Ut2Zw4weBa0VCQuYIkNfkYUj8VZL4GERRw5VialPUaNpuqag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629140; c=relaxed/simple;
	bh=G+qNFKvRQA6UIRWDHc0oLkdtE/hQiPBzkhVP6XpdPZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QCi4raauyxipa9FG/JHVbpQE/EeU2j9116WCsk9CpWzVoKZF0HY/8e3iMGOW005dp6l7RV6oOh5l+ufcgRUpwxULJ3hEGxvjqOH3dsRdo3Nq7/RYH8neSEP+GN5B9aHPj1IHZo5qvWMOEWqaPfzugYMTrTF4JMUTLWaAVo1h8jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eOEjbSuU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eOEjbSuU"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A48313D7;
	Mon, 14 Apr 2025 13:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744629006;
	bh=G+qNFKvRQA6UIRWDHc0oLkdtE/hQiPBzkhVP6XpdPZ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eOEjbSuU/QYw71ZlgAI019/xWa3ly8n+A5r/NQz3DpXi3rOYAfN5jxt8FG+2ITI1u
	 8A0B37x5fAB2NEuE2NjWLkEH5ZBW7La5kGVojs0IuWKpxkV1sEyNeRPxn0X2qRigtr
	 j/0yUFeKV14Wyfy5uMM6hdWUqwLS9Jg/i+p06igI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 14 Apr 2025 14:11:12 +0300
Subject: [PATCH v3 03/17] drm/tidss: Adjust the pclk based on the HW
 capabilities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-cdns-dsi-impro-v3-3-4e52551d4f07@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3791;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=G+qNFKvRQA6UIRWDHc0oLkdtE/hQiPBzkhVP6XpdPZ8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/O19VN5zgt8TbTJnGRZrWkT/4F+Gnn/RJSs2f
 5Taed9kmpmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/ztfQAKCRD6PaqMvJYe
 9dqAD/9wWA2Bc4bvstLEt2pn4wU2tuyQ1RBXP7gDPBS5dZv01z9aMqKPntK631G0h8A0+AXmRA2
 om7GtakvctartQeTc8eQUX8dHEfUHC8uwSdBforv7ycuKDrqLDM9FVkiXkxymQ8bQQV902GJH98
 vY6dJ+EJMT/USOYNpktNipz7Ex0GB6V1ZTv9dcdsanoWDRr4UQJmiwZlw4+Blutkb9NEFtIlJI5
 JuQwc3FO8k39CL9nWlk51CFREO9eYmojhLAjD8Fcyxoki2Xq7LjAE7HA7KmFSM5M1lmkVRYfMxS
 XRhbHYYRX9LOd1JEon9XVu+nwLFnUl6U7iRD8AYQmaCjNXKTSCBnjeud9TWpkZmURLWpTSXuavc
 S1fBMICX96UG5NfO3cTIo/81M66xvkTnIsTLcTSEOSZ5Dm+pMMnVcZ2CPTnaEYnpTBTDN6kzVcX
 ZJvHz8p0uOBbwCeWn6/gaKyeYPHgV2gGGd/sesuQ8nYUeAoID0B63nDbQiyLB3l8WO7s/eHz9oK
 dPABOXcsB+iezKGI24t3e9u6oAKyBWg3TBAK+LKkvTu9M98jGgSuQnudUBdPdj8X/cPGcyF1Su9
 xq1I8CqvBgUC8GGfjO3sKyjMTMtAayCBBJsQ605sELTooBP3lskefDSTyYiN2t9okCV71SQ4eN8
 SmUo0JrvHd9EY2A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

At the moment the driver just sets the clock rate with clk_set_rate(),
and if the resulting rate is not the same as requested, prints a debug
print, but nothing else.

Add functionality to atomic_check(), in which the clk_round_rate() is
used to get the "rounded" rate, and set that to the adjusted_mode.

In practice, with the current K3 SoCs, the display PLL is capable of
producing very exact clocks, so most likely the rounded rate is the same
as the original one.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/tidss/tidss_crtc.c  | 23 +++++++++++++++++++----
 drivers/gpu/drm/tidss/tidss_dispc.c |  6 ++++++
 drivers/gpu/drm/tidss/tidss_dispc.h |  2 ++
 3 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 1604eca265ef..6c3967f70510 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -91,7 +91,7 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
 	struct dispc_device *dispc = tidss->dispc;
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 	u32 hw_videoport = tcrtc->hw_videoport;
-	const struct drm_display_mode *mode;
+	struct drm_display_mode *adjusted_mode;
 	enum drm_mode_status ok;
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
@@ -99,12 +99,27 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
 	if (!crtc_state->enable)
 		return 0;
 
-	mode = &crtc_state->adjusted_mode;
+	adjusted_mode = &crtc_state->adjusted_mode;
 
-	ok = dispc_vp_mode_valid(dispc, hw_videoport, mode);
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		long rate;
+
+		rate = dispc_vp_round_clk_rate(tidss->dispc,
+					       tcrtc->hw_videoport,
+					       adjusted_mode->clock * 1000);
+		if (rate < 0)
+			return -EINVAL;
+
+		adjusted_mode->clock = rate / 1000;
+
+		drm_mode_set_crtcinfo(adjusted_mode, 0);
+	}
+
+	ok = dispc_vp_mode_valid(dispc, hw_videoport, adjusted_mode);
 	if (ok != MODE_OK) {
 		dev_dbg(ddev->dev, "%s: bad mode: %ux%u pclk %u kHz\n",
-			__func__, mode->hdisplay, mode->vdisplay, mode->clock);
+			__func__, adjusted_mode->hdisplay,
+			adjusted_mode->vdisplay, adjusted_mode->clock);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index a5107f2732b1..3930fb7f03c2 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1318,6 +1318,12 @@ unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
 	return (unsigned int)(abs(((rr - r) * 100) / r));
 }
 
+long dispc_vp_round_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
+			     unsigned long rate)
+{
+	return clk_round_rate(dispc->vp_clk[hw_videoport], rate);
+}
+
 int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
 			  unsigned long rate)
 {
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index c31b477a18b0..d4c335e918fb 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -120,6 +120,8 @@ enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
 					 const struct drm_display_mode *mode);
 int dispc_vp_enable_clk(struct dispc_device *dispc, u32 hw_videoport);
 void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport);
+long dispc_vp_round_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
+			     unsigned long rate);
 int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
 			  unsigned long rate);
 void dispc_vp_setup(struct dispc_device *dispc, u32 hw_videoport,

-- 
2.43.0

