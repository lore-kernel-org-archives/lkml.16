Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4311D07BA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361108; cv=none; b=p6M+BAfNVY3bARU5LUJCd6zq5Tqr2WdMcS9DXQohtjaqBZGi/iJMJQQ87XM4IMvhjRvBPbF537fqsTYSzpwEtIc9h/nfFrG9TfSNe3Gss5KxtpBNJC4oaFAXWivuUsyXsgGqwyW819mP2nokSNU0EIBEVnIHF241TneNRCeng8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361108; c=relaxed/simple;
	bh=qBn7O+oadgbDt/1DtKOEuIzBWBkB2LI6zoWM54Khkxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gogmw4jvGpdAIA13G5l4sl+XotYYZPB1+rhNBeqNkIjA2o+oMHeVYoU8pexA2qYJQyRocAZU10rA4qaznkX3a5ph4L6fvBgiDitjvvaQDZUS8GxxQK94d1K/PnxIPky9HyTGYL9n9SLRmXgrNg4CXb+QQYRLQRKE/Biid/aotiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=f6oy0p8R; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="f6oy0p8R"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234f17910d8so50933065ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751361106; x=1751965906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz6fO0/Nn0kDVM5mJ4z1SaT0UByDPCAgmjtmOz31sy4=;
        b=f6oy0p8RIwn9sUruT9UoO4seTJc1rqt4F20gzhlvR99eF/1wGN6nv2NvAL1pw3Bmwj
         6JIYSgaZEh65VUG+mfqWCblyqiW528TcCaBlasEI+Bg+jOE+LsZSfVWLBX/rZFsmIYNa
         WRAgN+iZX1iQ/WlpVL3mWZXiS1L75Tc/hHxqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361106; x=1751965906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uz6fO0/Nn0kDVM5mJ4z1SaT0UByDPCAgmjtmOz31sy4=;
        b=rh/pi9NJczT3xeLIpNsNRHU2LHAhwnC+z9YyubdWHW1AouvYC3b99EWSbK6j7WoWAw
         GCgGk2vgIjZ0W/fy3vutpxRauLQCCEvG05gFkvKrNPlNiJtd50wWNmKQ7h3Ntsj70iHs
         WFh6ygN6+WuLRBHe8cIefWa1rAp6a2vBsUWNKU2zzyYKpZzaw5LzlvcVkwRBM0Fblxhm
         F2QsGXgUWklgBK5NPFz7wIekdiuiubf9ShaEB0k2AGCsW6B0eEYhrOymlmtYhVSuPKVE
         nHnxOPEeOzVC0A89sxUS+B3SgyEDhSAVQXWYSe4vOt4FteQCtP7TwZieIqh/Ulncgw3R
         6wPw==
X-Forwarded-Encrypted: i=1; AJvYcCWz35jwcg61B26ptE3I3kTzd/GUs0leOwY7tGofi6jrXFSttK3BXTlxp0/v547jktz7en2dVast1NYJC7c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3QSRklFydqsbKiuBv0GQQPbCnB1IQgZ5Y6/3A+ay7TFDgSBE9
	hoFrIdCLcHPoeCpIsnHlhUDks59fF6fZQc+Fh8Ftt/gJ9cyeJcoQ2PVasrYnyicPDA==
X-Gm-Gg: ASbGncvzsuB/2nFg7T2klPKTcuI9u7xh3pL137emjGmUH/jzN9fbOTMggbDOmjGG20F
	UdTMDG/ejYmc3ucqK+m0BK7WEiYzBch2TeubJ8kHV6wrbplY0REg7njQYmTzZAcNtJ1tPhhHhu9
	cMevdIlDcpi3A7tA/G3aMLV6getZ4RhwgCadyRTIvsoFxSHFOqNRQ7aSqAUoTBU4gVS1a6IRXk3
	SDgm4Y3grUyzfxeujWBYcvJMjmwG2z95LGtavnTIZlaqNWwcmDTjR95e1gV7G2raoi9E1BiFq8R
	JThZTlbbaRGAzSKgVNaDowfTSuicY4E5B4fqlrf1/8vUo5cL8vBsg2uM98bW6yMa6OcSNIIhIpn
	2qejX6LXveUbCkwzOigWEXGsM4MGY
