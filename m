Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED181494BB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744853588; cv=none; b=Y3G0HNq0Ux9tkt3OxprhU7pZ3pYiU+x0QO32bsY7Y//GJ4Qa1u360boNnm9cNDJg6vSjxpUnVtRqXa2sSTCWpJ4n2I29H7Uz5X9wG8x6rSeAM0NaKCzqO042kGbTJ+toNCZEnrJ1Nbl6BYYOvtErQurhJ2CBtDTX66sbxYJNqMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744853588; c=relaxed/simple;
	bh=peXZjv91qcnXAES8N8mnCKfga6OZjhML/WpesH4NfKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKfloZA2n6CuruOsnDX5z2hDNtPV5O1M8EoL7/OiXajx+HdzlcXBjfmGQbZmMpVmyC4kbGEyCpBpv86XxAwpg0t40CDQS0CS6DrU0dZR2KgJly/pj1LNF7pXEu/v7KC5JUb9+RkClGbcgJ9e+9Jjj8GEfp+KD5qfdmoGa/IKYvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=bxk30Ms2; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="bxk30Ms2"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22928d629faso2708595ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744853586; x=1745458386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6JaAma8wr++LnPs79mPGowXaCOiBb9Nd8NFNngwV7o=;
        b=bxk30Ms2EfGd7eBs7o5vLLqLrZTEIjlNZYv7nNvSLAKDvQ98dfGe80N5x21jp71EAc
         ZVi/7rMKNog16ED2mDVERGgFY/vn/5MElZmctCqZebAc5kxirrvKogDYRo9eXHwzCMQT
         EgUGXlgWPhIw/S4adGO7F/waCwfomdWl1pg64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744853586; x=1745458386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6JaAma8wr++LnPs79mPGowXaCOiBb9Nd8NFNngwV7o=;
        b=q4m3y9sMAZQekeyW8m92w6OGWfCd/fhbqCK6+97cBzKoxF9h6ICF+X6c2BA6YMMjLF
         SehP8pn01bgP6jP9C7rOSs5/WuTusFHSdUMiAZ8rSgECXdpUR6iLuVHZ1WSMBttNQghS
         neeTObYXw+5dKPwV8kXApkm/HKLctB+tGFmxUfMPRH173lWGyACqmEYwHqK8ao2dommC
         Q2wSpVNUcp0sbUPaENukyppIj//5Wlj4283HaRTFlecoJozUoU3La2JNTJRlcvNSETUt
         4LNIve3ExKrRPdbRRypIuLZ8h1WwDzl7X7soC3qRbjvRLDlDY0mua3v4+Yk/C9GJptBa
         8Lvw==
X-Forwarded-Encrypted: i=1; AJvYcCV8VqgMmNokuSrh4dm5fFQSyqb6X45FGmj54mqFt1Fx4f3y6gmcAVK7DgcnxWBPUI5cbUsaVuYm1uN5+ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBqtAPH/PzeJMzMiW61qjZGs92uqJ8qcBYiHCIFQSKZse68czw
	vq0CbnEw5hVg6hQDC+2C6tBur8Jg5O1oJSvTR2KEM6a3x2hzViGT8E1uLgHc3VI=
X-Gm-Gg: ASbGncv30Aaj1TXgS1qoRFZCn7h+DGTQhq+0y3KVeeuyfO7AjxItaYXZOA9OdJdcgpi
	uiGtpL6Kb9d5+LsmAo5dxa/kYndmk9ZGI5PCDxMmNB3J5SYhHC4RxzQrgQ/12618rPkPiwVciqW
	TYnuyeR2NvsQ1edcWhdp3+TuiWokh7sWAju4TqoTDwk6w3OSEslz7VzkMcP7RaWM9dvRzz7tKTR
	08K4E5xsKoNiLeiN+0+C1LXpxa2YsFwcTTdOGyORlFk9fOho/e1r+hz+Bu0VTloUqdheu/asx+m
	+NETImnh+EHt883EueS7P2iezjufiY/KxfxFxZ7bly+PwyHN
X-Google-Smtp-Source: AGHT+IHG7ipMCyI6c0/c97Gk3L/+AoJB9ydcVHy1jbC151MdKqezcYzCYtt+B9Ehn2HYIZfDsowUZw==
X-Received: by 2002:a17:903:1252:b0:225:b718:4dff with SMTP id d9443c01a7336-22c35983151mr69095555ad.53.1744853586637;
        Wed, 16 Apr 2025 18:33:06 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef11c7sm21349505ad.37.2025.04.16.18.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 18:33:06 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v2 1/4] netdevsim: Mark NAPI ID on skb in nsim_rcv
Date: Thu, 17 Apr 2025 01:32:39 +0000
Message-ID: <20250417013301.39228-2-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417013301.39228-1-jdamato@fastly.com>
References: <20250417013301.39228-1-jdamato@fastly.com>
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

