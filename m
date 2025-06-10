Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6872376EF;
	Tue, 10 Jun 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569837; cv=none; b=sK/6+J8vmvI/3TJcO1+3hEhCUSj1yxyPlA7U4bHJLa+JO5cQjugB2F/tJdIQs+bSM4fk+w6GG5ulcuJiuS3LX5Vvqxhqj06jmiD4g727LpLplELZflbaBFZiZSrMdwbF4YqhEkkwbLRVXXNlktwuGMUCd4ho1GQWR+TaQJ8Ayh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569837; c=relaxed/simple;
	bh=9Ii8EYTSS3k7KM8HdW7TWKBOj15gj9PSAJqBHJXRvp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qEmgQsC7VlqV3DPPhnCXk5DxhBE2xKacgm4N2Q+zbvAfgZVKe4JuD98O6yBKPE5qKi9lDvZraE7Q7tXb6T3/Gi+aGwjv/2vwuJuUTxg/plGgIb9H+FqbV4z2rdSTPLNvkc3Kq4Ofs5fwwh0BC8vtJJcAqNJx+nsORM7N2HWn2dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAsdyqaK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAsdyqaK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44136C4CEF9;
	Tue, 10 Jun 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569837;
	bh=9Ii8EYTSS3k7KM8HdW7TWKBOj15gj9PSAJqBHJXRvp8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AAsdyqaKarGBhc8W0VcEyIjGfKN8VKk9BL7Pdbv1VqRregpHjLboDA+TXmTY5rilm
	 JfvFg6qolZkPATTyJZU5W5BVGjeeOwJDnI0CNu/aFheGMmiuj1jpOMqtaMGzFy2kDf
	 r3hWSjJB4mdyvC+ggJlpgbL8tpiDbdhDQkf58YH4QORVzktTvbUWsVXofVbsh0+EQT
	 hypoN7OvgN8Y5WOVONEdmLDzBzQVA1WDH9Y4EzotCaVVkID8oiifFvwqSLpA658b4h
	 vp2dkQ4WRdtkb/tu0uqB80FBBdsFExQ4uR3I4mv2N7wsCz6iToD3UzrhDzKA7irhL6
	 25sCF+Y0Z1yvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC9EC5B552;
	Tue, 10 Jun 2025 15:37:17 +0000 (UTC)
From: Mahesh Rao via B4 Relay <devnull+mahesh.rao.altera.com@kernel.org>
Date: Tue, 10 Jun 2025 23:37:11 +0800
Subject: [PATCH v4 4/5] firmware: stratix10-svc: Add support for RSU
 commands in asynchronous framework
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-sip_svc_upstream-v4-4-bcd9d6089071@altera.com>
References: <20250610-sip_svc_upstream-v4-0-bcd9d6089071@altera.com>
In-Reply-To: <20250610-sip_svc_upstream-v4-0-bcd9d6089071@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749569835; l=7372;
 i=mahesh.rao@altera.com; s=20250107; h=from:subject:message-id;
 bh=Mu9N7tsUAFky9+tqicPRBdJL81YID4AdrOL38twyxuI=;
 b=DPG8Eo1hyyZzLANxH8e6WHT4HiJeSD9hlvImiCFnrzf/LOpOYTHpa3ECc2KUKrLbjUJpBmHuW
 4JMkNoz8IVYDaEVi3AO+QK2rfHGmm3N6FMF+oJhXA7PYi3wp3MWuMm4
X-Developer-Key: i=mahesh.rao@altera.com; a=ed25519;
 pk=tQiFUzoKxHrQLDtWeEeaeTeJTl/UfclUHWZy1fjSiyg=
X-Endpoint-Received: by B4 Relay for mahesh.rao@altera.com/20250107 with
 auth_id=337
X-Original-From: Mahesh Rao <mahesh.rao@altera.com>
Reply-To: mahesh.rao@altera.com

From: Mahesh Rao <mahesh.rao@altera.com>

Integrate Remote System Update(RSU) service commands
into the asynchronous framework for communicating
with SDM. This allows the RSU commands to be processed
asynchronously, improving the responsiveness of the
Stratix10 service channel.

The asynchronous framework now supports the following
RSU commands:

