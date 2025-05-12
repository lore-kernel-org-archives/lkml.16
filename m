Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C9D2918D7;
	Mon, 12 May 2025 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050019; cv=none; b=gmrNHd7oy1PxBDeyzur/UWcJbqy+kq1wmFb+KQ211i6iuB7kY8EQNlmoVwA5pfYhH/DcXQbiO11yQQdgls42kvNun7e1cM4MWWAGOypVc5drm2fyVLrU/MNZMQ+7xaha4GDtpKXs/2EM0vF0EYRMSpFUN8nGyq/HDT8mTGbprV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050019; c=relaxed/simple;
	bh=/PqeRx1G8yWgH2bpaj+v9geJqih0EWc+M09T0J5VbYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icoy6U0KI+UBXhtEw5RjafMIgNVNS189Yu9qzt4uhD09K+YPSfgA97nYd1Bj2tgPVWr3deJECkNA2ZkaODfqMcDdCXymxTjaniwnBBaYw4bSrqQxTxPLlPkDB7vbPT6+Ob5xo741fxnPsw7RcvXA9PxzOpsnAyYb9A4XLeS+Kiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVKNdRtL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVKNdRtL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0207CC4CEF8;
	Mon, 12 May 2025 11:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747050019;
	bh=/PqeRx1G8yWgH2bpaj+v9geJqih0EWc+M09T0J5VbYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JVKNdRtLhHEgwSwP78dDFvf8os7r2Ya+lLE7oGdI205ZB84fwV3ErJBWmiDYIuhre
	 LxpLv7UYXsFDkbFJwryj1Ll/KJz2/PJRAdOArR0RzfNRIWY+eMw9deZpl7e54YWMNn
	 SZUm8SOKR0dHqeQsx0L2NvRdUdj/hkwokl1Iscn1KcnOoNAMCIXVvcy1MN9jZdrMRc
	 x4LEQcyr8KQCbHcHk1pCXFx/EXnejuOO/dPPQ/vWZRvx6y85J2ck7LO58ckuHb7w7l
	 N7pJ6g8gj1tRrB3ytIaV9LjVL2HfjufjmBisNY0jLna1qLrCAvvX0G59ib61hUf7lS
	 m5w1Hy9C24hzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E227BC3ABCD;
	Mon, 12 May 2025 11:40:18 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Date: Mon, 12 May 2025 19:39:51 +0800
Subject: [PATCH v2 1/7] firmware: stratix10-svc: Add mutex lock and unlock
 in stratix10 memory allocation/free
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-sip_svc_upstream-v2-1-fae5c45c059d@altera.com>
References: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
In-Reply-To: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747050016; l=3909;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=U7peSYw634W0vjNlQpTtWPEU2kILWkLlInRHSfUpC/A=;
 b=aATMkkE/hT3g6shV+y2mDaZrhthT/+T0kkMEPnnXPXoMKXjUSJWoV1pMj10cGJ296cr+g8+bo
 KVj5OaDNb5gCgJ8hB/JCKPGwbOSm8XTr3wIZQEVGJdkMAJ2A2E1DU2I
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


