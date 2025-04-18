Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD57243958
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745014382; cv=none; b=GKbEw4U08nC1JD9VGQ/OqDCEs90oEuU31nhYhcKpBaAgfKq+Jk8li7Ex7I6XZdMdu1QS0xz/yGnxeJWaKzK2Esrv9Qfzy7U5hvQn313+16d0+53Z7uOEpj+KhKOMF/XU/rs1KYXU4tOjXUfJaiN+5XNM9+sCuGtIrUjuq5LOhHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745014382; c=relaxed/simple;
	bh=ItWFSCVDbjxxVUZUdvpMtsCSDAT9b50ItavV7xjaUHQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kYYpw+pTX4Bge3rajUw7W5hnqIDv0wJiOpHDyauEtKFUr6k1L5GTkTlJS05X300xbZsfu9DNwLPTQQXb/QQv0oyaL77j2grZCwDHxnSnnuWubxHd0FrFw3KaQXixxsq5oCg0l08Gmk3qL1eylnFBPmGt85q2Ks5jT8qFNuEchg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xIQ9O0Kj; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xIQ9O0Kj"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2242f3fd213so20611705ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745014379; x=1745619179; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8yrivYcHNx6L4G6taXJ33jFMolvklY6KDAaHH12BE9E=;
        b=xIQ9O0Kj6TKfjgeNdo4lXLL8wNWMyUYP0AIumWibvd3CqDArRfXk28VKuV0bchZ/nI
         mdOiDAFv7bpPwvk9tYopcmapDIFk/46d3u6vDg9VP82ht0rrJdwnhrmEL3jY95LUx1c9
         Nx3/CyB2t3o61FBUUxO9Rvb6xQZnnrIE7aU7bH9nP2FXUNfbA+708QU08PIqpcztBaa9
         Rir5JIDD7L8R/A6KCs+GX561CBArI5wdZ8EAUyHhpd9Mmlkx3Rsd+Fstqf4Zyrl4CoW9
         upDWFUPokvCl2iXr5L6cjJw+iVm7RQoQjTYzkjAV4+Z7HK56Xc2MfNnP0/ZOBJjzhNu7
         041A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745014379; x=1745619179;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8yrivYcHNx6L4G6taXJ33jFMolvklY6KDAaHH12BE9E=;
        b=GfR6gPdyRtaBdwYnCCo+Y5jVk7MobzW9aN+6ldh63MkDf8Eivw0OZ8yMgHyU1pbsBL
         LKMGOWrg84PQh3WqDUJxi4iKPU4FPk8X/1/swGriIjJfHcAjywF5+Q7zqzAOSH9whX4F
         /lMUSoZuAL9wAyjEGez+D8OTCJ3Irx3ZjliPp1jPXT1s11EY2t4hxs70fNRT8yRDeJoZ
         S466RXSCtkr8fKg65jtd4RSfvM57on8WV+eFL4RaW1BxO5WTPuEztQSLXOw/BiZm6TjL
         JfdKPxVNfJk8RJA2x1nydIy15kIHN1WQ/zV2L57VXWU8/uX2A4G2bXr2dUphqxOQieFf
         QQ+g==
X-Forwarded-Encrypted: i=1; AJvYcCWbJhrq8vZCZsQB0SWDppBesDYXJUqAjPbhSy2u+cNVzLECCAuSUtZmr32J3ToK4JZtPfi3uLMonz6ZnrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeUqjdmHZvE5BfFuWD/xFA6G7omRZwLd6raMCDw4GuzqSE9pou
	oXSTz73HipdIPxPt/4XeQPfXmHzsFTYWkRGmRbAot3MRSR20sstvDhFforrfNvz0oLspPypFkQa
	TXKzbe23GgDUWoRCgeKhrhQ==
X-Google-Smtp-Source: AGHT+IGgyWTDkf3U+r308vvbDy0CEDYuFNiZtlUp3pJH2R34QleHuKL3B+DestSlhl9Dm/fDOVTumOX7Nb2QaeZaWQ==
X-Received: from pfbhq10.prod.google.com ([2002:a05:6a00:680a:b0:73c:257c:fd5f])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:287:b0:223:faf5:c82 with SMTP id d9443c01a7336-22c5337a067mr51930565ad.8.1745014379565;
 Fri, 18 Apr 2025 15:12:59 -0700 (PDT)
Date: Fri, 18 Apr 2025 22:12:49 +0000
In-Reply-To: <20250418221254.112433-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250418221254.112433-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250418221254.112433-2-hramamurthy@google.com>
Subject: [PATCH net-next 1/6] gve: Add device option for nic clock synchronization
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

