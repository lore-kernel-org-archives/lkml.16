Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0EF1DD0F2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363409; cv=none; b=ffqxMmM93rwYdrnXAxbw8N29Q42QbBMqoky1W91KeLNjhghyzmx60g0aUZg3WQc7uje+67RMN568YtGvyJo99eHgw8gryPw1Ci/FDp+Jp6wesvpg5GrZlQ5TQRvPR43M8LzFQTHhWjQc/ymu6k/SjfAzZFBrWXBVuuqcjQ61x7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363409; c=relaxed/simple;
	bh=+mol464Nx9we/BeXAjem7Y27VK+FyvS3TjB94XX0jm0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dQ0vZjbB07W0DvITHSyQURq38eKaeuCZtwEC5/Uocf6NFEsXdvNsngmgLttjtIk4Ft4VXQZr+g9qLntcHsDkqlSHwHq/GiL3zw85P/+g9h5bVu1j1Fubwq+dfX6J1fwDHIj2FMLGpPNMOYzLHYeKR8YxVIwC+U4SMfE2raQRvco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GuiF3XcB; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GuiF3XcB"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B9N9IN1534520
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 04:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744363389;
	bh=mSgxD2LIwObpc4l8kxKNFTVWkZHtkwhCMwuJlsqYp4Q=;
	h=From:To:CC:Subject:Date;
	b=GuiF3XcBAMWgSSWzYT7bOfY6o84uEqTyzEisgFGHjtdF6eICKpjE5ZFyHsXtY6lNQ
	 5CmppGQA6wOOku4VXkazAh+Cgja60dZcJxTI+A022VT4xSlZ0J2dZB1BNsgIfx5DEM
	 20dscjaaRtDw/HqdI04MF6L7aEYdZ02rPY+9KvWI=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B9N9gw055059
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 04:23:09 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 04:23:08 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 04:23:08 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B9N7oA054927;
	Fri, 11 Apr 2025 04:23:08 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
        <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <linux-kernel@vger.kernel.org>, <j-choudhary@ti.com>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Add necessary DSI flags
Date: Fri, 11 Apr 2025 14:53:07 +0530
Message-ID: <20250411092307.238398-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Enable NO_EOT and SYNC flags for DSI to use VIDEO_SYNC_PULSE_MODE
with EOT disabled.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f72675766e01..8e9a7eb927da 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -707,7 +707,8 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
 	/* TODO: setting to 4 MIPI lanes always for now */
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
+			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
 
 	/* check if continuous dsi clock is required or not */
 	pm_runtime_get_sync(dev);
-- 
2.34.1

