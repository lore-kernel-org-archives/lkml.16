Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4229618C031
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414549; cv=none; b=km7SiJ7BO0N92InN5HvtL1cVuqVYq8kLNSJRzdiEtpkjqyODMVYUF4TfOkqJIyHlzG0Hz8sbsiWcGBWqEGyfRDKDQEYSAJ1CjfKsYprPaInoWF9WN7YHMhRbLLjN71T+LdyYIuvmGWV+kykJPYEDBldhnx/BFLnicINPutYeszU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414549; c=relaxed/simple;
	bh=fBx9lCEtPCxPfGwK8FPJiN/ERtJIwVRE9R9bu+NJtAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BjDN3zTEhSYq83YCgmcdGKxsBMHTczbR5+SU79+QrE2OwrWZzoezcjZiAlWH+Odh0HxuJjC/kWRceb4QObL6OMDtcr/b5SM2E6fbjBDtGjJo4oSQID0F//jKVhpHAEK8kYLZvfr54jy2kqGvurL49kc15wVCylSMcIP6vHOnG18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBAhs1Qa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBAhs1Qa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502BFC4CEE2;
	Wed, 23 Apr 2025 13:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745414548;
	bh=fBx9lCEtPCxPfGwK8FPJiN/ERtJIwVRE9R9bu+NJtAM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nBAhs1QauQlO5/VyrKfXeDnPaNIJQu5EmlYHYU12HhYnam5ZaSr0DW2eITK9TkEin
	 FQg5FLSINfaW75mZIjlRfgrKtMOeIUXsW62zwzaB9ouzjSy8rygTBQ2c1P8+cnAMgq
	 ISCvZVuR9r0L20G1iB7obW2K38mV8590YroSixgV+cvR3rD5+P21B0Ivk1JtNQ1Ays
	 /pAo0xjlyiiBei8+VX0h+CO/KJjSs5Sf213S2WhCL5AB+V+VwbMuC1V3AlyZUBMJFV
	 /8LeQyatOTuSExjwFzcArFihYTEUGyWU+BkasUsNhOM9QudbfGgbajui5yRjIT5uW3
	 15/aq9F75CmWw==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 23 Apr 2025 15:21:56 +0200
Subject: [PATCH v5 13/14] nvmet-fc: take tgtport refs for portentry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-nvmet-fcloop-v5-13-3d7f968728a5@kernel.org>
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
In-Reply-To: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

Ensure that the tgtport is not going away as long portentry has a
pointer on it.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fc.c | 44 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 75ddb7425605dd6623db38a133b63e201592354c..2835772677f9486324ef77d9021b49f8d153e916 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1254,6 +1254,7 @@ nvmet_fc_portentry_bind(struct nvmet_fc_tgtport *tgtport,
 {
 	lockdep_assert_held(&nvmet_fc_tgtlock);
 
+	nvmet_fc_tgtport_get(tgtport);
 	pe->tgtport = tgtport;
 	tgtport->pe = pe;
 
@@ -1273,8 +1274,10 @@ nvmet_fc_portentry_unbind(struct nvmet_fc_port_entry *pe)
 	unsigned long flags;
 
 	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
-	if (pe->tgtport)
+	if (pe->tgtport) {
+		nvmet_fc_tgtport_put(pe->tgtport);
 		pe->tgtport->pe = NULL;
+	}
 	list_del(&pe->pe_list);
 	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 }
@@ -1292,8 +1295,10 @@ nvmet_fc_portentry_unbind_tgt(struct nvmet_fc_tgtport *tgtport)
 
 	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 	pe = tgtport->pe;
-	if (pe)
+	if (pe) {
+		nvmet_fc_tgtport_put(pe->tgtport);
 		pe->tgtport = NULL;
+	}
 	tgtport->pe = NULL;
 	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 }
@@ -1316,6 +1321,9 @@ nvmet_fc_portentry_rebind_tgt(struct nvmet_fc_tgtport *tgtport)
 	list_for_each_entry(pe, &nvmet_fc_portentry_list, pe_list) {
 		if (tgtport->fc_target_port.node_name == pe->node_name &&
 		    tgtport->fc_target_port.port_name == pe->port_name) {
+			if (!nvmet_fc_tgtport_get(tgtport))
+				continue;
+
 			WARN_ON(pe->tgtport);
 			tgtport->pe = pe;
 			pe->tgtport = tgtport;
@@ -2887,12 +2895,17 @@ nvmet_fc_add_port(struct nvmet_port *port)
 	list_for_each_entry(tgtport, &nvmet_fc_target_list, tgt_list) {
 		if ((tgtport->fc_target_port.node_name == traddr.nn) &&
 		    (tgtport->fc_target_port.port_name == traddr.pn)) {
+			if (!nvmet_fc_tgtport_get(tgtport))
+				continue;
+
 			/* a FC port can only be 1 nvmet port id */
 			if (!tgtport->pe) {
 				nvmet_fc_portentry_bind(tgtport, pe, port);
 				ret = 0;
 			} else
 				ret = -EALREADY;
+
+			nvmet_fc_tgtport_put(tgtport);
 			break;
 		}
 	}
@@ -2908,11 +2921,21 @@ static void
 nvmet_fc_remove_port(struct nvmet_port *port)
 {
 	struct nvmet_fc_port_entry *pe = port->priv;
+	struct nvmet_fc_tgtport *tgtport = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
+	if (pe->tgtport && nvmet_fc_tgtport_get(pe->tgtport))
+		tgtport = pe->tgtport;
+	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
 
 	nvmet_fc_portentry_unbind(pe);
 
-	/* terminate any outstanding associations */
-	__nvmet_fc_free_assocs(pe->tgtport);
+	if (tgtport) {
+		/* terminate any outstanding associations */
+		__nvmet_fc_free_assocs(tgtport);
+		nvmet_fc_tgtport_put(tgtport);
+	}
 
 	kfree(pe);
 }
@@ -2921,10 +2944,21 @@ static void
 nvmet_fc_discovery_chg(struct nvmet_port *port)
 {
 	struct nvmet_fc_port_entry *pe = port->priv;
-	struct nvmet_fc_tgtport *tgtport = pe->tgtport;
+	struct nvmet_fc_tgtport *tgtport = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
+	if (pe->tgtport && nvmet_fc_tgtport_get(pe->tgtport))
+		tgtport = pe->tgtport;
+	spin_unlock_irqrestore(&nvmet_fc_tgtlock, flags);
+
+	if (!tgtport)
+		return;
 
 	if (tgtport && tgtport->ops->discovery_event)
 		tgtport->ops->discovery_event(&tgtport->fc_target_port);
+
+	nvmet_fc_tgtport_put(tgtport);
 }
 
 static ssize_t

-- 
2.49.0

