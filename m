Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6CB22F762
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800621; cv=none; b=Rq222aYHpavJw7u5Pr84bjAlrwE0k8OctXETBPkyKbGDe1lXa9HuTHn18B5TJtBo9b4dy5s/DPdie9amu3YlifgVlnkWyFLapG3VnAR/uEW4G36aIiGM/8eMtf94ONaTRkTwigq9Vfcc30960THtI+LwKC9cL6dTVhHHYduJTpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800621; c=relaxed/simple;
	bh=GOgjlncNc6TFQSkDmYJCSIvrF5uq0WIGPfIMxI1wRzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8+5fFkMn4ln9MiqL48/qb3XB22KZ6kkYkz9QuHnPor37xXTWoYJ+j/BJrMX++nDd1ncN/W137tgXmX5c56Kds0lvqMUBmHt2V3s0wrjOeseIf+5g8Ziz7B95YjC9TrW4T+PRtpPhAIh+ZXIGtukuk2gIhY1M0Dt96iymmKm6eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TfN+HgFw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TfN+HgFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o+3Zjug7oTkJfbWcS0iuVVo0Ze0IMq05kgV8N81sqg4=;
	b=TfN+HgFwTT7XCM+Cd/I7p7SdZ36jT/laE2mu6ihszfiyUTc0AmGPy93PT978DQ5cnAG99V
	58AyV/R9cOXWukgwDE06qRPZTzVC91Tzl+EIK7GfwfBfNCsPvE9Cfct9AqQ1aktr+jqF3j
	leuwsRjvwbvaTKFMux8BrCugZh0UpRA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-1InNf8vhOoGhrrBDO5Yvdw-1; Wed,
 21 May 2025 00:10:14 -0400
X-MC-Unique: 1InNf8vhOoGhrrBDO5Yvdw-1
X-Mimecast-MFC-AGG-ID: 1InNf8vhOoGhrrBDO5Yvdw_1747800612
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57BBC195608A;
	Wed, 21 May 2025 04:10:12 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7E8D2195608F;
	Wed, 21 May 2025 04:10:06 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:43 -0500
Subject: [PATCH v3 12/30] panel/innolux-p079zca: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-12-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1415;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=GOgjlncNc6TFQSkDmYJCSIvrF5uq0WIGPfIMxI1wRzo=;
 b=g6LQe+BghuahCuV0hNfRywkVgz87nJW9b5UWo6HU3tqa8EiOg/lpCxtBEXh6g0tPBsMibfgh+
 L6lTmmXGCbaBGTXynfEwFQuxnAcTPbYKeUtNSQO5HwgLYpiD4zhr8e8
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
 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index d95c0d4f3e3534d70901864fa9ed0fff8f37d236..80afeeab9475fa13ddadb44cd03a1519d448e24e 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -382,9 +382,11 @@ static int innolux_panel_add(struct mipi_dsi_device *dsi,
 	struct device *dev = &dsi->dev;
 	int err, i;
 
-	innolux = devm_kzalloc(dev, sizeof(*innolux), GFP_KERNEL);
-	if (!innolux)
-		return -ENOMEM;
+	innolux = devm_drm_panel_alloc(dev, struct innolux_panel, base,
+				       &innolux_panel_funcs,
+				       DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(innolux))
+		return PTR_ERR(innolux);
 
 	innolux->desc = desc;
 
@@ -410,9 +412,6 @@ static int innolux_panel_add(struct mipi_dsi_device *dsi,
 		innolux->enable_gpio = NULL;
 	}
 
-	drm_panel_init(&innolux->base, dev, &innolux_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	err = drm_panel_of_backlight(&innolux->base);
 	if (err)
 		return err;

-- 
2.48.1

