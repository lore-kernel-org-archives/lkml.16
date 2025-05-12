Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B444929209D;
	Mon, 12 May 2025 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050019; cv=none; b=u72FNknn/kOs+YCnfPeUiqZV0zzqKF6yqfZKLbJT0F0dFzvDuOae1ifFQHqSaXCrpv1yShVu2b/c6QkvEb3yo6cUAvoU2uAIpCmVM/Qh6fqC3XGitMeCKTztwO8x+m3WoPHdEzH8Srf68NKoIuVen/jJDY+39Ma0rKOUoFAFCug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050019; c=relaxed/simple;
	bh=ibeU41DrHsv6J87QYx9gpQfkrUVjiWDuwngy+ibG+JU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8jWal30+92b0pdiVSzYeIPqg/MSVDnsI81N1jjxGbBLsc4VicKOrUyjuudNgqoO2Sc3fR8od1A6fZBdJoKVbkdHHtTBERA2g5B5+GKbnRokSH16IqRh4/5rGu0Ppsj7eAWD7yEcgeVR2Ot+AQ1IkK9heW18woY/0Z5ct6mQEcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHO8RsIK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHO8RsIK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4146CC4CEF2;
	Mon, 12 May 2025 11:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747050019;
	bh=ibeU41DrHsv6J87QYx9gpQfkrUVjiWDuwngy+ibG+JU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RHO8RsIKDa5mH823BllY9gVsOePqLyU4OQ6HrTJd+6X/HhP/3DCmAsML73NMaFozE
	 mb/8Gh5CZDzJRtzHb8iwWIvGElQ16v2123rIs5L9PsMG2gxNQfM0kTZW4Mb5wknFaH
	 ATUQpQREBTu+juKo7km5YEAG2+TUsldt9/NxqjtRvuxxjg+beZAA5wvqYctbjp2Dc9
	 MdIlM00WihFizfflghS1TpGj9/TnYMsuQaqfKql0nNYp8gTHfP4uo8+oAVTfUl2P+j
	 a3hCD58R9dwSWVKLtS9RPUSdM3xYBTJnsJDR1/xJovAl/eUxJEN4puxuEIC6EUohdn
	 wBIYFEvHQoBZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37045C3ABD5;
	Mon, 12 May 2025 11:40:19 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Date: Mon, 12 May 2025 19:39:56 +0800
Subject: [PATCH v2 6/7] firmware: stratix10-svc: Add for SDM mailbox
 doorbell interrupt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-sip_svc_upstream-v2-6-fae5c45c059d@altera.com>
References: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
In-Reply-To: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747050016; l=8985;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=dlRM3LW8GIMqbmovGBPGMrJEM/n02Ou9PDk2reiH21M=;
 b=T1zvMnm5GvUyO6/XxYkQwc0Grtnz9fb0LasHAzsMFqFLXJOZ/9m9DHTZoJRNCq9luzPhWou81
 lhQng4gHEEsBhGol5ujXHhsUrsNyXuwDYZ0ITkDJEJGOL5rWKbY/MbB
X-Developer-Key: i=mahesh.rao@altera.com; a=ed25519;
 pk=tQiFUzoKxHrQLDtWeEeaeTeJTl/UfclUHWZy1fjSiyg=
X-Endpoint-Received: by B4 Relay for mahesh.rao@altera.com/20250107 with
 auth_id=337
X-Original-From: Mahesh Rao <mahesh.rao@altera.com>
Reply-To: mahesh.rao@altera.com

From: Mahesh Rao <mahesh.rao@altera.com>

Add support for SDM (Secure Device Manager) mailbox
doorbell interrupt for async transactions. On interrupt,
a workqueue is triggered which polls the ATF for
pending responses and retrieves the bitmap of all
retrieved and unprocessed transaction ids of mailbox
responses from SDM. It then triggers the corresponding
registered callbacks.

Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/firmware/stratix10-svc.c             | 97 +++++++++++++++++++++++++++-
 include/linux/firmware/intel/stratix10-smc.h | 22 +++++++
 2 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index e25493db074930dcc16964fbb427be7168a841e6..d60808cc077da6d88ca6cc1043f6da46df31ebad 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -9,12 +9,14 @@
 #include <linux/delay.h>
 #include <linux/genalloc.h>
 #include <linux/hashtable.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kfifo.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -22,6 +24,7 @@
 #include <linux/firmware/intel/stratix10-smc.h>
 #include <linux/firmware/intel/stratix10-svc-client.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 /**
  * SVC_NUM_DATA_IN_FIFO - number of struct stratix10_svc_data in the FIFO
