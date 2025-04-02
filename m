Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC7B1C84AF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611250; cv=none; b=f8omh7XmsY0Bc7/u1qaEKLDGXSWqOyT63OqciOnHUfkIlzIGCw7ZAD9uuh59IqM8EbDLV4gRIqnOQkBSFC9xv0Tc64eWUmSsxT4EikwQB2a7LHczZergyRfugZ9PA0gJRmbfY5UNXfLcxxeyhoJ3aHK2pzdeoskHic2akaQjhoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611250; c=relaxed/simple;
	bh=LwqSq4oKZvcHlRbJzaAP/suiJNWW5npADCQHzdnYEEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nFKAJQz8y304DwG6CpLq+2CdZ+AnclHlPjE5KLWfOAOmGPJoXzKz7hq8uYzTgd54e1Yj+DtP6EY8QOnSL43KOcSfAI5vI533LMDVIvLqIQEuc1qL+oT/S2YQ3xHlLS31RLzNVlzIE6Fokfzu9LhNTKZIe8/0g1+wltz+ouWwTNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=fail smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RH4qAyvQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RH4qAyvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMSY6BG+NT2RuPWqoFycvt4UrQtakGrNy8xvGs/972k=;
	b=RH4qAyvQldw7K52EgLjLmB/6eDxYpoWGcsTgVwR7UodEeV7VtV8luAcTUF9xG9YKSfYbyT
	dJdHND1Rnj3FWIjLNh8QX5nYnjiTMsj4jHmPqpq0SBfQIX7/07YTV5P9nGq4OUJ1kX9i+m
	XvUJMN7o/yQ6HYcXqdGpDR0mAwyNsv0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-DlLAs-z3MJCCf6mh596LeA-1; Wed,
 02 Apr 2025 12:27:24 -0400
X-MC-Unique: DlLAs-z3MJCCf6mh596LeA-1
X-Mimecast-MFC-AGG-ID: DlLAs-z3MJCCf6mh596LeA_1743611241
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B90BC19560AB;
	Wed,  2 Apr 2025 16:27:21 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C9C23192C7C3;
	Wed,  2 Apr 2025 16:27:17 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:24:03 -0400
Subject: [PATCH 25/30] panel/novatek-nt35950: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-25-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1338;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=LwqSq4oKZvcHlRbJzaAP/suiJNWW5npADCQHzdnYEEk=;
 b=ItJfZaUyksn3tOUWukVCcXh1jOEJKd+DY2OvfVKaHQT3LzLeVaIiLis58aituaKRL6GAGpK4B
 iIGubQe5npmAITwUAMkcIGsiY2ySPt19iCsexTb87vTmtBEMGUIgE+T
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35950.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
index 08b22b592ab0452973aa7373dd0692a9bf98e5f2..94aa6489d99fc88f1602c4dbbf4f7f78c04799a9 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -449,9 +449,10 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
 	const struct mipi_dsi_device_info *info;
 	int i, num_dsis = 1, ret;
 
-	nt = devm_kzalloc(dev, sizeof(*nt), GFP_KERNEL);
-	if (!nt)
-		return -ENOMEM;
+	nt = devm_drm_panel_alloc(dev, struct nt35950, panel, &nt35950_panel_funcs,
+				  DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(nt))
+		return PTR_ERR(nt);
 
 	ret = nt35950_sharp_init_vregs(nt, dev);
 	if (ret)
@@ -491,9 +492,6 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
 	nt->dsi[0] = dsi;
 	mipi_dsi_set_drvdata(dsi, nt);
 
-	drm_panel_init(&nt->panel, dev, &nt35950_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&nt->panel);
 	if (ret) {
 		if (num_dsis == 2)

-- 
2.48.1

