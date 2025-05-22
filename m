Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5D624DCE8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747958267; cv=none; b=ia++7yoQg+IykQxazIxhGKQ6wSaSoGjDE7tzh4eYTrXqWgdL9oxhEUlT52uuxx3mznNT15R00U7jLyoHM5DYadgNAn9Lu14sHxzvgNBic8j1JhrCEeV/UWzKWyQb8+jTTBuN+JPJPYhWY5MJHIDmvLYs0sfuDkyTXpaI08ue2Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747958267; c=relaxed/simple;
	bh=/d1wmfmY/H2ZGTSo9UGf2XcEy9s/ROiMcqO2TlSq5CQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MNioGI9Jm2332COLaHwmx6XPd0qiv0Kw2je2UV/vTAqR5Pk/GGNR3hsay3XI8kqcJ5rwE6mNugyc48x6o5BfFS/7WiXPtQdOEfZ4yqU6mWG4Z3Lm1QkK0UbkCEprIKw4ki2ecmR/eeSNJXVKt9wTF0VvUMwcKR6evVIJQHARiU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZEWh/Cp7; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZEWh/Cp7"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-74089884644so7537339b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747958265; x=1748563065; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m3lfvrPJ0AXxA1NVOjRkYI+TzJFJEUDkaJgP2lifyhg=;
        b=ZEWh/Cp7g5EYZQk3C4eFimQxcXu6sT4dn+T+LjTUuENy+qjEo5kJ20XrbGhtM6o74s
         vJ3m4mr8wQ3mwEiFC8Fha92j+g7F7GUhLLp80lNugKYcxy/1f/up8m4UxGT0JhsPFgRl
         w+rKsj3UKUeYnSwSVXvr+Zv1lGMMDfVojHK7hMgAuRcVZWKnKFCLlc+PLnIKG4dlaD/m
         12GWR+uOUDGzEwY6gT16h/dcIkxFkxS3x+wEpZ87mbwWhlEkF4T7mJOlqwRuAlZ44ugD
         wP3RC5BZlIoyP1UWFYB893kLiPBXNJTvWCzYm9d2Uhp5rh+Bbvk529Ce4Z+stGSKmAc4
         cRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747958265; x=1748563065;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3lfvrPJ0AXxA1NVOjRkYI+TzJFJEUDkaJgP2lifyhg=;
        b=WGAygpJgOiYmsk8XlB2Hef9P0maYvzaodJMATZzwYnKCm9zwHyCb/myPDY1ckWNA5p
         teTZReCSPZAEIKkvj3FOSlo+jPMzm/b+uTjuJxJyVcD3EICKvI2xemymd2VVAAGSyFs6
         OQrAhYgLC3w2lG2vq444QO6aC/C3NhdMkPSk21wvhxvdc5ntDIbhjnWpvW9DNV7l5iEx
         xpP2yy3Jw1uKbgQ/XtB7tnE5DWqdUyaEVPAglFVoBaPHosEtySQuquePfm3B0Al/BkhB
         8w2CFyTubUXOENlR1cXey/343mJn7TDv0PC0/tjcTB+ReG8cKVZI4PhuNkHrSYfbg0J1
         REHA==
X-Forwarded-Encrypted: i=1; AJvYcCX++RNAyCM/jk1WvBvOgSfLOrgeFhf63PArDWo0jeqy6sAvqVFXTlJr59YHLcnNNn+9KDJUnX87gORsZSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTpsKp11AmITXaMUZ3363L7Ef4hg+kz/ktomxFlwnc/VszL9wn
	h/ETsZHobZKai51wr/PsPBVHqRCZzFfBw39VbczsHaCF/bKdhFpGKDWF8A0UxOXrOI17Y7MpLcC
	s6vkiViLsbfHFCqMiK4Q7rZWR3A==
X-Google-Smtp-Source: AGHT+IFyQmLu0B+sReid8v2Gzfs5xGL7Y5gVFJhFAppmYxeZxmGUm/kaohdm2+eedhxluTWc+13DhQfworWepJuK/Q==
X-Received: from pfus6.prod.google.com ([2002:a05:6a00:8c6:b0:736:a134:94ad])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:66d8:b0:740:9d6b:db1a with SMTP id d2e1a72fcca58-742acd507ccmr31565135b3a.15.1747958265417;
 Thu, 22 May 2025 16:57:45 -0700 (PDT)
Date: Thu, 22 May 2025 23:57:32 +0000
In-Reply-To: <20250522235737.1925605-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522235737.1925605-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235737.1925605-4-hramamurthy@google.com>
Subject: [PATCH net-next v3 3/8] gve: Add initial PTP device support
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
2.49.0.1143.g0be31eac6b-goog

