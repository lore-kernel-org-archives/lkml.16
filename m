Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735BC22A4CC;
	Tue, 10 Jun 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569837; cv=none; b=BHzdpW37g7SBkx/L336CAIVhtfiKNaSD1nfm04FDY8r0kTp+ipi4P4t1WVz6V1eLmta9ZIQIoUr8teIIMrpFDlUp5ENVyTDM3S6w0+HtVLMTLIGcz/6gnOnYXTHTaNUhfQMpFixsmUECy/ibyrw8CK2QgW7+/2iZe417hCTtMFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569837; c=relaxed/simple;
	bh=XwlLH1QUOe+A5tsmgS1qll2CFxcQanHYxJ/Jad8QRIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVEZ4RePAWOrjCMmfSkYyZrvhm15yHfC37EUiUJ2/7VvbQxQQXtVyIBSw7zC3XPUgq5/8glUrScQqv23oG984tOWurC4nAyrRydp6LVgSJSQCGsQHCS08zuCLboypSE4cY6yDvAC708pXTmntRolIw7pSgvHSs9d0+uwwIZ3Cv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFl7AD4F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFl7AD4F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19EC1C4CEF2;
	Tue, 10 Jun 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569837;
	bh=XwlLH1QUOe+A5tsmgS1qll2CFxcQanHYxJ/Jad8QRIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sFl7AD4F2xcpb+Qx1sAp5spGn/zzLHKiyxofy7Q6QhGVq+b5HGviyaDi9xROwY9PW
	 r96diYbgSZ+P2CWBgltqncutpQDIBjzUrOFIByCeL8iRoRF5vvoQ+IrI9OoLu133Br
	 B+W1R6XH0n2Wk3whNLPcXlHmY/OELIMhouGtZqITcx21b9jRuHKCg4AHYbbx4k01PX
	 jQIUrl8yddJUKbQ1yDRQugJOuUVxfNIt221HqqY0+svTbDVylUk8Fy9F9BYmolsGZS
	 z5KsHOvZiIiT8goxDjf7MigiBUhAGWS55R/Pis1zmuNJK/Hsn96C6Cs/DrprvPDLFY
	 wshCCh/ARfg5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081F2C678DA;
	Tue, 10 Jun 2025 15:37:17 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Date: Tue, 10 Jun 2025 23:37:08 +0800
Subject: [PATCH v4 1/5] firmware: stratix10-svc: Add mutex lock and unlock
 in stratix10 memory allocation/free
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-sip_svc_upstream-v4-1-bcd9d6089071@altera.com>
References: <20250610-sip_svc_upstream-v4-0-bcd9d6089071@altera.com>
In-Reply-To: <20250610-sip_svc_upstream-v4-0-bcd9d6089071@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749569835; l=3733;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=JbJ8Yi/w4WDy3naiPJdrXbTKxhOxbl947N92woONhKs=;
 b=Q7JykyCKYiPF03hQoXxDPiFnZSt96QdYW3SG+RuusP4xALSwoGM93yYxlAhDPYWwYgi2maxZO
 jQINmYU2tAUAF7Q9SbIf/kjCKs9tsLV0l5Z5A9RAYjA2qU7ee11MgJU
X-Developer-Key: i=mahesh.rao@altera.com; a=ed25519;
 pk=tQiFUzoKxHrQLDtWeEeaeTeJTl/UfclUHWZy1fjSiyg=
X-Endpoint-Received: by B4 Relay for mahesh.rao@altera.com/20250107 with
 auth_id=337
X-Original-From: Mahesh Rao <mahesh.rao@altera.com>
Reply-To: mahesh.rao@altera.com

From: Mahesh Rao <mahesh.rao@altera.com>

This commit adds a mutex lock to protect the
stratix10_svc_allocate_memory and
stratix10_svc_free_memory functions to ensure
thread safety when allocating and freeing memory.
This prevents potential race conditions and ensures
synchronization.

Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/firmware/stratix10-svc.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index e3f990d888d71829f0ab22b8a59aa7af0316bea0..955468555738b2031dfcf6dc4db7dbf11ccc482c 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2017-2018, Intel Corporation
+ * Copyright (C) 2025, Altera Corporation
  */
 
 #include <linux/completion.h>
@@ -171,6 +172,10 @@ struct stratix10_svc_chan {
 
 static LIST_HEAD(svc_ctrl);
 static LIST_HEAD(svc_data_mem);
+/* svc_mem_lock protects access to the svc_data_mem list for
+ * concurrent multi-client operations
+ */
+static DEFINE_MUTEX(svc_mem_lock);
 
 /**
  * svc_pa_to_va() - translate physical address to virtual address
@@ -182,14 +187,17 @@ static LIST_HEAD(svc_data_mem);
 static void *svc_pa_to_va(unsigned long addr)
 {
 	struct stratix10_svc_data_mem *pmem;
+	void *ret = NULL;
 
 	pr_debug("claim back P-addr=0x%016x\n", (unsigned int)addr);
+	mutex_lock(&svc_mem_lock);
 	list_for_each_entry(pmem, &svc_data_mem, node)
-		if (pmem->paddr == addr)
-			return pmem->vaddr;
-
-	/* physical address is not found */
-	return NULL;
+		if (pmem->paddr == addr) {
+			/* physical address is found */
+			ret = pmem->vaddr;
+		}
+	mutex_unlock(&svc_mem_lock);
+	return ret;
 }
 
 /**
@@ -990,6 +998,7 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
 			p_data->flag = ct->flags;
 		}
 	} else {
+		mutex_lock(&svc_mem_lock);
 		list_for_each_entry(p_mem, &svc_data_mem, node)
 			if (p_mem->vaddr == p_msg->payload) {
 				p_data->paddr = p_mem->paddr;
@@ -1006,6 +1015,7 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
 					break;
 				}
 		}
+		mutex_unlock(&svc_mem_lock);
 	}
 
 	p_data->command = p_msg->command;
@@ -1072,9 +1082,12 @@ void *stratix10_svc_allocate_memory(struct stratix10_svc_chan *chan,
 	if (!pmem)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_lock(&svc_mem_lock);
 	va = gen_pool_alloc(genpool, s);
-	if (!va)
+	if (!va) {
+		mutex_unlock(&svc_mem_lock);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	memset((void *)va, 0, s);
 	pa = gen_pool_virt_to_phys(genpool, va);
@@ -1086,6 +1099,7 @@ void *stratix10_svc_allocate_memory(struct stratix10_svc_chan *chan,
 	pr_debug("%s: va=%p, pa=0x%016x\n", __func__,
 		 pmem->vaddr, (unsigned int)pmem->paddr);
 
+	mutex_unlock(&svc_mem_lock);
 	return (void *)va;
 }
 EXPORT_SYMBOL_GPL(stratix10_svc_allocate_memory);
@@ -1100,6 +1114,7 @@ EXPORT_SYMBOL_GPL(stratix10_svc_allocate_memory);
 void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
 {
 	struct stratix10_svc_data_mem *pmem;
+	mutex_lock(&svc_mem_lock);
 
 	list_for_each_entry(pmem, &svc_data_mem, node)
 		if (pmem->vaddr == kaddr) {
@@ -1107,9 +1122,10 @@ void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
 				       (unsigned long)kaddr, pmem->size);
 			pmem->vaddr = NULL;
 			list_del(&pmem->node);
+			mutex_unlock(&svc_mem_lock);
 			return;
 		}
-
+	mutex_unlock(&svc_mem_lock);
 	list_del(&svc_data_mem);
 }
 EXPORT_SYMBOL_GPL(stratix10_svc_free_memory);

-- 
2.35.3


