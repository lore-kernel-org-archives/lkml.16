Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9136C25F7BC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620614; cv=none; b=cdMPQqXsLPPu352ggCnCnJHOAZnJjiBstUDsV72cGRtOwCqpVOrayeEGQ3pU0HC8l1nN4jPWi+TvVTpbD3ZXFNMeVW7jBMjmCKY2pOMrIgWFcCqhTBw0YWR0uRsQ+D6zp4ycxkB8+/0VIy+IduRI0UDOE9sw/DkSy6D7CaXGASU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620614; c=relaxed/simple;
	bh=Vgi/9IyqkECjCLy4OrYLOjteLpppbj1oxp8MVjo1eQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+pISA1UIeTYEodMERBFSjGIEQD04t9OxtFGTOiL2GKhtpS/Oa59kzcHx0OLuVwoBupQA+42kcD4agP1PYAiovL7IPBrhuyVx21xij/DYICPBaWrzzrfN7J2E+hqyaYZiDyJLmSblDNs+AW8JVFov+Srw/wF9a+UjCW0U8UlSIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oh9dX8aA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oh9dX8aA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8583C4CEEE;
	Wed,  7 May 2025 12:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746620614;
	bh=Vgi/9IyqkECjCLy4OrYLOjteLpppbj1oxp8MVjo1eQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Oh9dX8aAXSTWWt+hXSDRXwgZbV0Qdq/GSGS/kyLDRyZDLOovd6fVhq+XwJ9s1zoRC
	 OK4bKc1otjchyDHSszsnBQIkco8NM92Rk4/F6SHyCIJV5m6EdvUqfB7B6Nw0UiF3lH
	 Q8i6jtnRlAqzAligpQbmRtbuIAZFaDy7emUQGK1GQzJqK4EvQSf434MaruefAui2mw
	 TRsulgiNHKi6XdbH2/fdi1jmbUVEJnr8AD0y9Fh92GPyAfCL5Ey6+8jDI/oZSeIT65
	 da91gIW1XyL6JqqeDigUnMruJlJMkXwhw8JjVQUbZLiekajZW/+USsZdekqibn+ddT
	 W015GCXFUlKHw==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 07 May 2025 14:23:07 +0200
Subject: [PATCH v6 11/14] nvmet-fcloop: drop response if targetport is gone
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nvmet-fcloop-v6-11-ca02e16fb018@kernel.org>
References: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
In-Reply-To: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

When the target port is gone, the lsrsp pointer is invalid. Thus don't
call the done function anymore instead just drop the response.

This happens when the target sends a disconnect association. After this
the target starts tearing down all resources and doesn't expect any
response.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index fc10d380c17e77ed35706ddd7690e6f6a8d268c6..83edfd48c30db36a755b9dc7af6605236dc67231 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -493,16 +493,25 @@ fcloop_t2h_xmt_ls_rsp(struct nvme_fc_local_port *localport,
 	struct nvmet_fc_target_port *targetport = rport->targetport;
 	struct fcloop_tport *tport;
 
-	memcpy(lsreq->rspaddr, lsrsp->rspbuf,
-		((lsreq->rsplen < lsrsp->rsplen) ?
-				lsreq->rsplen : lsrsp->rsplen));
-	lsrsp->done(lsrsp);
-
 	if (!targetport) {
+		/*
+		 * The target port is gone. The target doesn't expect any
+		 * response anymore and the ->done call is not valid
+		 * because the resources have been freed by
+		 * nvmet_fc_free_pending_reqs.
+		 *
+		 * We end up here from delete association exchange:
+		 * nvmet_fc_xmt_disconnect_assoc sends an async request.
+		 */
 		kmem_cache_free(lsreq_cache, tls_req);
 		return 0;
 	}
 
+	memcpy(lsreq->rspaddr, lsrsp->rspbuf,
+		((lsreq->rsplen < lsrsp->rsplen) ?
+				lsreq->rsplen : lsrsp->rsplen));
+	lsrsp->done(lsrsp);
+
 	tport = targetport->private;
 	spin_lock(&tport->lock);
 	list_add_tail(&tls_req->ls_list, &tport->ls_list);

-- 
2.49.0

