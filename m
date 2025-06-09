Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482C621D3E2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494446; cv=none; b=FQH166Pr6RNvZnm553XZ0p6FZrgVuO8uYVWga8vfSuhtKcHWIM4D8ZyCzjnE0MJtapgzRyb0i/KrBwLjFLyQicwBdIY5oIWiKXIHmB3ojY7PaS+iMllYDa5Lx57M+Kx/NdysYutCeJfDNGPE49iVzaBw/zJooXV9RU6JeOi1VnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494446; c=relaxed/simple;
	bh=4cwREFEhKaRqBkvtlaxAg0eyGMWNAlSxckgSw0l971I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JuVRYPjB4xe6GtjI/NSCLHADBLDIh/TcwwgGEc5i2E0WZWGTQmfvEeCcv7u4XVvgAH9ckg/tuEwHZBUuO8MhVn5NnvDH2IN0mNXfNUwUAc8vUGLBq2KsvIC+1T/xjp3FmTjibht0cBx+3SLG8PGZ07KlVqIbPsmO57bB0GgFRKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gn5IqbCV; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gn5IqbCV"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3138c50d2a0so1553978a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749494445; x=1750099245; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gJiW8NlzSCXwpo24QX8sQwDPsajyfIq0Lkzz04mvv9A=;
        b=Gn5IqbCVrTJuzJTSjXZ7TptscasdA/OaJg8oXYQg0u/j0eA0uNz13AFkUsxOjS/Rha
         Vqg94AyeoBoOia8oQ9272tDSwtHTH/QE9wUGYwldFeB8x5M1oHK9SM+3hk+MTNvgi3AC
         gS4pfVoYCABIzhzaBpyWF6zfG3A+2eiLn7qrpIse3Z6p6ZNWboSZHh7hVFJAaGUoa6eH
         l48C7St6xxYXYEKBCUwdoRg0LMolhcfPMBlBh5Nll8s8UhxXliq7gUTXnmTarIhg3a8q
         yZAtKT4ELF0uxZv74lpwDQjC0xmRyBZI6AAgHTX95Yr0DBhQT3/3PPjLzgJJR1J7oMFk
         IfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494445; x=1750099245;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJiW8NlzSCXwpo24QX8sQwDPsajyfIq0Lkzz04mvv9A=;
        b=cxeVxnhIDetIXRSzwuE+rntSIewni1d3SfSfJiIj3Bn9PIr9KPQecJyBbU4rrEXfS5
         rTH8CKhR7Q1JRl0FEB4C50QEI3m2t02JfUZhN1fkRHjzq90YYJG1GUuASMKNcqbodVpo
         /VWAbsu7wKaXs6azfkqVbKBiicqTee0CfNlhedbArVwNZPVL8tcBoRmPIguffU6fEIAN
         lE9LT5e2lbfy2EsO5WC0Ik9J41mkTPrpzfo+J5ixGw21rqKLT6X4PhC7ewpVRD8CH+pA
         8DMRxekcT/ZqX9jEa9LbMwgj77wRMeZSD1IL1wkHvV83PSUcQOoHFcfat60LPPoFVuQ8
         L/Sw==
X-Forwarded-Encrypted: i=1; AJvYcCU4uCi9F9vlp6SHDh2SiPfsZCAACYr1cJ4Z/Mcg0dYxsyIVvGQphsxvLN5uBRbBL1buoH/taVOVIJ+DEnw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0lIiLYDNxlBPl2iRkvJY3qaYowcRgWQrcBV7N9EY1r8mUO+Vs
	a7eJOq+VUj+4qx/NCPM4mC+0fn9bp0Nv1eIAVlfCOZQjOGhqU3DB9JPNrraVnkzfVchAgfIg4jg
	2syXsNb1otFl51dFj7n0PkonmvQ==
X-Google-Smtp-Source: AGHT+IE+UmzCwfvFNIoSd5/fnZN5jMKsNc9b4ETH31hT6Ph1q9dwMRJK8rymAG4W6iK4kgtGihKL5SmSu341nuYVDg==
X-Received: from pjbnb8.prod.google.com ([2002:a17:90b:35c8:b0:311:ff32:a85d])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1b0e:b0:311:ff18:b83e with SMTP id 98e67ed59e1d1-31346b29b98mr21526112a91.9.1749494444669;
 Mon, 09 Jun 2025 11:40:44 -0700 (PDT)
