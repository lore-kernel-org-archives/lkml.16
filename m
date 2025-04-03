Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1962512E9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693595; cv=none; b=r8vj7CN5CF4xBhH24tKAaL1SCYtwtwnW5UQyhnN4Cd1MTXxdsI/PZAG+gBt4TE/QzmpqFixq4Bv0HBGv64b9WVCdfu5eHKcPzV2W8KczkAn2uQkBBRWRkwcdFYZ1kyJfz55hBMf3rvq+/2iBTV1P2JdPHmBUIJQ6nkqFknXv4s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693595; c=relaxed/simple;
	bh=CI6+/C+dFVfIgDCRa6dvCuH83OJf30fDUtxsH6NTmr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u8cvSDq51yB4OhN2GXoWrCGhoyUfkHm+uIhMpjaLLR9DHcqOkT4n2ExpN5xvUW3p5XYIVgYuOFkMGx0KyCW0ThS6YjRmM5jyLDZlkwHFPJ/0P8l38EzZeM72Y4Fc1ttrR2s3YqizHG9fPY3gV/sdCa1lhwdd58fhPO/6FlmyYaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KOjxi7Oz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KOjxi7Oz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743693592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ek4h9uDJSVpc9hbBQVlBi4vFz4CGF+2MGB8IXp4OUhI=;
	b=KOjxi7Ozt5eeq98ax5gTL4oj23wqtP/n2dNl0RHT/8oQgGOEPOJVYYowmrOzzSFfUGd/cH
	OHxlabe1srW7cOlNWfgwz/NTS3sOdHVsNRZxCBRNO81D40M3h4i/WleOEsVK2tqU1V8ycU
	mGyECumsujQSUnCz0vJQA8m+t8RluW0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-369--KrK4rRgO5y4HJLAj5Ok3g-1; Thu,
 03 Apr 2025 11:19:45 -0400
X-MC-Unique: -KrK4rRgO5y4HJLAj5Ok3g-1
X-Mimecast-MFC-AGG-ID: -KrK4rRgO5y4HJLAj5Ok3g_1743693583
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 233F1195609E;
	Thu,  3 Apr 2025 15:19:43 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A5DA01801752;
	Thu,  3 Apr 2025 15:19:38 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:33 -0400
Subject: [PATCH v2 26/30] panel/novatek-nt36523: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-26-260c8a44c56b@redhat.com>
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1410;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=CI6+/C+dFVfIgDCRa6dvCuH83OJf30fDUtxsH6NTmr8=;
 b=wRNP7+7DMM9NwQ2vao22lc7BIh0ebj2p0PqjblmCBm8FFDwYgh/4iTFl9i91nGO39q/JCu6vU
 ltR+WicE2naCKIE4h67xoeUQ2KVWKt3Dh5C6RMk/93NTpPQRfvxWX4S
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
index 116d67bfa1140073cc537ec967b77195beeec051..32cf64c7c18be061fc3d38689529f039bf7cea55 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -1171,9 +1171,11 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
 	const struct mipi_dsi_device_info *info;
 	int i, ret;
 
-	pinfo = devm_kzalloc(dev, sizeof(*pinfo), GFP_KERNEL);
-	if (!pinfo)
-		return -ENOMEM;
+	pinfo = devm_drm_panel_alloc(dev, struct panel_info, panel,
+				     &nt36523_panel_funcs,
+				     DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(pinfo))
+		return PTR_ERR(pinfo);
 
 	pinfo->vddio = devm_regulator_get(dev, "vddio");
 	if (IS_ERR(pinfo->vddio))
@@ -1211,7 +1213,6 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
 
 	pinfo->dsi[0] = dsi;
 	mipi_dsi_set_drvdata(dsi, pinfo);
-	drm_panel_init(&pinfo->panel, dev, &nt36523_panel_funcs, DRM_MODE_CONNECTOR_DSI);
 
 	ret = of_drm_get_panel_orientation(dev->of_node, &pinfo->orientation);
 	if (ret < 0) {

-- 
2.48.1

