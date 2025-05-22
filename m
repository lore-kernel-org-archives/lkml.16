Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6201993B9
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892710; cv=none; b=L7euFRApdC1DtmlMNHEEmxsMDxgjLazUvy8Ad8l/MGDCySj72mfzwV1Sgr8VYs+Vm3Xfyj0J/vBATlDCwMFsAV8NmByDDT8s1zjxPttqyMW6Kzd59qZ4LFpSSwieMxzKzP7Vc8m6F9NFCIZQjM5lF65YbmTUh2QIcEyRUfAxW1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892710; c=relaxed/simple;
	bh=Nwjn3MXj3E+CC5a+T4MfkZ9QJgLXAQI32waAIWrDL44=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sUmZJlhA0hMV1z/f1z26TymddoCWlNtZEOUjH1vxn9Yaf3+tY2//Iv1GNP9qxLO9x6xudKyYf8ryvaG5TEeAu/61upO4RnVCRD2hwfTqepzB0t16gc9MBocp9Uul88o7tMku3MIQLE3XsMCbNiJFqn9l55k+Cd/tjhrVp3yQtFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=JJzKlaQw; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="JJzKlaQw"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M0H9Ii018805;
	Wed, 21 May 2025 22:44:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=I
	7w3K2LTowUITLEg84pFbQH0qRaB1re8Rok62FYBrUs=; b=JJzKlaQwPXPTEen7d
	SW5q/cjbFuS9r5KJd62vVhPH26Lo930IqND6T/rwzSIR7+wdpOutmaXXpjIHEJmx
	cHQRovXsc4hBIXjW8aEWLIF8nD1Sau4xPzyDwAxYszO4hW0lhZM5MLdAQfUrSTG5
	4qatn1X7hMRm2r6OykOUyMuX9UAj9gPsVNZ7VRB+8ireyw8UFezdViHyf50JfYQt
	NhUQ3TSN4YhBHK+e2ad5VWYbKRYt38FjanCVYcnJafh4G9VIDjD3r0aykBCpGazo
	BifuOPPPMkBZpwRgltMWmY6uTgMEMQDL9tBkVrW2j+9JbgWaCuboRTpdTw6OeAfV
	v0UFA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 46sqap8nyb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:44:46 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 21 May 2025 22:44:45 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 21 May 2025 22:44:45 -0700
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id 0DFC75B694A;
	Wed, 21 May 2025 22:44:45 -0700 (PDT)
From: George Cherian <george.cherian@marvell.com>
To: <arnd@arndb.de>, <alexander.sverdlin@gmail.com>, <agaur@marvell.com>,
        <nikita.shubin@maquefel.me>, <vkoul@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <gcherian@marvell.com>
Subject: [PATCH v6 3/4] soc: marvell: rvu-pf: Add mailbox communication btw RVU VFs and PF.
Date: Thu, 22 May 2025 05:44:43 +0000
Message-ID: <20250522054444.3531124-4-george.cherian@marvell.com>
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
X-Proofpoint-GUID: SXFaJLuTSf1x4k3t5aIUD4pKmSkI6Ssg
X-Authority-Analysis: v=2.4 cv=HfgUTjE8 c=1 sm=1 tr=0 ts=682eb9ce cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=dt9VzEwgFbYA:10 a=M5GUcnROAAAA:8 a=pGLkceISAAAA:8 a=rdbOFzbLXYbVr61zThgA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: SXFaJLuTSf1x4k3t5aIUD4pKmSkI6Ssg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA1NiBTYWx0ZWRfX2stQT1skBGJZ p2E0Tjoim+bRg0ENvrxbHpBz06ZXwIXqaIKdkktzbRhPhFXD6aTOmJPi4i6ei5I/+IySX1juA80 hw1lhDapwYKn1KcnkBCJaK9SiYF/w4UMpZ4/Nous0cVz0YHWGOxL+gzBftIq/xVm+fYQvo8oqPg
 jHYhP5sVmATS1y1AcoBeYHLROjed/RoxBMeRddDolFVO4Ntl/PrbqQht3u1PqJoeUhlVxpWdw8T rc23wSje7vf+8b9HBmRWMdmixDacTB5CQh1ArNuZFlAL6+rdCe7/U3aNhCe2cPunIleVNj5nFwe brZJNsYNL5yiIeeN1UQglnv6maGztgsnpEKBTPAbZ8oOR77kKh3FCZA9SmhYP26cyuHVMwvd8Rx
 4LhsH3cKTvf5zZB25e9t84QSaAJrF+4Hn6ekivCKXvRCMK9NuHqCR5Bg1enGHoYg1V+gMYgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01

