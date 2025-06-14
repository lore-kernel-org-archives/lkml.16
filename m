Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787D64C6D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749859697; cv=none; b=EgmVmvwIUQ9oa3tvZju5Dkerk77RqOacIM8QUazTl3bTn1y4D/wmDBPntBwLN/Cv8UeffR6Nte50pOz43tEHc00LKXwclxiUGt/9sE1vXS6J37Hj6DeyXKXSxQlFmpPRRsTzd3WkInt8IjcC5su1L9crptcO9vBv8No4lO9/tM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749859697; c=relaxed/simple;
	bh=i2SJsezjKdHz4pBfByEDzI7aUH+K4JDCxAJyXh6TjAU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EIFMMYqlegNG28LoXoG5N/TM2f6kxaFpCq19hCeJgp1Iyq86bsmjFHrFJnquu9VTVf/yVp5zg/jHyENmhbnahYT5aMCuOS4wJNavHoyqR45Vms60R4cOlhfSHtp379jsb1hrntavxl2ptB4MRdJTVwrU88Ylrc9K2a9KvxOqYVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dVoOJpV1; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dVoOJpV1"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74847a38e5eso1710660b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749859696; x=1750464496; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EljVQcnicnDvv/Y8OcFkMX/KVGrQBJDuCPNl1ok3h0U=;
        b=dVoOJpV1o/c5aTmM4Mq6F3aS5Tpv0LqpNVTtY0WstjjdUQg08Vk5bkWqEthhdJ1gBP
         O4yAoMGsnH6WRD9r0Y1Cum0zWLmELDfUy4ptp6Jc1KhsDrn472k8S/ufU0rILbnHRobT
         I5K/jGG+P6jDY81WbDOdWnEy9ozYSz9O+SmBa1i+jzVGdm/qY+rcIPY4lEsZol+0aN8w
         34QWvjppXvIfOhHLdmtFIH+2X3m2doUUIu6SMFiyXtabEUzRzzI9LBZDhy4xPeil+Ru2
         XBe/qTDvvRxvbVXd0IAOz/Sf86DG//qJbHsZEX2R6OYdTHy0d7cYvM1RV6EGoU6uCOn+
         9uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749859696; x=1750464496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EljVQcnicnDvv/Y8OcFkMX/KVGrQBJDuCPNl1ok3h0U=;
        b=XjJd+imqfwJNyZXoOd3/Hf+SPxq1076x9vxPVsYu6eEbTiVtfzyuVobDQQHRTWOtQ5
         mbcxU+mq8kYZ1z7GT14dLGJza9DeBclxEqFnVi1Us7Lx9TnPtkMGljIZ5ojx0OS2kDst
         fuUbODEoCtnhbjtVPWIQrCx3BgGuf6i5+m/qtiXbw3cD3ioQ7y5Rn6pLHGYjxg+vKmBv
         jLXLg64tVzFIzJlVadXkZGO268TPHi6HTC1pvaAzDbb4R7DJB2GnW4sgIHdiybrudnRc
         c4TwEDWuvjbg0CsnyBRandajXaUrAB5pjOhy7VLmXglv7pOd0jZjqyu1w5X3QSxEivFC
         kRTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVZzQm9DAug7hxuAL0xewfE6E6PMVj1rSpv12LApjW+5B/P+PBt7+lIKb4OXYvZODW7uxxohcJQGewsm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR3g74a2P6gboCI/vEBJc3umAPDo0O4erOU3Vjyi4FIDsiwxfB
	7wed14NCeOAVYWfl2T/ndHk8dnuj6QmIOCA2Yo+kCq+PzJAlVBZgYTfLJvblnkl5kuEhNCPqbgg
	vsS7O32ryn7lF/YGwMY4gFl+85w==
X-Google-Smtp-Source: AGHT+IGOv9d0N2cxkzxw1Yk+b3n0JGD4cBZckAigaeJg40gGm0MI2Gbz+6hCoB7tlaT9S+kpG8wgAlLMjDMbhztBzQ==
X-Received: from pgar5.prod.google.com ([2002:a05:6a02:2e85:b0:b2c:4702:db0e])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:512:b0:1f5:51d5:9ef3 with SMTP id adf61e73a8af0-21fbd686cfemr1635658637.20.1749859695780;
 Fri, 13 Jun 2025 17:08:15 -0700 (PDT)
Date: Sat, 14 Jun 2025 00:07:54 +0000
In-Reply-To: <20250614000754.164827-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250614000754.164827-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250614000754.164827-9-hramamurthy@google.com>
Subject: [PATCH net-next v5 8/8] gve: Advertise support for rx hardware timestamping
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

Expand the get_ts_info ethtool handler with the new gve_get_ts_info
which advertises support for rx hardware timestamping.

With this patch, the driver now fully supports rx hardware timestamping.

Signed-off-by: John Fraker <jfraker@google.com>
Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---
 Changes in v5:
  - Add the phc_index info into the gve_get_ts_info. (Jakub Kicinski)
---
 drivers/net/ethernet/google/gve/gve_ethtool.c | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/google/gve/gve_ethtool.c b/drivers/net/ethernet/google/gve/gve_ethtool.c
index 6ecbcee4ec13..8dbd7639e115 100644
--- a/drivers/net/ethernet/google/gve/gve_ethtool.c
+++ b/drivers/net/ethernet/google/gve/gve_ethtool.c
@@ -923,6 +923,27 @@ static int gve_set_rxfh(struct net_device *netdev, struct ethtool_rxfh_param *rx
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
+
+		if (priv->ptp)
+			info->phc_index = ptp_clock_index(priv->ptp->clock);
+	}
+
+	return 0;
+}
+
 const struct ethtool_ops gve_ethtool_ops = {
 	.supported_coalesce_params = ETHTOOL_COALESCE_USECS,
 	.supported_ring_params = ETHTOOL_RING_USE_TCP_DATA_SPLIT,
@@ -951,5 +972,5 @@ const struct ethtool_ops gve_ethtool_ops = {
 	.get_priv_flags = gve_get_priv_flags,
 	.set_priv_flags = gve_set_priv_flags,
 	.get_link_ksettings = gve_get_link_ksettings,
-	.get_ts_info = ethtool_op_get_ts_info,
+	.get_ts_info = gve_get_ts_info,
 };
-- 
2.50.0.rc1.591.g9c95f17f64-goog

