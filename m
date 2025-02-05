Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB331FF5F4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738784292; cv=none; b=YbVyJbzLqYxLmJHtCZlO+v3CyZUdQ7Q7C0JGAbBiuzxIfYFBJtsP/gumKD2UDnHiQF6MkTQvLwXB7yip/m5eS0icLSh9YNezGux6WUmUIkD4PejiQjFX5w+dVBCU0ZaADY3l4ySqKHJZrgk4culSyE/dYrgP0PqJZNV1s17RsCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738784292; c=relaxed/simple;
	bh=6uXbUzdREBssIW/56lp9+osP8wskTzhD5dGm6h63ZAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S8OkaDUiXelVaZCyav7gD4vxOW8DDctNeskgHmL1MSkyERqErUFm+qkcGFiPIHzjHWybksrs6H7imRI34F87MAvoEkazNzdXpmKef7GPfLG5KMM/1wT7vM6y9ugvV7/+09Y09HMqWPx9XIwpg9FBijfwPvNb3Ke3u1sijHu48uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=NJKcO/77; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="NJKcO/77"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f9c97af32eso85038a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738784289; x=1739389089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhr7/jrRE/HjJFixjFrzU1vwqSk/fF+4+8h2TqxlTAo=;
        b=NJKcO/77ZZceteFrkL9p3HILEpEfmxri2VVZ4qj75RvyP5WvEvPrVpplY+lJJaf7id
         Qw5JnuOyD5mehEo1xbbQjWok39tYhARJaHQmXARuwEALZb2derRwcI8yNr69vE019bOE
         sy728w29rA9oVByPwdkMXZFs/XvtgAWaItxsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738784289; x=1739389089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xhr7/jrRE/HjJFixjFrzU1vwqSk/fF+4+8h2TqxlTAo=;
        b=PrPPqlL1eJ8l9NJHPLSvWOyieAUyX6ptbLgfHTyY8tKkkR5XoOUVJFHT0KGr2uzsmg
         b5TUbXUdxttIdWWfQAN82ybx/rte8Uccq0KDeuYQ+qpslqnAlu3hT5DZX/hV37rfgsNN
         gVJUyQYBOmRHDnpXGcSVHUloFPjrJe79M1DDSRSEHFdlGQrvb/U/3rzbw/ifTeN/UaGF
         wh+YexF4BmBJOkbmYuh3KHurRLa0kAAvoD7ZVIgycqWlxOS5BDU5zWiqLC9pYozqFar0
         yjOsWj7jMvXrgxRl6NkQaWx+QE4e++soBiY36mjzJpeHjULvV4PX4/O469tGYU9t+qV3
         Wfmg==
X-Forwarded-Encrypted: i=1; AJvYcCXJRw3BcU0q+71rgvuDFKjrM0VnhPR9R+uBLAvaleiIkJXGBXSn27XSFsR2bfa98Ys32TNbM216Hb685A0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUqu1ZzhcpJpLGmPypq7RWV45NhGsDtcoVZ4pNUEfVoDST7VyT
	qujsAHYTAkzaJm996lrJt7h7djmInKUTRyKULyg+EaWorIFGLUgWugfzUM0n1CLhNJWL/0BVj0x
	T
X-Gm-Gg: ASbGncsZCX5fPdS/BQEsvPoa1f+YGm0OyKPyWpmFjzSUJ3ZCgDzjmb8/Cn2KsDgUisF
	dOL2cZod1N5sHPiuveK7qzt8wkjHRr5nhovJJIZEuw5/vMzdvM8ffE/gNc7wRMXdytJh1jET5jT
	qY9XzpYX1vWuXGgLdMwblGHflHVQFa/3KGmcB93T8hJVEBvidMKVDAM2pMOsVUibzyu96BRiDLp
	jUHTwMBH2F8jc6WTuDFb1eCR8EK7vLkWafTUxvXDLyHYqmkkZWm73Hp808WN04ikXtvmfpr8fv+
	I7+besxlUFwLKiqGoO1RT5U=
X-Google-Smtp-Source: AGHT+IEG30GcyrdDcVUeAd52bYnK7kh1XNEPgfaw3ovyxDPoEE7UUtYd3b0uGutzocFSSVDCEArnAQ==
X-Received: by 2002:a05:6a00:9095:b0:72a:8f07:2bf2 with SMTP id d2e1a72fcca58-73035117eabmr6796991b3a.9.1738784287337;
        Wed, 05 Feb 2025 11:38:07 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cdc3fsm12898784b3a.124.2025.02.05.11.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:38:06 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: pabeni@redhat.com,
	edumazet@google.com,
	sridhar.samudrala@intel.com,
	Joe Damato <jdamato@fastly.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Mina Almasry <almasrymina@google.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v4] netdev-genl: Elide napi_id when not present
Date: Wed,  5 Feb 2025 19:37:47 +0000
Message-ID: <20250205193751.297211-1-jdamato@fastly.com>
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
 v4:
  - Fixed a typo in the NETDEV_QUEUE_TYPE_TX case (rxq should've been
    txq).

 v3: https://lore.kernel.org/netdev/20250204192724.199209-1-jdamato@fastly.com/
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
index 715f85c6b62e..b5c4e42351e6 100644
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
+		if (nla_put_napi_id(rsp, txq->napi))
 			goto nla_put_failure;
 	}
 

base-commit: 0bea93fdbaf8675b7e8124bdcaf51497dcc8bcfa
-- 
2.43.0

