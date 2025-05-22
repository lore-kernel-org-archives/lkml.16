Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A537B1A4E70
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892698; cv=none; b=QsouOmhNDGf58uQu7EVP8vCp1/AVT00Xow25LHWlnJTEgsXSmHR9eNr/Ipbbjt/Az0p+g1rmqP8+0uja77BXNQh5NRbTcHkLVoKbm0jFI/smPqpNe2+iASV+TRO66G5rB7+7C9HQEDj+FiErra6QThqxp003xgaMy2yBoaemU2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892698; c=relaxed/simple;
	bh=sMM6T+Lz3X2wXsCZZmH9P0KQk3BRY7oGiOm25KqMIn0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZxXH3XnIkjVvNdDYh8faVdiBJOh3qGtVi6f7v4+DM4c2YJwOhVAFeirh/lAhBE6FRnGMnVm626qho0Z50pOrD1jafQ/79VLpUKDmbnAWiHpc3lVLkZmYp/cVPvTJVSRKeUR1mdP0zVwQSpiLb5f3XsRL8YUg+/duWdy31nrgsA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=VIY2GxyH; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="VIY2GxyH"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M5JgrM013402;
	Wed, 21 May 2025 22:44:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=9
	EGIyDYUqUFKTDf6MLIxK/cIfbCO1p9jXW4iLEpu8Xw=; b=VIY2GxyHjwnNPh5vW
	0r6NE4lyFe5WukGyWFhMKmuC+fq4gDTIfbtu4w1Au/DbkLFcT1b21ri1n0cynvDG
	mQcJatN7N1LdpYJcQ/NL42uQ6fv1iRQX+bSqDee6qVArP0UHWALS6wJVnBCwwNum
	+yJuB+UsEZIdPotd6sUpE01kZCYq9SwQX7c9JXQBc1gpp8MMLpkeHaGXsGfDdDgh
	y+WX1kdIz54cN/pDEd6LdU8Zytr/TVsn1pdrOAzKDw1RoZR+qu439a3rlk0UzBO9
	UszxYlAr4o7dGrYSXPd/cdM990lBS/drIj4x4WR5xo4HnEB9FVHNj9q+kLuBYmCd
	wvnpQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 46swp68100-3
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
	by maili.marvell.com (Postfix) with ESMTP id 3C5045B694D;
	Wed, 21 May 2025 22:44:45 -0700 (PDT)
From: George Cherian <george.cherian@marvell.com>
To: <arnd@arndb.de>, <alexander.sverdlin@gmail.com>, <agaur@marvell.com>,
        <nikita.shubin@maquefel.me>, <vkoul@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <gcherian@marvell.com>
Subject: [PATCH v6 4/4] soc: marvell: rvu-pf: Handle function level reset (FLR) IRQs for VFs
Date: Thu, 22 May 2025 05:44:44 +0000
Message-ID: <20250522054444.3531124-5-george.cherian@marvell.com>
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
X-Proofpoint-GUID: HvZ9ux4A3woTbvPENqFlu3RmzkyGogp0
X-Authority-Analysis: v=2.4 cv=DO+P4zNb c=1 sm=1 tr=0 ts=682eb9cf cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=dt9VzEwgFbYA:10 a=M5GUcnROAAAA:8 a=pGLkceISAAAA:8 a=3ie1WVgr3YDlqjzgjNwA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA1NiBTYWx0ZWRfX6Uo8xHdby6rJ SBAnRyR3X+d9D10i38u6cS6I223/IDriIucwvfTYEkPs/xfaJ9Dx+ysYoDKWjszu10xnP42L7z+ Cu7sv26pP6lCxWiK+C60B/Rbw9BnJC2IyRJyCzUrqFRawtQeCdGet4tyY1WVLRH67EXtPd/lqNN
 gv5I8z6B0srRphbgzhZdw57dexQQrUJY/tvACL/X0IMA9M1nnLE2xvq7OXCuI2YmsLqi/+q6MgP j+friiLSCncMVl6vvQOrr88FQLDLrxCq0n+22fTVwqQSQrSIvCSGKfXY1HdXnTrf9jowsNnwVRB nGGrZXkywz9cZlD0r6kN5wz/h7109IwSVQAOO5krSPgdQ/IwbiJZ4JVvOnNO7ZLkJh6vIxq/uR3
 0DnOF1pQQXVfuZLr6PPhESJ57Fe1VicheDXx2KuHNGsWQadBCFyvDgzipSSIfdZZcz21OvLK
