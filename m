Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A4F1E0090
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876016; cv=none; b=nVC9dnLb2H5/CE+BBq/3pHkexlL45Cha1wR8FYMDqnGBqjxfRVTP1H5VOFN17SRzCl6i2ha7qcLnemPiFBHhha48IxXlhBczPPfmNrFaKkR64+ezSw6hLVbX0/+RFlBl9r5wZyc1+0NQEklk9+1aUz7siQv4V3J8K3/hJhhybKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876016; c=relaxed/simple;
	bh=xDrVLhPB3HGQ+SiEQjr6bWhAB9xRdzkzCPHAD4asAP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RU9o6CXMADcKU61W2lnYcLE2ecd03SId0tmhIwQnmII+DMmi0Ph5guXcYFwRbHQNPaTAdb9ZeK8LMVplNRJ4QhCnouVSgPh6NcOzC3/zuoXEYGQiXuIfatHK2FVriYuzoadzgNxcLI2rPRPFytwY9qcbAF6229TNOD2GcCMx+pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eaq4+fBT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eaq4+fBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738876013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vx6sn/q77QPVjpE9vGIzpS4F727qGTPlmw25nS011LI=;
	b=Eaq4+fBTt37IYnmaz1p5aCiD4YoGOg7WMJ9oyyX56Z1BxKlDFTygf9ocE/68SRx5AtH5Z4
	eSoaLkF9xE5CRoXukxFKL+dNoKSNJPy/DxYUtNHGIT0Yg7r7Ee038YjuzzPFhJ9eQyJNct
	KWXyOP7ES4JE3x3WHlNy/w33NFH4wX4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-d6CpvG5dOO66Bu4FuQy-xw-1; Thu,
 06 Feb 2025 16:06:50 -0500
X-MC-Unique: d6CpvG5dOO66Bu4FuQy-xw-1
X-Mimecast-MFC-AGG-ID: d6CpvG5dOO66Bu4FuQy-xw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2DC0819560B9;
	Thu,  6 Feb 2025 21:06:48 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CEF1F1800265;
	Thu,  6 Feb 2025 21:06:44 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 06 Feb 2025 16:06:04 -0500
Subject: [PATCH 09/14] drm/panel/sony-td4353-jdi: Move to using
 mipi_dsi_dcs_write_seq_multi()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-mipi-cocci-v1-9-4ff0c69e8897@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=2215;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=xDrVLhPB3HGQ+SiEQjr6bWhAB9xRdzkzCPHAD4asAP0=;
 b=eBuTE3zCCExK7yn7ZHTQWB8c6V4y9uGt00QhodkJQEsRe3axE5jH5oYKofjyM+kTxtCBVkMGh
 EGQonB5Uu85B+Zar0DllBZCQGHYwSbKwajMl8iLB7Mj+FW7mO00ExPw
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
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
index 472195d4bbbe43fe81037707888f0e87ddb9c615..51c5359f3087b71a74ceda0be243d7e934083038 100644
--- a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
+++ b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
@@ -47,6 +47,7 @@ static inline struct sony_td4353_jdi *to_sony_td4353_jdi(struct drm_panel *panel
 static int sony_td4353_jdi_on(struct sony_td4353_jdi *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &dsi->dev;
 	int ret;
 
@@ -76,7 +77,8 @@ static int sony_td4353_jdi_on(struct sony_td4353_jdi *ctx)
 		return ret;
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE,
+				     0x00);
 
 	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
 	if (ret < 0) {
@@ -84,8 +86,8 @@ static int sony_td4353_jdi_on(struct sony_td4353_jdi *ctx)
 		return ret;
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS,
-			  0x00, 0x00, 0x08, 0x6f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS,
+				     0x00, 0x00, 0x08, 0x6f);
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {
@@ -94,7 +96,7 @@ static int sony_td4353_jdi_on(struct sony_td4353_jdi *ctx)
 	}
 	msleep(70);
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_MEMORY_START);
 
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret < 0) {

-- 
2.47.0

