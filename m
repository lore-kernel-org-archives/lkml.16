Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97371F150E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715540; cv=none; b=eZQKCgvRn8Pp/KuXaDBvNkQyaphGDWzqdrH1hFaCuDDeXl9js82xKO9RpAf9q4nz3tq2M3le31YKj8SWcmviuhXYQQXtFye+vq7O/5CuDBxOtrloKNB8teGJ4pSHnGY0G5AcIbjKEIA3FTPu/z3OyW0epexV+qQiVeWmGJueFBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715540; c=relaxed/simple;
	bh=wtbBlblKhvvPd3RxLybMPkgMtkog169R3TwzzY7e1QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nro96AgJKoXufNhP7PFjbjoAm3at5jTpkiQzAYAFYMeJni82OD+15VU67d3x5v2hZ5qX27xKbICSt9NRXxNpf1N7bl3LEiv4+I/xiFWapcyRDeepMRHxnPkBZRbtpY906BHTFQbMuVDL3lHo+qGG2g5XPm0Cml6OjHl9J4lCweQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jN98sMFr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jN98sMFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YSjX5q0zuUeGqz9bX6zAV0oVJKcc4BZjYga6WzSpqto=;
	b=jN98sMFrrrYIpgbc3oD1aj1xC5nsXGiw1FjaBIs1ckUlL7KVrAZqoQFTbdrlqgKuyes526
	QoY99+jyPqg83OWuWPOpIxFN4qNeGiC4ADB/+U5kclYaHmnv/WrCZXATvlzmFRaX4XnQ7k
	iUIpee6JKSL+qoL9je0FP/N0qhOPEVo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-8_pW4TgDMHeJv1r4YFRWKA-1; Thu,
 03 Apr 2025 17:25:35 -0400
X-MC-Unique: 8_pW4TgDMHeJv1r4YFRWKA-1
X-Mimecast-MFC-AGG-ID: 8_pW4TgDMHeJv1r4YFRWKA_1743715532
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3425F1801A07;
	Thu,  3 Apr 2025 21:25:32 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D8648180A803;
	Thu,  3 Apr 2025 21:25:27 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:21:12 -0400
Subject: [PATCH 41/46] panel/widechips-ws2401: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-41-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1265;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=wtbBlblKhvvPd3RxLybMPkgMtkog169R3TwzzY7e1QU=;
 b=R6NLjYG+pKu1/oofYQrVGu1qM95Kg3CDgnb8tsgBCX4/iH/BkL8vujuxzKGVJzLFlrKM1gcks
 WUa7tXQ7F+2Buryz6EJS6rCXGiTPAM0Pbr4PUC7+OtEpNTugf4wTLaZ
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-widechips-ws2401.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-widechips-ws2401.c b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
index 2591ff8f0d4e8b84b7283718bf05684e8d44d1f5..bb3e5e4306ee2cb5e95b812775b4418d672d91d5 100644
--- a/drivers/gpu/drm/panel/panel-widechips-ws2401.c
+++ b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
@@ -347,9 +347,11 @@ static int ws2401_probe(struct spi_device *spi)
 	struct ws2401 *ws;
 	int ret;
 
-	ws = devm_kzalloc(dev, sizeof(*ws), GFP_KERNEL);
-	if (!ws)
-		return -ENOMEM;
+	ws = devm_drm_panel_alloc(dev, struct ws2401, panel, &ws2401_drm_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ws))
+		return PTR_ERR(ws);
+
 	ws->dev = dev;
 
 	/*
@@ -379,9 +381,6 @@ static int ws2401_probe(struct spi_device *spi)
 	ws2401_read_mtp_id(ws);
 	ws2401_power_off(ws);
 
-	drm_panel_init(&ws->panel, dev, &ws2401_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	ret = drm_panel_of_backlight(&ws->panel);
 	if (ret)
 		return dev_err_probe(dev, ret,

-- 
2.48.1

