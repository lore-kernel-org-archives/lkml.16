Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDCDC133
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748569802; cv=none; b=krvOwfcl34YI1QrQxtcONHllcvyROxEUlTRtq8KI4AvbQTDJvtp8lDpFZO8QWLmBI8o21HnScsF/B9EbAUqEIWIRy+kFjoCbqY4YT1F+OvG0+Evxq1MhHkfutG/4DyRjLbQbq392vhSm8jrzhmRPyUHpamXADUwAL5qzuUL1ppQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748569802; c=relaxed/simple;
	bh=CveUHtuP1DptHh8ecfltHD6hRz2GDjqnTk2DrPj0YRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iwlfNjqTd+6ra/Ju4qU8S4dLDaLH+nLAi/iw5efg0AO2NNOEOpV81aXhSfUSpW8d8QE/B+acFLXV22pCc0wtu+FpeSIWcgFewuY1P5VNZhZ6l/0aYjIuYMAkFPbcxWva3YiqPsk/CuH7KUFscIz/DiQHSK3nOuXKQapaaIhamps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=ezXJMaqs; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="ezXJMaqs"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2350b1b9129so7833915ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 18:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1748569800; x=1749174600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=USkdCPHF2PH5TA65vT+omww+14Kmrvo8xr4kQydMtxQ=;
        b=ezXJMaqslCLlNKM9i1+hOJzpaK/oN8rAv3zj43+6OkTaW3WUtBnHQIDndjbejVB+l+
         aYrFR9mG0PhlrRM8QiZJxU77NEefx+Tx+I6L32AC+jZbpbn75hRsuE4/OWNbQElVC/LN
         kowRAtStycOV8YEzN3ooyAkDhJtUK0T0hkHDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748569800; x=1749174600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USkdCPHF2PH5TA65vT+omww+14Kmrvo8xr4kQydMtxQ=;
        b=Cs9Q84INmE6fO09FJcdP3RF2MMUmii5ZdHeNKvwzhQoXXmfKAk65eflXTYWQuDqUTs
         MlQg9xyT04HJEj/yTYlUkLaxkRF2t4aIpidQWowv8WwefwJjt25DEkMCEt0+Vb1zTEbU
         Zn4zEBUVziVy6N73yjF/jFSSLs+NEYYguSOiuWBvDvsmhnRTNfRKvOAYHxy9Mq8OHmfH
         TwKHtxgBi+zdotg2QiVkyLwIdz8RpySuFm1Zu1QNz33Eyg2PTxbxIDXsbxOBLeUJ+pxW
         QSLqVmrIL+2K5q3vfoTfZkM9E1l19qsER9qJGoZfG7DzFlyObLjf78P5TPbUwSi9bhS5
         R7hg==
X-Forwarded-Encrypted: i=1; AJvYcCVM6ocJz/dBJIh9Wg9WAXnDFK2xIqTgTEhFXuQG9Oh5pqBm3/U0x1FYtMbx8tu36ecY3U12LJ6j260dDig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5qC5xHBCDpQL04GNTXi+qJz/ZHUkr5j+6TgEFmY9EAF2y6Rre
	3qCd+07/fcxa4HFK17NfhP5Og+Ou7ipMmMb29GQlOJORFmN5Qi7WdlYyDMRVVv7BJR8=
X-Gm-Gg: ASbGncuixHhgNFrgLExKAWE6t8vix7kDsY6GerAlA9qOqsd0F4x9EKjBu1aU9oOO05v
	gKG/iNEtsPLUIOm+rD8aADu6IQ56hJnxuEjrGpOEWS//MjLK2dRYPsQB+BEc9SfaS4c4JwcCRE6
	fJxgG6P8bcPf7z8LrKFvCN3p7G0mxGZ9pt+LK70h87s0OeXB0YKBs7APosfN6TM612/2PrznC9u
	Rk9tqnpVezF9QjFlDRq5h72uRt+aSkvrMgTcHQJozIKgzah1RdAsTzfw8FExAIIgRp0b8DFBGBQ
	RgeDYGiweNRlauSSHHyvGLCtun0VmuGHKty7tELJn+HYKrXaWVzpAsDO9ns=
X-Google-Smtp-Source: AGHT+IF30dyRi/lEN79RRLEUtNpNXnDs814PCaa5b5ybHznKzvJuCfgL1TejPuzA/dDpqBg0EpC+zQ==
X-Received: by 2002:a17:903:2f89:b0:234:eb6:a35b with SMTP id d9443c01a7336-235396e2b3amr5777265ad.44.1748569800003;
        Thu, 29 May 2025 18:50:00 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd8c35sm18316405ad.154.2025.05.29.18.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 18:49:59 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	stfomichev@gmail.com,
	john.cs.hey@gmail.com,
	jacob.e.keller@intel.com,
	Joe Damato <jdamato@fastly.com>,
	syzbot+846bb38dc67fe62cc733@syzkaller.appspotmail.com,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org (moderated list:INTEL ETHERNET DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH iwl-net] e1000: Move cancel_work_sync to avoid deadlock
Date: Fri, 30 May 2025 01:49:48 +0000
Message-ID: <20250530014949.215112-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, e1000_down called cancel_work_sync for the e1000 reset task
(via e1000_down_and_stop), which takes RTNL.

As reported by users and syzbot, a deadlock is possible due to lock
inversion in the following scenario:

CPU 0:
  - RTNL is held
  - e1000_close
  - e1000_down
  - cancel_work_sync (takes the work queue mutex)
  - e1000_reset_task

CPU 1:
  - process_one_work (takes the work queue mutex)
  - e1000_reset_task (takes RTNL)

To remedy this, avoid calling cancel_work_sync from e1000_down
(e1000_reset_task does nothing if the device is down anyway). Instead,
call cancel_work_sync for e1000_reset_task when the device is being
removed.

Fixes: e400c7444d84 ("e1000: Hold RTNL when e1000_down can be called")
Reported-by: syzbot+846bb38dc67fe62cc733@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/netdev/683837bf.a00a0220.52848.0003.GAE@google.com/
Reported-by: John <john.cs.hey@gmail.com>
Closes: https://lore.kernel.org/netdev/CAP=Rh=OEsn4y_2LvkO3UtDWurKcGPnZ_NPSXK=FbgygNXL37Sw@mail.gmail.com/
Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 drivers/net/ethernet/intel/e1000/e1000_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
index 3f089c3d47b2..d8595e84326d 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_main.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
@@ -477,10 +477,6 @@ static void e1000_down_and_stop(struct e1000_adapter *adapter)
 
 	cancel_delayed_work_sync(&adapter->phy_info_task);
 	cancel_delayed_work_sync(&adapter->fifo_stall_task);
-
-	/* Only kill reset task if adapter is not resetting */
-	if (!test_bit(__E1000_RESETTING, &adapter->flags))
-		cancel_work_sync(&adapter->reset_task);
 }
 
 void e1000_down(struct e1000_adapter *adapter)
@@ -1266,6 +1262,10 @@ static void e1000_remove(struct pci_dev *pdev)
 
 	unregister_netdev(netdev);
 
+	/* Only kill reset task if adapter is not resetting */
+	if (!test_bit(__E1000_RESETTING, &adapter->flags))
+		cancel_work_sync(&adapter->reset_task);
+
 	e1000_phy_hw_reset(hw);
 
 	kfree(adapter->tx_ring);
-- 
2.43.0

