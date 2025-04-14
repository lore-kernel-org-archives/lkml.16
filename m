Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FBE13D531;
	Mon, 14 Apr 2025 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637514; cv=none; b=rwkfHYO1E2zZ2/rjKlOXLsy2IoxlLXkrwxQVEuifj/Do3sIyRMfYa8k4aY8FPmTcs2UHhgWGk4O2t9ZX16pqfmYi8Kso41R7DO6mWHKjt9jMuw4EdrFZqfYld5fflZ0irv3VnrpU+x6cVX0lsMl5JuA4dmCuwngCYOM+eBCrDks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637514; c=relaxed/simple;
	bh=gXYkN7rIv/AIE5AOvfkahXaOoDQRUBOAvs6q5iGHMvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eiQpmFm6vxc9+B1f+yQPwFfbnvfWM5wj3wZ9D0RYz5XS6BwV80seyaYWzgehvQ2wMJdlyHQUZ2VEP3tS/VH/vv9FIegbyN/u4A6FTee1uSibnc7P38uXEj+EHM28jCKGvymcO+czWCYHvuV1B5yEE/yBSe6gNvq5LEs6CSRW9Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3nclsR7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3nclsR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6BCC4CEE2;
	Mon, 14 Apr 2025 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637514;
	bh=gXYkN7rIv/AIE5AOvfkahXaOoDQRUBOAvs6q5iGHMvU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F3nclsR7PDreZn/D/u6/AneajT/sEAAjOizUSyN0hOmp93SjxhDdMsjA/hzCh+vnL
	 xSNPiGhyyIsrO+hrQ+gYZo5u9FXw8+QnaOmuBzYqbvD/if8U7tYZlQm+w75XXT188w
	 L6remtz+dlKh/rwlUPisuIqOMnc+PdPQ0K0GqrwvfUn1S1kks0dYV1dOD1iZ4PAAkF
	 1XTUsDSEb1DWC8DFS8mk7d/iYpzkAxOpUC6YgoK9lFiOUIbsqZYS8fFQ1gZFn4y/5j
	 L4j7acqCe6hty+ZZVBCXtVYBDZeNWz13vjmwxB8aFszYD3Q1pVoUh7p37DMYx9xfFF
	 HCVQHU2LmtLHA==
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
Subject: [PATCH AUTOSEL 5.15 13/15] nvmet-fc: take tgtport reference only once
Date: Mon, 14 Apr 2025 09:31:23 -0400
Message-Id: <20250414133126.680846-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414133126.680846-1-sashal@kernel.org>
References: <20250414133126.680846-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.180
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
index d3ca59ae4c7af..606fdde21d629 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1044,33 +1044,24 @@ nvmet_fc_alloc_hostport(struct nvmet_fc_tgtport *tgtport, void *hosthandle)
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
@@ -1079,6 +1070,7 @@ nvmet_fc_alloc_hostport(struct nvmet_fc_tgtport *tgtport, void *hosthandle)
 		kfree(newhost);
 		newhost = match;
 	} else {
+		nvmet_fc_tgtport_get(tgtport);
 		newhost->tgtport = tgtport;
 		newhost->hosthandle = hosthandle;
 		INIT_LIST_HEAD(&newhost->host_list);
-- 
2.39.5

