Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03E019D8BE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611259; cv=none; b=BzxLL/vUsz1lJuHCKzDzCktgeXPQ3qSgKGawOCq3CdEWK2mjzXMUTk9dYMhbhNBzlY5Cofwufxc2p8h91k8/Xjs0AJqfXx9/tVcEWzk+FPXZnv8/rGifNsp98HwwxvK+E93lGYMNMXMwLbRuNlconFcWFdh82oidxZyIIAWvzJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611259; c=relaxed/simple;
	bh=usXViKv02eqspzENJO9Be1fV1s9csWvAjxEFuLZ2qiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0YXw8FNWLQM3BkafCTXzFOzyYcbdLqibxzmJU14cGnULi1iZLoRqToAckiGwOUUjJFCM5fLXs7IH6tUIbwoT4nrw9j3GGMe3KL+kqXPk6dh21ZlZl/M2cMfD44+MFzHQtjnMmi7iV6WHU3sk/IOLMI8PcJeI+GjuebRoSwhTaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T4vlZjNW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T4vlZjNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MP0mQPob/NaxglglYTtJLQMKwaDtnjjAZ+fqpD006Q0=;
	b=T4vlZjNWTtWAWl6zvvBCkBrXrzfPjTOLMyJS5MQzmVtD9bQGv/rZ6ztXaAjfFzDX12+Bt7
	LWZ/DGPL4PB8fumg3nYMHwY6wwmWL7A5roIN/uYXxLdDcMjLA+wA7LMShpEURuXKd2KuML
	cJdwQeP994+LlVljjsC64zMSVNaV6Lo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-tFDMFe4UNGiarUsIquna4A-1; Wed,
 02 Apr 2025 12:27:32 -0400
X-MC-Unique: tFDMFe4UNGiarUsIquna4A-1
X-Mimecast-MFC-AGG-ID: tFDMFe4UNGiarUsIquna4A_1743611250
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3FA82195608B;
	Wed,  2 Apr 2025 16:27:30 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3C5C6195609D;
	Wed,  2 Apr 2025 16:27:26 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:24:05 -0400
Subject: [PATCH 27/30] panel/novatek-nt36672e: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-27-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1422;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=usXViKv02eqspzENJO9Be1fV1s9csWvAjxEFuLZ2qiw=;
 b=FCV4GOz2buSHwrt+V3/pq+2CQj/12zJH5oLp9Hp3Fg5lvqC9gswRymotadhssWLtMDRNvS4NQ
 LV1EGiym2RJB7JwQABwagDavKKn9uHKT4OvxeAzJ0xKFWlOFF9njFpG
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
index 8c9e04207ba96db93d18a845a9240d2a22ec6b8f..c5e00eb55722e483a97e8af3a3594cdb9030dae8 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
@@ -522,9 +522,11 @@ static int nt36672e_panel_probe(struct mipi_dsi_device *dsi)
 	struct nt36672e_panel *ctx;
 	int i, ret = 0;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct nt36672e_panel, panel,
+				   &nt36672e_drm_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->desc = of_device_get_match_data(dev);
 	if (!ctx->desc) {
@@ -553,8 +555,6 @@ static int nt36672e_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->format = ctx->desc->format;
 	dsi->mode_flags = ctx->desc->mode_flags;
 
-	drm_panel_init(&ctx->panel, dev, &nt36672e_drm_funcs, DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");

-- 
2.48.1

