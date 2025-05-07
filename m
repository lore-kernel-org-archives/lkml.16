Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DDB26FA53
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620606; cv=none; b=RMyfegGLJQgRe4I+xqmoNmfASROYeomJGf2KMxVggilVjLZIkb0HUjeGLkHrvimpkURjlfV6ebsXLkYQSeLzPyRIn2ID/eKHV4IVJhjtFnafmEl5coG2k2o7W9QmO82aLsJLXfea/kIzYIoCUicI48X6E/62z0MaTxMh46JMa98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620606; c=relaxed/simple;
	bh=6b42JwnMURdt5WTJ46ewytcIr/A+kw+Ss9xMkw6/v2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mWYak6WGcq1JPk/lVQb4rs9JYKU+QSlt1sw2xOyNI53qOQ8yB4pNbdYuWnR98RLkE/2T6rqKz1NinUzIj5ytUFBAi4mbEzGJE8wqkS1i7NrQUjNxe5f2u0a3h9iWSPw7GCZEZ1t0oniwZuT62S2KJ2hasCcGlX0dWi8otq6pAV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSB+1aM7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSB+1aM7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E64C4CEEB;
	Wed,  7 May 2025 12:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746620605;
	bh=6b42JwnMURdt5WTJ46ewytcIr/A+kw+Ss9xMkw6/v2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iSB+1aM7jMplBaAZ5EVqgcIAvWm0z4oGtjQ3KMzqOxlY0KTK75ubKmtI02eEcO9AH
	 3096cqOZMGiU6pu1rtcKyKfqT8btRMpg4qoego/QvGEHuX7DRfIyNQp6WE/9XKcYv1
	 iRb2k/AoNCWnOmwBJkQdjsfDVSxSKeTGPYrLbFBN3EaEiGSTe5u8ZLqvOpwyrKeOso
	 cybwyQqqTOhqcusqqzV18JUFLIYIx/vX11ddy9n4VICJoCuKVPgN4HETEwtVseWnTX
	 J2ySLWdnYemrk3dICluN6nZ7um5AJroRjS94djSYNzN4TKcQtuaf2kyU5LEJ70FVss
	 LtOVQvwHayg0A==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 07 May 2025 14:23:04 +0200
Subject: [PATCH v6 08/14] nvmet-fcloop: prevent double port deletion
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nvmet-fcloop-v6-8-ca02e16fb018@kernel.org>
References: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
In-Reply-To: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The delete callback can be called either via the unregister function or
from the transport directly. Thus it is necessary ensure resources are
not freed multiple times.

Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index 9adaee3c7129f7e270842c5d09f78de2e108479a..c74baa7f6e43c8bddd9e6948f806f27b032b1d4d 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -215,6 +215,9 @@ struct fcloop_lport_priv {
 	struct fcloop_lport *lport;
 };
 
+/* The port is already being removed, avoid double free */
+#define PORT_DELETED	0
+
 struct fcloop_rport {
 	struct nvme_fc_remote_port	*remoteport;
 	struct nvmet_fc_target_port	*targetport;
@@ -223,6 +226,7 @@ struct fcloop_rport {
 	spinlock_t			lock;
 	struct list_head		ls_list;
 	struct work_struct		ls_work;
+	unsigned long			flags;
 };
 
 struct fcloop_tport {
@@ -233,6 +237,7 @@ struct fcloop_tport {
 	spinlock_t			lock;
 	struct list_head		ls_list;
 	struct work_struct		ls_work;
+	unsigned long			flags;
 };
 
 struct fcloop_nport {
@@ -1067,30 +1072,38 @@ static void
 fcloop_remoteport_delete(struct nvme_fc_remote_port *remoteport)
 {
 	struct fcloop_rport *rport = remoteport->private;
+	bool put_port = false;
 	unsigned long flags;
 
 	flush_work(&rport->ls_work);
 
 	spin_lock_irqsave(&fcloop_lock, flags);
+	if (!test_and_set_bit(PORT_DELETED, &rport->flags))
+		put_port = true;
 	rport->nport->rport = NULL;
 	spin_unlock_irqrestore(&fcloop_lock, flags);
 
-	fcloop_nport_put(rport->nport);
+	if (put_port)
+		fcloop_nport_put(rport->nport);
 }
 
 static void
 fcloop_targetport_delete(struct nvmet_fc_target_port *targetport)
 {
 	struct fcloop_tport *tport = targetport->private;
+	bool put_port = false;
 	unsigned long flags;
 
 	flush_work(&tport->ls_work);
 
 	spin_lock_irqsave(&fcloop_lock, flags);
+	if (!test_and_set_bit(PORT_DELETED, &tport->flags))
+		put_port = true;
 	tport->nport->tport = NULL;
 	spin_unlock_irqrestore(&fcloop_lock, flags);
 
-	fcloop_nport_put(tport->nport);
+	if (put_port)
+		fcloop_nport_put(tport->nport);
 }
 
 #define	FCLOOP_HW_QUEUES		4
@@ -1433,6 +1446,7 @@ fcloop_create_remote_port(struct device *dev, struct device_attribute *attr,
 	rport->nport = nport;
 	rport->lport = nport->lport;
 	nport->rport = rport;
+	rport->flags = 0;
 	spin_lock_init(&rport->lock);
 	INIT_WORK(&rport->ls_work, fcloop_rport_lsrqst_work);
 	INIT_LIST_HEAD(&rport->ls_list);
@@ -1530,6 +1544,7 @@ fcloop_create_target_port(struct device *dev, struct device_attribute *attr,
 	tport->nport = nport;
 	tport->lport = nport->lport;
 	nport->tport = tport;
+	tport->flags = 0;
 	spin_lock_init(&tport->lock);
 	INIT_WORK(&tport->ls_work, fcloop_tport_lsrqst_work);
 	INIT_LIST_HEAD(&tport->ls_list);

-- 
2.49.0

