Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF59EBA36
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748619888; cv=none; b=E95scFt7V/DunUz7wX9MqNUc8rjOpykbutIkLY7u7Ur2rnp8VhKopGVXZK++1/Uk85Je5Rqnj8ZL4sX4Zq7XD02PnBoaJThXOBZMtV81RaPurXB/FPfp1Ynu+/8JlirB8uChUUu5mXhiSqXHh3Lv/DALE6jUfuV/qrN7TKjzZR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748619888; c=relaxed/simple;
	bh=tShNz1F8ZqHyMCW3gy3LmKwe14b90b0cKvfiiQiedF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pgDsfu+59cdciXliRjfkuEkM4HchOmBXoWKAgLflR37dDNrAGpjBCe5pg9jJykywlvTLiZN1zrxCMfsAynNyLC2vwuKTmgzwEDz7qpXLn0Ti3ljSvBTorApYMs6fNrl3qgawtWkSEnpqlLbxxIt0EUDB6kdzubQWchknbZxg9u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JPZwV0MS; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JPZwV0MS"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so2052005b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748619886; x=1749224686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SryMm32kuymojhHrK4V1xjurKm1RRnj6DaabgF0M4vY=;
        b=JPZwV0MSQKpX15o+jHjUMMGmtb9iFG8glz6eqYd5ZygErrCA1IpKOEm6nLwcdMah32
         J4rBi03f0G995EwV+R595fNCg/IWwFB5AWRnBn2OPEr9OfyML3w73Lbezl2Afn4T7Gdf
         X8n27Xg7q+LNQ6EPk877NXAXdUMH/1dGaQAwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619886; x=1749224686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SryMm32kuymojhHrK4V1xjurKm1RRnj6DaabgF0M4vY=;
        b=ElZl39NjliNsKE37Fi9tY/Imdqc6KXqK3il/miwTKlMQ1d9M4ixE3FiSP9L3sT5INz
         eqPWF6XfhHkebaGGAVeLo9ilmc1iOX9u8dr9hC3pYA9zfj0EfVrRbN2KRUgwQWY0bQmt
         TVyP5FQ0kSTP4JEfuUeIF73ERwOQIu1RGxBxPElBr33j4p+c0slAKUC1xfae52oVf+kv
         gDTppcv54QCt9RAbCy0dgfWLZcp/VKljLSPx9bkIUxq8CJFCB73eCd8PMSCfprbNEqJ3
         ozB6KjjN+863Nr27O02SsZvB0qyAXk/ZZKsknx+Hx/WAKZXF0m9SpY8Frq6BT+LUidRw
         gDJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxYPdSIiB/7RZHUJKxHNK8AhyTtVEA5wagHxwV+TeIGdFxK8xEyMNivXCmnCG1NCi1CkKIlwth28hziBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz47be5d6GOgfRKM2Rt4RCUvFa08GfcRNDrw8cRM0LhgmV4Mcwi
	SA/QD4urzKhq6gYcRH1a7NNNkywHSGgR+YiEpNZStQ9ST+9IEN+7cLUnGcILg3VbmQ==
X-Gm-Gg: ASbGncvdULc5iEMj+CUd9Lqs0pGW7Zl3Y3BNnKpjgyiXbIUqAuA9vIgC22CPxJhATFW
	O7/AyvLe8+h10Rn+9j3mOQQMe8MjsCJVKsUmYm2QGF/cD3c6fujbW9Gh2nWUxG9Cl7dARKHZryd
	1VdekecUL+cFhaWfC2j4yxYUrhkwOMxqIS0J7Rf2kUkGLZkB4Mwu6HicSw76JeU77n71ImWN1l+
	60fBs06/L6yEX372vsJydOtBvbxY9TN8Qbuch9jZWi6LtoYy9y2b2wxrIP8rD9ixZuvEFvzJgr7
	C57vHfNu9Zcry0rn2VXzHHuEwVSn49LQKgdacGhruEXwun3y67M5m1gYyKTLctzL2Tzt+QWRpnh
	kf0Q/S7oU//LNVWwgnXgE7A==
