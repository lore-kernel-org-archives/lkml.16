Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399A61DE2CD
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738875987; cv=none; b=cu87cFY0m+Zwu9zdQpxVXgx02+wdSZBe6MmL4/qEXxJ8atOt0KZd6IQcItFytNWhNVjBlDP45PK+DqQ9UDF+hHWKeJarD50+cAErw8Fzt107cUa2pO0b575+ncK1CR2rF4/aNng8d07c/rrzVFP1YKrUVjWN1WdVVpb+7wGCBvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738875987; c=relaxed/simple;
	bh=Beg8zbFxde7RAufCgKIRIO97riDK6ODCqDZH1mDsI0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGMIn7U82GzwB+CTjLNmOBKv62jqeGwjVZ91mk0sXmXcjK2eGogh9O7l978mbmTZcBaQw7CO/dYWNRiLJCdwUsDuOIQXDvlo4JzB0aw2lzKWYylM3RTpKw22y14a/kPHbZR/tWy1RRBBAdAmd15dM2IO23adQQjxoyeARvCfoKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TR7Wc7x1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TR7Wc7x1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738875985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W9dw2GsJ3txj4x4sv2e14uTbJQpmFg0Z5+FljY+H6c4=;
	b=TR7Wc7x1i0l7T90rbNWtgYQ95WhyJ9ifEcvrlsRkxqU75alwZ/j7xdLyIuY0X8Uw7p4N6p
	JwteZNAvazt0qFl29choc0F1yxnQ85lLCuDmbJoAZR8PpaFHnqYDJ97TGWILpZrfNNHn1S
	RLrkB1XDcsca/pwwwyPJr9DqvwPWad0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-q30-LadsMtqB-RmBamXM2g-1; Thu,
 06 Feb 2025 16:06:21 -0500
X-MC-Unique: q30-LadsMtqB-RmBamXM2g-1
X-Mimecast-MFC-AGG-ID: q30-LadsMtqB-RmBamXM2g
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 55CEE180087C;
	Thu,  6 Feb 2025 21:06:18 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 754981800570;
	Thu,  6 Feb 2025 21:06:14 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 06 Feb 2025 16:05:56 -0500
Subject: [PATCH 01/14] drm/panel/boe-bf060y8m-aj0: Move to using
 mipi_dsi_dcs_write_seq_multi()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-mipi-cocci-v1-1-4ff0c69e8897@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=3363;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Beg8zbFxde7RAufCgKIRIO97riDK6ODCqDZH1mDsI0g=;
 b=+tgr+AkfmxbpYJ9Q2vPKpPqMIjgeosBh++geKnNUufO3y0qI12ZY2jWlR46h7jMylA7h+wh/q
 2XgheerFhgQC0HbRzoo1NfTMXDW4rXQUizi8TuOkxkId+whhpqP3TdB
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
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c | 36 ++++++++++++++------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index 7e66db4a88bbed27920107458d01efd9cf4986df..640312096c1370c293c84431efa6fd17dc520f2e 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -55,15 +55,17 @@ static void boe_bf060y8m_aj0_reset(struct boe_bf060y8m_aj0 *boe)
 static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
 {
 	struct mipi_dsi_device *dsi = boe->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &dsi->dev;
 	int ret;
 
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x4c);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
-	mipi_dsi_dcs_write_seq(dsi, 0xf8,
-			       0x00, 0x08, 0x10, 0x00, 0x22, 0x00, 0x00, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x00, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_3D_CONTROL, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE,
+				     DCS_ALLOW_HBM_RANGE);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x00, 0x08, 0x10, 0x00,
+				     0x22, 0x00, 0x00, 0x2d);
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {
@@ -72,17 +74,17 @@ static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
 	}
 	msleep(30);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc0,
-			       0x08, 0x48, 0x65, 0x33, 0x33, 0x33,
-			       0x2a, 0x31, 0x39, 0x20, 0x09);
-	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
-			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
-			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
-			       0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83, 0x83,
-			       0x5c, 0x5c, 0x5c);
-	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x08, 0x48, 0x65, 0x33,
+				     0x33, 0x33, 0x2a, 0x31, 0x39, 0x20, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x00, 0x00, 0x00, 0x1f,
+				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
+				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x20, 0x04, 0x10, 0x12,
+				     0x92, 0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83,
+				     0x83, 0x5c, 0x5c, 0x5c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x01, 0x2c, 0x00, 0x77,
+				     0x3e);
 
 	msleep(30);
 

-- 
2.47.0

