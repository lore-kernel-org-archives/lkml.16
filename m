Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F60E1E3DD3;
	Tue, 11 Feb 2025 01:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739237498; cv=none; b=u6YUbIzwBKbzbd5k4r9TAqk9y2AHJVFBvcTngAxbz1sFPkYmUQZ9fV571KpB8IW4laLYs+vucW+6JaNuuHdXGHPeMuL8h3eaqYsyyLyCPfQ/JY8Dg5cX7aJ8OV5TMRSkhNOzuFUml0T8/u4ot21iTbgeeO411AA3m1Y1rkMHpWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739237498; c=relaxed/simple;
	bh=JDIFLCSiAeD/ibzpe22Ppl2uHLgaDxUs0fmuzgdsjNc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YnQKOO76GLTAQvfcTe5eCPYLtSxbKZTU6V2MDrHeYCy+UXOiJMxbrBetAw5IKXG+++JxVWrsMi4LDHzp6dC8WkpH2vqp6zLxXr4JYsd9DEhGRgX/mcG21swrGI1+XfG2HY87vuJ/m+dDpplz6gyC8dJP+vkY1OzX/ohLDeUjtp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlUqXmDP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlUqXmDP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B743C4CEE5;
	Tue, 11 Feb 2025 01:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739237498;
	bh=JDIFLCSiAeD/ibzpe22Ppl2uHLgaDxUs0fmuzgdsjNc=;
	h=From:To:Cc:Subject:Date:From;
	b=BlUqXmDP59MQuVprtif6Mfe0nVBEQ19q6eLPAdbJuPnbsJb+KUcifkj9VKvntL3HV
	 p6zGQfrPlRpdYAm6Kg0j7XmpV4I2oy+X0ipRDZ68PdpjoDynfBd5Yf5Ie+jW/dtPRu
	 LRSjL+qwtApK0YUDpoPRjo50PvcV1xuJQYK5fC/u+z4nyaOPlWdsoPRMYPbRfY6ZH4
	 MTLdY8BNfDk3j+6sawlLNQEorPe+84Zd02CgfKV3i+tiL80pWUJxRa89jDTDpvag1r
	 iyxcYj8YFMfA4nCrt6vu8RUbADRatDQC+youQ/cPUFek4eSFjjsPwsqasKrQjN1NxV
	 Xrl4SwAusDCWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Daniel Wagner <wagi@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@suse.de>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	james.smart@broadcom.com,
	linux-nvme@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 01/15] nvme-fc: go straight to connecting state when initializing
Date: Mon, 10 Feb 2025 20:31:21 -0500
Message-Id: <20250211013136.4098219-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.76
Content-Transfer-Encoding: 8bit

From: Daniel Wagner <wagi@kernel.org>

[ Upstream commit d3d380eded7ee5fc2fc53b3b0e72365ded025c4a ]

The initial controller initialization mimiks the reconnect loop
behavior by switching from NEW to RESETTING and then to CONNECTING.

The transition from NEW to CONNECTING is a valid transition, so there is
no point entering the RESETTING state. TCP and RDMA also transition
directly to CONNECTING state.

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
Signed-off-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/nvme/host/fc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index cdb1e706f855e..bb85e79b62fad 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -3550,8 +3550,7 @@ nvme_fc_init_ctrl(struct device *dev, struct nvmf_ctrl_options *opts,
 	list_add_tail(&ctrl->ctrl_list, &rport->ctrl_list);
 	spin_unlock_irqrestore(&rport->lock, flags);
 
-	if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_RESETTING) ||
-	    !nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING)) {
+	if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING)) {
 		dev_err(ctrl->ctrl.device,
 			"NVME-FC{%d}: failed to init ctrl state\n", ctrl->cnum);
 		goto fail_ctrl;
-- 
2.39.5