From: Anshumali Gaur <agaur@marvell.com>

RVU PF shares a dedicated memory region with each of it's VFs.
This memory region is used to establish communication between them.
Since Admin function (AF) handles resource management, PF doesn't
process the messages sent by VFs. It acts as an intermediary device
process the messages sent by VFs. It acts as an intermediary device.
Hardware doesn't support direct communication between AF and VFs.

Signed-off-by: Anshumali Gaur <agaur@marvell.com>
Signed-off-by: George Cherian <gcherian@marvell.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/soc/marvell/rvu_gen_pf/gen_pf.c | 437 ++++++++++++++++++++++++
 drivers/soc/marvell/rvu_gen_pf/gen_pf.h |   2 +
 2 files changed, 439 insertions(+)

diff --git a/drivers/soc/marvell/rvu_gen_pf/gen_pf.c b/drivers/soc/marvell/rvu_gen_pf/gen_pf.c
index a03fc3f16c69..d7f96b9994cb 100644
--- a/drivers/soc/marvell/rvu_gen_pf/gen_pf.c
+++ b/drivers/soc/marvell/rvu_gen_pf/gen_pf.c
@@ -50,6 +50,120 @@ static int rvu_gen_pf_check_pf_usable(struct gen_pf_dev *pfdev)
 	return 0;
 }
 
