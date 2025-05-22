Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C6B320F;
	Thu, 22 May 2025 07:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898735; cv=none; b=grbWBT3wYU8Pr6+pFuKrz5+hEnWyg36xAaTSGiAyvEupxhPMWFlTjeTwhENmn3sbCXfEmWTBjVr99LVzNOp6dq4Ol7AR2ido+LLMbtliTzzEGZhOCQeZCNx8pyA4w/wQZ4OkbyQGgurThwKPzfFA/v3ZWRc+giyH4XSGR0WwX/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898735; c=relaxed/simple;
	bh=gtcQiVv8C/ThkqirllVBFHa40vSa2FjD+GV/VeHq2io=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mD/kTzmD6EKWMkkrJXDJSlE3FESSSJHXyF4nPRfNQzs6BB9mU4yBLQxTEE2a+i7ODA7fhkGNsYQ1xBT9titE2Pp/cTlZ7iWqn4NMV1+JhCmif2E1YApUcw8xdGN9M8+uACtO7c/s75NUjdXxV6nmaB++Y8oJI/EHV5kBrqnIFvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bKGm0jYx; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bKGm0jYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Yy
	XzRmLJrmjlX+RlPnQIdYO0P6MdtW6Vfq9iIZQfCt4=; b=bKGm0jYxNcq65xY5n9
	JQD3/rdf2N5k7OZuMgL49/Uyi2tEc4RO7ZmKqBt/1+GxgbMBlVLxk3bz13SAkJMy
	lYG0NruLAw/md26m+yDMkdkVLc5s1LYVRoGJz0nlRfI69IngpoipngfvMZe+BpWA
	L0qoXNcTm1IDjb+uXCbM4gBUY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDnl2O4zS5oEWbhBQ--.29592S4;
	Thu, 22 May 2025 15:09:55 +0800 (CST)
From: David Wang <00107082@163.com>
To: gregkh@linuxfoundation.org,
	mathias.nyman@intel.com
Cc: oneukum@suse.com,
	stern@rowland.harvard.edu,
	hminas@synopsys.com,
	rui.silva@linaro.org,
	jgross@suse.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Wang <00107082@163.com>
Subject: [PATCH v4 1/2] USB: core: add a memory pool to urb caching host-controller private data
Date: Thu, 22 May 2025 15:09:43 +0800
Message-Id: <a235e322e270942dc3d607d4b46ff7db29abeb2d.1747897366.git.00107082@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDnl2O4zS5oEWbhBQ--.29592S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xr47CF15uryrtryftw1UKFg_yoWxWF4UpF
	WfJwn3tF18XrW3JrZ3GF4kuayfta1kCFy2kFyfu34UZwnFywn5Aas2yFyrur9Fyr4fJwsI
	qa1DKFn8Ww1UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piJGYdUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkBxVqmguzbwBUwAAsW

When using USB devices, there are lots of memory allocations for
host controller's private data. For example, on a system with xhci,
using a webcam and a mic would needs ~250 and ~1k kzallocs per
second, respectively.

Some HCDs use kmem_cache to handle the high frequency of memory
allocation during device usages. There are several drawbacks:
1. The lifespan of kmem_cache entry has weak correlation with
device usages: when devices are in idle, those memory is still
kept in slab until system decide to reclaim it, if reclaimable.
2. kmem_cache is only used for fix-sized memory allocation, if a
HCD needs private data of m different sizes, m different kmem_cache
would be needed, and the overhead of kmem_cache is multiplied by m.
When m is large, as some HCD needs variable length private data,
kmem_cache approach is inflexible to use.
3. A system may have multiple HCDs in use, then the overhead of
kmem_cache would be multiplied again by the number of HCDs.

URB objects have long lifespans, an urb can be reused between
submit loops while the devices are being used. And with following
premise:
1. Each URB cannot be used by more than one HCDs at the same time.
2. The lifespan of HC private data is contained in its URB object's
lifespan.

high frequent allocations for HCD private data can be avoided if
urb take over the ownership of memory, the memory then shares
the longer lifespan with urb objects.

The memory pool in URB works this way:
1. A URB object holds only one slot of memory pool.
2. When created, memory pool is NULL. If no private data requested,
no memory pool alloced for the URB.
3. The memory pool slot will grow when larger size is requested.
4. Memory pool slot will be released only when URB is destroyed.

Normally the hcpriv pointer in URB structure is the same as memory
pool slot, but considering some drivers may still have its own
management of urb->hcpriv, a hcpriv_mempool pointer is added, to make
sure no impact on existing drivers.

A hcpriv_mempool_size field is needed for making sure that the mempool
slot is big enough, if not, more memory would be requested from system.

Existing drivers may have it own allocation of URB object, not via
usb_alloc_urb(), this may cause memory leak if URB has a active mempool
slot but it is not released via usb_free_urb(); A hcpriv_mempool_activated
flag is added to address this issue, it is set only in usb_alloc_urb().
When requesting a hcpriv memory to a URB which has hcpriv_mempool_activated
not set, the memory will be requested from system directly.

One of the drawbacks is URB object now have 3 more fields even if the
object would never be requested for HCD private data.

From an end-user's perspective, the performance difference with this change
is insignificant when system is under no memory pressure, and when under
heavy memory pressure. When system is under heavy memory pressure,
everything is slow.  There could be a point in-between no memory pressure
and heavy memory pressure where these 1k+/s memory allocations would
dominate the performance, but very hard to pinpoint it.

Signed-off-by: David Wang <00107082@163.com>
---
 drivers/usb/core/urb.c | 45 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb.h    |  5 +++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 5e52a35486af..2cf218d4fb73 100644
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
+	if (urb->hcpriv != urb->hcpriv_mempool) {
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

