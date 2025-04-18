Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D2D1D86F2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940265; cv=none; b=V7oCe66AP2U1W4PlYN93wCTaCLE57RoduOL9sKvuS/LOUHA4TAt6ywMYHpgYUmbsXlrONOXl6vRWzlR+LTgsKgjYeIQxUtOXpgkWgPmOXvHehJy9KAqtNX+k9ekBJpueH4BB/f6rk+IgXxDmWjyQFFuyiS3K0eiw6j7HS61z85k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940265; c=relaxed/simple;
	bh=peXZjv91qcnXAES8N8mnCKfga6OZjhML/WpesH4NfKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8JeH9U9lY2BEmdgaKTDveYxQnlJT39Pjq8fju/PhMRM2rAjzRUoXrDUxXjZcPvPOwaD0v39+KwXEd8KaBr/RCCtieXwaKxzIaVfthKdTZq+wxo5HBByyp7gj5K7W8tVVxx6t96SSXShjC2OW1jiRF3sEr67EgjlDECq3DTQgtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=j7x+faJB; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="j7x+faJB"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so1411430a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744940263; x=1745545063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6JaAma8wr++LnPs79mPGowXaCOiBb9Nd8NFNngwV7o=;
        b=j7x+faJB7PauCqeDJBAGYtCJleYyaGfhxRPU7+OzMNTqmnda2g3lGLmqMcM2YdEcbE
         iFcrG/0bDBa/SKptriRXV+hFA3ahBTkywmMfTTFvpBhUvy6jUEBzKZNLqU1mBkar53tD
         4gDS/cVjfyFKEnxY3UgTX0c0PqaxTN04/WPnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940263; x=1745545063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6JaAma8wr++LnPs79mPGowXaCOiBb9Nd8NFNngwV7o=;
        b=MuRiSvSplsUDMQzrku6vg7DZF0jNbj0gd5DMwBAfMb3LVQlTi7gWbFPRz8TArhKETh
         SIStvFMJ6XPjZ3mvu4WdEQXrHJlO+3o4v2XAXpFEA+GTFviDo/X/AmO0n3ex6A9VRxBK
         AdiacvyKOxvludkSnsYKiJHrH6KrG6aLrC4MzsadXLP8lDlOU9wXCQxwXXPqtyr/TgBK
         tLoznyB3tcieOH9NBgpQjsz1toc6swDzASYQXYomtHQ6eO8PRbQ/QX/Oq9E1Cb2AftvD
         LD8TmGeNcSlAhcYpJDVI0B+h26L46aq0DplIJB4k3zO1XCbbO8UnFaMeI114oHoc+fa8
         g3fw==
X-Forwarded-Encrypted: i=1; AJvYcCUiVsEk172zqw6UMcb3aJ1/rTA/aVyvaD3QqtVIW+yoxtlQ2IhpeLbKNrMB7PgJb5eT5MHXYAPQWS8bz20=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXc+ui4qlToLEPJYN1E14MVOoqTmX8jDSKNpBvw33web7oz7Vp
	9TskjnA0JouWNXa7oU9ne8Jzff9sSpV5KRwncah7TZbfdamk2cURMYsQZ16hoxI=
X-Gm-Gg: ASbGnctJfnUgoxil3Psre93j3jFtFbxGY8qeiWnSet/OwvLoue/bkDH4mH0VPtXzB00
	y1HtYJn9yjJvYy5g1rVa02KP686gsdXpfJKM+ov7s8p7opGYyks7GHtbsTnAteYs7Od8R/iA3i8
	gMFMMBdbxrpKnPPhL9Z4NLnvH6GwUt3SeTZOisk0IHEjpk4vlmA7GFCXCjpmaDXjEvrDwuNiwP5
	3D1PeUA+ZcFMU86U8twcCuT13Ut3RpFNopJioLEr7LX4A+78pT96fYAU/wTi2Sj8rOUEXse6wsN
	zXeVMhv4oMxNk2J7EhnAwx/bcGT0sFkD6P1dDSatAyyEoEY7
X-Google-Smtp-Source: AGHT+IGoyjXwixKtaT9nwokLFm7CjWprehonQ2SRJ8/gfnreftjHTIyWeFkj8zCAWIIkh7aMFJzOlg==
X-Received: by 2002:a17:90b:2744:b0:2ff:53a4:74f0 with SMTP id 98e67ed59e1d1-3087bbc925dmr1451743a91.29.1744940263562;
        Thu, 17 Apr 2025 18:37:43 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df21278sm131772a91.29.2025.04.17.18.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:37:42 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	shaw.leon@gmail.com,
	Joe Damato <jdamato@fastly.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v3 1/3] netdevsim: Mark NAPI ID on skb in nsim_rcv
Date: Fri, 18 Apr 2025 01:37:03 +0000
Message-ID: <20250418013719.12094-2-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250418013719.12094-1-jdamato@fastly.com>
References: <20250418013719.12094-1-jdamato@fastly.com>
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

