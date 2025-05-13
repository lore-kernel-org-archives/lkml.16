Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD4BA93D;
	Tue, 13 May 2025 05:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115786; cv=none; b=Wa3tTyyhiNwxDnZi5hUhCJWjSMLhJgd5mwBPLvWqlBJfMIz47vQf/FdHOv9TlBnKkIYr/d0oOjlRcHhxTjxPxFZA9aOEePM+c6X/qA7yOmy22lZunGAJNoVAwty/dRf2k6qutMzvRDCgPctJEb7yA/JZsRc2QTu3Waof3KI2Wcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115786; c=relaxed/simple;
	bh=Kbe+ZVs81pmLEKZAZ64Ljiw+NCwxqvnzZd2vosGCqsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YdrOgvrzOGYwMaoy4j4eNwIEUEtjiJX2TrpCFNGBKypWxikdLqi78etTWssbmMD58Z1cfK3PZUkURmUTll0EpNgsX2QR/64WDKayhW2ZViP5O4ciF2AwWU+ABXy8lVMndr413Cn+rhAZ4Hd57jyM+93HhPbkNU1Oy+zGeIeWYgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IBqJWnrS; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IBqJWnrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=k3
	KdO32Xef/ole/MDnIXs/cHJ+2Fkq7D4+Ef6rLcfQU=; b=IBqJWnrS9v9I8uEoM+
	P6guSn9UiAJF3cgBx4Oz3kifYMHwAYWTCbSiu6k+yFjFfhfxluSIdMxFd+7BQWU5
	6NJ5Po0kogERkqyGphdvwC2qRSD1fmRKS6ameOTYcWysZthpKOpGepgPahBBBypc
	wkMlFOMmTAooNfERXTUMofH/g=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD31eyp3iJofw8rBA--.8313S4;
	Tue, 13 May 2025 13:55:05 +0800 (CST)
From: David Wang <00107082@163.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: stern@rowland.harvard.edu,
	surenb@google.com,
	kent.overstreet@linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Wang <00107082@163.com>
Subject: [PATCH 1/2] USB: core: add a memory pool to urb for host-controller private data
Date: Tue, 13 May 2025 13:54:47 +0800
Message-Id: <20250513055447.5696-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250512150724.4560-1-00107082@163.com>
References: <20250512150724.4560-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD31eyp3iJofw8rBA--.8313S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXry5Ar1xGw47ur1rWFWxWFg_yoW5KF4fpF
	4xJ3s3tF1rXrW3ZrZ5Gan7Za1rJ3Wkuryjkryfu345Zr17tw18Z3Z7tFyrGr9xtr4Sq3ya
	qFsFg3Z8Ww1UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEpVbDUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkBBMqmgi3P4zxwAAs6

URB objects have long lifecycle, an urb can be reused between
enqueue-dequeue loops; The private data needed by some host controller
has very short lifecycle, the memory is alloced when enqueue, and
released when dequeue. For example, on a system with xhci, several
minutes of usage of webcam/keyboard/mouse have memory alloc counts:
  drivers/usb/core/urb.c:75 [usbcore] func:usb_alloc_urb 661
  drivers/usb/host/xhci.c:1555 [xhci_hcd] func:xhci_urb_enqueue 424863
Memory allocation frequency for host-controller private data can reach
~1k/s.

High frequent allocations for host-controller private data can be
avoided if urb take over the ownership of memory, the memory then shares
the longer lifecycle with urb objects.

Add a mempool to urb for hcpriv usage, the memory inherits the memory
flags from urb object itself, and will grow if larger size is requested.

Signed-off-by: David Wang <00107082@163.com>
---
 drivers/usb/core/urb.c | 23 +++++++++++++++++++++++
 include/linux/usb.h    |  4 ++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 5e52a35486af..7c13b971b435 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -23,6 +23,7 @@ static void urb_destroy(struct kref *kref)
 
 	if (urb->transfer_flags & URB_FREE_BUFFER)
 		kfree(urb->transfer_buffer);
+	kfree(urb->hcpriv_mempool);
 
 	kfree(urb);
 }
@@ -77,6 +78,7 @@ struct urb *usb_alloc_urb(int iso_packets, gfp_t mem_flags)
 	if (!urb)
 		return NULL;
 	usb_init_urb(urb);
+	urb->hcpriv_mempool_flags = mem_flags;
 	return urb;
 }
 EXPORT_SYMBOL_GPL(usb_alloc_urb);
@@ -1037,3 +1039,24 @@ int usb_anchor_empty(struct usb_anchor *anchor)
 
 EXPORT_SYMBOL_GPL(usb_anchor_empty);
 
+/**
+ * urb_hcpriv_mempool_zalloc - alloc memory from mempool for hcpriv
+ * @urb: pointer to URB being used
+ * @size: memory size requested by current host controller
+ *
+ * Return: NULL if out of memory, otherwise memory are zeroed
+ */
+void *urb_hcpriv_mempool_zalloc(struct urb *urb, size_t size)
+{
+	if (urb->hcpriv_mempool_size < size) {
+		kfree(urb->hcpriv_mempool);
+		urb->hcpriv_mempool_size = size;
+		urb->hcpriv_mempool = kmalloc(size, urb->hcpriv_mempool_flags);
+	}
+	if (urb->hcpriv_mempool)
+		memset(urb->hcpriv_mempool, 0, size);
+	else
+		urb->hcpriv_mempool_size = 0;
+	return urb->hcpriv_mempool;
+}
+EXPORT_SYMBOL_GPL(urb_hcpriv_mempool_zalloc);
diff --git a/include/linux/usb.h b/include/linux/usb.h
index b46738701f8d..a31535f3b2bc 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1602,6 +1602,9 @@ struct urb {
 	struct kref kref;		/* reference count of the URB */
 	int unlinked;			/* unlink error code */
 	void *hcpriv;			/* private data for host controller */
+	void *hcpriv_mempool;           /* cache for host controller's private data */
+	size_t hcpriv_mempool_size;     /* current size of the memory pool */
+	gfp_t hcpriv_mempool_flags;     /* mem flags for memory pool */
 	atomic_t use_count;		/* concurrent submissions counter */
 	atomic_t reject;		/* submissions will fail */
 
@@ -1790,6 +1793,7 @@ extern int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
 extern struct urb *usb_get_from_anchor(struct usb_anchor *anchor);
 extern void usb_scuttle_anchored_urbs(struct usb_anchor *anchor);
 extern int usb_anchor_empty(struct usb_anchor *anchor);
+extern void *urb_hcpriv_mempool_zalloc(struct urb *urb, size_t size);
 
 #define usb_unblock_urb	usb_unpoison_urb
 
-- 
2.39.2

