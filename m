Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952F0280A56
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238666; cv=none; b=uaroLBFTgzPiQbUDRZ025cnLkuiZoBYGu1qPYJEl6wn5Ua0UtSOc1NlIzzl+qvXEmL+CGQ7CblCxEE3TznAuDnUQd2CrzJDXcahVL6r8rw81l5tdT+m4sNllK+nnWnx/FW8NTmc0Ck9nI36EEzfLEi8YHwXLJmShpQ60+NBkhVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238666; c=relaxed/simple;
	bh=stlKD8TMt2RHQpIMrF+XfM/1DcDXWqKH+tWALVeME38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E2chQeX3gSrYTdnoA6qQtX3ZS38BUM2YZR0wKs7XfAI2xVJXLuNwTR2vcvC5Qlefi9llBp0VrNKvCSfGhPT9CgxQRLV6WY9tjZjISxQG1rrUkXur37GRCLMlKki3vyfSEe6Wa2uNk3dXY6A5WFjVyqEwMhcEdZf2JddGhpQUy0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WoLFDR8i; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WoLFDR8i"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso5141826b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750238664; x=1750843464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=POgVgQOHyY5JFhC7ZUirzBX59J0Bo8DjMxk+7VX8j3Y=;
        b=WoLFDR8iJLt1OL5SDXnzr2iMaObNxbXNHST8XWvSxMZvSZ7KOVIWCZdPzmP0f5/swM
         oMZCPGoUz2u+KnapF+Rrt+h0Pb+L60SiTxgvNU1KngrrVeFm+/KhoGa2aDPQm0cFaXXh
         JWT1JOH0nCbVcPOX/NP2d5/tw18XSDEZgeE9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238664; x=1750843464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POgVgQOHyY5JFhC7ZUirzBX59J0Bo8DjMxk+7VX8j3Y=;
        b=MUYcnwX+sH43u8/yQCpwkQ1EJGCEjja/09yMh27gVZ7VbnWNuZC9J2eyPWfw0v7qIk
         A2C/xxfv0Ces6f8mcA5nkPc8A19xB3uuCfyjDAVs+q4ElBFihVQhxetCRpSbcZE4zzBa
         +Z+7yEkX8u+1O1LBSZij2xqdfvI5UF2i0cSr+i9i/rCVsIL2YVPgW9EZX+Nsbt97fAwE
         FYlQQnZtXLaRPlnqM85PG+N3BhUcBiUmq31pZZvxhZVaDWX1Ja/211T+rRLfIeHl8aPu
         xvK7ZFFKCfhXlN1ChBVivXeP1cyE3F7SuzYbJroSr83Tj8cb2LTovNbo/wPWhaQiFt9m
         ++MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIIIhfu710tySx/w6Q3j4GgxYQ7VQSoK+d1kH4Ltuu9Bo0qN6G3/A/OQw4banYyy4Er46lYWKEi7O7dUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YytlGaGtxRC+v0o2pANZCxkptO2oY5lO2Q2+qY8RSoDoGxjLFMv
	EChi4aMq6Be7Vr7pliuPpHjTnZz7DwESB6ZgenIPHh8NKC/lKZJVXwdIPJ1jGZyvQQ==
X-Gm-Gg: ASbGncvhCP8crYBQ8udFGOAjSRkl0WOwk9QjSlGCNx69cNha5O5VgMHqDbe9PRNPUv6
	p8nFslAusuy9r+esZTVMcCxqiidF6OS24QMwhBEBeJN8m0Fh40YdBQNemnVsHT8IS2ZGrbhh/jC
	nwtWe1PoWr0+dRSS6NGuiuJ1lHkDkEq8PrqT5nVit5Xv8R5eGoVLF/qXetF7MOQ845l4yoRaGVb
	XxbfqqKGY6P3eO9QxL3eWyX3qD+SsA0gO87MmMXtRHQ3IsygUGWQDaHRl0sqgAVgFu675Z8qKhJ
	C/RS8M7DhAFEdR+bbOYc5aiXuRreq1XukdSToO2u1m969kvoRtKb0AEBaNywlaZJeYk/fVOINhX
	QwusyuF1SdOWRtjP9VEiO5mfCR6mtzI2slkUek3M=
X-Google-Smtp-Source: AGHT+IEEXCf9tYsKSdb5r4gM4NhS9cCtxK0XcjZ6Yra6MbUTOtw6mZPoZlZe+86e1KbOYl4Ew/DSEw==
X-Received: by 2002:a05:6a00:2181:b0:746:2ae9:fc42 with SMTP id d2e1a72fcca58-7489cfc37a3mr22044526b3a.19.1750238663731;
        Wed, 18 Jun 2025 02:24:23 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffecd08sm10408993b3a.27.2025.06.18.02.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:24:23 -0700 (PDT)
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
Subject: [net-next, 00/10] Introducing Broadcom BNGE Ethernet Driver
Date: Wed, 18 Jun 2025 14:47:30 +0000
Message-ID: <20250618144743.843815-1-vikas.gupta@broadcom.com>
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
 .../net/ethernet/broadcom/bnge/bnge_core.c    | 395 ++++++++++
 .../net/ethernet/broadcom/bnge/bnge_devlink.c | 267 +++++++
 .../net/ethernet/broadcom/bnge/bnge_devlink.h |  18 +
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c |  33 +
 .../net/ethernet/broadcom/bnge/bnge_ethtool.h |   9 +
 .../net/ethernet/broadcom/bnge/bnge_hwrm.c    | 503 +++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_hwrm.h    | 117 +++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    | 703 ++++++++++++++++++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |  27 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 266 +++++++
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  | 206 +++++
 .../net/ethernet/broadcom/bnge/bnge_resc.c    | 604 +++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |  94 +++
 .../net/ethernet/broadcom/bnge/bnge_rmem.c    | 438 +++++++++++
 .../net/ethernet/broadcom/bnge/bnge_rmem.h    | 188 +++++
 20 files changed, 4114 insertions(+)
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

