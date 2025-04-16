Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6F918FDD5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814239; cv=none; b=qqhWZgKU759fvddiTTbxbFM200St0sTFhh4ML+DUH1XxaUb/DwbMZqFJSkHL6txvvbWpa8JdcNil011e+CNvIrVGbX1uMaLlySJRevWQbYRjK85aek/xSdIrgrHh00Fyqx8IAphWERFcnhXD2v7kgOMoKN5J9DQy7SQoBsAdxFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814239; c=relaxed/simple;
	bh=8Kjdn5BbC4mwPz7a+XUvnbjE4mQYNVfpupBgbjpZxdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+gSpG3SCj9ZofO74eYk3RbuYXh60+BCc4o+aS9kaIrVeaPrQ6wrNdkaZGCEYwypX5MCTzUv0dSD7T+0pu4V7tJ43f0VaI45QH/vg3fJQPQJ9Y8btGFtbYs7iU3PzK/jfvGHbS1R4EfvzNjazkgm+Ir2wMXvZ54utXd/zCUvnAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=0OmFYpiI; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="0OmFYpiI"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E0E8C9722;
	Wed, 16 Apr 2025 16:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1744813677; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=gai6Yh0IHeScDh3I4+epSp9DgjIHHr9iXOrYzQ4bXLY=;
	b=0OmFYpiIJP2WFDK2BvruxJ3L80n1q/S+di7uKdiDH/blcBTPEXVABwwxVuyJDPUSi1WdW7
	J2Aud53DAQJQ5xTloqmdWE1K2w4245Bt6EPzFcoo64orttlgJEfbPr2+imGybH+LoQhRml
	24DUSNp7UyZOVqkWVtKo5snWUF/GMP0BHRI5v+H0mu3t56V2+ETEnW9yaHBNrDERMAmcws
	+l6wdKX5Rv47Lc+WTgC9ASa9XW+J6ezdBVI0x/fH32AwqEmFbHjJqx/OuG/naLNUb4M2c8
	mRAMWPHMWhicRFj2FGzcthpVKMDNfbJtbnMKYmBDsYKTnw54t4tdzsTRF6Gv5w==
From: Frieder Schrempf <frieder@fris.de>
To: Peng Fan <peng.fan@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [RFC PATCH 1/5] firmware: imx: ele: Add API functions for OCOTP fuse access
Date: Wed, 16 Apr 2025 16:26:20 +0200
Message-ID: <20250416142715.1042363-2-frieder@fris.de>
In-Reply-To: <20250416142715.1042363-1-frieder@fris.de>
References: <20250416142715.1042363-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The ELE S400 API provides read and write access to the OCOTP fuse
registers. This adds the necessary API functions imx_se_read_fuse()
and imx_se_write_fuse() to be used by other drivers such as the
OCOTP S400 NVMEM driver.

This is ported from the downstream vendor kernel.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/firmware/imx/ele_base_msg.c | 122 ++++++++++++++++++++++++++++
 drivers/firmware/imx/ele_base_msg.h |   8 ++
 include/linux/firmware/imx/se_api.h |   3 +
 3 files changed, 133 insertions(+)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index bed1a0459d8d..0dfd4d2fef5a 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -311,3 +311,125 @@ int ele_debug_dump(struct se_if_priv *priv)
 
 	return ret;
 }
