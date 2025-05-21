Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AFF2309B9
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800722; cv=none; b=oMLxuu9iL//MNBbH1aT9EYQb6sLw5Nf3FIIxKo6vVrevkCswXNuaWr989KBEeF3JyapbGbDzVnCEyv12x5z5XcVKe3zcSrnCBE+CefBUoB0k7W/jLvK1IWspbQLq7raspult0ojDjIetM4iLU3NHtc1Bubnj64VOAceALL8zG/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800722; c=relaxed/simple;
	bh=2i0jL4XsnqFbIexqT4banLASWyy60jkwulDvEkXkNk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JhLpJFTZunvA4kXIsP5evU7a3ZdalqSeXZrPMRM4QQSjKbb2Jq/lfIUrcCNA7DvwK5DzBOckNsjYsMHxY1u2/pngAF+yO6hpP+IwQKIakg0+800QDmy0401K6dgYhmfVG4bNqI6neuO78hOWt9D/yXSA6j4KilFxCVprpCoY4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SiGcTMwY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SiGcTMwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1rEQ3IjmIqFKgyiKkgSnG5sStp/39Ga3VpxPyTR1hM=;
	b=SiGcTMwYf6YXl8KAUpJ9Q7nAm6tGf7Jz4fCHzuWOKg32VoTQNTSgQT2ZT974FIE8XCO4OM
	m2mO/1h1TjIbIvLOL5tJ2Mf6yqLkjQe9UaJLN2F8pCq7cehOfA85h7Jpo1a6sLRoEoKvVP
	ytLj3f83GC8n59ArhF4MEcH5MJ4BUNw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-124-MrAVb9DLOemkXUveJRDBSg-1; Wed,
 21 May 2025 00:11:56 -0400
X-MC-Unique: MrAVb9DLOemkXUveJRDBSg-1
X-Mimecast-MFC-AGG-ID: MrAVb9DLOemkXUveJRDBSg_1747800713
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 93FDB180036D;
	Wed, 21 May 2025 04:11:53 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3F7081956095;
	Wed, 21 May 2025 04:11:48 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:04:00 -0500
Subject: [PATCH v3 29/30] panel/lcd-olinuxino: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-29-f7ae7b723c68@redhat.com>
References: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
In-Reply-To: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1476;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=2i0jL4XsnqFbIexqT4banLASWyy60jkwulDvEkXkNk8=;
 b=w/YbyM5hPdIsuFLSOVXv9ESssec7F5vdooo9fpodM4KskSG7i63gHd2fr759Lb7UBBeM2f3zx
 sph4mtjUZX0BQHr1jaLLLaTs7tAdgOE2FhoMlRz2F5e3ISEOZ+MXTI2
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v3: none.
v2: none.
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

