Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AB625332F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693553; cv=none; b=MEPnQAPoyY9nqjBl68BmUhEgTCWfD8xoXuBuIusz/aFW02GzSlsBBW/VyMKJUsN5KXUlU8EIAkjIrTcX33Jw3omBqM/jFhxinnQ2XgqCUf+OSkG9t+BoG2ldseVmdq2s110F/pBkInyzP8j8k3mn7UXDnbbKVEuTlypwvpcRV0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693553; c=relaxed/simple;
	bh=fxUMpNSW8esmFPv/nGjkQyAOVNCAMMhql8rSebiViOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aS3PUV+35vO8tjWfUG3cT2v0hLv+5Ax9WoM4nTDEQE6k0Rzn0taATt3jDAQpK4pYenZhtGuqqHEyhl1fTXimk9t/U/wXgIwGB2eV4JrELnNKFqLL93wU3cQhKJOMbeOf0wGB9e0ux4wW2kCvZPJRod8LT22+vkLHtKA7l5BHFg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MpOHcOnI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MpOHcOnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743693550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=deqvuqfBRMkmmyJi8icr/EzK8JTWkbpj8HyHVfnYF2M=;
	b=MpOHcOnIGnc3MEkW1knRqEVqOW2cYL2ExtF7bg7cjcNeJvc/wE5h/vv1gYPJE0JJurlQ7P
	Ge6rBfqwzrMJv/6bRYy4/hJtiPr/IRBJHocIWoiBbk109NcIFp4aN2GAwg5a3g7AQ05EJM
	cCGNLRHmz0qYAssNDEf+04T493G/qIQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-186-GcrHXLBcMuiPFkfLXWWTzA-1; Thu,
 03 Apr 2025 11:19:07 -0400
X-MC-Unique: GcrHXLBcMuiPFkfLXWWTzA-1
X-Mimecast-MFC-AGG-ID: GcrHXLBcMuiPFkfLXWWTzA_1743693543
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 89D3C180025B;
	Thu,  3 Apr 2025 15:19:03 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 04B021801A6D;
	Thu,  3 Apr 2025 15:18:58 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:24 -0400
Subject: [PATCH v2 17/30] panel/lg-lg4573: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-17-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1200;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=fxUMpNSW8esmFPv/nGjkQyAOVNCAMMhql8rSebiViOw=;
 b=EXpZRKCBY5jJ9WLYap1y1KDhoDa26eq7Zk7vGZ3L91poS15GuXFlaKIl+JWVBp3ZqqzMGRqqV
 4TJTBR5QPIuBruTfFFFeKQ/rM85pPqI5UHk5zTmn+Rj0gAHRbubUNb8
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/panel/panel-lg-lg4573.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lg4573.c b/drivers/gpu/drm/panel/panel-lg-lg4573.c
index cf246d15b7b628a0b3821bfb2697842b6e484319..dec619902c15f8fbfdd138ef3bd2aa7cae921375 100644
--- a/drivers/gpu/drm/panel/panel-lg-lg4573.c
+++ b/drivers/gpu/drm/panel/panel-lg-lg4573.c
@@ -243,9 +243,11 @@ static int lg4573_probe(struct spi_device *spi)
 	struct lg4573 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&spi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&spi->dev, struct lg4573, panel,
+				   &lg4573_drm_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->spi = spi;
 
@@ -258,9 +260,6 @@ static int lg4573_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	drm_panel_init(&ctx->panel, &spi->dev, &lg4573_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	drm_panel_add(&ctx->panel);
 
 	return 0;

-- 
2.48.1

