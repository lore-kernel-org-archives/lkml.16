Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E4F10F9
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 00:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747440689; cv=none; b=jziFpenM2sYGm9Jaep3ZBO6oj/IyKGNcRYmUn2mzZP2TMgnckcW2Sn73a/1Cs/VjmKbLhdmmgJscLrDRt7lqm1I2PZYmuXdWgLtJmg7mKC6Wl3CJojdoqUHjp/gERSJiXMs4tky0HXhzxx0/XE+Ym5KmUQoNwvJzhP7FG1pYqlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747440689; c=relaxed/simple;
	bh=AhXgpM261VQpIZoxXtPxuaDrw2Ht6vwOSCzEBx5Niag=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=REAW3/ouuxpCB6iBVtq6KXVi248iy8649m92v0LTBhuxc2zKSwyikupWaEIek9wLToKAqmA9pkcDBQOKBA9Zi2vEhmOM8RloGUdX35Ef6cIRnCfK9KmYoxyXLOOKJPQU+nz45DMYe4CR3LqijOCa9kHynd5U8oGnWgpoJsHreWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gb5YiiQj; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gb5YiiQj"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7370e73f690so3067593b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747440687; x=1748045487; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Z8KqdOIkNMJPBrFgrV7WmG9+iQCivyieWnYdeOcses=;
        b=gb5YiiQjuNT6i+FVg9+kJ8JVFsSs+HGveKWwz51c6rMUSWfUhpBVViFEvA+eJpKIUJ
         kPSBac0RD7tjaAHn+X6IiCGzAlTHMYeNEhi9rByA64oj+5QjCqSBj40UukPf7vmPfZHm
         OOd+XmRX9Gafi+SQXyQARx3ASRoOH7c/aOS1lxFpnHLKQUfTFqBANWMzHRmlT9s8WLaw
         JQt9nEJbAi/PWtnPGAEzwZFVfzzH34pVjWsbtYUWW2RNx9Wn6D/8d+u3OnNbUFE+APVA
         QAgF4yTlzu2UKV8DmItBU3X+Ld6hG2qaJRdY59TkEzuEfCDO7T6qHVR+dqI7bvmpTA2D
         AOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747440687; x=1748045487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Z8KqdOIkNMJPBrFgrV7WmG9+iQCivyieWnYdeOcses=;
        b=JDD1LicLngzdC8LJhEav7HhzBBLMCbL68jte4tNzqlCPOs17ho4tC6X7pajhMa8B/T
         tXXVkqDeKgbu0Niy/yb928md07RSvVpq5/bgCira9vYKsg5M/Re8hSZOGX8tC4eNcYrS
         pIRxwjGyU0fhF/5bdgidK24LUt5d0OxTmw2Ys94vcyalzoFeV3UX5HZPviRK/yqshzaP
         mOyOpbsHYsI8nHQHh0MwUja1MMR6ZH5Utt3DhXTb34UIA2I7bfjXj6Ep/g0hmZ4XtaJF
         jlUcLpwu/KfW8zRYMhOOBN54hB0+NGputqMRFHS6BjUWL0te0fWa8zSOkS0un2SsCDIJ
         EVBA==
X-Forwarded-Encrypted: i=1; AJvYcCWm3dc/4K6Ro0pxcr55Rb9uqu05HJtfszNvW25FSs86UIujI8WGXds/TXOitdZlCkGLGIIJEuBf+wTHTNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcQgat9R/xu8m9A6qFMX1GxxJ4qdSK/paPnzi9JpQdUBkGvQuh
	FGszPncyJ0UZa350JsoAIPecrsDkZe7KOzFBF18me6qpDbETNVM9omRNd6hZaGFnYbd5pudvf9y
	5a9ApRaJyvtrdK7JBqgzs3iD47w==
X-Google-Smtp-Source: AGHT+IGE9S++s+pBNwGLi0OLLvvNq+88AHD4qXWXzRJzGAGWMrh7HuTC9VrqmZeW50Y5M0eRiwC+Oo7248yvwXi1CQ==
X-Received: from pfbdf3.prod.google.com ([2002:a05:6a00:4703:b0:740:b399:3042])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:91d4:b0:736:457b:9858 with SMTP id d2e1a72fcca58-742a97c9d2bmr6246707b3a.10.1747440687165;
 Fri, 16 May 2025 17:11:27 -0700 (PDT)
Date: Sat, 17 May 2025 00:11:07 +0000
In-Reply-To: <20250517001110.183077-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517001110.183077-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250517001110.183077-6-hramamurthy@google.com>
Subject: [PATCH net-next v2 5/8] gve: Add support to query the nic clock
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

From: Kevin Yang <yyd@google.com>

Query the nic clock and store the results. The timestamp delivered
in descriptors has a wraparound time of ~4 seconds so 250ms is chosen
as the sync cadence to provide a balance between performance, and
drift potential when we do start associating host time and nic time.

Leverage PTP's aux_work to query the nic clock periodically.

Signed-off-by: Kevin Yang <yyd@google.com>
Signed-off-by: John Fraker <jfraker@google.com>
Signed-off-by: Tim Hostetler <thostet@google.com>
Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---
 Changes in v2:
 - Utilize the ptp's aux_work instead of delayed_work (Jakub Kicinski,
   Vadim Fedorenko)
---
 drivers/net/ethernet/google/gve/gve.h     | 15 +++++
 drivers/net/ethernet/google/gve/gve_ptp.c | 77 ++++++++++++++++++++++-
 2 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve.h b/drivers/net/ethernet/google/gve/gve.h
