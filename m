Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7557385931
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715455; cv=none; b=qrt2y1hXrCKbmUpKecpyb1XXHAtdcomfPTn2QdxgrIc8JzeLSx50fD+VGIBTdboN3tSQkCEXMWJNUEPfVbV/HaoggvzHZgB0612WP2zzioqgIsAX8rLqPsJdzWqUX73Bn3RGa+uv+09JmiIrhIyXx+5C2++/2rnbBk6n4iA85Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715455; c=relaxed/simple;
	bh=411veOxWng/a2qCtISDwlEtJD6Ojfcrgm/1lg6ccYDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFyVEhtVqY2t4YkQE8DHdNKKEbgyJ41YncxJeDj1OuceFlB83H6hpAj5HqaFkJRiXXOqeG7gBv3UczIhXIMekafCnP8yUKnPkV7Yke0o7LuiBZQzZEFMW6VZe3e00f3J+FJCqQamP2fbB+1ddnfWCYaLISuxQ3ERK8TA3p4Zlh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cvRz77tg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cvRz77tg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/42GHsH37kyWmiCxdS93WUFYeCDl5bxZvtdQ5sXIZxw=;
	b=cvRz77tgG7lON3dx81yNS0mdU6PT34VqrLlqjJ5/0eJsXZW8egOHPwfPCDRuIHCePzHn8K
	EK1DUdRXOR9JBvBbBpAv3bEqH2xlXLwKL3GZXTJzb3332sd2Hu5FAgPDQmjeqvhsiuUuDZ
	9P90y3MAjNpZ/NtFnToMc9ASC46k4tY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-494-fmAhTg5kOquE2NOCHxJH3Q-1; Thu,
 03 Apr 2025 17:24:05 -0400
X-MC-Unique: fmAhTg5kOquE2NOCHxJH3Q-1
X-Mimecast-MFC-AGG-ID: fmAhTg5kOquE2NOCHxJH3Q_1743715440
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DA7321956089;
	Thu,  3 Apr 2025 21:23:59 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 95A36180B488;
	Thu,  3 Apr 2025 21:23:55 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:53 -0400
Subject: [PATCH 22/46] panel/samsung-sofef00: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-22-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1423;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=411veOxWng/a2qCtISDwlEtJD6Ojfcrgm/1lg6ccYDs=;
 b=BBg0fSgIBKV9x3Zq35AHSIlNNQVmYXZtAXh2JlPglNM3EiyV69/esw6REsKiRle/+tzurTj9I
 z3cy88K+JesDRfQ2jebAD+0bA7xKgEPf4TzOnUNWFgDSfCfNhIShts2
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 04ce925b3d9dbd91841f4b4e4a12320eac8e03af..17dff5aa360cc4b9c25d63e3736ae1f6cd5326da 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -235,9 +235,11 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
 	struct sofef00_panel *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct sofef00_panel, panel,
+				   &sofef00_panel_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->mode = of_device_get_match_data(dev);
 
@@ -262,9 +264,6 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 
-	drm_panel_init(&ctx->panel, dev, &sofef00_panel_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ctx->panel.backlight = sofef00_create_backlight(dsi);
 	if (IS_ERR(ctx->panel.backlight))
 		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),

-- 
2.48.1