* COMMAND_RSU_GET_SPT_TABLE
* COMMAND_RSU_STATUS
* COMMAND_RSU_NOTIFY

Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
---
 drivers/firmware/stratix10-svc.c                   | 65 ++++++++++++++++++++++
 include/linux/firmware/intel/stratix10-smc.h       | 52 +++++++++++++++++
 .../linux/firmware/intel/stratix10-svc-client.h    |  4 ++
 3 files changed, 121 insertions(+)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 7f25804351dbedf4305c8cee98c3378a924b4768..5193561c4c65743d7f7f0c5665c491e906920202 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -1446,6 +1446,16 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
 		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
 
 	switch (p_msg->command) {
+	case COMMAND_RSU_GET_SPT_TABLE:
+		args.a0 = INTEL_SIP_SMC_ASYNC_RSU_GET_SPT;
+		break;
+	case COMMAND_RSU_STATUS:
+		args.a0 = INTEL_SIP_SMC_ASYNC_RSU_GET_ERROR_STATUS;
+		break;
+	case COMMAND_RSU_NOTIFY:
+		args.a0 = INTEL_SIP_SMC_ASYNC_RSU_NOTIFY;
+		args.a2 = p_msg->arg[0];
+		break;
 	default:
 		dev_err(ctrl->dev, "Invalid command ,%d\n", p_msg->command);
 		ret = -EINVAL;
@@ -1500,6 +1510,56 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
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
+	case COMMAND_RSU_NOTIFY:
+		break;
+	case COMMAND_RSU_GET_SPT_TABLE:
+		data->kaddr1 = (void *)&handle->res.a2;
+		data->kaddr2 = (void *)&handle->res.a3;
+		break;
+	case COMMAND_RSU_STATUS:
+		/* COMMAND_RSU_STATUS has more elements than the cb_data
+		 * can acomodate, so passing the response structure to the
+		 * response function to be handled before done command is
+		 * executed by the client.
+		 */
+		data->kaddr1 = (void *)&handle->res;
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
  * stratix10_svc_async_poll - Polls the status of an asynchronous
  * transaction.
@@ -1558,6 +1618,11 @@ int stratix10_svc_async_poll(struct stratix10_svc_chan *chan, void *tx_handle,
 	memset(data, 0, sizeof(*data));
 
 	if (handle->res.a0 == INTEL_SIP_SMC_STATUS_OK) {
+		ret = stratix10_svc_async_prepare_response(chan, handle, data);
+		if (ret) {
+			dev_err(ctrl->dev, "Error in preparation of response,%d\n", ret);
+			WARN_ON_ONCE(1);
+		}
 		return 0;
 	} else if (handle->res.a0 == INTEL_SIP_SMC_STATUS_BUSY) {
 		dev_dbg(ctrl->dev, "async message is still in progress\n");
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index c98ed992d23bed5aa344868ca0c77a2d19d94c06..f87273af5e284b8912d87eb9d7179eb3d43e40e1 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -644,4 +644,56 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
 #define INTEL_SIP_SMC_ASYNC_FUNC_ID_POLL (0xC8)
 #define INTEL_SIP_SMC_ASYNC_POLL \
 	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_POLL)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_RSU_GET_SPT
+ * Async call to get RSU SPT from SDM.
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_RSU_GET_SPT
+ * a1 transaction job id
+ * a2-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_RSU_GET_SPT (0xEA)
+#define INTEL_SIP_SMC_ASYNC_RSU_GET_SPT \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_RSU_GET_SPT)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_RSU_GET_ERROR_STATUS
+ * Async call to get RSU error status from SDM.
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_RSU_GET_ERROR_STATUS
+ * a1 transaction job id
+ * a2-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_RSU_GET_ERROR_STATUS (0xEB)
+#define INTEL_SIP_SMC_ASYNC_RSU_GET_ERROR_STATUS \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_RSU_GET_ERROR_STATUS)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_RSU_NOTIFY
+ * Async call to send NOTIFY value to SDM.
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_RSU_NOTIFY
+ * a1 transaction job id
+ * a2 notify value
+ * a3-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_RSU_NOTIFY (0xEC)
+#define INTEL_SIP_SMC_ASYNC_RSU_NOTIFY \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_RSU_NOTIFY)
 #endif
diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
index bda837815bae35fbf4df6280dba5bc02d747426e..cf0eac5446147e9a92a1ddada23bc183977123c0 100644
--- a/include/linux/firmware/intel/stratix10-svc-client.h
+++ b/include/linux/firmware/intel/stratix10-svc-client.h
@@ -125,6 +125,9 @@ struct stratix10_svc_chan;
  * @COMMAND_RSU_DCMF_STATUS: query firmware for the DCMF status
  * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
  *
+ * @COMMAND_RSU_GET_SPT_TABLE: query firmware for SPT table
+ * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
+ *
  * @COMMAND_FCS_REQUEST_SERVICE: request validation of image from firmware,
  * return status is SVC_STATUS_OK, SVC_STATUS_INVALID_PARAM
  *
@@ -159,6 +162,7 @@ enum stratix10_svc_command_code {
 	COMMAND_RSU_DCMF_VERSION,
 	COMMAND_RSU_DCMF_STATUS,
 	COMMAND_FIRMWARE_VERSION,
+	COMMAND_RSU_GET_SPT_TABLE,
 	/* for FCS */
 	COMMAND_FCS_REQUEST_SERVICE = 20,
 	COMMAND_FCS_SEND_CERTIFICATE,

-- 
2.35.3


