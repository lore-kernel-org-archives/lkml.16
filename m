Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7E126FDBF
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620617; cv=none; b=cjpyy4ILDdDLn21yR+Wwy7K4nXI36mSiTKI1IkQ8PrjvutU64bVHOt/se7ffsH8AACctz2JSCYkGWtfwnrIbdTwJ5TNVjYG9bTl/2+e+kgkiTWMj3G8jr1UD/P/3LIPLOoxZvg2DqYOqaQ/IoKm8siG9Tkfgaur1FRh8GxI19uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620617; c=relaxed/simple;
	bh=NnHI6Paao3NgdBRHQkL+L4jcP1yEUV4TLY9mPyueH3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLWgJ0aJMM5qRRTUWBZJgUg8oElczavFMo0DAcXif645mi4R8ya13s4ReSlmGccCrX3afsCMhWWUh4XX36pcxPiRgA0ETmghCgQfaiQ4y0LW8fQiQTx6KSyNA3VxN3/4haHcxu053+yErs1TXUHx9K13LA6JWbvu0C7BmTObcYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6DOZW2c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6DOZW2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75013C4CEEB;
	Wed,  7 May 2025 12:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746620616;
	bh=NnHI6Paao3NgdBRHQkL+L4jcP1yEUV4TLY9mPyueH3w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n6DOZW2cHnbY+TUFxGLcw/pa/l/tODURCwyoVFPR+n2ppRlrdgHxMDgVnwC1R4/JJ
	 6OSnM2824oCm9k9ved5kYh918AevGGRVtBDq92zR2pfls45cnUjPSQx1e/s4bBo66V
	 N6tiVQShxVit4PqDDK9pSPBG2JCZvjnwawjsr7l6nmLuK58rC80i0TFMorl98p6BJl
	 fIcbv2SzMUanpX1yWFUQnhKHatibfr1mllGjUDAwfKzmZiPLB0ySn8+3ih+OImHuOJ
	 xiSKIymvYyFTyGsaBecB0Fxn35JOSadGuP4Fg5TFoOr1XHl5Q7Vg5M3arDI9KGx8+g
	 zejm27lZfXwjQ==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 07 May 2025 14:23:08 +0200
Subject: [PATCH v6 12/14] nvmet-fc: free pending reqs on tgtport unregister
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nvmet-fcloop-v6-12-ca02e16fb018@kernel.org>
References: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
In-Reply-To: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

When nvmet_fc_unregister_targetport is called by the LLDD, it's not
possible to communicate with the host, thus all pending request will not
be process. Thus explicitly free them.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fc.c | 41 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 7b50130f10f6578e6e49fe8ea661de34dfbb3683..75ddb7425605dd6623db38a133b63e201592354c 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1580,6 +1580,39 @@ nvmet_fc_delete_ctrl(struct nvmet_ctrl *ctrl)
 	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 }
 
+static void
+nvmet_fc_free_pending_reqs(struct nvmet_fc_tgtport *tgtport)
+{
+	struct nvmet_fc_ls_req_op *lsop;
+	struct nvmefc_ls_req *lsreq;
+	struct nvmet_fc_ls_iod *iod;
+	int i;
+
+	iod = tgtport->iod;
+	for (i = 0; i < NVMET_LS_CTX_COUNT; iod++, i++)
+		cancel_work(&iod->work);
+
+	/*
+	 * After this point the connection is lost and thus any pending
+	 * request can't be processed by the normal completion path. This
+	 * is likely a request from nvmet_fc_send_ls_req_async.
+	 */
+	while ((lsop = list_first_entry_or_null(&tgtport->ls_req_list,
+				struct nvmet_fc_ls_req_op, lsreq_list))) {
+		list_del(&lsop->lsreq_list);
+
+		if (!lsop->req_queued)
+			continue;
+
+		lsreq = &lsop->ls_req;
+		fc_dma_unmap_single(tgtport->dev, lsreq->rqstdma,
+				    (lsreq->rqstlen + lsreq->rsplen),
+				    DMA_BIDIRECTIONAL);
+		nvmet_fc_tgtport_put(tgtport);
+		kfree(lsop);
+	}
+}
+
 /**
  * nvmet_fc_unregister_targetport - transport entry point called by an
  *                              LLDD to deregister/remove a previously
@@ -1608,13 +1641,7 @@ nvmet_fc_unregister_targetport(struct nvmet_fc_target_port *target_port)
 
 	flush_workqueue(nvmet_wq);
 
-	/*
-	 * should terminate LS's as well. However, LS's will be generated
-	 * at the tail end of association termination, so they likely don't
-	 * exist yet. And even if they did, it's worthwhile to just let
-	 * them finish and targetport ref counting will clean things up.
-	 */
-
+	nvmet_fc_free_pending_reqs(tgtport);
 	nvmet_fc_tgtport_put(tgtport);
 
 	return 0;

-- 
2.49.0

