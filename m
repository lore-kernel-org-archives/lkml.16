Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166DB1EE034
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611246; cv=none; b=QxUsYZrAES9DmM+rXGOs8ERXDlYgfa0quF8kan9iuDe/519aPvoTW3jnEoNrM7K5Tk0nT7mV2xsxgZ/dNpSgptyA9g5sd25AN8ytEAnQ4/mgXX2pKBkDbLK9+6a8pSt/c2uIJQ6+yIZwAwVNWrOdVV2rjyCkRd5JsYaFsQDPJVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611246; c=relaxed/simple;
	bh=8sJ2Jy0vrHnyaFvxeGXJDie/WvS2uybFZmDRO8pBCQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pal1MsKT3ahxuY6U3Ztbb/CvnwebwtWEj4nR49sBMbDkBzy8dFI12TQAStoO7qks5esVhQm92jCAAWSMs0puf0NAb+TZqfEXyorxq0186fmmyJymk5fwpDzw7W3msxSo6YNcKvxZiOdQ4dAJwEv25u4lyvMh+Lc9EtoJthKOiTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DLChygH7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DLChygH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qR9Gz5kP97CP87lDGBVrwrrkWFsK8as95hKEoMQXmnE=;
	b=DLChygH79xqGQh57ZF+A2r7lvOB3JnCUpV62MzXKsIxvccAq11jW5YPzQ0tI6//0CxJmNt
	4nWSHAJiVtTHLvbr6NJfz5H4WeNwZXaPQrd1n/dOPpqaOb3ICV5FdwLMRU9eAVHM5x+DVu
	iedFyKiLMxAvX+EfN2a1/GIqA8yV5Lw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-3JF2WbHSNmaCqURCtYjlkA-1; Wed,
 02 Apr 2025 12:27:20 -0400
X-MC-Unique: 3JF2WbHSNmaCqURCtYjlkA-1
X-Mimecast-MFC-AGG-ID: 3JF2WbHSNmaCqURCtYjlkA_1743611237
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E225180AF7B;
	Wed,  2 Apr 2025 16:27:17 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 74DC2195609D;
	Wed,  2 Apr 2025 16:27:13 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:24:02 -0400
Subject: [PATCH 24/30] panel/novatek-nt35560: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-24-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1470;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=8sJ2Jy0vrHnyaFvxeGXJDie/WvS2uybFZmDRO8pBCQo=;
 b=2ndFEtkKlBoGCZkYUsSG8gPZKpmdOJdU2+wIWUg74oydgnRBFaiUbdOml420kMUYnVzQ9sF3+
 EyLBYQ/UzCHAqz97OzyrnYZTLwQj4kO/TP+YlhQbtWtFBmAdJoKkrIO
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 5bbea734123bc003e3d691040496b1fc679ac94b..98f0782c841114439317e16ac6bb4a5175374ac3 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -456,9 +456,12 @@ static int nt35560_probe(struct mipi_dsi_device *dsi)
 	struct nt35560 *nt;
 	int ret;
 
-	nt = devm_kzalloc(dev, sizeof(struct nt35560), GFP_KERNEL);
-	if (!nt)
-		return -ENOMEM;
+	nt = devm_drm_panel_alloc(dev, struct nt35560, panel,
+				  &nt35560_drm_funcs,
+				  DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(nt))
+		return PTR_ERR(nt);
+
 	nt->video_mode = of_property_read_bool(dev->of_node,
 						"enforce-video-mode");
 
@@ -502,9 +505,6 @@ static int nt35560_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(nt->reset_gpio),
 				     "failed to request GPIO\n");
 
-	drm_panel_init(&nt->panel, dev, &nt35560_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	nt->panel.backlight = devm_backlight_device_register(dev, "nt35560", dev, nt,
 					&nt35560_bl_ops, &nt35560_bl_props);
 	if (IS_ERR(nt->panel.backlight))

-- 
2.48.1

