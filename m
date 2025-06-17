Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D260CA6F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750120499; cv=none; b=EmmiprTDQdankq/8atUmMGHh1AKGqIowXFB7FUmhEXMGgnEzOCj2WHZDI4qZzHnM344vjTYK+N8pIPQgZj5oHjpQZjNAPHVAKPxXIEy4bwBnqO/MZYN9QHjP0y++Riz3HijYGhUeZOJ1JNhyKfZsoLMCiItCXkCK+J1+l4ztIpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750120499; c=relaxed/simple;
	bh=lXAYNDoF+0nx3X7EuIEXp1xqr9oDbb03fHr/r0yjBB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UL14f3XYdHjjW2YfrjDZEBQuwu2S7eKOM7/SjpUDGuGhQZaVmfFXZWC6BAd4/aKYG6v+gBi10qpYC58Jn1vPh3xys9TDeAWary2B2At0+VqEyvImjsct9usvNU5YZpPjUUnQ5tEMdCUdB88MlPNqswArQb70hSUTOMODhgXoV7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=k8SuKYQR; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="k8SuKYQR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=S/tSuyWBuPRpsvI5FuK9rkOx9m4pHgwRfK9UxskwDbk=; b=k8SuKYQRWQW9N1Wm
	oc/+onuB1q1AAwYrgBsObkvfRD6OAMtcr4cXdHGKYwsqIu38pHcMr1R86C/pTkfXy28ItvWEDYuNl
	ihbAZwzAT7CTVf5N79LH+GKlbLgr8VAga/ARz6PpO1Umiqq9K5Y/bO/nassLfKpiUvw1cLQhUFA3v
	QJnh9JvFc2RWn6xIKLfZfOpAPkHd0oeiq0CMMNHYEsG4anTDCzHt34ZZUfc8V3w0P96RUc7y89rxW
	MU+EKf7b8fD8tMmy5a7ebe1KiGshiicPQiWzKX5H3SwIevXU7bt/0OSPnP+yBXbXYKHDKsaVMPZ20
	Ag7DdO4ELvUgA0HqTg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uRKHr-009zzB-1A;
	Tue, 17 Jun 2025 00:34:51 +0000
From: linux@treblig.org
To: alexander.usyskin@intel.com
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] mei: vsc: Remove unused irq functions
Date: Tue, 17 Jun 2025 01:34:50 +0100
Message-ID: <20250617003450.118751-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

vsc_tp_request_irq() and vsc_tp_free_irq() last uses were removed in 2024
by
commit 9b5e045029d8 ("mei: vsc: Don't stop/restart mei device during system
suspend/resume")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/misc/mei/vsc-tp.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
index 267d0de5fade..99a55451e1fc 100644
--- a/drivers/misc/mei/vsc-tp.c
+++ b/drivers/misc/mei/vsc-tp.c
@@ -406,37 +406,6 @@ int vsc_tp_register_event_cb(struct vsc_tp *tp, vsc_tp_event_cb_t event_cb,
 }
 EXPORT_SYMBOL_NS_GPL(vsc_tp_register_event_cb, "VSC_TP");
 
-/**
- * vsc_tp_request_irq - request irq for vsc_tp device
- * @tp: vsc_tp device handle
- */
-int vsc_tp_request_irq(struct vsc_tp *tp)
-{
-	struct spi_device *spi = tp->spi;
-	struct device *dev = &spi->dev;
-	int ret;
-
-	irq_set_status_flags(spi->irq, IRQ_DISABLE_UNLAZY);
-	ret = request_threaded_irq(spi->irq, vsc_tp_isr, vsc_tp_thread_isr,
-				   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-				   dev_name(dev), tp);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-EXPORT_SYMBOL_NS_GPL(vsc_tp_request_irq, "VSC_TP");
-
-/**
- * vsc_tp_free_irq - free irq for vsc_tp device
- * @tp: vsc_tp device handle
- */
-void vsc_tp_free_irq(struct vsc_tp *tp)
-{
-	free_irq(tp->spi->irq, tp);
-}
-EXPORT_SYMBOL_NS_GPL(vsc_tp_free_irq, "VSC_TP");
-
 /**
  * vsc_tp_intr_synchronize - synchronize vsc_tp interrupt
  * @tp: vsc_tp device handle
-- 
2.49.0

