Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9F1149DF0
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747376594; cv=none; b=J2L9RnhMOeF+acUuG091FOOAjml/zl1CZZ9LgyhwLyV+mok+h+PmV8r3KfFkqcQSTlwz8aiSrTkjT8lYO2YMP9WWc6AfA8NFH27GLtkOLr5Encf9he4tNMgJqOjpIj6pFl2k8hzE4LXtvk+btzqD9PkjxUR2WRDfSCM3a4fxOD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747376594; c=relaxed/simple;
	bh=7djLhBvRkeKVCMCJwc7CAWFlYXM/pr3zm3nApTBdIGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JDg+FciKnGHBrC5zTtPJa/TuCpB2w0bbWGsJuos1ZwCvwpe7qDqITD9LcTUPywHfFIhYMOWdwuYvn3iOSYs142tKL3oyUpimab/RHkYtry913ShqzRleS9NQ6Ct2+wO6PoY9Zr/tsmnUyp+cWeR0FZZ5SiHR3PwTdDKDsFrucaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fcpdEcBC; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fcpdEcBC"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7399838db7fso1757126b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 23:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747376592; x=1747981392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=91sS53x9K40/gNlwhJVZ6vBGCpnRL10lMaDDn0jrpIo=;
        b=fcpdEcBCItuF7lzMZfO90wJoueY40PcSTvUu7MgehP0NlH4aUgVq66mkbkyuetW5dU
         PhenQXSMaK33KlaKvQ2KyQO65fs9SWIxbyUWJcmbUuPB82/L1ZoHr4l+aPetxkS6gtRs
         zjqlfXlr6/Ju0Hoh7yVkbY1OHIksdQSivmwb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747376592; x=1747981392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91sS53x9K40/gNlwhJVZ6vBGCpnRL10lMaDDn0jrpIo=;
        b=mqLh5P0k423lgZkRRbgmYrc7eyuLAERNa5YrDRknddjSglicHVRJEKsAzBx0NgbCI+
         O4mSINxxPdoubL6WOBzgBx80tWD15R1TM0eXASfAqrU9MzV/mjYEgS9BNBmnG5u1W9j+
         dyqoqfE0kDR5039W8jlbFEgvOYhfaX65voAZEWFndNcRdj0dzvEpuwwUSHi3yZj1UFua
         OXr5UMPYfDwJjDP/S8OSFOVnIlyREZYRH1xhkhf0A3fJLHmRuTtWkw/baaefa/i3KtbH
         /a7SjBicdL2F0dm7keP46oacDDY1zd6ZpbfBZ9CEOUXBhA57Alzu5BATeOmd6/+5wgPs
         jTmA==
X-Forwarded-Encrypted: i=1; AJvYcCW4WYAQCQxDvnfPyWuvbb6sYsSIg/8W8Ft6NIt4C1daH9gX9YvBShNn5v960Id+NDan7ps6+EK6gLfItd0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw58YvLdFJoOIKy6CrvAvmTk5peHmfcyXRHmKLaHU57OtziF1E
	EGrXC2S9cqNLrO4RM6VUajExbh8X8G8J6egoWwFVns1mGO6a6iPpv4jjnxqJ2Ytw/w==
X-Gm-Gg: ASbGnctxAbCe00iRsIMOi1dSS1zBwB5OWpR9Bj05/8/y8YdrXKPRqo6aHtbJcoVbzXi
	5trVXX7zaZkSSNgrRCrIq1Y6dvMJWF9Mc0ghOWoEuA2y3K/H9jaFm8KdJjHfSlW6IxfzekLVosS
	jLCsKILEgCmRUSgQNlN9pFzViXfrpFf/1BsMcyoPXP/e+tw21SKxvDof1Z9iLBZCMqcIQMtNXv5
	FAV74ZCRXyt8+yu2lbPuqP1uTsCUMzrAwHwrqEfeB/icq79X5Uba8skKKfmjkSdG/CDd7Qo4+1p
	PJruHlXhcMVrWrc5Ruv7hfMRtv688FE3A6+i9smuidu+rr/VQbPkzj2EiqfhKpSjFK4vTkjQHPU
	zfDy+uDjjGKo=
X-Google-Smtp-Source: AGHT+IEymG0Hs9Aj4aSM2JFAQrsi7mocElYcrPA68mKddL1UVULiRC5o/kM2Om+UQBQ6+bG24lIVPw==
X-Received: by 2002:a05:6a00:2885:b0:742:8cd7:740a with SMTP id d2e1a72fcca58-742a9a2b40emr2890027b3a.5.1747376591744;
        Thu, 15 May 2025 23:23:11 -0700 (PDT)
Received: from ubuntu.. ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96dfaa8sm824501b3a.6.2025.05.15.23.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 23:23:11 -0700 (PDT)
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
Subject: [PATCH net v2] vmxnet3: correctly report gso type for UDP tunnels
Date: Fri, 16 May 2025 06:05:22 +0000
Message-ID: <20250516060523.10352-1-ronak.doshi@broadcom.com>
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
Changes v1-->v2:
  Do not set encapsulation bit as inner fields are not updated
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

