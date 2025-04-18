Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E06253F19
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745014387; cv=none; b=lY+ZGNeNX7M4oO3Ju2d03lfAMTN+dBPIj1jKoGGQ4icYG99NtL/ZAJMXcWpMedOzDxIjyXDapTwmwdiV5/raDOcNhDfOA8xaQvYmvw8xw/x/615xDlmc9N81i9UV2reB5kfgkmeQzslqDA8/9QLFaXLmCBOdy2fygk5UlprguYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745014387; c=relaxed/simple;
	bh=HbTA6+SIWtsx6p8fLoWBzXpmBqT7XUqskQU9DuFh/FE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cHKgrPv6/GbVMni4zB4zSsiNEzklt/mXmd3p6vnTUC/P9Xwj3z7m1E+UuoPp2Tbu18vOor71WlyszKVD06DdQuVqIlRxPgPmWO1AjK+ZMNcPS9ZVDfGxNmPaoG85GU3Rn5fP7KyNqdO3pCQFsjhXgzAw7MwpxAevzr8r64GI91g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kdEG33ff; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kdEG33ff"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22650077995so33454235ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745014385; x=1745619185; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0EmA7Upz+qHOtDwczVN9FS7m8URUS9IO0+ID1IaGMNU=;
        b=kdEG33ff3qAaumC965pp+Lt8yohfxsFWjDErOuX6Z1mGNjvDIWzgqlsIUckqVTJu+v
         /4W5NMjweWkAzSkRzLO7AbVLu+vvaUcL/TjvXU0udPT6uBpfvB0WFUeSmgpX482dfVXv
         CYUW3HJwnAygsBZ4eXgLo0/3jQP5E3ZShFjQSM78VCCGZmDusrzyFpTBEYMxA+d39k9q
         yU8v9u9MTFAxjo3hCtxhPLSzS4+I4mZwXuRvU/OWDg3HnNEgZ4fu1k9blgcSE3YwXKwW
         gpILSeFYySKJ7GUJcGXAPpPkvUbd0yVGV1IMvqtVA1WtqyDlLUcnuM8sXR1GUZa8l7zv
         vs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745014385; x=1745619185;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0EmA7Upz+qHOtDwczVN9FS7m8URUS9IO0+ID1IaGMNU=;
        b=HIljj323dKOfEaPIm7eLjCYMqe1C24bWgM2aE6Holl8cGy8VM3BimCwuSdK0WuQytS
         3aqU2F9u+qWR9ry5etMzZisXBMHnmRZ+bBq9/GhV3mWDS2faT7f9j6Qnz2aL+ya91bpU
         ahv9RyFW2z1687fzSRZriZH05Qll+d5SUM0s833eaOZtLnq+vVgLmf4hQUjOCiKJiCcm
         aR7E3XCidlee7b3TER+90PLydF777Lnpn3IUuJLrz7Hj/VmjdAXwikolEhWW2ZMpcC6h
         v9cq8UTpw4Y25D+qudAteWx8rwDt14ooQQIOjLOT+G3qGe1KWLFVrB18j/T+SZEyenRD
         RyUw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Q4+ngWVhzoDHgX9R7ow3P4+V9DvfKUgzGiYxS1oLYgczXlMQ5PuzJswItzZ2QnPO8BhTmW5l+whkSHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YynKdUMUvcWSh6qu0u1PnClgYPJG6CqzKWtqT52kps3vMJ/ItW5
	ShmR8li2iMJmHXQNr7o+ripYNwjcX5OHQjLOaedseli1FDYQ2ZsdlrDuMGYtO5hcy/zNN3wgcR9
	IWA9tKdv0zZj8RQcbsxVQkw==
X-Google-Smtp-Source: AGHT+IHeFwo6XZSRpHYdFnZUzLtRwDr2aNE4i+vS4FNv6MPSU+02tuDYkNMd44kkWhE2mPSdgmGVyfYVsz1iFPhVSA==
X-Received: from pjbkk11.prod.google.com ([2002:a17:90b:4a0b:b0:308:87dc:aa52])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2383:b0:21f:1549:a55a with SMTP id d9443c01a7336-22c5357a0femr67001545ad.1.1745014385253;
 Fri, 18 Apr 2025 15:13:05 -0700 (PDT)
Date: Fri, 18 Apr 2025 22:12:53 +0000
In-Reply-To: <20250418221254.112433-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250418221254.112433-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250418221254.112433-6-hramamurthy@google.com>
Subject: [PATCH net-next 5/6] gve: Add support for SIOC[GS]HWTSTAMP IOCTLs
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, jeroendb@google.com, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com, 
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com, 
	shailend@google.com, linux@treblig.org, thostet@google.com, 
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
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

Co-developed-by: Ziwei Xiao <ziweixiao@google.com>
Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: John Fraker <jfraker@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---
 drivers/net/ethernet/google/gve/gve.h         |  2 +
 .../net/ethernet/google/gve/gve_desc_dqo.h    |  3 +-
 drivers/net/ethernet/google/gve/gve_main.c    | 47 +++++++++++++++++++
 drivers/net/ethernet/google/gve/gve_rx_dqo.c  |  5 +-
 4 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve.h b/drivers/net/ethernet/google/gve/gve.h
index 5a141a8735d6..adf5117f5087 100644
--- a/drivers/net/ethernet/google/gve/gve.h
+++ b/drivers/net/ethernet/google/gve/gve.h
@@ -11,6 +11,7 @@
 #include <linux/dmapool.h>
 #include <linux/ethtool_netlink.h>
 #include <linux/netdevice.h>
+#include <linux/net_tstamp.h>
 #include <linux/pci.h>
 #include <linux/u64_stats_sync.h>
 #include <net/page_pool/helpers.h>
@@ -876,6 +877,7 @@ struct gve_priv {
 	struct workqueue_struct *gve_ts_wq;
 	bool nic_timestamp_supported;
 	struct delayed_work nic_ts_sync_task;
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
index 8aaac9101377..36d91eb004c3 100644
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
index 483d188d33ab..bad9e15cb934 100644
--- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
@@ -450,7 +450,7 @@ static void gve_rx_skb_hash(struct sk_buff *skb,
  * Note that this means if the time delta between packet reception and the last
  * clock read is greater than ~2 seconds, this will provide invalid results.
  */
-static void __maybe_unused gve_rx_skb_hwtstamp(struct gve_rx_ring *rx, u32 hwts)
+static void gve_rx_skb_hwtstamp(struct gve_rx_ring *rx, u32 hwts)
 {
 	s64 last_read = rx->gve->last_sync_nic_counter;
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
2.49.0.805.g082f7c87e0-goog

