Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342D928CF7E;
	Tue, 13 May 2025 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747136365; cv=none; b=hOyFJAELjcClF/AxwZrOvckn6b9on4psCTg6dB99XES7y1xJkyo/31rbB7mPs9mlawBjDB18gtFSCS9wSy8HDzjYk29F7qGyAlLQN/7IakqaY+lW6MgNq0rreBij2VC788iwCPiaYB6CSw9EDRsVwsJtXNh0JEV1EjKfcBEG9yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747136365; c=relaxed/simple;
	bh=sakjGWFrGCsJtJMuNHZvf4IXAuWs0DjW6D7LHP/RS9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lNgoJz5J9+P+WStUmtyXr3yucwbj6NeCOBCbJGaUioeBp6pfHqG1arjKfAZkoq+EO47yLB3MQ+9NQQ39uY4yptVN04ld6AJVWKIOv8yqNLzWaYNKIdsw8cIj2TphRsb46YrgEqvS7pD1VU3no43zt3Ah9i5NAmhSkgJWynqbbT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mvFAUHeS; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mvFAUHeS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=D1
	d5Mv3O2B4ADycUafrn1h0QXPGeO+8J5MjFluopYfY=; b=mvFAUHeS0wKcgzl+Nl
	27I669SfkEft4YOkU/UNmLgMkZCHW+bdhAcAoncXE23BLkCtEmZ2E82cqfgvbrR1
	ZlI/uT76icnLb4PINi7RHsPTk9bfHM85n47UDvjXXrkMiY7AtzRVP7bLB7WYcG+W
	+az5lsHRHCWlgdMpgMDnAgH90=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wC3kuMqLyNotfVmBA--.12824S4;
	Tue, 13 May 2025 19:38:33 +0800 (CST)
From: David Wang <00107082@163.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org,
	oneukum@suse.com
Cc: stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Wang <00107082@163.com>
Subject: [PATCH v2 1/2] USB: core: add a memory pool to urb for host-controller private data
Date: Tue, 13 May 2025 19:38:17 +0800
Message-Id: <20250513113817.11962-1-00107082@163.com>
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
X-CM-TRANSID:_____wC3kuMqLyNotfVmBA--.12824S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF17CFWxCw1DJF18Cw17ZFb_yoW5tFWUpF
	4xA3s3tF1FqrW3XrZ3Gan7uayrJ3Wv9ryjkryfu345Xr17tw18A3Z2yFyrCr9xJr4Syw4Y
	qFsIgan8Ww1UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEF1v7UUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hxMqmgjJyLldgAAs1

---
Changes:
1. Use caller's mem_flags if a larger memory is needed.
Thanks to Oliver Neukum <oneukum@suse.com>'s review.
---
URB objects have long lifecycle, an urb can be reused between
enqueue-dequeue loops; The private data needed by some host controller
has very short lifecycle, the memory is alloced when enqueue, and
released when dequeue. For example, on a system with xhci, several
minutes of usage of webcam/keyboard/mouse have memory alloc counts:
  drivers/usb/core/urb.c:75 [usbcore] func:usb_alloc_urb 661
  drivers/usb/host/xhci.c:1555 [xhci_hcd] func:xhci_urb_enqueue 424863
Memory allocation frequency for host-controller private data can reach
~1k/s and above.

High frequent allocations for host-controller private data can be
avoided if urb take over the ownership of memory, the memory then shares
the longer lifecycle with urb objects.

Add a mempool to urb for hcpriv usage, the mempool only holds one block
of memory and grows when larger size is requested.

Signed-off-by: David Wang <00107082@163.com>
---
 drivers/usb/core/urb.c | 23 +++++++++++++++++++++++
 include/linux/usb.h    |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 5e52a35486af..51bf25125aeb 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -23,6 +23,7 @@ static void urb_destroy(struct kref *kref)
 
 	if (urb->transfer_flags & URB_FREE_BUFFER)
 		kfree(urb->transfer_buffer);
+	kfree(urb->hcpriv_mempool);
 
 	kfree(urb);
 }
@@ -1037,3 +1038,25 @@ int usb_anchor_empty(struct usb_anchor *anchor)
 
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
diff --git a/include/linux/usb.h b/include/linux/usb.h
index b46738701f8d..4400e41271bc 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1602,6 +1602,8 @@ struct urb {
 	struct kref kref;		/* reference count of the URB */
 	int unlinked;			/* unlink error code */
 	void *hcpriv;			/* private data for host controller */
+	void *hcpriv_mempool;           /* a single slot of cache for HCD's private data */
+	size_t hcpriv_mempool_size;     /* current size of the memory pool */
 	atomic_t use_count;		/* concurrent submissions counter */
 	atomic_t reject;		/* submissions will fail */
 
@@ -1790,6 +1792,7 @@ extern int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
 extern struct urb *usb_get_from_anchor(struct usb_anchor *anchor);
 extern void usb_scuttle_anchored_urbs(struct usb_anchor *anchor);
 extern int usb_anchor_empty(struct usb_anchor *anchor);
+extern void *urb_hcpriv_mempool_zalloc(struct urb *urb, size_t size, gfp_t mem_flags);
 
 #define usb_unblock_urb	usb_unpoison_urb
 
-- 
2.39.2

