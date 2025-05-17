Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE3435947
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 00:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747440692; cv=none; b=m6eVw3Xx9nt48guBAqy7y2ATuThTPeR310XR6wcMU3fMkg40gYmbG9Xl7+TlbmJyKNdd1Fo+qU1+xkoxmR+J90Bl9DzVIRswbXNDhVhuF9oc+c+cGRMgW81jBnLXwuxS97Lq3HJcS1aVj1whK2UuzivZR1Zo4A6npsqf712zhNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747440692; c=relaxed/simple;
	bh=Ln67e2fXdHeRD0QQX4x4O0sduhktMs8m3jcBjEN8FE0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mktW1voPoaGBJZi//4k9fpERGc6cGguJ1O9oEnyTqsU2PmUYlu2g6a0l87fjDXvcDKSn6Y2wiJpDJ+ElbKjpc7gEAgqYmpVXzYeDYA3xZUnv2tWNhibV2mrQoWRCEQ3V340iKbztn78ubC+bSvDtnKRPKxOhCc4K2wSzFfbl4gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rgClfQfq; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rgClfQfq"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b269789425bso2740917a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747440690; x=1748045490; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr/dcsS88YzwpSwebtUZRVO7/ET/zcv+hWMSHe2dz5w=;
        b=rgClfQfqNO9jyAVS/mwQ6nrdQy6MmhD9hUVj/NapFRpovx2ws9WI72uo0mpJQp0h2j
         Jue0nIp1CRRz7sd7awSNgMLhboGg9YJYcYRFCTg8BLiac6AKXkklAY5mVIRF3OpsUQ6g
         cT5Ev4P9M3jNDY8ku0GiTJuOHZuwmegDwMgncAG7+cLQbDG7hTRKBDueqR75+FshFdYR
         Pu+MZLSUq2BxrEo9vmaESArm08PdADej0qP4cEL/z13ip9vbQ+RgloqxLWr/JktdZBLB
         //K7HB32ChXncWXlqTu3/8OdL+5bYeK8K7aZQGp19PblkLuohN4x8tq1C9aIDH5uugRY
         VkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747440690; x=1748045490;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr/dcsS88YzwpSwebtUZRVO7/ET/zcv+hWMSHe2dz5w=;
        b=UNdDSYz3+jG1hZnBpeJ/yYG1iyZFWONy2HgVvPEyKYzN8dT9XIpLYuf7kdMB5AuBeX
         0GRjm1LZ2S7qVwinluVo+w7+FM502WXFfLVZPx/l52xpwiQVSGcxDP/thJMvApZbdDcv
         3Pi1KcganDLIbI7k79ih1k9sP8hqLAC7jFUuJU7EXNVC6wscLpQG9inLUgETKeH84CuF
         23GcTN02BpLuDjiWRCej9jK44YoR8Jn+xYtrkCqtbh0ijLr+fLF3abmNsZ5x0jY5Ss3c
         CwN/EhgoF1erpqGitzz1pcGIlCT7BI0N2YvxKT5mbelffW+nnHrKfx26CBWpNmkzpbzA
         Fnmw==
X-Forwarded-Encrypted: i=1; AJvYcCVXXrrFGUAQFexFYvnEi3wk7+IiHBcrtMRGZB8PkSJy0SKV+RXC08vSOL7mucoWTyTuru6UPCQ/FyEvwF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEngReCThFHBH6bIuarP4XVllYxFePqyIOgqh3C6X6zJ7bSL0m
	r6ebfTOuQ6hbtFQjw0hVfEThn+ekLLuw8zcew9DiB09zK0lfOQb9/UxDilIT5xH8+g35f7UMe0m
	pSp7DJmAs4aJaEckIEzkhmcCzrg==
X-Google-Smtp-Source: AGHT+IEN40QpGn9u5LekkCRqv9FmXtRYXCG9Bz3e/b18f0K/Mhkbd7WLCZvTIirTXcfs8oSd/4a4OrI6ZsTegAU7mA==
X-Received: from pfdf22.prod.google.com ([2002:aa7:8b16:0:b0:742:a71a:ea85])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:12c3:b0:216:1476:f54 with SMTP id adf61e73a8af0-216219ee254mr7877863637.38.1747440690340;
 Fri, 16 May 2025 17:11:30 -0700 (PDT)
Date: Sat, 17 May 2025 00:11:09 +0000
In-Reply-To: <20250517001110.183077-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517001110.183077-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250517001110.183077-8-hramamurthy@google.com>
Subject: [PATCH net-next v2 7/8] gve: Add support for SIOC[GS]HWTSTAMP IOCTLs
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

Add support for the SIOCSHWTSTAMP and SIOCGHWTSTAMP IOCTL methods using
gve_get_ts_config and gve_set_ts_config. Included with this support is
the small change necessary to read the rx timestamp out of the rx
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
index e1ffbd561fac..b5234ef9c6a0 100644
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
+		dev_err(&priv->pdev->dev, "TX timestamping is not supported\n");
+		return -ERANGE;
+	}
+
+	if (kernel_config->rx_filter != HWTSTAMP_FILTER_NONE) {
+		kernel_config->rx_filter = HWTSTAMP_FILTER_ALL;
+		if (!priv->nic_ts_report) {
+			err = gve_init_clock(priv);
+			if (err) {
+				dev_err(&priv->pdev->dev,
+					"Failed to initialize GVE clock\n");
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
index c03c3741e0d4..15d3c414b33c 100644
--- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
@@ -450,7 +450,7 @@ static void gve_rx_skb_hash(struct sk_buff *skb,
  * Note that this means if the time delta between packet reception and the last
  * clock read is greater than ~2 seconds, this will provide invalid results.
  */
-static void __maybe_unused gve_rx_skb_hwtstamp(struct gve_rx_ring *rx, u32 hwts)
+static void gve_rx_skb_hwtstamp(struct gve_rx_ring *rx, u32 hwts)
 {
 	s64 last_read = READ_ONCE(rx->gve->last_sync_nic_counter);
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
2.49.0.1112.g889b7c5bd8-goog

