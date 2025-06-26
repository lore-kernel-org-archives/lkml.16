Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152862C3246
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927577; cv=none; b=ncPyhaUNdx2bnToIGAV9Szjlcz3lx3Z/Ikn7TZkiVpzv89e9gJRkyGJfcX7HZJE4kpmZ4dQFQkdMN8kE+xMIIm9oFF7i52biVclOrTy+U5w+BlwsNmGuyf2NcpN89LKwfsa5UqdaOoeNJ0uNP9YFTqcNUcI6PcP8RnmE5lVbqmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927577; c=relaxed/simple;
	bh=3vl6QDP6/oKInQpbUd/mwtNJqKOcafNUpwPOeaBo8Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gPo19soU6kPXErFmg/xJJ9VwAHbAj4UA7owF2GqbvZ+JfnaRaosNYbDEz3FJKAdLEl2qI+kc5Qpkrh+ck8Zvm1+7IWFh6yClcnZHG8qQ9caxfvTifTQNriSahE4rOUtsjyR2jqJ7QbEV3Jh3IvwNWEqz7jG+YuZMIu2ZCwSaKlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NDid7yVP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NDid7yVP"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-236192f8770so6759755ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750927575; x=1751532375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZ8ourLzAapYlWvSPc5AJIM32EfKtOVtF0mK8gd87tE=;
        b=NDid7yVPhTMKsu0sDcC+AiW8iGLm/nUpdBg0dYnyMcq1k7rBVI8oiv/Oa+SnfGZMe9
         dm9H4B3Tukd+M1DnzKp3XWy5Ssx2chbGqHggBQI07hduLpv4UmsRQXld5OeGV27K9BKu
         YsPPMeq8qkKCNsgaq+kX3ur5gYDWdOqaGm6YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927575; x=1751532375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZ8ourLzAapYlWvSPc5AJIM32EfKtOVtF0mK8gd87tE=;
        b=XQJDhy5nYXhiIOIoA59zbRy2P0/wWuiuqzzKLH4ICNGk9yi0m3L8wQauRNSIqutt5X
         lWtobuIPzWkxBm2IklLc9CZ4jdIFvvjKP9ly9rGWUcOonbZUoaH1yHMGzKGDeprftt0Q
         sh8RJNKu8cq3A+wAMB3KwGNZ5S2qqGH1/BTrSx7S6RUkW334REtSmEHF46TtABNy2UDl
         k93u74caWaBwa+uT6lWnBTyGkLQ2ZFxvCnEAP6RflBiJERUnRehpo5qs02eosb8DmXil
         BduEPleIHcE9BNKxUXlMN1aGCByWWLGGRxDZX6mcdEiJ7Yr3hAUq4K+yCVhBVIDWS/L2
         VwAw==
X-Forwarded-Encrypted: i=1; AJvYcCWm+cm1yFBPGLowpp28yB+2ABuXsul+QjbndWRgbSponNmR2S+OL8rC9+LFnRFKDk7bU2eyjLBtV1IochM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+QeEH7YttB5/Y7hUgBm2EgpdNb765lnfOfqIBdVqcf/urfEc9
	5gLAz8CGXxahhGpCfPzeHsxbDL/Iymr+y1IP0wiJag7ZI10aYB6WEu140GAM59MDqw==
X-Gm-Gg: ASbGncvKM5SKHt483c3PIfFHhwlSx6S2Roxpcz/jpIVIK+65riFajFZF+hvZkFjnIm7
	3xcuEtSb8guPy8V7BNpqYa+AR69bHpf4qwRCrYR9eE6W6UnnX6pRFzW7M1pcbzXQq9fIxehDnAH
	c7IYu1oAvPrFC25g7rHauE/HEsI9r1iDqkeuIkAXuV/uwI/lenTUSSWA3FJvMskHXLLz6lN2Gej
	goSnM/sw3OgPtIGaelJWBfvVUzQFMwlTtJ1GSG9fIzbuMtho9bBBIX8Q6mZFrwuvtLzrgysXXg6
	qG4QWwA3vJ2oP2m9OgYYJJJyqHDxAWssZjpa1uCbUwIo5+ubgoSbgnsWO7qppjksAAitKtiqlFH
	f/2QwDIMWBp3J1Txx52/azORXxtvt
