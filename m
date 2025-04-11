Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCEE21146C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370745; cv=none; b=WOxeDY65ACKaGzkqe5cvSn/mn2IHjY8wF5i0vPj1w5JX8CQcINb0KTRWivdXTEdxvLdx+35caMwR5Rcmh/BKyD1W0dsq+9V0G5CnaGLSYkfDdbBMvjHFKf1OXKoY2kHFGGycl+l0AHosH27/We6DS7tf82afnOyMCC6/xCUr/Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370745; c=relaxed/simple;
	bh=j3xA6bRZZ16EIr9OZEhJvJF9IVjwWP5YQPC7llL4Hgw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sv7fGqUVWZXxSHdfURZbrrVyQ5ZfySGtHVXDr9KIoj5X8Lblj52WaP5Df9+JWZLwm1E9wEFGKw8mlWNwQ3UGUjJC+wa40NDzW/b5Yq9vqjnei7SQafxkBvLMEk6VCNqPAHGBz4fHvYzCfNs9eX2enIeWswvxllqPJSTMYLtsEIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C21A106F;
	Fri, 11 Apr 2025 04:25:43 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DEDF3F694;
	Fri, 11 Apr 2025 04:25:42 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Huisong Li <lihuisong@huawei.com>
Subject: [PATCH] soc: hisilicon: kunpeng_hccs: Simplify PCC shared memory region handling
Date: Fri, 11 Apr 2025 12:25:39 +0100
Message-Id: <20250411112539.1149863-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCC driver now handles mapping and unmapping of shared memory
areas as part of pcc_mbox_{request,free}_channel(). Without these before,
this Kunpeng HCCS driver did handling of those mappings like several
other PCC mailbox client drivers.

There were redundant operations, leading to unnecessary code. Maintaining
the consistency across these driver was harder due to scattered handling
of shmem.

Just use the mapped shmem and remove all redundant operations from this
driver.

Cc: Huisong Li <lihuisong@huawei.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 42 ++++++++++------------------
 drivers/soc/hisilicon/kunpeng_hccs.h |  2 --
 2 files changed, 15 insertions(+), 29 deletions(-)

Hi,

This is just resend of the same patch that was part of a series [1].
Only core PCC mailbox changes were merged during v6.15 merge window.
So dropping all the maintainer acks and reposting it so that it can
be picked up for v6.16 via maintainers tree.

Regards,
Sudeep

[1] https://lore.kernel.org/all/20250313-pcc_fixes_updates-v3-9-019a4aa74d0f@arm.com/

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index 444a8f59b7da..7fc353732d55 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -167,10 +167,6 @@ static void hccs_pcc_rx_callback(struct mbox_client *cl, void *mssg)
 
 static void hccs_unregister_pcc_channel(struct hccs_dev *hdev)
 {
-	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
-
-	if (cl_info->pcc_comm_addr)
-		iounmap(cl_info->pcc_comm_addr);
 	pcc_mbox_free_channel(hdev->cl_info.pcc_chan);
 }
 
@@ -179,6 +175,7 @@ static int hccs_register_pcc_channel(struct hccs_dev *hdev)
 	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
 	struct mbox_client *cl = &cl_info->client;
 	struct pcc_mbox_chan *pcc_chan;
+	struct mbox_chan *mbox_chan;
 	struct device *dev = hdev->dev;
 	int rc;
 
@@ -196,7 +193,7 @@ static int hccs_register_pcc_channel(struct hccs_dev *hdev)
 		goto out;
 	}
 	cl_info->pcc_chan = pcc_chan;
