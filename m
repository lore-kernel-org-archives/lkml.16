Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA46624C061
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745014383; cv=none; b=iIXn4Wlkevp8RMJBMw0JSdlaF4C+WGG5kTMZW80sysUEFpydRWsEA9bNI9Of8xm0HZ6Z4mBUhoL2hsidE9alGWd1AxS90gz8GwxyfHyBQdC9tDqaVE80+2UROLm9fBdqrZhFvrv88uTNRysulOBOsCMirSznxkH20reaGPaw8SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745014383; c=relaxed/simple;
	bh=Nq7V/6IjHitUCNU1xhRloj2Qf6t3ut0dbp9awHuuqaM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s0g5wsise4+XKdQh1SDEF/LeYupW+4hrRGU0Gws+QSv/ixl+YVRXbP8XhoKfI5ZsJxM+2u7/ziZJw5Zc8PRIw7OnhE6rSa9yrmmSmlg3xIw8/RWmdP2oMYUXBKMA6lXFiFQuLKxf6ZFVFy6tlivFQ/FOKGHozp12xcCJxeuq7+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tZIpk2/2; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tZIpk2/2"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7369b559169so1502586b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745014381; x=1745619181; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=odukihRD2X2F35wm6Kgljp6w3F6b5R95nTsR7BdnLN0=;
        b=tZIpk2/27BOhWDsZlDZqEutbe6Lnf9ZDcAvwt1LWO++gK48qY6Wh/2faXM0ECFEKZd
         DOowcRWDPZHxQCZxawZOSnD3tfpqAgJ0JHb3Fb1eEHuxhmWE/t/6pU3BRKN8bD0JVN6j
         /3mYm1okGfQEOhDbhLMp/t5ythg1bO6vqz1FkiDoO2WSqAUiu3WMVv6lR9B3ragCx2rF
         LjgorYzuAYD5oVwFDn/cOLM7AMW8xZmsot389f4PEdGm0NreRsaeQNEPBkPAGX1CSjM8
         6iPfZrfYPLldRa88/LwYwOmeylqccnI6/U/vMXXxNyT1OnvyM2A/L21dp5Bs38Yu5dZn
         YQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745014381; x=1745619181;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odukihRD2X2F35wm6Kgljp6w3F6b5R95nTsR7BdnLN0=;
        b=bfUSXsLd/4m6ktvsZ529LvFs8PT91A5BAhaY1indUzlLvIgKT3fbK5knMzxsTQ8Qb8
         8IqHwXoor/boA5SoVcKcGbaJjz3A8i09QePiBMzpMEuhvwYhmTCksyRj3o2FsBoQJbBH
         mAvTWekNh+H3yEXw0MvZwsZs/xvCNko0TQS0DDbsE9ojtQ+uVb4vurmIC047sXYbtlgH
         Vbonu5qidXgTBQB83vYFzIRjMFu9AQbxm+dTsviQqTw7NwBu8T7xO0MEN6V1ghcko23Z
         rl2O3bt5TyI64IAMMcZPLBeoR4SpCGvVQwYvf/TsPUPbsSM4rd6CdxirR25GKX93mK2v
         DCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Blep/mHpXmNQmbsZjXhAu7TSWsN3q6/rXPseuOeDzJwk/3ytg5P3xhsyidWwMOvx3879P4Piurm2nKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVpaGJVcMMNvvq4zcjyoXyJBIH8iymu4BpVPC2/yJCjMuX08o/
	feY8RJ7ItnBSFmkULGk+wHHz1XwACP7yazxY+DPH9P2E7sG3xeErO6a+l3CojGNLE4os5AIZV7i
	9IwLYtwwzeYOcuXTuxATkPg==
X-Google-Smtp-Source: AGHT+IEbd7hlOw8dQrQZW6AzFzWz9qpz3Y3xp85QBBVsZka3QY9O4/z/3Oru6iPsLOJT1Ovl2haPJznCrPeeU4Gu4A==
X-Received: from pfua1.prod.google.com ([2002:a05:6a00:11c1:b0:737:6e43:8e34])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:98e:b0:736:5753:12fd with SMTP id d2e1a72fcca58-73dc14438a1mr6125388b3a.4.1745014380905;
 Fri, 18 Apr 2025 15:13:00 -0700 (PDT)
