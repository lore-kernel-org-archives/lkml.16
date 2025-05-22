Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B0D12DD95
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747934741; cv=none; b=X9pSq3qWiMv85umqGaOGWfcYk6nwZ9MxSOSRl8FDazTBqEAMy6iBbKX3vx+3/dQ+mnF0m0HqLAN39gHDUM1/cbOihp8l/UBzEJgVPIwWKo1Z2E6i6BVcDE9m15kiM98bZHqd5T198gr0e42rDvP4L5VTdCFhDyPsoEX6peU3UPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747934741; c=relaxed/simple;
	bh=pG+Ljcg2NdLwwejPnVH/lD8ZYAmgFCkB4ASHTJpwEYU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=TcPVv4u3+TDOAuW08o3I9qEIo08h/aF++pg2V0PJo4zlGeag6AEDPQffMWel4IuN/khNMw1o7otARuob67iT/E4Hj6AkwI57doP1di/5CnDb50l3s/0P+YolyH4nq1m/pXu17E0VqPLDx9pdzYnaIa/HvcD5dMFQdBDjbuLWLfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fO+thVoU; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fO+thVoU"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-231ecbe2a5dso6209895ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747934739; x=1748539539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tw7FWHJTHoTxSyh8sMffr2afOmlsN99OAoBlNLmMnx8=;
        b=fO+thVoUyU526U49xg/hc95ltVDCIovtcchTW8y5KUjYLLCXh9kPMjCZSN9HQK/Oxk
         wYByQcB8KleiPCEQUaNDWHkXQ4YhsNG0+1F3wSjY92KOfcA1bcFDKia/xV1MrV52i6Ay
         xRCEJtzYZjPBAXsnMMorLsgzvI57WCy0DKvyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934739; x=1748539539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tw7FWHJTHoTxSyh8sMffr2afOmlsN99OAoBlNLmMnx8=;
        b=Kiybu80/CoIeRACdzhzZDkj1XOxM7vxfjJ//nnQxBpN8BSJJ/572S0BiiFtZkPKArt
         jzdWqL/q6d1Y+/1SUzyqofTEUeJqzFXLpZS/cxh/ORvo5qZcMznkaXWqrPRT3+ByZtl7
         /GT/gWaRdS035NWqkIFjWPqIcvWJKzKBjtGQ26kUE7qjCLMBXznZLNnxGjT384vQ1Lfz
         juVKvsQadpaN1QnDHfsluEHgBDSwhLlwnuS+3LGrasnRWpBmQiPyB6yrRzoKpzg0oXE/
         0VCb5Gv5gMe1DSjgr5XNugj13WEDSLMG+eoP2rcScGY1sPFRRI69vS9Osp9JZC4arbI+
         tLfQ==
X-Gm-Message-State: AOJu0YyEF0WQUmx1WZDtLEGGXxq3iS93t5CbLPuStWqQE5593deGCFOq
	ZhhAA4K+lA3BmejLB4/fB8rI81eo3SMntjDanbTvOOsI27nDS5oJMpvw7giPHvGm+FiHlCLWjz6
	giOHLIcek3IyZmEp9tqxvx/ovyPTWNJzIlNYbdv5U8lS3NrFE+wOkuY5geVBeJg/geLJp14fKCc
	H+sB7hg9BHjNPQoAiKwN+Grc75KJoqcvpjVl8Sb3QrYVkA3fjfeNzoi+vrWsTNuro8oemkZtA4l
	FeER2Akybc=
X-Gm-Gg: ASbGncvJNqq3RIDvirb4A9CSFuDtfH0xZ5YiryTFWY5dMO172H9K0fj/QhU1lMvvE/T
	bDbkvEJNNHQ3YBuZso4UWtckM+mBsyxZEO/wjMV+SPrDEk2V+O37VjN3Vd/axf1pShVj2V2xGRH
	LICXnP3MEpbx37EZPWArkyhqBzMWIrw4CR0Mmc5qmBxoswCVxIWi/cf9GhE0Alkz4TBwPrCojkv
	U4W2BboC3YoUSPuUyCwCWCnnQ3fpoRrpcJC/TuY6SFp+LkQE/xsXmJ8bmRT3DqQqhztd6mqAqGh
	m7srHm/uj3bM6uQ4CYJpu8Ja1lWU5oG2a3KnvQFfpcy+1CwpH8W0mzTZNXaxMw==
X-Google-Smtp-Source: AGHT+IHJRMdwimLeCFUPqWI2Rz4/IgYjieooyfaDdhQuq5+G3kUl29ETHlRAzYPjvkWQrpX2AalOKef/KwWh
X-Received: by 2002:a17:903:1987:b0:22f:b902:fa87 with SMTP id d9443c01a7336-231d450f7b1mr141844165ad.10.1747934738495;
        Thu, 22 May 2025 10:25:38 -0700 (PDT)
Received: from bcacpedev-irv-2.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-231d4e97810sm7175875ad.75.2025.05.22.10.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:25:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
From: dregan@broadcom.com
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com,
	florian.fainelli@broadcom.com,
	kamal.dasu@broadcom.com,
	dan.beygelman@broadcom.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	rafal@milecki.pl,
	computersforpeace@gmail.com,
	frieder.schrempf@kontron.de,
	vigneshr@ti.com,
	richard@nod.at,
	bbrezillon@kernel.org,
	kdasu.kdev@gmail.com,
	jaimeliao.tw@gmail.com,
	kilobyte@angband.pl,
	jonas.gorski@gmail.com,
	dgcbueu@gmail.com,
	dregan@broadcom.com,
	dregan@mail.com
Subject: [PATCH] mtd: nand: brcmnand: fix NAND timeout when accessing eMMC
Date: Thu, 22 May 2025 10:25:17 -0700
Message-ID: <20250522172526.3926633-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Regan <dregan@broadcom.com>

When booting a board to NAND and accessing NAND while eMMC
transactions are occurring the NAND will sometimes timeout. This
is due to both NAND and eMMC controller sharing the same data bus
on BCMBCA chips. Fix is to extend NAND timeout to allow eMMC
transactions time to complete.

Signed-off-by: David Regan <dregan@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 17f6d9723df9..1e9d56a315da 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -101,7 +101,7 @@ struct brcm_nand_dma_desc {
 #define BRCMNAND_MIN_DEVSIZE	(4ULL * 1024 * 1024)
 
 #define NAND_CTRL_RDY			(INTFC_CTLR_READY | INTFC_FLASH_READY)
-#define NAND_POLL_STATUS_TIMEOUT_MS	100
+#define NAND_POLL_STATUS_TIMEOUT_MS	500
 
 #define EDU_CMD_WRITE          0x00
 #define EDU_CMD_READ           0x01
-- 
2.43.5

