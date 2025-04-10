Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1834285409
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285288; cv=none; b=TlzyHhHBOvrSo0fS0ptG5H8K1u2ITADVWvhMN40pQJuhcv3e5os5PR0uNACeQnTWZSJB4A1GOh/s5Pq0F1t3sz5HzZY2lHNUkXtNPH7O368aoJ1klqQfoB7ZlnXEaf0PAYi3ImGVSnvz2G0fi4bufVcKVjHAVnvGyLd9RGYTMXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285288; c=relaxed/simple;
	bh=bWfF/z6J6VjDnFu295fwOKQGsLQiUbigzuCMF8Epxkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=brEFf/UA/g0Rbh4LWR4TCWpPDgefEzfsdLMZyynjtjy/9/GKY9zravRGlo/YAClZGm/W2wfWfCgYZqtm/iylqdNODl1yvL0eZi8woJhRivMgM/Tg9DgAIvGnmMOhJpPSpkN1/blTdknddOKAZodvgkEbayVnEIICZ4ghMfFJRYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPiVKglf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPiVKglf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3438FC4CEE3;
	Thu, 10 Apr 2025 11:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744285288;
	bh=bWfF/z6J6VjDnFu295fwOKQGsLQiUbigzuCMF8Epxkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JPiVKglfVo+fyuImYcbulSnJ7vhHV+tBKSfXGj1B0SpwuzPduy5PAe8H9E6JRewjc
	 kCGDaNHa6PCDQFZmHCIBWpNrM8U3na1TqiVFdSNq0FUAV/G2yHgZptx21kAHEuV4Iq
	 g7Q7WXa8Gdt3DoU8EZ5NOGWJrPbZAtC0DZlbbWK7LHO1aKydPOx5dJpiMpEUeUakRv
	 xgV/daa9VIBExMnf6geVP/zgpIZLtxDEacLmwjCPjKgOQl0r9WZbjYmxyfXzhP8kU6
	 bzcTOKTstm+QC0Z6pOdNJ0IAjA2JgStNQRdjXG5X3u84xH/xOhbbXhV0BCfGsaieg5
	 qsgKITGpMWqbw==
From: Daniel Wagner <wagi@kernel.org>
Date: Thu, 10 Apr 2025 13:41:10 +0200
Subject: [PATCH v4 07/14] nvmet-fcloop: access fcpreq only when holding
 reqlock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-nvmet-fcloop-v4-7-7e5c42b7b2cb@kernel.org>
References: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
In-Reply-To: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The abort handling logic expects that the state and the fcpreq are only
accessed when holding the reqlock lock.

While at it, only handle the aborts in the abort handler.

Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index 0c0117e03adc81c643e90a7e7832ff087a4c2fd7..9adaee3c7129f7e270842c5d09f78de2e108479a 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -619,12 +619,13 @@ fcloop_fcp_recv_work(struct work_struct *work)
 {
 	struct fcloop_fcpreq *tfcp_req =
 		container_of(work, struct fcloop_fcpreq, fcp_rcv_work);
-	struct nvmefc_fcp_req *fcpreq = tfcp_req->fcpreq;
+	struct nvmefc_fcp_req *fcpreq;
 	unsigned long flags;
 	int ret = 0;
 	bool aborted = false;
 
 	spin_lock_irqsave(&tfcp_req->reqlock, flags);
+	fcpreq = tfcp_req->fcpreq;
 	switch (tfcp_req->inistate) {
 	case INI_IO_START:
 		tfcp_req->inistate = INI_IO_ACTIVE;
@@ -639,16 +640,19 @@ fcloop_fcp_recv_work(struct work_struct *work)
 	}
 	spin_unlock_irqrestore(&tfcp_req->reqlock, flags);
 
-	if (unlikely(aborted))
-		ret = -ECANCELED;
-	else {
-		if (likely(!check_for_drop(tfcp_req)))
-			ret = nvmet_fc_rcv_fcp_req(tfcp_req->tport->targetport,
-				&tfcp_req->tgt_fcp_req,
-				fcpreq->cmdaddr, fcpreq->cmdlen);
-		else
-			pr_info("%s: dropped command ********\n", __func__);
+	if (unlikely(aborted)) {
+		/* the abort handler will call fcloop_call_host_done */
+		return;
+	}
+
+	if (unlikely(check_for_drop(tfcp_req))) {
+		pr_info("%s: dropped command ********\n", __func__);
+		return;
 	}
+
+	ret = nvmet_fc_rcv_fcp_req(tfcp_req->tport->targetport,
+				   &tfcp_req->tgt_fcp_req,
+				   fcpreq->cmdaddr, fcpreq->cmdlen);
 	if (ret)
 		fcloop_call_host_done(fcpreq, tfcp_req, ret);
 }
@@ -663,9 +667,10 @@ fcloop_fcp_abort_recv_work(struct work_struct *work)
 	unsigned long flags;
 
 	spin_lock_irqsave(&tfcp_req->reqlock, flags);
-	fcpreq = tfcp_req->fcpreq;
 	switch (tfcp_req->inistate) {
 	case INI_IO_ABORTED:
+		fcpreq = tfcp_req->fcpreq;
+		tfcp_req->fcpreq = NULL;
 		break;
 	case INI_IO_COMPLETED:
 		completed = true;
@@ -688,10 +693,6 @@ fcloop_fcp_abort_recv_work(struct work_struct *work)
 		nvmet_fc_rcv_fcp_abort(tfcp_req->tport->targetport,
 					&tfcp_req->tgt_fcp_req);
 
-	spin_lock_irqsave(&tfcp_req->reqlock, flags);
-	tfcp_req->fcpreq = NULL;
-	spin_unlock_irqrestore(&tfcp_req->reqlock, flags);
-
 	fcloop_call_host_done(fcpreq, tfcp_req, -ECANCELED);
 	/* call_host_done releases reference for abort downcall */
 }

-- 
2.49.0

