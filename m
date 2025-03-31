Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD092155725
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743391559; cv=none; b=Wa8QhC1h8TnOOycppyiFvhmJG1QeZMEKEHOc5wyzRQiOy/1BnQurxR16E60Mgjiof+udbd5dw/PlJ/sQ2kqO601fKLZVe39HD+ccwNZIw0XaOHCGH6vphXV59x0PM9Fuyl/aF9C7CrG0P/UGHdm8jMR2YCclsnSYnmh+aauAKnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743391559; c=relaxed/simple;
	bh=1RmX9btvC0nrxtXfEOn96R8eo8jQJomf59RfizwYlhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmnTcZB2DAHGhxoRq1AyB+YYJPl+NyCUjfmUBL3L6XRv4xF49DUYQIsLf8uinUmp0W2OR56gQRcVBn6+2OSUHuMvsBUH/kgogfv8WFvlc4AZO3YRXUXVa3pVe5nm7FsyKgGz8eADNxanbNXAWZpOBawBnVAkRqAngSQtW+Fghg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=al8tgib8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="al8tgib8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743391556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dp5hDKc9ocj3PapOSfucBXLZObsSVMAvb4l+1lFut9g=;
	b=al8tgib86E+cYzOnkuwNqKVJDzokgnrstmi9WwJSKJSZy84xFTvCrP5biEj9iyt4/nD7bn
	9YZMKKKUfmZ7zCzNuv3mN1k7CzTieELNsEdGPEaEy+rV+gUoD8zpa0I8ay9ftO7Bk9JThp
	8q4R97a79a2OP3FhLy2gmJ65eyLAI6Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-zvVDH3_gP5KFGotVKCR3Hg-1; Sun,
 30 Mar 2025 23:25:53 -0400
X-MC-Unique: zvVDH3_gP5KFGotVKCR3Hg-1
X-Mimecast-MFC-AGG-ID: zvVDH3_gP5KFGotVKCR3Hg_1743391551
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B64D71809CA6;
	Mon, 31 Mar 2025 03:25:51 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AEBFA1801750;
	Mon, 31 Mar 2025 03:25:49 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Sun, 30 Mar 2025 22:24:15 -0400
Subject: [PATCH v3 4/4] drm/panel/panel-simple: Use the new allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250330-b4-panel-refcounting-v3-4-0e0d4e4641eb@redhat.com>
References: <20250330-b4-panel-refcounting-v3-0-0e0d4e4641eb@redhat.com>
In-Reply-To: <20250330-b4-panel-refcounting-v3-0-0e0d4e4641eb@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743387855; l=1493;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=1RmX9btvC0nrxtXfEOn96R8eo8jQJomf59RfizwYlhU=;
 b=aGlaH7CQI0rCXfb+GZf33QE8HKvJKdW3rTkPYluP3K2B6mzYl/xbhfprl/tcOblu/OuDenzg1
 R1Vioa/JrRyCcw/LrrPwT8WjFBMBEx7XwF20RVj3SMkvo9iDA4MiNs/
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Start using the new helper that does the refcounted
allocations.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

---
v3: none.
v2: check error condition (Luca)
---
 drivers/gpu/drm/panel/panel-simple.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 6ba600f97aa4c8daae577823fcf17ef31b0eb46f..df718c4a86cb7dc0cd126e807d33306e5a21d8a0 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -579,9 +579,10 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	u32 bus_flags;
 	int err;
 
-	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
-	if (!panel)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct panel_simple, base,
+				     &panel_simple_funcs, desc->connector_type);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	panel->desc = desc;
 
@@ -694,8 +695,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 
-	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
-
 	err = drm_panel_of_backlight(&panel->base);
 	if (err) {
 		dev_err_probe(dev, err, "Could not find backlight\n");

-- 
2.48.1

