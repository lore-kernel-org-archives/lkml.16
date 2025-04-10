Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E728A41A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285306; cv=none; b=CYuE+ZTYAD4nha0HpMwAHvGUeS1dOGW7+bK435VQdLmu5aF8Z07oWPqrcIfkXgprXdMX1t0C3SYPvelDY9WjS4KabOFT9W1877oaB1rORBttpnTcwJJRRTCWsEPH+7KO4lWosIvo/6tGziOBlHbXtCq//fMsMc5cBgcN0fmC1F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285306; c=relaxed/simple;
	bh=/cLfvZPaGaKqTv5rGWJ2lfAMdaEHdJl7YqBZZkkNksw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s00uIrdHy+4rCb+o43swh3D48TfSygSCbKWROrvtUhUfqrhUULrFvchB3JENQWroytRgbhrOYRIMXRsNSNqjKHSTU64KgyG5GZdateVfJexr6P1ZC81ISjrFqwm7gqNwM2w6M/lzEDpR1JTlWYRyeXiDklZzz1z9E1i6akcyj2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZG7O4CX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZG7O4CX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B400BC4CEEA;
	Thu, 10 Apr 2025 11:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744285306;
	bh=/cLfvZPaGaKqTv5rGWJ2lfAMdaEHdJl7YqBZZkkNksw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cZG7O4CXmGL0MyfFfIjmuxA0yarKJ8L0fZF71b3Za1BdNbUR4WoW6fQr2tIqjOJua
	 Lo6k2SnvJyP3yvMRD18WWaxSQGG6Fb/nINm+vGobEOwv7ltJKknJV+lH0EAlkcTDd2
	 DQd4/PXo3SgVTG64u0sE4oXFTCPQABuy5+wfmY5JlBYsdhZ38x7QROXBDpBJdOuw8G
	 S+/qlghzShEheGHiXj8INFLEjAQGwWfwFHpjb7+zix3qA6/uFyZykTqTc/BqOFAgTr
	 Vee9LNRxs1W9lT6H3Fj1QGS3Y/Dwfouqx0zjZ6GXLCBo/of7Rx94kr/Yr8pnyPfzg6
	 he+aVtzyio2gg==
From: Daniel Wagner <wagi@kernel.org>
Date: Thu, 10 Apr 2025 13:41:17 +0200
Subject: [PATCH v4 14/14] nvme-fc: do not reference lsrsp after failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-nvmet-fcloop-v4-14-7e5c42b7b2cb@kernel.org>
References: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
In-Reply-To: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The lsrsp object is maintained by the LLDD. The lifetime of the lsrsp
object is implicit. Because there is no explicit cleanup/free call into
the LLDD, it is not safe to assume after xml_rsp_fails, that the lsrsp
is still valid. The LLDD could have freed the object already.

With the recent changes how fcloop tracks the resources, this is the
case. Thus don't access lsrsp after xml_rsp_fails.

Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/host/fc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 2257c3c96dd2da11097d2d0d4a5bb8ece1bebc6a..fdafa3e9e66fa9b8954209efa14d3b207cb8653c 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -1410,9 +1410,8 @@ nvme_fc_xmt_disconnect_assoc(struct nvme_fc_ctrl *ctrl)
 }
 
 static void
-nvme_fc_xmt_ls_rsp_done(struct nvmefc_ls_rsp *lsrsp)
+nvme_fc_xmt_ls_rsp_free(struct nvmefc_ls_rcv_op *lsop)
 {
-	struct nvmefc_ls_rcv_op *lsop = lsrsp->nvme_fc_private;
 	struct nvme_fc_rport *rport = lsop->rport;
 	struct nvme_fc_lport *lport = rport->lport;
 	unsigned long flags;
@@ -1433,6 +1432,14 @@ nvme_fc_xmt_ls_rsp_done(struct nvmefc_ls_rsp *lsrsp)
 	nvme_fc_rport_put(rport);
 }
 
+static void
+nvme_fc_xmt_ls_rsp_done(struct nvmefc_ls_rsp *lsrsp)
+{
+	struct nvmefc_ls_rcv_op *lsop = lsrsp->nvme_fc_private;
+
+	nvme_fc_xmt_ls_rsp_free(lsop);
+}
+
 static void
 nvme_fc_xmt_ls_rsp(struct nvmefc_ls_rcv_op *lsop)
 {
@@ -1450,7 +1457,7 @@ nvme_fc_xmt_ls_rsp(struct nvmefc_ls_rcv_op *lsop)
 		dev_warn(lport->dev,
 			"LLDD rejected LS RSP xmt: LS %d status %d\n",
 			w0->ls_cmd, ret);
-		nvme_fc_xmt_ls_rsp_done(lsop->lsrsp);
+		nvme_fc_xmt_ls_rsp_free(lsop);
 		return;
 	}
 }

-- 
2.49.0