+static void rvu_gen_pf_forward_msg_pfvf(struct otx2_mbox_dev *mdev,
+					struct otx2_mbox *pfvf_mbox, void *bbuf_base,
+					int devid)
+{
+	struct otx2_mbox_dev *src_mdev = mdev;
+	int offset;
+
+	/* Msgs are already copied, trigger VF's mbox irq */
+	smp_wmb();
+
+	otx2_mbox_wait_for_zero(pfvf_mbox, devid);
+	offset = pfvf_mbox->trigger | (devid << pfvf_mbox->tr_shift);
+	writeq(MBOX_DOWN_MSG, (void __iomem *)pfvf_mbox->reg_base + offset);
+
+	/* Restore VF's mbox bounce buffer region address */
+	src_mdev->mbase = bbuf_base;
+}
+
+static int rvu_gen_pf_forward_vf_mbox_msgs(struct gen_pf_dev *pfdev,
+					   struct otx2_mbox *src_mbox,
+					   int dir, int vf, int num_msgs)
+{
+	struct otx2_mbox_dev *src_mdev, *dst_mdev;
+	struct mbox_hdr *mbox_hdr;
+	struct mbox_hdr *req_hdr;
+	struct mbox *dst_mbox;
+	int dst_size, err;
+
+	if (dir == MBOX_DIR_PFAF) {
+		/*
+		 * Set VF's mailbox memory as PF's bounce buffer memory, so
+		 * that explicit copying of VF's msgs to PF=>AF mbox region
+		 * and AF=>PF responses to VF's mbox region can be avoided.
+		 */
+		src_mdev = &src_mbox->dev[vf];
+		mbox_hdr = src_mbox->hwbase +
+				src_mbox->rx_start + (vf * MBOX_SIZE);
+
+		dst_mbox = &pfdev->mbox;
+		dst_size = dst_mbox->mbox.tx_size -
+				ALIGN(sizeof(*mbox_hdr), MBOX_MSG_ALIGN);
+		/* Check if msgs fit into destination area and has valid size */
+		if (mbox_hdr->msg_size > dst_size || !mbox_hdr->msg_size)
+			return -EINVAL;
+
+		dst_mdev = &dst_mbox->mbox.dev[0];
+
+		mutex_lock(&pfdev->mbox.lock);
+		dst_mdev->mbase = src_mdev->mbase;
+		dst_mdev->msg_size = mbox_hdr->msg_size;
+		dst_mdev->num_msgs = num_msgs;
+		err = rvu_gen_pf_sync_mbox_msg(dst_mbox);
+		/*
+		 * Error code -EIO indicate there is a communication failure
+		 * to the AF. Rest of the error codes indicate that AF processed
+		 * VF messages and set the error codes in response messages
+		 * (if any) so simply forward responses to VF.
+		 */
+		if (err == -EIO) {
+			dev_warn(pfdev->dev,
+				 "AF not responding to VF%d messages\n", vf);
+			/* restore PF mbase and exit */
+			dst_mdev->mbase = pfdev->mbox.bbuf_base;
+			mutex_unlock(&pfdev->mbox.lock);
+			return err;
+		}
+		/*
+		 * At this point, all the VF messages sent to AF are acked
+		 * with proper responses and responses are copied to VF
+		 * mailbox hence raise interrupt to VF.
+		 */
+		req_hdr = (struct mbox_hdr *)(dst_mdev->mbase +
+					      dst_mbox->mbox.rx_start);
+		req_hdr->num_msgs = num_msgs;
+
+		rvu_gen_pf_forward_msg_pfvf(dst_mdev, &pfdev->mbox_pfvf[0].mbox,
+					    pfdev->mbox.bbuf_base, vf);
+		mutex_unlock(&pfdev->mbox.lock);
+	} else if (dir == MBOX_DIR_PFVF_UP) {
+		src_mdev = &src_mbox->dev[0];
+		mbox_hdr = src_mbox->hwbase + src_mbox->rx_start;
+		req_hdr = (struct mbox_hdr *)(src_mdev->mbase +
+					      src_mbox->rx_start);
+		req_hdr->num_msgs = num_msgs;
+
+		dst_mbox = &pfdev->mbox_pfvf[0];
+		dst_size = dst_mbox->mbox_up.tx_size -
+				ALIGN(sizeof(*mbox_hdr), MBOX_MSG_ALIGN);
+		/* Check if msgs fit into destination area */
+		if (mbox_hdr->msg_size > dst_size)
+			return -EINVAL;
+		dst_mdev = &dst_mbox->mbox_up.dev[vf];
+		dst_mdev->mbase = src_mdev->mbase;
+		dst_mdev->msg_size = mbox_hdr->msg_size;
+		dst_mdev->num_msgs = mbox_hdr->num_msgs;
+		err = rvu_gen_pf_sync_mbox_up_msg(dst_mbox, vf);
+		if (err) {
+			dev_warn(pfdev->dev,
+				 "VF%d is not responding to mailbox\n", vf);
+			return err;
+		}
+	} else if (dir == MBOX_DIR_VFPF_UP) {
+		req_hdr = (struct mbox_hdr *)(src_mbox->dev[0].mbase +
+					      src_mbox->rx_start);
+		req_hdr->num_msgs = num_msgs;
+		rvu_gen_pf_forward_msg_pfvf(&pfdev->mbox_pfvf->mbox_up.dev[vf],
+					    &pfdev->mbox.mbox_up,
+					    pfdev->mbox_pfvf[vf].bbuf_base,
+					    0);
+	}
+
+	return 0;
+}
+
 static irqreturn_t rvu_gen_pf_pfaf_mbox_intr_handler(int irq, void *pf_irq)
 {
 	struct gen_pf_dev *pfdev = (struct gen_pf_dev *)pf_irq;
@@ -192,6 +306,39 @@ static void rvu_gen_pf_process_pfaf_mbox_msg(struct gen_pf_dev *pfdev,
 	}
 }
 
