Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AA01A704B;
	Tue, 22 Apr 2025 04:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745294838; cv=none; b=bgSoCb4l+0NUvPTU7e2YUKSFGZ6aihLjXHpbH0gwQ8zaBpLEMKR0PUWZUM4alF31rKbk04wKZeEMn1X0jdwd5R+j4GCPqINkOIjrcKMM+EazpuglS8QxDbsbfbXmN7OEVnT/SCfUy02bJdOoVh3PEJmZ6mpW+E9+AHfeTLlwj3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745294838; c=relaxed/simple;
	bh=3+mgovEH2U7GbbwYUPvC67milPze1pciOWU6d6iilto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGv7yQ6LjwJhqn0LapnDT2r28smjTUHZXTj7b4zRMJy117R3vji/DAy0l6/yy7lz9Kn7xQrtOYPqIGNJNTEcUCm5dD7vYnnrSc9sfwJZhntKvIawy3TCLEOcEAQ/v2vwD1yda65uZprjvNkmfp6uHKP9FIFO+MQXz3RFFUUkUJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnUbKq9p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnUbKq9p"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C441C4CEF8;
	Tue, 22 Apr 2025 04:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745294837;
	bh=3+mgovEH2U7GbbwYUPvC67milPze1pciOWU6d6iilto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JnUbKq9pUnsJLaE/e3tEpKukETlcgI45GJZBMvahy54G3kSzfhRRrEgFT5zsn0afb
	 gvmktD3MjdZY+EQ9IXnz18W1sx20e2F0phnr/Scs34rsg8s90J4HS9Ipd3T3K22Khz
	 6xgQTaKbKMrEB3CCcnvZ6bzIAhy+4YgpEj5+HErIKh4d0ZE1tJ1e3CRyxNDGc66IUQ
	 SBJHg5L380SwxkMEBtLVNDNbPQDeqkBjV3/l2RvpP6tXoVB8NQuz3GiqodSIBUA3NP
	 rawL+DyDZAJq8Y7awMgxZBH2mXEi3/1sdJt/rzueCkdT8ylcuN4pR6WkFP2rdvyodo
	 Ued1lGC69iGgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92133C369D3;
	Tue, 22 Apr 2025 04:07:17 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Date: Tue, 22 Apr 2025 12:07:14 +0800
Subject: [PATCH 7/7] firmware: stratix10-svc: Add support for HWMON
 temperature and voltage read command.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-sip_svc_upstream-v1-7-088059190f31@altera.com>
References: <20250422-sip_svc_upstream-v1-0-088059190f31@altera.com>
In-Reply-To: <20250422-sip_svc_upstream-v1-0-088059190f31@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745294834; l=5773;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=JivcqKDOJIt5kDrV3wGuv8X3Vtjgv7lk5n3TnWoduZM=;
 b=qtRBVpFz7s4QX6NFMV1XgsXMYwNPcQomlnGHbFnssWIPvWjFOrSzb+of4eHR6moP5te8vR5xn
 Tv0tOOwiDWrBAvQ79Msyak1LZt9v/ZUyh0/rAJPk8RWDIQSZPlfeBmz
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
 drivers/firmware/stratix10-svc.c                   | 20 +++++++++++-
 include/linux/firmware/intel/stratix10-smc.h       | 38 ++++++++++++++++++++++
 .../linux/firmware/intel/stratix10-svc-client.h    | 11 +++++++
 3 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index d60808cc077da6d88ca6cc1043f6da46df31ebad..4ee89980319dcde5198d7112d08708b543881f73 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -40,7 +40,7 @@
  * timeout is set to 30 seconds (30 * 1000) at Intel Stratix10 SoC.
  */
 #define SVC_NUM_DATA_IN_FIFO			32
-#define SVC_NUM_CHANNEL				3
+#define SVC_NUM_CHANNEL				4
 #define FPGA_CONFIG_DATA_CLAIM_TIMEOUT_MS	200
 #define FPGA_CONFIG_STATUS_TIMEOUT_SEC		30
 #define BYTE_TO_WORD_SIZE              4
@@ -1429,6 +1429,14 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg, void **
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
@@ -1508,6 +1516,11 @@ static int stratix10_svc_async_prepare_response(struct stratix10_svc_chan *chan,
 	data->status = STRATIX10_GET_SDM_STATUS_CODE(handle->res.a1);
 
 	switch (p_msg->command) {
+	case COMMAND_HWMON_READTEMP:
+	case COMMAND_HWMON_READVOLT:
+		data->kaddr1 = (void *)&handle->res.a2;
+		break;
+
 	default:
 		dev_alert(ctrl->dev, "Invalid command\n ,%d", p_msg->command);
 		return -ENOENT;
@@ -2136,6 +2149,11 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
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
index ee00f17ea9f6c7a1114fb617d4d6393f2c27e2a9..78055b0234cee990515f01a509a75e1c8142c68b 100644
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


