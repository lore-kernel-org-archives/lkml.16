Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CB422D78D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126161; cv=none; b=VZfQiM3B7V6CuRC86bMbCYljiyLFpccN9Xc4uqczVljcf2Ky8HklRoAyLDW+TWFMXvpweYvymzVG9xKHzLvE/9dz5Cc4DrC1tWiVzoJ9EqCtqDRPbWkX/puELQwA55YJOdYrmO4qeI4bZODcQE4NWFgBQpOxoXm2ul9NKWf1frI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126161; c=relaxed/simple;
	bh=GSOhZSJXTqBDeMybmCwfGO34LVgry2NBtLmYpTfhtC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQXCFOXCGe3+889QzOOY6iTt2hL+J/YOQsOzCJkiNPXZ9XeTHFweVXanxIWjQR+4WFYBsMzbdeg8Qrqj3jbpkpltswNHtyF4R7Xe/zXDVDUJz8FJNhJdhBIxxvr3hZE8PwzTb5+OghFORUZfXQ4PmWfSx/Z11n3IC9xtXD3kBkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o70oWhqx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o70oWhqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2950DC4CEE9;
	Tue,  8 Apr 2025 15:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126160;
	bh=GSOhZSJXTqBDeMybmCwfGO34LVgry2NBtLmYpTfhtC4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o70oWhqxnwdJfNhdmmReZ+FwwD7RCKOS82aV9uMvdumvge79qWj5sy62pnH9BPqUP
	 Z2V4SUP9FARy9OECTeEn52hYR1wMuyQ/wRS058pNXy6huI78pLPhN8YqKH/3ZElxXx
	 covQHTE8aEKmPm8L/bh9zMOJfYU7kY4/X8gFEkzAIYmpX3OmgtYi8ey6c4mbf2svSN
	 7l3Av6qw9qyjf2xhejMs+lsdsIkZ6CSzaWds1j8z61t4AiRD3BB8MiSd1SDEBmIREU
	 sZLN1Npz6Lf+wqzigPX+sKcIoGkQGPaUOY4SfDKFBc9pMiloFwEL4R/4TWuo+Yyvgw
	 EC7u0js6KcRXQ==
From: Daniel Wagner <wagi@kernel.org>
Date: Tue, 08 Apr 2025 17:29:05 +0200
Subject: [PATCH 3/8] nvmet-fcloop: add ref counting to lport
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-nvmet-fcloop-part-one-v1-3-382ec97ab7eb@kernel.org>
References: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
In-Reply-To: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
 Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>
Cc: James Smart <jsmart2021@gmail.com>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The fcloop_lport objects live time is controlled by the user interface
add_local_port and del_local_port. nport, rport and tport objects are
pointing to the lport objects but here is no clear tracking. Let's
introduce an explicit ref counter for the lport objects and prepare the
stage for restructuring how lports are used.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 44 +++++++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index 67e24c7d59306fec4aa88cacc536c876c465af35..641201e62c1bafa13986642c6c4067b35f784edd 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -208,6 +208,7 @@ struct fcloop_lport {
 	struct nvme_fc_local_port *localport;
 	struct list_head lport_list;
 	struct completion unreg_done;
+	refcount_t ref;
 };
 
 struct fcloop_lport_priv {
@@ -994,6 +995,27 @@ fcloop_fcp_abort(struct nvme_fc_local_port *localport,
 	}
 }
 
+static void
+fcloop_lport_put(struct fcloop_lport *lport)
+{
+	unsigned long flags;
+
+	if (!refcount_dec_and_test(&lport->ref))
+		return;
+
+	spin_lock_irqsave(&fcloop_lock, flags);
+	list_del(&lport->lport_list);
+	spin_unlock_irqrestore(&fcloop_lock, flags);
+
+	kfree(lport);
+}
+
+static int
+fcloop_lport_get(struct fcloop_lport *lport)
+{
+	return refcount_inc_not_zero(&lport->ref);
+}
+
 static void
 fcloop_nport_put(struct fcloop_nport *nport)
 {
@@ -1017,6 +1039,8 @@ fcloop_localport_delete(struct nvme_fc_local_port *localport)
 
 	/* release any threads waiting for the unreg to complete */
 	complete(&lport->unreg_done);
+
+	fcloop_lport_put(lport);
 }
 
 static void
@@ -1128,6 +1152,7 @@ fcloop_create_local_port(struct device *dev, struct device_attribute *attr,
 
 		lport->localport = localport;
 		INIT_LIST_HEAD(&lport->lport_list);
+		refcount_set(&lport->ref, 1);
 
 		spin_lock_irqsave(&fcloop_lock, flags);
 		list_add_tail(&lport->lport_list, &fcloop_lports);
@@ -1144,13 +1169,6 @@ fcloop_create_local_port(struct device *dev, struct device_attribute *attr,
 	return ret ? ret : count;
 }
 
-
-static void
-__unlink_local_port(struct fcloop_lport *lport)
-{
-	list_del(&lport->lport_list);
-}
-
 static int
 __wait_localport_unreg(struct fcloop_lport *lport)
 {
@@ -1163,8 +1181,6 @@ __wait_localport_unreg(struct fcloop_lport *lport)
 	if (!ret)
 		wait_for_completion(&lport->unreg_done);
 
-	kfree(lport);
-
 	return ret;
 }
 
@@ -1187,8 +1203,9 @@ fcloop_delete_local_port(struct device *dev, struct device_attribute *attr,
 	list_for_each_entry(tlport, &fcloop_lports, lport_list) {
 		if (tlport->localport->node_name == nodename &&
 		    tlport->localport->port_name == portname) {
+			if (!fcloop_lport_get(tlport))
+				break;
 			lport = tlport;
-			__unlink_local_port(lport);
 			break;
 		}
 	}
@@ -1198,6 +1215,7 @@ fcloop_delete_local_port(struct device *dev, struct device_attribute *attr,
 		return -ENOENT;
 
 	ret = __wait_localport_unreg(lport);
+	fcloop_lport_put(lport);
 
 	return ret ? ret : count;
 }
@@ -1625,17 +1643,17 @@ static void __exit fcloop_exit(void)
 	for (;;) {
 		lport = list_first_entry_or_null(&fcloop_lports,
 						typeof(*lport), lport_list);
-		if (!lport)
+		if (!lport || !fcloop_lport_get(lport))
 			break;
 
-		__unlink_local_port(lport);
-
 		spin_unlock_irqrestore(&fcloop_lock, flags);
 
 		ret = __wait_localport_unreg(lport);
 		if (ret)
 			pr_warn("%s: Failed deleting local port\n", __func__);
 
+		fcloop_lport_put(lport);
+
 		spin_lock_irqsave(&fcloop_lock, flags);
 	}
 

-- 
2.49.0

