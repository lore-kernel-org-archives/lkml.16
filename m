Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17D122DF8B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800616; cv=none; b=pA/er0TkLllBDssBVmZSy9T4aasUTw+FMOaeZY0ttV9HaVfbyZg3zfiLK1LjmWHEFrtRHFv1YQTZp5dV4+FrKVG0qnE9K+JyyiwW0LHRn3MqhEMlYbC+xL7sOOQdG5JCcLgdf0SEUgo+I0EL7vsBCp1pQ2ZeIVbF0mVISDZKMbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800616; c=relaxed/simple;
	bh=u1O3znWbVBZVdMAqLXwMfxcmXCDi7zGpPiAWCyUY+Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hMCbkaMjkTdP3zs6YC4R+coNh1pbCWHBxFj5Ub3rU99Vy0edhRgKTBdh/SxDDhWPPQ1K1uoC7wi6aJKAxj7S+5XQOxQeg20FUO+KTu2ewdJnjIfaOBmHDNCDlQnfy7rbNIQvM0UbpTSYkQwibK4Zg+/y7Ll0S8zdoLAo+0JW5fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aq3iTwmA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aq3iTwmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7VgE2mrVYLAT3BKVCMSXHujTwfSNLXLF0Ib4z+FfLiM=;
	b=aq3iTwmAI4veyMlJurP7Ok7Jjs7AF8xODJUAivLRdd0ut/2P2PdLe6Qy175vQxErpdevYP
	EX1F9cBWHN/BlaeZ0ysG/dHtqaNRszkXKgokbCiCSxK86IJHBVnmDtjpRDy05BuabCQxCH
	Nx6LOg3H1oy66CbHoFNbxDfH6o7Mh0c=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-hbdzi-G-O56gEu4OLV_tfA-1; Wed,
 21 May 2025 00:10:08 -0400
X-MC-Unique: hbdzi-G-O56gEu4OLV_tfA-1
X-Mimecast-MFC-AGG-ID: hbdzi-G-O56gEu4OLV_tfA_1747800606
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 146431800370;
	Wed, 21 May 2025 04:10:06 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 98C5F1956096;
	Wed, 21 May 2025 04:10:00 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:42 -0500
Subject: [PATCH v3 11/30] panel/innolux-ej030na: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-11-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1423;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=u1O3znWbVBZVdMAqLXwMfxcmXCDi7zGpPiAWCyUY+Ag=;
 b=7ZpHrX88V/YZjzW7vcLx/CKAfuwKMnaPPak+N1Kos5W2Zb5E14AGEhyj5ltDK1SzSgMFQcFKs
 o+CpLPvo+59BAOL9mHnzHiWo0euAkdKst8Xn0/2TdqbHjorcjmhKr1W
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
 drivers/gpu/drm/panel/panel-innolux-ej030na.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
index f85b7a4cbb4206bea7b5a019ba1de1dd05b13fe2..b2309900873b28f98707f79f4332763369a27d72 100644
--- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
+++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
@@ -204,9 +204,11 @@ static int ej030na_probe(struct spi_device *spi)
 	struct ej030na *priv;
 	int err;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	priv = devm_drm_panel_alloc(dev, struct ej030na, panel,
+				    &ej030na_funcs,
+				    DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
 	priv->spi = spi;
 	spi_set_drvdata(spi, priv);
@@ -231,9 +233,6 @@ static int ej030na_probe(struct spi_device *spi)
 		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
 				     "Failed to get reset GPIO\n");
 
-	drm_panel_init(&priv->panel, dev, &ej030na_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	err = drm_panel_of_backlight(&priv->panel);
 	if (err)
 		return err;

-- 
2.48.1

