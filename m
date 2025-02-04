Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70619212D83
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738697266; cv=none; b=c83NhnALX360ViLoGIXpUbAhKkzUeTtIid8gw3GtYGmJpiLEHYqL46CK5FIZo3/rnxX3mD9ewv3Ut+TstYq+qUhJARnt0Fi12Mxjn6KSVPnCIE4qyxTjznxyRWmnclcIFG9dFiwAuEhFnSkDcvx553xgueR+dAS7riL7VxfEAyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738697266; c=relaxed/simple;
	bh=CvYBgsQQ2sB2qTH/ispwYnc1GT/UJnN//HUW4OU8uMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WcjLTesvOzWSbQ7mCJDTlWj4w6JKJZjA5ru/Fi9YSTngdcEBg2kkxShhGAR6lIR9IDqWoFBTm91xH94EtaIXQJFZ2Q543lBWuSny9T/RQMTtsYQ8Y9F5aaP27cxvgyp9AWupxuXVkFwnkeg75jOezmAk1npyZHWEnQCo/ThqdzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=YT6TKoqJ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="YT6TKoqJ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f08b44937so12638325ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 11:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738697264; x=1739302064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8iOEoCrXIGW4Q927eer0s+nYHhVWh5aiFKVXEGf2lEo=;
        b=YT6TKoqJ7WsNaU+ANvUyl/P7tTsIpeZaq9xNB6t7fFXo8U4f/ivhuojjWKtYtUZTkY
         9SUfuxys4+rnRJ9KFDTJBsIWkjCZ1vdpJPGJ8RC2TPjIBNZ5zmluauJHRELBK4ePGuOl
         kvuoU1APaQ2N+lGzVexTIPtQeL966q2z29lys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738697264; x=1739302064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8iOEoCrXIGW4Q927eer0s+nYHhVWh5aiFKVXEGf2lEo=;
        b=s/gR4Psm+6sxmR3L1ZtY0gBBL7YHTQeDDuU04GtJHWghvkDPP4+jdEQujmDg2mrmo0
         a7vDN/FhKHoO4b6dCtCMfExXrcoLgqxlXyJUW4kiQubSwZBIAaOqxnSPFauFrzS9Mq9e
         UZhx5dfquRF0/B4lRQlqU/3emwhsTiECxiZuGfG3dtolLyvz8jJBVhOQ1elaU364KRBC
         rMOKodYKY3trxC+QWuoUEDiAXa1PE7JszRO6NXvRWUsXoIZIm9KK+A6rc/0NiFbq78uh
         zjmjZYqs2zvQX1JPim59tbKkKrOKuC7ZQl5emiJ96kDFVZ5YQAvNx7MkrOVcXGUnNQZ1
         b9bg==
X-Forwarded-Encrypted: i=1; AJvYcCXc63+fN7Z5i03pRRHHvTFYRTUa/x9kTT/QQ3gQSNc2j+d6QmFOH6FrnVH41j5BLkg0ROnmSJ2Ne1TQMwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRzfsAeOuKWKti55+fDhjRfYkSCKswouVMzMatOIwVUPa0+hd4
	t1iToKvLQmZoia+UpREOjQvNC3i1chauFgzdWCOvUqYGgbfDFzGTnNWtBMQxTD+TbitF1UYovG/
	G
X-Gm-Gg: ASbGncuu3regOwXhpdgAIfO/Dbgp1LRy4ReWRoEAv31kBKCbNvRi7qNNqzCUDr0j0ur
	KObLRU2L4oj6pFj3sQkubam46SpIgj3TxF5rYAig6Y6zzQO70pzKYUrNPDblq+82Mt3BXaEexc0
	ovHkqDnDg4D0/tH/OX3hkZNCuyJ0LFeqaRzETwlVAHzwRhNgnz+53Unn71QTifSRR+epWD80dLI
	wWCIp/yk+ulEUjoEubPWAppunBHanBrfpDdBEUHZ93NBrEFdFYxwz10U9HH4doLAbU2bCiq291k
	RdmdXQKjw0VQR4cwB7zS8XY=