Date: Mon,  9 Jun 2025 18:40:28 +0000
In-Reply-To: <20250609184029.2634345-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250609184029.2634345-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250609184029.2634345-8-hramamurthy@google.com>
Subject: [PATCH net-next v4 7/8] gve: Implement ndo_hwtstamp_get/set for RX timestamping
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

From: John Fraker <jfraker@google.com>

Implement ndo_hwtstamp_get/set to enable hardware RX timestamping,
providing support for SIOC[SG]HWTSTAMP IOCTLs. Included with this support
is the small change necessary to read the rx timestamp out of the rx
descriptor, now that timestamps start being enabled. The gve clock is
only used for hardware timestamps, so started when timestamps are
requested and stopped when not needed.

This version only supports RX hardware timestamping with the rx filter
HWTSTAMP_FILTER_ALL. If the user attempts to configure a more
restrictive filter, the filter will be set to HWTSTAMP_FILTER_ALL in the
returned structure.

Signed-off-by: John Fraker <jfraker@google.com>
Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---
 Changes in v3:
 - Update the title and commit message to show it's adding support for
   ndo functions instead of ioctls (Jakub Kicinski)
 - Utilize extack for error logging instead of dev_err (Jakub Kicinski)
---
 drivers/net/ethernet/google/gve/gve.h         |  2 +
 .../net/ethernet/google/gve/gve_desc_dqo.h    |  3 +-
 drivers/net/ethernet/google/gve/gve_main.c    | 47 +++++++++++++++++++
 drivers/net/ethernet/google/gve/gve_rx_dqo.c  |  5 +-
 4 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve.h b/drivers/net/ethernet/google/gve/gve.h
index 97054b272e40..a812612c52ba 100644
--- a/drivers/net/ethernet/google/gve/gve.h
+++ b/drivers/net/ethernet/google/gve/gve.h
@@ -11,6 +11,7 @@
 #include <linux/dmapool.h>
 #include <linux/ethtool_netlink.h>
 #include <linux/netdevice.h>
+#include <linux/net_tstamp.h>
 #include <linux/pci.h>
 #include <linux/ptp_clock_kernel.h>
 #include <linux/u64_stats_sync.h>
@@ -882,6 +883,7 @@ struct gve_priv {
 	/* True if the device supports reading the nic clock */
 	bool nic_timestamp_supported;
 	struct gve_ptp *ptp;
+	struct kernel_hwtstamp_config ts_config;
 	struct gve_nic_ts_report *nic_ts_report;
 	dma_addr_t nic_ts_report_bus;
 	u64 last_sync_nic_counter; /* Clock counter from last NIC TS report */
diff --git a/drivers/net/ethernet/google/gve/gve_desc_dqo.h b/drivers/net/ethernet/google/gve/gve_desc_dqo.h
index f79cd0591110..d17da841b5a0 100644
--- a/drivers/net/ethernet/google/gve/gve_desc_dqo.h
+++ b/drivers/net/ethernet/google/gve/gve_desc_dqo.h
@@ -247,7 +247,8 @@ struct gve_rx_compl_desc_dqo {
 	};
 	__le32 hash;
 	__le32 reserved6;
-	__le64 reserved7;
+	__le32 reserved7;
+	__le32 ts; /* timestamp in nanosecs */
 } __packed;
 
 static_assert(sizeof(struct gve_rx_compl_desc_dqo) == 32);
diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 7cd1eda0b449..fe34ccedc9df 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -721,6 +721,7 @@ static void gve_teardown_device_resources(struct gve_priv *priv)
 	gve_free_counter_array(priv);
 	gve_free_notify_blocks(priv);
 	gve_free_stats_report(priv);
+	gve_teardown_clock(priv);
 	gve_clear_device_resources_ok(priv);
 }
 
@@ -2041,6 +2042,47 @@ static int gve_set_features(struct net_device *netdev,
 	return err;
 }
 
