Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328841C8FBA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611266; cv=none; b=l7pk/0tcRJxULSfUep1XB2piFncRB5ryUOdubugEOhn4hb96e+oxURhFl5SP73VaRt7tWEqpJ43QAigbuC3/WMVkZiw4dNeAYQ3x9XLD74pbcKGTdupN+AOnALX2vASYMakTnC4dv5TWeHbsgVLJ0eHh/Lbfs6FrZW6i+sihz+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611266; c=relaxed/simple;
	bh=+jsQl646bOU9X8y48TMvtQRkadDZ3AxzB7aFav6cb9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=taSjbkfF2kIhdo34z5iSHoNUnXUYIibMqp+Pd8YYo4aEHE7DbOy7qGf0G8EcUrFbxq6kzveyIFoX5sfEVG9y/1RblXO3ZHL4xvncY3bJgZXYCUg7clGn1cA20y2KMirigHrzPN2uP+HBZHKDoeeSRrOIc7fCOEmo4JhZhPYojuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G9nP4FWi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G9nP4FWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5EzueVYpplGxvASeTRTyPsRiyFvto0Vy2Kcau66JwAs=;
	b=G9nP4FWiV4o/N8/WYTcTk/6G2N+MlRuy3xxnSQ1yb4bJ3HWPj0klM7L28ncJMykYuUpTNA
	g1JWuga6Y0d7uj3JC/BFftWfcTd+mEB2zKxLq+GxGiKfrcM1G2YS3dCVsC469/URt4Zjnk
	1apY4f4nEHDLH+Ah+boj3w8DdvWfgfY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-502-zZeRuaLzPJS1f346MLDk7Q-1; Wed,
 02 Apr 2025 12:27:41 -0400
X-MC-Unique: zZeRuaLzPJS1f346MLDk7Q-1
X-Mimecast-MFC-AGG-ID: zZeRuaLzPJS1f346MLDk7Q_1743611258
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9E51019560B6;
	Wed,  2 Apr 2025 16:27:38 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B8A91195609D;
	Wed,  2 Apr 2025 16:27:34 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:24:07 -0400
Subject: [PATCH 29/30] panel/lcd-olinuxino: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-29-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1392;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=+jsQl646bOU9X8y48TMvtQRkadDZ3AxzB7aFav6cb9w=;
 b=mmc7dvs5cgJDC72L+gor9D4R7BopRqNGGmjJ7fbK2JWxzYG5U7h4QgerROTSHLZ53ftW9kV2X
 qG+C/miz5x/DegTpKAVxmLLkweOKwmzBtcU26ltz17Y0mk6QOXfVP2D
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index 94ae8c8270b8fbdf47009dac6232ddf6885c2369..66f99982f360fe4445b0c0cbc1e57c4db4be5eda 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -175,9 +175,11 @@ static int lcd_olinuxino_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
 		return -ENODEV;
 
-	lcd = devm_kzalloc(dev, sizeof(*lcd), GFP_KERNEL);
-	if (!lcd)
-		return -ENOMEM;
+	lcd = devm_drm_panel_alloc(dev, struct lcd_olinuxino, panel,
+				   &lcd_olinuxino_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(lcd))
+		return PTR_ERR(lcd);
 
 	i2c_set_clientdata(client, lcd);
 	lcd->dev = dev;
@@ -234,9 +236,6 @@ static int lcd_olinuxino_probe(struct i2c_client *client)
 	if (IS_ERR(lcd->enable_gpio))
 		return PTR_ERR(lcd->enable_gpio);
 
-	drm_panel_init(&lcd->panel, dev, &lcd_olinuxino_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	ret = drm_panel_of_backlight(&lcd->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

