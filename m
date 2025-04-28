Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B4526463E;
	Mon, 28 Apr 2025 11:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840247; cv=none; b=P53O1gWNKP1ZrXug+qBVtKlR0xa1W7I3VDiEtxqUyu7RtSqX1U4HJ0/uNdAaWCm7hmu3MT3VYj84L0KL7IwU6vYA+vrUL024hgi4n0BG0EYN11yB5Vg+GK2VveLTmI8WnxmlYz7BYNk58Nmt+hb1k3zmSx3wstNAVTb2Hy3YjTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840247; c=relaxed/simple;
	bh=DusiS8TIoBABh8abNAevu5jrzmZ5X9KePA1heMAStUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dq799HyNN1IzRmQrLhfBqpF3bjXqANTqCvq6S3uQkzfsufw974iRK4qO6dM0+kZNPAd7/mQHjyMEwKdL7BKTJsCCBqBfppgHYgQDaWPHbYWprrKgSrhwjkCzNsh4GKjcCvi7dUSzM2onCmx3Mz4t2kd2SxWpPzDY6WhPKMNkSeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPa7jAJc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sPa7jAJc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C80EFC4CEF2;
	Mon, 28 Apr 2025 11:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745840246;
	bh=DusiS8TIoBABh8abNAevu5jrzmZ5X9KePA1heMAStUA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sPa7jAJc0bLhhllO6iHV0X4+rnVUleNHZhTpZZ9oKsoy/vqKw8z1W+gQcVdalFgIs
	 rF1mNqwHAkImpc1Srd7sknNRrq6ugKP957JGdWRri/agKIRXbfT2mnpptV1SWZEQ99
	 xxpgJcCV8KqZWP29RPY03bfim4SRZgcrFHdo34chJliDOga6ZW0O1ONRpoevaXDpyb
	 MZXu741oNu1+rkP6MVGn9G9AldKd4/RFoY8D/drTTvKKss+85tQdSMYWh16HMIcf6x
	 kS0mD3mFo16W78oYqJauBbwk0t694kEWjGLvT+fla5eIIoirSSbhy05L+WD6dvFXlx
	 t9CkLWCc4ulHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC048C369DC;
	Mon, 28 Apr 2025 11:37:26 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Mon, 28 Apr 2025 13:37:16 +0200
Subject: [PATCH v2 4/4] drm: adp: Remove pointless irq_lock spin lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-drm_adp_fixes-v2-4-912e081e55d8@jannau.net>
References: <20250428-drm_adp_fixes-v2-0-912e081e55d8@jannau.net>
In-Reply-To: <20250428-drm_adp_fixes-v2-0-912e081e55d8@jannau.net>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Baryshkov <lumag@kernel.org>, Janne Grunau <j@jannau.net>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=NJRXEZ01TAGoH4kfPTd7Rr3rCRNebD9LmKwrPczu484=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhgz+jNL3dnL6YaKRWyTupDIISnVNq0sOv7ScI4ZZcoJPX
 7X0MtWOUhYGMS4GWTFFliTtlx0Mq2sUY2ofhMHMYWUCGcLAxSkAEzn2j+Gf2jHL9u0/t+uuXaC5
 1LWz57zxH7W3a5ad+vzmTe+u3CcPtRn+53JUtNQ4FnuZpSVWLctUv+J3fq7bbf/Hwsdf37bZlhX
 KAwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

Interrupt handlers run with interrupts disabled so it is not necessary
to protect them against reentrancy.

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/gpu/drm/adp/adp_drv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index 50d26c73301c02e4a2f22b776ad8d8e9407565c9..54cde090c3f42a344478b794a32eb57afc182735 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -121,7 +121,6 @@ struct adp_drv_private {
 	dma_addr_t mask_iova;
 	int be_irq;
 	int fe_irq;
-	spinlock_t irq_lock;
 	struct drm_pending_vblank_event *event;
 };
 
@@ -490,8 +489,6 @@ static irqreturn_t adp_fe_irq(int irq, void *arg)
 	u32 int_status;
 	u32 int_ctl;
 
-	spin_lock(&adp->irq_lock);
-
 	int_status = readl(adp->fe + ADP_INT_STATUS);
 	if (int_status & ADP_INT_STATUS_VBLANK) {
 		drm_crtc_handle_vblank(&adp->crtc);
@@ -509,7 +506,6 @@ static irqreturn_t adp_fe_irq(int irq, void *arg)
 
 	writel(int_status, adp->fe + ADP_INT_STATUS);
 
-	spin_unlock(&adp->irq_lock);
 
 	return IRQ_HANDLED;
 }
@@ -574,8 +570,6 @@ static int adp_probe(struct platform_device *pdev)
 	if (IS_ERR(adp))
 		return PTR_ERR(adp);
 
-	spin_lock_init(&adp->irq_lock);
-
 	dev_set_drvdata(&pdev->dev, &adp->drm);
 
 	err = adp_parse_of(pdev, adp);

-- 
2.49.0


