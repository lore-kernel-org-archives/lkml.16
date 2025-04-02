Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FAC19E97C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611205; cv=none; b=b9VqZUpDf/+tMZsS6fhWMzHwHFY7zp8WF3ZD2drBdDHPc3yhxeaXcBlORIypZC8dkeLwZiZLkFghecIXT5an7j64MRrPcy6JQV+N5hQwUN/WUhqwyav3gUil+O9Rf+6wTIS2fqQHHp104s0TmCU+VnHabsV2FkUUGYVlyF+fLLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611205; c=relaxed/simple;
	bh=MUubzhBIT/tBA0ZkFrrwe4LiNLnixIB2l5RiEsbEzyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vh3oOR/T8gEqm96Fz8sjM8tHXbECHVe467u26Iofhbvb4YuhvRYRbZStVpfXzns313CcPSScBRclFIPLBbkpc8PRCuODNMH3dNKWZwwCZSL/xm7AE8i+g6hmI8qMnu0rNefLF3e218WxFX27KC2cpKuR5+sjJ57HoErSpl3Axso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KK5SplDc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KK5SplDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zANFerpHyAu2ZHtog7iY2NUNxtSmaThhCiijywQ5+n8=;
	b=KK5SplDcDrfH/N+ElR8bvV9S9EcvGONmouJ0ltzcM40Zn0u+7QwRZrbS2LbIrOdl2IaM7k
	Rso/DIY2I0ziHqZ1J3TCemvFLfiA2Pzpcsxo1uFWNT+d57NEmRifcD4hnn+5PpIMUaV23x
	y9xihnowQpeIsD8vGLhR0rOfDf1m0Zc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-MiPz9hCoPtidFUobSqnkCQ-1; Wed,
 02 Apr 2025 12:26:36 -0400
X-MC-Unique: MiPz9hCoPtidFUobSqnkCQ-1
X-Mimecast-MFC-AGG-ID: MiPz9hCoPtidFUobSqnkCQ_1743611194
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D028A1954B33;
	Wed,  2 Apr 2025 16:26:33 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DD903195609D;
	Wed,  2 Apr 2025 16:26:29 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:52 -0400
Subject: [PATCH 14/30] panel/jdi-fhd-r63452: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-14-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1435;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=MUubzhBIT/tBA0ZkFrrwe4LiNLnixIB2l5RiEsbEzyA=;
 b=Hk8DOliFaUzrpfcJoyoJwnEdf+94I6/CQVoR7OO8jx44FhF1f+xLyh0ZauV/mmhsAuL4LVvwJ
 KtgoknZ9v8uCnNc5BQ0O1XPrIc9swQjtYtyOoPbW9ZZ37dNdklV7X/0
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
index 4eb71e85e9e9f2acaa2bdc23dae563f04da64f8c..cbe354b51bce35ec07b6f0758973fd5dffd92c42 100644
--- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
+++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
@@ -175,9 +175,11 @@ static int jdi_fhd_r63452_probe(struct mipi_dsi_device *dsi)
 	struct jdi_fhd_r63452 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct jdi_fhd_r63452, panel,
+				   &jdi_fhd_r63452_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ctx->reset_gpio))
@@ -192,8 +194,6 @@ static int jdi_fhd_r63452_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	drm_panel_init(&ctx->panel, dev, &jdi_fhd_r63452_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ret = drm_panel_of_backlight(&ctx->panel);

-- 
2.48.1

