Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE4C1A3A8D
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892698; cv=none; b=Uc5/Jf1EnSEPjpeTf2NC5CSiRWqY+OaelnvE7O99haZTFyk88zO7hxBAVY4zRB4c03uXhBpgW2/qa9pbTNLbYNSeZ7HVaIsLtsJEz9OK7sDmjNv21rlrDH4FVLuroV1p0GfIfPr5K7DSVkLSHr6vTVTQC9y1ORV3nhvf5SKri98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892698; c=relaxed/simple;
	bh=aIPmYCuNeSl1lIZkxMWBgTo5kWuSyrVZK7/hMZEJT0g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XZ15DJkHwtcuxWLCnpNdLq2X90pVE3odpnIIQNSRAN6o2Yly655OtdKnBinhidWvi4EvaRI9pNWUDSQR+Cp3D8aq+shR93qMg1Ti8oSasHBx/6h+qCvTAs3/8z12oRY2YLMHs6gOkiGWIDTipQCWNZ8/whObSg4BsJW+JRswKpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=SBGMFseR; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="SBGMFseR"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M5JgrL013402;
	Wed, 21 May 2025 22:44:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=a
	PSmNWLG1ZAZWOFTbvTZ1iFjyswCtrnwz+UwFwdN3Lw=; b=SBGMFseRwplcS6mwb
	4KX8dBiHzKeKMNLZjXJi2WoGWEp8dKFR2/HKmYFPyI3TBDtxmiwRiVGU34v47bWl
	4hzucd9oMpHdkYzi4WJnsPcCcArRfdqvtRGJHlDJPA4EsMkkaq6vDPTRlficHD2e
	aCIpqEJ/vTY+V+WsyK7E0vGuSWGqNiyoyfviw6RdfWCEky1ZYrEAH3zqUUIGmp6d
	DCQCtrcVNlvFVL9mMiEewTscc5e8mdVT9Z2eOTp2e/DadwsYL6+Q3qvIoedbLtwO
	kYeyAeVeb+EZh+YNwHRkj3S8NZC7vRGbp5Yr01C2+XgJ4fxZqyfHcQzTXKjyuBqk
	1hcpg==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 46swp68100-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:44:46 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 21 May 2025 22:44:45 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 21 May 2025 22:44:45 -0700
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id D757F5B694B;
	Wed, 21 May 2025 22:44:44 -0700 (PDT)
From: George Cherian <george.cherian@marvell.com>
To: <arnd@arndb.de>, <alexander.sverdlin@gmail.com>, <agaur@marvell.com>,
        <nikita.shubin@maquefel.me>, <vkoul@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <gcherian@marvell.com>
Subject: [PATCH v6 2/4] soc: marvell: rvu-pf: Add PF to AF mailbox communication support.
Date: Thu, 22 May 2025 05:44:42 +0000
Message-ID: <20250522054444.3531124-3-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522054444.3531124-1-george.cherian@marvell.com>
References: <20250522054444.3531124-1-george.cherian@marvell.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uH8XMo5U_1v90L3ptzoR-s1sjXAFe3vj
X-Authority-Analysis: v=2.4 cv=DO+P4zNb c=1 sm=1 tr=0 ts=682eb9ce cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=dt9VzEwgFbYA:10 a=M5GUcnROAAAA:8 a=pGLkceISAAAA:8 a=tXDIYXHy3PERTAO--iUA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA1NiBTYWx0ZWRfX2U14j+zXVLDH cND0+RBh6ER1hGGTrg2OS5S8HAwTIIXd1BPnnDtLrwx+ouiecG67TdgJzHFYs0B3jxp6/MRNEwD proS67aTPE0oaN3B18x+adbXoOHDxJqfVcsDs41jqO8wa84/HySaRBMbIvevAn0fqdv3euPVJn7
 nbxOsWD68wP1q9qEByqgjwHF2FcBRo84XviBf5nFck624n7GvCN7YJaeZ2+f+iv8HD4VXNfo5wC KX6UfSUxIopIExol/eocDM77dh8q6FAdi22DIie6j4sycXwMpuiAF8pQUYb1CBI9GLUMYYSeGWo Iuh5F85mhQ7PY0tcyG0n5lh++Y0/Y+Q0BkCb2VzMpv+OFmodHqxgqO6bNkeNVm46vggNS/kPx/l
 eoGa46OYM6ebOVJtkoQAjFBiB1t15ljDZzqEINOlPV17buIqB0ixRODgR4cFDKUfM32FEqIw
