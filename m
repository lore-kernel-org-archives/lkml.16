Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEFF20DD43
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527133; cv=none; b=i/uyDnaghZEB0UJeNOZdO5uS97DzllZwR8rmA46FWWxUEwtAwVMbRPRRDNBQuBAWEupOrlNYc7Vwzn8FO5SPc6qR6qo1xX5lLato8fqYx0Bs3TgUdIqfX4u58Drf3X5pKpXbUxZuJ4fA7Cr9PJ5PMFRD/NlHKBx/8tt1V2nCigE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527133; c=relaxed/simple;
	bh=yq0bGbrSiZCFbtWlVTkUoz+8iM0rglTHAdjV541oArM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f9u4GTXWwKA+ztqqlGZ6KMMFoPBmf/ffdvAzz1oNeb5QS9JEBLbBd3bX80cQKWrAClH3ffSfnqIHwMk9ZZRntlCUfexOYukaWM+DR3fsH4hI+7I/JAqi74Lm1TGaY22v/A792C4OV6ZfgdlTJWjolpeu7lYhpvuovADF5QvkLyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FYdqWGMP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FYdqWGMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743527130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vj8xue6rKan/3jjaM+X4JsVo+LOpo2e3PWf82qPSnUQ=;
	b=FYdqWGMPYSiaU8aYRplmGlcgq4zjnzJKK8E49SMhbPFmliqHOPk/p3W9jx8ajgudmKdC5I
	QnWFK3LZV/HHbjZ8kDF3lndGZJb18e6LKjawPYFXvaiiv+BELaREjPIVL3QdoqkJkUO3g5
	i5XecsPUV9ORbWZHuAAGXK19PaJH5tU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47-RsG6G7S8NI2mi5jHCeaWQw-1; Tue,
 01 Apr 2025 13:05:24 -0400
X-MC-Unique: RsG6G7S8NI2mi5jHCeaWQw-1
X-Mimecast-MFC-AGG-ID: RsG6G7S8NI2mi5jHCeaWQw_1743527122
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BC11C1956059;
	Tue,  1 Apr 2025 17:05:21 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 19F94180B48C;
	Tue,  1 Apr 2025 17:05:18 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 01 Apr 2025 12:03:45 -0400
Subject: [PATCH 02/10] panel/arm-versatile: Use the refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-2-cdd7615e1f93@redhat.com>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=1347;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=yq0bGbrSiZCFbtWlVTkUoz+8iM0rglTHAdjV541oArM=;
 b=7mpFXmsVEV3d4nOazrxWX/L5QjJEUajBuxqSsbUeo8TZ6ty5CjGNZYJZixwruciwbb0Ta6O3P
 4mUsPEs2AAkCa6L46OnDgaxILEcY9S+Alzh8xKFlqUdqlOhk3r/FlSv
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-arm-versatile.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/gpu/drm/panel/panel-arm-versatile.c
index 503ecea72c5eac6614ecb280a0669d64c9d85b90..ea5119018df47832bd6b2a859c602484b8c66b33 100644
--- a/drivers/gpu/drm/panel/panel-arm-versatile.c
+++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
@@ -306,9 +306,11 @@ static int versatile_panel_probe(struct platform_device *pdev)
 		return PTR_ERR(map);
 	}
 
-	vpanel = devm_kzalloc(dev, sizeof(*vpanel), GFP_KERNEL);
-	if (!vpanel)
-		return -ENOMEM;
+	vpanel = devm_drm_panel_alloc(dev, struct versatile_panel, panel,
+				      &versatile_panel_drm_funcs,
+				      DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(vpanel))
+		return PTR_ERR(vpanel);
 
 	ret = regmap_read(map, SYS_CLCD, &val);
 	if (ret) {
@@ -348,9 +350,6 @@ static int versatile_panel_probe(struct platform_device *pdev)
 			dev_info(dev, "panel mounted on IB2 daughterboard\n");
 	}
 
-	drm_panel_init(&vpanel->panel, dev, &versatile_panel_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	drm_panel_add(&vpanel->panel);
 
 	return 0;

-- 
2.48.1

