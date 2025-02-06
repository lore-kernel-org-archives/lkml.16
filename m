Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0951DEFEC
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876003; cv=none; b=OioUn4omhgfchj6CPfVhJX94vWayA4YFyu+aX+KfqMADuEcdMqFZWTbkQ8SCfSExthpTvL571whlT7XjmhgrAi3CR6fvXNq95c4XJ34AJu2Z47CM7t+s+VrkN5zQQL56Cm5rH72Xz0vIYXGzQ15IK3gGInQQ4noZMQRbOEQE2Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876003; c=relaxed/simple;
	bh=U89i+DA88VcxSD1PykNrx22CaQnRllVlhhQni/zEhYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ckJodRpHsop67VBpA3AQ7WTvo8j2kvV9tj5ynFBjzO5lxVYr4cgocyLCtppfAC3ltTVdYEQp0O2sUwS4PkTlLrGQXTzwezoloe/8yDuSMQhG6VYE1qa+PnQYA+eH4qbsU3bYQPgKDBIJ/EfMt8wp5h8yVDRgDLXfnF4oQon0lmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hPVbscJg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hPVbscJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738876000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/UhG9vle5FlwgqCrHh16UYubGe5efDjOrrlvsHsEq8=;
	b=hPVbscJgkm0B3B949i2QzZrFaB3nPywsO3OlfKezmwsuwGBMhSY592G91c+zsFZ8Qx1pRt
	/UkeLyxJ3wiwpM1pysDQyKQzIPCcZjZxrzFEi890+laQY7y4qixagl3QIs696doSrDopxt
	tbKqZh6oGAbhrYh3K3MQzNaJRRyRSGY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-F_XVZp4ENem0mdFPQHBsJw-1; Thu,
 06 Feb 2025 16:06:35 -0500
X-MC-Unique: F_XVZp4ENem0mdFPQHBsJw-1
X-Mimecast-MFC-AGG-ID: F_XVZp4ENem0mdFPQHBsJw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BC04A19560B5;
	Thu,  6 Feb 2025 21:06:33 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A0CBE1800115;
	Thu,  6 Feb 2025 21:06:30 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 06 Feb 2025 16:06:00 -0500
Subject: [PATCH 05/14] drm/panel/samsung-s6d7aa0: Move to using
 mipi_dsi_dcs_write_seq_multi()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-mipi-cocci-v1-5-4ff0c69e8897@redhat.com>
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
In-Reply-To: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=7376;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=U89i+DA88VcxSD1PykNrx22CaQnRllVlhhQni/zEhYk=;
 b=hs1fFQ2uWtD5bsImBN+zNhuVQxO27AqFGXhfh012E9QcnTd+2P8fA9/HN3y5imgmqSMqx7hyK
 mi99ZVavQEkAC0E43wpQ9w+lN3+d+3RcEKjH7l4KPPXQa11/wKW67LA
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Use mipi_dsi_dcs_write_seq_multi() instead of
mipi_dsi_dcs_write_seq()

Used Coccinelle to do this change. SmPl patch:
@rule_1@
identifier dsi_var;
expression dsi_device;
expression list es;
@@
struct mipi_dsi_device *dsi_var = dsi_device;
+struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
<+...
-mipi_dsi_dcs_write_seq(dsi_var,es);
+mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
...+>

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 88 ++++++++++++++++-----------
 1 file changed, 52 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index f23d8832a1ad055483b1f513557cb3d2807e3692..b7cc98163db601a3c4c30c39818eb036f825001c 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -65,17 +65,24 @@ static void s6d7aa0_reset(struct s6d7aa0 *ctx)
 static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	if (lock) {
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0xa5, 0xa5);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD1, 0xa5,
+					     0xa5);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD2, 0xa5,
+					     0xa5);
 		if (ctx->desc->use_passwd3)