+static void rvu_gen_pf_pfaf_mbox_up_handler(struct work_struct *work)
+{
+	struct mbox *af_mbox = container_of(work, struct mbox, mbox_up_wrk);
+	struct otx2_mbox *mbox = &af_mbox->mbox_up;
+	struct otx2_mbox_dev *mdev = &mbox->dev[0];
+	struct gen_pf_dev *pfdev = af_mbox->pfvf;
+	int offset, id, devid = 0;
+	struct mbox_hdr *rsp_hdr;
+	struct mbox_msghdr *msg;
+	u16 num_msgs;
+
+	rsp_hdr = (struct mbox_hdr *)(mdev->mbase + mbox->rx_start);
+	num_msgs = rsp_hdr->num_msgs;
+
+	offset = mbox->rx_start + ALIGN(sizeof(*rsp_hdr), MBOX_MSG_ALIGN);
+
+	for (id = 0; id < num_msgs; id++) {
+		msg = (struct mbox_msghdr *)(mdev->mbase + offset);
+
+		devid = msg->pcifunc & RVU_PFVF_FUNC_MASK;
+		offset = mbox->rx_start + msg->next_msgoff;
+	}
+	/* Forward to VF iff VFs are really present */
+	if (devid && pci_num_vf(pfdev->pdev)) {
+		rvu_gen_pf_forward_vf_mbox_msgs(pfdev, &pfdev->mbox.mbox_up,
+						MBOX_DIR_PFVF_UP, devid - 1,
+						num_msgs);
+		return;
+	}
+
+	otx2_mbox_msg_send(mbox, 0);
+}
+
 static void rvu_gen_pf_pfaf_mbox_handler(struct work_struct *work)
 {
 	struct otx2_mbox_dev *mdev;
@@ -266,6 +413,7 @@ static int rvu_gen_pf_pfaf_mbox_init(struct gen_pf_dev *pfdev)
 		goto exit;
 
 	INIT_WORK(&mbox->mbox_wrk, rvu_gen_pf_pfaf_mbox_handler);
+	INIT_WORK(&mbox->mbox_up_wrk, rvu_gen_pf_pfaf_mbox_up_handler);
 	mutex_init(&mbox->lock);
 
 	return 0;
@@ -274,19 +422,305 @@ static int rvu_gen_pf_pfaf_mbox_init(struct gen_pf_dev *pfdev)
 	return err;
 }
 
