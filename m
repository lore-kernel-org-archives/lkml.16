Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C1B213E6A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434617; cv=none; b=SlWLyRKwYuk+Bub5yO0LfCt9rH0uci4cb6RhUxyyqHTrjPqyLwF0+EJ+MqDg4dRUTnYWSFtR1CH002wf0hW3v8CcdlJ90nqTGBeotUvBvei2Hfpm62GwuAjnG3ggEjFTfylz6QsEGDeSBZX3jcP89jHWdbj4/LFngv/IXkUJjEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434617; c=relaxed/simple;
	bh=5SJWYCfWk1YAL1IX0C4+dCsC9NHMJGkuSl9toM7Vr5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f1P9PwyY/6QJgW/nOcGrcrZADtOYvE8P4X05B2FVz++78Wy89obGHtyOG6HFv2wfSaQfD0+odWvK+asLNWVx5LYgo6949jk0NK3tGjuYZm+fSQutwzpxL8EzWHJQ9obhesbgEvDN10pJw9IAicJXkYi0LVuwu8nZ42q9eshqdnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=SDPlOkqA; arc=none smtp.client-ip=185.136.64.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="SDPlOkqA"
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025033115232418c9249bf5bc0a733b
        for <linux-kernel@vger.kernel.org>;
        Mon, 31 Mar 2025 17:23:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=7eiwFnwUgBmbRD9IxiOhHWh5SQuTCyH/HvCBFO7xT2A=;
 b=SDPlOkqAmIbLZR8Q3Hc0o5FlY/yggf6aGrdk/5RXn+qgO5oqAnwOWAjo+fb6C99fU9lW1n
 iY9VXgRQHqsGnxtXtmJZPZMoHrDbRspmDYchk97f4213cxU7mgqHLcL9D88jHF6GKnuxyYzF
 4Wcop+VU3AREHloJw8rFnyj8y65mJkIz6u0yM0l3JT+3YVZAjZ2qP9p/H18BlOI5fNXEam0Y
 l7rBv9wJg3LVSXMKnQLsfRjiT3ZN38lsQIeduEoIET880wkCnOSLbfc29KY4fohJIVMwBL2x
 4s6W/n+Zmu1N9/qVKjDGkB3j7UVmi/awvKtrpC/CfECYn+ExkTFBgTWg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-iio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	William Breathitt Gray <wbg@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] counter: interrupt-cnt: Convert atomic_t -> atomic_long_t
Date: Mon, 31 Mar 2025 17:22:20 +0200
Message-ID: <20250331152222.2263776-1-alexander.sverdlin@siemens.com>
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

Convert the internal counter type to atomic_long_t, which:
- doesn't change much for existing in-tree users as they are 32-bit anyway
  (stm32/i.MX6)
- doesn't introduce performace penalty on 32-bit platforms
- provides 64-bit resolution on 64-bit platforms with virtually no
  preformance penalty

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/counter/interrupt-cnt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/counter/interrupt-cnt.c b/drivers/counter/interrupt-cnt.c
index 949598d51575a..8df5457b0a076 100644
--- a/drivers/counter/interrupt-cnt.c
+++ b/drivers/counter/interrupt-cnt.c
@@ -15,7 +15,7 @@
 #define INTERRUPT_CNT_NAME "interrupt-cnt"
 
 struct interrupt_cnt_priv {
-	atomic_t count;
+	atomic_long_t count;
 	struct gpio_desc *gpio;
 	int irq;
 	bool enabled;
@@ -29,7 +29,7 @@ static irqreturn_t interrupt_cnt_isr(int irq, void *dev_id)
 	struct counter_device *counter = dev_id;
 	struct interrupt_cnt_priv *priv = counter_priv(counter);
 
-	atomic_inc(&priv->count);
+	atomic_long_inc(&priv->count);
 
 	counter_push_event(counter, COUNTER_EVENT_CHANGE_OF_STATE, 0);
 
@@ -89,7 +89,7 @@ static int interrupt_cnt_read(struct counter_device *counter,
 {
 	struct interrupt_cnt_priv *priv = counter_priv(counter);
 
-	*val = atomic_read(&priv->count);
+	*val = atomic_long_read(&priv->count);
 
 	return 0;
 }
@@ -102,7 +102,7 @@ static int interrupt_cnt_write(struct counter_device *counter,
 	if (val != (typeof(priv->count.counter))val)
 		return -ERANGE;
 
-	atomic_set(&priv->count, val);
+	atomic_long_set(&priv->count, val);
 
 	return 0;
 }
-- 
2.49.0

