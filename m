Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD6825F7BC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620611; cv=none; b=GzNeLTCxMLfxA+4rA0k6aNMBW3IUQkJp72jrPtQQpKTX+1YWJ2J8T8Tt9F2gRVmTD2E9FToSHQ96RFkovLbIZjdqMQVAy4yuW+XaUZciCKu1WvlVuHfWD9m7pZgLppXb79lQ9BgEPfuz/XKRPw1hi08JZ9gRUUhcCDdKH+bpi9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620611; c=relaxed/simple;
	bh=wstjbJH1UyMo+LF5FaHWTbfkuXNTo5rZRqDKY0yRXBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mUhycwdzdQKkCj+U4uPOqVSIuRhplCPKzrdHIBxUBXk4LTBesa6jfTYIBZ7jTbMuArRlbtAsoHy24+EGFRU56YktFGMRmSCuSSBKaEEI5sdq+pUXQf3ERRK5D0paJ9WDzfkLQYG+zdX0j4tlbmPcrmQRI6+N4ybkM8EB6TgqA/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuqAz+Xl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuqAz+Xl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C386AC4CEEE;
	Wed,  7 May 2025 12:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746620611;
	bh=wstjbJH1UyMo+LF5FaHWTbfkuXNTo5rZRqDKY0yRXBc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fuqAz+XlOwDRClCaVi0ae1tzr2c+cpR6MsX8wyU+WblgbDTwOp7DwrMvS6v9IrF2W
	 B5BDTJNTwXLOgBa/6d1LEjUbiPD9zGFn58+MtOChaaUnGJIXzXcKmXFwvEOXiJLFc8
	 kAD0++8S//6JUSfXGBIxLoR3BAzNLowEbCt+LCAJkmZSZYexeKJdxyWPtqDeZfdqKb
	 YAZPGHW/2RYoXkoFZJV4d6L9TCtDBVNWqNoD5e5AvxUpAV4cHK5jjWtWUDVRdCA6Xi
	 MmwqsMaPvIWn8qr5A3kIuIKdc+rcc7rucgUR4iyJtvr9eRZnpVOnfTwunrCBTVLZNO
	 fw8th/0B6o2yw==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 07 May 2025 14:23:06 +0200
Subject: [PATCH v6 10/14] nvmet-fcloop: don't wait for lport cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nvmet-fcloop-v6-10-ca02e16fb018@kernel.org>
References: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
In-Reply-To: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The lifetime of the fcloop_lsreq is not tight to the lifetime of the
host or target port, thus there is no need anymore to synchronize the
cleanup path anymore.

Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index f999bd6513c19b19af64e0ea547db26b627aab69..fc10d380c17e77ed35706ddd7690e6f6a8d268c6 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -207,7 +207,6 @@ static LIST_HEAD(fcloop_nports);
 struct fcloop_lport {
 	struct nvme_fc_local_port *localport;
 	struct list_head lport_list;
-	struct completion unreg_done;
 	refcount_t ref;
 };
 
@@ -1083,9 +1082,6 @@ fcloop_localport_delete(struct nvme_fc_local_port *localport)
 	struct fcloop_lport_priv *lport_priv = localport->private;
 	struct fcloop_lport *lport = lport_priv->lport;
 
-	/* release any threads waiting for the unreg to complete */
-	complete(&lport->unreg_done);
-
 	fcloop_lport_put(lport);
 }
 
@@ -1234,18 +1230,9 @@ fcloop_create_local_port(struct device *dev, struct device_attribute *attr,
 }
 
 static int
-__wait_localport_unreg(struct fcloop_lport *lport)
+__localport_unreg(struct fcloop_lport *lport)
 {
-	int ret;
-
-	init_completion(&lport->unreg_done);
-
-	ret = nvme_fc_unregister_localport(lport->localport);
-
-	if (!ret)
-		wait_for_completion(&lport->unreg_done);
-
-	return ret;
+	return nvme_fc_unregister_localport(lport->localport);
 }
 
 static struct fcloop_nport *
@@ -1328,7 +1315,7 @@ fcloop_delete_local_port(struct device *dev, struct device_attribute *attr,
 	if (!lport)
 		return -ENOENT;
 
-	ret = __wait_localport_unreg(lport);
+	ret = __localport_unreg(lport);
 	fcloop_lport_put(lport);
 
 	return ret ? ret : count;
@@ -1772,7 +1759,7 @@ static void __exit fcloop_exit(void)
 
 		spin_unlock_irqrestore(&fcloop_lock, flags);
 
-		ret = __wait_localport_unreg(lport);
+		ret = __localport_unreg(lport);
 		if (ret)
 			pr_warn("%s: Failed deleting local port\n", __func__);
 

-- 
2.49.0

