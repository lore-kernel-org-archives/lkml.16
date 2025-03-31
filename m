Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3862147F9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439066; cv=none; b=c9n2mF9RcCgkISBIw4bG5/2CZzXgoI64SqGoZI/NXX2lzrlQGJWHJgdSbCNXYHQUrtQjVxMJDeH6ct1k6/xwKDk1E8y3R4dWfbIWQLkD2Ac1WNEPgHh0cGEHWRqomEdkxEessRKgFj/Tw0Pd/dUR8275lChBtP58lYm38NrqQ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439066; c=relaxed/simple;
	bh=56ALU25RniIN4b9TlbDlvXVAyMGXTIS2xx9SEHRuRLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KUs+gBas7Np4mFB2MqH1fvzZhf8CqXwsQbWg/v6WulerugtWkY5O9NFO9vJ7tMtQXtLJ0lUsAIx+TiTGJmM3qoYqgCBKqzAuYmNO5abBXy8GciplcUbqx2knldtz/GAU4MZoUTaijPXMlWAriT+m5kuTEhPNrjXd9pQuna4AbXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=R/bLblqA; arc=none smtp.client-ip=185.136.64.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="R/bLblqA"
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025033116373436c5b5656ac201c140
        for <linux-kernel@vger.kernel.org>;
        Mon, 31 Mar 2025 18:37:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RNs0pMlBNrqTM8IlXiZot+3/KQhfKfwMQZeq3eLYLi4=;
 b=R/bLblqAfr5NHQW0Vr3OAIDAgRcjWIMF1z0sol7Qzef8MYz3hBAj3hq3pdmIhMl3XQbI4C
 tomIuQoxenS6SQmhzZ/52hTCND93qCWLjDLXNrfwfR2OBWb7rEfx3PNwdH0aNtgx+8laHNiG
 5xigPCkyJHsZW/vvpF4MoTXHX2nbk3B64V2MOmy/c7Bg7/zGMRrndQtnEYsPATXIehQsRwpd
 fNfcEDdsnsugNwigZynwIRuOVewLYp4lwVkcsbDsL58d7Y48TP0oQOJV9bJ82Jcw2gKbyuYo
 bZ40+1hqgBmJEUMV5U+0R9zLdflVU0MpJ7V5YYgUgQfz9J9ARyuZxvbA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-iio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	William Breathitt Gray <wbg@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] counter: interrupt-cnt: Protect enable/disable OPs with mutex
Date: Mon, 31 Mar 2025 18:36:40 +0200
Message-ID: <20250331163642.2382651-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Enable/disable seems to be racy on SMP, consider the following scenario:

CPU0					CPU1

interrupt_cnt_enable_write(true)
{
	if (priv->enabled == enable)
		return 0;

	if (enable) {
		priv->enabled = true;
					interrupt_cnt_enable_write(false)
					{
						if (priv->enabled == enable)
							return 0;

						if (enable) {
							priv->enabled = true;
							enable_irq(priv->irq);
						} else {
							disable_irq(priv->irq)
							priv->enabled = false;
						}
		enable_irq(priv->irq);
	} else {
		disable_irq(priv->irq);
		priv->enabled = false;
	}

The above would result in priv->enabled == false, but IRQ left enabled.
Protect both write (above race) and read (to propagate the value on SMP)
callbacks with a mutex.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/counter/interrupt-cnt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/counter/interrupt-cnt.c b/drivers/counter/interrupt-cnt.c
index 949598d51575a..d83848d0fe2af 100644
--- a/drivers/counter/interrupt-cnt.c
+++ b/drivers/counter/interrupt-cnt.c
@@ -3,12 +3,14 @@
  * Copyright (c) 2021 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
  */
 
+#include <linux/cleanup.h>
 #include <linux/counter.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
@@ -19,6 +21,7 @@ struct interrupt_cnt_priv {
 	struct gpio_desc *gpio;
 	int irq;
 	bool enabled;
+	struct mutex lock;
 	struct counter_signal signals;
 	struct counter_synapse synapses;
 	struct counter_count cnts;
@@ -41,6 +44,8 @@ static int interrupt_cnt_enable_read(struct counter_device *counter,
 {
 	struct interrupt_cnt_priv *priv = counter_priv(counter);
 
+	guard(mutex)(&priv->lock);
+
 	*enable = priv->enabled;
 
 	return 0;
@@ -51,6 +56,8 @@ static int interrupt_cnt_enable_write(struct counter_device *counter,
 {
 	struct interrupt_cnt_priv *priv = counter_priv(counter);
 
+	guard(mutex)(&priv->lock);
+
 	if (priv->enabled == enable)
 		return 0;
 
@@ -227,6 +234,8 @@ static int interrupt_cnt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	mutex_init(&priv->lock);
+
 	ret = devm_counter_add(dev, counter);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to add counter\n");
-- 
2.49.0

