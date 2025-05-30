Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867D51A2C27
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573567; cv=none; b=mdN3tVzFydszLqO4AeT1/TXB7zf1HoWiROedh/DYQBmDyDX2N6cPDk1Sa1bTqiqxFKpdm/FTWWaIyHAXHZQrjzGrXJjEd6G7Sx+W+nEvXAwj6jVWezXSU9ia7lawso3bgJq9O29XOxe4efoqvOuTB2B/JSLO37XK8NU7sVUyO4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573567; c=relaxed/simple;
	bh=6/uIbpDvsrolwcl/L1bPF6bpCJ3f70OSsUA+GNfZEAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bgWQMnUi1wIdgVvtq7uvCrBcIUWlrqpjIye6rZVeY8Qz54liIMI5nxksh+Yhs0eXs9KyczV4XUGqC1Dka915MZonmnGZn0nA3b+ietOW8uqAzyyTgcF8AS0SEh/5eyi4zn0PYvvSD2AZxJrNXpQXP4dY1a9JbtR4lhSQlsJwtIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q4D9+myl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q4D9+myl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y0vn/xs8LhHVNC0RcXDwtIcDx4FdZWhHEGH+0O8z6mw=;
	b=Q4D9+mylotn+u96/3XLlvCWC6Uecl2Culzz3hgeBywbJwVEZfDbJRexkEpLjBEHY+EupUG
	RmzKeDQs9ro8d3HQvEuiuZV5JA5e1HobFlVsoJwNsarMnuZTGB8PSVEq0R1X+n/s+xx19t
	Yy9Wvp9q8erznCxn8Gu6V4CxuQgiyUA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-451-2s4FiJoBOhefhdMo_1NKMg-1; Thu,
 29 May 2025 22:52:43 -0400
X-MC-Unique: 2s4FiJoBOhefhdMo_1NKMg-1
X-Mimecast-MFC-AGG-ID: 2s4FiJoBOhefhdMo_1NKMg_1748573560
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C041D18004AD;
	Fri, 30 May 2025 02:52:40 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8F4FF1955D82;
	Fri, 30 May 2025 02:52:32 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:36 -0500
Subject: [PATCH v2 34/46] panel/tpo-td028ttec1: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-34-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1369;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=6/uIbpDvsrolwcl/L1bPF6bpCJ3f70OSsUA+GNfZEAc=;
 b=LHFTpq5uysum/bvYiNwlxa0BWnNvysfG84iRTjQyuu7LGZgnDxb1w+fqjcC0OH6iK0kzqXN82
 hqbwHzq0GabBJSsX6Ns+6t5sBhYA4J4tNE0EktcdbjLKR40CkJYl1nX
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

