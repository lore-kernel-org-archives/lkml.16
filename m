Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBEA4B1E76
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 00:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747440684; cv=none; b=aiC8VLcM0IsPBAcbLEVvKgDMurh2CIouRN6lDJ2/bDxUFuOaYAh0dim0Q65s1A3C6kzHO6RLXhd2ApyrF/q6vIZHdTXbUesjwM0j18a81cRZdY2HkXVw86NSESX2VZGam3N4Ht4cS6DUCCPWfA2s/mi/OtIFJ6hF+tL5hChdP0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747440684; c=relaxed/simple;
	bh=31/lJG2o9SmyuuN41N4MSO6lGomIejPftCbufxmondo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bA4I5s0aRqXOkR/59TdJ6ObP4Qbc36BiuBzvWAPaYhZBj6VPnKszW4/X5v3B96ojF8QVjH+xOCAZF3KX8EO1oKEuMCewpiAZzrNSYbgaVm6EFJOKC6U/evOQn3htF/d3eqmflmPHg1cRnluXCRnLZrwXLqg/YC4EZXoY53H9AO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SVf0NUOV; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SVf0NUOV"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7394772635dso1883700b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747440682; x=1748045482; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ttLP5/DGr+2kXi412ZAPLztPKPEo0E+jvKivP2tqC0=;
        b=SVf0NUOV/EAkStORC6dSUaH37O4nEm1KNXsDAp5eFEd1DqiBEXOZ/hxGo9vWbBq0bg
         f3jIQQMDX8IAflf3iopA60+ySoX2NjnTWoGye3agOvYPIM4/00El4PMN/sFCXEc8WZDE
         K3Opnqy2uYMWjjDo0Co/HKdjrTqhghxI1xuCnb0rPZnoz49JihWfRnZQIat8De5AMRZd
         kWSFS0OteivrEIYBshoVkD55r5kXEJoa9jk9SqnlZJ5NrAX0+R2D3W1zJbWMfwbmB0O4
         zXEa7gvV3tERNhYERLdbr08/G5JJlNwPne6GRHBaFzM7tMFX0ihcqKI7QskzqA6lEOod
         dMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747440682; x=1748045482;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ttLP5/DGr+2kXi412ZAPLztPKPEo0E+jvKivP2tqC0=;
        b=X0D0IJCLumg7Hn2L4JCSXMO6fNVYFjfQhpFgKAYFr8CB6HnOeQGJfIOLuYqGoA/MCW
         1qA1kjA1+ZR+PGegoYDucrCVGuP/ZPdX7q+tbRrG165B8uixyR/yIMrXwdHbkzbkhG6L
         8si0OfPQjYCBwtXBiv5qxkzD2xqt7E08VpyBWmj7HRLzWoh3EFh517ur6c8M0HZeLWAz
         gmzn+/yQTn0Nh0PdfxjUou0k0vB+yDGNhhTJhjsaBhXkd9713frdAFnRlSar0UK9gZEf
         y7/ZUSaYYgcNcBLy4AmEqAKD2EEE4JE5XOI5goqgkt8GnIDFYbns4EmAmACK1ix6iJiq
         m1hw==
X-Forwarded-Encrypted: i=1; AJvYcCXSK7rLi1f7VwPBH+51EdBosB7fug7oNCCt98f6JP6DyR9uUyN/XjLoXXZPtLRU9/XcgIdrJKHWsCh030M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZIXUOdJbNwQh9g8TMUCYJ4B0DgHX8uGqYebpeMY9iaU1quQK8
	f5reWsWfFNNFaO+VuWMIT3ZD1dA7eBqPqKSpb+Qd6hY54CfWN0of7Hd4tJsqH2X+0VI2Km9fF5o
	nLEEriToJPGqqGYSUIJwZxzGMTQ==
X-Google-Smtp-Source: AGHT+IFa3FKZZGciD/8w9fAQFp2nYbL5Y+FyKdncvT6yy/P7vYEq8etjUMsZQG+X/UwCxOLYbyThsVLf0pguBYanaQ==
X-Received: from pjee12.prod.google.com ([2002:a17:90b:578c:b0:30e:840f:131e])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c916:b0:203:bb3b:5f1e with SMTP id adf61e73a8af0-2170c7232ffmr6404882637.1.1747440682467;
 Fri, 16 May 2025 17:11:22 -0700 (PDT)
Date: Sat, 17 May 2025 00:11:04 +0000
In-Reply-To: <20250517001110.183077-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517001110.183077-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250517001110.183077-3-hramamurthy@google.com>
Subject: [PATCH net-next v2 2/8] gve: Add adminq command to report nic timestamp
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, jeroendb@google.com, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com, 
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com, 
	shailend@google.com, linux@treblig.org, thostet@google.com, 
	jfraker@google.com, richardcochran@gmail.com, jdamato@fastly.com, 
	vadim.fedorenko@linux.dev, horms@kernel.org, linux-kernel@vger.kernel.org, 
	Jeff Rogers <jefrogers@google.com>
Content-Type: text/plain; charset="UTF-8"

From: John Fraker <jfraker@google.com>

Add an adminq command to read NIC's hardware clock. The driver
allocates dma memory and passes that dma memory address to the device.
The device then writes the clock to the given address.

Signed-off-by: Jeff Rogers <jefrogers@google.com>
Signed-off-by: John Fraker <jfraker@google.com>
Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
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
index 3c1da0cf3f61..d0628e25a82d 100644
--- a/drivers/net/ethernet/google/gve/gve_ethtool.c
+++ b/drivers/net/ethernet/google/gve/gve_ethtool.c
@@ -76,7 +76,7 @@ static const char gve_gstrings_adminq_stats[][ETH_GSTRING_LEN] __nonstring_array
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
2.49.0.1112.g889b7c5bd8-goog

