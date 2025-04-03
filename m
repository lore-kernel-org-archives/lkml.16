Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD95620013E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715560; cv=none; b=llC85C9stHNe+WJ/bSUlj4b5+1rplQThIPW1SIsqCy3Gom+7I2MBVrQYA2qPhWe15hSyCeGusL/3mts+Xmgy9fAeiTdCHdOuPsocMeY1SsfC0UZcW0f3xambM2yhqIN95AaG+Xf4H2KAwiMoDf3yU433yHC7QcSRf2ipYBn4mu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715560; c=relaxed/simple;
	bh=RwAD8zHoXh9imZAn0XpyAjhqKL5F3ms/GsD2bDW/UBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjheUdjiEeazdPnGC/pawqd7vUvIySZUNVW2mDbU83LWZi+iazgF8P7J29YRwAI3o3qGe7uevrA5X8BWsBYdPumaiTg0NdhcWWGASSLGZ8wmREQiBWKu24dfUTZcSu5PgiWOom8PIkM7ZWkxk0DurKRJKUyMoksBuj8x4CiTgeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VYSauRbS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VYSauRbS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ZefKouxdk2s2Ql6IByovuwIIKwtbooPP2gBa2Hj9jU=;
	b=VYSauRbSXewR1lHaBQBNe7Du0Gynu5IsVzBwdkZSv2fycCFnQE8oBBO+wThqZ7oGBe0nCP
	0esq5utdjjU6/vnoSpYVF73wylPzKjIbNBarIhTRs7eZ7x1w2JKALVn1MA6bGi3rRjjNtU
	/7Sq0McV9j5WOndvn6UcEpSXaTkVeh8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-rE8bwvX_NNG36MZnvfJCbA-1; Thu,
 03 Apr 2025 17:25:53 -0400
X-MC-Unique: rE8bwvX_NNG36MZnvfJCbA-1
X-Mimecast-MFC-AGG-ID: rE8bwvX_NNG36MZnvfJCbA_1743715550
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AD085180AB16;
	Thu,  3 Apr 2025 21:25:50 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 67496180A803;
	Thu,  3 Apr 2025 21:25:46 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:21:16 -0400
Subject: [PATCH 45/46] panel/panel-lvds: Use refcounted allocation in place
 of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-45-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1268;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=RwAD8zHoXh9imZAn0XpyAjhqKL5F3ms/GsD2bDW/UBs=;
 b=Cb+/GlG9jXKEcnvoMxboMijoXXfoIwm4Lyvy+S37K/BL2VKcFcJvj8VOChDr3+NaMOoaapqSW
 tCchboCYuV2DteCGY4kdmN212loyk2iZJczGpG7Lxcb1dU1NpG9wi90
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-lvds.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index ba6c015aabba9e03a37058e0fcf7cb39d1595d70..23fd535d8f479045a87b0f51bec17cd7c66b0f75 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -164,9 +164,11 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	struct panel_lvds *lvds;
 	int ret;
 
-	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
-	if (!lvds)
-		return -ENOMEM;
+	lvds = devm_drm_panel_alloc(&pdev->dev, struct panel_lvds, panel,
+				    &panel_lvds_funcs,
+				    DRM_MODE_CONNECTOR_LVDS);
+	if (IS_ERR(lvds))
+		return PTR_ERR(lvds);
 
 	lvds->dev = &pdev->dev;
 
@@ -214,10 +216,6 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	 * driver.
 	 */
 
-	/* Register the panel. */
-	drm_panel_init(&lvds->panel, lvds->dev, &panel_lvds_funcs,
-		       DRM_MODE_CONNECTOR_LVDS);
-
 	ret = drm_panel_of_backlight(&lvds->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

