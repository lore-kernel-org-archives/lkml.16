Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDD12949F7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745921376; cv=none; b=cx7QTku/jeYhUgh6eDkU6100HzjAgSbojDHYbIx6J+3P5B7DWS1l4IbR8qi7fc3JN9ixs6lcHVexQea28A0aZzS+ukeplIYtHVwWhwBClo1yyQki+MXdkBQaf6paS8vWHCU62Lts+52l5aYfpOWUUH8qAIVf23PeomXxz7ZJcNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745921376; c=relaxed/simple;
	bh=goisZbNoUKv69snA63GSjtR272V1jBTX7ipIJhdReGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZKk4IEeGB/nqYWvp7BOL3qpr+r5Iy1HVl792Lcor3rQIOLoJmkCBLEtnBtuCb6lo5yUsJ2um3wO+lxf96Y6V1lHU9AptSsabFBIumktmKN8tE5QMrR2p9d8fi1KzmopNmZJH0AfQmvAXyB/ulDNrW71MqXiz5zki9iNfcfmRKrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=XnoGx84z; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=pYPYSarC reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="XnoGx84z";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="pYPYSarC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745921372; x=1777457372;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iSnB+tiO7RJY6/v5TqZgypWMYIiKGFl49Mks0edXerk=;
  b=XnoGx84zCsGv2Wc6TrKjUtV1RmJP+atwrNBCALusixqudEtq9DqzNdGE
   Tuya3E+/uz2jjESIkHXT9dGRwZO5jF7ATxPsgN2OzhxinzoYyROuO/BfD
   Sx9pO9Y7rHdq8CCVMc+BXVC7u0V/j4JsLsl/aj/m4k3KEEUoSwJJ9ZjlA
   Tn9+Ncbfr1OZpnz2a2oGDLIWv/BOCG7kWCT6EVDhxqr5F0Zqqoh5IBNUq
   oNh3S5zwgGUqOTSTvUsWYqcnhQAiuQq65Rr4lQAci9wI/YXOwr1f8YKp0
   S2D2kJ/srEXsRPbAGi+ntnwpEJFpeuYKodaAeMSHTHP1U7Rm1ARWc4hYC
   w==;
X-CSE-ConnectionGUID: 2oTZPV+dSOOsxLVCJYAMkQ==
X-CSE-MsgGUID: 8xZ4UqzESUiszoQuMgVlRg==
X-IronPort-AV: E=Sophos;i="6.15,248,1739833200"; 
   d="scan'208";a="43779882"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Apr 2025 12:09:29 +0200
X-CheckPoint: {6810A559-B-22EE63B7-E8AF8A9B}
X-MAIL-CPID: 219F0D8F3AD959829E5A5445EFFD28B2_3
X-Control-Analysis: str=0001.0A006396.6810A558.0045,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 658B4160E51;
	Tue, 29 Apr 2025 12:09:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745921364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iSnB+tiO7RJY6/v5TqZgypWMYIiKGFl49Mks0edXerk=;
	b=pYPYSarCiS7YLzsLmIEXC7QY79PIP9YZfAi+DPC2mCufP2/ezomg7Bcpzre93c5Q5EMkIZ
	1WGkI8x+nprBZjyk0OaYhLFHZsN1NRxTDCR6d1Hd+6o4RXmAIhDbJOsLKL2yxcA+7Uy9L5
	Xzy9OVOLC/Rrtrqvj3dWfxSPVp0U3KdOWEnox7QSpHdoqk4lr1NuiNI+qGPs0BSeMYxPz0
	anJ4VMTsnJRMiTnYG9YbcbjH/orFmCG4rZI3b7RnTMwvWC5jtbHKqUkc6lK/n9R/mxvZUb
	9xdxcrLkZBoW19+TV0FNj2Am5UGkBcLvKAW/vMC/iP72f12vHcd91qUqYc5oRA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm: lcdif: Use dev_err_probe()
Date: Tue, 29 Apr 2025 12:09:18 +0200
Message-ID: <20250429100919.1180404-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Use dev_err_probe() to add a reason for deferred probe. This can
especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index d5996efaf34bb..99e632d4a0e9b 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -164,15 +164,17 @@ static int lcdif_load(struct drm_device *drm)
 
 	lcdif->clk = devm_clk_get(drm->dev, "pix");
 	if (IS_ERR(lcdif->clk))
-		return PTR_ERR(lcdif->clk);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk), "Failed to get pix clock\n");
 
 	lcdif->clk_axi = devm_clk_get(drm->dev, "axi");
 	if (IS_ERR(lcdif->clk_axi))
-		return PTR_ERR(lcdif->clk_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_axi),
+				     "Failed to get axi clock\n");
 
 	lcdif->clk_disp_axi = devm_clk_get(drm->dev, "disp_axi");
 	if (IS_ERR(lcdif->clk_disp_axi))
-		return PTR_ERR(lcdif->clk_disp_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_disp_axi),
+				     "Failed to get disp_axi clock\n");
 
 	platform_set_drvdata(pdev, drm);
 
-- 
2.43.0

