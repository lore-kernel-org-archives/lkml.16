Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C851D4C98
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 16:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748968448; cv=none; b=BBLu7WuYNwwGMynMYCqf81Xs7M5n1WxLY8qLeKCDNAuqg3INHA/iWDv4hyT50GIIqumjzDffcWPFOfNxlRspb4wixOblqcEIv9UohHzCPq+VhCQTjDxnylnYrGylWVzVG5JsbrMAGNYcvMw0muM5aCcD5zXYK4KRjB5swfS7xmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748968448; c=relaxed/simple;
	bh=nlLPe4JNT/I7zrGVVpCD4KiakPXWJEJV8KoS2+0nDE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NBMWxPK/Ay95lVdZ/c366hTDHB6TxS9S921PX/+wqgbXIyVUSN5HzhMuN+XdDyWSBXxmxD8JVaghwhH0nFWIUuaQiMaDj+ZoYUYpKm0+70XGy03cs+YvY03DU7mcd448vljvdxapCJVmpy/AEFTv//QdFqsEPqweyESJVqarWNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=dL3X8bF1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="dL3X8bF1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23228b9d684so62019225ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 09:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1748968446; x=1749573246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LVPg9RSU5+0wf5EHqV7EnA6nX7rFFrDnz8hGU29mQNM=;
        b=dL3X8bF1bN8aazE/WVkQOSJUQBEQvuckfDCxs+yNAwNdl3CqFTiEvclmuSBobZkfXO
         hoRlSPrlpGx/e2AeXU9jrBSYk4gDcAgEbPebP/bVnLw+9JRe6EiDao5MbzEX8SwtZKbo
         1LUVF23tmslwhhEArYozqPRE3iUsFN04Kb+XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748968446; x=1749573246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVPg9RSU5+0wf5EHqV7EnA6nX7rFFrDnz8hGU29mQNM=;
        b=j1InkEs9CqiZ1s5nJbpFW/CJ484UVVdbJXNz9DNPjrIcAkJgDLEqDWLJ8AW9dMALyb
         gKbF8n+fRR7b4p+HkBpKS/mOzk36FBl62cwWg0Rtsj134iw1yTQc2gdCwJcYQSWoUOaA
         vQIVyhW1AEaiOKdQ5LfXHQkL+yeTXV6Sbm00utT7c07ueww8GHXPWplc7RHzzIzjmcpF
         vWjGx11Oi7XUZrCRQA/RZ7egnlG55CDGQbdLJz0sQvbLx/tum5nqBlIQcNb/mGw7gBa+
         VyqU6ltCN+6FeFXalhRKywW6ot4U7nxnFyw2mlFhKTutuVYHKusOUx2VtyDGxtWIqk4t
         slsw==
X-Forwarded-Encrypted: i=1; AJvYcCXEszcWjY3JoXseAnd0OEW3k+bs7zXNVBrHwTXGByyoMpuCdTPsKz0deo6pw/16msYR0/bfD9niczojTEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5Amc7BTIin3hjzUSvdpSQr4H9wgF5wDoK2olAX8UceeBv3hT
	L1TfPfXj3f06CTombyUgMeySZc5gnwJezBYkSHimYdYJJj4drZvxrD/eg77EH6Cg1lU=
X-Gm-Gg: ASbGnctWlqriMKTnvlr0Eil4Iqs5ZBcODkX8nS5UmjG6+QXaTEjgxcvmmp/VBD8dTiz
	oSkMQ30qZPjIOBSD8g55kVONkZOIdg+ndMonM32vfGMZ1U2xXVA51sk2sCWh/OcN0rwxjW2o0e0
	towfpsYAjHyfcRm0zayMi2cQx0Eff6cn1Ev89QRzVX0RrwY9vX7JfVYByEYziBZgwEsqi8c97ZT
	iTrgK2FuUxDHFL4NJNiRD+7gbWowbInloW5Xa1hIXIrOUJD+t6Pd5ybRRFqZOR4PGjTq1Tu/JTz
	fcc3rzahOKS07ANKkvD0tTszGg4dLPaOzAkp4EMyXy+VC7L6Nl3bwbdsMao=
X-Google-Smtp-Source: AGHT+IEsG8RwJJ/qUZ31YozpAFPSnp5YLObkgNdPKm6K9ikVW9NpcBa7mfYOTaEM2xDXXZhOeTyawQ==
X-Received: by 2002:a17:902:f642:b0:234:de0a:b36e with SMTP id d9443c01a7336-23539648068mr242371285ad.49.1748968446027;
        Tue, 03 Jun 2025 09:34:06 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3723sm89477255ad.133.2025.06.03.09.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 09:34:05 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	john.cs.hey@gmail.com,
	jacob.e.keller@intel.com,
	stfomichev@gmail.com,
	Joe Damato <jdamato@fastly.com>,
	syzbot+846bb38dc67fe62cc733@syzkaller.appspotmail.com,
	Stanislav Fomichev <sdf@fomichev.me>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org (moderated list:INTEL ETHERNET DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH iwl-net v2] e1000: Move cancel_work_sync to avoid deadlock
Date: Tue,  3 Jun 2025 16:34:01 +0000
Message-ID: <20250603163402.116321-1-jdamato@fastly.com>
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

As reported by users and syzbot, a deadlock is possible in the following
scenario:

CPU 0:
  - RTNL is held
  - e1000_close
  - e1000_down
  - cancel_work_sync (cancel / wait for e1000_reset_task())

CPU 1:
  - process_one_work
  - e1000_reset_task
  - take RTNL

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
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
Acked-by: Jacob Keller <jacob.e.keller@intel.com>
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

base-commit: b56bbaf8c9ffe02468f6ba8757668e95dda7e62c
-- 
2.43.0

