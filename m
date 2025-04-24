Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EDE8BE8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745454496; cv=none; b=EYmZOrC8L+y4PBkGImAL3zmgcndlnlG+t2AcUmGgCIY1WqWzbQzn9vPsM+aDQTxOuAeE3Y5d930pdmeGjGSD/fOivGulvtrOztC0TxGq8iCwftc/89CF156Y3Cyp3BYLoWtP4MR7A+aWHVw2OCMTZ0SIPpV3t7Txok4WiT2R/EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745454496; c=relaxed/simple;
	bh=peXZjv91qcnXAES8N8mnCKfga6OZjhML/WpesH4NfKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lJ3uJWY6Msi8fNnvPvkPsu2INxLMUXjwds1v6ild6bkpGrjYrH1usGpigck2j3YwIO8yBHbEgkzg3ymBTyf3bg1coV9rSAo9JHhjMzKYf6l3rPmQUjj98L3dSTYDvM8h8yi5NRjKHVUjjYAgWXI0J2NfhbnjPsiRaRxnx3e7TT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=xQgtT0G3; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="xQgtT0G3"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so1409802b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745454494; x=1746059294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6JaAma8wr++LnPs79mPGowXaCOiBb9Nd8NFNngwV7o=;
        b=xQgtT0G3NgMoiY22v5qnfKORQEPyZFI0xQvj1+Yb0/4GrQeC8E6hWf9J6Uy7ItYp+B
         RIf3ooMxiJd5DxsBQjexhd+nNJBCbYD0olRn4PRQKPizkzTe68G8YgTVIrxEVa2TuPZK
         wANm0tfGrxEFZGCi/9SoVDZcaN+pGJA4GBs2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745454494; x=1746059294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6JaAma8wr++LnPs79mPGowXaCOiBb9Nd8NFNngwV7o=;
        b=lfT/L8+u0NGF8zv0tyYnhw1DrYjn/rrecSdmU5bw+/pqzllHiw0E89+gCjOzy20Z77
         LW3dzYbIE3YXMrOF0VZe+VLi/EWCXK6jTR+t4JUbuDpbW4X82vOKZsIeJJrN/rT/jD3Y
         9rUeZKJB57ZVzhJGmH7+lP8qKpJK9J009ssGhXRhnFw96E3TEGyFf26tpdqFhWGYmNfz
         IjZGkWBgy7NfflDqQqYyNzcWdG+JJ+dEb1WDmYurpnENkPlWWYqnbe1F7Bic1GzMxoWo
         9dqyKYLVYRxnCZK6QkCKCCEYNg/v0zsJ2aQ39CXskYqiJzqhkvisKHlEZVwJeosU+Exk
         lfDg==
X-Forwarded-Encrypted: i=1; AJvYcCWoiUnvki5D/esUJBOqgdIO93jmAXRAdsDWRl0j7ZfPbYR1HcpwUUoRLcgDP5zshLVLQADpztkSyUGa+fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpMEVEhiDQwOOY/FEH4yQ/BAEBu8FyYpftkFIcIisug8mDWqq1
	8fZe9Yv06KTrt2L7tFRUUQUmaf2lvUxXQ6bg0EU4d1ggPZF8ABp3SCX1UEn+4+U=
X-Gm-Gg: ASbGncsbMnDw7EsjS10kFl1zmPKx8qEh4RY7PvFqy+LkHXD/IbT0M/GhYW5uGU3/lu0
	cLhENTygoifVnUvHn2MS6RYJQQG2CXF+50QxRYwmiASXDX6UZ225JHN7nnhYkC8pmUMZ+K6TK6s
	f1lqPNMPiK98tLcpmVauEQrH0jmBBopKqS+h4fsm3cCWt7It/Xh+u1zzwMXFVnmCfpOhxQBea02
	eExY/V5Amao5sNUFuz78U3M/mgHZD6mPQlxPY5yK0zHCLYVLhpa50GPs7/WF141O7MlZvcpbcqQ
	DzPEiqujs6ZmdxVBIse20st0SL9ZYH/EXJbKTGw+cs6RVh6Y
X-Google-Smtp-Source: AGHT+IFKCZWDrLDyEBVkIjzd2enJ/SHv5mfApzf31oQfNyqhNgFukwVTxCJOUx6z4xW3g53RKeEzNQ==
X-Received: by 2002:a17:90a:d603:b0:2fb:fe21:4841 with SMTP id 98e67ed59e1d1-309ee37cae3mr551102a91.8.1745454494054;
        Wed, 23 Apr 2025 17:28:14 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ee7c4054sm83013a91.23.2025.04.23.17.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 17:28:13 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	shaw.leon@gmail.com,
	pabeni@redhat.com,
	Joe Damato <jdamato@fastly.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v4 1/3] netdevsim: Mark NAPI ID on skb in nsim_rcv
Date: Thu, 24 Apr 2025 00:27:31 +0000
Message-ID: <20250424002746.16891-2-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424002746.16891-1-jdamato@fastly.com>
References: <20250424002746.16891-1-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, nsim_rcv was not marking the NAPI ID on the skb, leading to
applications seeing a napi ID of 0 when using SO_INCOMING_NAPI_ID.

To add to the userland confusion, netlink appears to correctly report
the NAPI IDs for netdevsim queues but the resulting file descriptor from
a call to accept() was reporting a NAPI ID of 0.

Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 drivers/net/netdevsim/netdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
index 0e0321a7ddd7..2aa999345fe1 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -29,6 +29,7 @@
 #include <net/pkt_cls.h>
 #include <net/rtnetlink.h>
 #include <net/udp_tunnel.h>
+#include <net/busy_poll.h>
 
 #include "netdevsim.h"
 
@@ -357,6 +358,7 @@ static int nsim_rcv(struct nsim_rq *rq, int budget)
 			break;
 
 		skb = skb_dequeue(&rq->skb_queue);
+		skb_mark_napi_id(skb, &rq->napi);
 		netif_receive_skb(skb);
 	}
 
-- 
2.43.0

