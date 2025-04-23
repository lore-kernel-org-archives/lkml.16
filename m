Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F75718C031
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414552; cv=none; b=oQovCElBfh+8iplKVmr6VlUDLBNoNjWIkMQUgGlCgxafgTepr5nZAAga0JRIJmhWI0F0CqQ6XIJqZGFFgqI41wOcRDZ/R1Wrv+WQMPsWPiBYmwAp94RZF503Bnt2BE+j1A1dL4WA6RaUhPX3Pr1noPkoc3hfUCaQOar1cQpWDsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414552; c=relaxed/simple;
	bh=/cLfvZPaGaKqTv5rGWJ2lfAMdaEHdJl7YqBZZkkNksw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=stfQKsuQLVVUHAuRhP7zW3bICVz2VeDk4YUXCcG/cETMtviLHPS/eCjrNrfwgST4z+V9G7Blq8R5uhyogjFiIt4OaaE+kv/D4VJ//qTl4qaZ6JCAV8HKwW29wMpjxIUp+PdQ95iiyD13s5a3S1Wx5xhJqhE1hwSHIRfH+jBjNYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLImKzZ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLImKzZ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C349C4CEE2;
	Wed, 23 Apr 2025 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745414551;
	bh=/cLfvZPaGaKqTv5rGWJ2lfAMdaEHdJl7YqBZZkkNksw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TLImKzZ/tQWXbn4ODEiwVugd6vBNT48iqotSK9rMkKp8Debxfj5BAEh5JBOCl4PP3
	 JRqRyITxPTX4JUmrEqhZUZ61fl0wrDdLGvEifWBUCzZZFiWb0aVrNNYKq5wjr6yImo
	 UjZyn9xXa/m8FhGH87jXr3Pu8ZQ9Hzrr5DR8Zo9WmHivVkuOITZ5Z63aSGW4fu87kT
	 3xKwkpuZAsn8OGsn3DJbZrGseIHXH0dZAUH4IitrxODWQb5mkqZq9UJRT4k3nufm0C
	 kCT8EgypF24kVtPnYLLEMaAByPw4/fnXdKTF+9vf0XqKQDT8ExixZJe5k1IeCxBprt
	 jzy79wc0wEyyQ==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 23 Apr 2025 15:21:57 +0200
Subject: [PATCH v5 14/14] nvme-fc: do not reference lsrsp after failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-nvmet-fcloop-v5-14-3d7f968728a5@kernel.org>
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
In-Reply-To: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
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