Date: Fri, 18 Apr 2025 22:12:50 +0000
In-Reply-To: <20250418221254.112433-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250418221254.112433-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250418221254.112433-3-hramamurthy@google.com>
Subject: [PATCH net-next 2/6] gve: Add adminq command to report nic timestamp
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, jeroendb@google.com, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com, 
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com, 
	shailend@google.com, linux@treblig.org, thostet@google.com, 
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	Jeff Rogers <jefrogers@google.com>
Content-Type: text/plain; charset="UTF-8"

From: John Fraker <jfraker@google.com>

This patch adds an adminq command to read NIC's hardware clock. The
driver allocates dma memory and passes that dma memory address to the
device. The device then writes the clock to the given address.

Co-developed-by: Jeff Rogers <jefrogers@google.com>
Signed-off-by: Jeff Rogers <jefrogers@google.com>
Co-developed-by: Ziwei Xiao <ziweixiao@google.com>
Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: John Fraker <jfraker@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---
 drivers/net/ethernet/google/gve/gve.h         |  1 +
 drivers/net/ethernet/google/gve/gve_adminq.c  | 20 +++++++++++++++++++
 drivers/net/ethernet/google/gve/gve_adminq.h  | 17 ++++++++++++++++
 drivers/net/ethernet/google/gve/gve_ethtool.c |  3 ++-
 4 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/google/gve/gve.h b/drivers/net/ethernet/google/gve/gve.h
