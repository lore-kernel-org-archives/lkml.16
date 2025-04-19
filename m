Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1701D2F53
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745094626; cv=none; b=OoN8hjOuxxrES7n0dofoUXyYxFBRmxgATLvS4a4bNOReZ+EGOWZfFRPqC1RJ/UwaqqiZZGPfd9NQOnE797pcjURCoGj+ghS55odK7JjuU3S6BzmADb5AsnUVFkYH3tE+SnOOjQH67fvH0lrBfgs4Q+Zu42OVizgXRDtrJSmwkbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745094626; c=relaxed/simple;
	bh=2CIAszDB7ZJxwRzcye2XQ1vUCixxKrUOEYlOnI5l2JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIuCTlhqIrCooL+oplEReBJ27tp3AZLDSi7S3r+dbmLuPs8yuAI41htqD54/IPK/HZ5l5r14w3SuhIW75i4k+DeM69SV6FJ7+4JtGW7KpF4x+mCvC+Y4YUIxBL5NkwoKAYtK5RM/7GngKhtXZPoOlKbvPQHyNxWUVxflebG1UnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=VGcS6B0g; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="VGcS6B0g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=AOEseO5UbKeYD96HkHlNU9eweGvwfdW/Kxp0JaNQ7F0=; b=VGcS6B0gUODrO3+s
	wF/RaXO65CfH7E6Oi5ou6rqVqFpdZTZtGJj9VkcW0mmJ2zC7TCEWELWXHQ9rp3PvC0YzsbA9essS+
	j/6xnwuWMvEsE0C61NERHXYqEWFY21HX0ofjBkkqfb/8rYG5B2FqV771oiKGDaBrAX2Eypk+X9Lef
	WqJRxsWzVj2xvCP6MlrNyRYcaC3B2VL8C0F8NkCeCkZGK0Sk77bAnkxPbn6Nmaa2Q4mMChrYwf+nw
	YvYDWmxMMEtXh7kUPpj/3SJeUKwCoTEAXeJicV3QQGUCDuZkTe2psL/sGa56EJaJGlYlaB0+uoTup
	2lHALzCkd+MOOzFZxw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u6EpK-00Cg8b-1L;
	Sat, 19 Apr 2025 20:30:14 +0000
From: linux@treblig.org
To: akpm@linux-foundation.org,
	mporter@kernel.crashing.org,
	alex.bou9@gmail.com
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/2] rapidio: Remove unused functions
Date: Sat, 19 Apr 2025 21:30:12 +0100
Message-ID: <20250419203012.429787-3-linux@treblig.org>
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

rio_request_dma() and rio_dma_prep_slave_sg() were added in 2012 by
commit e42d98ebe7d7 ("rapidio: add DMA engine support for RIO data
transfers")
but never used.

rio_find_mport() last use was removed in 2013 by
commit 9edbc30b434f ("rapidio: update enumerator registration mechanism")

rio_unregister_scan() was added in 2013 by
commit a11650e11093 ("rapidio: make enumeration/discovery configurable")
but never used.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/rapidio/rio.c   | 103 ----------------------------------------
 drivers/rapidio/rio.h   |   2 -
 include/linux/rio_drv.h |   5 --
 3 files changed, 110 deletions(-)

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index 9544b8ee0c96..46daf32ea13b 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -1774,19 +1774,6 @@ struct dma_chan *rio_request_mport_dma(struct rio_mport *mport)
 }
 EXPORT_SYMBOL_GPL(rio_request_mport_dma);
 
-/**
- * rio_request_dma - request RapidIO capable DMA channel that supports
- *   specified target RapidIO device.
- * @rdev: RIO device associated with DMA transfer
- *
- * Returns pointer to allocated DMA channel or NULL if failed.
- */
-struct dma_chan *rio_request_dma(struct rio_dev *rdev)
-{
-	return rio_request_mport_dma(rdev->net->hport);
-}
-EXPORT_SYMBOL_GPL(rio_request_dma);
-
 /**
  * rio_release_dma - release specified DMA channel
  * @dchan: DMA channel to release
@@ -1834,56 +1821,8 @@ struct dma_async_tx_descriptor *rio_dma_prep_xfer(struct dma_chan *dchan,
 }
 EXPORT_SYMBOL_GPL(rio_dma_prep_xfer);
 
-/**
- * rio_dma_prep_slave_sg - RapidIO specific wrapper
- *   for device_prep_slave_sg callback defined by DMAENGINE.
- * @rdev: RIO device control structure
- * @dchan: DMA channel to configure
- * @data: RIO specific data descriptor
- * @direction: DMA data transfer direction (TO or FROM the device)
- * @flags: dmaengine defined flags
- *
- * Initializes RapidIO capable DMA channel for the specified data transfer.
- * Uses DMA channel private extension to pass information related to remote
- * target RIO device.
- *
- * Returns: pointer to DMA transaction descriptor if successful,
- *          error-valued pointer or NULL if failed.
- */
-struct dma_async_tx_descriptor *rio_dma_prep_slave_sg(struct rio_dev *rdev,
-	struct dma_chan *dchan, struct rio_dma_data *data,
-	enum dma_transfer_direction direction, unsigned long flags)
-{
-	return rio_dma_prep_xfer(dchan,	rdev->destid, data, direction, flags);
-}
-EXPORT_SYMBOL_GPL(rio_dma_prep_slave_sg);
-
 #endif /* CONFIG_RAPIDIO_DMA_ENGINE */
 
