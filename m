Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D09D28A3E4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285299; cv=none; b=RSUBAgZe2kB2JGOssuURzSr5iTofST7VbV2ZFbX/ybg3eG18rTSUpn4092x1TPpXas4qekRAeRLwfw4DzZSFvKLyAU8Ng5qC3QgTjkYgaz0+kW/c+qLmwPu7qguIjxajc9eFxArHBvsPXJ2P1w1bs/fLOHUKhqXZCI9RQ/8cqiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285299; c=relaxed/simple;
	bh=6MtNYpYf3+gfKph3AscTQcqFhTmhfVMJlOnasxAT7Vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fQ/0szaapfHyAaykXke4if/yBRDhhEQTx5wJSshhlFhs3Jqt38IxaDNgKc7L37BxAjd9XlV+1ANJlWrmGDXFlsaB2sYKjmyO754gIPwF1emtQPTk7tTKlTy/Fxmo1d/WZKEp15M2pMy60h7e6K5E3WcKmvuyC2G+iI8m7nzeonk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKYrhUOP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKYrhUOP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527F5C4CEE3;
	Thu, 10 Apr 2025 11:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744285298;
	bh=6MtNYpYf3+gfKph3AscTQcqFhTmhfVMJlOnasxAT7Vg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RKYrhUOPJX2S7Twyok9CWRNVkP79/thYWfoZHsLWwPfQUys5rs3pPZi07wg4FMbEo
	 tmo1PY40RnSuE8kNIejj6yqiQm5E9Mj71/XfQXO5VENYiPuQPgzP5Bel1NYbj91y9L
	 ra6qH67yPlJWLkNyO/5m4YZeC6nRVCY37emDAEcDhkJOOCBpH9T7K+UhVNpgkjrwEa
	 pQbMB8RKlNa8yJA0nAZCh45s1OgykraEQ9S5I/a6B8yaNFzu4Zl9f6EfamRqfkTrSr
	 gZ02aGF8tFQgFtsp3iwTB/R/7smIN3OVEzlGbx3aZ5sp7gT4UGVO1IVT+/DyvBP9ZJ
	 +K1sEGW9jqv9A==
From: Daniel Wagner <wagi@kernel.org>
Date: Thu, 10 Apr 2025 13:41:14 +0200
Subject: [PATCH v4 11/14] nvmet-fcloop: drop response if targetport is gone
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-nvmet-fcloop-v4-11-7e5c42b7b2cb@kernel.org>
References: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
In-Reply-To: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
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

Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index ca11230bffedb0f2313a99e24e54e892daf0d644..bb45721ec0f028399d810cbd7891bc6975801752 100644
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

