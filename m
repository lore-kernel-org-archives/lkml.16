Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948DBDDC5
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749859686; cv=none; b=SqiZ5VDPbK/0yh3aWT2Ts3+4goiUBTUb7yhBaplADIPi4XOD7sW69VH0aaFP4PznV9d2xIeJ1331Yoi0ewh/Z3u355J5xhtJ4RwOuOXGqKxv1+uc8tQQAQtRYrkrq1OfTx6KsgGm+k+qEOn9YmCaGqBJuySYkqqAOtz4ldBYeqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749859686; c=relaxed/simple;
	bh=pLjhrObaR9N0zjGFgr3k9jRR+RC6X8HEOHYtL4ee1aI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N1QoRYNbjBwEJvi4is61Q5dWNAjqE3tRJuxe/UVNi4ZP97nywknf8HAIHTzQU1hlo6xwYO8hw1WwSrTVUY4v1dXYvulFug96ed/akwLncowj+Di1ljD1D9Caves3Frfm4K1oVIEq1mz33NOj7D9wGYQNNSF8whSaXtkTlocK88g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W7IgJHXB; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W7IgJHXB"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7394772635dso1970636b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749859684; x=1750464484; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4bRKwXapV/LkqDR7teX/V+SUCZ5y1LxKBwjeCDLqPcA=;
        b=W7IgJHXBner2fIPKteCh1iCDEg1YmEYZUDdPL6w73jd/1sBl73iKnspFiIT76VXgRf
         8SQ/WSLWUQ1UpdTsb+qWraPnu61YeE0SCdTIPVllkeWFKjHSmyThRYv78G8xAbJhziOH
         HOjAfdEPd05pL0hG0mSovtSiV12tnw2oUpWwBoGo8hCMyS/kD5hVGB8pN6cRVwsQ8pAY
         q1XT6x3xlY9nCeAIZQ0LFMS2Skyyz0tSMbPeyQ9MOGdEI27yTsCiM+MNZx1epVkg934E
         gBd8Myo7iS3bb7RiGeNNH9geVfBZNXEliKWs1b9/jqC4hXpQ7Z1v4RY0G5vgdGPFSiaQ
         cx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749859684; x=1750464484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4bRKwXapV/LkqDR7teX/V+SUCZ5y1LxKBwjeCDLqPcA=;
        b=U0pkRuD0OFzFPAAwegQcEfmzidfO7bA0QY0Y16OLstLXUR21g5EotZdGPbrfDXjLqe
         ItNGNOoPRPFxCdFEgRz6DQfSRtLOnuf2K4pCl/urxjhJT7iRd2WuD1qcgrAHCVvvAB98
         p0eRljyVPQJPTCZFCwREMCXpFQ8IE66iuWfPTZ1wR57WVaHLfq3p4jnnhUbSe1jpnBb8
         I+JiM68rpcGBq9jKu73EbLvdPx1tz+Y6mkDrO2KJHZ8FjxTli2wjC6jqkXtoCRNjvJf7
         tQAl+p7x7rIL/GoXVDKEhJ90vIlJcYmJRqVim2A6Rej/Z/uqFG83dHOlUtdp0GDK+S+O
         PpcA==
X-Forwarded-Encrypted: i=1; AJvYcCW1JiLZjHJCIPXM6Lo+bjWeJvWTRpSv+2vmLNxz/jnNoxq8yEsJVWOyczy7zyjDSGExu4tesgLP277oaJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YweJI78mpGAr5CC3nnd68IF0E/x4PV7XQIto+WyzKHP0qhT6pOB
	TVf2D+9vQbWdZo1+WMDUYL6PrJFJet6x019m1eC55TaH7Lp1BV1YGxk5E1P/kq55zeAZD2Xm5hY
	FRv80vAz911jBiTXzB5xQnLyVIA==
X-Google-Smtp-Source: AGHT+IGXeHydSKv4iruMl5xRsM+87KtLEvkr7om2GpOTki55LTg7OJ8W9AG/XCgTLH1JIoB3ZwVwrCmo1mcwLO+Wmg==
X-Received: from pfbgh9.prod.google.com ([2002:a05:6a00:6389:b0:747:b682:5cc0])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1142:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-7489d050d66mr1392625b3a.22.1749859683941;
 Fri, 13 Jun 2025 17:08:03 -0700 (PDT)
Date: Sat, 14 Jun 2025 00:07:49 +0000
In-Reply-To: <20250614000754.164827-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250614000754.164827-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250614000754.164827-4-hramamurthy@google.com>
Subject: [PATCH net-next v5 3/8] gve: Add initial PTP device support
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
2.50.0.rc1.591.g9c95f17f64-goog

