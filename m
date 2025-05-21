Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ADD22F768
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800591; cv=none; b=i9kPaxZcNwvjWVbkm01TJW9kjfNyvp6sA8HyrEHZfbO3y6zhKvK6O+CEPVbMchkEM+RPClMnlqYROSsRpXEVTkTOUPuUUck37iv/L5Taj6ENJp/+Uu4i6ZWzWh50Cm0KHdkDV07ptfAhekgq57V1eAeYvL1KMz40fF6g3Ttf064=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800591; c=relaxed/simple;
	bh=0fJK8sZO/M/aw8fddBJTupShEp49HcVnV0hGAZbmby4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QnoKRzl5EqHsYPMjfHI2/ek25VwGXbkEM/wd4tfGb8PeM51zDSkseJuzELEG11JWn+eA9pCEfpTAVs6V52lPRF1iS7HNm2IpZuUsT4CzDuqs4svx3R3yS4uVSc7SfZBDF/xFKHVEdzGmE9GTGly1ju/5fY/ikQHBLnbGOE8qYD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LvlwVEKO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LvlwVEKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UTPVsnbjSOjTovSZMWoHigUam2q1Qy5eT/mmkcQBsZ0=;
	b=LvlwVEKOAwDHN+7wd6HmvFoFdOjm/xRofIuRlLkq956F6rox+g5FiRMJLnqNUGJNBJgQmU
	sj59QyJNlNMWaxWbDS81h3/wfqM7XCaPzjRWkczMmvzu1icVAbNsn+ovTewhJXHkhYxNKy
	XxI5SudNULnZEOVNiXlfvPXpfsStjIM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-2OkxguWsM8GIJG3tBb0XlA-1; Wed,
 21 May 2025 00:09:43 -0400
X-MC-Unique: 2OkxguWsM8GIJG3tBb0XlA-1
X-Mimecast-MFC-AGG-ID: 2OkxguWsM8GIJG3tBb0XlA_1747800581
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0462D180048E;
	Wed, 21 May 2025 04:09:41 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1BB1B195608F;
	Wed, 21 May 2025 04:09:34 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:38 -0500
Subject: [PATCH v3 07/30] panel/ilitek-ili9341: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-7-f7ae7b723c68@redhat.com>
References: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
In-Reply-To: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1427;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=0fJK8sZO/M/aw8fddBJTupShEp49HcVnV0hGAZbmby4=;
 b=hrtTIT0CjDk5scpXkVgDcRijni5VzlJE3wudF2NwmSMIxQDWSXtDo622ivfwQH6lGCnnOdQ5Y
 hfNMpKyWU+DATPV/5tIDZGciqIovixWE7DXeWpXexKy6VNW9AmHXIJB
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v3: none.
v2: none.
---
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index ff39f5dd4097e8da0a0e16c50c5bfd45c078d91c..bcd561e06465444440e0a5d143219c06e2121218 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -490,9 +490,11 @@ static int ili9341_dpi_probe(struct spi_device *spi, struct gpio_desc *dc,
 	struct ili9341 *ili;
 	int ret;
 
-	ili = devm_kzalloc(dev, sizeof(struct ili9341), GFP_KERNEL);
-	if (!ili)
-		return -ENOMEM;
+	ili = devm_drm_panel_alloc(dev, struct ili9341, panel,
+				   &ili9341_dpi_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ili))
+		return PTR_ERR(ili);
 
 	ili->dbi = devm_kzalloc(dev, sizeof(struct mipi_dbi),
 				GFP_KERNEL);
@@ -526,8 +528,6 @@ static int ili9341_dpi_probe(struct spi_device *spi, struct gpio_desc *dc,
 	}
 
 	ili->max_spi_speed = ili->conf->max_spi_speed;
-	drm_panel_init(&ili->panel, dev, &ili9341_dpi_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
 	drm_panel_add(&ili->panel);
 
 	return 0;

-- 
2.48.1