X-Proofpoint-ORIG-GUID: HvZ9ux4A3woTbvPENqFlu3RmzkyGogp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01

From: Anshumali Gaur <agaur@marvell.com>

Added PCIe FLR interrupt handler for VFs. When FLR is triggered for VFs,
parent PF gets an interrupt. PF creates a mbox message and sends it to
RVU Admin function (AF). AF cleans up all the resources attached to that
specific VF and acks the PF that FLR is handled.

Signed-off-by: Anshumali Gaur <agaur@marvell.com>
Signed-off-by: George Cherian <gcherian@marvell.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/soc/marvell/rvu_gen_pf/gen_pf.c | 232 +++++++++++++++++++++++-
 drivers/soc/marvell/rvu_gen_pf/gen_pf.h |   7 +
 2 files changed, 238 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/marvell/rvu_gen_pf/gen_pf.c b/drivers/soc/marvell/rvu_gen_pf/gen_pf.c
index d7f96b9994cb..4f147cd0d43b 100644
--- a/drivers/soc/marvell/rvu_gen_pf/gen_pf.c
+++ b/drivers/soc/marvell/rvu_gen_pf/gen_pf.c
@@ -621,6 +621,15 @@ static void rvu_gen_pf_queue_vf_work(struct mbox *mw, struct workqueue_struct *m
 	}
 }
 
