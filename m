Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE05E2AE6D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 23:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749424145; cv=none; b=IydlG4WJjfxvoA30AevDuURPfjLxQp0fhDSRWzEEaERcxfHWomonWyPuxAckczGbWUqn9Mh5HRREE+Mt0ceO+wYoqXOmXHJI+YjK6ZikGwf2BH6HoZ/6csqTgeq+qtHf+6TboO8RFMmmu+QhpGzXCfKQxnEzwU+izf003TfblDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749424145; c=relaxed/simple;
	bh=eHIc/r2kJL8Bf3OZTdnVJuSsvTjZcUX7pWON43k4PBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nn5E2yDMYEj/FLqqalRht7jDtDj4s4v2CfY5mJE73y3931BtdidqPLjBisFivfS+Cx5ePzGkKAF1DGuoat4pTMvCZF77aE4/fmISYQrUl6jeb99VVj4qN2hmLgmiaOoTCfbrweMFdN9jhqR8BZ8nDg73W5eSS8DxxP+IKaNxmNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=sAlPPgLB; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="sAlPPgLB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=1XordT2+tifrABW/XWsOYg0WlgNHPQUd2W5FWs01AX4=; b=sAlPPgLBiYjbAxZe
	4dS0FIIB1on/Vl2RHZ6URYqUHEkhrC5aFOqlSI2mlH5uBfmcPvU1pABZTEG25FlrJ3ELokfkztEZE
	5KjLmYmF2DgFhfjJPL8xUy3laMQuhqVSZM1HWLSzUB4brJTwf7UgZgXO61O3YC0KSPxEnH+7wJ8ME
	nvAHbSK5DHKT/QC5GB3Cv6vKuNJArr5wD2MQPfFJtwmiLlarkd5mT2ObK1Kh/MelQ2lsTDICLoLkj
	O9Y9ByohqJM8xs6VyopYQOCNeyF5XUWOmJ3XicNX2t5xsJI7jlsO1DR8vEYeImve2mFsocfYDPCl6
	ZPeZ1J1Bo0a4dPh1Tw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uOP8B-008IgC-0V;
	Sun, 08 Jun 2025 23:08:47 +0000
From: linux@treblig.org
To: richard@nod.at,
	chengzhihao1@huawei.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ubifs: Remove uncallable debug code
Date: Mon,  9 Jun 2025 00:08:46 +0100
Message-ID: <20250608230846.166822-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ubifs_dump_budget_req() and ubifs_dump_index() have been unused
since they were originally added back in 2008's
commit 1e51764a3c2a ("UBIFS: add new flash file system")

They were renamed from dbg_dump_budget_req() and dbg_dump_index() in
2012.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 fs/ubifs/debug.c | 36 ------------------------------------
 fs/ubifs/debug.h |  2 --
 2 files changed, 38 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index b01f382ce8db..05124392d1d9 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -580,23 +580,6 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node, int node_len)
 	spin_unlock(&dbg_lock);
 }
 
-void ubifs_dump_budget_req(const struct ubifs_budget_req *req)
-{
-	spin_lock(&dbg_lock);
-	pr_err("Budgeting request: new_ino %d, dirtied_ino %d\n",
-	       req->new_ino, req->dirtied_ino);
-	pr_err("\tnew_ino_d   %d, dirtied_ino_d %d\n",
-	       req->new_ino_d, req->dirtied_ino_d);
-	pr_err("\tnew_page    %d, dirtied_page %d\n",
-	       req->new_page, req->dirtied_page);
-	pr_err("\tnew_dent    %d, mod_dent     %d\n",
-	       req->new_dent, req->mod_dent);
-	pr_err("\tidx_growth  %d\n", req->idx_growth);
-	pr_err("\tdata_growth %d dd_growth     %d\n",
-	       req->data_growth, req->dd_growth);
-	spin_unlock(&dbg_lock);
-}
-
 void ubifs_dump_lstats(const struct ubifs_lp_stats *lst)
 {
 	spin_lock(&dbg_lock);
@@ -963,25 +946,6 @@ void ubifs_dump_tnc(struct ubifs_info *c)
 	pr_err("(pid %d) finish dumping TNC tree\n", current->pid);
 }
 
-static int dump_znode(struct ubifs_info *c, struct ubifs_znode *znode,
-		      void *priv)
-{
-	ubifs_dump_znode(c, znode);
-	return 0;
-}
-
-/**
- * ubifs_dump_index - dump the on-flash index.
- * @c: UBIFS file-system description object
- *
- * This function dumps whole UBIFS indexing B-tree, unlike 'ubifs_dump_tnc()'
- * which dumps only in-memory znodes and does not read znodes which from flash.
- */
-void ubifs_dump_index(struct ubifs_info *c)
-{
-	dbg_walk_index(c, NULL, dump_znode, NULL);
-}
-
 /**
  * dbg_save_space_info - save information about flash space.
  * @c: UBIFS file-system description object
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index d425861e6b82..1d5c8ee8b64a 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -245,7 +245,6 @@ const char *dbg_snprintf_key(const struct ubifs_info *c,
 void ubifs_dump_inode(struct ubifs_info *c, const struct inode *inode);
 void ubifs_dump_node(const struct ubifs_info *c, const void *node,
 		     int node_len);
-void ubifs_dump_budget_req(const struct ubifs_budget_req *req);
 void ubifs_dump_lstats(const struct ubifs_lp_stats *lst);
 void ubifs_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi);
 void ubifs_dump_lprop(const struct ubifs_info *c,
@@ -260,7 +259,6 @@ void ubifs_dump_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap,
 void ubifs_dump_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 		      struct ubifs_nnode *parent, int iip);
 void ubifs_dump_tnc(struct ubifs_info *c);
-void ubifs_dump_index(struct ubifs_info *c);
 void ubifs_dump_lpt_lebs(const struct ubifs_info *c);
 
 int dbg_walk_index(struct ubifs_info *c, dbg_leaf_callback leaf_cb,
-- 
2.49.0