+
+static int ele_read_fuse(struct se_if_priv *priv, uint16_t fuse_id, u32 *value)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int rx_msg_sz = ELE_READ_FUSE_RSP_MSG_SZ;
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	tx_msg = kzalloc(ELE_READ_FUSE_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	rx_msg = kzalloc(rx_msg_sz, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				  ELE_READ_FUSE_REQ, ELE_READ_FUSE_REQ_MSG_SZ,
+				  true);
+	if (ret)
+		return ret;
+
+	tx_msg->data[0] = fuse_id;
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg,
+			       ELE_READ_FUSE_REQ_MSG_SZ, rx_msg, rx_msg_sz);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_READ_FUSE_REQ,
+				      rx_msg_sz, true);
+	if (ret)
+		return ret;
+
+	*value = rx_msg->data[1];
+
+	return 0;
+}
+
+/**
+ * imx_se_read_fuse() - API to request SE-FW to read the fuse(s) value.
+ * @void *se_if_data: refs to data attached to the se interface.
+ * @uint16_t fuse_id: Fuse identifier to read.
+ * @u32 *value: unsigned integer array to store the fuse values.
+ *
+ * Secure enclave like EdgeLock Enclave, manages the fuse. This API
+ * requests the FW to read the fuses. FW responds with the read
+ * values.
+ *
+ * Context:
+ *
+ * Return value:
+ *   0,   means success.
+ *   < 0, means failure.
+ */
+int imx_se_read_fuse(void *se_if_data, uint16_t fuse_id, u32 *value)
+{
+	return ele_read_fuse((struct se_if_priv *)se_if_data, fuse_id, value);
+}
+EXPORT_SYMBOL_GPL(imx_se_read_fuse);
+
+static int ele_write_fuse(struct se_if_priv *priv, uint16_t fuse_id, u32 value)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	tx_msg = kzalloc(ELE_WRITE_FUSE_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	rx_msg = kzalloc(ELE_WRITE_FUSE_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				  ELE_WRITE_FUSE, ELE_WRITE_FUSE_REQ_MSG_SZ,
+				  true);
+	if (ret)
+		return ret;
+
+	tx_msg->data[0] = (32 << 16) | (fuse_id << 5);
+	tx_msg->data[1] = value;
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg,
+			       ELE_WRITE_FUSE_REQ_MSG_SZ, rx_msg,
+			       ELE_WRITE_FUSE_RSP_MSG_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_WRITE_FUSE,
+				      ELE_WRITE_FUSE_RSP_MSG_SZ, true);
+
+	return ret;
+}
+
+/**
+ * imx_se_write_fuse() - API to request SE-FW to write to fuses.
+ * @void *se_if_data: refs to data attached to the se interface.
+ * @uint16_t fuse_id: Fuse identifier to write to.
+ * @u32 value: unsigned integer value that to be written to the fuse.
+ *
+ * Secure enclave like EdgeLock Enclave, manages the fuse. This API
+ * requests the FW to write the fuse with the given value.
+ *
+ * Context:
+ *
+ * Return value:
+ *   0,   means success.
+ *   < 0, means failure.
+ */
+int imx_se_write_fuse(void *se_if_data, uint16_t fuse_id, u32 value)
+{
+	return ele_write_fuse((struct se_if_priv *)se_if_data, fuse_id, value);
+}
+EXPORT_SYMBOL_GPL(imx_se_write_fuse);
diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
index dd89412f485e..22f553cdbc33 100644
--- a/drivers/firmware/imx/ele_base_msg.h
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -19,6 +19,14 @@
 #define ELE_GET_INFO_REQ_MSG_SZ		0x10
 #define ELE_GET_INFO_RSP_MSG_SZ		0x08
 
+#define ELE_WRITE_FUSE			0xD6
+#define ELE_WRITE_FUSE_REQ_MSG_SZ	12
+#define ELE_WRITE_FUSE_RSP_MSG_SZ	12
+
+#define ELE_READ_FUSE_REQ		0x97
+#define ELE_READ_FUSE_REQ_MSG_SZ	0x08
+#define ELE_READ_FUSE_RSP_MSG_SZ	0x0C
+
 #define MAX_UID_SIZE                     (16)
 #define DEV_GETINFO_ROM_PATCH_SHA_SZ     (32)
 #define DEV_GETINFO_FW_SHA_SZ            (32)
diff --git a/include/linux/firmware/imx/se_api.h b/include/linux/firmware/imx/se_api.h
index b1c4c9115d7b..9503b9363593 100644
--- a/include/linux/firmware/imx/se_api.h
+++ b/include/linux/firmware/imx/se_api.h
@@ -11,4 +11,7 @@
 #define SOC_ID_OF_IMX8ULP		0x084d
 #define SOC_ID_OF_IMX93			0x9300
 
+int imx_se_write_fuse(void *se_if_data, uint16_t fuse_id, u32 value);
+int imx_se_read_fuse(void *se_if_data, uint16_t fuse_id, u32 *value);
+
 #endif /* __SE_API_H__ */
-- 
2.49.0

