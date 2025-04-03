Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D8C1EF099
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715503; cv=none; b=lswKWjaK5nxFJFykneWlo+KSJEFq89nSY+/+XeLgcL9VLkIeTOz5pJf6wio1KktcxLgwjl0ivRsXs3/AWcZrO576AO+3b33II1ht6zpHuYr8n39F5Zh7OUsOOhFbVZSPBpk/hppgtp34t6rwvyPAmZCR2pDoSj3a1gFhCFCNVm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715503; c=relaxed/simple;
	bh=we7WIILzP13TABD42LxlpZDuiK2HLYkuV/eQ3Cmxz4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QVJAqyuDADLa3m77wNhAgSNOyuPDrl9rqKfwPLD88Ul6Hy4xuJMUQ0QXBDefl3Vsv33VZDPWOJPL6C+q90KMSNI/WfZjUrtWt7/ahQHclDkKk+AdslaNuRkUGTW7JUmVxpbOhCA6cUZv1osst75n3eSCfwikNm5FpI6G0jzTstw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F5FmtNDs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F5FmtNDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=drlsI5L3xVmbCXwppXJkHRjFdM65s2HLCChudDIvaj8=;
	b=F5FmtNDsKNdW/z5sKuNjni2zU59YkGARd95PkovGLmnB8UbNX2lqZFMrPVbgjfJGzEQMtG
	reR2GAhJQ7pNeDavEvvpy49lo1AmfnZvo+Zo/Ropke2VhhvBRGop88LLw+T/nQZBh42Iuo
	gH7oWEsCFOaob1ysdAndkLsaBfaI5xQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-262-np46ggtuO5OYuGOmsEPSgQ-1; Thu,
 03 Apr 2025 17:24:58 -0400
X-MC-Unique: np46ggtuO5OYuGOmsEPSgQ-1
X-Mimecast-MFC-AGG-ID: np46ggtuO5OYuGOmsEPSgQ_1743715495
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C13D1809CA3;
	Thu,  3 Apr 2025 21:24:55 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DC410180B488;
	Thu,  3 Apr 2025 21:24:50 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:21:04 -0400
Subject: [PATCH 33/46] panel/synaptics-r63353: allocation in place of
 devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-33-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1399;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=we7WIILzP13TABD42LxlpZDuiK2HLYkuV/eQ3Cmxz4U=;
 b=QIEcWid9aggb+w/7slRZj9gTaJ5SCAGBAFFVXvEtM5WWX8DsSIXgrG4A+skxKvxHL8qECNKTp
 iqAqwlo24M5D7JgO4kl+U5dFz0SYoBMKL084YnWIEuPH/ijm31EJxS+
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-synaptics-r63353.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
index b148e6cba9bd1184a8c3e9e264e31536ad78ce28..3a74d48753d9c55d4b5618fbc1167f28bc5f6c5e 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
@@ -229,9 +229,11 @@ static int r63353_panel_probe(struct mipi_dsi_device *dsi)
 	struct device *dev = &dsi->dev;
 	struct r63353_panel *panel;
 
-	panel = devm_kzalloc(&dsi->dev, sizeof(*panel), GFP_KERNEL);
-	if (!panel)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct r63353_panel, base,
+				     &r63353_panel_funcs,
+				     DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	mipi_dsi_set_drvdata(dsi, panel);
 	panel->dsi = dsi;
@@ -258,9 +260,6 @@ static int r63353_panel_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(panel->reset_gpio);
 	}
 
-	drm_panel_init(&panel->base, dev, &r63353_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	panel->base.prepare_prev_first = true;
 	ret = drm_panel_of_backlight(&panel->base);
 	if (ret)

-- 
2.48.1