-			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0x5a, 0x5a);
+			mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD3,
+						     0x5a, 0x5a);
 	} else {
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0x5a, 0x5a);
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0x5a, 0x5a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD1, 0x5a,
+					     0x5a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD2, 0x5a,
+					     0x5a);
 		if (ctx->desc->use_passwd3)
-			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
+			mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD3,
+						     0xa5, 0xa5);
 	}
 
 	return 0;
@@ -231,6 +238,7 @@ s6d7aa0_create_backlight(struct mipi_dsi_device *dsi)
 static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &dsi->dev;
 	int ret;
 
@@ -242,18 +250,19 @@ static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
 		return ret;
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, MCS_OTP_RELOAD, 0x00, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_OTP_RELOAD, 0x00, 0x10);
 	usleep_range(1000, 1500);
 
 	/* SEQ_B6_PARAM_8_R01 */
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x10);
 
 	/* BL_CTL_ON */
-	mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0x40, 0x00, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_BL_CTL, 0x40, 0x00, 0x28);
 
 	usleep_range(5000, 6000);
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE,
+				     0x04);
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {
@@ -262,7 +271,8 @@ static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
 	}
 
 	msleep(120);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE,
+				     0x00);
 
 	ret = s6d7aa0_lock(ctx, true);
 	if (ret < 0) {
@@ -282,9 +292,10 @@ static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
 static int s6d7aa0_lsl080al02_off(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	/* BL_CTL_OFF */
-	mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0x40, 0x00, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_BL_CTL, 0x40, 0x00, 0x20);
 
 	return 0;
 }
@@ -320,6 +331,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
 static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &dsi->dev;
 	int ret;
 
@@ -332,35 +344,38 @@ static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
 	}
 
 	if (ctx->desc->panel_type == S6D7AA0_PANEL_LSL080AL03) {
-		mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0xc7, 0x00, 0x29);
-		mipi_dsi_dcs_write_seq(dsi, 0xbc, 0x01, 0x4e, 0xa0);
-		mipi_dsi_dcs_write_seq(dsi, 0xfd, 0x16, 0x10, 0x11, 0x23,
-				       0x09);
-		mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x00, 0x02, 0x03, 0x21,
-				       0x80, 0x78);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_BL_CTL, 0xc7, 0x00,
+					     0x29);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc, 0x01, 0x4e, 0xa0);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x16, 0x10, 0x11,
+					     0x23, 0x09);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00, 0x02, 0x03,
+					     0x21, 0x80, 0x78);
 	} else if (ctx->desc->panel_type == S6D7AA0_PANEL_LTL101AT01) {
-		mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0x40, 0x00, 0x08);
-		mipi_dsi_dcs_write_seq(dsi, 0xbc, 0x01, 0x4e, 0x0b);
-		mipi_dsi_dcs_write_seq(dsi, 0xfd, 0x16, 0x10, 0x11, 0x23,
-				       0x09);
-		mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x00, 0x02, 0x03, 0x21,
-				       0x80, 0x68);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_BL_CTL, 0x40, 0x00,
+					     0x08);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc, 0x01, 0x4e, 0x0b);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x16, 0x10, 0x11,
+					     0x23, 0x09);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00, 0x02, 0x03,
+					     0x21, 0x80, 0x68);
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x51);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x02, 0x08, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x02, 0x08, 0x08);
 
 	usleep_range(10000, 11000);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xc0, 0x80, 0x80, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0xcd,
-			       0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e,
-			       0x2e, 0x2e, 0x2e, 0x2e, 0x2e);
-	mipi_dsi_dcs_write_seq(dsi, 0xce,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x80, 0x80, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x2e, 0x2e, 0x2e, 0x2e,
+				     0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e,
+				     0x2e, 0x2e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xce, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x03);
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {
@@ -386,8 +401,9 @@ static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
 static int s6d7aa0_lsl080al03_off(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x00);
 
 	return 0;
 }

-- 
2.47.0

