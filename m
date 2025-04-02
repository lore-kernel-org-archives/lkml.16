Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C241E47A9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611219; cv=none; b=FSfUot4VIHsj75aLN18kXa4a58nRSXdI38Jxn05e2mavIE2B6xZkyWjUCGtaScKFxGaZXlXLajjg/EJ1yVqfz4DzLaL+J+yvRajEXXaPlDgDb6s5ir+75TeaXRFsLXIMA/SNCaJUJi6qaTgCbIef+jebw7b+aUNW+iGH2UmCROw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611219; c=relaxed/simple;
	bh=BPdSeUjyavHQlLqxv/q0dWl/OXLbabxuJZzn3plQWOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XBHMzM/qR5Rs7fQT/wnAg7lcfBWnw97gQl9Wh7jmBHRilPDz70bXXfG07vx4J5JWdQmuwoqH3G9kRcaC81wV4FcCyKZ7dsNWaPmTd9+ACylD8sb506AwWj1eyo7ZaOZv+UOYCMAJmEXjsWSOK7BRK0Q3NvcHUhwJs5wIbUM+0ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ONaz7ZDY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ONaz7ZDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epE71qXnPf5K5pc+Z9ENDEN6udnjeC2gv/4reT1wp5w=;
	b=ONaz7ZDY6+kdtCRGyaUGGeC9eKeEqmyrIJUT+/r3nfttussSHCvT8RuywXB/1VF4WYNxcv
	Rka/tGH+jA/wPtMaZyYDaOYWylQARB6sLypH1pUnJWXiyJCU7oOWgkl/zwcs86ZQkkOX8l
	oCxQNCtYszW+azpoIPAmv5CQl48LstM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-uCOz6hAjMfebgOmWlaxCnA-1; Wed,
 02 Apr 2025 12:26:53 -0400
X-MC-Unique: uCOz6hAjMfebgOmWlaxCnA-1
X-Mimecast-MFC-AGG-ID: uCOz6hAjMfebgOmWlaxCnA_1743611211
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 67A92180AB19;
	Wed,  2 Apr 2025 16:26:51 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 80676195609D;
	Wed,  2 Apr 2025 16:26:47 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:56 -0400
Subject: [PATCH 18/30] panel/lincolntech-lcd197: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-18-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1468;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=BPdSeUjyavHQlLqxv/q0dWl/OXLbabxuJZzn3plQWOg=;
 b=YasvvlQSr5zoz/QAeb3BNLNfSxsoG0QFIf5SgY3H8S/wPZREf6IxA6D/xcC7uc+bK2JP6Usy3
 QFycL1tvDulD73Sq74D5E0xteEZMkhp6hjKpRm293kqsg7YcvC4V/1Y
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c b/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c
index 032c542aab0f788e8a244721c838d9d740af98fb..54ad17704072213b00292df487a9f28cffd45f6c 100644
--- a/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c
+++ b/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c
@@ -190,9 +190,11 @@ static int lincoln_lcd197_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = (MIPI_DSI_MODE_VIDEO |
 			   MIPI_DSI_MODE_VIDEO_BURST);
 
-	lcd = devm_kzalloc(&dsi->dev, sizeof(*lcd), GFP_KERNEL);
-	if (!lcd)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct lincoln_lcd197_panel, panel,
+				   &lincoln_lcd197_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mipi_dsi_set_drvdata(dsi, lcd);
 	lcd->dsi = dsi;
@@ -214,9 +216,6 @@ static int lincoln_lcd197_panel_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(lcd->reset_gpio),
 				     "failed to get reset gpio");
 
-	drm_panel_init(&lcd->panel, dev,
-		       &lincoln_lcd197_panel_funcs, DRM_MODE_CONNECTOR_DSI);
-
 	err = drm_panel_of_backlight(&lcd->panel);
 	if (err)
 		return err;

-- 
2.48.1

