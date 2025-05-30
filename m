Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E401DE881
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573457; cv=none; b=CNzIrE82CgPvnLOInth92FxEaEznvO4Fbbc5JamGMhVbOB4d3gb7T/TgO+ovcUA3iNctzx94/LZ9AYlEuk2clP71t81krzTI5uAB4A+oaW5rFdkpv29akuICw1J6SY9DfVPgjS0dDbopbvaLoVE19QheT3rUuKFtF2cEJY5o3sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573457; c=relaxed/simple;
	bh=yHc2jtKs8bmVqt/0ehd+VoQUXIdqsYEXb/zHQfrpfn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFgkr0/RIhTVsmmNWV7041t21shdagloHdOloF8HJ5gAE/aWlRpzOkAkM6/LPOguA7p4r9UB+gYKGeAhYy8o2HTf1+MuVdE/LtWDAZO3MUlkQxyAXCRH6xNhdc7XuSxbAsQo2h+P3OjbfBMoLzQqt15CZi74L3B0AiKW3UiMxg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eg14hd4o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eg14hd4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DUtoG8C1NKSzIHhR8Z/03iU1YNJNSD47MIfqiE5akS4=;
	b=eg14hd4oq8w89PnEUk6GFcV12xhbnkix9ordXlPxPMHxCOf7YYuEtdEn21MK1lb6NTmGCk
	WKRuXOOX2AKnwUFVk0JBd0NA5xp4cJguhBx8+MK0vx7OgAT0J1RIt1T0nU4WO6wPfCaJG8
	Ukqqjuc24/rcvIWnnh4TBpI0mtRxhaw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-325-oTwVc3EwNSipWZPsGdfv4A-1; Thu,
 29 May 2025 22:50:50 -0400
X-MC-Unique: oTwVc3EwNSipWZPsGdfv4A-1
X-Mimecast-MFC-AGG-ID: oTwVc3EwNSipWZPsGdfv4A_1748573447
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F05F195608B;
	Fri, 30 May 2025 02:50:47 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CC1F41955D82;
	Fri, 30 May 2025 02:50:42 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:13 -0500
Subject: [PATCH v2 11/46] panel/samsung-db7430: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-11-5d75a3711e40@redhat.com>
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1379;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=yHc2jtKs8bmVqt/0ehd+VoQUXIdqsYEXb/zHQfrpfn8=;
 b=PPX8YTy0hr1+TcztO+vpVAG5WWY9Q+IEMLSo5p03vPvq7gXvktI/4mcF2qr7yq5mzAl4qkZ+g
 DWcebegqag1Ccps84aBgJMGCX9wlvAbafCilOvmw0G0K6HgrSCft9Ah
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/panel/panel-samsung-db7430.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-db7430.c b/drivers/gpu/drm/panel/panel-samsung-db7430.c
index 14c6700e37b30a58e7081423c18bff8db7896c5b..a97182f3c9907ad33ab6e7717129029e3bc4cd8b 100644
--- a/drivers/gpu/drm/panel/panel-samsung-db7430.c
+++ b/drivers/gpu/drm/panel/panel-samsung-db7430.c
@@ -267,9 +267,11 @@ static int db7430_probe(struct spi_device *spi)
 	struct db7430 *db;
 	int ret;
 
-	db = devm_kzalloc(dev, sizeof(*db), GFP_KERNEL);
-	if (!db)
-		return -ENOMEM;
+	db = devm_drm_panel_alloc(dev, struct db7430, panel, &db7430_drm_funcs,
+				  DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(db))
+		return PTR_ERR(db);
+
 	db->dev = dev;
 
 	/*
@@ -294,9 +296,6 @@ static int db7430_probe(struct spi_device *spi)
 	if (ret)
 		return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
 
-	drm_panel_init(&db->panel, dev, &db7430_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	/* FIXME: if no external backlight, use internal backlight */
 	ret = drm_panel_of_backlight(&db->panel);
 	if (ret)

-- 
2.48.1