index 8d2aa654fd4c..97054b272e40 100644
--- a/drivers/net/ethernet/google/gve/gve.h
+++ b/drivers/net/ethernet/google/gve/gve.h
@@ -882,6 +882,9 @@ struct gve_priv {
 	/* True if the device supports reading the nic clock */
 	bool nic_timestamp_supported;
 	struct gve_ptp *ptp;
+	struct gve_nic_ts_report *nic_ts_report;
+	dma_addr_t nic_ts_report_bus;
+	u64 last_sync_nic_counter; /* Clock counter from last NIC TS report */
 };
 
 enum gve_service_task_flags_bit {
@@ -1261,6 +1264,18 @@ int gve_del_flow_rule(struct gve_priv *priv, struct ethtool_rxnfc *cmd);
 int gve_flow_rules_reset(struct gve_priv *priv);
 /* RSS config */
 int gve_init_rss_config(struct gve_priv *priv, u16 num_queues);
+/* PTP and timestamping */
+#if IS_ENABLED(CONFIG_PTP_1588_CLOCK)
+int gve_init_clock(struct gve_priv *priv);
+void gve_teardown_clock(struct gve_priv *priv);
+#else /* CONFIG_PTP_1588_CLOCK */
+static inline int gve_init_clock(struct gve_priv *priv)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void gve_teardown_clock(struct gve_priv *priv) { }
+#endif /* CONFIG_PTP_1588_CLOCK */
 /* report stats handling */
 void gve_handle_report_stats(struct gve_priv *priv);
 /* exported by ethtool.c */
diff --git a/drivers/net/ethernet/google/gve/gve_ptp.c b/drivers/net/ethernet/google/gve/gve_ptp.c
index 293f8dd49afe..b6e18ad20fa9 100644
--- a/drivers/net/ethernet/google/gve/gve_ptp.c
+++ b/drivers/net/ethernet/google/gve/gve_ptp.c
@@ -5,13 +5,52 @@
  */
 
 #include "gve.h"
+#include "gve_adminq.h"
+
+/* Interval to schedule a nic timestamp calibration, 250ms. */
+#define GVE_NIC_TS_SYNC_INTERVAL_MS 250
+
+/* Read the nic timestamp from hardware via the admin queue. */
+static int gve_clock_nic_ts_read(struct gve_priv *priv)
+{
+	u64 nic_raw;
+	int err;
+
+	err = gve_adminq_report_nic_ts(priv, priv->nic_ts_report_bus);
+	if (err)
+		return err;
+
+	nic_raw = be64_to_cpu(priv->nic_ts_report->nic_timestamp);
+	WRITE_ONCE(priv->last_sync_nic_counter, nic_raw);
+
+	return 0;
+}
+
+static long gve_ptp_do_aux_work(struct ptp_clock_info *info)
+{
+	const struct gve_ptp *ptp = container_of(info, struct gve_ptp, info);
+	struct gve_priv *priv = ptp->priv;
+	int err;
+
+	if (gve_get_reset_in_progress(priv) || !gve_get_admin_queue_ok(priv))
+		goto out;
+
+	err = gve_clock_nic_ts_read(priv);
+	if (err && net_ratelimit())
+		dev_err(&priv->pdev->dev,
+			"%s read err %d\n", __func__, err);
+
+out:
+	return msecs_to_jiffies(GVE_NIC_TS_SYNC_INTERVAL_MS);
+}
 
 static const struct ptp_clock_info gve_ptp_caps = {
 	.owner          = THIS_MODULE,
 	.name		= "gve clock",
+	.do_aux_work	= gve_ptp_do_aux_work,
 };
 
-static int __maybe_unused gve_ptp_init(struct gve_priv *priv)
+static int gve_ptp_init(struct gve_priv *priv)
 {
 	struct gve_ptp *ptp;
 	int err;
@@ -44,7 +83,29 @@ static int __maybe_unused gve_ptp_init(struct gve_priv *priv)
 	return err;
 }
 
-static void __maybe_unused gve_ptp_release(struct gve_priv *priv)
+int gve_init_clock(struct gve_priv *priv)
+{
+	int err;
+
+	err = gve_ptp_init(priv);
+	if (err)
+		return err;
+
+	priv->nic_ts_report =
+		dma_alloc_coherent(&priv->pdev->dev,
+				   sizeof(struct gve_nic_ts_report),
+				   &priv->nic_ts_report_bus,
+				   GFP_KERNEL);
+	if (!priv->nic_ts_report) {
+		dev_err(&priv->pdev->dev, "%s dma alloc error\n", __func__);
+		return -ENOMEM;
+	}
+
+	ptp_schedule_worker(priv->ptp->clock, 0);
+	return 0;
+}
+
+static void gve_ptp_release(struct gve_priv *priv)
 {
 	struct gve_ptp *ptp = priv->ptp;
 
@@ -57,3 +118,15 @@ static void __maybe_unused gve_ptp_release(struct gve_priv *priv)
 	kfree(ptp);
 	priv->ptp = NULL;
 }
+
+void gve_teardown_clock(struct gve_priv *priv)
+{
+	gve_ptp_release(priv);
+
+	if (priv->nic_ts_report) {
+		dma_free_coherent(&priv->pdev->dev,
+				  sizeof(struct gve_nic_ts_report),
+				  priv->nic_ts_report, priv->nic_ts_report_bus);
+		priv->nic_ts_report = NULL;
+	}
+}
-- 
2.49.0.1112.g889b7c5bd8-goog