-	cl_info->mbox_chan = pcc_chan->mchan;
+	mbox_chan = pcc_chan->mchan;
 
 	/*
 	 * pcc_chan->latency is just a nominal value. In reality the remote
@@ -206,34 +203,24 @@ static int hccs_register_pcc_channel(struct hccs_dev *hdev)
 	cl_info->deadline_us =
 			HCCS_PCC_CMD_WAIT_RETRIES_NUM * pcc_chan->latency;
 	if (!hdev->verspec_data->has_txdone_irq &&
-	    cl_info->mbox_chan->mbox->txdone_irq) {
+	    mbox_chan->mbox->txdone_irq) {
 		dev_err(dev, "PCC IRQ in PCCT is enabled.\n");
 		rc = -EINVAL;
 		goto err_mbx_channel_free;
 	} else if (hdev->verspec_data->has_txdone_irq &&
-		   !cl_info->mbox_chan->mbox->txdone_irq) {
+		   !mbox_chan->mbox->txdone_irq) {
 		dev_err(dev, "PCC IRQ in PCCT isn't supported.\n");
 		rc = -EINVAL;
 		goto err_mbx_channel_free;
 	}
 
-	if (!pcc_chan->shmem_base_addr ||
-	    pcc_chan->shmem_size != HCCS_PCC_SHARE_MEM_BYTES) {
-		dev_err(dev, "The base address or size (%llu) of PCC communication region is invalid.\n",
-			pcc_chan->shmem_size);
+	if (pcc_chan->shmem_size != HCCS_PCC_SHARE_MEM_BYTES) {
+		dev_err(dev, "Base size (%llu) of PCC communication region must be %d bytes.\n",
+			pcc_chan->shmem_size, HCCS_PCC_SHARE_MEM_BYTES);
 		rc = -EINVAL;
 		goto err_mbx_channel_free;
 	}
 
-	cl_info->pcc_comm_addr = ioremap(pcc_chan->shmem_base_addr,
-					 pcc_chan->shmem_size);
-	if (!cl_info->pcc_comm_addr) {
-		dev_err(dev, "Failed to ioremap PCC communication region for channel-%u.\n",
-			hdev->chan_id);
-		rc = -ENOMEM;
-		goto err_mbx_channel_free;
-	}
-
 	return 0;
 
 err_mbx_channel_free:
@@ -246,7 +233,7 @@ static int hccs_wait_cmd_complete_by_poll(struct hccs_dev *hdev)
 {
 	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
 	struct acpi_pcct_shared_memory __iomem *comm_base =
-							cl_info->pcc_comm_addr;
+							cl_info->pcc_chan->shmem;
 	u16 status;
 	int ret;
 
@@ -289,7 +276,7 @@ static inline void hccs_fill_pcc_shared_mem_region(struct hccs_dev *hdev,
 		.status = 0,
 	};
 
-	memcpy_toio(hdev->cl_info.pcc_comm_addr, (void *)&tmp,
+	memcpy_toio(hdev->cl_info.pcc_chan->shmem, (void *)&tmp,
 		    sizeof(struct acpi_pcct_shared_memory));
 
 	/* Copy the message to the PCC comm space */
@@ -309,7 +296,7 @@ static inline void hccs_fill_ext_pcc_shared_mem_region(struct hccs_dev *hdev,
 		.command = cmd,
 	};
 
-	memcpy_toio(hdev->cl_info.pcc_comm_addr, (void *)&tmp,
+	memcpy_toio(hdev->cl_info.pcc_chan->shmem, (void *)&tmp,
 		    sizeof(struct acpi_pcct_ext_pcc_shared_memory));
 
 	/* Copy the message to the PCC comm space */
@@ -321,12 +308,13 @@ static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
 {
 	const struct hccs_verspecific_data *verspec_data = hdev->verspec_data;
 	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
+	struct mbox_chan *mbox_chan = cl_info->pcc_chan->mchan;
 	struct hccs_fw_inner_head *fw_inner_head;
 	void __iomem *comm_space;
 	u16 space_size;
 	int ret;
 
-	comm_space = cl_info->pcc_comm_addr + verspec_data->shared_mem_size;
+	comm_space = cl_info->pcc_chan->shmem + verspec_data->shared_mem_size;
 	space_size = HCCS_PCC_SHARE_MEM_BYTES - verspec_data->shared_mem_size;
 	verspec_data->fill_pcc_shared_mem(hdev, cmd, desc,
 					  comm_space, space_size);
@@ -334,7 +322,7 @@ static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
 		reinit_completion(&cl_info->done);
 
 	/* Ring doorbell */
-	ret = mbox_send_message(cl_info->mbox_chan, &cmd);
+	ret = mbox_send_message(mbox_chan, &cmd);
 	if (ret < 0) {
 		dev_err(hdev->dev, "Send PCC mbox message failed, ret = %d.\n",
 			ret);
@@ -356,9 +344,9 @@ static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
 
 end:
 	if (verspec_data->has_txdone_irq)
-		mbox_chan_txdone(cl_info->mbox_chan, ret);
+		mbox_chan_txdone(mbox_chan, ret);
 	else
-		mbox_client_txdone(cl_info->mbox_chan, ret);
+		mbox_client_txdone(mbox_chan, ret);
 	return ret;
 }
 
diff --git a/drivers/soc/hisilicon/kunpeng_hccs.h b/drivers/soc/hisilicon/kunpeng_hccs.h
index dc267136919b..f0a9a5618d97 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.h
+++ b/drivers/soc/hisilicon/kunpeng_hccs.h
@@ -60,10 +60,8 @@ struct hccs_chip_info {
 
 struct hccs_mbox_client_info {
 	struct mbox_client client;
-	struct mbox_chan *mbox_chan;
 	struct pcc_mbox_chan *pcc_chan;
 	u64 deadline_us;
-	void __iomem *pcc_comm_addr;
 	struct completion done;
 };
 
-- 
2.34.1

