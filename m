Received: from mail-oi1-f202.google.com (mail-oi1-f202.google.com [209.85.167.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D052222A0
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494451; cv=none; b=mwLmSn0aflHhwT64o6eoOqTf7vDLJcdbPQMplFTjoDUGYSRC+gQxvlY7t1WVol/+8mTCkKk0GA0+IbpDeR2NTEiEwP1DXLf6+6TJP3hEVpWXUAKg0XZ+dpJ/bVLq3yardQ+Hq65fIgoVzGDhhdULmTiHlfxFZPEEFEk+QikFE9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494451; c=relaxed/simple;
	bh=rKjUKQfc4OMKlUXFxIl6D9srGX57cWCr2GmRAt5oFXY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PCErSRLtf4XwYKu+7m5+pyNm3N0b3VJCv00ixfI8b8HGDvnCjtEEQ7OM/3gMcUrU3gMB01IpwOD/jkhevnOGb5t31aLJm6f+iYdPJXTjlV1LCDmqs0xt5MN+0lQnsLsR7npFF3zYBWkbxWSAx+B2BrYiL945I15njSdUK3blqw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wYBFK5FC; arc=none smtp.client-ip=209.85.167.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wYBFK5FC"
Received: by mail-oi1-f202.google.com with SMTP id 5614622812f47-4066a79eaddso4433424b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749494449; x=1750099249; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SIFIP7KP90Ct5yuguqMb9VIz9B7n2uUQGQjuUEHD2gw=;
        b=wYBFK5FCkoC4VXprUPbGUAU8fQUUTNKAXznB3DMyoJy3X0ePx5y4TJcdG+Jxd6Dpby
         2qx4HXk6ToMvRBkn1FqEcsT8uGAPvgQaN8S70URS1PUJVugjIe286cirtUw4YNPRbSgx
         EMHn/32o9I5AK/2iUReh2s90zHa29495AIA5MGZFAfyq7dwpv7lpQ8OiFy7n01MzyeXj
         ocwHQVBIn0ZsL1gk5bZX1qBfjfcM45uD5TZRzAM5REbbgdRSy8l+XSfzgKK2mI7avyvU
         l+v9+7u1uMORXKPIdmktR6RdiLNl4nfdmFUbxrPnjGLnnufy3cStI69XicfbbyWn6CIj
         bgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494449; x=1750099249;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SIFIP7KP90Ct5yuguqMb9VIz9B7n2uUQGQjuUEHD2gw=;
        b=RB33hsECXJoxZLnGgmJcWSsMbQssmVM6LIttApnnfLJ14xXyB8QwL0BZ/KOldwu5Y5
         pnSsAYH0rxDIFchETGhEqQY8flhE6woclKuX/EnQbm6RXWRNj/jN9crjSlOl+JME/R4N
         +n2C+u2CgHx8G90dn7ERHT2oDlDu7Fm4uM+f3NplXT+vGXrmLokCPQ8Sf7h/bgs1bsYY
         LUUfegJTnKYYNJwhsHDkpfnEUZGtPQBVMDAFvZLo4yws1G/2bqfxXag7XPS3yxuLZoer
         FZaNCEHJl8Rs4f2VP5eG9tdFxNwd+eZRDJ0xF+bdD0XrRMY+cE0sFKNiwiDXPbx/Ls5P
         4GMg==
X-Forwarded-Encrypted: i=1; AJvYcCVLP8kh9Z6MuyEHp2jf/ZHgt7SHH7TiX8PrNuG0fpXNJrkjh30cWYQllZkJsDhvuRvMd8iW/dAS63UapY0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2/93zMpi9RpdkAkGssW3lBUjDBCtwjYrzFcUTrUdp0HZfD7x/
	amD4kldOaxDyHQ0qn+869jXHlEF2jooXkXGdK6B/P4X/Tpa1EhcRsomnkcxon7q0BEZa1NFr3ho
	mtwHqpH8rIH7yNAmkHIl8XBK0fw==
X-Google-Smtp-Source: AGHT+IEwklIgKgfYBJsH2x38K6nG02IxhjEjNUnIs10WtpsPz1pYiv3+lkfIu6mQB40WFiX+sfUnOaWLNWjyaGgSMw==
X-Received: from plje13.prod.google.com ([2002:a17:902:ed8d:b0:234:d00c:b347])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c94f:b0:235:caf9:8b08 with SMTP id d9443c01a7336-23601d14ecamr213792115ad.23.1749494436659;
 Mon, 09 Jun 2025 11:40:36 -0700 (PDT)
Date: Mon,  9 Jun 2025 18:40:23 +0000
In-Reply-To: <20250609184029.2634345-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250609184029.2634345-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250609184029.2634345-3-hramamurthy@google.com>
Subject: [PATCH net-next v4 2/8] gve: Add adminq command to report nic timestamp
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
 Changes in v4:
 - add two more reserved fields in gve_nic_ts_report, anticipating
   upcoming use, to align size expectations with the device from the
   start (team internal review, Shachar Raindel)
---
 drivers/net/ethernet/google/gve/gve.h         |  1 +
 drivers/net/ethernet/google/gve/gve_adminq.c  | 20 +++++++++++++++++++
 drivers/net/ethernet/google/gve/gve_adminq.h  | 19 ++++++++++++++++++
 drivers/net/ethernet/google/gve/gve_ethtool.c |  3 ++-
 4 files changed, 42 insertions(+), 1 deletion(-)

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
index 42466ee640f1..f9f19e135790 100644
--- a/drivers/net/ethernet/google/gve/gve_adminq.h
+++ b/drivers/net/ethernet/google/gve/gve_adminq.h
@@ -27,6 +27,7 @@ enum gve_adminq_opcodes {
 	GVE_ADMINQ_GET_PTYPE_MAP		= 0xE,
 	GVE_ADMINQ_VERIFY_DRIVER_COMPATIBILITY	= 0xF,
 	GVE_ADMINQ_QUERY_FLOW_RULES		= 0x10,
+	GVE_ADMINQ_REPORT_NIC_TIMESTAMP		= 0x11,
 	GVE_ADMINQ_QUERY_RSS			= 0x12,
 
 	/* For commands that are larger than 56 bytes */
@@ -401,6 +402,21 @@ struct gve_adminq_report_link_speed {
 
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
+	__be64 reserved3;
+	__be64 reserved4;
+};
+
 struct stats {
 	__be32 stat_name;
 	__be32 queue_id;
@@ -594,6 +610,7 @@ union gve_adminq_command {
 			struct gve_adminq_query_flow_rules query_flow_rules;
 			struct gve_adminq_configure_rss configure_rss;
 			struct gve_adminq_query_rss query_rss;
+			struct gve_adminq_report_nic_ts report_nic_ts;
 			struct gve_adminq_extended_command extended_command;
 		};
 	};
@@ -633,6 +650,8 @@ int gve_adminq_reset_flow_rules(struct gve_priv *priv);
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
2.50.0.rc0.604.gd4ff7b7c86-goog

