Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E377220E026
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527140; cv=none; b=PyC6PD20F6/dXVxEnt0/848idPseZ6KB+fZT5tiMvTIQRndGFJrYDn++B+MAIBuos/MtDlxQOzNAJ5CPyFHGmLEis3cz8g/Kp6SRyAtXyZXmNXaSMq7+D42yuNOupv1zRx5QOI++Djrr03B4a+18F5zHUz+7iVJ/F5jltSjXWmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527140; c=relaxed/simple;
	bh=c0wLE9NVru+MfKD0ti9z13jGljVE8zQ7g/rQltDrSPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DzZrTTrEKrcdrwesucVjw3b70cLeDJ/Lv//gWaG6Jvat+IlfgKIhSwpZiAaSqw0z+7OaX0DM95kpdMnHPpKYicEM+od4zy+D4tBphx8bld++ZaUMD7WMMvD+il+cDFzTxPMnGLwpU914rzYwvW6crVQFxOWzlrcLVc/mwQ8rPTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HSLsyh8X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HSLsyh8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743527137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBlWYqQZDg95twKY6/F4fFDg5FwcOXt+bMpy9kaQ1x4=;
	b=HSLsyh8Xc5QaUdvjC3ew6GS1tICCpZEL51mv6F8h09qjJP8nqxwr/Q38MOAd37NGtncy7u
	HhKrVCNc6jFf67i8M82ocFF8+afWIpUi/hpqT8JOCGae/1Al0IievukQ1h2IqV3CkY3R4+
	Xbg3BQwzo1fx/d+/TZ1jvBHSUXqcE2Y=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-Zlru7EbDMjacaN-kXZUHXQ-1; Tue,
 01 Apr 2025 13:05:32 -0400
X-MC-Unique: Zlru7EbDMjacaN-kXZUHXQ-1
X-Mimecast-MFC-AGG-ID: Zlru7EbDMjacaN-kXZUHXQ_1743527130
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A13B1955BC1;
	Tue,  1 Apr 2025 17:05:30 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1CB07180B487;
	Tue,  1 Apr 2025 17:05:27 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 01 Apr 2025 12:03:48 -0400
Subject: [PATCH 05/10] panel/bf060y8m-aj0: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-5-cdd7615e1f93@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=1420;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=c0wLE9NVru+MfKD0ti9z13jGljVE8zQ7g/rQltDrSPc=;
 b=pntShaSLkOzMndLmkH65yfLl8IXOs0PnQ65rFT0kLKACTlYhO47X8bhZiH01s5/GHcpsDbv5c
 ebmyPzJSMeFBT1xUNmcAwMSqnbuUQz/bnnb9tnVskXBQemQ3ZeAfbpA
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index 7e66db4a88bbed27920107458d01efd9cf4986df..5eb0727438cd73360f5360aba55f1eb1659fc7c6 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -350,9 +350,11 @@ static int boe_bf060y8m_aj0_probe(struct mipi_dsi_device *dsi)
 	struct boe_bf060y8m_aj0 *boe;
 	int ret;
 
-	boe = devm_kzalloc(dev, sizeof(*boe), GFP_KERNEL);
-	if (!boe)
-		return -ENOMEM;
+	boe = devm_drm_panel_alloc(dev, struct boe_bf060y8m_aj0, panel,
+				   &boe_bf060y8m_aj0_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(boe))
+		return PTR_ERR(boe);
 
 	ret = boe_bf060y8m_aj0_init_vregs(boe, dev);
 	if (ret)
@@ -374,9 +376,6 @@ static int boe_bf060y8m_aj0_probe(struct mipi_dsi_device *dsi)
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS |
 			  MIPI_DSI_MODE_LPM;
 
-	drm_panel_init(&boe->panel, dev, &boe_bf060y8m_aj0_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	boe->panel.prepare_prev_first = true;
 
 	boe->panel.backlight = boe_bf060y8m_aj0_create_backlight(dsi);

-- 
2.48.1

