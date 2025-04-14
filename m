Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE1929BF9C;
	Mon, 14 Apr 2025 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637381; cv=none; b=DqYbngIcC3Dwza+zBfjLjIXgvrwb3KH1qHFruan9fTIzA8insrUBoaYeFLT5kuabBMMb+Ottyk6DhImsH8uhQCwQkn1jDTCfKSQRN4UVTpIzIO7DouXR9aeX07Ni6Aya576j3hEnnayaijao5F2HaxQJYZd30BZVxU0MhDPG6ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637381; c=relaxed/simple;
	bh=zoAf7BIuluC1txZ4yjQEbLP0gHpfXijkojicAkawmCM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W/v4n/ysY4ZNRgErpKalE8/3xLG/kOLgnNcqjFkwm7WOJnqvokH44m++pItMixapRHcTtlw3hY6E3QxtbjcztW9S3LylR3SLOd5lODsDSZApiVP1DpEW8SOcaFiKcxFxtFGMQf85u2SUge7zHriI3wJs4HqEb6tjeEIhVUEcM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VERxvk2Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VERxvk2Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7622EC4CEE2;
	Mon, 14 Apr 2025 13:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637380;
	bh=zoAf7BIuluC1txZ4yjQEbLP0gHpfXijkojicAkawmCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VERxvk2Z1eIkdYDTzWmQoFfd1a651P58cSQEgaum5E1tB1Xv4QX7X3Hg9rOCQPmsy
	 VzqdSiVTXWB9Gv/fZ7JvDkqxoZfLEvYPdVXDO1HS0d7ffCYF6dknJY/I6AIFTfNIca
	 IQvfXo4Hm24L4+t2EJWdSx4yxrHTPEDnyKdAslDlxItvNOA+tgAfwwo2HMZ/W4T/0s
	 uq4oc1wfbiyl9+t6MLwFyTyjVBokw2rsjLLP50qL/QE8ShgnrcYivTNaKfciSncDlZ
	 UfxsdKuw9LD3YDo9CJTmbQ0FbSuwmSrkYxss7mmJmh6eV8+hlP0XFkYVHNMbtP5RcX
	 W9E7votr4yOFw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Daniel Wagner <wagi@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Christoph Hellwig <hch@lst.de>,
	Sasha Levin <sashal@kernel.org>,
	james.smart@broadcom.com,
	sagi@grimberg.me,
	kch@nvidia.com,
	linux-nvme@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 22/30] nvmet-fc: take tgtport reference only once
Date: Mon, 14 Apr 2025 09:28:39 -0400
Message-Id: <20250414132848.679855-22-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132848.679855-1-sashal@kernel.org>
References: <20250414132848.679855-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.23
Content-Transfer-Encoding: 8bit

From: Daniel Wagner <wagi@kernel.org>

[ Upstream commit b0b26ad0e1943de25ce82a7e5af3574f31b1cf99 ]

The reference counting code can be simplified. Instead taking a tgtport
refrerence at the beginning of nvmet_fc_alloc_hostport and put it back
if not a new hostport object is allocated, only take it when a new
hostport object is allocated.

Signed-off-by: Daniel Wagner <wagi@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/nvme/target/fc.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 3ef4beacde325..a3a6dfe98d6fc 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1042,33 +1042,24 @@ nvmet_fc_alloc_hostport(struct nvmet_fc_tgtport *tgtport, void *hosthandle)
 	struct nvmet_fc_hostport *newhost, *match = NULL;
 	unsigned long flags;
 
+	/*
+	 * Caller holds a reference on tgtport.
+	 */
+
 	/* if LLDD not implemented, leave as NULL */
 	if (!hosthandle)
 		return NULL;
 
-	/*
-	 * take reference for what will be the newly allocated hostport if
-	 * we end up using a new allocation
-	 */
-	if (!nvmet_fc_tgtport_get(tgtport))
-		return ERR_PTR(-EINVAL);
-
 	spin_lock_irqsave(&tgtport->lock, flags);
 	match = nvmet_fc_match_hostport(tgtport, hosthandle);
 	spin_unlock_irqrestore(&tgtport->lock, flags);
 
-	if (match) {
-		/* no new allocation - release reference */
-		nvmet_fc_tgtport_put(tgtport);
+	if (match)
 		return match;
-	}
 
 	newhost = kzalloc(sizeof(*newhost), GFP_KERNEL);
-	if (!newhost) {
-		/* no new allocation - release reference */
-		nvmet_fc_tgtport_put(tgtport);
+	if (!newhost)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	spin_lock_irqsave(&tgtport->lock, flags);
 	match = nvmet_fc_match_hostport(tgtport, hosthandle);
@@ -1077,6 +1068,7 @@ nvmet_fc_alloc_hostport(struct nvmet_fc_tgtport *tgtport, void *hosthandle)
 		kfree(newhost);
 		newhost = match;
 	} else {
+		nvmet_fc_tgtport_get(tgtport);
 		newhost->tgtport = tgtport;
 		newhost->hosthandle = hosthandle;
 		INIT_LIST_HEAD(&newhost->host_list);
-- 
2.39.5

