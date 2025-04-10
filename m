Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014212836A6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285279; cv=none; b=nCLl7Hd/vDoqrIOs1UMLBg30KAAIrzQXrI80leet1EVzXLaRJPfro344kjs9toSIVcja9IBtkhx2x2k9AZf4ktoeuyh58ltPMS/qP0Dtijk4Jpw40rUr7aVJVOzaz+qLH/NKLGEARzMhZn25Oi69hu+/kOmVd3QOprmwSUlpeDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285279; c=relaxed/simple;
	bh=Xe+d02CG83R08Gc8sX/2gu0ycajhZ1Rrr/zsZ5RfWWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZS3PBhiQU3BVqyUs8Q4dWsYtOapvRFTrXnOROcphCbyd+JqfR2V37aNgqubkN2hYSS6XEevWTHi47vZ0cwFmQzRnUJQK/CwEjDBbVzSvtnYvuLHiwPE/W3clgUn9hYoxE+cFuheARnfzhi6O0Ap968+swjXV/4Uq/HF7BHQNoTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEKmiB0q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEKmiB0q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3318BC4CEDD;
	Thu, 10 Apr 2025 11:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744285278;
	bh=Xe+d02CG83R08Gc8sX/2gu0ycajhZ1Rrr/zsZ5RfWWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BEKmiB0qDeXrnAlF9JeulniDcVleD+VAadq+5N5Ky03i1q5spabCXmIu+xwAa3kcE
	 mqA8SkBKiGBAQm6yrJTBzE4B0jyBsBD+QCcE7hKSQ2N/3dA+RcTCIVlcov7O/yXjhv
	 6Wk7OCXDB90OGqdC0LEsrtvkcnLQ654glqbPdAXPYkQimgjHzEPhWcafiawIqZFjPP
	 bTYCk1o87Nz/ekWrYF4vHmOGDz9fsRzomTEi9pymG6v0iXkoUjef5i3YAz64UmM4+W
	 nRuWU2t+k41oYOgYwqnYmX5ywAbEG4Wubr7tJGp8sMC1EqEmfTzB5sxjwl4TDbb2g2
	 x0NEAF0LaA6Hg==
From: Daniel Wagner <wagi@kernel.org>
Date: Thu, 10 Apr 2025 13:41:06 +0200
Subject: [PATCH v4 03/14] nvmet-fcloop: refactor fcloop_nport_alloc and
 track lport
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-nvmet-fcloop-v4-3-7e5c42b7b2cb@kernel.org>
References: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
In-Reply-To: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The checks for a valid input values are mixed with the logic to insert a
newly allocated nport. Refactor the function so that first the checks
are done.

This allows to untangle the setup steps into a more linear form which
reduces the complexity of the functions.

Also start tracking lport when a lport is assigned to a nport. This
ensures, that the lport is not going away as long it is still referenced
by a nport.

Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 107 ++++++++++++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 43 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index 2cce7649af276528360395b6d58f03183c11da20..a8134127ad8087190d674251a88545da3f8800d7 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -1028,6 +1028,9 @@ fcloop_nport_put(struct fcloop_nport *nport)
 	list_del(&nport->nport_list);
 	spin_unlock_irqrestore(&fcloop_lock, flags);
 
+	if (nport->lport)
+		fcloop_lport_put(nport->lport);
+
 	kfree(nport);
 }
 
@@ -1234,6 +1237,25 @@ fcloop_nport_lookup(u64 node_name, u64 port_name)
 	return nport;
 }
 
+static struct fcloop_lport *
+__fcloop_lport_lookup(u64 node_name, u64 port_name)
+{
+	struct fcloop_lport *lport;
+
+	list_for_each_entry(lport, &fcloop_lports, lport_list) {
+		if (lport->localport->node_name != node_name ||
+		    lport->localport->port_name != port_name)
+			continue;
+
+		if (fcloop_lport_get(lport))
+			return lport;
+
+		break;
+	}
+
+	return NULL;
+}
+
 static ssize_t
 fcloop_delete_local_port(struct device *dev, struct device_attribute *attr,
 		const char *buf, size_t count)
