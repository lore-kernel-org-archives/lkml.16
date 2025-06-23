Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E158B22FF59
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668659; cv=none; b=DJ/t9WkpyNAIzhk1m8IKSbd4M8PiWkq9lUIEqTTxoIRUKG+brH6r5JRIp7z36nPYsBm5RMOxkSh3YzkYH1v7AJsIXAKQEl792YwXKKvmSWowAWmHg3xFI/iGHe+OuXH2uRtpUT3JW8SDFAIVu6C7//XcbRe7R+uXjkxlOdMPADQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668659; c=relaxed/simple;
	bh=/uZSQ/EcB0rNwZGbsbtYX0UqygEGMdYs4umPwvkBw0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6Du2CcLBqg7HBVeSfU0sP7S5MnFikTN1cfilzBK66vQ5qTUSA6EJ5UWv93F9+mL17j+QUCauc3JevFoSEfghPlRqDXBD5tnuDaKHcwh38gJ6lKJ1beSl7T4bPE+sQxGcvsiFCtUS/vK6LjhjzWCPEPS/lYJNZBOAH65XQfWB+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qZlmLXhw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZlmLXhw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AE4C4CEF2;
	Mon, 23 Jun 2025 08:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750668658;
	bh=/uZSQ/EcB0rNwZGbsbtYX0UqygEGMdYs4umPwvkBw0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qZlmLXhwkIjVP81t2ICRxnF6FJlEZdSpsv1p4tv++0nU+xrHF3KlrIR7u0ik3P4Zc
	 3vPIjk/7bIN1yPDvtVOIh1wwxSrnuoT4+2XvBwFVe0y8ohdnVg0+EZDF8DqAz/kWpi
	 cuajgkY4KJh914Q6RwnZ8zWwCtnyZGGWmTgTHT96cJq4YjH0g7UAhtx1bxF+i4D9u2
	 ie6PMzNI6xfKG0P02jRuYutCgtJbmINQbBspGACedOlSbGxuwXBFoTMoeErtjapAdX
	 9RmH3pt7Nru5XNKKHj8ipOz5rwT1c6/ohbA7oWpC1vGx8S/6ZyL+jOiKDH73mDVTLj
	 AVXZA+MPn1mSg==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] mei: vsc: Drop unused vsc_tp_request_irq() and vsc_tp_free_irq()
Date: Mon, 23 Jun 2025 10:50:43 +0200
Message-ID: <20250623085052.12347-2-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623085052.12347-1-hansg@kernel.org>
References: <20250623085052.12347-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the unused vsc_tp_request_irq() and vsc_tp_free_irq() functions.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/misc/mei/vsc-tp.c | 31 -------------------------------
 drivers/misc/mei/vsc-tp.h |  3 ---
 2 files changed, 34 deletions(-)

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
diff --git a/drivers/misc/mei/vsc-tp.h b/drivers/misc/mei/vsc-tp.h
index 14ca195cbddc..f9513ddc3e40 100644
--- a/drivers/misc/mei/vsc-tp.h
+++ b/drivers/misc/mei/vsc-tp.h
@@ -37,9 +37,6 @@ int vsc_tp_xfer(struct vsc_tp *tp, u8 cmd, const void *obuf, size_t olen,
 int vsc_tp_register_event_cb(struct vsc_tp *tp, vsc_tp_event_cb_t event_cb,
 			     void *context);
 
-int vsc_tp_request_irq(struct vsc_tp *tp);
-void vsc_tp_free_irq(struct vsc_tp *tp);
-
 void vsc_tp_intr_enable(struct vsc_tp *tp);
 void vsc_tp_intr_disable(struct vsc_tp *tp);
 void vsc_tp_intr_synchronize(struct vsc_tp *tp);
-- 
2.49.0