index e9b2c1394b1f..cf6947731a9b 100644
--- a/drivers/net/ethernet/google/gve/gve.h
+++ b/drivers/net/ethernet/google/gve/gve.h
@@ -813,6 +813,7 @@ struct gve_priv {
 	u32 adminq_set_driver_parameter_cnt;
 	u32 adminq_report_stats_cnt;
 	u32 adminq_report_link_speed_cnt;
+	u32 adminq_report_nic_timestamp_cnt;
 	u32 adminq_get_ptype_map_cnt;
 	u32 adminq_verify_driver_compatibility_cnt;
 	u32 adminq_query_flow_rules_cnt;
diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c b/drivers/net/ethernet/google/gve/gve_adminq.c
index ae20d2f7e6e1..f57913a673b4 100644
--- a/drivers/net/ethernet/google/gve/gve_adminq.c
+++ b/drivers/net/ethernet/google/gve/gve_adminq.c
@@ -326,6 +326,7 @@ int gve_adminq_alloc(struct device *dev, struct gve_priv *priv)
 	priv->adminq_set_driver_parameter_cnt = 0;
 	priv->adminq_report_stats_cnt = 0;
 	priv->adminq_report_link_speed_cnt = 0;
+	priv->adminq_report_nic_timestamp_cnt = 0;
 	priv->adminq_get_ptype_map_cnt = 0;
 	priv->adminq_query_flow_rules_cnt = 0;
 	priv->adminq_cfg_flow_rule_cnt = 0;
@@ -564,6 +565,9 @@ static int gve_adminq_issue_cmd(struct gve_priv *priv,
 	case GVE_ADMINQ_REPORT_LINK_SPEED:
 		priv->adminq_report_link_speed_cnt++;
 		break;
+	case GVE_ADMINQ_REPORT_NIC_TIMESTAMP:
+		priv->adminq_report_nic_timestamp_cnt++;
+		break;
 	case GVE_ADMINQ_GET_PTYPE_MAP:
 		priv->adminq_get_ptype_map_cnt++;
 		break;
@@ -1229,6 +1233,22 @@ int gve_adminq_report_link_speed(struct gve_priv *priv)
 	return err;
 }
 
+int gve_adminq_report_nic_ts(struct gve_priv *priv,
+			     dma_addr_t nic_ts_report_addr)
+{
+	union gve_adminq_command cmd;
+
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.opcode = cpu_to_be32(GVE_ADMINQ_REPORT_NIC_TIMESTAMP);
+	cmd.report_nic_ts = (struct gve_adminq_report_nic_ts) {
+		.nic_ts_report_len =
+			cpu_to_be64(sizeof(struct gve_nic_ts_report)),
+		.nic_ts_report_addr = cpu_to_be64(nic_ts_report_addr),
+	};
+
+	return gve_adminq_execute_cmd(priv, &cmd);
+}
+
 int gve_adminq_get_ptype_map_dqo(struct gve_priv *priv,
 				 struct gve_ptype_lut *ptype_lut)
 {
diff --git a/drivers/net/ethernet/google/gve/gve_adminq.h b/drivers/net/ethernet/google/gve/gve_adminq.h
index 42466ee640f1..9360b84536d5 100644
--- a/drivers/net/ethernet/google/gve/gve_adminq.h
+++ b/drivers/net/ethernet/google/gve/gve_adminq.h
@@ -27,6 +27,7 @@ enum gve_adminq_opcodes {
 	GVE_ADMINQ_GET_PTYPE_MAP		= 0xE,
 	GVE_ADMINQ_VERIFY_DRIVER_COMPATIBILITY	= 0xF,
 	GVE_ADMINQ_QUERY_FLOW_RULES		= 0x10,
+	GVE_ADMINQ_REPORT_NIC_TIMESTAMP		= 0x11,
 	GVE_ADMINQ_QUERY_RSS			= 0x12,
 
 	/* For commands that are larger than 56 bytes */
@@ -401,6 +402,19 @@ struct gve_adminq_report_link_speed {
 
 static_assert(sizeof(struct gve_adminq_report_link_speed) == 8);
 
+struct gve_adminq_report_nic_ts {
+	__be64 nic_ts_report_len;
+	__be64 nic_ts_report_addr;
+};
+
+static_assert(sizeof(struct gve_adminq_report_nic_ts) == 16);
+
+struct gve_nic_ts_report {
+	__be64 nic_timestamp; /* NIC clock in nanoseconds */
+	__be64 reserved1;
+	__be64 reserved2;
+};
+
 struct stats {
 	__be32 stat_name;
 	__be32 queue_id;
@@ -594,6 +608,7 @@ union gve_adminq_command {
 			struct gve_adminq_query_flow_rules query_flow_rules;
 			struct gve_adminq_configure_rss configure_rss;
 			struct gve_adminq_query_rss query_rss;
+			struct gve_adminq_report_nic_ts report_nic_ts;
 			struct gve_adminq_extended_command extended_command;
 		};
 	};
@@ -633,6 +648,8 @@ int gve_adminq_reset_flow_rules(struct gve_priv *priv);
 int gve_adminq_query_flow_rules(struct gve_priv *priv, u16 query_opcode, u32 starting_loc);
 int gve_adminq_configure_rss(struct gve_priv *priv, struct ethtool_rxfh_param *rxfh);
 int gve_adminq_query_rss_config(struct gve_priv *priv, struct ethtool_rxfh_param *rxfh);
+int gve_adminq_report_nic_ts(struct gve_priv *priv,
+			     dma_addr_t nic_ts_report_addr);
 
 struct gve_ptype_lut;
 int gve_adminq_get_ptype_map_dqo(struct gve_priv *priv,
diff --git a/drivers/net/ethernet/google/gve/gve_ethtool.c b/drivers/net/ethernet/google/gve/gve_ethtool.c
index eae1a7595a69..76f759309196 100644
--- a/drivers/net/ethernet/google/gve/gve_ethtool.c
+++ b/drivers/net/ethernet/google/gve/gve_ethtool.c
@@ -76,7 +76,7 @@ static const char gve_gstrings_adminq_stats[][ETH_GSTRING_LEN] = {
 	"adminq_dcfg_device_resources_cnt", "adminq_set_driver_parameter_cnt",
 	"adminq_report_stats_cnt", "adminq_report_link_speed_cnt", "adminq_get_ptype_map_cnt",
 	"adminq_query_flow_rules", "adminq_cfg_flow_rule", "adminq_cfg_rss_cnt",
-	"adminq_query_rss_cnt",
+	"adminq_query_rss_cnt", "adminq_report_nic_timestamp_cnt",
 };
 
 static const char gve_gstrings_priv_flags[][ETH_GSTRING_LEN] = {
@@ -456,6 +456,7 @@ gve_get_ethtool_stats(struct net_device *netdev,
 	data[i++] = priv->adminq_cfg_flow_rule_cnt;
 	data[i++] = priv->adminq_cfg_rss_cnt;
 	data[i++] = priv->adminq_query_rss_cnt;
+	data[i++] = priv->adminq_report_nic_timestamp_cnt;
 }
 
 static void gve_get_channels(struct net_device *netdev,
-- 
2.49.0.805.g082f7c87e0-goog

