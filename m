Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C442D8836
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 01:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749863034; cv=none; b=AufKgsYbMbTKmCTBwdutcqOgy7itgQhlHxIWgROmf1mq0O4xYEofxJNWThocvqdxoOGqv3KWriPmyXfbB/B/41ve1GOdye7/jfomNfXjqJSFT5vUhYb3GdGES1i25rs2+fN2qbDfdQeE+gMrPDO/YFaD5v4aXiBwKwnPo+0CU+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749863034; c=relaxed/simple;
	bh=K1inPO+DA6yjFDl2QM7VQyCmC+BnsRiszydUTaXZNtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CY7ji1Ny+f2CseXang+8Db0B/mivBam/tFv59ry0Hkb8uQBnzHPD0hAA5oaDnBEBUSc+0TCK5Tk0qp923e1kK6YK1bX9/68STx6lzoN4Y6HUXcKipugYfOYInC/LCHPMC9dCPHysQLlC4vuxV/XSLJPmMrMlFuXQvGJpvrun5Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=cMKhfvsE; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="cMKhfvsE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=J9fms8UGgynmJkelATwVHEvwCi9WKj/UbrvYjJPuhSU=; b=cMKhfvsEofHrqGRx
	GJx4zlEvQIovduA3TyCuD5aaiXyFXwvRQjtf0tOg4zzGbkgF8xPsZxjJgW32alV4S3uu+8aBx7255
	8xP/ccdYdaPXDZTr8pPZ3kZzdLwrYzstk5E9DmxErvDouoPVWpHGyf75SolCU/g/2+IuK+padNaon
	3R7mG2QeEQURRxHCF0EAorAmMaDwLY3NC4Xjzta/sWechY3snXjpBhyGJxwnPvj4HYiNiQsh416n5
	kOmXz9MGkfnK6DPV6uBxCppUT94xGueBBxQs6lvEDtf1kfZki2FFpwonunrK8F+z120fSJ5BQQhb7
	0O+TcA7nL81nHLGpMw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uQFJE-009amM-18;
	Sat, 14 Jun 2025 01:03:48 +0000
From: linux@treblig.org
To: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/3] misc: vmw_vmci: Remove unused vmci_ctx functions
Date: Sat, 14 Jun 2025 02:03:42 +0100
Message-ID: <20250614010344.636076-2-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614010344.636076-1-linux@treblig.org>
References: <20250614010344.636076-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

vmci_ctx_dbell_destroy_all() and vmci_ctx_pending_datagrams()
were added in 2013 by
commit 28d6692cd8fb ("VMCI: context implementation.")

but have remained unused.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/misc/vmw_vmci/vmci_context.c | 54 ----------------------------
 drivers/misc/vmw_vmci/vmci_context.h |  2 --
 2 files changed, 56 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_context.c b/drivers/misc/vmw_vmci/vmci_context.c
index f22b44827e92..843f98fb17f6 100644
--- a/drivers/misc/vmw_vmci/vmci_context.c
+++ b/drivers/misc/vmw_vmci/vmci_context.c
@@ -268,28 +268,6 @@ static int ctx_fire_notification(u32 context_id, u32 priv_flags)
 	return VMCI_SUCCESS;
 }
 
-/*
- * Returns the current number of pending datagrams. The call may
- * also serve as a synchronization point for the datagram queue,
- * as no enqueue operations can occur concurrently.
- */
-int vmci_ctx_pending_datagrams(u32 cid, u32 *pending)
-{
-	struct vmci_ctx *context;
-
-	context = vmci_ctx_get(cid);
-	if (context == NULL)
-		return VMCI_ERROR_INVALID_ARGS;
-
-	spin_lock(&context->lock);
-	if (pending)
-		*pending = context->pending_datagrams;
-	spin_unlock(&context->lock);
-	vmci_ctx_put(context);
-
-	return VMCI_SUCCESS;
-}
-
 /*
  * Queues a VMCI datagram for the appropriate target VM context.
  */
@@ -991,38 +969,6 @@ int vmci_ctx_dbell_destroy(u32 context_id, struct vmci_handle handle)
 	    VMCI_ERROR_NOT_FOUND : VMCI_SUCCESS;
 }
 
-/*
- * Unregisters all doorbell handles that were previously
- * registered with vmci_ctx_dbell_create.
- */
-int vmci_ctx_dbell_destroy_all(u32 context_id)
-{
-	struct vmci_ctx *context;
-	struct vmci_handle handle;
-
-	if (context_id == VMCI_INVALID_ID)
-		return VMCI_ERROR_INVALID_ARGS;
-
-	context = vmci_ctx_get(context_id);
-	if (context == NULL)
-		return VMCI_ERROR_NOT_FOUND;
-
-	spin_lock(&context->lock);
-	do {
-		struct vmci_handle_arr *arr = context->doorbell_array;
-		handle = vmci_handle_arr_remove_tail(arr);
-	} while (!vmci_handle_is_invalid(handle));
-	do {
-		struct vmci_handle_arr *arr = context->pending_doorbell_array;
-		handle = vmci_handle_arr_remove_tail(arr);
-	} while (!vmci_handle_is_invalid(handle));
-	spin_unlock(&context->lock);
-
-	vmci_ctx_put(context);
-
-	return VMCI_SUCCESS;
-}
-
 /*
  * Registers a notification of a doorbell handle initiated by the
  * specified source context. The notification of doorbells are
diff --git a/drivers/misc/vmw_vmci/vmci_context.h b/drivers/misc/vmw_vmci/vmci_context.h
index 4db8701c9781..980fdece0f7d 100644
--- a/drivers/misc/vmw_vmci/vmci_context.h
+++ b/drivers/misc/vmw_vmci/vmci_context.h
@@ -132,7 +132,6 @@ bool vmci_ctx_supports_host_qp(struct vmci_ctx *context);
 int vmci_ctx_enqueue_datagram(u32 cid, struct vmci_datagram *dg);
 int vmci_ctx_dequeue_datagram(struct vmci_ctx *context,
 			      size_t *max_size, struct vmci_datagram **dg);
-int vmci_ctx_pending_datagrams(u32 cid, u32 *pending);
 struct vmci_ctx *vmci_ctx_get(u32 cid);
 void vmci_ctx_put(struct vmci_ctx *context);
 bool vmci_ctx_exists(u32 cid);
@@ -153,7 +152,6 @@ void vmci_ctx_unset_notify(struct vmci_ctx *context);
 
 int vmci_ctx_dbell_create(u32 context_id, struct vmci_handle handle);
 int vmci_ctx_dbell_destroy(u32 context_id, struct vmci_handle handle);
-int vmci_ctx_dbell_destroy_all(u32 context_id);
 int vmci_ctx_notify_dbell(u32 cid, struct vmci_handle handle,
 			  u32 src_priv_flags);
 
-- 
2.49.0

