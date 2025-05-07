Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B3226A1A4
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620588; cv=none; b=smWcXd1UgVr5rw3HvfuenHPZ+yffvF7DXYtI7UlzdmsBg5snNaTVChx8Ns/c5PvuJq38emXeaEq+GIw70RHwAIR+eRbsbGxrswaWL2TSJeK1wHe4WqD9moqM5cax6VuTL54lCJTusV3BK2Z87YgeGvu2ppWfDxSnb4fb5pRTITI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620588; c=relaxed/simple;
	bh=Tey/jPpQIblgm+n0ERiQKMTVIjHrNonHGj1c23bE1TI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Scz0uFEf9sJiHURRRQhX0wCJxj49Xjt+5ymHcttHQFVxZK2xMF7oiIkdHA5MN+nko9KmcxIzg9gQcFb3xK79AjO7VLIj/s+wESBOfyEmohD1wK40orGJnPJkPID8ivhloguYR5IQ8PZlREWWHMVareoIhPNfxaP8FAujdwfF2jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZiN0O1l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZiN0O1l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D5EC4CEEB;
	Wed,  7 May 2025 12:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746620588;
	bh=Tey/jPpQIblgm+n0ERiQKMTVIjHrNonHGj1c23bE1TI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gZiN0O1lCHy/mbuM0dwpSBUZV366vh7C3QMSeCid5/l28x5EpygWDgVdbG9WCTsY1
	 xi0S8B12L/xNE/bdCWA2cHua9KO+61ursME2NNOhOAfJw848NjFiHix0vhlrhnLBWS
	 388KCJ9hMFuB3VKeG5OkjA7IzYzYx7LuUWCKs3E8YWkhDnrr1NJxq3Yivcg0cYxBSE
	 86HLHDoIoRJ/LXDXaaE637c8h70SgFp+gzuMYGrA+poU4nKCY5u1gRT/QfQ3PkrzZc
	 xV0UaQ29ie4KzUs+EDkKpojhrdF9I3WhKyP1zZ3GD3oSDoJ1RO/C1QrkhP0Mr9EMQS
	 0fUgPx93LYguw==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 07 May 2025 14:22:58 +0200
Subject: [PATCH v6 02/14] nvmet-fcloop: remove nport from list on last user
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nvmet-fcloop-v6-2-ca02e16fb018@kernel.org>
References: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
In-Reply-To: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The nport object has an association with the rport and lport object,
that means we can only remove an nport object from the global nport_list
after the last user of an rport or lport is gone.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index 2b23e43ef4403fa4d70c66263f7750165d2ddc72..2cce7649af276528360395b6d58f03183c11da20 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -1019,9 +1019,15 @@ fcloop_lport_get(struct fcloop_lport *lport)
 static void
 fcloop_nport_put(struct fcloop_nport *nport)
 {
+	unsigned long flags;
+
 	if (!refcount_dec_and_test(&nport->ref))
 		return;
 
+	spin_lock_irqsave(&fcloop_lock, flags);
+	list_del(&nport->nport_list);
+	spin_unlock_irqrestore(&fcloop_lock, flags);
+
 	kfree(nport);
 }
 
@@ -1414,8 +1420,6 @@ __unlink_remote_port(struct fcloop_nport *nport)
 		nport->tport->remoteport = NULL;
 	nport->rport = NULL;
 
-	list_del(&nport->nport_list);
-
 	return rport;
 }
 

-- 
2.49.0