+static int gve_get_ts_config(struct net_device *dev,
+			     struct kernel_hwtstamp_config *kernel_config)
+{
+	struct gve_priv *priv = netdev_priv(dev);
+
+	*kernel_config = priv->ts_config;
+	return 0;
+}
+
+static int gve_set_ts_config(struct net_device *dev,
+			     struct kernel_hwtstamp_config *kernel_config,
+			     struct netlink_ext_ack *extack)
+{
+	struct gve_priv *priv = netdev_priv(dev);
+	int err;
+
+	if (kernel_config->tx_type != HWTSTAMP_TX_OFF) {
+		NL_SET_ERR_MSG_MOD(extack, "TX timestamping is not supported");
+		return -ERANGE;
+	}
+
+	if (kernel_config->rx_filter != HWTSTAMP_FILTER_NONE) {
+		kernel_config->rx_filter = HWTSTAMP_FILTER_ALL;
+		if (!priv->nic_ts_report) {
+			err = gve_init_clock(priv);
+			if (err) {
+				NL_SET_ERR_MSG_MOD(extack,
+						   "Failed to initialize GVE clock");
+				kernel_config->rx_filter = HWTSTAMP_FILTER_NONE;
+				return err;
+			}
+		}
+	} else {
+		gve_teardown_clock(priv);
+	}
+
+	priv->ts_config.rx_filter = kernel_config->rx_filter;
+
+	return 0;
+}
+
 static const struct net_device_ops gve_netdev_ops = {
 	.ndo_start_xmit		=	gve_start_xmit,
 	.ndo_features_check	=	gve_features_check,
@@ -2052,6 +2094,8 @@ static const struct net_device_ops gve_netdev_ops = {
 	.ndo_bpf		=	gve_xdp,
 	.ndo_xdp_xmit		=	gve_xdp_xmit,
 	.ndo_xsk_wakeup		=	gve_xsk_wakeup,
+	.ndo_hwtstamp_get	=	gve_get_ts_config,
+	.ndo_hwtstamp_set	=	gve_set_ts_config,
 };
 
 static void gve_handle_status(struct gve_priv *priv, u32 status)
@@ -2271,6 +2315,9 @@ static int gve_init_priv(struct gve_priv *priv, bool skip_describe_device)
 		priv->rx_coalesce_usecs = GVE_RX_IRQ_RATELIMIT_US_DQO;
 	}
 
+	priv->ts_config.tx_type = HWTSTAMP_TX_OFF;
+	priv->ts_config.rx_filter = HWTSTAMP_FILTER_NONE;
+
 setup_device:
 	gve_set_netdev_xdp_features(priv);
 	err = gve_setup_device_resources(priv);
diff --git a/drivers/net/ethernet/google/gve/gve_rx_dqo.c b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
index 9aadf8435f8b..0be41a0cdd15 100644
--- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
@@ -450,7 +450,7 @@ static void gve_rx_skb_hash(struct sk_buff *skb,
  * Note that this means if the time delta between packet reception and the last
  * clock read is greater than ~2 seconds, this will provide invalid results.
  */
-static void __maybe_unused gve_rx_skb_hwtstamp(struct gve_rx_ring *rx, u32 hwts)
+static void gve_rx_skb_hwtstamp(struct gve_rx_ring *rx, u32 hwts)
 {
 	u64 last_read = READ_ONCE(rx->gve->last_sync_nic_counter);
 	struct sk_buff *skb = rx->ctx.skb_head;
@@ -790,6 +790,9 @@ static int gve_rx_complete_skb(struct gve_rx_ring *rx, struct napi_struct *napi,
 	if (feat & NETIF_F_RXCSUM)
 		gve_rx_skb_csum(rx->ctx.skb_head, desc, ptype);
 
+	if (rx->gve->ts_config.rx_filter == HWTSTAMP_FILTER_ALL)
+		gve_rx_skb_hwtstamp(rx, le32_to_cpu(desc->ts));
+
 	/* RSC packets must set gso_size otherwise the TCP stack will complain
 	 * that packets are larger than MTU.
 	 */
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

