Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC121E7C0A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611223; cv=none; b=kGJ75TaB4SvlvljQSkKch5e5abAJ7znsXnRS/AyjOm3A9bEK/XJ9JRtEItjqlUl25SJfWcccgRMdZTahNkVwGZe+EqXIiRluWYaECIDFqoWQ6D1rYZnqjQLT4dr3PukeHQMnOT8oiajr/BAX0TVblVSoqvo38acJ13ISEMADt3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611223; c=relaxed/simple;
	bh=Dc8uKXlqTDknhwrvVeBmpqtls+s5KcMmvtGSnNVdukg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3PnPOfu6SFF8Iha9IXdXwIAO4/8tcoQ85PZsxrXssia7pORV4xsrTGlv20t/JUlRnY2KovfM9ybi4KQtLJ90vV2cpVunxG3f80xYNdmavXMflwzpOdwly/FGj5nZQz8AqbsiMXy/COHApI/tCuRJzuGypz048zBf422ALExQA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BeQ4Yq+y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BeQ4Yq+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PF3326fVU7EkcW3hdKGVCgStfM4AKl0CPV6LOBOueVY=;
	b=BeQ4Yq+yuoW4UPC9XYGKN2fJb9aK4pJLNThCBwiTAgju8nyCp4/GykwSk28OVbzovGVxfX
	3PfiAuykxh6cNrxYAdmwaCMWRTrC52In+bLrUnnFus98bVMm/kJY29nXKSdsjbAY20T90N
	+nXCSHHWJHgMr5k/2fKHH+pMrHwMUFE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-o1h0161CNnO7F6tlJ6PPkA-1; Wed,
 02 Apr 2025 12:26:58 -0400
X-MC-Unique: o1h0161CNnO7F6tlJ6PPkA-1
X-Mimecast-MFC-AGG-ID: o1h0161CNnO7F6tlJ6PPkA_1743611215
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B914B180034D;
	Wed,  2 Apr 2025 16:26:55 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B241B195609D;
	Wed,  2 Apr 2025 16:26:51 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:57 -0400
Subject: [PATCH 19/30] panel/magnachip-d53e6ea8966: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-19-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1421;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Dc8uKXlqTDknhwrvVeBmpqtls+s5KcMmvtGSnNVdukg=;
 b=5dtBANBxn6IdGQaEVw0WdHGM8TCjfStG01MD+kqCQI/IpGBIaSCdtgarS1pw/y80QsNEEnJ6U
 HggUToInNvjD40qSwWXSImkjBv3zDBK5LPMEakNPL8pkYKFQDVMWfft
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
index 799c2161fc85b24e1fb236fd63b397bf66fc15c8..ee225286ce6df0ce48cf7a2c60d600332d02ed86 100644
--- a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
+++ b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
@@ -370,9 +370,11 @@ static int d53e6ea8966_probe(struct spi_device *spi)
 		.node = NULL,
 	};
 
-	db = devm_kzalloc(dev, sizeof(*db), GFP_KERNEL);
-	if (!db)
-		return -ENOMEM;
+	db = devm_drm_panel_alloc(dev, struct ili9881c, panel,
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

