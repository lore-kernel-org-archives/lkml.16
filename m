Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C761DFDB4
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876013; cv=none; b=IgIL9adu6S7+Ceq7OQygQ4Uy5O7xm72kFt88Q/cXYCs0dVOO1JyR51LSJYIxeLbNcolP7MEqfbPiS5o5ALnS191KP0I7Z9GR3qlD2pHunXGV7VykWXWMSP5K/mlbA2q1ZIQb8i/pTvWd1HU8rhdWpNYVwIQe4YjC6J22y5s6c6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876013; c=relaxed/simple;
	bh=kIF0ex5iL5a87AEuHz+aTTw4ykoICD+wkGV67J4m1mQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tFxheTQ+lvUvfiwLzNLEjtr+jIBr67Kg+jOgrXkE4lR0e3gR9CGTcUiL8EvKypnaeI5A2XfJe58CAdik1n8Em29AQKYaxmBGDnSegITwlbHaWli81cNNkGCApwQ1zir2VRES/W7uY21Y26nH3gBcOt1oKj6/0RQduNINy3aJu7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qi0TWDew; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qi0TWDew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738876010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EFhD3eSTFnJ14YBj8tyVuIsrsB7JO8KnWVmV1ttAyTw=;
	b=Qi0TWDew6eaiJeR+o+46VEFGMoYTLIsfrcvWGHKp+H6gELUDidg1HSqRVKjImjkJ7FoByp
	K+yDzqssnrbjbPv7FRk6+gnH986b0xbQVsFiqdO2RJPCuxJwnA4xQBWXMsdnFnNl61mLpg
	02f2r45ZKKTIhcLBksjjvK0IieXR1Fs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-286-5gEGa7b4MWaSyGoZZF3TTw-1; Thu,
 06 Feb 2025 16:06:46 -0500
X-MC-Unique: 5gEGa7b4MWaSyGoZZF3TTw-1
X-Mimecast-MFC-AGG-ID: 5gEGa7b4MWaSyGoZZF3TTw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A20F71800374;
	Thu,  6 Feb 2025 21:06:44 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 819381800265;
	Thu,  6 Feb 2025 21:06:41 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 06 Feb 2025 16:06:03 -0500
Subject: [PATCH 08/14] drm/panel/ls060t1sx01: Move to using
 mipi_dsi_dcs_write_seq_multi()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-mipi-cocci-v1-8-4ff0c69e8897@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=1545;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=kIF0ex5iL5a87AEuHz+aTTw4ykoICD+wkGV67J4m1mQ=;
 b=bd5aH9u2q8EGgcL16UItN5xQPxNWubJp7xhcwl6jEwcy0HIM0qSsMz24U1lYMjlj2UNoRfHkU
 isRfeHjQMsvDjwTrM4yx/9Us1gRMFeQ3aq51WH3NPfM/GMMDOtUY1uV
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Use mipi_dsi_dcs_write_seq_multi() instead of
mipi_dsi_dcs_write_seq()

Used Coccinelle to make the change. SmPl patch:

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
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
index 74c760ee0c2d1c4f1e857872e6ad38de08ab8b2a..387466460f554a9da80d184fc1f93c3b998f6351 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
@@ -44,13 +44,14 @@ static void sharp_ls060_reset(struct sharp_ls060 *ctx)
 static int sharp_ls060_on(struct sharp_ls060 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &dsi->dev;
 	int ret;
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_MEMORY_START);
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {

-- 
2.47.0

