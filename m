Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DF21DF270
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.154.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874897; cv=none; b=CjKYzw63n5Uoceuv5veSqy/KKmdKRnk4rlxryrNe5VhZ4NFE6ARLvbOTcPW8zPzD9NEFHxe9J6ujZxN7OVxQ79/8tsSFZ+DluUthFj9mPjHa0NzJG8NTruY2kkEjZIq7qWrvRTo46E9DytqGEbLgE7T+/HHP875uLa3LhxGfJYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874897; c=relaxed/simple;
	bh=xPNtRRM/nZFzWBkXgDHfNQHUtcTT9eduk0B55FBgjwY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hVWMz/2gZTaxJznwG+RARwIXHx2g5wDfbf3aq6XGICxnayFJCPdpGjPqxnAK1ZSFSHCpKFsOYAfCYjykO5auKGaec2Gi//myNBRU1A3IXFxnGrZKyCGrv3zHB45keV9gRthicP85WLekOJcJ8sEQnqnqI68v6Jr36lnngESDm1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ventureresearch.com; spf=pass smtp.mailfrom=ventureresearch.com; dkim=pass (2048-bit key) header.d=ventureresearch.com header.i=@ventureresearch.com header.b=d7CWexwv; arc=none smtp.client-ip=67.231.154.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ventureresearch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventureresearch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventureresearch.com header.i=@ventureresearch.com header.b="d7CWexwv"
Received: from dispatch1-us1.ppe-hosted.com (ip6-localhost [127.0.0.1])
	by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id AF3E61CF722
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:07:53 +0000 (UTC)
Received: from engine.ppe-hosted.com (unknown [10.110.49.207])
	by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id E512660120;
	Mon, 28 Apr 2025 21:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ventureresearch.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:message-id:message-id:mime-version:mime-version:subject:subject:to:to;
 s=selector-1717781956; bh=rmHbe1rt5BgZPp9mZinZNbVB03QooxBNv/WYL5AAkBI=;
 b=d7CWexwvBHWFPi6whiyB+3nyzRRcqk+XEwR95lS57pbD0FrxQeUtSnVxabNB6m7DgYQyV74gXlxcucZ9HZBbjbKMD+uezmWsWTnipbzhOIdlpCRqgQiH//dSGQ3cO1G+s94AJJu4+hkO1ppQ/RiXjXcjCCPs0UY42MlzBe8zR2dKxAIiLx1xR/5l+NXzVZaUL66A/Kn5+Px0v036eTe14Ij/7JYnU+3o+4WD+5m1g7Kob2AAJ3DsjKYswbQsZ5WCqr/ajXnr7slYrPRNAPKUcIi9i2Jw1yj0LlzA1zIQhAZQGUnQUkI9advrdKKOeWFZ/f9qS1uXlzFjDlM6yN0POQ==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from Mail2019.crm.ventureresearch.com (unknown [67.210.242.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 37DCC24006A;
	Mon, 28 Apr 2025 21:07:45 +0000 (UTC)
Received: from build01-deb.crm.ventureresearch.com (2605:ed00:15b3:1::5:1) by
 mail.ventureresearch.com (2605:ae00:1849:1:733d:6d07:c0da:2dc6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 28 Apr
 2025 16:07:44 -0500
From: Kevin Baker <kevinb@ventureresearch.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
	<sam@ravnborg.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Kevin
 Baker <kevinb@ventureresearch.com>
Subject: [PATCH] drm/panel: simple: Update timings for AUO G101EVN010
Date: Mon, 28 Apr 2025 16:07:26 -0500
Message-ID: <20250428210726.3395279-1-kevinb@ventureresearch.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MDID: 1745874466-yh445e51p1Fp
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;at1;1745874466;yh445e51p1Fp;<kevinb@ventureresearch.com>;5e6c6d0f4ea4dbaad6972e39b9ca5131
X-PPE-TRUSTED: V=1;DIR=OUT;

Switch to panel timings based on datasheet for the AUO G101EVN01.0
LVDS panel. Default timings were tested on the panel.

Previous mode-based timings resulted in horizontal display shift.

Signed-off-by: Kevin Baker <kevinb@ventureresearch.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index fb8a57afe687..1a3d7ccb328a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -979,27 +979,28 @@ static const struct panel_desc auo_g070vvn01 = {
 	},
 };
 
-static const struct drm_display_mode auo_g101evn010_mode = {
-	.clock = 68930,
-	.hdisplay = 1280,
-	.hsync_start = 1280 + 82,
-	.hsync_end = 1280 + 82 + 2,
-	.htotal = 1280 + 82 + 2 + 84,
-	.vdisplay = 800,
-	.vsync_start = 800 + 8,
-	.vsync_end = 800 + 8 + 2,
-	.vtotal = 800 + 8 + 2 + 6,
+static const struct display_timing auo_g101evn010_timing = {
+	.pixelclock = { 64000000, 68930000, 85000000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 8, 64, 256 },
+	.hback_porch = { 8, 64, 256 },
+	.hsync_len = { 40, 168, 767 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 4, 8, 100 },
+	.vback_porch = { 4, 8, 100 },
+	.vsync_len = { 8, 16, 223 },
 };
 
 static const struct panel_desc auo_g101evn010 = {
-	.modes = &auo_g101evn010_mode,
-	.num_modes = 1,
+	.timings = &auo_g101evn010_timing,
+	.num_timings = 1,
 	.bpc = 6,
 	.size = {
 		.width = 216,
 		.height = 135,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-- 
2.39.5

