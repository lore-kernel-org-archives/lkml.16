Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1310D22F175
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126166; cv=none; b=adFku16KNWmdhYzU56delh+ViHjErGbGcZ0QY3CPwH8vXCBpDrcSJUfNVLIhsWzXVfRBZ/Klw9/foc/dQZ3vtHxPyiJHICLQmNj6tI79as1Y2kK3peM173tsmDr3dEEU2cFe7AjqpWxkiOCu/I+x2Wn93SiWWA+d0Qg0r28bmlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126166; c=relaxed/simple;
	bh=O5GHwCVJjRcxblaYbgVMKB2kCGt6YrQb7Ba5ru7hUuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gIUcTPzNHRxkIK78ZsLMKQxEZWEFHBI7r3mYJJcK2HIQ3mC2e18WKHbncaY2adPWAeu5JmbaaUJ9QtaMhWEyxicTbxRGdGwd4P/fSBdOZ/7no8R3txgEKUVKE5cLbbQlyMjNcR/4I4/eky8JgkWWOshMpzBGFIIIacrXDb+vIAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/P2rIHL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/P2rIHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D86C4CEE5;
	Tue,  8 Apr 2025 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126165;
	bh=O5GHwCVJjRcxblaYbgVMKB2kCGt6YrQb7Ba5ru7hUuo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B/P2rIHL6acwI//GuwPxF9W4886pJxQCrbbkjHHMcNrjaLOFOjwx//wZ9f7+YZqK6
	 +fQscAGwC+bsz19GNevNIfrmKmms8VmAUzW946bebPOJ6mHDod9uNUStMdyjyA9Edu
	 0RJweyEDCRH799Hjqf05sI7/zKno+XnqMgl/+RtcPUJybo4YER2LldsENj/E+wDE/F
	 DF9g7tp+FAzuNDcdhbAsJzSiXvoEoQppmioO2GqLskGMISJn0EPDKNZvWszRqmJHk0
	 Bn7okh5zyI6AaSh23ZpJ6qW8H6IMfbJgCT8nDW7nxP+CoHy1wpvf9knIDcQPjTNOPy
	 4xt4nva6aa8EA==
From: Daniel Wagner <wagi@kernel.org>
Date: Tue, 08 Apr 2025 17:29:07 +0200
Subject: [PATCH 5/8] nvmet-fc: inline nvmet_fc_free_hostport
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-nvmet-fcloop-part-one-v1-5-382ec97ab7eb@kernel.org>
References: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
In-Reply-To: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
 Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>
Cc: James Smart <jsmart2021@gmail.com>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

No need for this tiny helper with only one user, let's inline it.

And since the hostport ref counter needs to stay in sync, it's not
optional anymore to give back the reference.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fc.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 6487c46ebba8d12e573d19fe8c39d526492c506a..6d64dadcb356b78b522d0deaa433cc745bfcd8f6 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -995,16 +995,6 @@ nvmet_fc_hostport_get(struct nvmet_fc_hostport *hostport)
 	return kref_get_unless_zero(&hostport->ref);
 }
 
-static void
-nvmet_fc_free_hostport(struct nvmet_fc_hostport *hostport)
-{
-	/* if LLDD not implemented, leave as NULL */
-	if (!hostport || !hostport->hosthandle)
-		return;
-
-	nvmet_fc_hostport_put(hostport);
-}
-
 static struct nvmet_fc_hostport *
 nvmet_fc_match_hostport(struct nvmet_fc_tgtport *tgtport, void *hosthandle)
 {
@@ -1184,7 +1174,7 @@ nvmet_fc_target_assoc_free(struct kref *ref)
 	/* Send Disconnect now that all i/o has completed */
 	nvmet_fc_xmt_disconnect_assoc(assoc);
 
-	nvmet_fc_free_hostport(assoc->hostport);
+	nvmet_fc_hostport_put(assoc->hostport);
 	spin_lock_irqsave(&tgtport->lock, flags);
 	oldls = assoc->rcv_disconn;
 	spin_unlock_irqrestore(&tgtport->lock, flags);
@@ -1449,11 +1439,6 @@ nvmet_fc_free_tgtport(struct kref *ref)
 	struct nvmet_fc_tgtport *tgtport =
 		container_of(ref, struct nvmet_fc_tgtport, ref);
 	struct device *dev = tgtport->dev;
-	unsigned long flags;
-
-	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
-	list_del(&tgtport->tgt_list);
-	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 
 	nvmet_fc_free_ls_iodlist(tgtport);
 
@@ -1614,6 +1599,11 @@ int
 nvmet_fc_unregister_targetport(struct nvmet_fc_target_port *target_port)
 {
 	struct nvmet_fc_tgtport *tgtport = targetport_to_tgtport(target_port);
+	unsigned long flags;
+
+	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
+	list_del(&tgtport->tgt_list);
+	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 
 	nvmet_fc_portentry_unbind_tgt(tgtport);
 

-- 
2.49.0

