Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361C6283CB5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285296; cv=none; b=Vw8qK7P/HRE25Yf86PYbEoHudb5os26yxb7VEtNOOem86coInMFMdePdHgt7WtW0biquKj6OH8jLeTAJJGWEgANKYodohgABjjdrRiovQlHn8IT/bfwPdnGtHA8Aw6wg65me5QHwlak3lAcdaXCP+XqJ7SSRf6TjyDmkp6OhBlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285296; c=relaxed/simple;
	bh=TzcGZfdwmdfAFPVttrRv4/p72KsoezPGz0D2QH9DrFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AihZ+Pz72WKz6TSZAzc3L3WOK2/XcHB201LoDWmYG5W/mC4cgabJa5KxwpWtfFxPvfrdRhc91ZocAWhAMK520V4PGZRbsPQZXx2Eag9yRblSpN4O2XRgUJ1vqQSJilhGEz+GHwel/lPiH09YlVCuceLisyaMuEY0HgJnU8f1quQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyg2oaoE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyg2oaoE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E1EC4CEE3;
	Thu, 10 Apr 2025 11:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744285296;
	bh=TzcGZfdwmdfAFPVttrRv4/p72KsoezPGz0D2QH9DrFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gyg2oaoEXkHrhB4O2ADFNyiyN9QhK298KwQVdeoSAUsldopps39bjhYDF5Ftszt4m
	 KU9n/XZnKn0e0ftM5RTz3lC3zItQFd/b3tixkrkoEKxFsDA01k5s0wnBTKenGFZDxT
	 6UfkeACIPmUBPJkh3LNB3mwsBGxXFv0NmXswgx9ntaux34gHnM4A3tqC9Ng37xWzi5
	 YvZOAhybD+dARu2+ALAIuyz7OakiEyKk63h8l47voLDQFX5kpYkxXP8gQUh0F6ACSB
	 FWN9EhytN8tNi97vXAThzhP2KTk9AIvLX3tb8WLIxjFm0H+OLyDvwI76ze0y5PSArH
	 D3iYlvr60fcHw==
From: Daniel Wagner <wagi@kernel.org>
Date: Thu, 10 Apr 2025 13:41:13 +0200
Subject: [PATCH v4 10/14] nvmet-fcloop: don't wait for lport cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-nvmet-fcloop-v4-10-7e5c42b7b2cb@kernel.org>
References: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
In-Reply-To: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
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
index 47ce51183a66b4b37fc850cced2ddf70be2cdb42..ca11230bffedb0f2313a99e24e54e892daf0d644 100644
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
 
@@ -1238,18 +1234,9 @@ fcloop_create_local_port(struct device *dev, struct device_attribute *attr,
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
@@ -1332,7 +1319,7 @@ fcloop_delete_local_port(struct device *dev, struct device_attribute *attr,
 	if (!lport)
 		return -ENOENT;
 
-	ret = __wait_localport_unreg(lport);
+	ret = __localport_unreg(lport);
 	fcloop_lport_put(lport);
 
 	return ret ? ret : count;
@@ -1776,7 +1763,7 @@ static void __exit fcloop_exit(void)
 
 		spin_unlock_irqrestore(&fcloop_lock, flags);
 
-		ret = __wait_localport_unreg(lport);
+		ret = __localport_unreg(lport);
 		if (ret)
 			pr_warn("%s: Failed deleting local port\n", __func__);
 

-- 
2.49.0