X-Google-Smtp-Source: AGHT+IFVOLV6VekWqM/Em28se4PNDCMbgX1p1HPJJegLB4lEXE/BqgyZt7HKxNIInIGT8UqUdIGAtQ==
X-Received: by 2002:a17:903:3c6b:b0:237:f757:9ad8 with SMTP id d9443c01a7336-238e9e06b68mr38751125ad.1.1750927575355;
        Thu, 26 Jun 2025 01:46:15 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83fbe94sm152524875ad.86.2025.06.26.01.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:46:15 -0700 (PDT)
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
	Vikas Gupta <vikas.gupta@broadcom.com>,
	Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Subject: [net-next, v2 05/10] bng_en: Add ring memory allocation support
Date: Thu, 26 Jun 2025 14:08:14 +0000
Message-ID: <20250626140844.266456-6-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250626140844.266456-1-vikas.gupta@broadcom.com>
References: <20250626140844.266456-1-vikas.gupta@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ring allocation/free mechanism which help
to allocate rings (TX/RX/Completion) and backing
stores memory on the host for the device.
Future patches will use these functions.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/Makefile   |   3 +-
 .../net/ethernet/broadcom/bnge/bnge_rmem.c    | 101 ++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_rmem.h    |  35 ++++++
 3 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_rmem.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_rmem.h

diff --git a/drivers/net/ethernet/broadcom/bnge/Makefile b/drivers/net/ethernet/broadcom/bnge/Makefile
index b8dbbc2d5972..1144594fc3f6 100644
--- a/drivers/net/ethernet/broadcom/bnge/Makefile
+++ b/drivers/net/ethernet/broadcom/bnge/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_BNGE) += bng_en.o
 bng_en-y := bnge_core.o \
 	    bnge_devlink.o \
 	    bnge_hwrm.o \
