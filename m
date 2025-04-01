Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF1220F094
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527155; cv=none; b=Q4Go2vi57y8W4BAKysGCY/zdUzRTspFykpqrfpEe7LL8C8fXQhPpucw01MFVoFWg9uHOSTlA6xJQg5OgNN4tAjBZXw1TcCRWZNf7RQrmt1mhKo/RkEFPrQ48nK4Wbb9O8drC6iDZx43N9YnrKhQz2uYeesLXlRrN6KLUlihaFmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527155; c=relaxed/simple;
	bh=BcsCt7sDT4Hwy4xAWbpR/vQV5EY4L/ydvFeaXu+tuIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRt0IbYmOIa3wsX1QUVcqHO5eCPzNL1M5ZGufJ287E2KZl9isVgg/fWQPksXSszYJlsh4D1N6465TY3DJOiRMWw/kKIxgJEoqgxqr4ywyuaN8uEyfjRFtgIoPozC2HkIoKXvcNqT4vhnKGc4DTsmJRY55PEMIb43RQCy4DbybS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F6BOR3uo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F6BOR3uo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743527152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ucdSlMOfTDKmwdx9hI0wYD4kbTz/U/trniewD9ZB4c0=;
	b=F6BOR3uoM3TeK49egdR2NoFZVUxIYD5EiwCf8iLwjpv72tdRqDnms5z5/YY7zB9ofqITVA
	yLw4nc2mnhjMSBH9kAP5KCn6AO42ufbVn3H9zE+XxeCdc5mtMES4id39vJRmqwioJ365nS
	qytNdwb9hRw4HTXtrz4X90cW7D3kyCk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-ryXREDC8Oz6oscdswF4teQ-1; Tue,
 01 Apr 2025 13:05:46 -0400
X-MC-Unique: ryXREDC8Oz6oscdswF4teQ-1
X-Mimecast-MFC-AGG-ID: ryXREDC8Oz6oscdswF4teQ_1743527145
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C6277180025F;
	Tue,  1 Apr 2025 17:05:44 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 59D80180B48C;
	Tue,  1 Apr 2025 17:05:42 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 01 Apr 2025 12:03:53 -0400
Subject: [PATCH 10/10] panel/panel-edp: Use refcounted allocation in place
 of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-10-cdd7615e1f93@redhat.com>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=1281;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=BcsCt7sDT4Hwy4xAWbpR/vQV5EY4L/ydvFeaXu+tuIA=;
 b=32M/ON9nGQoWm16EsoIsC0cPw5l9gM9gH4tPzD2OACXv7Iz+kiheQ2z6nI2Et18fr7eGepbJY
 WdsHP5Y0DJ2D+YFsuESSUTGhQhNFf+Au5wqfMj1pUbZOsoauH1mYYxG
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 52028c8f8988d4b771bd2604256aea4cde4f4020..e8fe0014143fd0f86ee51c94f2afd24416fa0c12 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -839,9 +839,10 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 	struct device_node *ddc;
 	int err;
 
-	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
-	if (!panel)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct panel_edp, base,
+				     &panel_edp_funcs, DRM_MODE_CONNECTOR_eDP);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	panel->prepared_time = 0;
 	panel->desc = desc;
@@ -886,8 +887,6 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 
 	dev_set_drvdata(dev, panel);
 
-	drm_panel_init(&panel->base, dev, &panel_edp_funcs, DRM_MODE_CONNECTOR_eDP);
-
 	err = drm_panel_of_backlight(&panel->base);
 	if (err)
 		goto err_finished_ddc_init;

-- 
2.48.1

