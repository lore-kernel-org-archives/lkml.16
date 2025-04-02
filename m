Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7831EB199
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611243; cv=none; b=e6N3TLRp6J9zbQhn7sBDDh8CXHUByj2faaP/lMI5knqVxRvNSOO3S3T2AlGB2xMsd9wygdfS+TGsSE3f3SaqxIo6VdMR5bmEjT9QKhq5rNJjqP1GG+TFhKZ8lqjM195Dz5XrduDZ/WDTXjdKr1qT0A/rThR8yTYcB/ff6xhwv0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611243; c=relaxed/simple;
	bh=I7W1h7y85hF3oihzp+50kZ9MQE3NLWSf3yckSqcNmYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jNHE130F7gAOWKqnAQolSfplattw3gd0nKxLK+YPfDtcxIDWhokHqG+wgUknYIu+da7I2EJ3Ll79AQhI8y45bmiiFUwFZCbTKneDq7TwS6dgBns3xLOz51AwEtgxZ85yBa4FRtJDOtD4cVySsqONw+EHAMIE2QBJLAB6RwxYDfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jQyyaDzc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jQyyaDzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVqEqYlEksIxNQfBqzZj+eis5ZBLA1H2NQkSXSycgoo=;
	b=jQyyaDzcsXwJLfsYup2AOZ/BfIL1ykBQaJfFXr1pvr1TVoec5DuAJG8VAqu3BMXOgXtups
	fwmqeccthV8CvfQWzx9M7botv8oxyRMTCzcdXvfen946ZAHdmcmVgju/x0CyvEPelkDwFf
	M7tsl4EnCGdIZWhS6CJZEP0KsotORQE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-CIREWCmDP6G_xv5r-5Lb7A-1; Wed,
 02 Apr 2025 12:27:16 -0400
X-MC-Unique: CIREWCmDP6G_xv5r-5Lb7A-1
X-Mimecast-MFC-AGG-ID: CIREWCmDP6G_xv5r-5Lb7A_1743611233
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 27426195605E;
	Wed,  2 Apr 2025 16:27:13 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 10932191F245;
	Wed,  2 Apr 2025 16:27:08 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:24:01 -0400
Subject: [PATCH 23/30] panel/novatek-nt35510: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-23-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1368;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=I7W1h7y85hF3oihzp+50kZ9MQE3NLWSf3yckSqcNmYE=;
 b=67m0mbFT7Pqt5RCUUsx+HYtlwhX4egUNr5loKmkCGvx3Ens6umVxxC9e8A9i6yF6ZMy/HM8SY
 af59+8Fxd9rAxbTHUqaO1LqFeFFu62Z4W51ERFNa+onYNVsnGbeKmgp
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 549b86f2cc288741897992ce5cad6325f4289dba..3189d89c7ca00074314a6f4fec330a3e625c24f4 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -1087,9 +1087,12 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
 	struct nt35510 *nt;
 	int ret;
 
-	nt = devm_kzalloc(dev, sizeof(struct nt35510), GFP_KERNEL);
-	if (!nt)
-		return -ENOMEM;
+	nt = devm_drm_panel_alloc(dev, struct nt35510, panel,
+				  &nt35510_drm_funcs,
+				  DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(nt))
+		return PTR_ERR(nt);
+
 	mipi_dsi_set_drvdata(dsi, nt);
 	nt->dev = dev;
 
@@ -1142,9 +1145,6 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(nt->reset_gpio);
 	}
 
-	drm_panel_init(&nt->panel, dev, &nt35510_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	/*
 	 * First, try to locate an external backlight (such as on GPIO)
 	 * if this fails, assume we will want to use the internal backlight

-- 
2.48.1

