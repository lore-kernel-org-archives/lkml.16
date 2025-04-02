Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDBC23BD0A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600685; cv=none; b=lKOHqWTT4YuV9OdxmfvcUl2XPIXDlJNDBwGuX35mIRfJmCiurtNKYwscIcUxxsjdgO+/xmjQ/Pu3J85GhH5OJuH5+/q7BntRG4boMTPFWPdnyXCY/VuU/vz6gkR7jn2aw5LbD55ovY0pN7M5wqGKny2fK3ds5nqYWQ3pUZhZt0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600685; c=relaxed/simple;
	bh=ye/JSU6RkHhBBCfydm73XwRK9B4EaT5qH6JR7AJ+l70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=olnIdYClzJ69H4NNkApO/pq71M3f3mpHgo0L4g5GJ4DD0a2nj7NIsdMk+WknUasAvq9Rjj0GElqPeVHwWbbG9QAzf6lSnZSm/z4JrHGSpI47foctrNOawNhZRm+sU0uLFusZSJHYplocbZsh2Qh7xVfXtPqa9eHyJ1t3rmGJNzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ernYpvSO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ernYpvSO"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BD7618D7;
	Wed,  2 Apr 2025 15:29:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743600566;
	bh=ye/JSU6RkHhBBCfydm73XwRK9B4EaT5qH6JR7AJ+l70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ernYpvSOioCibN7IuvbvF7/jfNl3aNOXg1fJd16OOoWZ9TOvQGQJdTg1zlBcLPxTG
	 mFFzFf3Rgi+24oi/gaw9jZkDM7xjZGJnU+ifDS6/ORhD35v1qFmTi95ZfVsKAxHk5v
	 O4gr0ByK+z6yre1/ulHGxtFK+mIwQHVBtKU1tExo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:30:45 +0300
Subject: [PATCH v2 03/18] drm/tidss: Adjust the pclk based on the HW
 capabilities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-3-4a093eaa5e27@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3735;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ye/JSU6RkHhBBCfydm73XwRK9B4EaT5qH6JR7AJ+l70=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7Twc2escEfItlPXesG8FIeup/1y8543dNTdaB
 i4LBDgP+8eJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08HAAKCRD6PaqMvJYe
 9dSQD/9pkps9DnK+/7diEOjwiA0BDCFcQ1JC+JDSASXO8elUhhgqL0ULOQJp4YE2OTt9HTu+tMN
 QQNa/DZiRsrZeStCyq/gR/2ulYvPYseaGQVPQZ5AS9uwiJWVe0FCqu/+Ht9eG6enBon/+2E6O8j
 La315wTP6NOqY+dNj6V6VQrN38Q+eCLKQ0g7yXVQj724m+mWBmqT+zGC47xK80AIhsPpg32QaTS
 On+g4uJaI4Z+vUqoTGU/01k53r3rzAKrexnPdvl8m5YfLzdeF6TcZe7gRtauo6heYvLhUfLf5nU
 ytU8TeHyTymbKJapftCnLhyAlE26DXdSgz7ddN2jeGzZXcSNZe2uiUgvhce2rARtyCQBY9Zmkmd
 URIWI5LKtYpA1G3AMYYVNaLq5Ld0OKj7fmetN3b7fO37hRNSwOALNvUse3gy3sJI24yVGsbf6Bd
 ABqwOsP7tf+lUqOzTLpqeCN8IaFoxYp52XH+tRuTT1bdQjarDwAg8VkT1+m8Zb597wlZOhEDw++
 Tv2sVhO639/y9Mbxm8jnFlES9jeMMvXHH/1pQR2sjbPktWTRRjZ/vhPFWnbH8wGFovXy+wDMfRa
 Lq9q5Dlu0O1EytKTDHzbmpqLGhgoKj2KZ3+cBZcYsvZ9ad32oo3Gfw/80t6dV1ULhIRKlOL3oZd
 JxmcmBJhYsMQyWg==
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

