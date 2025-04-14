Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CC5298CA8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629139; cv=none; b=bUL0hJdRsBHUPkZWeyTfc2oEyRcALg4cBEjrVsM4lv1JRmWmIY5yMX4IJ9ly7H8X+3cAN0KzYz6qUBa5022DXU8Ismmrm2PZeUx1D8HwyFFEiFBxqSwsj4JMd+Bmn4Xz7jrQXD1Pcjvj2thMC6775jjWkxXmOBtxzzX5/FpeItM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629139; c=relaxed/simple;
	bh=lEa3BxN/6LhqthWXir58vTyZRT4d8BUmsi3iv05b4SI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hKOLnNAsvoAAA3xeaCcBwSBj8+uaZxuuRVMLWt7LXXN0hCXiRRFE2FjImV28mqr73rW/YN6j20uA0npcnfb0AI/Vv4Y8AalazPwIaddSeyNLFAdg8M9Gf49BE6SCeGlmsyw0OaHhbDU7D94IrWG1frByMGe5CcyWLiw0wnpLU7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YXODpftw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YXODpftw"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 251D799F;
	Mon, 14 Apr 2025 13:10:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744629005;
	bh=lEa3BxN/6LhqthWXir58vTyZRT4d8BUmsi3iv05b4SI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YXODpftwi3BM7VaheebN3guCOGsi+4bU+ojza8T7/Ro0Whez6IaRkUVHMYZA3EOxz
	 8P+adz/oBT6VdbYR89I3+vyFR9xzdI08DQOiQzyrAO3r2aUmfEuc7CczvDWbEa0hCu
	 ZGvdyVv0jVY2Xxa1yBQsp1Z7bru1mGQNfFeuSgis=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 14 Apr 2025 14:11:11 +0300
Subject: [PATCH v3 02/17] drm/tidss: Use the crtc_* timings when
 programming the HW
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-cdns-dsi-impro-v3-2-4e52551d4f07@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2447;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=lEa3BxN/6LhqthWXir58vTyZRT4d8BUmsi3iv05b4SI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/O18ncL1CiafBlZG0MdVYTCpi14Z+sY+pMcV+
 N2TzX0IjNOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/ztfAAKCRD6PaqMvJYe
 9UDGD/9zR9ZDJsIojm4mZ7+2bW6e+6cv4XGLsdp3L8ADCwFgZAhxlpmVFk/Vu2fcbep/nC2iooT
 VI/+m1K7ffOfeEwqgGnTAjF3O4ziyuPuRioEOsAXiZ3E6Vbx+ic5nZqFyTnfQRsWq/PBqNHg+9j
 zQqBplSUfO/o/irY78+EKXcoTKpdJ1KZC9Styh9B8tXixEFdFZ3ZXWMBm0Ws2yDdBs/mrpoTpBI
 U0sBX963jPAyvfNqYfVZKeT8X3O3ewY1gn6nqSUAn+HNu4DjLMMsH7UicNBW5dfh94CQ75GBNI+
 D6nMJxQibK+5OYOkMhfXpg+ZoD+ymbbOtk8JzciwjwKrDvJt4fZ0nBOSBgDmEt/sTIqT2BDRT5J
 PDVRhMF5xG06SWTvN/4Diu1igLXpO6ahM1jKZP8eW3FniD5b/ytv7pnDj9mxi3zdZHVpDj2Skn7
 wDGwhR2HqcfRaQREYyxvmWHiCW2TA3zIGsZGqH9CGFgFNKkO98tEz06gJJ2r+R6ofqSNTKf2eE0
 rRG36ttzNcR2voVbcQvg9n6n+7Ju9z6OoHzHhgNzOWgn3dbVbAWQ1xSpzwmfTOr826EGJ614iUU
 C58xLYD9LPvsunxpM1nkEEU5XWjJJSj4qu5vW02HC4+Nwn6QARfoLxqZ0exDFKkdQbkyJNwjc+R
 8xZbtWBYftQbJHg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use the crtc_* fields from drm_display_mode, instead of the "logical"
fields. This shouldn't change anything in practice, but afaiu the crtc_*
fields are the correct ones to use here.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_crtc.c  |  2 +-
 drivers/gpu/drm/tidss/tidss_dispc.c | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 94f8e3178df5..1604eca265ef 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -225,7 +225,7 @@ static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
 	tidss_runtime_get(tidss);
 
 	r = dispc_vp_set_clk_rate(tidss->dispc, tcrtc->hw_videoport,
-				  mode->clock * 1000);
+				  mode->crtc_clock * 1000);
 	if (r != 0)
 		return;
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index cacb5f3d8085..a5107f2732b1 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1084,13 +1084,13 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 
 	dispc_set_num_datalines(dispc, hw_videoport, fmt->data_width);
 
-	hfp = mode->hsync_start - mode->hdisplay;
-	hsw = mode->hsync_end - mode->hsync_start;
-	hbp = mode->htotal - mode->hsync_end;
+	hfp = mode->crtc_hsync_start - mode->crtc_hdisplay;
+	hsw = mode->crtc_hsync_end - mode->crtc_hsync_start;
+	hbp = mode->crtc_htotal - mode->crtc_hsync_end;
 
-	vfp = mode->vsync_start - mode->vdisplay;
-	vsw = mode->vsync_end - mode->vsync_start;
-	vbp = mode->vtotal - mode->vsync_end;
+	vfp = mode->crtc_vsync_start - mode->crtc_vdisplay;
+	vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
+	vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_TIMING_H,
 		       FLD_VAL(hsw - 1, 7, 0) |
@@ -1132,8 +1132,8 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 		       FLD_VAL(ivs, 12, 12));
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_SIZE_SCREEN,
-		       FLD_VAL(mode->hdisplay - 1, 11, 0) |
-		       FLD_VAL(mode->vdisplay - 1, 27, 16));
+		       FLD_VAL(mode->crtc_hdisplay - 1, 11, 0) |
+		       FLD_VAL(mode->crtc_vdisplay - 1, 27, 16));
 
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1, 0, 0);
 }

-- 
2.43.0

