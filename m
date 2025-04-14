Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF752C377C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629160; cv=none; b=IaGWMWZaCU4WKUU90zZTzdk4Cf7tN5SIcs3h3igc3OZXAXpm3Lttpdl3Fg4tBS3jZ5jDJY3+49vgAP739cZxn5jZYfs0AmZpDAX5LzdIiMSOs189gJIXcmORvnRizTf+3dg5wunQA6KuytWH6r4/0T6c6blnuow8O9hKUT4cHH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629160; c=relaxed/simple;
	bh=cQPsEPlrV/DcQb0G0dYa6phn1kP+NmfciO7HCLdvP04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RA+q1PUO5MwvpYW1yB0exREutrWv3OPtp1wWcqxFQ1wvWrOEZTm89o8lv/NuEEngXIaor5zAVpzojpagXJzpoykt5Kv9azgJd5JTXJFR7jx0P6TCEWAL2kn/rHbFnvbzy6RkYGAvT7oXvSDscCYP0ncrFzvEDxj29uqB534825k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cj1v8R43; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cj1v8R43"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D30036A6;
	Mon, 14 Apr 2025 13:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744629020;
	bh=cQPsEPlrV/DcQb0G0dYa6phn1kP+NmfciO7HCLdvP04=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cj1v8R438FuchoFfzWUN1cypZonMHcLsZpkCyXMZnH9dBY3G7QB40zJeYH3YaWYjj
	 ls9ADZyZywh6QQHwrLtN73tQnsUKn5W2esD0XVwfHnwvs79FtmUh6lpzXGkFrIaRdO
	 onHDG8DCTtXGm2emRyTO025dTGXaoVMms0mddVYU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 14 Apr 2025 14:11:24 +0300
Subject: [PATCH v3 15/17] drm/bridge: cdns-dsi: Fix event mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-cdns-dsi-impro-v3-15-4e52551d4f07@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2443;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=cQPsEPlrV/DcQb0G0dYa6phn1kP+NmfciO7HCLdvP04=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/O2B8KCrMjaRSBROpZL9tp+KeCFA4ZWGK7q75
 zOW0gHu3ViJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/ztgQAKCRD6PaqMvJYe
 9RkWEACNWHGst2xAo8gttjaAGMttFqSBQTn0allnNLo9NxRrYWuctuVBJbRMZ0SGlo+AEgS4+Xm
 /jaPTPMJgoTU8duH2Vmmfqz2qpxrHnmDrnsLOnDAVML0OJG4+GR8in2tN7OISlaOa9kh+Qy7MH0
 R2u5nTgnF4YBpl2ymGK8gq+QC1m+iXYRu4uld+0cpTbuJCKfHDQhg/EudiUjaxOrCRsjzfpNp+K
 5Fucygvx3ybl1ME8XmHeSSOpLbNnne/01J+ZBA8L3wpCusMMt0ynQHq9XWN8GiW1fEg3qXh4aqW
 QVw9b8ZVyMluQ7XdFhvydt59mCiN61wjQafnKHc8zoWcDZSHDoNDnOTIld8rCTX1T5p+WnHkhVT
 DRmKKHs4AdT6mgeHillxieOvDk9PSVxvpBmuaFDacd6efUQAgeInz12JoSYozC1f8qCRGzzwjDm
 idDlYdMY7zGTihHqIdgIxleEPXmk7vCE8W+LuAug6mnmLTBLpw3jB/yJqBCA0ZeD2Ji6h+2yN9z
 ghV5cNygdNsK41TEyvZ7Au/qCs7LTkZ6fcNkgCjUI4/V3ceeKEWRLEHKDF3J7iAwb/tH6C57Wtq
 b4KboZyjkSPo3dznMgwkHBlBVWA+Pr64pcfAI4Orv75nT1LuEpkcNYF4k0ihJleEz1YALFhFeGo
 iweQ3q+FS9mfp7Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The timings calculation gets it wrong for DSI event mode, resulting in
too large hbp value. Fix the issue by taking into account the
pulse/event mode difference.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 31 +++++++++++++++++---------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index a55f851711f0..63031379459e 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -418,7 +418,8 @@
 #define DSI_OUTPUT_PORT			0
 #define DSI_INPUT_PORT(inputid)		(1 + (inputid))
 
-#define DSI_HBP_FRAME_OVERHEAD		12
+#define DSI_HBP_FRAME_PULSE_OVERHEAD	12
+#define DSI_HBP_FRAME_EVENT_OVERHEAD	16
 #define DSI_HSA_FRAME_OVERHEAD		14
 #define DSI_HFP_FRAME_OVERHEAD		6
 #define DSI_HSS_VSS_VSE_FRAME_OVERHEAD	4
@@ -487,23 +488,31 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 
 	bpp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
 
-	dsi_cfg->hbp = dpi_to_dsi_timing(dpi_hbp + (sync_pulse ? 0 : dpi_hsa),
-					 bpp, DSI_HBP_FRAME_OVERHEAD);
+	if (sync_pulse) {
+		dsi_cfg->hbp = dpi_to_dsi_timing(dpi_hbp, bpp,
+						 DSI_HBP_FRAME_PULSE_OVERHEAD);
 
-	if (sync_pulse)
-		dsi_cfg->hsa =
-			dpi_to_dsi_timing(dpi_hsa, bpp, DSI_HSA_FRAME_OVERHEAD);
+		dsi_cfg->hsa = dpi_to_dsi_timing(dpi_hsa, bpp,
+						 DSI_HSA_FRAME_OVERHEAD);
+	} else {
+		dsi_cfg->hbp = dpi_to_dsi_timing(dpi_hbp + dpi_hsa, bpp,
+						 DSI_HBP_FRAME_EVENT_OVERHEAD);
+
+		dsi_cfg->hsa = 0;
+	}
 
 	dsi_cfg->hact = dpi_to_dsi_timing(dpi_hact, bpp, 0);
 
 	dsi_cfg->hfp = dpi_to_dsi_timing(dpi_hfp, bpp, DSI_HFP_FRAME_OVERHEAD);
 
-	dsi_cfg->htotal = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		dsi_cfg->htotal += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
+	dsi_cfg->htotal = dsi_cfg->hact + dsi_cfg->hfp + DSI_HFP_FRAME_OVERHEAD;
 
-	dsi_cfg->htotal += dsi_cfg->hact;
-	dsi_cfg->htotal += dsi_cfg->hfp + DSI_HFP_FRAME_OVERHEAD;
+	if (sync_pulse) {
+		dsi_cfg->htotal += dsi_cfg->hbp + DSI_HBP_FRAME_PULSE_OVERHEAD;
+		dsi_cfg->htotal += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
+	} else {
+		dsi_cfg->htotal += dsi_cfg->hbp + DSI_HBP_FRAME_EVENT_OVERHEAD;
+	}
 
 	return 0;
 }

-- 
2.43.0

