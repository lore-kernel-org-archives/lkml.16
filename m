Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7351CEEBB
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610253; cv=none; b=oDWrER9ZPuinzrYFTPiogyfbZutQ4zgsNf/Sdz1/VPhZiqIMDeO1cQBW9DM1mIVkrBlb4UhHaWbJyOOdH9W+rFS28qVx1mgn67AFuByl+I6LzRiZ5XuFUdAmxi1A++iVI1MD8DOC7X7Xvaxj4VlCKGxK1pGWuxVfSrSYwAn5BPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610253; c=relaxed/simple;
	bh=UQ1+/UhYDCAc88I4jH9qhRA47laIsXE39uyV/T0ipVk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R3s5PvhrnKuqWZFM15GuvMwajlrDSta8kzOs+wYbRI7lTzPZUKdSa1MVuEMUmg6hDVFzahrLWfLsienfv0vccO/2kqKPklCy/2K5EEcDYEX2yQhaZN/x6trTPwfsBSEabFYO9fOOa84ghcvL2D6X/QGFzHVqcW924JzhXzUDhus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=qszbztml; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="qszbztml"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166f1e589cso17877175ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738610251; x=1739215051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ma8oDYqKo7lDdjgaSZH7Zvfd+MYM+1MHiJpHOWnUAKY=;
        b=qszbztmlNfYs65wZ1+iDR60XzrYiYb+SpivpCcd5wP4G8Lze9QrJRcB8crAIZJlsG+
         78rzDzQhOA/3woKITISN9L2ZXNy6kB/BgfOfyJaeK8pSuy+N2kfSzQrzYn0uQ5Ea167T
         R4Q3lgIVoGS2xRlpzv5Win/3jT34du/VfcH+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738610251; x=1739215051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma8oDYqKo7lDdjgaSZH7Zvfd+MYM+1MHiJpHOWnUAKY=;
        b=Mtn1G2LWkiGTOfwYyKw2HUK+9Qlrkqrr/yKrFfCdXB89SdzWn2aYG34OiqLU3tgwQU
         CgPzYkiHckvY9EbiLbRahYqnu1c/VOEDTozKhQIG7vWwHlkkd3RUpOqhI9TFUICbPoN4
         xGRy8FKXHVxzZiCKYdMWJhdHzL+6N4sExKg2tfysfyM4kfLTfsZp+92UQ8sX7YLELBVj
         aomQMkd/kxyqyIY2Xf+zDvMua20okQ05joys5an5jsLYhVcVyUHdmuEuvS9YYOpA1/bh
         e89H8VQ3pMh9/GYiI1AsoB+wfYa0h53PB2RST6AxbQVT6EWpmeBtkx2ghATt57+ijFoo
         29xg==
X-Forwarded-Encrypted: i=1; AJvYcCWtR8LmbgU69CpLHA2ZOxlYQnANYHKm1cohiTTLZpLcDfdoWMMlRGZj61oqQN0o/44hSumsVHKiH4iwWfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0T0BwJfJOQRX7mqEqFje9vt4+g3JbIgoVoQ6Lhguoe2fKCfsw
	Atn7nirosYS5kXuv+vChQFX34jKzfGm5rPEYWkS7OEhMDE9v3So4GkTDDMyxNFU=
X-Gm-Gg: ASbGncuSMvXMT5liML8SwfOUWw5sVrTENHLZsKdLEw2aJGzmOlxaPNt85xAgv7GPVqo
	YiN/YskvJ4WY5mGmZEB0ZoHhiEFHPptzJI0D8OGNECyMEitrmFctQGVUkdOXbQikTFMZvp5lgo7
	zO/PlCuoar7rapXCiLKcttcYCXHkifmqGngb64oD+Uc0Hbldim5U9oqso1hnwbXksBjegA8awQg
	CTNte/Xl3Ttq3v3SLR+mQix1fQOqlKDe2LHCEY8upC6VmxCO7Jdhju5nFiLaFRhlf523JuBaRL2
	9JPrbqlt9H+Xl8AQcY4HA2o=
X-Google-Smtp-Source: AGHT+IHzG6PqWTcyGDPpk3jh1F2SSoETgcl5mCtn5/bNJ/NqYro/MRaiKmT8q6TwTBoZ+pejU4zr4A==
X-Received: by 2002:a05:6a00:b95:b0:72a:a7a4:9c6d with SMTP id d2e1a72fcca58-72fd0c9da62mr38596585b3a.24.1738610251091;
        Mon, 03 Feb 2025 11:17:31 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba47esm9046550b3a.96.2025.02.03.11.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 11:17:30 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Mina Almasry <almasrymina@google.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v2] netdev-genl: Elide napi_id when not present
Date: Mon,  3 Feb 2025 19:17:13 +0000
Message-Id: <20250203191714.155526-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.25.1
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
 v2:
   - Updated to elide NAPI IDs for RX queues which may have not called
     napi_enable yet.

 rfc: https://lore.kernel.org/lkml/20250128163038.429864-1-jdamato@fastly.com/
 net/core/netdev-genl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 715f85c6b62e..a97d3b99f6cd 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -385,9 +385,10 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 	switch (q_type) {
 	case NETDEV_QUEUE_TYPE_RX:
 		rxq = __netif_get_rx_queue(netdev, q_idx);
-		if (rxq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
-					     rxq->napi->napi_id))
-			goto nla_put_failure;
+		if (rxq->napi && rxq->napi->napi_id >= MIN_NAPI_ID)
+			if (nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
+					rxq->napi->napi_id))
+				goto nla_put_failure;
 
 		binding = rxq->mp_params.mp_priv;
 		if (binding &&
@@ -397,9 +398,10 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 		break;
 	case NETDEV_QUEUE_TYPE_TX:
 		txq = netdev_get_tx_queue(netdev, q_idx);
-		if (txq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
-					     txq->napi->napi_id))
-			goto nla_put_failure;
+		if (txq->napi && txq->napi->napi_id >= MIN_NAPI_ID)
+			if (nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
+					txq->napi->napi_id))
+				goto nla_put_failure;
 	}
 
 	genlmsg_end(rsp, hdr);

base-commit: c2933b2befe25309f4c5cfbea0ca80909735fd76
-- 
2.25.1

