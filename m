Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C7A2260C
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738200423; cv=none; b=N8azDRoa4s+SMSCejvb2o9Z0WQpuj8aExLAk+2XML7DVOYlbVB5xZdFRlBLEli8TZieIKuuN/lKzo2LJg0OOK2wb0OHQUif4veBvcfNVQKOkvBbCaTnjv4Dfh0TCn0jUj8KktcwVH1NxZq9GFSwbxrRM1VTeu/0Ek+NyAUa510g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738200423; c=relaxed/simple;
	bh=90fgKKvuC44VvwbFu5RhMZfLd41S9q3L87wt1HK0Go4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rsd+oQC7aWUDdGl/lv4LcS2UwnR6fdYbGvrcKyfXMVZ6ynhAY7ikb1xTzciEo3rZ9hGlluTGHUkeHecaJd+mW8dZSSiphQd/jPNjLxxnRPDVUvS12PkOedZRuXna4A7AoSTxwJYfDqw3+9tDycDZD9xCWZhm2ZM2diGtDyaGp8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=DfrKXpp7; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="DfrKXpp7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=6lwXsviHOVSi0K8darppFr793wf9q6unxMP8s2epLPI=; b=DfrKXpp7wArDMjS2
	GXCtT1fRLNLh2SYKvmn5f3eaBZxCTeNmB13p3A+BaYPWUrf3iWUO/Q27AwmJAJdwnaNbYW5ayefSQ
	ObZqNownL/asRIlpVaw5DL9TtdcvT6OJG58xyeD7pqZwBjRrwtv2eyOIogFxUlag6Mh5GAsYX+a08
	8IyvfSlJm1pCgiHO6NHt6pisyU8R0U6P4wEZZBcrGTWmMLBJS1fYNDA3Bekj7fFAeYY7EZ0pFL7nN
	37oDe4oXylXNo6Z2yr9/C9cxRZRLzp9io7774YilXQq7Ke+pvIHtC1CpZK+dAA/dRX+clQLdvw/kL
	fPyrzQydEbMTEHrxiw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tdJKY-00Cjk1-22;
	Thu, 30 Jan 2025 01:26:54 +0000
From: linux@treblig.org
To: alexander.usyskin@intel.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] mei: Remove unused functions
Date: Thu, 30 Jan 2025 01:26:54 +0000
Message-ID: <20250130012654.255119-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The following functions have been in the mei code for
a long time but have never been used.

mei_txe_setup_satt2() was added in 2014 by
commit 32e2b59fca2c ("mei: txe: add hw-txe.c")

mei_me_cl_rm_by_uuid_id() was added in 2015 by
commit 79563db9ddd3 ("mei: add reference counting for me clients")

