Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B5C283C81
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285273; cv=none; b=ifI4ysi2iimglmR2SRkZYo5yEruX0IUj+RG/zsVd4KvVzY9GJ/PdDtu8bCDBtca5ivP9eiIUemzwkfHgFc6enChfmpkjxe9F0HL8UAweRjYwqLD7ew9/g2Srs7zKaxAVP9j6CDikmRuSbhV6pWCKZdKMjBLwB9XXphQ5+LgTyKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285273; c=relaxed/simple;
	bh=jEKbG5pfx1l0nP/U7lRUSa0XqnGWbsgWmnMw8er6V34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SJmSODIbkuP5XSbv3Eb2kpzKwbaZZ5Q3OYBVH+x+efLN+zP6Wsvt9bVLpKe8ZR5TSNXZtZsSZdLBsI1tjrXn8PPeB7lP9xAkVgMhP7Bm/Vv5JlgVpoyFqxa8doUFpuiGsPSy1GVu0t3Lrc1cWxBkZpcDkkhyihca3Hdc3amE1nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQVjMQqv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQVjMQqv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33504C4CEDD;
	Thu, 10 Apr 2025 11:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744285273;
	bh=jEKbG5pfx1l0nP/U7lRUSa0XqnGWbsgWmnMw8er6V34=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fQVjMQqvlaM7G3ik66t0tpAAYsYmtjv/eYkW9w6eC7whcI3G3wX883S8ZbJtQ3qg4
	 wqai5YH8XntLRQc2HJSq8tw32yipB53dilScRoY0dSeKfn38CGAA7G85yRut+JvXQ/
	 v7lV8uPhKIGsAPMFlZzezWLFoPyThVmbW0ITKUMRD5Nn+VRq8Y9BGGZUfYQhlFCdts
	 RGJRZX8TgHPIwHfqnbDDuFNJKrq3p3A9e0uTJBlsa6LCQtI8NH7iCDKHGbsUVtCG5V
	 IZxksDYve8srILpL7htQcm7j/PdPX0hIQ7Vj2xWJa8cVjl1OlCsEhNhe6MGHMNMJ5M
	 agQgdCwDvU9lg==
From: Daniel Wagner <wagi@kernel.org>
Date: Thu, 10 Apr 2025 13:41:04 +0200
Subject: [PATCH v4 01/14] nvmet-fcloop: track ref counts for nports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-nvmet-fcloop-v4-1-7e5c42b7b2cb@kernel.org>
References: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
In-Reply-To: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

A nport object is always used in association with targerport,
remoteport, tport and rport objects. Add explicit references for any of
the associated object. This ensures that nport is not removed too early
on shutdown sequences.

Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 133 +++++++++++++++++++++++++++++--------------
 1 file changed, 90 insertions(+), 43 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index 641201e62c1bafa13986642c6c4067b35f784edd..2b23e43ef4403fa4d70c66263f7750165d2ddc72 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -1047,8 +1047,14 @@ static void
 fcloop_remoteport_delete(struct nvme_fc_remote_port *remoteport)
 {
 	struct fcloop_rport *rport = remoteport->private;
+	unsigned long flags;
 
 	flush_work(&rport->ls_work);
+
+	spin_lock_irqsave(&fcloop_lock, flags);
+	rport->nport->rport = NULL;
+	spin_unlock_irqrestore(&fcloop_lock, flags);
+
 	fcloop_nport_put(rport->nport);
 }
 
@@ -1056,8 +1062,14 @@ static void
 fcloop_targetport_delete(struct nvmet_fc_target_port *targetport)
 {
 	struct fcloop_tport *tport = targetport->private;
+	unsigned long flags;
 
 	flush_work(&tport->ls_work);
+
+	spin_lock_irqsave(&fcloop_lock, flags);
+	tport->nport->tport = NULL;
+	spin_unlock_irqrestore(&fcloop_lock, flags);
+
 	fcloop_nport_put(tport->nport);
 }
 
@@ -1184,6 +1196,37 @@ __wait_localport_unreg(struct fcloop_lport *lport)
 	return ret;
 }
 
