Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5912882AC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240782; cv=none; b=AivQHNp5JJCYbPdcYKRcdkCFaJbhPM9CyFRIloBf6WQcGGaJ08ZAwgcWHrr6IpyFdPUm/X+CigqqE6lLP1LPK2XFatPjmUtbZhgFFCevJEVxy9OEvLy8oPu7UaCDjj0PF+yskDycwrDh8SM9BoP45mZDhcNd8BG7Qy07e0XXCFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240782; c=relaxed/simple;
	bh=FOWHSRDkQD1bUvtU+nnwl6eQjS6QhU0ViuG9LUXBNWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZStYcwTJ9xEVScjg/ciFekZ3cIMYzNavyuNKfm5ViApmrjpgqR29G+J+QAFJvGTbCRRBThp0g3LnRyE8VRForlciXflW/beGyvWuOuXQ4Pawd0AyY7Dji9weNQnR3gJOdW7WbLZj5P18Ghy1qjZ3f+8igUP10ffSvuubSjx1as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r+KUzytP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r+KUzytP"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33ECA14B0;
	Wed, 18 Jun 2025 11:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750240763;
	bh=FOWHSRDkQD1bUvtU+nnwl6eQjS6QhU0ViuG9LUXBNWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r+KUzytPQCFjcpGkMO8elwLCFy0SSbOEGNPDz/hdW5PotiEV/TEKC31jSBUnjjlEr
	 cBA51hCH3tkhI3WIffw3h9+B8iPo6KTL37+27B3eh3bkHc5Kk8ssYcZSiF9xz4upmx
	 bnMjnTshh6OxkiBdg+MDOHXqZw4vHMWbd9jwfg10=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:06 +0300
Subject: [PATCH v4 03/17] drm/tidss: Use the crtc_* timings when
 programming the HW
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-3-862c841dbe02@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2609;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=FOWHSRDkQD1bUvtU+nnwl6eQjS6QhU0ViuG9LUXBNWs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo39L30SKCSptkm8rKGeMS9Q2J2xZps/0US3U
 /i9xxNp4K6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKN/QAKCRD6PaqMvJYe
 9XCDEACa4ZSEgxTcRCRUts/Y7mzB5h362Q/ki9mitvBpxiL5h2Mut+wgefCn0izDRzoBdLZnC5w
 9KV2pEuGj3yrSVbss/IC5t9eVq96oMmEynEC0cocB+Mxg/Ri/2ozOM4lsTySg+KkonEc9mL1JIT
 CQGyRpvAcs0xkbUMqNqlKSqA631gMvozlDKTIuLDYhx1SiT+Uu6wz57OC+Kzbz5H311ECZEb97M
 d6TOAwf6Cgyl7Smb20zCdCjJnNAcszdnW7rtPD+Y9s8GNC0fqUsNqE0HYYF54AesJ+H2YZckwNc
 E7jGdtvcGVL8gqVGLprpTtZ4PAvywvalK5ekN8RqfbArVQ3vi0PZiRlIR3y7Jf22BD6LEYmmIv4
 vfpdtQv+fwqlufMIH/w9CiU9/hHOR5uBLnabyGKPc613IYYabAREA0tA9cmBfzJYs33ODiZTtUN
 0xi5TD1I8FeDWbaaU0DnZGl3rWWHKkpE1IKDZWBWlCXUYSVpyD20do4MNcHHe5TnIrFajVLWGkB
 ecs/UwxDtDXk8X5T+4ZAZ+EmdcHll3Z2SvXgXp3Pyu01JHNe6VOVMSacxz4zxGjQyfN7m3bA75i
 LKXd5ignXLqoHB9XzKd7kHhM2FIZ8vE8xopmBFJwo+nc4Bcwcqpezb2+RQSaFH45DSVczf1H2I6
 0i3/8ae1lwyXozQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use the crtc_* fields from drm_display_mode, instead of the "logical"
fields. This shouldn't change anything in practice, but afaiu the crtc_*
fields are the correct ones to use here.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Tested-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_crtc.c  |  2 +-
 drivers/gpu/drm/tidss/tidss_dispc.c | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index a2f40a5c7703..17efd77ce7f2 100644
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
index 21363ccbd763..857edd6170f8 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1194,13 +1194,13 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 
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
@@ -1242,8 +1242,8 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
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

