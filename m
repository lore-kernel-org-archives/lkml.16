Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEA44315C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715358; cv=none; b=BlfBYvHK4T5DyPKas93Q2q3TewB1t2t/YUhXhe3k/aenX5vkL0qDTJCEoElR8Zb5zdifMnv0+iq95iSXCnVY4vx+sxTGi8Y2hO9gnt5w3E3zzc1+/ZxG5cN9YDkAzfPvZ6wH0NyEgp0dhDKmPt0EeVANuTu9u60PPPCjx8OaXV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715358; c=relaxed/simple;
	bh=dVBgg3z7zLpmbEkqdjcbZ2pc2YwS1QSVIbMgvQsjMYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r54WMF/IPD2tzihyjNFU9oOqD7J+nGcUo9IRoU7GztS426jz5R5USnkgehcIKIDp5ObXKFTbph1+1xqeYP7wJl26bYogcVB443XdZuum+94ZcjTUCrIS+xWSEFfQZpXnGDobLuIE6BKx71eOh2DL6VpfD7DxtiQC/sBGSCTyMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z8F06zbr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z8F06zbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rAj34FnJeWR5U4mXuU+q9ggpKMG/0+1Tr8WrD5T4yuQ=;
	b=Z8F06zbrGjoTnTr//vCk1p4U1JGxsUbkFCNnlK1ZrXKXbbWtaGtgS7nCmGEDl0tsw9Igw2
	NL8FP4MHGTtl6DylCq5l0FYhNy4rqTZvmKgVYzZYIFHVxAyvNqxYQ6z9CPIVKOAaEsCTNE
	l8fUyTK1xLQBOrAynToDxoc3Rq9q8C4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-574-ncmoTBuZPPmwF2A6lGTxVA-1; Thu,
 03 Apr 2025 17:22:29 -0400
X-MC-Unique: ncmoTBuZPPmwF2A6lGTxVA-1
X-Mimecast-MFC-AGG-ID: ncmoTBuZPPmwF2A6lGTxVA_1743715346
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D9CBB19560BD;
	Thu,  3 Apr 2025 21:22:25 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BF15D180B488;
	Thu,  3 Apr 2025 21:22:20 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:34 -0400
Subject: [PATCH 03/46] panel/raydium-rm67200: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-3-965b15ad5b8e@redhat.com>
References: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
In-Reply-To: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1381;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=dVBgg3z7zLpmbEkqdjcbZ2pc2YwS1QSVIbMgvQsjMYU=;
 b=BHfeEYacBrKY1Vbq3egmahttZ4RQHmjQf3P1+rw2aHGon4BYCpnl+vL7b0Vofu5cB0e6/dpAH
 gc2HglhUm3mCcxDJHyUZX8TisdaXGyZa0RrgB9H8GPJVaZDZDaJQpXF
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-raydium-rm67200.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
index 64b685dc11f65b0f402995e27a42df5d69ae4361..1da8225e6f7a5cff94a882874be909db1d28fe86 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
@@ -391,9 +391,11 @@ static int raydium_rm67200_probe(struct mipi_dsi_device *dsi)
 	struct raydium_rm67200 *ctx;
 	int ret = 0;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct raydium_rm67200, panel,
+				   &raydium_rm67200_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->panel_info = device_get_match_data(dev);
 	if (!ctx->panel_info)
@@ -421,9 +423,6 @@ static int raydium_rm67200_probe(struct mipi_dsi_device *dsi)
 			  MIPI_DSI_MODE_LPM;
 	ctx->panel.prepare_prev_first = true;
 
-	drm_panel_init(&ctx->panel, dev, &raydium_rm67200_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