X-Google-Smtp-Source: AGHT+IGlEfsc3kdlXA6znsbIc1Wgfe0QgYv/xrPpW5Q033ESONRrc8Fk+iDwl2r+2FNtPlf8BGI5rg==
X-Received: by 2002:a17:903:2407:b0:235:7c6:eba2 with SMTP id d9443c01a7336-23ac4880248mr256526095ad.37.1751361106221;
        Tue, 01 Jul 2025 02:11:46 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e30201c1sm8893603a12.22.2025.07.01.02.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:11:45 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [net-next, v3 00/10] Introducing Broadcom BNGE Ethernet Driver
Date: Tue,  1 Jul 2025 14:34:58 +0000
Message-ID: <20250701143511.280702-1-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This patch series introduces the Ethernet driver for Broadcom’s
BCM5770X chip family, which supports 50/100/200/400/800 Gbps
link speeds. The driver is built as the bng_en.ko kernel module.

To keep the series within a reviewable size (~5K lines of code), this initial
submission focuses on the core infrastructure and initialization, including:
1) PCIe support (device IDs, probe/remove)
2) Devlink support
3) Firmware communication mechanism
4) Creation of network device
5) PF Resource management (rings, IRQs, etc. for netdev & aux dev)

Support for Tx/Rx datapaths, link management, ethtool/devlink operations and
additional features will be introduced in the subsequent patch series.

The bng_en driver shares the bnxt_hsi.h file with the bnxt_en driver, as the bng_en
driver leverages the hardware communication protocol used by the bnxt_en driver.

Changes from:
=====================================================================
v2->v3
 Addressed following comments by Jakub Kicinski
 Patch 04/10:
  - Move devlink register at appropriate place.
 Patch 10/10:
  - Free skb in xmit call

=====================================================================
v1->v2

Addressed warnings and errors in the following patches:
-Patch 8/10
-Patch 10/10

Addressed the following major comments by Vadim Fedorenko on Patch 1/10:
Patch 1/10:
  - Use of the dma_set_mask_and_coherent() API.
Patch 2/10:
  - Added error logs via extack.
Patch 3/10:
  - Renamed functions to use the hwrm prefix. This change affects other
patches in the series as well.
=====================================================================


Thanks,
Vikas


Vikas Gupta (10):
  bng_en: Add PCI interface
  bng_en: Add devlink interface
  bng_en: Add firmware communication mechanism
  bng_en: Add initial interaction with firmware
  bng_en: Add ring memory allocation support
  bng_en: Add backing store support
  bng_en: Add resource management support
  bng_en: Add irq allocation support
  bng_en: Initialize default configuration
  bng_en: Add a network device

 MAINTAINERS                                   |   6 +
 drivers/net/ethernet/broadcom/Kconfig         |   9 +
 drivers/net/ethernet/broadcom/Makefile        |   1 +
 drivers/net/ethernet/broadcom/bnge/Makefile   |  12 +
 drivers/net/ethernet/broadcom/bnge/bnge.h     | 218 ++++++
 .../net/ethernet/broadcom/bnge/bnge_core.c    | 388 ++++++++++
 .../net/ethernet/broadcom/bnge/bnge_devlink.c | 306 ++++++++
 .../net/ethernet/broadcom/bnge/bnge_devlink.h |  18 +
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c |  33 +
 .../net/ethernet/broadcom/bnge/bnge_ethtool.h |   9 +
 .../net/ethernet/broadcom/bnge/bnge_hwrm.c    | 508 +++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_hwrm.h    | 110 +++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    | 703 ++++++++++++++++++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |  27 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 268 +++++++
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  | 206 +++++
 .../net/ethernet/broadcom/bnge/bnge_resc.c    | 605 +++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |  94 +++
 .../net/ethernet/broadcom/bnge/bnge_rmem.c    | 438 +++++++++++
 .../net/ethernet/broadcom/bnge/bnge_rmem.h    | 188 +++++
 20 files changed, 4147 insertions(+)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/Makefile
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_core.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_devlink.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_devlink.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_ethtool.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_hwrm.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_hwrm.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_resc.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_resc.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_rmem.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_rmem.h

-- 
2.47.1

