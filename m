Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFF81F872F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715443; cv=none; b=RlmWPgYzNMzcRB270GD17JHNuShtyFzMNAhO34QVlxMs+sV6pKBpi8TGBH85GJYhiPXQOawv9OTs7B2/ieANkvDRStmWFEcj8RTHnSgceoUkk0KAzMHD4Xg66D+dQWgizxDuP+Q5RDQFeqYPrH+y+8rZUR2YkNEMwYTqB1t3tdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715443; c=relaxed/simple;
	bh=+c7IT47pMkYfgkwzhrtw/8hz45RdRQ+EKg/ShZCObLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lGubh7/UAu2V5F1QZTIl89c/W1MrSmiaZa+bYAj66yLEcVlm8Jp7qtnfIMpUv8xMFAqzBTv8Fy8JxKEPghtImqM8kqL670hsWPiIET2GVNVTsutlGnkKxM97hWs/z5W2bdWba0YeXLWTrgZBHfJtYyAs7ReY3mZEbDe2mMLuUFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VkmYoQbw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VkmYoQbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RFdE092r+Uc1sF1Bb0207eBij8dMJNPyV2vizsHaRjE=;
	b=VkmYoQbw77ajugwV8CkfkD3NahG8qig3yRnjPzaH7ipHeouTCdtmlKuZA8NMXcW6QUg3pZ
	Mv9avPanjp5a6XalJ2C82dnQr57Z9SLR+tL22gy1Nupzjv4LNtwKt2K81y0effc4gkglni
	ZAUmR1UbbAUa44tWOGV8aPGsypmvtCM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-ngO4dWf3PjqBSnKmpQlkEw-1; Thu,
 03 Apr 2025 17:23:58 -0400
X-MC-Unique: ngO4dWf3PjqBSnKmpQlkEw-1
X-Mimecast-MFC-AGG-ID: ngO4dWf3PjqBSnKmpQlkEw_1743715435
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46787180034D;
	Thu,  3 Apr 2025 21:23:55 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 01C62180A803;
	Thu,  3 Apr 2025 21:23:50 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:52 -0400
Subject: [PATCH 21/46] panel/samsung-s6e8aa0: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-21-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1294;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=+c7IT47pMkYfgkwzhrtw/8hz45RdRQ+EKg/ShZCObLM=;
 b=L+p2rXVnduURP86nP2PIxy6Pdofm/OVFf5ipNmSnfIAOL/6UKqjc68mquEt/XbJJ2AFS8O9rb
 KDfoARkEX4YBAJS7O+YUiygRPnrfsafQSJC2ut6/ztjCYrADlro8Bh+
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
index c51d07ec15295f81d4c2c07fcd5b58fdab18b084..8586b7801d15817a6adfd4b0c1990e3f75dce54b 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
@@ -979,9 +979,11 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
 	struct s6e8aa0 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(struct s6e8aa0), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&dsi->dev, struct s6e8aa0, panel,
+				   &s6e8aa0_drm_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 
@@ -1014,8 +1016,6 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
 
 	ctx->brightness = GAMMA_LEVEL_NUM - 1;
 
-	drm_panel_init(&ctx->panel, dev, &s6e8aa0_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_add(&ctx->panel);

-- 
2.48.1

