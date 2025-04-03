Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070B8250C11
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693608; cv=none; b=gO+5LoTyHSUsXdqs14LO64O/Cz2xa8HIctmqG/V7mX2OHhcTHNZke0BT29rNh+rQoJSY7gGoNc0sZ/VLhwxxfx9I8L9w+bZXh4MEfVP7xwJ5rDjnefiycU2BnQ4mL66WWuhmDXtaKWeuEUwiPJc36dZTzpLrYk1CgFVGr6nPOFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693608; c=relaxed/simple;
	bh=dc4ADur/iGxs521dinh90Qf18wUTyTr31AqH8r04SRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dwsSx0l8XteHq0ex+yjQp+tfkMKepkqNc+PY/ft/LZbQUspZygT9wtldUtP+ePCVo+t7HzbuPY+VM2dhFUnZNw1iywmyCl7vSsNXZou0WE64YpUtywt6AnmRBdp193fqrI1LDLnIOD9049KjOgC2+6EvK5DfaBouHheKdvOkFJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eaOcR6qN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eaOcR6qN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743693605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vu+ek39dG3x+6PZag125KlblM0ED4MDopscs4bl/qRg=;
	b=eaOcR6qN1G9QhFdEaVq3emZn3aKaYSbHgg1gtuJOSFAmV33+gWtqFEbpiSkhsRMwyRLiL6
	BFJxDeFmgAkOgSelKM5cLfW7RLYAKm+hcvpzz8moR5N9wKTiXu9OU4gdCSBilSqunEl2fo
	JKOLH1nW2BSLM1mMbEhtrEWI0BUC8uI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-tzuXb2FKO5CnBf8dCflUWg-1; Thu,
 03 Apr 2025 11:19:59 -0400
X-MC-Unique: tzuXb2FKO5CnBf8dCflUWg-1
X-Mimecast-MFC-AGG-ID: tzuXb2FKO5CnBf8dCflUWg_1743693596
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D32A519560B6;
	Thu,  3 Apr 2025 15:19:55 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EBC751801A6D;
	Thu,  3 Apr 2025 15:19:51 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:36 -0400
Subject: [PATCH v2 29/30] panel/lcd-olinuxino: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-29-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1408;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=dc4ADur/iGxs521dinh90Qf18wUTyTr31AqH8r04SRU=;
 b=y37rz5loOTzGCM7cSOp/uLeMsuomvi9Emnkvenj2DMnY5Qt8rFqi15Arm44uRRbTafFpl4z+Q
 nq3F1td95AzCxZd/bBe2gijIsNeOyogKZl+LfJeFlabJShCNAsc8lVW
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index 94ae8c8270b8fbdf47009dac6232ddf6885c2369..66f99982f360fe4445b0c0cbc1e57c4db4be5eda 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -175,9 +175,11 @@ static int lcd_olinuxino_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
 		return -ENODEV;
 
-	lcd = devm_kzalloc(dev, sizeof(*lcd), GFP_KERNEL);
-	if (!lcd)
-		return -ENOMEM;
+	lcd = devm_drm_panel_alloc(dev, struct lcd_olinuxino, panel,
+				   &lcd_olinuxino_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(lcd))
+		return PTR_ERR(lcd);
 
 	i2c_set_clientdata(client, lcd);
 	lcd->dev = dev;
@@ -234,9 +236,6 @@ static int lcd_olinuxino_probe(struct i2c_client *client)
 	if (IS_ERR(lcd->enable_gpio))
 		return PTR_ERR(lcd->enable_gpio);
 
-	drm_panel_init(&lcd->panel, dev, &lcd_olinuxino_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	ret = drm_panel_of_backlight(&lcd->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

