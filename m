Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ED21ACEDF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715510; cv=none; b=GMB4277C5KYzLbS0Pl6rEaBI5M6SMgU/LZNfnhkkiA2nmDZAmINLXUrgrB2NTN1M9+UcX65mr4EUZ37cVT4EoQxvfqoaQVIrvSi1Bf8OUsnH2ecORoMuoK0kjksPvpfUPuYxuS1fNwquiuX4Sas8ri6obg8cRqdJA5pMOjo50r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715510; c=relaxed/simple;
	bh=L24KX6Qu3qZ4iIUK0qaiAR24ktFBB/SB0Zssbpnsvoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dm04W4A0rJ6BdSrSL51hbjiPw1L487i8IOcy3X3tampZt0VF7J6HzFSWZFhH/w1bZ9XyUSHJBcqSndbO9sdoPtNESfX+ave4rqeE5NSP9xzElS47WWF2Z0XgTkekLOxI8ywHB1MDTj695z8kPvcfyU/ZxNBGSfv7piHrJrkWrdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CsQ8ScoW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CsQ8ScoW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=91vdhZWdBa5udiqQ3LLbB3dXq3oW6vqUKdQE1IRxVu4=;
	b=CsQ8ScoWhjitM3M0gq70Wrd4iLzXir53+QP2ONdEweilNyowUWbEh/zSHWq/2itYfEy2eZ
	N8dAVxkUoY7fjr4RyXjwCnzjdgMsGlZ1UQQWKkrPflbJ+Cp+SxXjeyBrTCVrmubE2wlprJ
	Fiie9xXnWsV6IQKd3JyFp+HbdLTdzLU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-446-iT4TknCGN06XHxNA1Z96Mg-1; Thu,
 03 Apr 2025 17:25:02 -0400
X-MC-Unique: iT4TknCGN06XHxNA1Z96Mg-1
X-Mimecast-MFC-AGG-ID: iT4TknCGN06XHxNA1Z96Mg_1743715499
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BECC3195609F;
	Thu,  3 Apr 2025 21:24:59 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 79CD5180B488;
	Thu,  3 Apr 2025 21:24:55 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:21:05 -0400
Subject: [PATCH 34/46] panel/tpo-td028ttec1: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-34-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1296;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=L24KX6Qu3qZ4iIUK0qaiAR24ktFBB/SB0Zssbpnsvoo=;
 b=FdndrYvv8vTfJPp2cGo0IJGMNxCKBtbzdB87WSoMRzWkQYU9kV5UIumy1Fy0jK7a1uVfCSvI6
 P6YQYPXS3h3COyXsLZPVvtI0i7CHazCbl8I5YW5cvQQs3aWsqOC1uHh
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
index 4dbf8b88f264f7afcacf2ae8f67704f5a7505341..af7e2047fc1f16ef6aa7bf22800664137291c526 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
@@ -322,9 +322,11 @@ static int td028ttec1_probe(struct spi_device *spi)
 	struct td028ttec1_panel *lcd;
 	int ret;
 
-	lcd = devm_kzalloc(&spi->dev, sizeof(*lcd), GFP_KERNEL);
-	if (!lcd)
-		return -ENOMEM;
+	lcd = devm_drm_panel_alloc(&spi->dev, struct td028ttec1_panel, panel,
+				   &td028ttec1_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(lcd))
+		return PTR_ERR(lcd);
 
 	spi_set_drvdata(spi, lcd);
 	lcd->spi = spi;
@@ -338,9 +340,6 @@ static int td028ttec1_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	drm_panel_init(&lcd->panel, &lcd->spi->dev, &td028ttec1_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	ret = drm_panel_of_backlight(&lcd->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