X-Google-Smtp-Source: AGHT+IGAK8o+8Ua0lXjHXGjY94JIpgJscQVIy88WZ6WB5EqaxsbE1cmu3G6Ju41EdiRl90z+RRovCA==
X-Received: by 2002:a05:6a00:2305:b0:746:3040:4da2 with SMTP id d2e1a72fcca58-747bd96b918mr6023716b3a.8.1748619885949;
        Fri, 30 May 2025 08:44:45 -0700 (PDT)
Received: from ubuntu.. ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe9645dsm3208018b3a.7.2025.05.30.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:44:45 -0700 (PDT)
From: Ronak Doshi <ronak.doshi@broadcom.com>
To: netdev@vger.kernel.org
Cc: Ronak Doshi <ronak.doshi@broadcom.com>,
	Guolin Yang <guolin.yang@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v4] vmxnet3: correctly report gso type for UDP tunnels
Date: Fri, 30 May 2025 15:27:00 +0000
Message-ID: <20250530152701.70354-1-ronak.doshi@broadcom.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 3d010c8031e3 ("udp: do not accept non-tunnel GSO skbs landing
in a tunnel") added checks in linux stack to not accept non-tunnel
GRO packets landing in a tunnel. This exposed an issue in vmxnet3
which was not correctly reporting GRO packets for tunnel packets.

This patch fixes this issue by setting correct GSO type for the
tunnel packets.

Currently, vmxnet3 does not support reporting inner fields for LRO
tunnel packets. The issue is not seen for egress drivers that do not
use skb inner fields. The workaround is to enable tnl-segmentation
offload on the egress interfaces if the driver supports it. This
problem pre-exists this patch fix and can be addressed as a separate
future patch.

Fixes: dacce2be3312 ("vmxnet3: add geneve and vxlan tunnel offload support")
Signed-off-by: Ronak Doshi <ronak.doshi@broadcom.com>
Acked-by: Guolin Yang <guolin.yang@broadcom.com>

Changes v1-->v2:
  Do not set encapsulation bit as inner fields are not updated
Changes v2-->v3:
  Update the commit message explaining the next steps to address
  segmentation issues that pre-exists this patch fix.
Changes v3->v4:
  Update the commit message to clarify the workaround.
---
 drivers/net/vmxnet3/vmxnet3_drv.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index c676979c7ab9..287b7c20c0d6 100644
--- a/drivers/net/vmxnet3/vmxnet3_drv.c
+++ b/drivers/net/vmxnet3/vmxnet3_drv.c
@@ -1568,6 +1568,30 @@ vmxnet3_get_hdr_len(struct vmxnet3_adapter *adapter, struct sk_buff *skb,
 	return (hlen + (hdr.tcp->doff << 2));
 }
 
+static void
+vmxnet3_lro_tunnel(struct sk_buff *skb, __be16 ip_proto)
+{
+	struct udphdr *uh = NULL;
+
+	if (ip_proto == htons(ETH_P_IP)) {
+		struct iphdr *iph = (struct iphdr *)skb->data;
+
+		if (iph->protocol == IPPROTO_UDP)
+			uh = (struct udphdr *)(iph + 1);
+	} else {
+		struct ipv6hdr *iph = (struct ipv6hdr *)skb->data;
+
+		if (iph->nexthdr == IPPROTO_UDP)
+			uh = (struct udphdr *)(iph + 1);
+	}
+	if (uh) {
+		if (uh->check)
+			skb_shinfo(skb)->gso_type |= SKB_GSO_UDP_TUNNEL_CSUM;
+		else
+			skb_shinfo(skb)->gso_type |= SKB_GSO_UDP_TUNNEL;
+	}
+}
+
 static int
 vmxnet3_rq_rx_complete(struct vmxnet3_rx_queue *rq,
 		       struct vmxnet3_adapter *adapter, int quota)
@@ -1881,6 +1905,8 @@ vmxnet3_rq_rx_complete(struct vmxnet3_rx_queue *rq,
 			if (segCnt != 0 && mss != 0) {
 				skb_shinfo(skb)->gso_type = rcd->v4 ?
 					SKB_GSO_TCPV4 : SKB_GSO_TCPV6;
+				if (encap_lro)
+					vmxnet3_lro_tunnel(skb, skb->protocol);
 				skb_shinfo(skb)->gso_size = mss;
 				skb_shinfo(skb)->gso_segs = segCnt;
 			} else if ((segCnt != 0 || skb->len > mtu) && !encap_lro) {
-- 
2.45.2

