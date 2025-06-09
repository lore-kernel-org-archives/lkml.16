Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A4621FF23
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494440; cv=none; b=G+xRBRMasXsfnguKUOOs4uUsXt7jdcnN1s+5fUQVqizFt7jKN5W+vu10DSlAqEvCCmYy4WznAoGxp0eSma4Cz4+YNyHzXQ3+J9L4Ej38emartW+/voXW9PEC6AHDIkL3PT80nYFOYmGzGv9YRv769lOhUcehQuXfsF1pfVGPTbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494440; c=relaxed/simple;
	bh=p2+++y3iHclFNlQ927Q3Se5dn3Uyz9UkBJ7sepJ6Fqk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FLGwRPqweHar/BvQCXwomdoC7p4y5tA8twrhZCNF83/PRG8nPjHk8i7nq8ggZsGy7Vk+Gq2NTPxTa8YfnDYpk3PnA5JAyaRTrloX7Zhfibi7MRxERPxbr+PVBrOoSDAfuGh2B4FJP1bG5t/UrkdlhcvIsABXWOzYpkc8Xzd5m/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FLESQLN7; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FLESQLN7"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-235e3f93687so72335945ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749494438; x=1750099238; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5dRqLM3ld49DYouGOATOb6C0m+lQfx0X1CvE19/m2NQ=;
        b=FLESQLN7yJTMr+Gwphg6474oe1wc8CXM2KxOZl1ccn83q0zgZxXf85Mo60Q+DUT3v6
         CXmGL6svLtRP/1X0uLbyehdTMZqQN+OAKBImn5+cw6Sam/iaI77K4s3qnVW2loF/f1At
         VlRJSkjWGhH/Uz9Ygu9v+q5KPvO73HrDlzxR8PhunWHEiQ565X4VPE/te/qAnWHF6L5j
         9ngT0fhOvyxLBw//qhOhKI2zDdjNYw1zlAuHwORKEdb82FOJinQkxOep8xhqZDHJFnfr
         J6uzOcevWSHjs4VWJvmPfEfPRCZSt2lAjLRM34mUc2jdOZCl+NZOT/JIO9VHoQKOLWgt
         QE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494438; x=1750099238;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dRqLM3ld49DYouGOATOb6C0m+lQfx0X1CvE19/m2NQ=;
        b=BQFWkh4HzQ8g5tUnVr0nNZKahvzOTxZcNaPy6onreUquhOU/tich5a0Waqm12rt7Js
         0wYjtnK8/8K2z7ticI5RcN2YG6eMgSHO60uKybeaffsrDDa65vL3QsWTP+Mkjpyr17yS
         b9Zj1nefKYQxXuDz2B6CuAKrCKNhPV07spqbFJD0VYtSb7Z9D/b/Khf0Fui+P0kSQj5v
         mAwX124zXUImuzzVqNgYG2yyT8YDSvdr8A/dq9fK0cSR86iK9WXSU3jQI49YE/Z7Zz8d
         opKUOIepH5JPKovrxiBRv1cfs7WbbkUimQD1HSF/s3hmjnGJ0q2onzmWAgnLUTdkmcLD
         HP4A==
X-Forwarded-Encrypted: i=1; AJvYcCWTrk3A+x+XHC73+obIhEZGd1m5g2i1v7TCHGIFFPHjyfkkBs8pMW+U4sO2fVeaC3Xn9wDtERyvB3EZQW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4KbYbMrG2TUdwwyPVrLsr3gxrOFno0Gt9S4kyPkFZ5CeZZeqa
	d5jjl+etuc08bWHXbMqLfM6Ov7QA3MjW/jRYx7RPRqZJAj+A8BuktqdIGECP+m6C9A+yr3ArftP
	HuYQ7tLGcvbodAM+a2y3T2+PmqQ==
X-Google-Smtp-Source: AGHT+IH3t6UcJaY69UpI3hQC8DzIL6jD4ZPwkG36z/REKzJQsYF9rtLf9JyfsEDKsI6POhmWpw2dmjk0HWy4p2exfA==
X-Received: from plpj8.prod.google.com ([2002:a17:903:3d88:b0:234:9673:1d13])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce05:b0:235:ef67:b595 with SMTP id d9443c01a7336-23601d710bamr231474245ad.35.1749494438080;
 Mon, 09 Jun 2025 11:40:38 -0700 (PDT)
Date: Mon,  9 Jun 2025 18:40:24 +0000
In-Reply-To: <20250609184029.2634345-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250609184029.2634345-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250609184029.2634345-4-hramamurthy@google.com>
Subject: [PATCH net-next v4 3/8] gve: Add initial PTP device support
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, jeroendb@google.com, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com, 
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com, 
	shailend@google.com, linux@treblig.org, thostet@google.com, 
	jfraker@google.com, richardcochran@gmail.com, jdamato@fastly.com, 
	vadim.fedorenko@linux.dev, horms@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If the device supports reading of the nic clock, add support
to initialize and register the PTP clock.

Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---
 drivers/net/ethernet/google/Kconfig       |  1 +
 drivers/net/ethernet/google/gve/Makefile  |  4 +-
 drivers/net/ethernet/google/gve/gve.h     |  8 +++
 drivers/net/ethernet/google/gve/gve_ptp.c | 59 +++++++++++++++++++++++
 4 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/google/gve/gve_ptp.c

