Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43911D6DDC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 20:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745094627; cv=none; b=CNHDyaK+Gc7duRZbX/7iLOskpDjBMDGxo+ePOlWcNBF3NBtjdKqJTHUehZoOb3ib9OqGQHSqeB8NKaNsSkUnJb7Mxe+hFJFWH8ezspQAGLlEeq6XR/ZMC71Shz+rB50tHxfj4ENMLKPqPFyYDCd0pRNBLu5iXpoyxwk/XPY9a1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745094627; c=relaxed/simple;
	bh=STyx56NA1YwJOljgymz59PoP1p3F/YygXwFutu4RaQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6EzhPln4t25P3TERlUB1RAjwXKeQTQ+wmvMGtKp40X94MjKtWrkx2DpxJptklpuArFXJp/TWvaGof8eM1+OvJuoiSuRnifNaOKGMNIdv3lzPMtWBtCcuDEQcYrMCWxutTe8p6jqUpvFAcK8Bnz9JL7rO7ZjoMiwE4f+Jp/p2a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=suOFjsj4; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="suOFjsj4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=7p3sUtZd1UxqbaJbfMSi/4twDz73vBfI65lsIu11u6w=; b=suOFjsj4yTSQRrON
	ZHpKLTelq2/E/kObAl01gI8OvmpCelCYBjhJ3x5WMn0w8A2xnrC1Pq/mC2F7i+ScIHLp44kR7SeTF
	NgE+CXpIX4CJd229LGltFO/sSLXj1/1Q6N7BiN3jvM+ifEZ64uto1VlNx2LtFy2QJLE4lMh7lRkLg
	0mr3TvtdFuOl1kw52n6Rpd35AxJGenr8HMLKRMhP8kHt5Gjjr6bI4J6zqhBs2fzObp3zoJjCA1DZz
	4mjbXY336z33DbllQ8maUGFTeGNp3mF0a9Ci0oEKmFWYUtk5RVmECjva9V8eg/JPXMb0dGMwNu4hC
	eRcERIe7ft1HssRzfQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u6EpJ-00Cg8b-2c;
	Sat, 19 Apr 2025 20:30:13 +0000
From: linux@treblig.org
To: akpm@linux-foundation.org,
	mporter@kernel.crashing.org,
	alex.bou9@gmail.com
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/2] rapidio: remove some dead defines
Date: Sat, 19 Apr 2025 21:30:11 +0100
Message-ID: <20250419203012.429787-2-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419203012.429787-1-linux@treblig.org>
References: <20250419203012.429787-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'mport_dma_buf', 'rio_mport_dma_map' and 'MPORT_MAX_DMA_BUFS' were
added in the original
commit e8de370188d0 ("rapidio: add mport char device driver")
but never used.

'rio_cm_work' was unused since the original
commit b6e8d4aa1110 ("rapidio: add RapidIO channelized messaging
driver")
but never used.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/rapidio/devices/rio_mport_cdev.c | 20 --------------------
 drivers/rapidio/rio_cm.c                 |  6 ------
 2 files changed, 26 deletions(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index cbf531d0ba68..995cfeca972b 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -97,18 +97,6 @@ module_param(dbg_level, uint, S_IWUSR | S_IWGRP | S_IRUGO);
 MODULE_PARM_DESC(dbg_level, "Debugging output level (default 0 = none)");
 #endif
 
-/*
- * An internal DMA coherent buffer
- */
-struct mport_dma_buf {
-	void		*ib_base;
-	dma_addr_t	ib_phys;
-	u32		ib_size;
-	u64		ib_rio_base;
-	bool		ib_map;
-	struct file	*filp;
-};
-
 /*
  * Internal memory mapping structure
  */
@@ -131,14 +119,6 @@ struct rio_mport_mapping {
 	struct file *filp;
 };
 
-struct rio_mport_dma_map {
-	int valid;
-	u64 length;
-	void *vaddr;
-	dma_addr_t paddr;
-};
-
-#define MPORT_MAX_DMA_BUFS	16
 #define MPORT_EVENT_DEPTH	10
 
 /*
diff --git a/drivers/rapidio/rio_cm.c b/drivers/rapidio/rio_cm.c
index 9135227301c8..97287e838ce1 100644
--- a/drivers/rapidio/rio_cm.c
+++ b/drivers/rapidio/rio_cm.c
@@ -198,12 +198,6 @@ struct cm_peer {
 	struct rio_dev *rdev;
 };
 
-struct rio_cm_work {
-	struct work_struct work;
-	struct cm_dev *cm;
-	void *data;
-};
-
 struct conn_req {
 	struct list_head node;
 	u32 destid;	/* requester destID */
-- 
2.49.0

