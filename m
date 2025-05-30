Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8151EE7D5
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573465; cv=none; b=ZQnXamscwHR1EGYhY+2LnFp7hraOzEBchA9iaqTzW1QR8RBpFw5hqdnm+sfz7hlgpQTTr+RgV9+nvosFhf3rqKRliowDq4ddAlyS5EbJ/kqmCxBBQi9z/alvt5EYxoZiLSr/6tP9oX5GZrAo11wQQGBjpna5RcS42jw1GIHYX4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573465; c=relaxed/simple;
	bh=/IguybTUHkmGHl4lDAwtJQanC4yCGuEFJDQ8Rz/GQX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rJbK27Ew7qMwohXAbPY2/MUT22CT9fXjp6Ev/W5/elqAz311HAiMO58i45c+FACe+QcFdhqKr8JCD7d7f9YKhrhf858yuxmGNpI1Mgx1fjaGr207qC3y0guiDX/5On+1w33rMRxuBnCPQhRF2z2vRG1sswp+6f0C52g+KYIEBR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G/sraMby; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G/sraMby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yP7Yt1jdLtFrb1Btt/Q1OM3FtCssfEiWBP5ZLXFx4yw=;
	b=G/sraMbykjsFWGXJ4pJm4fWugqn5jRpF4Y32ugx8r10N9RPpyPg8IkXOKzi6tP5fnyuMTo
	xtjC8bS0MW6ObMLAHrabphVpqAhK3oe64em12Z7lYdbQpGASZh7N/RyJR78WuF5HkBKEUM
	X+bJlckEXNZphzlxY2M+wjO8bEOvkT4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-DV1Vas-AMoWd6EatHYOJow-1; Thu,
 29 May 2025 22:50:59 -0400
X-MC-Unique: DV1Vas-AMoWd6EatHYOJow-1
X-Mimecast-MFC-AGG-ID: DV1Vas-AMoWd6EatHYOJow_1748573456
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 95546195609F;
	Fri, 30 May 2025 02:50:56 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 41E581955D88;
	Fri, 30 May 2025 02:50:52 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:15 -0500
Subject: [PATCH v2 13/46] panel/samsung-s6d16d0: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-13-5d75a3711e40@redhat.com>
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1333;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=/IguybTUHkmGHl4lDAwtJQanC4yCGuEFJDQ8Rz/GQX4=;
 b=6S3pdqP8BsjmXVgW7wtwDM+bIYD/KhDrsuHFULHQ+IS7+u94ShbgvDYNCYHQfJrGWSiQpKoya
 hBl3BGSRxq/DzgL051eHfzO7esy6zfZmmXnKVdB+F47lcTOHUATMqtI
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
index 79f611963c6183218b42c7b6c3e2ab298e3fdb99..ba1a02000bb9def0b4afa8a43e13bc7c3c92a51d 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
@@ -166,9 +166,11 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
 	struct s6d16d0 *s6;
 	int ret;
 
-	s6 = devm_kzalloc(dev, sizeof(struct s6d16d0), GFP_KERNEL);
-	if (!s6)
-		return -ENOMEM;
+	s6 = devm_drm_panel_alloc(dev, struct s6d16d0, panel,
+				  &s6d16d0_drm_funcs,
+				  DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(s6))
+		return PTR_ERR(s6);
 
 	mipi_dsi_set_drvdata(dsi, s6);
 	s6->dev = dev;
@@ -200,9 +202,6 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
 		return ret;
 	}
 
-	drm_panel_init(&s6->panel, dev, &s6d16d0_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	drm_panel_add(&s6->panel);
 
 	ret = mipi_dsi_attach(dsi);

-- 
2.48.1

