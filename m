Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3D52153CE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927555; cv=none; b=fEnjCe89BkN65IBgQkW/UT1lPl79nCYJs57thwJj4h7cy1h6VTRkHPOX/qCLjjcFGbhUXWq2IBPqOUYVmkwXJ3Pw1dt6IFrEPUqJIm4tGy45uIJDDX4eN2k8w2LHwEBs/aUFGAWR3QCi4+AWlUIJJxqeavEUoIbnn7nOWTTr584=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927555; c=relaxed/simple;
	bh=usCCUwmjyqyyEcTEx2PPluqEILls9clOgYNF4RVcNQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RE/+SRld+HqqsHFS1LdYN+m53pj3rR98TD44fyjTut3C2ydq5/l/+nZOeOQWveo5op837hhWskifXLdh+6w9M4pW8VhhEWHcAy2OEIFjK75JwNX9NkqvbvJYzhnTuXXhDhwQWhfU7gOfVCuiPMOua5rPO6upkwXXvNbz1JfebME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=C5bzc0nq; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="C5bzc0nq"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2363497cc4dso6903915ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750927553; x=1751532353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dHqqfILujOQlZfvnVRT+lGC/mQsUxHGOl+R4kKzqE8E=;
        b=C5bzc0nqVrcjZ3WIvW2mJM8EDQXabQYgk2B4Q5jRspySPQiWcnLWP9Td68EJO5MjdW
         XXp8W3gnl5WT5iQSCAykHbUtPHzARUGZdE1MSQfnalude829Z2IgcHBxYkUx7UC7+QYK
         c2j9EOByScikwRHUpR7Bbw9TIsYrXTICuZsTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927553; x=1751532353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHqqfILujOQlZfvnVRT+lGC/mQsUxHGOl+R4kKzqE8E=;
        b=cFiM3iZIHVgpWwtga7tvn+qNiE+y+pIAHEU7PydY+bVoeUvZZS0HKcFKyRBBgOOJ59
         lhsJ9yTLGLVtdUTs2LfMwysfhv2ZREdTUOj3ntrC0HdwEq8+GMe4F6HNPzAeaPu3aJpd
         bg/cNuiuEDN7cm8BVXkS8ihgKxH0BXPa1jw1+56ivDmYtFSssdBlyn/vQLjN/YSdAEBC
         4JqTn4gV5V3ewhA0SIVs1XuO0Hl3PXHC4NIFFgKW8w5dM4k1NfixU6DbfSmHVZcZ/HO1
         AgS+a165MYHz2NtMPFrOOU8UXPPHwveZctT9ts77WwYYy6C31pOt5tO6xHs+CRRhkuVM
         XB5w==
X-Forwarded-Encrypted: i=1; AJvYcCUWAerJEIm3yRicrvIVRUYN21JPRX1rc0cLyVly6lFfudLjmtx4shX48Cj3up2Trd1fSJOAmUK4/VEClY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDcsyzXjK2IlEXb9SqXpMkYW5mik1dUnbL3EVoJeZlEr+JFJzC
	Fu8REIF7WUE4aQZL7axyqOOAI3mESgF88CcOO9yeZ2qPI1M+wPBdm5ykzBHMkJFOVgJazcwCZ7a
	4zOmnZQ==
X-Gm-Gg: ASbGnctQs5yBc1FUVDSyVyXkr4VB5QooNoFPO0wQ84LC1sPaOv4VHUWpeGeiGZc9Yyv
	6WGWoVvO+tW0Z8eIFLoXuFhW1yfRXJPfpJFQaKw+USWMiANuIVrBrU3WD8zypMAhTP27Z3IgM5U
	XwFih3d0T6WDDpoDy6yqR+L05dB15Bc9B4r4StLIdKlFn4btNiMtpt/6buKFD35xC14ujJBx5T3
	QaT1OXTw/atRtGaYtWWeqRNA2pFLg7myrA/NIYQkOpb46RQi1QvvDybrpjfgtZVxo4nosEv/W0p
	Ni4wiARXLkKm04azKrSlHBEBHCkNfLHZikDJLra3xyybTYnv7rUs01wYnAPzcJI9p4d23anX9cT
	H3njw9IAZklKtzkwaHPE7Mz8xsKyB
X-Google-Smtp-Source: AGHT+IH/zjVkc6WPJpkxwvBbOorFv8w+P//bLCB5Bvyar4kfMeQSxtw7bRnIjYaZ4tU8ygJUhttGyQ==
X-Received: by 2002:a17:903:3c4e:b0:235:f3e6:4680 with SMTP id d9443c01a7336-238c8741578mr36433765ad.21.1750927553455;
        Thu, 26 Jun 2025 01:45:53 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83fbe94sm152524875ad.86.2025.06.26.01.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:45:53 -0700 (PDT)
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
Subject: [net-next, v2 00/10] Introducing Broadcom BNGE Ethernet Driver
Date: Thu, 26 Jun 2025 14:08:09 +0000
Message-ID: <20250626140844.266456-1-vikas.gupta@broadcom.com>
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

======================================================================
Changes from:
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
 .../net/ethernet/broadcom/bnge/bnge_core.c    | 387 ++++++++++
 .../net/ethernet/broadcom/bnge/bnge_devlink.c | 308 ++++++++
 .../net/ethernet/broadcom/bnge/bnge_devlink.h |  18 +
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c |  33 +
 .../net/ethernet/broadcom/bnge/bnge_ethtool.h |   9 +
 .../net/ethernet/broadcom/bnge/bnge_hwrm.c    | 507 +++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_hwrm.h    | 110 +++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    | 703 ++++++++++++++++++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |  27 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 266 +++++++
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  | 206 +++++
 .../net/ethernet/broadcom/bnge/bnge_resc.c    | 605 +++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |  94 +++
 .../net/ethernet/broadcom/bnge/bnge_rmem.c    | 438 +++++++++++
 .../net/ethernet/broadcom/bnge/bnge_rmem.h    | 188 +++++
 20 files changed, 4145 insertions(+)
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

