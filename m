Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832DB230BC5
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800705; cv=none; b=rtdahwejpkCAt06W1S4ALSsSSgbca7amaUvPnswleCDvOTLCtJhn0dKa+/DJFmOcAGOkUnkACYREl3Vc3blZgZ8ecxQc3lQLGknr3fXChZdZjLJEXCtxpwIUb6wSjpK+VO7nmg9nk5JNnEuu6Lk203WEHy5xgFDU8fto1e5kj0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800705; c=relaxed/simple;
	bh=YzQjtEvN9ymir8VFYHgoEq2vF7epV11oXmwsE3JCyQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5kX2jpnxkyW0Kffw54T+bbD5BVztOM6fSu1BmAwaJ/Kj/GUmktkMiHXlErns6woZpbGr52j+L3o+W+Pe0jlBzq8MTB6EuV9YtV5BjtpuwO3lqf0B20/AHt7Iy9QNyuN6AdpOCYD5u65y0AOmujVkpE63ABiEsBfL5HqanWtKpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sz3j97t6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sz3j97t6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oL7SlnkhsPmebPVGgeh23UyvU970ZL+30m1yQoHzkFA=;
	b=Sz3j97t6o5j6Cg5BfuBR3sc8fX/88IBen1Nz4LYZfXbNqnJK1qu4ovA4JDsdRlaANV8UiU
	8qnf6msfSnaxNklDpt5PoB0gIekUwTux3+9riiQ7wfr2BaQswo2mT5Zsta5mpcA5g9otGh
	+gK8ajMOvI9ONG6sDkqNVQdtxnrQrDM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-KeeQW65nNDaadjQDPIB70Q-1; Wed,
 21 May 2025 00:11:38 -0400
X-MC-Unique: KeeQW65nNDaadjQDPIB70Q-1
X-Mimecast-MFC-AGG-ID: KeeQW65nNDaadjQDPIB70Q_1747800696
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 040E3180036E;
	Wed, 21 May 2025 04:11:36 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9D41B195608F;
	Wed, 21 May 2025 04:11:30 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:57 -0500
Subject: [PATCH v3 26/30] panel/novatek-nt36523: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-26-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1478;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=YzQjtEvN9ymir8VFYHgoEq2vF7epV11oXmwsE3JCyQA=;
 b=n/1hxpIRYthTBLFzhjVtZepQyMt5MJk0DHrubLivKZTQCR2g51lxLIEYAAw8sOe3NOswBCniL
 pdnhA6ljlh8D51a8X/XSen/F7sr7toRuY/xeFLes6sBlOQuBXVn3Qtw
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