X-Proofpoint-ORIG-GUID: uH8XMo5U_1v90L3ptzoR-s1sjXAFe3vj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01

From: Anshumali Gaur <agaur@marvell.com>

Resource provisioning for virtual functions (VFs) is done by RVU admin
function (AF). RVU PF and AF shares a memory region which can be used
for communication. This patch adds support for mailbox communication
between PF and AF, notification of messages is via IRQs.

Example mailbox messages types and structures can be found at
drivers/net/ethernet/marvell/octeontx2/af/mbox.h

Signed-off-by: Anshumali Gaur <agaur@marvell.com>
Signed-off-by: George Cherian <gcherian@marvell.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/soc/marvell/rvu_gen_pf/gen_pf.c | 265 +++++++++++++++++++++++-
 drivers/soc/marvell/rvu_gen_pf/gen_pf.h | 124 +++++++++++
 2 files changed, 388 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/marvell/rvu_gen_pf/gen_pf.c b/drivers/soc/marvell/rvu_gen_pf/gen_pf.c
index 6437916cb6d7..a03fc3f16c69 100644
--- a/drivers/soc/marvell/rvu_gen_pf/gen_pf.c
+++ b/drivers/soc/marvell/rvu_gen_pf/gen_pf.c
@@ -16,6 +16,10 @@
 #include <rvu_trace.h>
 #include <rvu.h>
 
+ /* PCI BAR nos */
+#define PCI_CFG_REG_BAR_NUM		2
+#define PCI_MBOX_BAR_NUM		4
+
 #define DRV_NAME    "rvu_generic_pf"
 
 /* Supported devices */
@@ -46,6 +50,230 @@ static int rvu_gen_pf_check_pf_usable(struct gen_pf_dev *pfdev)
 	return 0;
 }
 