-	    bnge_hwrm_lib.o
+	    bnge_hwrm_lib.o \
+	    bnge_rmem.o
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_rmem.c b/drivers/net/ethernet/broadcom/bnge/bnge_rmem.c
new file mode 100644
index 000000000000..ef232c4217bc
--- /dev/null
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_rmem.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2025 Broadcom.
+
+#include <linux/etherdevice.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/mm.h>
+#include <linux/dma-mapping.h>
+#include <linux/vmalloc.h>
+#include <linux/crash_dump.h>
+
+#include "bnge.h"
+#include "../bnxt/bnxt_hsi.h"
+#include "bnge_hwrm_lib.h"
+#include "bnge_rmem.h"
+
+void bnge_free_ring(struct bnge_dev *bd, struct bnge_ring_mem_info *rmem)
+{
+	struct pci_dev *pdev = bd->pdev;
+	int i;
+
+	if (!rmem->pg_arr)
+		goto skip_pages;
+
+	for (i = 0; i < rmem->nr_pages; i++) {
+		if (!rmem->pg_arr[i])
+			continue;
+
+		dma_free_coherent(&pdev->dev, rmem->page_size,
+				  rmem->pg_arr[i], rmem->dma_arr[i]);
+
+		rmem->pg_arr[i] = NULL;
+	}
+skip_pages:
+	if (rmem->pg_tbl) {
+		size_t pg_tbl_size = rmem->nr_pages * 8;
+
+		if (rmem->flags & BNGE_RMEM_USE_FULL_PAGE_FLAG)
+			pg_tbl_size = rmem->page_size;
+		dma_free_coherent(&pdev->dev, pg_tbl_size,
+				  rmem->pg_tbl, rmem->dma_pg_tbl);
+		rmem->pg_tbl = NULL;
+	}
+	if (rmem->vmem_size && *rmem->vmem) {
+		vfree(*rmem->vmem);
+		*rmem->vmem = NULL;
+	}
+}
+
+int bnge_alloc_ring(struct bnge_dev *bd, struct bnge_ring_mem_info *rmem)
+{
+	struct pci_dev *pdev = bd->pdev;
+	u64 valid_bit = 0;
+	int i;
+
+	if (rmem->flags & (BNGE_RMEM_VALID_PTE_FLAG | BNGE_RMEM_RING_PTE_FLAG))
+		valid_bit = PTU_PTE_VALID;
+
+	if ((rmem->nr_pages > 1 || rmem->depth > 0) && !rmem->pg_tbl) {
+		size_t pg_tbl_size = rmem->nr_pages * 8;
+
+		if (rmem->flags & BNGE_RMEM_USE_FULL_PAGE_FLAG)
+			pg_tbl_size = rmem->page_size;
+		rmem->pg_tbl = dma_alloc_coherent(&pdev->dev, pg_tbl_size,
+						  &rmem->dma_pg_tbl,
+						  GFP_KERNEL);
+		if (!rmem->pg_tbl)
+			return -ENOMEM;
+	}
+
+	for (i = 0; i < rmem->nr_pages; i++) {
+		u64 extra_bits = valid_bit;
+
+		rmem->pg_arr[i] = dma_alloc_coherent(&pdev->dev,
+						     rmem->page_size,
+						     &rmem->dma_arr[i],
+						     GFP_KERNEL);
+		if (!rmem->pg_arr[i])
+			return -ENOMEM;
+
+		if (rmem->nr_pages > 1 || rmem->depth > 0) {
+			if (i == rmem->nr_pages - 2 &&
+			    (rmem->flags & BNGE_RMEM_RING_PTE_FLAG))
+				extra_bits |= PTU_PTE_NEXT_TO_LAST;
+			else if (i == rmem->nr_pages - 1 &&
+				 (rmem->flags & BNGE_RMEM_RING_PTE_FLAG))
+				extra_bits |= PTU_PTE_LAST;
+			rmem->pg_tbl[i] =
+				cpu_to_le64(rmem->dma_arr[i] | extra_bits);
+		}
+	}
+
+	if (rmem->vmem_size) {
+		*rmem->vmem = vzalloc(rmem->vmem_size);
+		if (!(*rmem->vmem))
+			return -ENOMEM;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_rmem.h b/drivers/net/ethernet/broadcom/bnge/bnge_rmem.h
new file mode 100644
index 000000000000..56de31ed6613
--- /dev/null
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_rmem.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2025 Broadcom */
+
+#ifndef _BNGE_RMEM_H_
+#define _BNGE_RMEM_H_
+
+#define PTU_PTE_VALID             0x1UL
+#define PTU_PTE_LAST              0x2UL
+#define PTU_PTE_NEXT_TO_LAST      0x4UL
+
+struct bnge_ring_mem_info {
+	/* Number of pages to next level */
+	int			nr_pages;
+	int			page_size;
+	u16			flags;
+#define BNGE_RMEM_VALID_PTE_FLAG	1
+#define BNGE_RMEM_RING_PTE_FLAG		2
+#define BNGE_RMEM_USE_FULL_PAGE_FLAG	4
+
+	u16			depth;
+
+	void			**pg_arr;
+	dma_addr_t		*dma_arr;
+
+	__le64			*pg_tbl;
+	dma_addr_t		dma_pg_tbl;
+
+	int			vmem_size;
+	void			**vmem;
+};
+
+int bnge_alloc_ring(struct bnge_dev *bd, struct bnge_ring_mem_info *rmem);
+void bnge_free_ring(struct bnge_dev *bd, struct bnge_ring_mem_info *rmem);
+
+#endif /* _BNGE_RMEM_H_ */
-- 
2.47.1