This patch adds the device option and negotiation with the device for
clock synchronization with the nic. This option is necessary before the
driver will advertise support for hardware timestamping or other related
features.

Co-developed-by: Jeff Rogers <jefrogers@google.com>
Signed-off-by: Jeff Rogers <jefrogers@google.com>
Co-developed-by: Ziwei Xiao <ziweixiao@google.com>
Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: John Fraker <jfraker@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---
 drivers/net/ethernet/google/gve/gve.h        |  3 ++
 drivers/net/ethernet/google/gve/gve_adminq.c | 31 +++++++++++++++++++-
 drivers/net/ethernet/google/gve/gve_adminq.h |  9 ++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/google/gve/gve.h b/drivers/net/ethernet/google/gve/gve.h
index 2fab38c8ee78..e9b2c1394b1f 100644
--- a/drivers/net/ethernet/google/gve/gve.h
+++ b/drivers/net/ethernet/google/gve/gve.h
@@ -870,6 +870,9 @@ struct gve_priv {
 	u16 rss_lut_size;
 	bool cache_rss_config;
 	struct gve_rss_config rss_config;
+
+	/* True if the device supports reading the nic clock */
+	bool nic_timestamp_supported;
 };
 
 enum gve_service_task_flags_bit {
diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c b/drivers/net/ethernet/google/gve/gve_adminq.c
index 3e8fc33cc11f..ae20d2f7e6e1 100644
--- a/drivers/net/ethernet/google/gve/gve_adminq.c
+++ b/drivers/net/ethernet/google/gve/gve_adminq.c
@@ -46,6 +46,7 @@ void gve_parse_device_option(struct gve_priv *priv,
 			     struct gve_device_option_buffer_sizes **dev_op_buffer_sizes,
 			     struct gve_device_option_flow_steering **dev_op_flow_steering,
 			     struct gve_device_option_rss_config **dev_op_rss_config,
+			     struct gve_device_option_nic_timestamp **dev_op_nic_timestamp,
 			     struct gve_device_option_modify_ring **dev_op_modify_ring)
 {
 	u32 req_feat_mask = be32_to_cpu(option->required_features_mask);
@@ -225,6 +226,23 @@ void gve_parse_device_option(struct gve_priv *priv,
 				 "RSS config");
 		*dev_op_rss_config = (void *)(option + 1);
 		break;
+	case GVE_DEV_OPT_ID_NIC_TIMESTAMP:
+		if (option_length < sizeof(**dev_op_nic_timestamp) ||
+		    req_feat_mask != GVE_DEV_OPT_REQ_FEAT_MASK_NIC_TIMESTAMP) {
+			dev_warn(&priv->pdev->dev, GVE_DEVICE_OPTION_ERROR_FMT,
+				 "Nic Timestamp",
+				 (int)sizeof(**dev_op_nic_timestamp),
+				 GVE_DEV_OPT_REQ_FEAT_MASK_NIC_TIMESTAMP,
+				 option_length, req_feat_mask);
+			break;
+		}
+
+		if (option_length > sizeof(**dev_op_nic_timestamp))
+			dev_warn(&priv->pdev->dev,
+				 GVE_DEVICE_OPTION_TOO_BIG_FMT,
+				 "Nic Timestamp");
+		*dev_op_nic_timestamp = (void *)(option + 1);
+		break;
 	default:
 		/* If we don't recognize the option just continue
 		 * without doing anything.
@@ -246,6 +264,7 @@ gve_process_device_options(struct gve_priv *priv,
 			   struct gve_device_option_buffer_sizes **dev_op_buffer_sizes,
 			   struct gve_device_option_flow_steering **dev_op_flow_steering,
 			   struct gve_device_option_rss_config **dev_op_rss_config,
+			   struct gve_device_option_nic_timestamp **dev_op_nic_timestamp,
 			   struct gve_device_option_modify_ring **dev_op_modify_ring)
 {
 	const int num_options = be16_to_cpu(descriptor->num_device_options);
@@ -269,6 +288,7 @@ gve_process_device_options(struct gve_priv *priv,
 					dev_op_dqo_rda, dev_op_jumbo_frames,
 					dev_op_dqo_qpl, dev_op_buffer_sizes,
 					dev_op_flow_steering, dev_op_rss_config,
+					dev_op_nic_timestamp,
 					dev_op_modify_ring);
 		dev_opt = next_opt;
 	}
@@ -904,6 +924,8 @@ static void gve_enable_supported_features(struct gve_priv *priv,
 					  *dev_op_flow_steering,
 					  const struct gve_device_option_rss_config
 					  *dev_op_rss_config,
+					  const struct gve_device_option_nic_timestamp
+					  *dev_op_nic_timestamp,
 					  const struct gve_device_option_modify_ring
 					  *dev_op_modify_ring)
 {
@@ -980,10 +1002,15 @@ static void gve_enable_supported_features(struct gve_priv *priv,
 			"RSS device option enabled with key size of %u, lut size of %u.\n",
 			priv->rss_key_size, priv->rss_lut_size);
 	}
+
+	if (dev_op_nic_timestamp &&
+	    (supported_features_mask & GVE_SUP_NIC_TIMESTAMP_MASK))
+		priv->nic_timestamp_supported = true;
 }
 
 int gve_adminq_describe_device(struct gve_priv *priv)
 {
+	struct gve_device_option_nic_timestamp *dev_op_nic_timestamp = NULL;
 	struct gve_device_option_flow_steering *dev_op_flow_steering = NULL;
 	struct gve_device_option_buffer_sizes *dev_op_buffer_sizes = NULL;
 	struct gve_device_option_jumbo_frames *dev_op_jumbo_frames = NULL;
@@ -1024,6 +1051,7 @@ int gve_adminq_describe_device(struct gve_priv *priv)
 					 &dev_op_buffer_sizes,
 					 &dev_op_flow_steering,
 					 &dev_op_rss_config,
+					 &dev_op_nic_timestamp,
 					 &dev_op_modify_ring);
 	if (err)
 		goto free_device_descriptor;
@@ -1088,7 +1116,8 @@ int gve_adminq_describe_device(struct gve_priv *priv)
 	gve_enable_supported_features(priv, supported_features_mask,
 				      dev_op_jumbo_frames, dev_op_dqo_qpl,
 				      dev_op_buffer_sizes, dev_op_flow_steering,
-				      dev_op_rss_config, dev_op_modify_ring);
+				      dev_op_rss_config, dev_op_nic_timestamp,
+				      dev_op_modify_ring);
 
 free_device_descriptor:
 	dma_pool_free(priv->adminq_pool, descriptor, descriptor_bus);
diff --git a/drivers/net/ethernet/google/gve/gve_adminq.h b/drivers/net/ethernet/google/gve/gve_adminq.h
index 228217458275..42466ee640f1 100644
--- a/drivers/net/ethernet/google/gve/gve_adminq.h
+++ b/drivers/net/ethernet/google/gve/gve_adminq.h
@@ -174,6 +174,12 @@ struct gve_device_option_rss_config {
 
 static_assert(sizeof(struct gve_device_option_rss_config) == 8);
 
+struct gve_device_option_nic_timestamp {
+	__be32 supported_features_mask;
+};
+
+static_assert(sizeof(struct gve_device_option_nic_timestamp) == 4);
+
 /* Terminology:
  *
  * RDA - Raw DMA Addressing - Buffers associated with SKBs are directly DMA
@@ -192,6 +198,7 @@ enum gve_dev_opt_id {
 	GVE_DEV_OPT_ID_JUMBO_FRAMES		= 0x8,
 	GVE_DEV_OPT_ID_BUFFER_SIZES		= 0xa,
 	GVE_DEV_OPT_ID_FLOW_STEERING		= 0xb,
+	GVE_DEV_OPT_ID_NIC_TIMESTAMP		= 0xd,
 	GVE_DEV_OPT_ID_RSS_CONFIG		= 0xe,
 };
 
@@ -206,6 +213,7 @@ enum gve_dev_opt_req_feat_mask {
 	GVE_DEV_OPT_REQ_FEAT_MASK_MODIFY_RING		= 0x0,
 	GVE_DEV_OPT_REQ_FEAT_MASK_FLOW_STEERING		= 0x0,
 	GVE_DEV_OPT_REQ_FEAT_MASK_RSS_CONFIG		= 0x0,
+	GVE_DEV_OPT_REQ_FEAT_MASK_NIC_TIMESTAMP		= 0x0,
 };
 
 enum gve_sup_feature_mask {
@@ -214,6 +222,7 @@ enum gve_sup_feature_mask {
 	GVE_SUP_BUFFER_SIZES_MASK	= 1 << 4,
 	GVE_SUP_FLOW_STEERING_MASK	= 1 << 5,
 	GVE_SUP_RSS_CONFIG_MASK		= 1 << 7,
+	GVE_SUP_NIC_TIMESTAMP_MASK	= 1 << 8,
 };
 
 #define GVE_DEV_OPT_LEN_GQI_RAW_ADDRESSING 0x0
-- 
2.49.0.805.g082f7c87e0-goog

