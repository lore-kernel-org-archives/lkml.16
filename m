Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF0820102C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747171370; cv=none; b=CThKeRqBz7qQvKGqdWNE+57+A+3loNmLyJL3T8gGOaVrl4So8cC7HuzuTi55c1CW7BDeBW4/lk/1xniMKrX+kDhvOO1Un6stBpNcblZMXU/13JyCm8r5Qg4sCqkV97GpvXFzDq12bX37vPvtYW0+LY2x9N04ULoGcGefuTn18OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747171370; c=relaxed/simple;
	bh=uACsEngJrqtCiOncEs7leGd5W0ohwQ6ApDe5Jg0TgUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GoyHdX6Ygi6gMpJNABZ0bMbpa2Yy7sUKMZ6B6hwH2/3Hw6tqFov0Xfv31+rtUnByUHmycj1NZnq9gRZGl2BUGtQeuK7+pA3r0C/Ulu6kFvUriUtG7r+elSX1ZZQ2Mgq8u6ao1Em1veb3deMrKXXEBTZJ2FgwdqGIvwXD2tMgCM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hTHR6IpW; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hTHR6IpW"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30dfd9e7fa8so2690220a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747171368; x=1747776168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YYJ1UM4CvD2cHTAFq/UftrDftIf9OrX1HyqIqL+4MSE=;
        b=hTHR6IpWsd9VEgjiDSSl4jsZnkqgVi6ov52vHVIVylrq9vFLOXszVWAKc682r56SWE
         y88NzvMB1JpYVk6Hh9pegMNN7sKIfi2Owu5YCVMMF7O87HIhZkc7vXyT0VR99KaDYDU2
         6N5x4emVSzrtDqLhB8hztn60+D7hHCwjE2BXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747171368; x=1747776168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYJ1UM4CvD2cHTAFq/UftrDftIf9OrX1HyqIqL+4MSE=;
        b=dISdsDlZdWu3PxOumZ07QhrD3IN2H7JohbDRxG53ndBygWUbq+FMqftg36GY1hE2+g
         +G9vgHFI9liIvKk+nCy/E1/NZp5er+fAiCFNC2nWd0N1paweACInjrQEZuT/8fpF5yci
         BpSs6ZD+UYxUvq16Nu7h8LUWnF9Eh5ctDf3y2EKzpSb5bs2Imf1dJ1ZDfupsH0c/UArJ
         L9J7JeLSV+l+FlH/MBsUII5MqJ2Hr7HAllVyiopjMa1HZp3LIajBwRnfmHZht+bunADz
         GBp+PW1gpwH3hla1e9YDVyrHIZAgpwvICqq9LtJrrVSN7KIBz+h4JiF/xkDBBMy6fqB+
         hgJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyz7K2TssfoQy+be+Q6NrQUI3CAdVmmuRGxLBWVr5vzDfYBQBJHrWpkz3c4i6P49A6p5qHnYKIKn8tWNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqkX3NEK0MnNIjvh3oKOcpdcesOaw6lgHJ2Cmw2AS66lTtgKcg
	nPACc3krkpNKKia2ap2bVICs8xjW9IPgBrcKT0bvRgCxw2Ev42+medFyK7om/Q==
X-Gm-Gg: ASbGncu42uJ2vMwD96EX7kh7nSUnNOMLVQd22WOmXsxToKsVdPKg7s47UlXKWSH/aHj
	3vy6FzlEiRjCAlg3BHllYfPz71ja1b5IjrSAqFT1ujOARJSs9zTXdYVoHAQ8l6Q6vXUnddRwQ6x
	z/YgaWZOColLdC5Uo7Z6E3O+npi6kZzs/afsT/x1qKDQn+QRJOhl/ZXVH/P03MhrBhrMmtJSZ8e
	dZfjFhgIYhSAmes2K6Liod8L5ovJKYoQc7B/1abLPUDvhRXGxvm8NFuo1h6WzkPtCtLBZSvGmQI
	GrCNJYoGGtz9cEXwujIl30lDRES9KmKMO+T60xIR6NslQlhow5wEk53/JQz33S+AXl4XdwhPhh5
	Z
X-Google-Smtp-Source: AGHT+IECWEHoP0ArEiea9yxSR23+RdyDSwB3kxjTyLdrCRPcJ0E+5OYnGnHew40nur3xI3szP1Mg6w==
X-Received: by 2002:a17:90b:562b:b0:30a:dc08:d0fe with SMTP id 98e67ed59e1d1-30e2e5dc46bmr1627117a91.16.1747171368119;
        Tue, 13 May 2025 14:22:48 -0700 (PDT)
Received: from ubuntu.. ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334019b0sm68391a91.7.2025.05.13.14.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:22:47 -0700 (PDT)
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
Subject: [PATCH net] vmxnet3: correctly report gso type for UDP tunnels
Date: Tue, 13 May 2025 21:05:02 +0000
Message-ID: <20250513210504.1866-1-ronak.doshi@broadcom.com>
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

Fixes: dacce2be3312 ("vmxnet3: add geneve and vxlan tunnel offload support")
Signed-off-by: Ronak Doshi <ronak.doshi@broadcom.com>
Acked-by: Guolin Yang <guolin.yang@broadcom.com>
---
 drivers/net/vmxnet3/vmxnet3_drv.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index 58027e82de88..9d84ad96ae54 100644
--- a/drivers/net/vmxnet3/vmxnet3_drv.c
+++ b/drivers/net/vmxnet3/vmxnet3_drv.c
@@ -1452,6 +1452,7 @@ vmxnet3_rx_csum(struct vmxnet3_adapter *adapter,
 			if ((le32_to_cpu(gdesc->dword[0]) &
 				     (1UL << VMXNET3_RCD_HDR_INNER_SHIFT))) {
 				skb->csum_level = 1;
+				skb->encapsulation = 1;
 			}
 			WARN_ON_ONCE(!(gdesc->rcd.tcp || gdesc->rcd.udp) &&
 				     !(le32_to_cpu(gdesc->dword[0]) &
@@ -1465,6 +1466,7 @@ vmxnet3_rx_csum(struct vmxnet3_adapter *adapter,
 			if ((le32_to_cpu(gdesc->dword[0]) &
 				     (1UL << VMXNET3_RCD_HDR_INNER_SHIFT))) {
 				skb->csum_level = 1;
+				skb->encapsulation = 1;
 			}
 			WARN_ON_ONCE(!(gdesc->rcd.tcp || gdesc->rcd.udp) &&
 				     !(le32_to_cpu(gdesc->dword[0]) &
@@ -1568,6 +1570,30 @@ vmxnet3_get_hdr_len(struct vmxnet3_adapter *adapter, struct sk_buff *skb,
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
@@ -1881,6 +1907,8 @@ vmxnet3_rq_rx_complete(struct vmxnet3_rx_queue *rq,
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

