Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF491D8E01;
	Mon, 26 May 2025 06:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748240735; cv=none; b=PKDBLWTTfUXkiXxqiQ8uqRZ8/DObleQrDFAVM/8PKKHmR/zSzvv+drKB4HSVWsTkLN6znHOliZWdQHldkrXdJEaD/IeI8HAwHjVO9gNS2AKyLmox4o7UzjdGhbGrWVaQuIMw8XBLvmuDEJsGEgUVcamO1p6FxhQQv/Dr5ZLG38I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748240735; c=relaxed/simple;
	bh=/PqeRx1G8yWgH2bpaj+v9geJqih0EWc+M09T0J5VbYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvfnYkset8we2TaM1sKd/Ixr+i5K4ybsiS9TdiRinWi7/eb0gFibjtjO9tmqkomGLoEcsFAR4+I/XdKYBzq2hKhJKnwXi3XIHyWjajrsbKfnQnSUoji/JBoI3FwroytF9Oz0OgdQyau9T5ZBFo42U5VvSd2azGP7FKIqGGbhJaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmABJeJ2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmABJeJ2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29CA5C4CEEE;
	Mon, 26 May 2025 06:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748240735;
	bh=/PqeRx1G8yWgH2bpaj+v9geJqih0EWc+M09T0J5VbYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kmABJeJ2C69lIMqHyzOUDW0mT3Znsk6DPqRCX5J0WlgBa1hrGVUfj1cSWl0huZWSy
	 qC1mXn61FHcPepCJxVAIRpRwEktkw0hB/IFdFfVvNYj9WbZr1DlUVUCOpeN0qiM/Lx
	 Rq3VlrO3e0Gk1R8TLaIxv+nxtcbEjt0OkvX4/pjtRAAuQlSFMRdKULfQZHTthZ/N4z
	 yYhs/g9M8HUKsc8Jy/YCRGAVyB/25ofKTMhMgSPdBynF4gbUMMuB7AYEDpeQ3e9y50
	 VdVL30/OTF7iY6T7df/A+1ePRc7rjhXAfLxWwhWMGSvcApxY54oFqvErKSdBYaHXAk
	 Gs0adRQSKt1CQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1965CC5B543;
	Mon, 26 May 2025 06:25:35 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Date: Mon, 26 May 2025 14:25:04 +0800
Subject: [PATCH v3 1/4] firmware: stratix10-svc: Add mutex lock and unlock
 in stratix10 memory allocation/free
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-sip_svc_upstream-v3-1-6a08a4502de3@altera.com>
References: <20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com>
In-Reply-To: <20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748240732; l=3909;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=U7peSYw634W0vjNlQpTtWPEU2kILWkLlInRHSfUpC/A=;
 b=6Y/V/7nY2o+pyobP4VVlFbwRxcUFyV2LHH9DDODxjbOOlryctvQpmWG/7nveuIYuxYL6ed0JZ
 R5E+ctiVzpsBOIo42RjKbeYTBYnuARVMcbusMPt+P+v+YFQhU+WqAGm
X-Developer-Key: i=mahesh.rao@altera.com; a=ed25519;
 pk=tQiFUzoKxHrQLDtWeEeaeTeJTl/UfclUHWZy1fjSiyg=
X-Endpoint-Received: by B4 Relay for mahesh.rao@altera.com/20250107 with
 auth_id=337
X-Original-From: Mahesh Rao <mahesh.rao@altera.com>
Reply-To: mahesh.rao@altera.com

From: Mahesh Rao <mahesh.rao@altera.com>

This commit adds a mutex lock to stratix10_svc_allocate_memory
and stratix10_svc_free_memory functions to ensure
thread safety when allocating and freeing memory.
This prevents potential race conditions and ensures
synchronization.

Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/firmware/stratix10-svc.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index e3f990d888d71829f0ab22b8a59aa7af0316bea0..3d42d4b18b7299d0a9e5110159e06253dfeddf88 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2017-2018, Intel Corporation
+ * Copyright (C) 2025, Altera Corporation
  */
 
 #include <linux/completion.h>
@@ -171,6 +172,7 @@ struct stratix10_svc_chan {
 
 static LIST_HEAD(svc_ctrl);
 static LIST_HEAD(svc_data_mem);
+static DEFINE_MUTEX(svc_mem_lock);
 
 /**
  * svc_pa_to_va() - translate physical address to virtual address
@@ -182,14 +184,17 @@ static LIST_HEAD(svc_data_mem);
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
@@ -990,13 +995,16 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
 			p_data->flag = ct->flags;
 		}
 	} else {
+		mutex_lock(&svc_mem_lock);
 		list_for_each_entry(p_mem, &svc_data_mem, node)
 			if (p_mem->vaddr == p_msg->payload) {
 				p_data->paddr = p_mem->paddr;
 				p_data->size = p_msg->payload_length;
 				break;
 			}
+		mutex_unlock(&svc_mem_lock);
 		if (p_msg->payload_output) {
+			mutex_lock(&svc_mem_lock);
 			list_for_each_entry(p_mem, &svc_data_mem, node)
 				if (p_mem->vaddr == p_msg->payload_output) {
 					p_data->paddr_output =
@@ -1005,6 +1013,7 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
 						p_msg->payload_length_output;
 					break;
 				}
+			mutex_unlock(&svc_mem_lock);
 		}
 	}
 
@@ -1072,9 +1081,12 @@ void *stratix10_svc_allocate_memory(struct stratix10_svc_chan *chan,
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
@@ -1086,6 +1098,7 @@ void *stratix10_svc_allocate_memory(struct stratix10_svc_chan *chan,
 	pr_debug("%s: va=%p, pa=0x%016x\n", __func__,
 		 pmem->vaddr, (unsigned int)pmem->paddr);
 
+	mutex_unlock(&svc_mem_lock);
 	return (void *)va;
 }
 EXPORT_SYMBOL_GPL(stratix10_svc_allocate_memory);
@@ -1100,6 +1113,7 @@ EXPORT_SYMBOL_GPL(stratix10_svc_allocate_memory);
 void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
 {
 	struct stratix10_svc_data_mem *pmem;
+	mutex_lock(&svc_mem_lock);
 
 	list_for_each_entry(pmem, &svc_data_mem, node)
 		if (pmem->vaddr == kaddr) {
@@ -1107,9 +1121,10 @@ void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
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