@@ -1272,8 +1294,8 @@ fcloop_delete_local_port(struct device *dev, struct device_attribute *attr,
 static struct fcloop_nport *
 fcloop_alloc_nport(const char *buf, size_t count, bool remoteport)
 {
-	struct fcloop_nport *newnport, *nport = NULL;
-	struct fcloop_lport *tmplport, *lport = NULL;
+	struct fcloop_nport *newnport, *nport;
+	struct fcloop_lport *lport;
 	struct fcloop_ctrl_options *opts;
 	unsigned long flags;
 	u32 opts_mask = (remoteport) ? RPORT_OPTS : TGTPORT_OPTS;
@@ -1288,10 +1310,8 @@ fcloop_alloc_nport(const char *buf, size_t count, bool remoteport)
 		goto out_free_opts;
 
 	/* everything there ? */
-	if ((opts->mask & opts_mask) != opts_mask) {
-		ret = -EINVAL;
+	if ((opts->mask & opts_mask) != opts_mask)
 		goto out_free_opts;
-	}
 
 	newnport = kzalloc(sizeof(*newnport), GFP_KERNEL);
 	if (!newnport)
@@ -1307,60 +1327,61 @@ fcloop_alloc_nport(const char *buf, size_t count, bool remoteport)
 	refcount_set(&newnport->ref, 1);
 
 	spin_lock_irqsave(&fcloop_lock, flags);
-
-	list_for_each_entry(tmplport, &fcloop_lports, lport_list) {
-		if (tmplport->localport->node_name == opts->wwnn &&
-		    tmplport->localport->port_name == opts->wwpn)
-			goto out_invalid_opts;
-
-		if (tmplport->localport->node_name == opts->lpwwnn &&
-		    tmplport->localport->port_name == opts->lpwwpn)
-			lport = tmplport;
+	lport = __fcloop_lport_lookup(opts->wwnn, opts->wwpn);
+	if (lport) {
+		/* invalid configuration */
+		fcloop_lport_put(lport);
+		goto out_free_newnport;
 	}
 
 	if (remoteport) {
-		if (!lport)
-			goto out_invalid_opts;
-		newnport->lport = lport;
-	}
-
-	list_for_each_entry(nport, &fcloop_nports, nport_list) {
-		if (nport->node_name == opts->wwnn &&
-		    nport->port_name == opts->wwpn) {
-			if ((remoteport && nport->rport) ||
-			    (!remoteport && nport->tport)) {
-				nport = NULL;
-				goto out_invalid_opts;
-			}
-
-			fcloop_nport_get(nport);
-
-			spin_unlock_irqrestore(&fcloop_lock, flags);
-
-			if (remoteport)
-				nport->lport = lport;
-			if (opts->mask & NVMF_OPT_ROLES)
-				nport->port_role = opts->roles;
-			if (opts->mask & NVMF_OPT_FCADDR)
-				nport->port_id = opts->fcaddr;
+		lport = __fcloop_lport_lookup(opts->lpwwnn, opts->lpwwpn);
+		if (!lport) {
+			/* invalid configuration */
 			goto out_free_newnport;
 		}
 	}
 
-	list_add_tail(&newnport->nport_list, &fcloop_nports);
+	nport = __fcloop_nport_lookup(opts->wwnn, opts->wwpn);
+	if (nport) {
+		if ((remoteport && nport->rport) ||
+		    (!remoteport && nport->tport)) {
+			/* invalid configuration */
+			goto out_put_nport;
+		}
 
+		/* found existing nport, discard the new nport */
+		kfree(newnport);
+	} else {
+		list_add_tail(&newnport->nport_list, &fcloop_nports);
+		nport = newnport;
+	}
+
+	if (opts->mask & NVMF_OPT_ROLES)
+		nport->port_role = opts->roles;
+	if (opts->mask & NVMF_OPT_FCADDR)
+		nport->port_id = opts->fcaddr;
+	if (lport) {
+		if (!nport->lport)
+			nport->lport = lport;
+		else
+			fcloop_lport_put(lport);
+	}
 	spin_unlock_irqrestore(&fcloop_lock, flags);
 
 	kfree(opts);
-	return newnport;
+	return nport;
 
-out_invalid_opts:
-	spin_unlock_irqrestore(&fcloop_lock, flags);
+out_put_nport:
+	if (lport)
+		fcloop_lport_put(lport);
+	fcloop_nport_put(nport);
 out_free_newnport:
+	spin_unlock_irqrestore(&fcloop_lock, flags);
 	kfree(newnport);
 out_free_opts:
 	kfree(opts);
-	return nport;
+	return NULL;
 }
 
 static ssize_t

-- 
2.49.0