mei_cldev_uuid() was added in 2015 by
commit baeacd037697 ("mei: bus: export uuid and protocol version to mei_cl
bus drivers")

mei_cldev_recv_nonblock() was added in 2016 by
commit 076802d00615 ("mei: bus: enable non-blocking RX")
it is the only user of mei_cldev_recv_nonblock_vtag().

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/misc/mei/bus.c     | 52 --------------------------------------
 drivers/misc/mei/client.c  | 22 ----------------
 drivers/misc/mei/client.h  |  2 --
 drivers/misc/mei/hw-txe.c  | 45 ---------------------------------
 drivers/misc/mei/hw-txe.h  |  2 --
 include/linux/mei_cl_bus.h |  5 ----
 6 files changed, 128 deletions(-)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 718ec5d81d94..67176caf5416 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -323,28 +323,6 @@ ssize_t mei_cldev_recv_vtag(struct mei_cl_device *cldev, u8 *buf, size_t length,
 }
 EXPORT_SYMBOL_GPL(mei_cldev_recv_vtag);
 
-/**
- * mei_cldev_recv_nonblock_vtag - non block client receive with vtag (read)
- *
- * @cldev: me client device
- * @buf: buffer to receive
- * @length: buffer length
- * @vtag: virtual tag
- *
- * Return:
- * * read size in bytes
- * * -EAGAIN if function will block.
- * * < 0 on other error
- */
-ssize_t mei_cldev_recv_nonblock_vtag(struct mei_cl_device *cldev, u8 *buf,
-				     size_t length, u8 *vtag)
-{
-	struct mei_cl *cl = cldev->cl;
-
-	return __mei_cl_recv(cl, buf, length, vtag, MEI_CL_IO_RX_NONBLOCK, 0);
-}
-EXPORT_SYMBOL_GPL(mei_cldev_recv_nonblock_vtag);
-
 /**
  * mei_cldev_recv_timeout - client receive with timeout (read)
  *
@@ -438,23 +416,6 @@ ssize_t mei_cldev_recv(struct mei_cl_device *cldev, u8 *buf, size_t length)
 }
 EXPORT_SYMBOL_GPL(mei_cldev_recv);
 
-/**
- * mei_cldev_recv_nonblock - non block client receive (read)
- *
- * @cldev: me client device
- * @buf: buffer to receive
- * @length: buffer length
- *
- * Return: read size in bytes of < 0 on error
- *         -EAGAIN if function will block.
- */
-ssize_t mei_cldev_recv_nonblock(struct mei_cl_device *cldev, u8 *buf,
-				size_t length)
-{
-	return mei_cldev_recv_nonblock_vtag(cldev, buf, length, NULL);
-}
-EXPORT_SYMBOL_GPL(mei_cldev_recv_nonblock);
-
 /**
  * mei_cl_bus_rx_work - dispatch rx event for a bus device
  *
@@ -640,19 +601,6 @@ void mei_cldev_set_drvdata(struct mei_cl_device *cldev, void *data)
 }
 EXPORT_SYMBOL_GPL(mei_cldev_set_drvdata);
 
-/**
- * mei_cldev_uuid - return uuid of the underlying me client
- *
- * @cldev: mei client device
- *
- * Return: me client uuid
- */
-const uuid_le *mei_cldev_uuid(const struct mei_cl_device *cldev)
-{
-	return mei_me_cl_uuid(cldev->me_cl);
-}
-EXPORT_SYMBOL_GPL(mei_cldev_uuid);
-
 /**
  * mei_cldev_ver - return protocol version of the underlying me client
  *
diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
index be011cef12e5..3db07d2a881f 100644
--- a/drivers/misc/mei/client.c
+++ b/drivers/misc/mei/client.c
@@ -271,28 +271,6 @@ void mei_me_cl_rm_by_uuid(struct mei_device *dev, const uuid_le *uuid)
 	up_write(&dev->me_clients_rwsem);
 }
 
-/**
- * mei_me_cl_rm_by_uuid_id - remove all me clients matching client id
- *
- * @dev: the device structure
- * @uuid: me client uuid
- * @id: me client id
- *
- * Locking: called under "dev->device_lock" lock
- */
-void mei_me_cl_rm_by_uuid_id(struct mei_device *dev, const uuid_le *uuid, u8 id)
-{
-	struct mei_me_client *me_cl;
-
-	dev_dbg(dev->dev, "remove %pUl %d\n", uuid, id);
-
-	down_write(&dev->me_clients_rwsem);
-	me_cl = __mei_me_cl_by_uuid_id(dev, uuid, id);
-	__mei_me_cl_del(dev, me_cl);
-	mei_me_cl_put(me_cl);
-	up_write(&dev->me_clients_rwsem);
-}
-
 /**
  * mei_me_cl_rm_all - remove all me clients
  *
diff --git a/drivers/misc/mei/client.h b/drivers/misc/mei/client.h
index 9052860bcfe0..01ed26a148c4 100644
--- a/drivers/misc/mei/client.h
+++ b/drivers/misc/mei/client.h
@@ -29,8 +29,6 @@ struct mei_me_client *mei_me_cl_by_id(struct mei_device *dev, u8 client_id);
 struct mei_me_client *mei_me_cl_by_uuid_id(struct mei_device *dev,
 					   const uuid_le *uuid, u8 client_id);
 void mei_me_cl_rm_by_uuid(struct mei_device *dev, const uuid_le *uuid);
-void mei_me_cl_rm_by_uuid_id(struct mei_device *dev,
-			     const uuid_le *uuid, u8 id);
 void mei_me_cl_rm_all(struct mei_device *dev);
 
 /**
diff --git a/drivers/misc/mei/hw-txe.c b/drivers/misc/mei/hw-txe.c
index 5d0f68b95c29..e9476f9ae25d 100644
--- a/drivers/misc/mei/hw-txe.c
+++ b/drivers/misc/mei/hw-txe.c
@@ -1209,48 +1209,3 @@ struct mei_device *mei_txe_dev_init(struct pci_dev *pdev)
 
 	return dev;
 }
-
-/**
- * mei_txe_setup_satt2 - SATT2 configuration for DMA support.
- *
- * @dev:   the device structure
- * @addr:  physical address start of the range
- * @range: physical range size
- *
- * Return: 0 on success an error code otherwise
- */
-int mei_txe_setup_satt2(struct mei_device *dev, phys_addr_t addr, u32 range)
-{
-	struct mei_txe_hw *hw = to_txe_hw(dev);
-
-	u32 lo32 = lower_32_bits(addr);
-	u32 hi32 = upper_32_bits(addr);
-	u32 ctrl;
-
-	/* SATT is limited to 36 Bits */
-	if (hi32 & ~0xF)
-		return -EINVAL;
-
-	/* SATT has to be 16Byte aligned */
-	if (lo32 & 0xF)
-		return -EINVAL;
-
-	/* SATT range has to be 4Bytes aligned */
-	if (range & 0x4)
-		return -EINVAL;
-
-	/* SATT is limited to 32 MB range*/
-	if (range > SATT_RANGE_MAX)
-		return -EINVAL;
-
-	ctrl = SATT2_CTRL_VALID_MSK;
-	ctrl |= hi32  << SATT2_CTRL_BR_BASE_ADDR_REG_SHIFT;
-
-	mei_txe_br_reg_write(hw, SATT2_SAP_SIZE_REG, range);
-	mei_txe_br_reg_write(hw, SATT2_BRG_BA_LSB_REG, lo32);
-	mei_txe_br_reg_write(hw, SATT2_CTRL_REG, ctrl);
-	dev_dbg(dev->dev, "SATT2: SAP_SIZE_OFFSET=0x%08X, BRG_BA_LSB_OFFSET=0x%08X, CTRL_OFFSET=0x%08X\n",
-		range, lo32, ctrl);
-
-	return 0;
-}
diff --git a/drivers/misc/mei/hw-txe.h b/drivers/misc/mei/hw-txe.h
index 96511b04bf88..6790e646895d 100644
--- a/drivers/misc/mei/hw-txe.h
+++ b/drivers/misc/mei/hw-txe.h
@@ -59,7 +59,5 @@ irqreturn_t mei_txe_irq_thread_handler(int irq, void *dev_id);
 
 int mei_txe_aliveness_set_sync(struct mei_device *dev, u32 req);
 
-int mei_txe_setup_satt2(struct mei_device *dev, phys_addr_t addr, u32 range);
-
 
 #endif /* _MEI_HW_TXE_H_ */
diff --git a/include/linux/mei_cl_bus.h b/include/linux/mei_cl_bus.h
index b38a56a13f39..725fd7727422 100644
--- a/include/linux/mei_cl_bus.h
+++ b/include/linux/mei_cl_bus.h
@@ -97,8 +97,6 @@ ssize_t mei_cldev_send(struct mei_cl_device *cldev, const u8 *buf,
 ssize_t mei_cldev_send_timeout(struct mei_cl_device *cldev, const u8 *buf,
 			       size_t length, unsigned long timeout);
 ssize_t mei_cldev_recv(struct mei_cl_device *cldev, u8 *buf, size_t length);
-ssize_t mei_cldev_recv_nonblock(struct mei_cl_device *cldev, u8 *buf,
-				size_t length);
 ssize_t mei_cldev_recv_timeout(struct mei_cl_device *cldev, u8 *buf, size_t length,
 			       unsigned long timeout);
 ssize_t mei_cldev_send_vtag(struct mei_cl_device *cldev, const u8 *buf,
@@ -107,8 +105,6 @@ ssize_t mei_cldev_send_vtag_timeout(struct mei_cl_device *cldev, const u8 *buf,
 				    size_t length, u8 vtag, unsigned long timeout);
 ssize_t mei_cldev_recv_vtag(struct mei_cl_device *cldev, u8 *buf, size_t length,
 			    u8 *vtag);
-ssize_t mei_cldev_recv_nonblock_vtag(struct mei_cl_device *cldev, u8 *buf,
-				     size_t length, u8 *vtag);
 ssize_t mei_cldev_recv_vtag_timeout(struct mei_cl_device *cldev, u8 *buf, size_t length,
 			    u8 *vtag, unsigned long timeout);
 
@@ -116,7 +112,6 @@ int mei_cldev_register_rx_cb(struct mei_cl_device *cldev, mei_cldev_cb_t rx_cb);
 int mei_cldev_register_notif_cb(struct mei_cl_device *cldev,
 				mei_cldev_cb_t notif_cb);
 
-const uuid_le *mei_cldev_uuid(const struct mei_cl_device *cldev);
 u8 mei_cldev_ver(const struct mei_cl_device *cldev);
 
 void *mei_cldev_get_drvdata(const struct mei_cl_device *cldev);
-- 
2.48.1

