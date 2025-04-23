Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F161A4F12
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414543; cv=none; b=Y7kOLkG76t7kXlO+uEv/tjBwJNXfCPjoCCml7FcHvJSIoQz9aTk+jzihdt/jsWjALxJVtP9swo/77BMo35ehsz9RKjxT/VRIyUMb9uGPDDsRUsmCn40GGTgz29aP6ozd9waxRWeT6uYVnaA1QFIoTmEecPZs3UJW5bxjzII41IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414543; c=relaxed/simple;
	bh=6MtNYpYf3+gfKph3AscTQcqFhTmhfVMJlOnasxAT7Vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kadQ8G1ElnuHjGj+ukmLIeIrQ8CRlG4NmTT+URvceLqlexBIYrrWN4qKFznNPZxY5WRYI1kzIs4rMc1oqJbaZEL9sTE1MSc3jLhOL009X6OzgJsKOdjZGiEpc5fcRW4QKTVgnuRy0n0HY/UyJYhHEJe/vI1nQkjK8t+AUdlK56U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGzG7HQj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGzG7HQj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B100EC4CEE2;
	Wed, 23 Apr 2025 13:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745414543;
	bh=6MtNYpYf3+gfKph3AscTQcqFhTmhfVMJlOnasxAT7Vg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uGzG7HQjaUOR35QHir31DR1z2HfBPedM5tEamXQzYkPoo9/XCIa30mQw1CH3QsLoA
	 GGxj8hSQTKO1gbJN4lKj6C7uIupIitm9kZo8+JXnIwwIgXLazQ0BlzgPC2NITECcYT
	 so4fBYHWVtKRqSsw3dybjbkXQzS9i8SFvcaGHKlflCHHi2tr9fNEFoBpHrwkqbmEBW
	 BPYLXUSLYQi8Y/ch4FWe1oTIjCu7SVnetaG1WHoI0MPo/0YJZppnjZe1PcUruRyWQO
	 yZ3gjWF3vpjbcKNhlgiwLXWlTXHo34kW9Oy710YjyMbJwMyAYRXuGxriUaQkldg/OS
	 BHpSAkDjYjT0g==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 23 Apr 2025 15:21:54 +0200
Subject: [PATCH v5 11/14] nvmet-fcloop: drop response if targetport is gone
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-nvmet-fcloop-v5-11-3d7f968728a5@kernel.org>
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
In-Reply-To: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
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