+static struct fcloop_nport *
+__fcloop_nport_lookup(u64 node_name, u64 port_name)
+{
+	struct fcloop_nport *nport;
+
+	list_for_each_entry(nport, &fcloop_nports, nport_list) {
+		if (nport->node_name != node_name ||
+		    nport->port_name != port_name)
+			continue;
+
+		if (fcloop_nport_get(nport))
+			return nport;
+
+		break;
+	}
+
+	return NULL;
+}
+
+static struct fcloop_nport *
+fcloop_nport_lookup(u64 node_name, u64 port_name)
+{
+	struct fcloop_nport *nport;
+	unsigned long flags;
+
+	spin_lock_irqsave(&fcloop_lock, flags);
+	nport = __fcloop_nport_lookup(node_name, port_name);
+	spin_unlock_irqrestore(&fcloop_lock, flags);
+
+	return nport;
+}
 
 static ssize_t
 fcloop_delete_local_port(struct device *dev, struct device_attribute *attr,
@@ -1365,6 +1408,8 @@ __unlink_remote_port(struct fcloop_nport *nport)
 {
 	struct fcloop_rport *rport = nport->rport;
 
+	lockdep_assert_held(&fcloop_lock);
+
 	if (rport && nport->tport)
 		nport->tport->remoteport = NULL;
 	nport->rport = NULL;
@@ -1377,9 +1422,6 @@ __unlink_remote_port(struct fcloop_nport *nport)
 static int
 __remoteport_unreg(struct fcloop_nport *nport, struct fcloop_rport *rport)
 {
-	if (!rport)
-		return -EALREADY;
-
 	return nvme_fc_unregister_remoteport(rport->remoteport);
 }
 
@@ -1387,8 +1429,8 @@ static ssize_t
 fcloop_delete_remote_port(struct device *dev, struct device_attribute *attr,
 		const char *buf, size_t count)
 {
-	struct fcloop_nport *nport = NULL, *tmpport;
-	static struct fcloop_rport *rport;
+	struct fcloop_nport *nport;
+	struct fcloop_rport *rport;
 	u64 nodename, portname;
 	unsigned long flags;
 	int ret;
@@ -1397,24 +1439,24 @@ fcloop_delete_remote_port(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&fcloop_lock, flags);
-
-	list_for_each_entry(tmpport, &fcloop_nports, nport_list) {
-		if (tmpport->node_name == nodename &&
-		    tmpport->port_name == portname && tmpport->rport) {
-			nport = tmpport;
-			rport = __unlink_remote_port(nport);
-			break;
-		}
-	}
+	nport = fcloop_nport_lookup(nodename, portname);
+	if (!nport)
+		return -ENOENT;
 
+	spin_lock_irqsave(&fcloop_lock, flags);
+	rport = __unlink_remote_port(nport);
 	spin_unlock_irqrestore(&fcloop_lock, flags);
 
-	if (!nport)
-		return -ENOENT;
+	if (!rport) {
+		ret = -ENOENT;
+		goto out_nport_put;
+	}
 
 	ret = __remoteport_unreg(nport, rport);
 
+out_nport_put:
+	fcloop_nport_put(nport);
+
 	return ret ? ret : count;
 }
 
@@ -1465,6 +1507,8 @@ __unlink_target_port(struct fcloop_nport *nport)
 {
 	struct fcloop_tport *tport = nport->tport;
 
+	lockdep_assert_held(&fcloop_lock);
+
 	if (tport && nport->rport)
 		nport->rport->targetport = NULL;
 	nport->tport = NULL;
@@ -1475,9 +1519,6 @@ __unlink_target_port(struct fcloop_nport *nport)
 static int
 __targetport_unreg(struct fcloop_nport *nport, struct fcloop_tport *tport)
 {
-	if (!tport)
-		return -EALREADY;
-
 	return nvmet_fc_unregister_targetport(tport->targetport);
 }
 
@@ -1485,8 +1526,8 @@ static ssize_t
 fcloop_delete_target_port(struct device *dev, struct device_attribute *attr,
 		const char *buf, size_t count)
 {
-	struct fcloop_nport *nport = NULL, *tmpport;
-	struct fcloop_tport *tport = NULL;
+	struct fcloop_nport *nport;
+	struct fcloop_tport *tport;
 	u64 nodename, portname;
 	unsigned long flags;
 	int ret;
@@ -1495,24 +1536,24 @@ fcloop_delete_target_port(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&fcloop_lock, flags);
-
-	list_for_each_entry(tmpport, &fcloop_nports, nport_list) {
-		if (tmpport->node_name == nodename &&
-		    tmpport->port_name == portname && tmpport->tport) {
-			nport = tmpport;
-			tport = __unlink_target_port(nport);
-			break;
-		}
-	}
+	nport = fcloop_nport_lookup(nodename, portname);
+	if (!nport)
+		return -ENOENT;
 
+	spin_lock_irqsave(&fcloop_lock, flags);
+	tport = __unlink_target_port(nport);
 	spin_unlock_irqrestore(&fcloop_lock, flags);
 
-	if (!nport)
-		return -ENOENT;
+	if (!tport) {
+		ret = -ENOENT;
+		goto out_nport_put;
+	}
 
 	ret = __targetport_unreg(nport, tport);
 
+out_nport_put:
+	fcloop_nport_put(nport);
+
 	return ret ? ret : count;
 }
 
@@ -1609,8 +1650,8 @@ static int __init fcloop_init(void)
 
 static void __exit fcloop_exit(void)
 {
-	struct fcloop_lport *lport = NULL;
-	struct fcloop_nport *nport = NULL;
+	struct fcloop_lport *lport;
+	struct fcloop_nport *nport;
 	struct fcloop_tport *tport;
 	struct fcloop_rport *rport;
 	unsigned long flags;
@@ -1621,7 +1662,7 @@ static void __exit fcloop_exit(void)
 	for (;;) {
 		nport = list_first_entry_or_null(&fcloop_nports,
 						typeof(*nport), nport_list);
-		if (!nport)
+		if (!nport || !fcloop_nport_get(nport))
 			break;
 
 		tport = __unlink_target_port(nport);
@@ -1629,13 +1670,19 @@ static void __exit fcloop_exit(void)
 
 		spin_unlock_irqrestore(&fcloop_lock, flags);
 
-		ret = __targetport_unreg(nport, tport);
-		if (ret)
-			pr_warn("%s: Failed deleting target port\n", __func__);
+		if (tport) {
+			ret = __targetport_unreg(nport, tport);
+			if (ret)
+				pr_warn("%s: Failed deleting target port\n", __func__);
+		}
 
-		ret = __remoteport_unreg(nport, rport);
-		if (ret)
-			pr_warn("%s: Failed deleting remote port\n", __func__);
+		if (rport) {
+			ret = __remoteport_unreg(nport, rport);
+			if (ret)
+				pr_warn("%s: Failed deleting remote port\n", __func__);
+		}
+
+		fcloop_nport_put(nport);
 
 		spin_lock_irqsave(&fcloop_lock, flags);
 	}

-- 
2.49.0

