Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8968201262
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747171248; cv=none; b=jFR0qRaCZFZ4hLGx5FnyO3IjdROXgDVsMC070riHGnA5K2Uzi6GDeT43uqzT5kW9z9uK5RjW6Er1JaNW+FxHsemw1pjxOwjKLa4MBPFZRxH6061RcNgfz12Rheke/dewr2UCTdhoDaVruTrTwIPetL00tX1/i9hMbyKMI+Si+CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747171248; c=relaxed/simple;
	bh=M7pXAiXplMTRQs+4RjP4ptAizMSNn/X1Eyo/2bXfjKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ghmSxMzgZWqBQ7vVkwHCHH0PyHQ7L/6K5+73S+goVKtT1/g3TTQ98o54p4bTUYwfjvanBVxM+JLBF+oMW8f6JbuPayPeLdl/VyHaKb6Os8hC+lM6MD4+i6BZxUARyxHztoWTPdXVIM+rg8pVj0c6AH9pVrhn+/C51Shh1dzOMB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=T6kk4+dt; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="T6kk4+dt"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74251cb4a05so5183148b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747171241; x=1747776041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tktSgBWAVXWMwa5kK+nyg9pqAy3BG4YkGNfURyQ8YpU=;
        b=T6kk4+dt+OZKE2v1pg5D/KZVJd6k44Pe+8jU4mn3NnMddNJqVo3msvaXAj2YswDf10
         F4ATt2wLo88uxZiQM3pIlcZf9cTpQyOI5GBuhfVZ32DxgqZjcgW7lpYeGuQz02tRv9MG
         mdUY+tHhjRuncOxcxNVwJGaAhTWyBdnxu+WEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747171241; x=1747776041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tktSgBWAVXWMwa5kK+nyg9pqAy3BG4YkGNfURyQ8YpU=;
        b=o4ALOi+hy5zKDQVkS+yd9IPolD459oX89KKL+xwAwVfG0pOsNiyL1zWYRtSqrxwFOB
         VKIQm239G3btfGrnlGOumwFFUnmiL5koEvu992w1ahtB3gbyWHxeNZO2i87reDrh889W
         pMJs2YMK1xZhpL8zH04VJX9mQq3C1vycADuAVb8co1jeZcrHp8meYABXZdXZ6nfd9HQu
         bg8+b72AiX2NvxWrk6mLK3nWeO5XM06o5fjW7KvOlx9hIYgHHYeRp2oUcqWPPg4Q3ibg
         A7Pm1I09YLHEuAUl0Lh1CSaqMU2tc37qC963+tMo+r8qFrEsvVOtwidtC7v+oHW0YsmV
         KYIw==
X-Forwarded-Encrypted: i=1; AJvYcCWCrq+4vjyNH3lD9I4l3cEW7AJrLNpN2kG8ZNq/8MkW3MqJy0ZdF+ls86vC8yxmvE3aTZr5JdwYefHGgR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKYpdvTVmdtPoAATF4HvJ03zwVeudW5FXkacRD7CZTUhy2vsMg
	zXIR+Rhhqf/BKSXPnTK0SBgWcKOtIe4BHcv+1iU99JysB6Oe3fbakge9dMTgZg==
X-Gm-Gg: ASbGncv4MHF4vIk1lBTegLSuRaDq0gLHmDDSYROAphVE4iqDwyB0scmX11BgwLuHfse
	fWHKq4MFDlksrLCBk0SJd8j9BKpLiXwMitEJX7lWIBsT36WMY7ol3tyuyhmaKmH7h+RWfJ19hXF
	+jftaZZ+5emLMQ4UGeJdyLLvAlfKsJTSnUtfypP4J/sD6sF5qabg00V3a8v/gGirvaFnYvEmaGn
	/24lwAb/KODQJcTtJeQawRzSaMLc/GxDOs4oJZ771D6YFmTczaMNbNd3cGfzGPeowZPTnBJYq9q
	ATsj9vAZ2lQ7+PEZ6+sDQ+5idfPQqeCmc6k6p10b+l7EoUt76RONCKyBazyF5pR+F/vnnxDS467
	/
X-Google-Smtp-Source: AGHT+IG6NMNP7O5vMscL8kEzMjj89CSjv2pzaVBWi4tL1mCe/KfuLBlCNoNKBpsS77XeTzHY9qPexw==
X-Received: by 2002:a17:903:166e:b0:224:256e:5e3f with SMTP id d9443c01a7336-231980e5929mr15136515ad.25.1747171239761;
        Tue, 13 May 2025 14:20:39 -0700 (PDT)
Received: from ubuntu.. ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a4c41sm86671845ad.237.2025.05.13.14.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:20:39 -0700 (PDT)
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
	Ronghua Zhang <ronghua@vmware.com>,
	Bhavesh Davda <bhavesh@vmware.com>,
	Shreyas Bhatewara <sbhatewara@vmware.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] vmxnet3: update MTU after device quiesce
Date: Tue, 13 May 2025 21:02:40 +0000
Message-ID: <20250513210243.1828-1-ronak.doshi@broadcom.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, when device mtu is updated, vmxnet3 updates netdev mtu, quiesces
the device and then reactivates it for the ESXi to know about the new mtu.
So, technically the OS stack can start using the new mtu before ESXi knows
about the new mtu.

This can lead to issues for TSO packets which use mss as per the new mtu
configured. This patch fixes this issue by moving the mtu write after
device quiesce.

Fixes: d1a890fa37f2 ("net: VMware virtual Ethernet NIC driver: vmxnet3")
Signed-off-by: Ronak Doshi <ronak.doshi@broadcom.com>
Acked-by: Guolin Yang <guolin.yang@broadcom.com>
---
 drivers/net/vmxnet3/vmxnet3_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index 3df6aabc7e33..58027e82de88 100644
--- a/drivers/net/vmxnet3/vmxnet3_drv.c
+++ b/drivers/net/vmxnet3/vmxnet3_drv.c
@@ -3607,8 +3607,6 @@ vmxnet3_change_mtu(struct net_device *netdev, int new_mtu)
 	struct vmxnet3_adapter *adapter = netdev_priv(netdev);
 	int err = 0;
 
-	WRITE_ONCE(netdev->mtu, new_mtu);
-
 	/*
 	 * Reset_work may be in the middle of resetting the device, wait for its
 	 * completion.
@@ -3619,6 +3617,7 @@ vmxnet3_change_mtu(struct net_device *netdev, int new_mtu)
 	if (netif_running(netdev)) {
 		vmxnet3_quiesce_dev(adapter);
 		vmxnet3_reset_dev(adapter);
+		WRITE_ONCE(netdev->mtu, new_mtu);
 
 		/* we need to re-create the rx queue based on the new mtu */
 		vmxnet3_rq_destroy_all(adapter);
@@ -3638,6 +3637,8 @@ vmxnet3_change_mtu(struct net_device *netdev, int new_mtu)
 				   "Closing it\n", err);
 			goto out;
 		}
+	} else {
+		WRITE_ONCE(netdev->mtu, new_mtu);
 	}
 
 out:
-- 
2.45.2

