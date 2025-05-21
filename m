Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA54E22FAF4
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800665; cv=none; b=mQFXLT7jLmv4s0kbXm5L5rFlPB5vPWu6rvSiO7WfCLsE63yDTaQRxU1jMkO509GcxgD5TlJwinixjUmkDDsiNzqt0B/OS4QTGlnPNQqg0PbOZK8tYFkMrzYwtNLsjjwpY43ZivvaqC/rRh99SXeaK4m9hKpc6p3eGrBBQ6UWowo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800665; c=relaxed/simple;
	bh=IH9ycYv2vALU35t6qzJFEdusmSs6ZiL2JiuFJt9f6u8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P+XeETdZE+zq1jcYMNZMOU5aiDr7ryOmvtBOTHG/2kHK4BwkkNgE5AN3QldMYOmi5Jf9NZg9SlWO4gBLaqSkJHlEH8iyIi4GrRLiVav5/L1Gu+G4066cBaMteEjWUcly2IzANxn3beu1MjYNZVfZWPObEW0X8srS/T7EBZPa9Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B6h/s71m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B6h/s71m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BkrNono46FWWXHPun5vhX1sWscczaQ6pvGc2N+Rnu7o=;
	b=B6h/s71mc0Qau/CC2S2Rer/x7sMMZHLKm2j753m/e1TAOGrROFb4Z4iLVjn3TH0LlcbEX0
	pd0bFEgyiXsdRot6HDss/np5CAzlHtCltSz4xbbnc9kwXdW+gPNKgDu54d16wpM+oJ9UGN
	hxq9khKVUtLuH+fIvA6lk6zW4baoKrI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-wWLvSrvUN0C1cTbQ5QgpxA-1; Wed,
 21 May 2025 00:10:57 -0400
X-MC-Unique: wWLvSrvUN0C1cTbQ5QgpxA-1
X-Mimecast-MFC-AGG-ID: wWLvSrvUN0C1cTbQ5QgpxA_1747800655
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ECA11180045C;
	Wed, 21 May 2025 04:10:54 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7ACAE1956095;
	Wed, 21 May 2025 04:10:49 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:50 -0500
Subject: [PATCH v3 19/30] panel/magnachip-d53e6ea8966: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-19-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1519;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=IH9ycYv2vALU35t6qzJFEdusmSs6ZiL2JiuFJt9f6u8=;
 b=V8i+FJ1X2qKIPOOWZ6e+9RKnMYwwi8NK/Ic3G68z8k43k2UvR2Wg5hoXluygznVo5koT0gxJm
 LPiZ8QgNWj/DzmAxYyoK3kYCrl7HTKQ3sJIMouVMf/+MoBg+7CPLqYe
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v3: fix compilation.
v2: none.
---
 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
index 799c2161fc85b24e1fb236fd63b397bf66fc15c8..cde168ec631c43cef2a8180bff55d00331426d86 100644
--- a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
+++ b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
@@ -370,9 +370,11 @@ static int d53e6ea8966_probe(struct spi_device *spi)
 		.node = NULL,
 	};
 
-	db = devm_kzalloc(dev, sizeof(*db), GFP_KERNEL);
-	if (!db)
-		return -ENOMEM;
+	db = devm_drm_panel_alloc(dev, struct d53e6ea8966, panel,
+				  &d53e6ea8966_panel_funcs,
+				  DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(db))
+		return PTR_ERR(db);
 
 	spi_set_drvdata(spi, db);
 
@@ -425,9 +427,6 @@ static int d53e6ea8966_probe(struct spi_device *spi)
 	db->dsi_dev->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
-	drm_panel_init(&db->panel, dev, &d53e6ea8966_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	if (db->panel_info->backlight_register) {
 		ret = db->panel_info->backlight_register(db);
 		if (ret < 0)

-- 
2.48.1

