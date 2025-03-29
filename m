Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79322382
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 00:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743206437; cv=none; b=XdwiA2xtYjyS8Lb9yIohAWbYNzgbHwD3GhbpA0QXSRmgzgMIhykXKv67SJpmb+j2saLUqmRcV9mcRSYwMSbrM1qIbSkZDKLEWTaFG4QKl5P1xS1GKjgH+dm6g4uM+dERvuJ5fJo/9HNwp3RYRtSPdPWOJQtzf4N3GW20d+XJlvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743206437; c=relaxed/simple;
	bh=f3KSLRYztPZtU72e1oNCDVjGkG04iAkOXF18dQTDwcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QN0an0uherM4YipoppmFA6x6OofsIZAppIQd4KqC+/Dnnr+x1P93V+En45JA9PNkvpz6mru78x5RdIvKt/TG7IWn9ow4JKs8sCDnJYm03y58SkHIiFkfOoeoplKP4MpyBz9thAia+h+xmBs9wgZQNF1MUleXDAM2/hx3mA765bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=pp2NSedk; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="pp2NSedk"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30332dfc820so4720740a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1743206436; x=1743811236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPU1V9zbGuhTRVdKEH46RBvue6zoABp4B3V2TgOPmvI=;
        b=pp2NSedkLSuzF1Yopb4MhjpcQ7J+jMgt0t2Rp4sfJoOPwXaudgj8M130kCw365X652
         eMjH5Iv/B4n3uepLW1xMjQKo0MaSwDi57RWx6KKt9YkjISBwCd8+rqnfyq9ugv31q6ux
         aUN47hqKNKatMClDxFcrJMwodz9wWj6PuK4pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743206436; x=1743811236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPU1V9zbGuhTRVdKEH46RBvue6zoABp4B3V2TgOPmvI=;
        b=D1RLvG44aoj71dPItEYq/x5yrzLzGGW5WfKbCV1Lz7hH5yNyF1EmcDatQJ7HT69GQ/
         Gj/6XkeX7QGg4xLIznUtA6AcajaXdbZQB2mgvQdHJfzy0m2JYhkKhOB8pGH1x1DaPwlt
         6Nm8a7wA7L3tTOKv43yPnW6bf2b9QjbpLYna1ej8MKEfXbCHpqBjghBLqBdP6wo8XaPW
         SvTKFFam8fC5vpcmEsT0b5buaQYc7yAgLhRyq1lcwy8NFR8qKjW2XeusKX/O33OOFka/
         orrUpkhovCs6FB1xZoWCM/icHnFGLEQrMOpUxRjcWJcSb+PXiGSYaOPlnziUlXjWHpqD
         1WMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqJNgPdGOhk7k1/bQ+wQen7AOvAKtDmC+9PiYuA+GClZ5IlAktLxAsqiD/2PE2JLxk0gRuDC67AkZi+TY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQe1eSmufjlTaLfSOgT2PglgOhMcDEqkpGHNLLnnoeAzmRzLeo
	7PAc3oUrC8mTL5s6+UBpyomq9d2W2ySNGRcPkrSDdrx1/n+gLKFrIYbZe9qKPkY=
X-Gm-Gg: ASbGncuF8IzV8P8USuYJ1j+qOUdBcR0uTB/nHWCJtdQqEoLQPvJCuzDlRFRRN4+RvCU
	KcLham7Z2OGkv/+csbUEjjZm2wGTAzV8gQOGiHyRM/OQej73HUNSuqkdQvEVSdBfnuuxoVuaT+R
	wcXl2mKQQCdWY43ltt8Z//ILde/UAaK7DCYcQZEw6eeon0zglpmvtXXlq32nHoY/CAxSUx9ekG3
	Jf0rJdQ4vSlEY8uWaVBTR0IAg3ij5t3wblQQPWkQ1aBz7aoRlpIOnDT511ajoNyGNAcvjL8/qRH
	2XXrAyG+m6sRw00GIcNxHSeY4WDlCmYg4PULVkG2OHzs/ct/YXLG
X-Google-Smtp-Source: AGHT+IEiHctilbl5kXRUYriQQ4AJ9teIGPfWkfa8XK07O0x+MARn/bB66YVW99QeA5X5lwnZVkzjeA==
X-Received: by 2002:a17:90b:2dc2:b0:2ee:5958:828 with SMTP id 98e67ed59e1d1-30531f9fb9dmr1727941a91.9.1743206435615;
        Fri, 28 Mar 2025 17:00:35 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4ba4sm4857139a91.31.2025.03.28.17.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 17:00:35 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	David Wei <dw@davidwei.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC net 1/1] netdevsim: Mark NAPI ID on skb in nsim_rcv
Date: Sat, 29 Mar 2025 00:00:29 +0000
Message-ID: <20250329000030.39543-2-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250329000030.39543-1-jdamato@fastly.com>
References: <20250329000030.39543-1-jdamato@fastly.com>
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

Fixes: 3762ec05a9fb ("netdevsim: add NAPI support")
Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 drivers/net/netdevsim/netdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
index b67af4651185..1c67030fba6a 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -29,7 +29,7 @@
 #include <net/pkt_cls.h>
 #include <net/rtnetlink.h>
 #include <net/udp_tunnel.h>
-
+#include <net/busy_poll.h>
 #include "netdevsim.h"
 
 MODULE_IMPORT_NS("NETDEV_INTERNAL");
@@ -357,6 +357,7 @@ static int nsim_rcv(struct nsim_rq *rq, int budget)
 			break;
 
 		skb = skb_dequeue(&rq->skb_queue);
+		skb_mark_napi_id(skb, &rq->napi);
 		netif_receive_skb(skb);
 	}
 
-- 
2.43.0

