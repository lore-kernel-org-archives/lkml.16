Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF871D90DF;
	Mon, 26 May 2025 06:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748240735; cv=none; b=Rf/iuCJjtEkJrPhu+MYpgzl8/XOGubyK7gojq2uzFADlOHvFNwy8ynU+Qi9StGRU30ZyWjcREptRsQAeqPQkMk4RTyqm4r880Q97+8SLJ5kS/jLy1SwTSh1womJuqai3hrJcFPl9nbvs0UWmOL20wK3y3LGrFOQ7v+6Wkwlabqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748240735; c=relaxed/simple;
	bh=rjWx7BLwzDHzTGPoZi5Ci7UHT5rzHaTz6fkskIYI2ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pbe3D8++sLIyXDeElu9s9+Q8x04dZ20bbqqilekj/aN/k04YiLv59OBPIBlTH7Tr2eAT7v5tUUKIammtYOd8JBW7Ccg3duiMj1QgjvywimYc1SKG9CsNtBPXRoSO1A34bR4C5Ndq733f90ja36c/vPPxe3WHBCwYVg6RFFWe/ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFfYoRl4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFfYoRl4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F17CC4CEF4;
	Mon, 26 May 2025 06:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748240735;
	bh=rjWx7BLwzDHzTGPoZi5Ci7UHT5rzHaTz6fkskIYI2ps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cFfYoRl4KJa3TqG5YZA6f53DFWd+B0/OhAK0hS8oS4bn6OXiGOXaHugbLHqhCIANs
	 wB36z7OMqk68NPGjtLj/MUonkhnrBY2Ih2vBVn33zsjRE1iHvmWiWrwQRCTFrX1C/g
	 MxOuht3kpoIQbt+0DFY+OVUPLR9fVElcFoTkEIR1XYXPXjBBN1bRVggEVxf2O/G3zl
	 CXwAyPGkhUlSCt/Y57gvnI65SmO4qoLxQtI2CQuPcquJnyRmD+4f+iBQxlMnlvNtuj
	 dp9GFom/LWZAXC9gmvna9/nfNKUuoL8SENbKp45pOOQT070QncQqIrojB14JGKgT+/
	 0ltoG+GOBDn0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F63C5B549;
	Mon, 26 May 2025 06:25:35 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Date: Mon, 26 May 2025 14:25:07 +0800
Subject: [PATCH v3 4/4] firmware: stratix10-svc: Add support for HWMON
 temperature and voltage read command.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-sip_svc_upstream-v3-4-6a08a4502de3@altera.com>
References: <20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com>
In-Reply-To: <20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748240732; l=7578;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=NbXdlT0TAtpSwJtw5xUJGWasfCwGb8vaYwcM1wH9ZBY=;
 b=r2aIs1YIHqZw3KGvkhlOYdmKSsDuu35vUjBmHhU8K9jB5HEtEpStiQAOBfo5dmbqDLETuQ9qt
 nIXJMRJbN2xD3kz8bHF3cSDB1a57IkdAT0p88fZZPqSuQ3rdb8AyJ4B
X-Developer-Key: i=mahesh.rao@altera.com; a=ed25519;
 pk=tQiFUzoKxHrQLDtWeEeaeTeJTl/UfclUHWZy1fjSiyg=
X-Endpoint-Received: by B4 Relay for mahesh.rao@altera.com/20250107 with
 auth_id=337
X-Original-From: Mahesh Rao <mahesh.rao@altera.com>
Reply-To: mahesh.rao@altera.com

From: Mahesh Rao <mahesh.rao@altera.com>

Add support for HWMON commands in stratix10
Asynchronous communication

Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/firmware/stratix10-svc.c                   | 60 +++++++++++++++++++++-
 include/linux/firmware/intel/stratix10-smc.h       | 38 ++++++++++++++
 .../linux/firmware/intel/stratix10-svc-client.h    | 11 ++++
 3 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 9c2aa7f61709683baa960f209659a931f06d3abf..e4954ad1cbbb58edf07e70a4f8ac7855086c0090 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -37,7 +37,7 @@
  * timeout is set to 30 seconds (30 * 1000) at Intel Stratix10 SoC.
  */
 #define SVC_NUM_DATA_IN_FIFO			32