diff --git a/drivers/net/ethernet/google/Kconfig b/drivers/net/ethernet/google/Kconfig
index 564862a57124..14c9431e15e5 100644
--- a/drivers/net/ethernet/google/Kconfig
+++ b/drivers/net/ethernet/google/Kconfig
@@ -18,6 +18,7 @@ if NET_VENDOR_GOOGLE
 config GVE
 	tristate "Google Virtual NIC (gVNIC) support"
 	depends on (PCI_MSI && (X86 || CPU_LITTLE_ENDIAN))
+	depends on PTP_1588_CLOCK_OPTIONAL
 	select PAGE_POOL
 	help
 	  This driver supports Google Virtual NIC (gVNIC)"
diff --git a/drivers/net/ethernet/google/gve/Makefile b/drivers/net/ethernet/google/gve/Makefile
index 4520f1c07a63..e0ec227a50f7 100644
--- a/drivers/net/ethernet/google/gve/Makefile
+++ b/drivers/net/ethernet/google/gve/Makefile
@@ -1,5 +1,7 @@
 # Makefile for the Google virtual Ethernet (gve) driver
 
 obj-$(CONFIG_GVE) += gve.o
-gve-objs := gve_main.o gve_tx.o gve_tx_dqo.o gve_rx.o gve_rx_dqo.o gve_ethtool.o gve_adminq.o gve_utils.o gve_flow_rule.o \
+gve-y := gve_main.o gve_tx.o gve_tx_dqo.o gve_rx.o gve_rx_dqo.o gve_ethtool.o gve_adminq.o gve_utils.o gve_flow_rule.o \
 	    gve_buffer_mgmt_dqo.o
+
+gve-$(CONFIG_PTP_1588_CLOCK) += gve_ptp.o
diff --git a/drivers/net/ethernet/google/gve/gve.h b/drivers/net/ethernet/google/gve/gve.h
index cf6947731a9b..8d2aa654fd4c 100644
--- a/drivers/net/ethernet/google/gve/gve.h
+++ b/drivers/net/ethernet/google/gve/gve.h
@@ -12,6 +12,7 @@
 #include <linux/ethtool_netlink.h>
 #include <linux/netdevice.h>
 #include <linux/pci.h>
+#include <linux/ptp_clock_kernel.h>
 #include <linux/u64_stats_sync.h>
 #include <net/page_pool/helpers.h>
 #include <net/xdp.h>
@@ -750,6 +751,12 @@ struct gve_rss_config {
 	u32 *hash_lut;
 };
 
+struct gve_ptp {
+	struct ptp_clock_info info;
+	struct ptp_clock *clock;
+	struct gve_priv *priv;
+};
+
 struct gve_priv {
 	struct net_device *dev;
 	struct gve_tx_ring *tx; /* array of tx_cfg.num_queues */
@@ -874,6 +881,7 @@ struct gve_priv {
 
 	/* True if the device supports reading the nic clock */
 	bool nic_timestamp_supported;
+	struct gve_ptp *ptp;
 };
 
 enum gve_service_task_flags_bit {
diff --git a/drivers/net/ethernet/google/gve/gve_ptp.c b/drivers/net/ethernet/google/gve/gve_ptp.c
new file mode 100644
index 000000000000..293f8dd49afe
--- /dev/null
+++ b/drivers/net/ethernet/google/gve/gve_ptp.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Google virtual Ethernet (gve) driver
+ *
+ * Copyright (C) 2025 Google LLC
+ */
+
+#include "gve.h"
+
+static const struct ptp_clock_info gve_ptp_caps = {
+	.owner          = THIS_MODULE,
+	.name		= "gve clock",
+};
+
+static int __maybe_unused gve_ptp_init(struct gve_priv *priv)
+{
+	struct gve_ptp *ptp;
+	int err;
+
+	if (!priv->nic_timestamp_supported) {
+		dev_dbg(&priv->pdev->dev, "Device does not support PTP\n");
+		return -EOPNOTSUPP;
+	}
+
+	priv->ptp = kzalloc(sizeof(*priv->ptp), GFP_KERNEL);
+	if (!priv->ptp)
+		return -ENOMEM;
+
+	ptp = priv->ptp;
+	ptp->info = gve_ptp_caps;
+	ptp->clock = ptp_clock_register(&ptp->info, &priv->pdev->dev);
+
+	if (IS_ERR(ptp->clock)) {
+		dev_err(&priv->pdev->dev, "PTP clock registration failed\n");
+		err  = PTR_ERR(ptp->clock);
+		goto free_ptp;
+	}
+
+	ptp->priv = priv;
+	return 0;
+
+free_ptp:
+	kfree(ptp);
+	priv->ptp = NULL;
+	return err;
+}
+
+static void __maybe_unused gve_ptp_release(struct gve_priv *priv)
+{
+	struct gve_ptp *ptp = priv->ptp;
+
+	if (!ptp)
+		return;
+
+	if (ptp->clock)
+		ptp_clock_unregister(ptp->clock);
+
+	kfree(ptp);
+	priv->ptp = NULL;
+}
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

