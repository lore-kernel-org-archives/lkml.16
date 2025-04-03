Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC1D2528EF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693610; cv=none; b=b8mDib3mcWpbbkJv5rfv7b5tso9/Y2nmZNpMufnXP+T3pncVy0d1qT6oeEB8tVYNOBXmbj4h8/mphgV4dSUBzgnnaMAVhB+ScWw5Bn/ROJE2HUaf7GDxACYgUJxEM8Pn2pp0tzPQiRMJg/CaIhbCuiw6LuySjcSOAriHBXb0yvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693610; c=relaxed/simple;
	bh=rQWKKqtXG8zHvj+oml4Bh3FDva3eQLH5x8W7YKVvBHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p17YJ/GA00V7zOI7xPNrvKcn8kFDTcFI5iZsL4FJ/OrPOvJefdSesJWJgeNcvL0aRVwq8JckiyV5rCq+tpXSh9p4asGGJq+A7pAIytl+Wt0diZbgOEWuk67NovZ7p88GsvO1GaRJtpumTohOZXIO8PDzyYKh15Ob39b7n6augSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D8MBM5n+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D8MBM5n+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743693608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OH0Z+iNqOHbC+oe1dNPpgRH9kQTL2CN47YBp6Nz733s=;
	b=D8MBM5n+HSogaI4VQrrG5alRc20gRrI/o18EFMRERhgYf4N4WKLTCYH+WA4zBmE1RoGUCc
	m3n1HCTwpr3Gh2YbxFXBVx9Pg8+RmcIEZHF7i1rGmpvaogCVZwS8JpWrm8kqyyuEESN/Jv
	fqEf/CmVpUnb18Q0VBKVi0WlA6k36i0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-aaTY7PfpNX6RRUOluaWDEQ-1; Thu,
 03 Apr 2025 11:20:02 -0400
X-MC-Unique: aaTY7PfpNX6RRUOluaWDEQ-1
X-Mimecast-MFC-AGG-ID: aaTY7PfpNX6RRUOluaWDEQ_1743693600
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13D4E195608D;
	Thu,  3 Apr 2025 15:20:00 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2A63E1801A6D;
	Thu,  3 Apr 2025 15:19:56 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:37 -0400
Subject: [PATCH v2 30/30] panel/orisetech-ota5601a: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-30-260c8a44c56b@redhat.com>
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1337;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=rQWKKqtXG8zHvj+oml4Bh3FDva3eQLH5x8W7YKVvBHo=;
 b=RLAbcVr52UrHJAL+nlhIW5FtmcxsXnh9otWMcPWGx3XQ+0+c01UkKkzQxDf47X3b6EuJ7F627
 ArDOeLT+f1xAlc6Qj9wtb0sWtR2O7la6BsDrHh6bpt4hdMzRcY2Ikyh
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
index fc87f61d4400d49814953d7f453a7c6e84004f29..3231e84dc66c2bf319f5287fd53bc437e24e0d5b 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
@@ -237,9 +237,11 @@ static int ota5601a_probe(struct spi_device *spi)
 	struct ota5601a *panel;
 	int err;
 
-	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
-	if (!panel)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct ota5601a, drm_panel,
+				     &ota5601a_funcs,
+				     DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	spi_set_drvdata(spi, panel);
 
@@ -273,9 +275,6 @@ static int ota5601a_probe(struct spi_device *spi)
 		return PTR_ERR(panel->map);
 	}
 
-	drm_panel_init(&panel->drm_panel, dev, &ota5601a_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	err = drm_panel_of_backlight(&panel->drm_panel);
 	if (err) {
 		if (err != -EPROBE_DEFER)

-- 
2.48.1

