Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9D313B58A
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748567066; cv=none; b=X3nAtYYJ1w23nTNYcr8pFKGyXQAS1UFMGVTTrzLy4fvZJ37/+KeYoZHj5BgujZ/1efrhuWRJbnyn78I4R61xrdxtRLgmFwQauUiijydIEdjHjbQrCVfoF2q4lHOE0eIzyJyj1jgAf4+GGvIlUhPeiOiuNilKx3a1z5SEs2lO1xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748567066; c=relaxed/simple;
	bh=rX/1ao7p/NvtFeOI1F1MuvMHxeHwAQOnrfHP/4pdlNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PyyzhV9r24OVSEjotJ6JX0wQqL/g8UQrvLfwhyy5nSYLQjEXIlOk3SslK2vgI3ooQbmyZSsCtB3miANmo9gsNQ9oGDSjerOefMSVoxC8VEPWEC3YAKZraeaUQ1GY3avgU7EiLbb18NcfR+pqP8ozSjId1KnF/KA+/br3pSbdyTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=L3+fNESF; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="L3+fNESF"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso1051268b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 18:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748567064; x=1749171864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WMuXhARc7ZPHZfZkbAHNR+JT/HooS/WosQOHTLidIcA=;
        b=L3+fNESFHVrJ8V1UAJubnyi7Y7ffQqxENgCbwFxqVWfjkObmtt+vuYtce4NaqTgdBU
         OqT+iWDy7xwQJCpBuZThmNAB7o+TlrfhPkgv7Uh0fXRV1w3Cd6gNCyaCR04PTlIRea8N
         Sw9ZIrjtuc1asCF//3DyB0j7x3UOq67tua5hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748567064; x=1749171864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMuXhARc7ZPHZfZkbAHNR+JT/HooS/WosQOHTLidIcA=;
        b=mv4SsC8Lyn2a8aGMAof4vbPuESHvH0XTBUqt7I+ptzx3Zs1zU8coO4oJ4afaNqYsM2
         rkVmtlJsJB0c4xrjj9tRHOl6ilihgqnwkNwiFx86+VSDiaGcFT7edWolM1H2vYeo1+Ys
         JfQa/M05kobKnUxboPCWn0BYBaHNM4GRJuKlLWZXwFiPIPwexpHgeOsMtxIVmPYWIcpy
         /2HKfCXoKjeNJhq14eWt0/GX/ak55B6yqSc8uRK5lrQ69RLXjNGXh6M5oqQMbilylz2R
         TdD5bY0xVbq0swBjSqOPYDfmt2FSC0gdU08D0/7AqccKW4VivRhSMnFpGa81XA0erfJt
         jC+g==
X-Forwarded-Encrypted: i=1; AJvYcCW7J4yrmoeCUf/Lh9qymntljTjv+UISJx08MTTXIduIVDPM5mBhWPri2mdA/OoMFzRWGGurArp1QkpfjEM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1SThvJGNuy5P5hHV0FWOG0Cxuq7XqnkRfP+O3n928bk8m/b40
	QFK1QIy5orBTvphr+vy9s+3yfljkfJ7iRwc55T6STyFAQGUGjWOruDgwx1tNBHHZhQ==
X-Gm-Gg: ASbGncsZ/MitGYgvLtH9rgS7wCIIBdCO5Aa2jct9QnlEoqE9ceWFQOKDAY5Hw5Wd3mc
	ya1SpNRT2Jc4yLZJlEATaj1BDdFxoppnp8sy6AQWXx225SBNuyaB2KxaFG77bIoCNGGpTl7C1kR
	I6hehwFO/3fj9sZf0RHRu1o5EfxMitvsIZZ1XQ2v2B9pPZILVyr2lA4sqTb91wo0h+JZdQZTuUK
	iEfmNRENc6c5FUSPwB6v83dPDdbT0NiaEt3ZEMDQvbYh+qX3nC3mF+V6XeOTdnFoV1tAY56ZIxh
	jSlgbFu2fMqJsHWL4hRTgToEgnCWT4WM4BwAXHHzq0vRRv34w9yuUSBo+4AP3RcVAC60CsLCkMx
	rHEBfzbFMwKnUxrNgKUuHZQ==
X-Google-Smtp-Source: AGHT+IHlk/pQOASPBzEhio0XVuWGW4RALWeN2/BSwN7IXKo0wC2eAk4JY8nDmbRw4+IxZyH616w8PQ==
X-Received: by 2002:a05:6a00:138a:b0:742:a7e3:7c84 with SMTP id d2e1a72fcca58-747bd980c66mr1882310b3a.13.1748567064627;
        Thu, 29 May 2025 18:04:24 -0700 (PDT)
Received: from ubuntu.. ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeabc8bsm2004400b3a.64.2025.05.29.18.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 18:04:23 -0700 (PDT)
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
Subject: [PATCH net v3] vmxnet3: correctly report gso type for UDP tunnels
Date: Fri, 30 May 2025 00:46:30 +0000
Message-ID: <20250530004631.68288-1-ronak.doshi@broadcom.com>
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
tunnel packets. This is fine for now as workaround is to enable
tnl-segmentation offload on the relevant interfaces. This problem
pre-exists this patch fix and can be addressed as a separate future
patch.

Fixes: dacce2be3312 ("vmxnet3: add geneve and vxlan tunnel offload support")
Signed-off-by: Ronak Doshi <ronak.doshi@broadcom.com>
Acked-by: Guolin Yang <guolin.yang@broadcom.com>

Changes v1-->v2:
  Do not set encapsulation bit as inner fields are not updated
Changes v2-->v3:
  Update the commit message explaining the next steps to address
  segmentation issues that pre-exists this patch fix.
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