+static irqreturn_t rvu_gen_pf_pfaf_mbox_intr_handler(int irq, void *pf_irq)
+{
+	struct gen_pf_dev *pfdev = (struct gen_pf_dev *)pf_irq;
+	struct mbox *mw = &pfdev->mbox;
+	struct otx2_mbox_dev *mdev;
+	struct otx2_mbox *mbox;
+	struct mbox_hdr *hdr;
+	u64 mbox_data;
+
+	/* Clear the IRQ */
+	writeq(BIT_ULL(0), pfdev->reg_base + RVU_PF_INT);
+
+	mbox_data = readq(pfdev->reg_base + RVU_PF_PFAF_MBOX0);
+
+	if (mbox_data & MBOX_UP_MSG) {
+		mbox_data &= ~MBOX_UP_MSG;
+		writeq(mbox_data, pfdev->reg_base + RVU_PF_PFAF_MBOX0);
+
+		mbox = &mw->mbox_up;
+		mdev = &mbox->dev[0];
+		otx2_sync_mbox_bbuf(mbox, 0);
+
+		hdr = (struct mbox_hdr *)(mdev->mbase + mbox->rx_start);
+		if (hdr->num_msgs)
+			queue_work(pfdev->mbox_wq, &mw->mbox_up_wrk);
+
+		trace_otx2_msg_interrupt(pfdev->pdev, "UP message from AF to PF",
+					 BIT_ULL(0));
+	}
+
+	if (mbox_data & MBOX_DOWN_MSG) {
+		mbox_data &= ~MBOX_DOWN_MSG;
+		writeq(mbox_data, pfdev->reg_base + RVU_PF_PFAF_MBOX0);
+
+		mbox = &mw->mbox;
+		mdev = &mbox->dev[0];
+		otx2_sync_mbox_bbuf(mbox, 0);
+
+		hdr = (struct mbox_hdr *)(mdev->mbase + mbox->rx_start);
+		if (hdr->num_msgs)
+			queue_work(pfdev->mbox_wq, &mw->mbox_wrk);
+
+		trace_otx2_msg_interrupt(pfdev->pdev, "DOWN reply from AF to PF",
+					 BIT_ULL(0));
+	}
+	return IRQ_HANDLED;
+}
+
+static void rvu_gen_pf_disable_mbox_intr(struct gen_pf_dev *pfdev)
+{
+	int vector = pci_irq_vector(pfdev->pdev, RVU_PF_INT_VEC_AFPF_MBOX);
+
+	/* Disable AF => PF mailbox IRQ */
+	writeq(BIT_ULL(0), pfdev->reg_base + RVU_PF_INT_ENA_W1C);
+	free_irq(vector, pfdev);
+}
+
+static int rvu_gen_pf_register_mbox_intr(struct gen_pf_dev *pfdev)
+{
+	struct msg_req *req;
+	char *irq_name;
+	int err;
+
+	/* Register mailbox interrupt handler */
+	irq_name = &pfdev->irq_name[RVU_PF_INT_VEC_AFPF_MBOX * NAME_SIZE];
+	snprintf(irq_name, NAME_SIZE, "Generic RVUPFAF Mbox");
+	err = request_irq(pci_irq_vector(pfdev->pdev, RVU_PF_INT_VEC_AFPF_MBOX),
+			  rvu_gen_pf_pfaf_mbox_intr_handler, 0, irq_name, pfdev);
+	if (err) {
+		dev_err(pfdev->dev,
+			"GenPF: IRQ registration failed for PFAF mbox irq\n");
+		return err;
+	}
+
+	/*
+	 * Enable mailbox interrupt for msgs coming from AF.
+	 * First clear to avoid spurious interrupts, if any.
+	 */
+	writeq(BIT_ULL(0), pfdev->reg_base + RVU_PF_INT);
+	writeq(BIT_ULL(0), pfdev->reg_base + RVU_PF_INT_ENA_W1S);
+
+	/* Check mailbox communication with AF */
+	req = gen_pf_mbox_alloc_msg_ready(&pfdev->mbox);
+	if (!req) {
+		rvu_gen_pf_disable_mbox_intr(pfdev);
+		return -ENOMEM;
+	}
+	err = rvu_gen_pf_sync_mbox_msg(&pfdev->mbox);
+	if (err) {
+		dev_warn(pfdev->dev,
+			 "AF not responding to mailbox, deferring probe\n");
+		rvu_gen_pf_disable_mbox_intr(pfdev);
+		return -EPROBE_DEFER;
+	}
+	return 0;
+}
+
+static void rvu_gen_pf_pfaf_mbox_destroy(struct gen_pf_dev *pfdev)
+{
+	struct mbox *mbox = &pfdev->mbox;
+
+	if (pfdev->mbox_wq) {
+		destroy_workqueue(pfdev->mbox_wq);
+		pfdev->mbox_wq = NULL;
+	}
+
+	if (mbox->mbox.hwbase)
+		iounmap((void __iomem *)mbox->mbox.hwbase);
+
+	otx2_mbox_destroy(&mbox->mbox);
+	otx2_mbox_destroy(&mbox->mbox_up);
+}
+
+static void rvu_gen_pf_process_pfaf_mbox_msg(struct gen_pf_dev *pfdev,
+					     struct mbox_msghdr *msg)
+{
+	if (msg->id >= MBOX_MSG_MAX) {
+		dev_err(pfdev->dev,
+			"Mbox msg with unknown ID 0x%x\n", msg->id);
+		return;
+	}
+
+	if (msg->sig != OTX2_MBOX_RSP_SIG) {
+		dev_err(pfdev->dev,
+			"Mbox msg with wrong signature %x, ID 0x%x\n",
+			 msg->sig, msg->id);
+		return;
+	}
+
+	switch (msg->id) {
+	case MBOX_MSG_READY:
+		pfdev->pcifunc = msg->pcifunc;
+		break;
+	default:
+		if (msg->rc)
+			dev_err(pfdev->dev,
+				"Mbox msg response has err %d, ID 0x%x\n",
+				msg->rc, msg->id);
+		break;
+	}
+}
+
+static void rvu_gen_pf_pfaf_mbox_handler(struct work_struct *work)
+{
+	struct otx2_mbox_dev *mdev;
+	struct gen_pf_dev *pfdev;
+	struct mbox_hdr *rsp_hdr;
+	struct mbox_msghdr *msg;
+	struct otx2_mbox *mbox;
+	struct mbox *af_mbox;
+	int offset, id;
+	u16 num_msgs;
+
+	af_mbox = container_of(work, struct mbox, mbox_wrk);
+	mbox = &af_mbox->mbox;
+	mdev = &mbox->dev[0];
+	rsp_hdr = (struct mbox_hdr *)(mdev->mbase + mbox->rx_start);
+	num_msgs = rsp_hdr->num_msgs;
+
+	offset = mbox->rx_start + ALIGN(sizeof(*rsp_hdr), MBOX_MSG_ALIGN);
+	pfdev = af_mbox->pfvf;
+
+	for (id = 0; id < num_msgs; id++) {
+		msg = (struct mbox_msghdr *)(mdev->mbase + offset);
+		rvu_gen_pf_process_pfaf_mbox_msg(pfdev, msg);
+		offset = mbox->rx_start + msg->next_msgoff;
+		if (mdev->msgs_acked == (num_msgs - 1))
+			__otx2_mbox_reset(mbox, 0);
+		mdev->msgs_acked++;
+	}
+}
+
+static int rvu_gen_pf_pfaf_mbox_init(struct gen_pf_dev *pfdev)
+{
+	struct mbox *mbox = &pfdev->mbox;
+	void __iomem *hwbase;
+	int err;
+
+	mbox->pfvf = pfdev;
+	pfdev->mbox_wq = alloc_ordered_workqueue("otx2_pfaf_mailbox",
+						 WQ_HIGHPRI | WQ_MEM_RECLAIM);
+
+	if (!pfdev->mbox_wq)
+		return -ENOMEM;
+
+	/*
+	 * Mailbox is a reserved memory (in RAM) region shared between
+	 * admin function (i.e AF) and this PF, shouldn't be mapped as
+	 * device memory to allow unaligned accesses.
+	 */
+
+	hwbase = ioremap_wc(pci_resource_start(pfdev->pdev, PCI_MBOX_BAR_NUM),
+			    MBOX_SIZE);
+
+	if (!hwbase) {
+		dev_err(pfdev->dev, "Unable to map PFAF mailbox region\n");
+		err = -ENOMEM;
+		goto exit;
+	}
+
+	err = otx2_mbox_init(&mbox->mbox, hwbase, pfdev->pdev, pfdev->reg_base,
+			     MBOX_DIR_PFAF, 1);
+	if (err)
+		goto exit;
+
+	err = otx2_mbox_init(&mbox->mbox_up, hwbase, pfdev->pdev, pfdev->reg_base,
+			     MBOX_DIR_PFAF_UP, 1);
+
+	if (err)
+		goto exit;
+
+	err = otx2_mbox_bbuf_init(mbox, pfdev->pdev);
+	if (err)
+		goto exit;
+
+	INIT_WORK(&mbox->mbox_wrk, rvu_gen_pf_pfaf_mbox_handler);
+	mutex_init(&mbox->lock);
+
+	return 0;
+exit:
+	rvu_gen_pf_pfaf_mbox_destroy(pfdev);
+	return err;
+}
+
 static int rvu_gen_pf_sriov_enable(struct pci_dev *pdev, int numvfs)
 {
 	int ret;
@@ -91,6 +319,7 @@ static int rvu_gen_pf_probe(struct pci_dev *pdev, const struct pci_device_id *id
 {
 	struct device *dev = &pdev->dev;
 	struct gen_pf_dev *pfdev;
+	int num_vec;
 	int err;
 
 	err = pcim_enable_device(pdev);
@@ -123,13 +352,47 @@ static int rvu_gen_pf_probe(struct pci_dev *pdev, const struct pci_device_id *id
 	pfdev->pdev = pdev;
 	pfdev->dev = dev;
 	pfdev->total_vfs = pci_sriov_get_totalvfs(pdev);
+	num_vec = pci_msix_vec_count(pdev);
+	pfdev->irq_name = devm_kmalloc_array(&pfdev->pdev->dev, num_vec, NAME_SIZE,
+					     GFP_KERNEL);
+
+	/* Map CSRs */
+	pfdev->reg_base = pcim_iomap(pdev, PCI_CFG_REG_BAR_NUM, 0);
+	if (!pfdev->reg_base) {
+		dev_err(dev, "Unable to map physical function CSRs, aborting\n");
+		err = -ENOMEM;
+		goto err_release_regions;
+	}
 
 	err = rvu_gen_pf_check_pf_usable(pfdev);
 	if (err)
-		goto err_release_regions;
+		goto err_pcim_iounmap;
+
+	err = pci_alloc_irq_vectors(pfdev->pdev, num_vec, num_vec, PCI_IRQ_MSIX);
+	if (err < 0) {
+		dev_err(dev, "%s: Failed to alloc %d IRQ vectors\n",
+			__func__, num_vec);
+		goto err_pcim_iounmap;
+	}
+
+	/* Init PF <=> AF mailbox stuff */
+	err = rvu_gen_pf_pfaf_mbox_init(pfdev);
+	if (err)
+		goto err_free_irq_vectors;
+
+	/* Register mailbox interrupt */
+	err = rvu_gen_pf_register_mbox_intr(pfdev);
+	if (err)
+		goto err_mbox_destroy;
 
 	return 0;
 
+err_mbox_destroy:
+	rvu_gen_pf_pfaf_mbox_destroy(pfdev);
+err_free_irq_vectors:
+	pci_free_irq_vectors(pfdev->pdev);
+err_pcim_iounmap:
+	pcim_iounmap(pdev, pfdev->reg_base);
 err_release_regions:
 	pci_release_regions(pdev);
 	pci_set_drvdata(pdev, NULL);
diff --git a/drivers/soc/marvell/rvu_gen_pf/gen_pf.h b/drivers/soc/marvell/rvu_gen_pf/gen_pf.h
index d89b674b1a0f..2019bea10ad0 100644
--- a/drivers/soc/marvell/rvu_gen_pf/gen_pf.h
+++ b/drivers/soc/marvell/rvu_gen_pf/gen_pf.h
@@ -5,15 +5,139 @@
  */
 #include <linux/device.h>
 #include <linux/pci.h>
+#include <rvu_trace.h>
+#include "mbox.h"
 
 #define RVU_PFFUNC(pf, func)    \
 	((((pf) & RVU_PFVF_PF_MASK) << RVU_PFVF_PF_SHIFT) | \
 	(((func) & RVU_PFVF_FUNC_MASK) << RVU_PFVF_FUNC_SHIFT))
 
+#define NAME_SIZE		32
+
+struct gen_pf_dev;
+
+struct mbox {
+	struct otx2_mbox	mbox;
+	struct work_struct	mbox_wrk;
+	struct otx2_mbox	mbox_up;
+	struct work_struct	mbox_up_wrk;
+	struct gen_pf_dev	*pfvf;
+	void			*bbuf_base; /* Bounce buffer for mbox memory */
+	struct mutex		lock;   /* serialize mailbox access */
+	int			num_msgs; /* mbox number of messages */
+	int			up_num_msgs; /* mbox_up number of messages */
+};
+
 struct gen_pf_dev {
 	struct pci_dev		*pdev;
 	struct device		*dev;
 	void __iomem		*reg_base;
+	char			*irq_name;
+	struct work_struct	mbox_wrk;
+	struct work_struct	mbox_wrk_up;
+
+	/* Mbox */
+	struct mbox		mbox;
+	struct workqueue_struct *mbox_wq;
+
 	int			pf;
+	u16			pcifunc; /* RVU PF_FUNC */
 	u8			total_vfs;
 };
+
+/* Mbox APIs */
+static inline int rvu_gen_pf_sync_mbox_msg(struct mbox *mbox)
+{
+	int err;
+
+	if (!otx2_mbox_nonempty(&mbox->mbox, 0))
+		return 0;
+	otx2_mbox_msg_send(&mbox->mbox, 0);
+	err = otx2_mbox_wait_for_rsp(&mbox->mbox, 0);
+	if (err)
+		return err;
+
+	return otx2_mbox_check_rsp_msgs(&mbox->mbox, 0);
+}
+
+static inline int rvu_gen_pf_sync_mbox_up_msg(struct mbox *mbox, int devid)
+{
+	int err;
+
+	if (!otx2_mbox_nonempty(&mbox->mbox_up, devid))
+		return 0;
+	otx2_mbox_msg_send_up(&mbox->mbox_up, devid);
+	err = otx2_mbox_wait_for_rsp(&mbox->mbox_up, devid);
+	if (err)
+		return err;
+
+	return otx2_mbox_check_rsp_msgs(&mbox->mbox_up, devid);
+}
+
+#define M(_name, _id, _fn_name, _req_type, _rsp_type)			\
+static struct _req_type __maybe_unused					\
+*gen_pf_mbox_alloc_msg_ ## _fn_name(struct mbox *mbox)			\
+{									\
+	struct _req_type *req;						\
+	u16 id = _id;							\
+									\
+	req = (struct _req_type *)otx2_mbox_alloc_msg_rsp(		\
+		&mbox->mbox, 0, sizeof(struct _req_type),		\
+		sizeof(struct _rsp_type));				\
+	if (!req)							\
+		return NULL;						\
+	req->hdr.sig = OTX2_MBOX_REQ_SIG;				\
+	req->hdr.id = id;						\
+	trace_otx2_msg_alloc(mbox->mbox.pdev, id, sizeof(*req));	\
+	return req;							\
+}
+
+MBOX_MESSAGES
+#undef M
+
+/* Mbox bounce buffer APIs */
+static inline int otx2_mbox_bbuf_init(struct mbox *mbox, struct pci_dev *pdev)
+{
+	struct otx2_mbox *otx2_mbox;
+	struct otx2_mbox_dev *mdev;
+
+	mbox->bbuf_base = devm_kmalloc(&pdev->dev, MBOX_SIZE, GFP_KERNEL);
+
+	if (!mbox->bbuf_base)
+		return -ENOMEM;
+
+	/* Overwrite mbox mbase to point to bounce buffer, so that PF/VF
+	 * prepare all mbox messages in bounce buffer instead of directly
+	 * in hw mbox memory.
+	 */
+	otx2_mbox = &mbox->mbox;
+	mdev = &otx2_mbox->dev[0];
+	mdev->mbase = mbox->bbuf_base;
+
+	otx2_mbox = &mbox->mbox_up;
+	mdev = &otx2_mbox->dev[0];
+	mdev->mbase = mbox->bbuf_base;
+	return 0;
+}
+
+static inline void otx2_sync_mbox_bbuf(struct otx2_mbox *mbox, int devid)
+{
+	u16 msgs_offset = ALIGN(sizeof(struct mbox_hdr), MBOX_MSG_ALIGN);
+	void *hw_mbase = mbox->hwbase + (devid * MBOX_SIZE);
+	struct otx2_mbox_dev *mdev = &mbox->dev[devid];
+	struct mbox_hdr *hdr;
+	u64 msg_size;
+
+	if (mdev->mbase == hw_mbase)
+		return;
+
+	hdr = hw_mbase + mbox->rx_start;
+	msg_size = hdr->msg_size;
+
+	if (msg_size > mbox->rx_size - msgs_offset)
+		msg_size = mbox->rx_size - msgs_offset;
+
+	/* Copy mbox messages from mbox memory to bounce buffer */
+	memcpy(mdev->mbase + mbox->rx_start,
+	       hw_mbase + mbox->rx_start, msg_size + msgs_offset);
+}
-- 
2.34.1

