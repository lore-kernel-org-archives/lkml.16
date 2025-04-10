Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01488283C81
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285279; cv=none; b=Q7J0LEHjKjxTfcRpw7v7er94+T9VtuG92rsbDEQ5c5kxgDSWUmItBylR6zUAxZN7JgcHmbEZtiaLjEx0Tg76zwgkuP26U4vHjPIEdZ7CdR0vPejqdOHyk/mhtuMbIi4g7c4uK2VVdAhn2c4t0xbD5T7NFzDbBjBs6zJ+PKzaTr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285279; c=relaxed/simple;
	bh=Tey/jPpQIblgm+n0ERiQKMTVIjHrNonHGj1c23bE1TI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IG64ZDXLaL/lkRfWliUlVp/BX7id4j7OlewObELRn3/eG/jBhE2GWog8vl+3sKv/QMabv+I6jGTD0HOZfFZDlaThlgUTP4LbUcgpaB7p+6G4EvaVbQHUE82lD+H4fAcwnFDnANHXEZ7UmyDryrLg+yJC1NdR1eDAsveFWKVq47g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqIjYDlL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqIjYDlL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27F9C4CEE9;
	Thu, 10 Apr 2025 11:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744285276;
	bh=Tey/jPpQIblgm+n0ERiQKMTVIjHrNonHGj1c23bE1TI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mqIjYDlLXig4f1bLZyKqHY6vo2hLsJSz7sogICU/asF+8rnxjO5aTpy1lw9I8wYH5
	 Ux41jY72blOsdUitvFUB4nnIL6/I/gkuVrloxalfSuMqOkZVaiTb6T6Kvc6829mOPz
	 aPXt95JlG0SxrucOnVbPJb/RExa53TmCz+paac1S7T9CSIlPuFI/d1UKqEKvwpb1SW
	 PJMJK6j1mhgqvgxCElQ9P+sART/8M14gZ+nOBqp3oXL/dnE85QeogSA5bvE8OC5G6A
	 CoJyA+VkIUwHCAU7NOPFvOiqu/gwy5qmL42zhPiyraWTPO67aIVskseLDDLs4VmZ9C
	 xaw+G2JsywR+w==
From: Daniel Wagner <wagi@kernel.org>
Date: Thu, 10 Apr 2025 13:41:05 +0200
Subject: [PATCH v4 02/14] nvmet-fcloop: remove nport from list on last user
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-nvmet-fcloop-v4-2-7e5c42b7b2cb@kernel.org>
References: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
In-Reply-To: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
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

