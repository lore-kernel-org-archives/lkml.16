Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C6520E334
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527147; cv=none; b=rsTq8CUxZbVSSUqVbyjixys/RLvUNBVIuZvrKwCTTea7YfLNtUfdSDzYisIYB5QRTzfa1MoYLP0UOWfQSUZAazlVzwvMV/FK2LCkHKwLhcbgnHR7Fl7NjmQzSd+aHtOHgIoasX+bztYbswDPFwSz2WvpGqJVMC6/ZCR4aryrrpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527147; c=relaxed/simple;
	bh=JoNfquM7qzkcKmUulZWWjNdY1sPbIefQYKUNSp2RtSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cvu7s9uOuOPwSfDoY3NlS+1Hx/GEU4WnHz8bNv+zQw0CYTMWspqItwobTTjLJv+haCiroFEqdVCQu5MoLIUxZL7FN7tNC+InYUcb0YpsUkrbU5aD2Lf1oyw4DqIo1NSFSkpGacqMSikzOftIeOBPR9Py24kDhZ7I0zEdfpfpPYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q9uY1j81; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q9uY1j81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743527144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mUKnnvYyn+coNsWluPrWHQ14aAy143VL7GAIbKLN55A=;
	b=Q9uY1j81YA27d1r9IDBuHiIyGFK86yqTf7NVAXuwubJINaO4ihgkgIXj/GeCYESKBRFaaJ
	kKtfbC4rMUT36AiocpptjGhK08A8zK3ukvF5mm0byM+RyQM4vc4R6RtgIlKskv2FryfS2P
	4584qwVz25IDH13kvGnnY3mgZ0R454o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-zeVlDFwvPRO3PBoKRrEoig-1; Tue,
 01 Apr 2025 13:05:41 -0400
X-MC-Unique: zeVlDFwvPRO3PBoKRrEoig-1
X-Mimecast-MFC-AGG-ID: zeVlDFwvPRO3PBoKRrEoig_1743527139
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 469951954B38;
	Tue,  1 Apr 2025 17:05:39 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B9F00180B487;
	Tue,  1 Apr 2025 17:05:36 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 01 Apr 2025 12:03:51 -0400
Subject: [PATCH 08/10] panel/dsi-cm: Use refcounted allocation in place of
 devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-8-cdd7615e1f93@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=1282;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=JoNfquM7qzkcKmUulZWWjNdY1sPbIefQYKUNSp2RtSI=;
 b=eDIYj8leCHW/fg3jtbOZ/on02VaQERqAbuIJUsXuldSHijRYqFT/G+yL8eUUuTKmp35iBgVwt
 KCxYj5Ds+ffAhr2Zqg+6xvDRa6DXMP/20hSQycRVyfWiO5tbNLHwDGD
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index 6b3f4d664d2ade668525660394cf81924436492e..ae6e9ffc46cb49ddb53981815ad248953bb37fbb 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -511,9 +511,10 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 
 	dev_dbg(dev, "probe\n");
 
-	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
-	if (!ddata)
-		return -ENOMEM;
+	ddata = devm_drm_panel_alloc(dev, struct panel_drv_data, panel,
+				     &dsicm_panel_funcs, DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ddata))
+		return PTR_ERR(ddata);
 
 	mipi_dsi_set_drvdata(dsi, ddata);
 	ddata->dsi = dsi;
@@ -530,9 +531,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 
 	dsicm_hw_reset(ddata);
 
-	drm_panel_init(&ddata->panel, dev, &dsicm_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	if (ddata->use_dsi_backlight) {
 		struct backlight_properties props = { 0 };
 		props.max_brightness = 255;

-- 
2.48.1

