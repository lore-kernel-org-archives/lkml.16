Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFEE235BF4
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800693; cv=none; b=ZJROPLDPj9JhTuXm4iLvd3WMwQpQwaWx2VNgJxeaGikI2O7xGfB7HzsFmGfv7kVKYDo06b6d8YQb//9Svn4E5ImExdA+H2vtfAKrT1JCPXIfqz3N7tRlqyaFCFSBOOV4iI9ZJsX9Ke0eXe6OrIMKlrRS9hkvKuXRej0/u3IdQ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800693; c=relaxed/simple;
	bh=lRkWWERLuAdWwpIQmi5IFd1cLJPYw7y63+T1kP0Tv8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXL1BYZg2wpCxlA6WwwCCT/F6nHw9ppHVCcI/Zipnyih4oVBOLrTUDtpbEfN957Jy0nVD0Lob+1OCjDrXCDpirgO+Gbwpt30XFLNxiXz7www+ymwUprYh/Mq6OFbuj0wxwyUGiEB/zz2zs1tKTO03VDhoitc3/BuYgDlDOIdqSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RRHq7hnJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RRHq7hnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4s/5Md4AdmwKLbJ6hXPDKkuRGHxuPlp6mFiDKIStalw=;
	b=RRHq7hnJWtJBGIfYG7ayHSd5pJ3aqnW1lhwwePV9wGRqtLyGrh77M3Iz0Tl+zuYYeYpyeT
	jZbbPo5BcNeSMKy1JWE0CxCjikmLOQBaRlKIlytR1vda+Jv93XzuB1uCH5QT3OVTrgnHX7
	doe5BZ1gEUuEVaLSjW6q736bxwwcErQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-209-9dFvGPe-NHGS6BR1ynr_zg-1; Wed,
 21 May 2025 00:11:26 -0400
X-MC-Unique: 9dFvGPe-NHGS6BR1ynr_zg-1
X-Mimecast-MFC-AGG-ID: 9dFvGPe-NHGS6BR1ynr_zg_1747800684
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B95918004A7;
	Wed, 21 May 2025 04:11:24 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DE195195608F;
	Wed, 21 May 2025 04:11:18 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:55 -0500
Subject: [PATCH v3 24/30] panel/novatek-nt35560: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-24-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1554;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=lRkWWERLuAdWwpIQmi5IFd1cLJPYw7y63+T1kP0Tv8I=;
 b=bKlDY8+2Ezsdel9sP37QxOFVGjCsXlAdQmv3wiXDfgTN1vEumIYBrH1LpEGUIYCM5Pa9myMhX
 WLRgSKd3FOZBRZy2f51giOcRjCsC1X7RQ9OzK1lt1SVBm73UiFOjSAX
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

