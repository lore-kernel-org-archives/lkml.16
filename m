Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D792701BB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361130; cv=none; b=bmuy+eTw/0fnegGpSPuxSZgCdCgGqttr6pka7OfNFNCAPKWyJfyIoU/ETh0zPqIg6V2M5PbUqDXoexa47zxGHypDY70q5m918LkYCWsLFNDwvxb6PxuOW1zVKlOW2Db4uwR589qodZyLWF0axPT6QRFYNzbsJkSzlvknmEg9BlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361130; c=relaxed/simple;
	bh=3vl6QDP6/oKInQpbUd/mwtNJqKOcafNUpwPOeaBo8Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbNKzMz7I+PSMPHcNkWYbh+27UOs50EbWsm31qlVX/lKaF/FIL9YI/GjaQjirwtDZaV6kGkCThcUOG01DB82LrNh3C0alThdUPdQDyrpibA29lb1Q11vZsLUTeUBPzHOhhryd+47jMl9X8Fjr2ay3zg2P9zntsCoXT49a/8X4OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PI7AfAzz; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PI7AfAzz"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74af4af04fdso3912521b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751361128; x=1751965928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZ8ourLzAapYlWvSPc5AJIM32EfKtOVtF0mK8gd87tE=;
        b=PI7AfAzz7fq9zRTgqLiIi8TAbmlI+txTvPgvW1Ou2iU//a6m6O8tsrQehC0fKmKooI
         8IWq5w+s8qQSooui53wSx8udBhakHnFKTddwjrD7USBizQZfnXiERQK8/J2F+56RwLZT
         JywDGl3T2HzIUpj+IO8u+zHD6e2acJ8+mcJYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361128; x=1751965928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZ8ourLzAapYlWvSPc5AJIM32EfKtOVtF0mK8gd87tE=;
        b=KVS2g9i6hwYcTK9ZNOL60ojTsbkHsSYh61eBD/OYUfTAPOG4jrm8FqkZgC2A3lq3Fe
         9GOpoTGoobutXZ0rkqSI5xmApZoN0mbtOiKG2ftOgP5GPVTbnKCukfnfn1NFzAPWjU2Q
         KN8AZKg3wcC7z8m6lczILVRLPJQdbC2Jjil1j6pzlev1hZa0P4RAOnj1qHL0cnQt49eR
         LKCyA1WeABHnlglIjMenSy3PfwBHKrHdv6jYF1WpDIPqcMKNMf77za8jQKmTWWp+Ad+j
         YP6I/qsB8qkOjfJekbqmm5bSQkNa+MiBnkl2+YWImiwrBOo6pG5P6cCBh9DvMC6020Dq
         5Tgw==
X-Forwarded-Encrypted: i=1; AJvYcCVfgu5nxTOQxIdtdnuVyVB+8ydwYUKvZZvGPsF5g4/wlupwE2NdRBFxaZ3HnNe3/2FyOfyq1f2V2XZhaSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxctmJef8xeJfPM2+4+kXZ5Rl90yfIn02yIwxO2/YPEzRpVLL+v
	lNjhFcftrV2Y1W0EWUoWFLv/hzHTLrmNL22220/aW3lV+FI+Y4vxPe2BjBEPodbozg==
X-Gm-Gg: ASbGnctJQsLVLXyoYuGHzZA1wtCtT9OKmPyHjybTc3GH0fMlkUCsXanVMwn1cMSg6Hf
	+I/TnpabdXLaGMMabj9DPQo49hO3AJ0CdsrEv9bZoJplcdPgYVpK2QiRpDRhXADNiztYfwg3rW8
	xoaqACHLVIG6aIOSiTaEQAaEDLmbQAe6TZPhEznRWA093bZ/XxldKtcBQLjAEcuoFIRdFu2HLLV
	Pdil+RxThmXNxRRdtK487HE02reH0RAoHkOj08ybAYjcwqjuVCuAsvQgbaaFG6e73eBSOjsNJ6a
	8FXmOzJ7Zpa6j0+hMUoFlVqHoMMqCyBtzzJmqPpJIlOnDPiiOz5qErOC1BWe0XAhQtKueug1FAo
	JHTWdNg1TTOjo/P4kKCWOGXtlxiZN
X-Google-Smtp-Source: AGHT+IGD+PMyQWbgggCcfUfqdisjXVNVVZ/j0kgFtp8pFRi3WYkkhSlUmFf0Uco8sWkPny3WcokBDQ==
X-Received: by 2002:a05:6a21:e89:b0:21f:54f0:3b6a with SMTP id adf61e73a8af0-222c9a481fcmr5501225637.12.1751361127733;
        Tue, 01 Jul 2025 02:12:07 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e30201c1sm8893603a12.22.2025.07.01.02.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:12:07 -0700 (PDT)
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
Subject: [net-next, v3 05/10] bng_en: Add ring memory allocation support
Date: Tue,  1 Jul 2025 14:35:03 +0000
Message-ID: <20250701143511.280702-6-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250701143511.280702-1-vikas.gupta@broadcom.com>
References: <20250701143511.280702-1-vikas.gupta@broadcom.com>
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