@@ -190,17 +193,20 @@ struct stratix10_async_chan {
 
 /**
  * struct stratix10_async_ctrl - Control structure for Stratix 10 asynchronous operations
+ * @irq: Interrupt request number associated with the asynchronous control
  * @initialized: Flag indicating whether the control structure has been initialized
  * @invoke_fn: Function pointer for invoking Stratix 10 service calls to EL3 secure firmware
  * @async_id_pool: Pointer to the ID pool used for asynchronous operations
  * @common_achan_refcount: Atomic reference count for the common asynchronous channel usage
  * @common_async_chan: Pointer to the common asynchronous channel structure
  * @trx_list_wr_lock: Spinlock for protecting the transaction list write operations
+ * @async_work: Work structure for scheduling asynchronous work
  * @trx_list: Hash table for managing asynchronous transactions
  */
 
 struct stratix10_async_ctrl {
 	bool initialized;
+	int irq;
 	void (*invoke_fn)(struct stratix10_async_ctrl *actrl,
 			  const struct arm_smccc_1_2_regs *args, struct arm_smccc_1_2_regs *res);
 	struct stratix10_sip_id_pool *async_id_pool;
@@ -208,6 +214,7 @@ struct stratix10_async_ctrl {
 	struct stratix10_async_chan *common_async_chan;
 	/* spinlock to protect the writes to trx_list hash table */
 	spinlock_t trx_list_wr_lock;
+	struct work_struct async_work;
 	DECLARE_HASHTABLE(trx_list, ASYNC_TRX_HASH_BITS);
 };
 
@@ -1632,6 +1639,71 @@ static inline void stratix10_smc_1_2(struct stratix10_async_ctrl *actrl,
 	arm_smccc_1_2_smc(args, res);
 }
 
+static irqreturn_t stratix10_svc_async_irq_handler(int irq, void *dev_id)
+{
+	struct stratix10_svc_controller *ctrl = dev_id;
+	struct stratix10_async_ctrl *actrl = &ctrl->actrl;
+
+	queue_work(system_bh_wq, &actrl->async_work);
+	disable_irq_nosync(actrl->irq);
+	return IRQ_HANDLED;
+}
+
+/**
+ * stratix10_async_workqueue_handler - Handles asynchronous workqueue tasks
+ * @work: Pointer to the work_struct representing the work to be handled
+ *
+ * This function is the handler for the asynchronous workqueue. It performs
+ * the following tasks:
+ * - Invokes the asynchronous polling on interrupt supervisory call.
+ * - On success,it retrieves the bitmap of pending transactions from mailbox
+ *   fifo in ATF.
+ * - It processes each pending transaction by calling the corresponding
+ *   callback function.
+ *
+ * The function ensures that the IRQ is enabled after processing the transactions
+ * and logs the total time taken to handle the transactions along with the number
+ * of transactions handled and the CPU on which the handler ran.
+ */
+static void stratix10_async_workqueue_handler(struct work_struct *work)
+{
+	u64 bitmap_array[4];
+	unsigned long transaction_id = 0;
+	struct stratix10_svc_async_handler *handler;
+	DECLARE_BITMAP(pend_on_irq, TOTAL_TRANSACTION_IDS);
+	struct arm_smccc_1_2_regs args = { .a0 = INTEL_SIP_SMC_ASYNC_POLL_ON_IRQ }, res;
+	struct stratix10_async_ctrl *actrl =
+		container_of(work, struct stratix10_async_ctrl, async_work);
+
+	actrl->invoke_fn(actrl, &args, &res);
+	if (res.a0 == INTEL_SIP_SMC_STATUS_OK) {
+		bitmap_array[0] = res.a1;
+		bitmap_array[1] = res.a2;
+		bitmap_array[2] = res.a3;
+		bitmap_array[3] = res.a4;
+		bitmap_from_arr64(pend_on_irq, bitmap_array, TOTAL_TRANSACTION_IDS);
+		rcu_read_lock();
+		do {
+			transaction_id = find_next_bit(pend_on_irq,
+						       TOTAL_TRANSACTION_IDS,
+						       transaction_id);
+			if (transaction_id >= TOTAL_TRANSACTION_IDS)
+				break;
+			hash_for_each_possible_rcu_notrace(actrl->trx_list,
+							   handler, next,
+							   transaction_id) {
+				if (handler->transaction_id == transaction_id) {
+					handler->cb(handler->cb_arg);
+					break;
+				}
+			}
+			transaction_id++;
+		} while (transaction_id < TOTAL_TRANSACTION_IDS);
+		rcu_read_unlock();
+	}
+	enable_irq(actrl->irq);
+}
+
 /**
  * stratix10_svc_async_init - Initialize the Stratix 10 service controller
  *                            for asynchronous operations.
@@ -1639,6 +1711,7 @@ static inline void stratix10_smc_1_2(struct stratix10_async_ctrl *actrl,
  *
  * This function initializes the asynchronous service controller by setting up
  * the necessary data structures, initializing the transaction list, and
+ * registering the IRQ handler for asynchronous transactions.
  *
  * Return: 0 on success, -EINVAL if the controller is NULL or already initialized,
  *         -ENOMEM if memory allocation fails, -EADDRINUSE if the client ID is already
@@ -1646,7 +1719,7 @@ static inline void stratix10_smc_1_2(struct stratix10_async_ctrl *actrl,
  */
 static int stratix10_svc_async_init(struct stratix10_svc_controller *controller)
 {
-	int ret;
+	int ret, irq;
 	struct arm_smccc_res res;
 
 	if (!controller)
@@ -1693,6 +1766,22 @@ static int stratix10_svc_async_init(struct stratix10_svc_controller *controller)
 	hash_init(actrl->trx_list);
 	atomic_set(&actrl->common_achan_refcount, 0);
 
+	irq = of_irq_get(dev_of_node(dev), 0);
+	if (irq < 0) {
+		dev_warn(dev, "Failed to get IRQ, falling back to polling mode\n");
+	} else {
+		ret = devm_request_any_context_irq(dev, irq, stratix10_svc_async_irq_handler,
+						   IRQF_NO_AUTOEN, "stratix10_svc", controller);
+		if (ret == 0) {
+			dev_alert(dev,
+				  "Registered IRQ %d for sip async operations\n",
+				irq);
+			actrl->irq = irq;
+			INIT_WORK(&actrl->async_work, stratix10_async_workqueue_handler);
+			enable_irq(actrl->irq);
+		}
+	}
+
 	actrl->initialized = true;
 	return 0;
 }
@@ -1728,6 +1817,12 @@ static int stratix10_svc_async_exit(struct stratix10_svc_controller *ctrl)
 
 	actrl->initialized = false;
 
+	if (actrl->irq > 0) {
+		free_irq(actrl->irq, ctrl);
+		flush_work(&actrl->async_work);
+		actrl->irq = 0;
+	}
+
 	spin_lock(&actrl->trx_list_wr_lock);
 	hash_for_each_safe(actrl->trx_list, i, tmp, handler, next) {
 		stratix10_deallocate_id(handler->achan->job_id_pool,
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index c98ed992d23bed5aa344868ca0c77a2d19d94c06..ee00f17ea9f6c7a1114fb617d4d6393f2c27e2a9 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -644,4 +644,26 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
 #define INTEL_SIP_SMC_ASYNC_FUNC_ID_POLL (0xC8)
 #define INTEL_SIP_SMC_ASYNC_POLL \
 	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_POLL)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_POLL_ON_IRQ
+ * Async call used by service driver at EL1 to read response from SDM mailbox and
+ * to retrieve the transaction id's of the read response's.
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_POLL_ON_IRQ
+ * a1 transaction job id
+ * a2-7 will be used to return the response data
+ *
+ * Return status
+ * a0 INTEL_SIP_SMC_STATUS_OK
+ * a1-a4 will contain bitmap of available responses's transaction id as set bit position.
+ * a5-17 not used
+ * Or
+ * a0 INTEL_SIP_SMC_STATUS_NO_RESPONSE
+ * a1-17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_IRQ_POLL (0xC9)
+#define INTEL_SIP_SMC_ASYNC_POLL_ON_IRQ \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_IRQ_POLL)
 #endif

-- 
2.35.3


