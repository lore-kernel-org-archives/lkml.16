Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777C31D63C4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126172; cv=none; b=bmw+r4idMTHTr/W4wPJym9gGImeZVjHxcq9W5mNZard08Oscot4R/a3iG9q4f/OATv5dj2s/Z4dDaBoY7z/Vv2YRfaX4MYY6CQVZDPJkDWjOXveuRY8ZrBxPSsd7G8JOTz9DjjPnRTj7LeGi9tdYxsfu0nkGAjM8USE6XecoWHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126172; c=relaxed/simple;
	bh=tsk2YMjqBLydxk+bAIUX9VPBT2iOvhNNO848oWtfRbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j5ywyxi3o0ES9OdBwhS8pjQjPzkbtxG5PYkDygDulh99Q+liXWObvvHIJiN9iNumHRkDjFo9qK72p4GD3Mqy15Xzq7DamTCTJy3Lq4/grmg2WVY4ddf9V6Qp7fWZ6hUm6XcQuSE9B63kKEQGF7bbx6qAfvFHt1s+mZdjNVFfNYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/3P65ya; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/3P65ya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0988CC4CEE5;
	Tue,  8 Apr 2025 15:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126172;
	bh=tsk2YMjqBLydxk+bAIUX9VPBT2iOvhNNO848oWtfRbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G/3P65yasluv92XU+RZtxMrHfkil9eol/CREQG+XPaGqJRrNFe/Om3IlRqnCoay+b
	 IthqrthbVOaV6lGAGGuyPAYbqOQVByyk903hixR01L0BQI/e6KXYJBDWODy5dRvWLy
	 jF38AoMtK2VTB5QvFv9p36+oy+Qr3EgUqIUV3My/YI6pQag7otvz5UDxMA2bstD64E
	 LCTeQRyvOCHR6+hIGEL8HLZ/Lb1lfiDD2a1TiNYpojJrNAaNm+Ij7JA7KSAKJ9VN6v
	 +xDIqHV+Wdre5TCNAsXFWscL0m6ZQbYNqzS6MwKZy3T0gyxWssFk7GTMCreYwRNhyJ
	 Ts0mbVdL+0VPw==
From: Daniel Wagner <wagi@kernel.org>
Date: Tue, 08 Apr 2025 17:29:09 +0200
Subject: [PATCH 7/8] nvmet-fc: take tgtport reference only once
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-nvmet-fcloop-part-one-v1-7-382ec97ab7eb@kernel.org>
References: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
In-Reply-To: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
 Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>
Cc: James Smart <jsmart2021@gmail.com>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The reference counting code can be simplified. Instead taking a tgtport
refrerence at the beginning of nvmet_fc_alloc_hostport and put it back
if not a new hostport object is allocated, only take it when a new
hostport object is allocated.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fc.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 42613280c06e82a0236520d93470ec6fdede37ea..61e9eea3bee430bfdef541bfe0d1f2538a49d9eb 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1018,33 +1018,24 @@ nvmet_fc_alloc_hostport(struct nvmet_fc_tgtport *tgtport, void *hosthandle)
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
@@ -1053,6 +1044,7 @@ nvmet_fc_alloc_hostport(struct nvmet_fc_tgtport *tgtport, void *hosthandle)
 		kfree(newhost);
 		newhost = match;
 	} else {
+		nvmet_fc_tgtport_get(tgtport);
 		newhost->tgtport = tgtport;
 		newhost->hosthandle = hosthandle;
 		INIT_LIST_HEAD(&newhost->host_list);

-- 
2.49.0