+static void rvu_gen_pf_flr_wq_destroy(struct gen_pf_dev *pfdev)
+{
+	if (!pfdev->flr_wq)
+		return;
+	destroy_workqueue(pfdev->flr_wq);
+	pfdev->flr_wq = NULL;
+	devm_kfree(pfdev->dev, pfdev->flr_wrk);
+}
+
 static irqreturn_t rvu_gen_pf_pfvf_mbox_intr_handler(int irq, void *pf_irq)
 {
 	struct gen_pf_dev *pfdev = (struct gen_pf_dev *)(pf_irq);
@@ -694,6 +703,211 @@ static int rvu_gen_pf_register_pfvf_mbox_intr(struct gen_pf_dev *pfdev, int numv
 	return 0;
 }
 
+static void rvu_gen_pf_flr_handler(struct work_struct *work)
+{
+	struct flr_work *flrwork = container_of(work, struct flr_work, work);
+	struct gen_pf_dev *pfdev = flrwork->pfdev;
+	struct mbox *mbox = &pfdev->mbox;
+	struct msg_req *req;
+	int vf, reg = 0;
+
+	vf = flrwork - pfdev->flr_wrk;
+
+	mutex_lock(&mbox->lock);
+	req = gen_pf_mbox_alloc_msg_vf_flr(mbox);
+	if (!req) {
+		mutex_unlock(&mbox->lock);
+		return;
+	}
+	req->hdr.pcifunc &= ~RVU_PFVF_FUNC_MASK;
+	req->hdr.pcifunc |= (vf + 1) & RVU_PFVF_FUNC_MASK;
+
+	if (!rvu_gen_pf_sync_mbox_msg(&pfdev->mbox)) {
+		if (vf >= 64) {
+			reg = 1;
+			vf = vf - 64;
+		}
+		/* clear transcation pending bit */
+		writeq(BIT_ULL(vf), pfdev->reg_base + RVU_PF_VFTRPENDX(reg));
+		writeq(BIT_ULL(vf), pfdev->reg_base + RVU_PF_VFFLR_INT_ENA_W1SX(reg));
+	}
+
+	mutex_unlock(&mbox->lock);
+}
+
+static irqreturn_t rvu_gen_pf_me_intr_handler(int irq, void *pf_irq)
+{
+	struct gen_pf_dev *pfdev = (struct gen_pf_dev *)pf_irq;
+	int vf, reg, num_reg = 1;
+	u64 intr;
+
+	if (pfdev->total_vfs > 64)
+		num_reg = 2;
+
+	for (reg = 0; reg < num_reg; reg++) {
+		intr = readq(pfdev->reg_base + RVU_PF_VFME_INTX(reg));
+		if (!intr)
+			continue;
+		for (vf = 0; vf < 64; vf++) {
+			if (!(intr & BIT_ULL(vf)))
+				continue;
+			/* clear trpend bit */
+			writeq(BIT_ULL(vf), pfdev->reg_base + RVU_PF_VFTRPENDX(reg));
+			/* clear interrupt */
+			writeq(BIT_ULL(vf), pfdev->reg_base + RVU_PF_VFME_INTX(reg));
+		}
+	}
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t rvu_gen_pf_flr_intr_handler(int irq, void *pf_irq)
+{
+	struct gen_pf_dev *pfdev = (struct gen_pf_dev *)pf_irq;
+	int reg, dev, vf, start_vf, num_reg = 1;
+	u64 intr;
+
+	if (pfdev->total_vfs > 64)
+		num_reg = 2;
+
+	for (reg = 0; reg < num_reg; reg++) {
+		intr = readq(pfdev->reg_base + RVU_PF_VFFLR_INTX(reg));
+		if (!intr)
+			continue;
+		start_vf = 64 * reg;
+		for (vf = 0; vf < 64; vf++) {
+			if (!(intr & BIT_ULL(vf)))
+				continue;
+			dev = vf + start_vf;
+			queue_work(pfdev->flr_wq, &pfdev->flr_wrk[dev].work);
+			/* Clear interrupt */
+			writeq(BIT_ULL(vf), pfdev->reg_base + RVU_PF_VFFLR_INTX(reg));
+			/* Disable the interrupt */
+			writeq(BIT_ULL(vf), pfdev->reg_base + RVU_PF_VFFLR_INT_ENA_W1CX(reg));
+		}
+	}
+	return IRQ_HANDLED;
+}
+
+static int rvu_gen_pf_register_flr_me_intr(struct gen_pf_dev *pfdev, int numvfs)
+{
+	char *irq_name;
+	int ret;
+
+	/* Register ME interrupt handler*/
+	irq_name = &pfdev->irq_name[RVU_PF_INT_VEC_VFME0 * NAME_SIZE];
+	snprintf(irq_name, NAME_SIZE, "Generic RVUPF%d_ME0", rvu_get_pf(pfdev->pcifunc));
+	ret = request_irq(pci_irq_vector(pfdev->pdev, RVU_PF_INT_VEC_VFME0),
+			  rvu_gen_pf_me_intr_handler, 0, irq_name, pfdev);
+
+	if (ret) {
+		dev_err(pfdev->dev,
+			"Generic RVUPF: IRQ registration failed for ME0\n");
+	}
+
+	/* Register FLR interrupt handler */
+	irq_name = &pfdev->irq_name[RVU_PF_INT_VEC_VFFLR0 * NAME_SIZE];
+	snprintf(irq_name, NAME_SIZE, "Generic RVUPF%d_FLR0", rvu_get_pf(pfdev->pcifunc));
+	ret = request_irq(pci_irq_vector(pfdev->pdev, RVU_PF_INT_VEC_VFFLR0),
+			  rvu_gen_pf_flr_intr_handler, 0, irq_name, pfdev);
+	if (ret) {
+		dev_err(pfdev->dev,
+			"Generic RVUPF: IRQ registration failed for FLR0\n");
+		return ret;
+	}
+
+	if (numvfs > 64) {
+		irq_name = &pfdev->irq_name[RVU_PF_INT_VEC_VFME1 * NAME_SIZE];
+		snprintf(irq_name, NAME_SIZE, "Generic RVUPF%d_ME1",
+			 rvu_get_pf(pfdev->pcifunc));
+		ret = request_irq(pci_irq_vector
+				  (pfdev->pdev, RVU_PF_INT_VEC_VFME1),
+				  rvu_gen_pf_me_intr_handler, 0, irq_name, pfdev);
+		if (ret) {
+			dev_err(pfdev->dev,
+				"Generic RVUPF: IRQ registration failed for ME1\n");
+		}
+		irq_name = &pfdev->irq_name[RVU_PF_INT_VEC_VFFLR1 * NAME_SIZE];
+		snprintf(irq_name, NAME_SIZE, "Generic RVUPF%d_FLR1",
+			 rvu_get_pf(pfdev->pcifunc));
+		ret = request_irq(pci_irq_vector
+				(pfdev->pdev, RVU_PF_INT_VEC_VFFLR1),
+				rvu_gen_pf_flr_intr_handler, 0, irq_name, pfdev);
+		if (ret) {
+			dev_err(pfdev->dev,
+				"Generic RVUPF: IRQ registration failed for FLR1\n");
+			return ret;
+		}
+	}
+
+	/* Enable ME interrupt for all VFs*/
+	writeq(INTR_MASK(numvfs), pfdev->reg_base + RVU_PF_VFME_INTX(0));
+	writeq(INTR_MASK(numvfs), pfdev->reg_base + RVU_PF_VFME_INT_ENA_W1SX(0));
+
+	/* Enable FLR interrupt for all VFs*/
+	writeq(INTR_MASK(numvfs), pfdev->reg_base + RVU_PF_VFFLR_INTX(0));
+	writeq(INTR_MASK(numvfs), pfdev->reg_base + RVU_PF_VFFLR_INT_ENA_W1SX(0));
+
+	if (numvfs > 64) {
+		numvfs -= 64;
+
+		writeq(INTR_MASK(numvfs), pfdev->reg_base + RVU_PF_VFME_INTX(1));
+		writeq(INTR_MASK(numvfs), pfdev->reg_base + RVU_PF_VFME_INT_ENA_W1SX(1));
+
+		writeq(INTR_MASK(numvfs), pfdev->reg_base + RVU_PF_VFFLR_INTX(1));
+		writeq(INTR_MASK(numvfs), pfdev->reg_base + RVU_PF_VFFLR_INT_ENA_W1SX(1));
+	}
+	return 0;
+}
+
+static void rvu_gen_pf_disable_flr_me_intr(struct gen_pf_dev *pfdev)
+{
+	int irq, vfs = pfdev->total_vfs;
+
+	/* Disable VFs ME interrupts */
+	writeq(INTR_MASK(vfs), pfdev->reg_base + RVU_PF_VFME_INT_ENA_W1CX(0));
+	irq = pci_irq_vector(pfdev->pdev, RVU_PF_INT_VEC_VFME0);
+	free_irq(irq, pfdev);
+
+	/* Disable VFs FLR interrupts */
+	writeq(INTR_MASK(vfs), pfdev->reg_base + RVU_PF_VFFLR_INT_ENA_W1CX(0));
+	irq = pci_irq_vector(pfdev->pdev, RVU_PF_INT_VEC_VFFLR0);
+	free_irq(irq, pfdev);
+
+	if (vfs <= 64)
+		return;
+
+	writeq(INTR_MASK(vfs - 64), pfdev->reg_base + RVU_PF_VFME_INT_ENA_W1CX(1));
+	irq = pci_irq_vector(pfdev->pdev, RVU_PF_INT_VEC_VFME1);
+	free_irq(irq, pfdev);
+
+	writeq(INTR_MASK(vfs - 64), pfdev->reg_base + RVU_PF_VFFLR_INT_ENA_W1CX(1));
+	irq = pci_irq_vector(pfdev->pdev, RVU_PF_INT_VEC_VFFLR1);
+	free_irq(irq, pfdev);
+}
+
+static int rvu_gen_pf_flr_init(struct gen_pf_dev *pfdev, int num_vfs)
+{
+	int vf;
+
+	pfdev->flr_wq = alloc_ordered_workqueue("otx2_pf_flr_wq", WQ_HIGHPRI);
+	if (!pfdev->flr_wq)
+		return -ENOMEM;
+
+	pfdev->flr_wrk = devm_kcalloc(pfdev->dev, num_vfs,
+				      sizeof(struct flr_work), GFP_KERNEL);
+	if (!pfdev->flr_wrk) {
+		destroy_workqueue(pfdev->flr_wq);
+		return -ENOMEM;
+	}
+
+	for (vf = 0; vf < num_vfs; vf++) {
+		pfdev->flr_wrk[vf].pfdev = pfdev;
+		INIT_WORK(&pfdev->flr_wrk[vf].work, rvu_gen_pf_flr_handler);
+	}
+
+	return 0;
+}
+
 static int rvu_gen_pf_sriov_enable(struct pci_dev *pdev, int numvfs)
 {
 	struct gen_pf_dev *pfdev = pci_get_drvdata(pdev);
@@ -708,11 +922,25 @@ static int rvu_gen_pf_sriov_enable(struct pci_dev *pdev, int numvfs)
 	if (ret)
 		goto free_mbox;
 
+	ret = rvu_gen_pf_flr_init(pfdev, numvfs);
+	if (ret)
+		goto free_intr;
+
+	ret = rvu_gen_pf_register_flr_me_intr(pfdev, numvfs);
+	if (ret)
+		goto free_flr;
+
 	ret = pci_enable_sriov(pdev, numvfs);
 	if (ret)
-		return ret;
+		goto free_flr_intr;
 
 	return numvfs;
+free_flr_intr:
+	rvu_gen_pf_disable_flr_me_intr(pfdev);
+free_flr:
+	rvu_gen_pf_flr_wq_destroy(pfdev);
+free_intr:
+	rvu_gen_pf_disable_pfvf_mbox_intr(pfdev, numvfs);
 free_mbox:
 	rvu_gen_pf_pfvf_mbox_destroy(pfdev);
 	return ret;
@@ -728,6 +956,8 @@ static int rvu_gen_pf_sriov_disable(struct pci_dev *pdev)
 
 	pci_disable_sriov(pdev);
 
+	rvu_gen_pf_disable_flr_me_intr(pfdev);
+	rvu_gen_pf_flr_wq_destroy(pfdev);
 	rvu_gen_pf_disable_pfvf_mbox_intr(pfdev, numvfs);
 	rvu_gen_pf_pfvf_mbox_destroy(pfdev);
 
diff --git a/drivers/soc/marvell/rvu_gen_pf/gen_pf.h b/drivers/soc/marvell/rvu_gen_pf/gen_pf.h
index ad651b97b661..7aacb84df07a 100644
--- a/drivers/soc/marvell/rvu_gen_pf/gen_pf.h
+++ b/drivers/soc/marvell/rvu_gen_pf/gen_pf.h
@@ -16,6 +16,11 @@
 
 struct gen_pf_dev;
 
+struct flr_work {
+	struct work_struct work;
+	struct gen_pf_dev *pfdev;
+};
+
 struct mbox {
 	struct otx2_mbox	mbox;
 	struct work_struct	mbox_wrk;
@@ -33,6 +38,8 @@ struct gen_pf_dev {
 	struct device		*dev;
 	void __iomem		*reg_base;
 	char			*irq_name;
+	struct workqueue_struct *flr_wq;
+	struct flr_work		*flr_wrk;
 	struct work_struct	mbox_wrk;
 	struct work_struct	mbox_wrk_up;
 
-- 
2.34.1