+static void rvu_gen_pf_pfvf_mbox_handler(struct work_struct *work)
+{
+	struct mbox_msghdr *msg = NULL;
+	int offset, vf_idx, id, err;
+	struct otx2_mbox_dev *mdev;
+	struct gen_pf_dev *pfdev;
+	struct mbox_hdr *req_hdr;
+	struct otx2_mbox *mbox;
+	struct mbox *vf_mbox;
+
+	vf_mbox = container_of(work, struct mbox, mbox_wrk);
+	pfdev = vf_mbox->pfvf;
+	vf_idx = vf_mbox - pfdev->mbox_pfvf;
+
+	mbox = &pfdev->mbox_pfvf[0].mbox;
+	mdev = &mbox->dev[vf_idx];
+	req_hdr = (struct mbox_hdr *)(mdev->mbase + mbox->rx_start);
+
+	offset = ALIGN(sizeof(*req_hdr), MBOX_MSG_ALIGN);
+
+	for (id = 0; id < vf_mbox->num_msgs; id++) {
+		msg = (struct mbox_msghdr *)(mdev->mbase + mbox->rx_start +
+					     offset);
+
+		if (msg->sig != OTX2_MBOX_REQ_SIG)
+			goto inval_msg;
+
+		/* Set VF's number in each of the msg */
+		msg->pcifunc &= ~RVU_PFVF_FUNC_MASK;
+		msg->pcifunc |= (vf_idx + 1) & RVU_PFVF_FUNC_MASK;
+		offset = msg->next_msgoff;
+	}
+	err = rvu_gen_pf_forward_vf_mbox_msgs(pfdev, mbox, MBOX_DIR_PFAF, vf_idx,
+					      vf_mbox->num_msgs);
+	if (err)
+		goto inval_msg;
+	return;
+
+inval_msg:
+	if (!msg)
+		return;
+
+	otx2_reply_invalid_msg(mbox, vf_idx, 0, msg->id);
+	otx2_mbox_msg_send(mbox, vf_idx);
+}
+
+static int rvu_gen_pf_pfvf_mbox_init(struct gen_pf_dev *pfdev, int numvfs)
+{
+	void __iomem *hwbase;
+	struct mbox *mbox;
+	int err, vf;
+	u64 base;
+
+	if (!numvfs)
+		return -EINVAL;
+
+	pfdev->mbox_pfvf = devm_kcalloc(&pfdev->pdev->dev, numvfs,
+					sizeof(struct mbox), GFP_KERNEL);
+
+	if (!pfdev->mbox_pfvf)
+		return -ENOMEM;
+
+	pfdev->mbox_pfvf_wq = alloc_workqueue("otx2_pfvf_mailbox",
+					      WQ_UNBOUND | WQ_HIGHPRI |
+					      WQ_MEM_RECLAIM, 0);
+	if (!pfdev->mbox_pfvf_wq)
+		return -ENOMEM;
+
+	/*
+	 * PF <-> VF mailbox region follows after
+	 * PF <-> AF mailbox region.
+	 */
+	base = pci_resource_start(pfdev->pdev, PCI_MBOX_BAR_NUM) + MBOX_SIZE;
+
+	hwbase = ioremap_wc(base, MBOX_SIZE * pfdev->total_vfs);
+	if (!hwbase) {
+		err = -ENOMEM;
+		goto free_wq;
+	}
+
+	mbox = &pfdev->mbox_pfvf[0];
+	err = otx2_mbox_init(&mbox->mbox, hwbase, pfdev->pdev, pfdev->reg_base,
+			     MBOX_DIR_PFVF, numvfs);
+	if (err)
+		goto free_iomem;
+
+	err = otx2_mbox_init(&mbox->mbox_up, hwbase, pfdev->pdev, pfdev->reg_base,
+			     MBOX_DIR_PFVF_UP, numvfs);
+	if (err)
+		goto free_iomem;
+
+	for (vf = 0; vf < numvfs; vf++) {
+		mbox->pfvf = pfdev;
+		INIT_WORK(&mbox->mbox_wrk, rvu_gen_pf_pfvf_mbox_handler);
+		mbox++;
+	}
+
+	return 0;
+
+free_iomem:
+	if (hwbase)
+		iounmap(hwbase);
+free_wq:
+	destroy_workqueue(pfdev->mbox_pfvf_wq);
+	return err;
+}
+
+static void rvu_gen_pf_pfvf_mbox_destroy(struct gen_pf_dev *pfdev)
+{
+	struct mbox *mbox = &pfdev->mbox_pfvf[0];
+
+	if (!mbox)
+		return;
+
+	if (pfdev->mbox_pfvf_wq) {
+		destroy_workqueue(pfdev->mbox_pfvf_wq);
+		pfdev->mbox_pfvf_wq = NULL;
+	}
+
+	if (mbox->mbox.hwbase)
+		iounmap((void __iomem *)mbox->mbox.hwbase);
+
+	otx2_mbox_destroy(&mbox->mbox);
+}
+
+static void rvu_gen_pf_enable_pfvf_mbox_intr(struct gen_pf_dev *pfdev, int numvfs)
+{
+	/* Clear PF <=> VF mailbox IRQ */
+	writeq(~0ull, pfdev->reg_base + RVU_PF_VFPF_MBOX_INTX(0));
+	writeq(~0ull, pfdev->reg_base + RVU_PF_VFPF_MBOX_INTX(1));
+
+	/* Enable PF <=> VF mailbox IRQ */
+	writeq(INTR_MASK(numvfs), pfdev->reg_base + RVU_PF_VFPF_MBOX_INT_ENA_W1SX(0));
+	if (numvfs > 64) {
+		numvfs -= 64;
+		writeq(INTR_MASK(numvfs), pfdev->reg_base + RVU_PF_VFPF_MBOX_INT_ENA_W1SX(1));
+	}
+}
+
+static void rvu_gen_pf_disable_pfvf_mbox_intr(struct gen_pf_dev *pfdev, int numvfs)
+{
+	int vector;
+
+	/* Disable PF <=> VF mailbox IRQ */
+	writeq(~0ull, pfdev->reg_base + RVU_PF_VFPF_MBOX_INT_ENA_W1CX(0));
+	writeq(~0ull, pfdev->reg_base + RVU_PF_VFPF_MBOX_INT_ENA_W1CX(1));
+
+	writeq(~0ull, pfdev->reg_base + RVU_PF_VFPF_MBOX_INTX(0));
+	vector = pci_irq_vector(pfdev->pdev, RVU_PF_INT_VEC_VFPF_MBOX0);
+	free_irq(vector, pfdev);
+
+	if (numvfs > 64) {
+		writeq(~0ull, pfdev->reg_base + RVU_PF_VFPF_MBOX_INTX(1));
+		vector = pci_irq_vector(pfdev->pdev, RVU_PF_INT_VEC_VFPF_MBOX1);
+		free_irq(vector, pfdev);
+	}
+}
+
+static void rvu_gen_pf_queue_vf_work(struct mbox *mw, struct workqueue_struct *mbox_wq,
+				     int first, int mdevs, u64 intr)
+{
+	struct otx2_mbox_dev *mdev;
+	struct otx2_mbox *mbox;
+	struct mbox_hdr *hdr;
+	int i;
+
+	for (i = first; i < mdevs; i++) {
+		/* start from 0 */
+		if (!(intr & BIT_ULL(i - first)))
+			continue;
+
+		mbox = &mw->mbox;
+		mdev = &mbox->dev[i];
+		hdr = mdev->mbase + mbox->rx_start;
+		/*
+		 * The hdr->num_msgs is set to zero immediately in the interrupt
+		 * handler to ensure that it holds a correct value next time
+		 * when the interrupt handler is called. pf->mw[i].num_msgs
+		 * holds the data for use in otx2_pfvf_mbox_handler and
+		 * pf->mw[i].up_num_msgs holds the data for use in
+		 * otx2_pfvf_mbox_up_handler.
+		 */
+		if (hdr->num_msgs) {
+			mw[i].num_msgs = hdr->num_msgs;
+			hdr->num_msgs = 0;
+			queue_work(mbox_wq, &mw[i].mbox_wrk);
+		}
+
+		mbox = &mw->mbox_up;
+		mdev = &mbox->dev[i];
+		hdr = mdev->mbase + mbox->rx_start;
+		if (hdr->num_msgs) {
+			mw[i].up_num_msgs = hdr->num_msgs;
+			hdr->num_msgs = 0;
+			queue_work(mbox_wq, &mw[i].mbox_up_wrk);
+		}
+	}
+}
+
+static irqreturn_t rvu_gen_pf_pfvf_mbox_intr_handler(int irq, void *pf_irq)
+{
+	struct gen_pf_dev *pfdev = (struct gen_pf_dev *)(pf_irq);
+	int vfs = pfdev->total_vfs;
+	struct mbox *mbox;
+	u64 intr;
+
+	mbox = pfdev->mbox_pfvf;
+	/* Handle VF interrupts */
+	if (vfs > 64) {
+		intr = readq(pfdev->reg_base + RVU_PF_VFPF_MBOX_INTX(1));
+		writeq(intr, pfdev->reg_base + RVU_PF_VFPF_MBOX_INTX(1));
+		rvu_gen_pf_queue_vf_work(mbox, pfdev->mbox_pfvf_wq, 64, vfs, intr);
+		if (intr)
+			trace_otx2_msg_interrupt(mbox->mbox.pdev, "VF(s) to PF", intr);
+		vfs = 64;
+	}
+
+	intr = readq(pfdev->reg_base + RVU_PF_VFPF_MBOX_INTX(0));
+	writeq(intr, pfdev->reg_base + RVU_PF_VFPF_MBOX_INTX(0));
+
+	rvu_gen_pf_queue_vf_work(mbox, pfdev->mbox_pfvf_wq, 0, vfs, intr);
+
+	if (intr)
+		trace_otx2_msg_interrupt(mbox->mbox.pdev, "VF(s) to PF", intr);
+
+	return IRQ_HANDLED;
+}
+
+static int rvu_gen_pf_register_pfvf_mbox_intr(struct gen_pf_dev *pfdev, int numvfs)
+{
+	char *irq_name;
+	int err;
+
+	/* Register MBOX0 interrupt handler */
+	irq_name = &pfdev->irq_name[RVU_PF_INT_VEC_VFPF_MBOX0 * NAME_SIZE];
+	if (pfdev->pcifunc)
+		snprintf(irq_name, NAME_SIZE,
+			 "Generic RVUPF%d_VF Mbox0", rvu_get_pf(pfdev->pcifunc));
+	else
+		snprintf(irq_name, NAME_SIZE, "Generic RVUPF_VF Mbox0");
+	err = request_irq(pci_irq_vector(pfdev->pdev, RVU_PF_INT_VEC_VFPF_MBOX0),
+			  rvu_gen_pf_pfvf_mbox_intr_handler, 0, irq_name, pfdev);
+	if (err) {
+		dev_err(pfdev->dev,
+			"RVUPF: IRQ registration failed for PFVF mbox0 irq\n");
+		return err;
+	}
+
+	if (numvfs > 64) {
+		/* Register MBOX1 interrupt handler */
+		irq_name = &pfdev->irq_name[RVU_PF_INT_VEC_VFPF_MBOX1 * NAME_SIZE];
+		if (pfdev->pcifunc)
+			snprintf(irq_name, NAME_SIZE,
+				 "Generic RVUPF%d_VF Mbox1", rvu_get_pf(pfdev->pcifunc));
+		else
+			snprintf(irq_name, NAME_SIZE, "Generic RVUPF_VF Mbox1");
+		err = request_irq(pci_irq_vector(pfdev->pdev,
+						 RVU_PF_INT_VEC_VFPF_MBOX1),
+						 rvu_gen_pf_pfvf_mbox_intr_handler,
+						 0, irq_name, pfdev);
+		if (err) {
+			dev_err(pfdev->dev,
+				"RVUPF: IRQ registration failed for PFVF mbox1 irq\n");
+			return err;
+		}
+	}
+
+	rvu_gen_pf_enable_pfvf_mbox_intr(pfdev, numvfs);
+
+	return 0;
+}
+
 static int rvu_gen_pf_sriov_enable(struct pci_dev *pdev, int numvfs)
 {
+	struct gen_pf_dev *pfdev = pci_get_drvdata(pdev);
 	int ret;
 
+	/* Init PF <=> VF mailbox stuff */
+	ret = rvu_gen_pf_pfvf_mbox_init(pfdev, numvfs);
+	if (ret)
+		return ret;
+
+	ret = rvu_gen_pf_register_pfvf_mbox_intr(pfdev, numvfs);
+	if (ret)
+		goto free_mbox;
+
 	ret = pci_enable_sriov(pdev, numvfs);
 	if (ret)
 		return ret;
 
 	return numvfs;
+free_mbox:
+	rvu_gen_pf_pfvf_mbox_destroy(pfdev);
+	return ret;
 }
 
 static int rvu_gen_pf_sriov_disable(struct pci_dev *pdev)
 {
+	struct gen_pf_dev *pfdev = pci_get_drvdata(pdev);
 	int numvfs = pci_num_vf(pdev);
 
 	if (!numvfs)
@@ -294,6 +728,9 @@ static int rvu_gen_pf_sriov_disable(struct pci_dev *pdev)
 
 	pci_disable_sriov(pdev);
 
+	rvu_gen_pf_disable_pfvf_mbox_intr(pfdev, numvfs);
+	rvu_gen_pf_pfvf_mbox_destroy(pfdev);
+
 	return 0;
 }
 
diff --git a/drivers/soc/marvell/rvu_gen_pf/gen_pf.h b/drivers/soc/marvell/rvu_gen_pf/gen_pf.h
index 2019bea10ad0..ad651b97b661 100644
--- a/drivers/soc/marvell/rvu_gen_pf/gen_pf.h
+++ b/drivers/soc/marvell/rvu_gen_pf/gen_pf.h
@@ -38,7 +38,9 @@ struct gen_pf_dev {
 
 	/* Mbox */
 	struct mbox		mbox;
+	struct mbox		*mbox_pfvf;
 	struct workqueue_struct *mbox_wq;
+	struct workqueue_struct *mbox_pfvf_wq;
 
 	int			pf;
 	u16			pcifunc; /* RVU PF_FUNC */
-- 
2.34.1

