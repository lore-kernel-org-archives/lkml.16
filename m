Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBE1297A74
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714058; cv=none; b=o7oN1gd0gehyTv7kVygxH0MRL8PFyiQicjFutvZYPq2TykS/XEmJglyGsbe3xJEif27AuIRE6DYiQc2hlOwUlKI14ZX9vOjS9tSyMNL6eHmcbUl6U6I9iZ4tlfNn+i9koBokHvGCGU90sbMsAMQk1DMj4r+pDZtb7z49hIQOR+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714058; c=relaxed/simple;
	bh=T9slXBAR22xoLwO+KBOZQZ0eKk88bBGuj28lxMgau2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HC+hk3npi1xTZBRdrp9p6u1WJayfMIeCjSB/mBfsnXw3rFwu/7xSHgprEatiHmQKu0+rVkx8u/BclWSvg94QcZdtyQ3309xvhY2FQpAj4Qfqz+Jy9XgMiR/RZwxzYeSVS1BqIU9fnJ9bjqcz8EG5va4ruAYWGlFA3fhtHIKnBs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Quz54wp4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Quz54wp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8BEC4CEDD;
	Tue, 15 Apr 2025 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744714057;
	bh=T9slXBAR22xoLwO+KBOZQZ0eKk88bBGuj28lxMgau2E=;
	h=From:To:Cc:Subject:Date:From;
	b=Quz54wp4GprCiYbyM6RSe5ER+4yH5ehKTxFU0GE1sNr6B2+xbZ8fb/3CkbN6ib9Bj
	 quV7RJ5qioZ+0O1LoNKjSLuq83TOKscFLkcEfwdDYNoro/gN1J9qaJ2FhtNpRmBexq
	 wwkE4xr288Z/U/HgmuOmRcz1LV5KKVvfY7bvfuH/DuVWRQtCNAEZiZXJGARC/LRKY1
	 8SIw+xC9VpNE/6Mr7qqBkVajTPG1lGR3hvoNUW3aBE6DCRlpvcp4e96S522lYIunLw
	 fGjKMtdCXdajJsy7lhhxcm14FZezZCRBFJIALgpUMZvzDNnnM3qYVk718F6r1GNgfV
	 4Uq6ZglVl9Zhg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: nipun.gupta@amd.com
Cc: tglx@linutronix.de,
	maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>
Subject: [PATCH] irqdomain: cdx: Switch to of_fwnode_handle()
Date: Tue, 15 Apr 2025 12:47:34 +0200
Message-ID: <20250415104734.106849-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
defined of_fwnode_handle(). The former is in the process of being
removed, so use the latter instead.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Nipun Gupta <nipun.gupta@amd.com>
Cc: Nikhil Agarwal <nikhil.agarwal@amd.com>
---
This is an indepent patch, please apply directly.

The patch was previously a part of a large series [1], but I would like
maintainers to feed the independent parts through their trees.

[1] https://lore.kernel.org/all/20250319092951.37667-1-jirislaby@kernel.org/
---
 drivers/cdx/cdx_msi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
index 06d723978232..3388a5d1462c 100644
--- a/drivers/cdx/cdx_msi.c
+++ b/drivers/cdx/cdx_msi.c
@@ -165,7 +165,7 @@ struct irq_domain *cdx_msi_domain_init(struct device *dev)
 	struct device_node *parent_node;
 	struct irq_domain *parent;
 
-	fwnode_handle = of_node_to_fwnode(np);
+	fwnode_handle = of_fwnode_handle(np);
 
 	parent_node = of_parse_phandle(np, "msi-map", 1);
 	if (!parent_node) {
@@ -173,7 +173,7 @@ struct irq_domain *cdx_msi_domain_init(struct device *dev)
 		return NULL;
 	}
 
-	parent = irq_find_matching_fwnode(of_node_to_fwnode(parent_node), DOMAIN_BUS_NEXUS);
+	parent = irq_find_matching_fwnode(of_fwnode_handle(parent_node), DOMAIN_BUS_NEXUS);
 	if (!parent || !msi_get_domain_info(parent)) {
 		dev_err(dev, "unable to locate ITS domain\n");
 		return NULL;
-- 
2.49.0

