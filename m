Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575261E5B7F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126170; cv=none; b=N01ix5+5MoHWide9BTh86k4/m/iGSBILt0yhlMwUcvBhXAOuYWNv0UHCVr/0vi8cJvDzWVLRUxei7m91RJcCB8i/FDmloNBJ/eAoo+lI33862C1QjqEq9hPoRNVFCgofM2eaMP8Y4UvyJBjF4oEyUN2azO84fe1uvY3BN4G8yDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126170; c=relaxed/simple;
	bh=xJGc+4ZfEtXd0Q1inHLwc+Miuup2DabedmlojQWG/4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=un2hmSyHpFxc8N6rTX2gCPV7QXwTwAj8+HIrl9A2VBhTSInAO6nK65qR8BQZbGgBW1DGZQArJ/I2JTTJ/T4UQAZ8tQsNCFBamez4yfonPeOpJpip5R7wWpKEW1NYYINN4uQG34hp3l4jEnC7hQdyhXmPxSONjjraskVvE7zjDVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnHKkn1/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnHKkn1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FD8C4CEE9;
	Tue,  8 Apr 2025 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126169;
	bh=xJGc+4ZfEtXd0Q1inHLwc+Miuup2DabedmlojQWG/4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cnHKkn1/i/vfN8L94bedD3cqiEus3Owc9Akn0InGkpSFwh2a9E3we/bAH7PrvgUsZ
	 XVTvZI3sb0JV0s5tpbZL887wljckaMCvo539mnaqvda+488C9q2D05HIMIAZ5jgqxE
	 Py/q3GagC9o8wsUAuCoz0HV2qPZYgMAo3Muc+v8Fo9y0wchluxSfYN7S5domQblPAz
	 VKvQ1j4sbpyvH2uc3BeyS7qkaliv742LkEbIn3gIymcDPWO6ZguAFerfnjsfIeQB9f
	 Sklg3s3e+jBW5tNPvY+dFoZGR4+uvVFUAkm0UYt9/PubKLNam2ilWamZq8qphJIUl2
	 12bd3B2d8RHQQ==
From: Daniel Wagner <wagi@kernel.org>
Date: Tue, 08 Apr 2025 17:29:08 +0200
Subject: [PATCH 6/8] nvmet-fc: update tgtport ref per assoc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-nvmet-fcloop-part-one-v1-6-382ec97ab7eb@kernel.org>
References: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
In-Reply-To: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
 Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>
Cc: James Smart <jsmart2021@gmail.com>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

We need to take for each unique association a reference.
nvmet_fc_alloc_hostport for each newly created association.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 6d64dadcb356b78b522d0deaa433cc745bfcd8f6..42613280c06e82a0236520d93470ec6fdede37ea 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1127,6 +1127,7 @@ nvmet_fc_alloc_target_assoc(struct nvmet_fc_tgtport *tgtport, void *hosthandle)
 		goto out_ida;
 
 	assoc->tgtport = tgtport;
+	nvmet_fc_tgtport_get(tgtport);
 	assoc->a_id = idx;
 	INIT_LIST_HEAD(&assoc->a_list);
 	kref_init(&assoc->ref);
@@ -1228,6 +1229,8 @@ nvmet_fc_delete_target_assoc(struct nvmet_fc_tgt_assoc *assoc)
 	dev_info(tgtport->dev,
 		"{%d:%d} Association deleted\n",
 		tgtport->fc_target_port.port_num, assoc->a_id);
+
+	nvmet_fc_tgtport_put(tgtport);
 }
 
 static struct nvmet_fc_tgt_assoc *

-- 
2.49.0

