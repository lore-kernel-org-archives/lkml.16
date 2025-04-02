Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3419993B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611174; cv=none; b=QdcrymDKHixPQPet0c8oqOlkSj+8Y+etj9wG1I/ajqVysEHh2GP6DOgYsYUooy0AyfrFnvBbzClNY253XPq2T6KJFK+QlyxLk4UhHtcNuljxvNTgcp966QNE9Qc7544CwGbp+j74IhzOdWNhApipsID/wmp4nzftGBkUALn8I6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611174; c=relaxed/simple;
	bh=RqGutPaeOBSCsEcTrudyJmazu4iScvgeh/9UPC+Uuv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXoDYcLS8pkU5e83XgEFKLYkLsXSeWzqM6TSTXb5lzHNfWDGsLNFZQRkIjDVPfUdV+Viw+mWcNHd42zgHZsgZz6KhLpQN9zQ6s4gMd7uyV03DNNAe7R7ds6i/2hisex8ppujcvMBQqGD/CJ5ydHN/7vhLs71b4Gp7e181RV+1yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WswLpmnZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WswLpmnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YrgiZ49sQunTmrqMKdld9hch4IKkKrvZflApmSxvjSA=;
	b=WswLpmnZcE47UDyjlAveLvDGDd7+rqMwUh8X7lE3ZKHJUmrl3hYncylFFOA+V1WFgmeJMK
	8Tyh0H401H7C8qixW0kIIViTnjWDXwPBjX/QWF9rcpPQ+RZpj2jKD8BwqJQBoLgjHdX+jm
	zZ8NrNFAnu5e/niK0wUrp3uCUURhcNM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-530-uDGuDDr9OG60jZZ-aeahkg-1; Wed,
 02 Apr 2025 12:26:10 -0400
X-MC-Unique: uDGuDDr9OG60jZZ-aeahkg-1
X-Mimecast-MFC-AGG-ID: uDGuDDr9OG60jZZ-aeahkg_1743611167
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C3879180AF56;
	Wed,  2 Apr 2025 16:26:07 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 60C70195609D;
	Wed,  2 Apr 2025 16:26:03 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:46 -0400
Subject: [PATCH 08/30] panel/panel-ili9805: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-8-903b70999ea6@redhat.com>
References: <20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com>
In-Reply-To: <20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jianhua Lu <lujianhua000@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1423;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=RqGutPaeOBSCsEcTrudyJmazu4iScvgeh/9UPC+Uuv4=;
 b=kevIf1b2kquK7pRf6kHLhhfV3E93ZOplX4boa0iFlGaABOmFaBpXpFVaIWG36qrFhyaRNbw+4
 ZYDaExJX1/zAOYUNxTyPy6quR/0KeoKNLH7knMOrCN2uEEe8My74MOn
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Start using the new helper that does the refcounted
allocations

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9805.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9805.c b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
index 1cbc25758bd2bc0ed1ea64eed61edc7cdda68f9e..bda585e00cf980575b8b858149fa39fbaf2182df 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
@@ -307,9 +307,12 @@ static int ili9805_dsi_probe(struct mipi_dsi_device *dsi)
 	struct ili9805 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct ili9805, panel,
+				   &ili9805_funcs,
+				   DRM_MODE_CONNECTOR_DSI)
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
 	ctx->desc = of_device_get_match_data(&dsi->dev);
@@ -320,9 +323,6 @@ static int ili9805_dsi_probe(struct mipi_dsi_device *dsi)
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_NO_EOT_PACKET;
 	dsi->lanes = 2;
 
-	drm_panel_init(&ctx->panel, &dsi->dev, &ili9805_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ctx->dvdd = devm_regulator_get(&dsi->dev, "dvdd");
 	if (IS_ERR(ctx->dvdd))
 		return PTR_ERR(ctx->dvdd);

-- 
2.48.1