-#define SVC_NUM_CHANNEL				3
+#define SVC_NUM_CHANNEL				4
 #define FPGA_CONFIG_DATA_CLAIM_TIMEOUT_MS	200
 #define FPGA_CONFIG_STATUS_TIMEOUT_SEC		30
 #define BYTE_TO_WORD_SIZE              4
@@ -1406,6 +1406,14 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg, void **
 		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
 
 	switch (p_msg->command) {
+	case COMMAND_HWMON_READTEMP:
+		args.a0 = INTEL_SIP_SMC_ASYNC_HWMON_READTEMP;
+		args.a2 = p_msg->arg[0];
+		break;
+	case COMMAND_HWMON_READVOLT:
+		args.a0 = INTEL_SIP_SMC_ASYNC_HWMON_READVOLT;
+		args.a2 = p_msg->arg[0];
+		break;
 	default:
 		dev_err(ctrl->dev, "Invalid command ,%d\n", p_msg->command);
 		ret = -EINVAL;
@@ -1460,6 +1468,46 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg, void **
 	return ret;
 }
 EXPORT_SYMBOL_GPL(stratix10_svc_async_send);
+
+/**
+ * stratix10_svc_async_prepare_response - Prepare the response data for
+ * an asynchronous transaction.
+ * @chan: Pointer to the service channel structure.
+ * @handle: Pointer to the asynchronous handler structure.
+ * @data: Pointer to the callback data structure.
+ *
+ * This function prepares the response data for an asynchronous transaction. It
+ * extracts the response data from the SMC response structure and stores it in
+ * the callback data structure. The function also logs the completion of the
+ * asynchronous transaction.
+ *
+ * Return: 0 on success, -ENOENT if the command is invalid
+ */
+static int stratix10_svc_async_prepare_response(struct stratix10_svc_chan *chan,
+						struct stratix10_svc_async_handler *handle,
+						struct stratix10_svc_cb_data *data)
+{
+	struct stratix10_svc_client_msg *p_msg =
+		(struct stratix10_svc_client_msg *)handle->msg;
+	struct stratix10_svc_controller *ctrl = chan->ctrl;
+
+	data->status = STRATIX10_GET_SDM_STATUS_CODE(handle->res.a1);
+
+	switch (p_msg->command) {
+	case COMMAND_HWMON_READTEMP:
+	case COMMAND_HWMON_READVOLT:
+		data->kaddr1 = (void *)&handle->res.a2;
+		break;
+
+	default:
+		dev_alert(ctrl->dev, "Invalid command\n ,%d", p_msg->command);
+		return -ENOENT;
+	}
+	dev_dbg(ctrl->dev, "Async message completed transaction_id 0x%02x\n",
+		handle->transaction_id);
+	return 0;
+}
+
 /**
  * stratix10_svc_async_poll - Polls the status of an asynchronous transaction.
  * @chan: Pointer to the service channel structure.
@@ -1510,6 +1558,11 @@ int stratix10_svc_async_poll(struct stratix10_svc_chan *chan, void *tx_handle,
 
 	data->status = 0;
 	if (handle->res.a0 == INTEL_SIP_SMC_STATUS_OK) {
+		ret = stratix10_svc_async_prepare_response(chan, handle, data);
+		if (ret) {
+			dev_err(ctrl->dev, "Error in preparation of response,%d\n", ret);
+			WARN_ON_ONCE(1);
+		}
 		return 0;
 	} else if (handle->res.a0 == INTEL_SIP_SMC_STATUS_BUSY) {
 		dev_dbg(ctrl->dev, "async message is still in progress\n");
@@ -1986,6 +2039,11 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	chans[2].name = SVC_CLIENT_FCS;
 	spin_lock_init(&chans[2].lock);
 
+	chans[3].scl = NULL;
+	chans[3].ctrl = controller;
+	chans[3].name = SVC_CLIENT_HWMON;
+	spin_lock_init(&chans[3].lock);
+
 	list_add_tail(&controller->node, &svc_ctrl);
 	platform_set_drvdata(pdev, controller);
 
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index c98ed992d23bed5aa344868ca0c77a2d19d94c06..cc14201ba4810517c4de6636aa60e3e3fa43ad7d 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -625,6 +625,44 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
 #define INTEL_SIP_SMC_FCS_GET_PROVISION_DATA \
 	INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FCS_GET_PROVISION_DATA)
 
+/**
+ * Request INTEL_SIP_SMC_ASYNC_HWMON_READTEMP
+ * Async call to request temperature
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_FUNCID_HWMON_READTEMP
+ * a1 transaction job id
+ * a2 Temperature Channel
+ * a3-a17 not used
+ *
+ * Return status
+ * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNCID_HWMON_READTEMP (0xE8)
+#define INTEL_SIP_SMC_ASYNC_HWMON_READTEMP \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNCID_HWMON_READTEMP)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_HWMON_READVOLT
+ * Async call to request voltage
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_HWMON_READVOLT
+ * a1 transaction job id
+ * a2 Voltage Channel
+ * a3-a17 not used
+ *
+ * Return status
+ * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNCID_HWMON_READVOLT (0xE9)
+#define INTEL_SIP_SMC_ASYNC_HWMON_READVOLT \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNCID_HWMON_READVOLT)
+
 /**
  * Request INTEL_SIP_SMC_ASYNC_POLL
  * Async call used by service driver at EL1 to query mailbox response from SDM.
diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
index bda837815bae35fbf4df6280dba5bc02d747426e..032e780c7b545e2e238f9dea712779d979e491d6 100644
--- a/include/linux/firmware/intel/stratix10-svc-client.h
+++ b/include/linux/firmware/intel/stratix10-svc-client.h
@@ -16,6 +16,7 @@
 #define SVC_CLIENT_FPGA			"fpga"
 #define SVC_CLIENT_RSU			"rsu"
 #define SVC_CLIENT_FCS			"fcs"
+#define SVC_CLIENT_HWMON		"hwmon"
 
 /*
  * Status of the sent command, in bit number
@@ -71,6 +72,7 @@
 #define SVC_RSU_REQUEST_TIMEOUT_MS              300
 #define SVC_FCS_REQUEST_TIMEOUT_MS		2000
 #define SVC_COMPLETED_TIMEOUT_MS		30000
+#define SVC_HWMON_REQUEST_TIMEOUT_MS		2000
 
 struct stratix10_svc_chan;
 
@@ -142,6 +144,12 @@ struct stratix10_svc_chan;
  *
  * @COMMAND_FCS_RANDOM_NUMBER_GEN: generate a random number, return status
  * is SVC_STATUS_OK, SVC_STATUS_ERROR
+ *
+ * @COMMAND_HWMON_READTEMP: read temperature from the hardware sensor connected
+ * to the FPGA, return status is SVC_STATUS_OK, SVC_STATUS_ERROR
+ *
+ * @COMMAND_HWMON_READVOLT: read voltage from the hardware sensor connected
+ * to the FPGA, return status is SVC_STATUS_OK, SVC_STATUS_ERROR
  */
 enum stratix10_svc_command_code {
 	/* for FPGA */
@@ -172,6 +180,9 @@ enum stratix10_svc_command_code {
 	COMMAND_MBOX_SEND_CMD = 100,
 	/* Non-mailbox SMC Call */
 	COMMAND_SMC_SVC_VERSION = 200,
+	/* for HWMON */
+	COMMAND_HWMON_READTEMP,
+	COMMAND_HWMON_READVOLT
 };
 
 /**

-- 
2.35.3


