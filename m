Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9872D3224
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747958270; cv=none; b=aYcH5vwIFbRQg/Z5+iqLskdGzjQGUA4BoAwy8TDC3eV7t6rNELQzvXMBxD+Nx+mBNS8HNJ+DsW042NKB9ZK1tP/aVt5NOb+1M1JGH6XwctzIq2ygaCwYj7gI8wFzh+qWEmxCdrauGjjW3EOHvWiyyvV7GqO65hs88HRXckxaC14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747958270; c=relaxed/simple;
	bh=a4VqRaia5JYPq57558dzEWArK2e1J4BTgLt/mTkBsWI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fyJYGQlm5HBAtfMGQ7h+rQUxaxs96xMec5sbYJzE67goBDJ3HLidQ6Ixj1kN5BvNMgYzv9D5Nicx58M/hIGbveX6MFAAe4j+CuQLTrXHu1sdvhRXsm6zQDrHDMUIwMvoRHsDFyWyApHfe9111gzZ+JKvz7KX4wVFXTpwDQyXyGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EDAi81be; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EDAi81be"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742cc20e11eso3880152b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747958268; x=1748563068; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g1Dqa/h1soTp69c+jO+vPQcLca0UczAuPPAO2k24wLg=;
        b=EDAi81bec8ZtIBujFinZJVo1GfHyIEaEYGGj1fvTCQt99WoeE2DsXrnNZCqpCsOe1j
         dZDdUzC+ntfV2X+i1vXFN+tE44jmu5TB5coT1LoEyO7TNAkQLy5JaxIPiYdvsxgazGxc
         vcc0tE99EiR5gnzMXcTvM8JewjDnYU/vQOfv+cLeJKH/IPx8N4usb65ATNwdzJTCfVo3
         vPOGM9cawjxXq2cEE0sawwU3DHdUIytdOCWtYKJsOJ7ogiloHfvUdG5xRRKGxZG4LU5X
         NEaFlTvLXF6oYE6JM5GR3TP5nRS/r+ouYEaU64SKe82HzX7JkP303Ps/iZQe9oAjJL6N
         +I7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747958268; x=1748563068;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1Dqa/h1soTp69c+jO+vPQcLca0UczAuPPAO2k24wLg=;
        b=dysJ4vFl5jzxZYTGAORxYGWPZKYX3XX54/M+A/K1wA5Xxlq7OkGlARQwe5B5OxUksD
         XNMquMdHVu/oa7mrk+rg5WXvX8RTumRP+I9kJTH58sevNleFBt3ijGKsgEG7Xfw92Yp5
         g8ewtLtFWX5MRfOqFywfc3/hz42ZKBXt29ZTXnpDBL61+8scb/6HihEgWdifeiqLC9St
         NI/ucShsGQEFFln5a6dk/Q8T4KFf80R9qcAvy0SuYPYJw4Ls4D2GCAqaYBQidKPNTzNK
         KplEmAiNkVRf1L9KP212ACXqRjStetZU/rI7YtkWjWWgzSHMAsU56h8byM7G6kouN66g
         xK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2BI4Oh4pTvh6KLXZBq2R+IC142bXF7ZxdN8bkSHuTj/Bfn1KlvwUckQLYihtNSwuTAkPghVFwxg0VWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIKu1YSjAj/Wlqu9ic19feQlGQsZplgJN0p6FuYM7X9ISGso+k
	9lVYv6sPK6j3h7ElbyILQ7osE4DYJHyqtSzddzAuURVHDqXe75qD6ehC3QDWwExSuphQKFe4Kw4
	+IWEd9zqGZ/ah8p8wyi7rtFN7Sw==
X-Google-Smtp-Source: AGHT+IGwki/Y2IVocXy02XX5qbT7c1tp+xm8ILZ1XfHcJTMpQOOCeGljPIhF4SWHZ0aaQj47N8jhPgFw1Gdv3/UOcA==
X-Received: from pfhm3.prod.google.com ([2002:a62:f203:0:b0:736:3e92:66d7])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3a27:b0:736:6ecd:8e34 with SMTP id d2e1a72fcca58-742acd5071emr36759912b3a.18.1747958268187;
 Thu, 22 May 2025 16:57:48 -0700 (PDT)
Date: Thu, 22 May 2025 23:57:34 +0000
In-Reply-To: <20250522235737.1925605-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522235737.1925605-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235737.1925605-6-hramamurthy@google.com>
Subject: [PATCH net-next v3 5/8] gve: Add support to query the nic clock
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
2.49.0.1143.g0be31eac6b-goog

