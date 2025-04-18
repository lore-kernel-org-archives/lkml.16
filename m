Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2165F254AF5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745014388; cv=none; b=SdBuPZlljgIzQWZZehqO4K6gNcKRpL0p0pRKwGI+MRsOYq5flVm+6pJTDrLQJovvYR8f7yLVd0IoBQX+1LcRfnR+tyyuFnRTzMwNoVj22RxHsTjUsy5WZhEyEe+H7OV/lEQaJbmABusovuX31CcY9tAJHXIChgyIKyPw3ozHE24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745014388; c=relaxed/simple;
	bh=loPDuypeVYAq3mG7jBub5MltLGGR1IyQ4B+mIhsZ8Mk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=je92C5vAvJWSb8bBiR3S6Gfzd9mHUKQonPFcyc+QPON0AoZ8hiy64Omtj+q3G5t9Y/xhxiffQxmTCQs31ANxLU44dEsHtIRuRPcQJT8AITFD70W8iiwI3UehWYKjrl3cBtfKayav0PsKiNA/QYgm7L3apKpE6sFJD9dv1gye0yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=itI9YC70; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="itI9YC70"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-224347aef79so31914455ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745014386; x=1745619186; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WmpSa9vPgxqGtw2Pb/sSZHf+Ch+PiH7QnNGMEcCsUI8=;
        b=itI9YC70m4uVbgx6CcRIngLoRJarfMu9VpRXUkIwfGyhbBCWYt/5YwDoNXEDem4YSA
         EudctVReu0Geq3vYx4Rvaz3whTcqLrvC4xw9/QHvqXqUSJwObGr2LrZBYau7uqAtC0WY
         4mMvPaHl4jkg7XP3PVezGWa0uR62XpE8ie8064W4881fvVV4RBqj+cy1FXlALmqL7aIP
         xjIF2QLVRdjn1nKjJ2ArJdDC1piLqLPdoAuezjVoHwSuoYQ/OFKV7eB+iHgAAz0i7VKy
         sDbGp9kpldH7VcjHK3V1vvQksbd/iTMQL4SSJGUzmJIn0zBgkmrjjv87Nure/CncqOPu
         uoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745014386; x=1745619186;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WmpSa9vPgxqGtw2Pb/sSZHf+Ch+PiH7QnNGMEcCsUI8=;
        b=vOywWFOQsg6yYoOrye12Xn6qn6BYQQMNqxGLk9KsgTQh0XaaRY8q1/AASblLj6981t
         qoUiuteDHVIz7BAksZ0wfhhPYkrRzvz+/9Q1WdMO2wwUFhF08TEsBAQ8nHYiUyPDiiYg
         uCwTa8dqNfDfesa7zQZOCVTmYmpNAQB6STKU5Tbh5NStj4b8u3SF0bDaKw2Gmz5YVRrp
         rR7T0OtFlmS8eu2QCBPqXa0MHEgHfVaRZcfXAUhIWOHQaNRXBblPHVsJtMe6qmu+o6kt
         d1a6lelbXnDvfdC+25pQsqQzGmvTA7Sp9ubmpLBIfX6a6GrySQcDMApjmpnjkloShicd
         /V/g==
X-Forwarded-Encrypted: i=1; AJvYcCVmyGYOPklRV+Y6agDYhyoeYBVb23+Fmn6G0a8K90LTRkanjfAjkM6OTmm6snH9tMEjw3WHEFa7P58kCMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD0RZmH5mU4YTAqwj+c/DnsIQI8QlcrKSKDr4k2KLjT1uvHksS
	+NeOkYx8rk94R0GKLCHYmal8r1G+AvEubUSf81WDGEl9b5qWRmA00NpoPuLbeOHuPvKL2ZWmU1R
	KvGdfkX/fsf/AT81GUif8JQ==
X-Google-Smtp-Source: AGHT+IG3lVPqU7fvkkyM2LJbiF75yVGwcAeROVZnXCXwIg2K49ux/hb1YMySnaNgbNo+R2UijIsSgo4CyG790fQKwA==
X-Received: from pfbfm7.prod.google.com ([2002:a05:6a00:2f87:b0:739:8c87:ed18])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:db0f:b0:21b:d105:26b8 with SMTP id d9443c01a7336-22c5357a7d7mr53482605ad.7.1745014386582;
 Fri, 18 Apr 2025 15:13:06 -0700 (PDT)
Date: Fri, 18 Apr 2025 22:12:54 +0000
In-Reply-To: <20250418221254.112433-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250418221254.112433-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250418221254.112433-7-hramamurthy@google.com>
Subject: [PATCH net-next 6/6] gve: Advertise support for rx hardware timestamping
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

This patch expands our get_ts_info ethtool handler with the new
gve_get_ts_info which advertises support for rx hardware timestamping.

With this patch, the driver now fully supports rx hardware timestamping.

Co-developed-by: Ziwei Xiao <ziweixiao@google.com>
Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: John Fraker <jfraker@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---
 drivers/net/ethernet/google/gve/gve_ethtool.c | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/google/gve/gve_ethtool.c b/drivers/net/ethernet/google/gve/gve_ethtool.c
index 76f759309196..ba838e5b7d53 100644
--- a/drivers/net/ethernet/google/gve/gve_ethtool.c
+++ b/drivers/net/ethernet/google/gve/gve_ethtool.c
@@ -929,6 +929,24 @@ static int gve_set_rxfh(struct net_device *netdev, struct ethtool_rxfh_param *rx
 	return 0;
 }
 
+static int gve_get_ts_info(struct net_device *netdev,
+			   struct kernel_ethtool_ts_info *info)
+{
+	struct gve_priv *priv = netdev_priv(netdev);
+
+	ethtool_op_get_ts_info(netdev, info);
+
+	if (priv->nic_timestamp_supported) {
+		info->so_timestamping |= SOF_TIMESTAMPING_RX_HARDWARE |
+					 SOF_TIMESTAMPING_RAW_HARDWARE;
+
+		info->rx_filters |= BIT(HWTSTAMP_FILTER_NONE) |
+				    BIT(HWTSTAMP_FILTER_ALL);
+	}
+
+	return 0;
+}
+
 const struct ethtool_ops gve_ethtool_ops = {
 	.supported_coalesce_params = ETHTOOL_COALESCE_USECS,
 	.supported_ring_params = ETHTOOL_RING_USE_TCP_DATA_SPLIT,
@@ -957,5 +975,5 @@ const struct ethtool_ops gve_ethtool_ops = {
 	.get_priv_flags = gve_get_priv_flags,
 	.set_priv_flags = gve_set_priv_flags,
 	.get_link_ksettings = gve_get_link_ksettings,
-	.get_ts_info = ethtool_op_get_ts_info,
+	.get_ts_info = gve_get_ts_info,
 };
-- 
2.49.0.805.g082f7c87e0-goog

