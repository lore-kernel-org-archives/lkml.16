Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5466222A7EE;
	Wed, 16 Apr 2025 20:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744835139; cv=none; b=C1mZlCGQKrnXLLvoN+A3qsJO25uuhKsb8B1xF7ebe9Hd+stuYD4Iw+apYXDGpI6o11D1bxpRiWMfyw7eqTIfGiXLwbfi+Oi0jR4wViAHQwIS3ujTOq++X+vdOZKEmFEIKmtcTEz+ArpbKQGugJ07yolmYLDs71EeR+ohGls85gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744835139; c=relaxed/simple;
	bh=LNADAl1i2ULx0yyUSwQ5RvXlcx3dXJGSMk0iDCEXnfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qaAlJMRPNqBfoLw3+kXivoLUNy9LLjOE2ttVx8HE/34Jydape08t0foy8MKM+FWEY3FRkm9RFnorJPU8KtgGW2Lkv23CUbe2ekXCS3LZiHlt1j9Gl4i6xCh/QZ36XcqZYJ3k0YvdWi/DEQVKO18exGw8v3soUidwPpwcvCOxDlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeqIWRIa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeqIWRIa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAE29C4CEF3;
	Wed, 16 Apr 2025 20:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744835138;
	bh=LNADAl1i2ULx0yyUSwQ5RvXlcx3dXJGSMk0iDCEXnfU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PeqIWRIaDz8O1MSEl2EgJxhGAGB9dsDYpg552P4oJnJYM5bGvpufg+2MRUD/dRNNR
	 ZXLsEWcabvmagMoAOeYR3u0HL8YCovPm9agtP3+vRdHmzJDRJj11bMKXy3YAtH6t1x
	 N8REp6Jy8hFd+L3l1Y9Y4xmznSS1C9QgroFGiT1pm4GaSS/oSWRhVbwkl22/MkXW9I
	 CQsobxveXLL2HG3vHsY24tVruWgJT5ofcBZkP+yIXnvpjJqanX2DYzvCoO/gIMr6ib
	 KDH/srsWAnTqOVAMWVZZPaWpqEIP3zCKdbve9Mb8+fLQYMrut+gzaDUwwErQv2abUd
	 RR+uqb62d4X2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE0CC369CA;
	Wed, 16 Apr 2025 20:25:38 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 16 Apr 2025 22:25:30 +0200
Subject: [PATCH 4/4] drm: adp: Remove pointless irq_lock spin lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-drm_adp_fixes-v1-4-772699f13293@jannau.net>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
In-Reply-To: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=FUzS4Io0jKsTruJ2+cLIE2QaahlUUifrrGYTPm7rskw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhgwGIXt2+xOdv/rO73ozlU3oAc/HH88WJhrZXl5/aEP6f
 7syrtQDHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACZSMpvhf+h1noaaYzts+l3D
 Eh6LTxQKDNy8wTJ/ihhvknCX7ZbWe4wME6TPfHn3V6jRUWvrBOcN207eDxKWv/Q5p5KhO+mkSVg
 IIwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

Interrupt handlers run with interrupts disabled so it is not necessary
to protect them against reentrancy.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/gpu/drm/adp/adp_drv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index c6238fb059342eebafddd53650a499fea0079dea..abb42f57fe5984a8f0f4be7081fb6803866b5d5b 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -121,7 +121,6 @@ struct adp_drv_private {
 	dma_addr_t mask_iova;
 	int be_irq;
 	int fe_irq;
-	spinlock_t irq_lock;
 	struct drm_pending_vblank_event *event;
 };
 
@@ -488,8 +487,6 @@ static irqreturn_t adp_fe_irq(int irq, void *arg)
 	u32 int_status;
 	u32 int_ctl;
 
-	spin_lock(&adp->irq_lock);
-
 	int_status = readl(adp->fe + ADP_INT_STATUS);
 	if (int_status & ADP_INT_STATUS_VBLANK) {
 		drm_crtc_handle_vblank(&adp->crtc);
@@ -507,7 +504,6 @@ static irqreturn_t adp_fe_irq(int irq, void *arg)
 
 	writel(int_status, adp->fe + ADP_INT_STATUS);
 
-	spin_unlock(&adp->irq_lock);
 
 	return IRQ_HANDLED;
 }
@@ -572,8 +568,6 @@ static int adp_probe(struct platform_device *pdev)
 	if (IS_ERR(adp))
 		return PTR_ERR(adp);
 
-	spin_lock_init(&adp->irq_lock);
-
 	dev_set_drvdata(&pdev->dev, &adp->drm);
 
 	err = adp_parse_of(pdev, adp);

-- 
2.49.0


