Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDEE2010EE;
	Tue, 20 May 2025 07:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727090; cv=none; b=sXfubLogW2/0eUCYD2KzqMOHoENpKQl9DjeBmUSiD6enwJ/ukN5kdB5QkwGPPNpr3oZgho17HJ5A2OAQ9KLxPZcVm5sYLzgYZZ2ejNfAOx3vuU2r0+NOzvPQ/hpcP6DZanaT4uENrIYIAB3w8fzTW6hnSNYNAzNQF25ig78tZow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727090; c=relaxed/simple;
	bh=Ectfg8n4iR1olYWwlS3iE4cQtuS/TQ5wL1WOKpMzJpg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UBWRmiYt2OIdvFHn6VLUf3eo74/6g4riFujX4WCcf0J7tORBMsZOfcjdZPv/ZBz0ZPZg5ZJdi2/3Bp4P8qU12gj6CoQN+eG8fTk6DtntlrSVPQHk+xtQR4z/c6R2GmDQFz9+b5dPazVBeG1h6HbXrowibJ+lmiLn4qw7PFaZahs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A881X+u7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A881X+u7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C041C4CEEF;
	Tue, 20 May 2025 07:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747727089;
	bh=Ectfg8n4iR1olYWwlS3iE4cQtuS/TQ5wL1WOKpMzJpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A881X+u7pG/NfCGCfv2o7WflN+HCOB06RXaISIgeLVbhcT+UULRV1zBn6fSq8NjGg
	 rgNvjR7mE656Y7eZhuOG9gyywrhCOCcq0rGYuVKpm407K4QTwsrG07+hAsqxGWV7pA
	 64VDmfKCVfTchKmCIGQO8EbIGNahEefA271FHHnHaYGh+Xvi8iTAs0RL09uXPyIV7s
	 AgdwTkwNcsI8ZGrWZbCWgQUMBrshgwqnmbLZ8XHOiX5DLFXxJH7V/2S5hmKbT6MKlp
	 P+bpLoVuoONUFlC8cwDYvVntdMUnEY/pcoxckgYNeZFDDVwzDHBrXsbwIUNy9QgwaC
	 nqPjF/pZgV6TA==
From: Michael Walle <mwalle@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 2/2] drm/panel-simple: add AUO P238HAN01 panel entry
Date: Tue, 20 May 2025 09:44:39 +0200
Message-Id: <20250520074439.655749-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520074439.655749-1-mwalle@kernel.org>
References: <20250520074439.655749-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Timings taken from the datasheet and the display is working in DE mode,
thus the datasheet only specifies the blanking period. sync, back porch
and front porch are arbitrarily chosen.

The datasheet can be found at [1] but for reference these are the
relevant timings:

 sym  |              | min  | typ  | max  | unit |
------|--------------+------+------+------+------+
   Tv | V period     | 1094 | 1130 | 1836 | Th   |
      | V active     | 1080 | 1080 | 1080 | Th   |
      | V blanking   |   14 |   50 |  756 | Th   |
   Fv | V frequency  |   49 |   60 |   76 | Hz   |
   Th | H period     | 1000 | 1050 | 1678 | Tclk |
      | H active     |  960 |  960 |  960 | Tclk |
      | H blanking   |   40 |   90 |  718 | Tclk |
   Fh | H frequency  | 53.7 | 67.8 | 90.0 | kHz  |
 Tclk | LVDS clock   | 53.7 | 71.2 | 90.0 | MHz  |

Keep in mind that this is a dual link LVDS panel and the horizontal
timings are only for one half of the panel.

[1] https://www.fortec-integrated.de/fileadmin/pdf/produkte/TFT-Displays/AUO/P238HAN01.0_Datasheet.pdf

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0a3b26bb4d73..47222d2d8129 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1268,6 +1268,30 @@ static const struct panel_desc auo_g190ean01 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing auo_p238han01_timings = {
+	.pixelclock = { 107400000, 142400000, 180000000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 30, 70, 650 },
+	.hback_porch = { 30, 70, 650 },
+	.hsync_len = { 20, 40, 136 },
+	.vactive = { 1080, 1080, 1080 },
+	.vfront_porch = { 5, 19, 318 },
+	.vback_porch = { 5, 19, 318 },
+	.vsync_len = { 4, 12, 120 },
+};
+
+static const struct panel_desc auo_p238han01 = {
+	.timings = &auo_p238han01_timings,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 527,
+		.height = 296,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing auo_p320hvn03_timings = {
 	.pixelclock = { 106000000, 148500000, 164000000 },
 	.hactive = { 1920, 1920, 1920 },
@@ -4938,6 +4962,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "auo,g190ean01",
 		.data = &auo_g190ean01,
+	}, {
+		.compatible = "auo,p238han01",
+		.data = &auo_p238han01,
 	}, {
 		.compatible = "auo,p320hvn03",
 		.data = &auo_p320hvn03,
-- 
2.39.5