X-Google-Smtp-Source: AGHT+IE+7dWcfNLhQTOMhd0Vsf5ukouIeilZjFgIDC26Ks2ade1xUAcue6WYJyYElM16Cq1HmnYHfA==
X-Received: by 2002:a17:903:2406:b0:215:8dd3:536a with SMTP id d9443c01a7336-21f17e2a49fmr393235ad.4.1738697263622;
        Tue, 04 Feb 2025 11:27:43 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331ddfdsm99261345ad.210.2025.02.04.11.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:27:43 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: pabeni@redhat.com,
	edumazet@google.com,
	sridhar.samudrala@intel.com,
	Joe Damato <jdamato@fastly.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v3] netdev-genl: Elide napi_id when not present
Date: Tue,  4 Feb 2025 19:27:21 +0000
Message-ID: <20250204192724.199209-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are at least two cases where napi_id may not present and the
napi_id should be elided:

1. Queues could be created, but napi_enable may not have been called
   yet. In this case, there may be a NAPI but it may not have an ID and
   output of a napi_id should be elided.

2. TX-only NAPIs currently do not have NAPI IDs. If a TX queue happens
   to be linked with a TX-only NAPI, elide the NAPI ID from the netlink
   output as a NAPI ID of 0 is not useful for users.

Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 v3:
  - Took Eric's suggested patch to refactor the code to use helpers,
    which improves the code quality significantly.

 v2: https://lore.kernel.org/netdev/20250203191714.155526-1-jdamato@fastly.com/
   - Updated to elide NAPI IDs for RX queues which may have not called
     napi_enable yet.

 rfc: https://lore.kernel.org/lkml/20250128163038.429864-1-jdamato@fastly.com/

 include/net/busy_poll.h |  5 +++++
 net/core/netdev-genl.c  | 13 +++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/include/net/busy_poll.h b/include/net/busy_poll.h
index c39a426ebf52..741fa7754700 100644
--- a/include/net/busy_poll.h
+++ b/include/net/busy_poll.h
@@ -24,6 +24,11 @@
  */
 #define MIN_NAPI_ID ((unsigned int)(NR_CPUS + 1))
 
+static inline bool napi_id_valid(unsigned int napi_id)
+{
+	return napi_id >= MIN_NAPI_ID;
+}
+
 #define BUSY_POLL_BUDGET 8
 
 #ifdef CONFIG_NET_RX_BUSY_POLL
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 715f85c6b62e..5aa3ed870b2c 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -364,6 +364,13 @@ int netdev_nl_napi_set_doit(struct sk_buff *skb, struct genl_info *info)
 	return err;
 }
 
+static int nla_put_napi_id(struct sk_buff *skb, const struct napi_struct *napi)
+{
+	if (napi && napi_id_valid(napi->napi_id))
+		return nla_put_u32(skb, NETDEV_A_QUEUE_NAPI_ID, napi->napi_id);
+	return 0;
+}
+
 static int
 netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 			 u32 q_idx, u32 q_type, const struct genl_info *info)
@@ -385,8 +392,7 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 	switch (q_type) {
 	case NETDEV_QUEUE_TYPE_RX:
 		rxq = __netif_get_rx_queue(netdev, q_idx);
-		if (rxq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
-					     rxq->napi->napi_id))
+		if (nla_put_napi_id(rsp, rxq->napi))
 			goto nla_put_failure;
 
 		binding = rxq->mp_params.mp_priv;
@@ -397,8 +403,7 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 		break;
 	case NETDEV_QUEUE_TYPE_TX:
 		txq = netdev_get_tx_queue(netdev, q_idx);
-		if (txq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
-					     txq->napi->napi_id))
+		if (nla_put_napi_id(rsp, rxq->napi))
 			goto nla_put_failure;
 	}
 

base-commit: c2933b2befe25309f4c5cfbea0ca80909735fd76
-- 
2.43.0

