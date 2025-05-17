Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918632581;
	Sat, 17 May 2025 08:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747470995; cv=none; b=Kv2WNzPn514oi9XWeCvD03PrWY6nJ6hZrY66VP4HfVtmvFWuzvfD2NEt3TF0yE437Ex1L2DyL3PQ0X0o0gUjsTHZRy3OK82mu+f55KAche3w8tFZsp1XUEV/bom7Uo//LjLtKcpvHWgPrD7cm6MzjNRUoboePSlfacS4rBXVPIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747470995; c=relaxed/simple;
	bh=FuYd1quEjWlTUddvHV5PWIiQz01t2FOLxj0MwYm1KMg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g8/ecz1FTNPkKyLwhix9SprpoDvG1mLUfLABw6FId2gMHj2WxNJl7vYZxilMcUz+eekc5VGa00U5W9gS0O1NnUg58Q9+IaG+aXnTFaKYONNd9gBTxjg0PtPkw/OZBCTwKoA6PjaJ65oxhuPaLt9YTkLCjbwvyC4OpQCXrUh6Or8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TtxTEE1q; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TtxTEE1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5t
	6mYNPUiC+VwT0d7hvui4Car5obr9bgjGKLCKCD4Ik=; b=TtxTEE1quubbGMb0x+
	njPG3iwDGelKwC2wG8LpEsuodSJpMJcVyOyXDLnUgTRqViMMGuhA2qFgwOSkgl2Q
	ivb6q3BnDAhdzXuvjeqEZ16BaYlLxwDdrhcstUEbk7inpu2md3VqJeLXVNttATD6
	aa5qKBuLGI+PxEzwgmyokEleY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCn8yRMSihoUAlGCA--.21541S4;
	Sat, 17 May 2025 16:35:38 +0800 (CST)
From: David Wang <00107082@163.com>
To: =gregkh@linuxfoundation.org,
	mathias.nyman@intel.com
Cc: oneukum@suse.com,
	stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Wang <00107082@163.com>
Subject: [PATCH v3 1/2] USB: core: add a memory pool to urb caching host-controller private data
Date: Sat, 17 May 2025 16:35:22 +0800
Message-Id: <20250517083523.5917-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCn8yRMSihoUAlGCA--.21541S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF17Aw4DZry5WrW7ArWDArb_yoWrtFWkpF
	4fGwn3tF1rXrW3JrZ3Jan7CayrJ3Wv9FyjkFyfu345ZwnFyw18A3Z2kFyrGr9xtr4ftwsI
	qF4qqFn8Ww1UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE8nYUUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqBFQqmgoQ9CvLgAAsR

---
Changes since v2:
1. activat the pool only when the urb object is created via
usb_alloc_urb()
Thanks to Oliver Neukum <oneukum@suse.com>'s review.
---
URB objects have long lifecycle, an urb can be reused between
submit loops; The private data needed by some host controller
has very short lifecycle, the memory is alloced when enqueue, and
released when dequeue. For example, on a system with xhci, in
xhci_urb_enqueue:
Using a USB webcam would have ~250/s memory allocation;
Using a USB mic would have ~1K/s memory allocation;

High frequent allocations for host-controller private data can be
avoided if urb take over the ownership of memory, the memory then shares
the longer lifecycle with urb objects.

Add a mempool to urb for hcpriv usage, the mempool only holds one block
of memory and grows when larger size is requested.

The mempool is activated only when the URB object is created via
usb_alloc_urb() in case some drivers create a URB object by other
means and manage it lifecycle without corresponding usb_free_urb.

The performance difference with this change is insignificant when
system is under no memory pressure or under heavy memory pressure.
There could be a point inbetween where extra 1k/s memory alloction
would dominate the preformance, but very hard to pinpoint it.

Signed-off-by: David Wang <00107082@163.com>
---
 drivers/usb/core/urb.c | 45 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb.h    |  5 +++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 5e52a35486af..53117743150f 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -23,6 +23,8 @@ static void urb_destroy(struct kref *kref)
 
 	if (urb->transfer_flags & URB_FREE_BUFFER)
 		kfree(urb->transfer_buffer);
+	if (urb->hcpriv_mempool_activated)
+		kfree(urb->hcpriv_mempool);
 
 	kfree(urb);
 }
@@ -77,6 +79,8 @@ struct urb *usb_alloc_urb(int iso_packets, gfp_t mem_flags)
 	if (!urb)
 		return NULL;
 	usb_init_urb(urb);
+	/* activate hcpriv mempool when urb is created via usb_alloc_urb */
+	urb->hcpriv_mempool_activated = true;
 	return urb;
 }
 EXPORT_SYMBOL_GPL(usb_alloc_urb);
@@ -1037,3 +1041,44 @@ int usb_anchor_empty(struct usb_anchor *anchor)
 
 EXPORT_SYMBOL_GPL(usb_anchor_empty);
 
+/**
+ * urb_hcpriv_mempool_zalloc - alloc memory from mempool for hcpriv
+ * @urb: pointer to URB being used
+ * @size: memory size requested by current host controller
+ * @mem_flags: the type of memory to allocate
+ *
+ * Return: NULL if out of memory, otherwise memory are zeroed
+ */
+void *urb_hcpriv_mempool_zalloc(struct urb *urb, size_t size, gfp_t mem_flags)
+{
+	if (!urb->hcpriv_mempool_activated)
+		return kzalloc(size, mem_flags);
+
+	if (urb->hcpriv_mempool_size < size) {
+		kfree(urb->hcpriv_mempool);
+		urb->hcpriv_mempool_size = size;
+		urb->hcpriv_mempool = kmalloc(size, mem_flags);
+	}
+	if (urb->hcpriv_mempool)
+		memset(urb->hcpriv_mempool, 0, size);
+	else
+		urb->hcpriv_mempool_size = 0;
+	return urb->hcpriv_mempool;
+}
+EXPORT_SYMBOL_GPL(urb_hcpriv_mempool_zalloc);
+
+/**
+ * urb_free_hcpriv - free hcpriv data if necessary
+ * @urb: pointer to URB being used
+ *
+ * If mempool is activated, private data's lifecycle
+ * is managed by urb object.
+ */
+void urb_free_hcpriv(struct urb *urb)
+{
+	if (!urb->hcpriv_mempool_activated) {
+		kfree(urb->hcpriv);
+		urb->hcpriv = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(urb_free_hcpriv);
diff --git a/include/linux/usb.h b/include/linux/usb.h
index b46738701f8d..27bc394b8141 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1602,6 +1602,9 @@ struct urb {
 	struct kref kref;		/* reference count of the URB */
 	int unlinked;			/* unlink error code */
 	void *hcpriv;			/* private data for host controller */
+	void *hcpriv_mempool;           /* a single slot of cache for HCD's private data */
+	size_t hcpriv_mempool_size;     /* current size of the memory pool */
+	bool hcpriv_mempool_activated;  /* flag the mempool usage */
 	atomic_t use_count;		/* concurrent submissions counter */
 	atomic_t reject;		/* submissions will fail */
 
@@ -1790,6 +1793,8 @@ extern int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
 extern struct urb *usb_get_from_anchor(struct usb_anchor *anchor);
 extern void usb_scuttle_anchored_urbs(struct usb_anchor *anchor);
 extern int usb_anchor_empty(struct usb_anchor *anchor);
+extern void *urb_hcpriv_mempool_zalloc(struct urb *urb, size_t size, gfp_t mem_flags);
+extern void urb_free_hcpriv(struct urb *urb);
 
 #define usb_unblock_urb	usb_unpoison_urb
 
-- 
2.39.2