-/**
- * rio_find_mport - find RIO mport by its ID
- * @mport_id: number (ID) of mport device
- *
- * Given a RIO mport number, the desired mport is located
- * in the global list of mports. If the mport is found, a pointer to its
- * data structure is returned.  If no mport is found, %NULL is returned.
- */
-struct rio_mport *rio_find_mport(int mport_id)
-{
-	struct rio_mport *port;
-
-	mutex_lock(&rio_mport_list_lock);
-	list_for_each_entry(port, &rio_mports, node) {
-		if (port->id == mport_id)
-			goto found;
-	}
-	port = NULL;
-found:
-	mutex_unlock(&rio_mport_list_lock);
-
-	return port;
-}
-
 /**
  * rio_register_scan - enumeration/discovery method registration interface
  * @mport_id: mport device ID for which fabric scan routine has to be set
@@ -1961,48 +1900,6 @@ int rio_register_scan(int mport_id, struct rio_scan *scan_ops)
 }
 EXPORT_SYMBOL_GPL(rio_register_scan);
 
-/**
- * rio_unregister_scan - removes enumeration/discovery method from mport
- * @mport_id: mport device ID for which fabric scan routine has to be
- *            unregistered (RIO_MPORT_ANY = apply to all mports that use
- *            the specified scan_ops)
- * @scan_ops: enumeration/discovery operations structure
- *
- * Removes enumeration or discovery method assigned to the specified mport
- * device. If RIO_MPORT_ANY is specified, removes the specified operations from
- * all mports that have them attached.
- */
-int rio_unregister_scan(int mport_id, struct rio_scan *scan_ops)
-{
-	struct rio_mport *port;
-	struct rio_scan_node *scan;
-
-	pr_debug("RIO: %s for mport_id=%d\n", __func__, mport_id);
-
-	if (mport_id != RIO_MPORT_ANY && mport_id >= RIO_MAX_MPORTS)
-		return -EINVAL;
-
-	mutex_lock(&rio_mport_list_lock);
-
-	list_for_each_entry(port, &rio_mports, node)
-		if (port->id == mport_id ||
-		    (mport_id == RIO_MPORT_ANY && port->nscan == scan_ops))
-			port->nscan = NULL;
-
-	list_for_each_entry(scan, &rio_scans, node) {
-		if (scan->mport_id == mport_id) {
-			list_del(&scan->node);
-			kfree(scan);
-			break;
-		}
-	}
-
-	mutex_unlock(&rio_mport_list_lock);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(rio_unregister_scan);
-
 /**
  * rio_mport_scan - execute enumeration/discovery on the specified mport
  * @mport_id: number (ID) of mport device
diff --git a/drivers/rapidio/rio.h b/drivers/rapidio/rio.h
index f482de0d0370..a0e2a09ddb8e 100644
--- a/drivers/rapidio/rio.h
+++ b/drivers/rapidio/rio.h
@@ -41,9 +41,7 @@ extern void rio_del_device(struct rio_dev *rdev, enum rio_device_state state);
 extern int rio_enable_rx_tx_port(struct rio_mport *port, int local, u16 destid,
 				 u8 hopcount, u8 port_num);
 extern int rio_register_scan(int mport_id, struct rio_scan *scan_ops);
-extern int rio_unregister_scan(int mport_id, struct rio_scan *scan_ops);
 extern void rio_attach_device(struct rio_dev *rdev);
-extern struct rio_mport *rio_find_mport(int mport_id);
 extern int rio_mport_scan(int mport_id);
 
 /* Structures internal to the RIO core code */
diff --git a/include/linux/rio_drv.h b/include/linux/rio_drv.h
index e49c32b0f394..dd8afe511242 100644
--- a/include/linux/rio_drv.h
+++ b/include/linux/rio_drv.h
@@ -391,13 +391,8 @@ struct rio_dev *rio_dev_get(struct rio_dev *);
 void rio_dev_put(struct rio_dev *);
 
 #ifdef CONFIG_RAPIDIO_DMA_ENGINE
-extern struct dma_chan *rio_request_dma(struct rio_dev *rdev);
 extern struct dma_chan *rio_request_mport_dma(struct rio_mport *mport);
 extern void rio_release_dma(struct dma_chan *dchan);
-extern struct dma_async_tx_descriptor *rio_dma_prep_slave_sg(
-		struct rio_dev *rdev, struct dma_chan *dchan,
-		struct rio_dma_data *data,
-		enum dma_transfer_direction direction, unsigned long flags);
 extern struct dma_async_tx_descriptor *rio_dma_prep_xfer(
 		struct dma_chan *dchan,	u16 destid,
 		struct rio_dma_data *data,
-- 
2.49.0

