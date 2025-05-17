Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E8C1D5CED;
	Sat, 17 May 2025 08:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747471017; cv=none; b=bkMxxIkKv2JXfvJEEkJKCiIoG3FfncLOBscBJ5IsejDCVcklPNGzWn1jXyxIrrcH/grVEYkXLm1qGj7ZenOSBUhW4U7wToKCpIfZc19OnlAnZ/DyG7g4RjxuV0UNDgP2NJSv5A8jIPjkkV9G/ijDdzZQaO/PdauQIn+GafT7u34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747471017; c=relaxed/simple;
	bh=vLs4lfZ1RYhKkMrkUZsTV9xrJHeP9pjbbhQzv2P+yNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XTMKwREAnqfzwhAaic2tLAFEPoJILSmfQHM1TewM/cCkynWCi1+6eCqcTl8s7c9k3XIboW4n1Oinh65qPmuFviGmXW9Q+3G91gpGbrJNj9MyXG5y/Nw/7WwNEWzERmgl3h5w66NFXgHJ1oW5ivT1r3czglV9F1k6ccSyDRvRU/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LUyDPm0M; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LUyDPm0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=gP
	kutBVLb1FxgqM0uGljWj9qW8F+OJFnhi6A4WUBkpg=; b=LUyDPm0MU0WmTwjlYr
	0qO8ny1XotodisZg45v531uJABds6qppkD3GQoyCkQgmDmeFgpVhPsq4fu8K/3wi
	tLGp/MowSZgbxme4WDkZ1B1uWifQ07aGo5gx50bwOOR2Alp3+Y6Nz4g6rvR0Hyqt
	W9x4jDw6xpGtE23UKn0hcF3ow=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgB39VttSihowOTtAw--.21114S4;
	Sat, 17 May 2025 16:36:06 +0800 (CST)
From: David Wang <00107082@163.com>
To: =gregkh@linuxfoundation.org,
	mathias.nyman@intel.com
Cc: oneukum@suse.com,
	stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Wang <00107082@163.com>
Subject: [PATCH v3 2/2] USB: xhci: use urb hcpriv mempool for private data
Date: Sat, 17 May 2025 16:35:56 +0800
Message-Id: <20250517083556.5954-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgB39VttSihowOTtAw--.21114S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxCryUCFWDGw45Jr13CrWrGrg_yoW5CFykpF
	4rXa40kr1rtr47XFZ8Jr1DA3WfJw4vgF92gFWxC345ursFy3srG342yFWF9rnIqrykCrnI
	vF1vqrWrGw1UGFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p__-BDUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqAhQqmgoQ9CyAAAAs7

---
Changes since v2:
1. WARN when xhci_urb_free_priv is called somehow.
---
xhci keeps alloc/free private data for each enqueue/dequeue cycles,
when using a USB webcam, allocation rate is ~250/s;
when using a USB mic, allocation rate reaches ~1k/s;
The more usb device in use, the higher allocation rate.

URB objects have longer lifecycle than private data, hand over ownership
of private data to urb can save lots of memory allocations over time.

Signed-off-by: David Wang <00107082@163.com>
---
 drivers/usb/host/xhci-mem.c  | 1 +
 drivers/usb/host/xhci-ring.c | 3 +--
 drivers/usb/host/xhci.c      | 8 +++-----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d698095fc88d..b19e41cf1c4c 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1745,6 +1745,7 @@ struct xhci_command *xhci_alloc_command_with_ctx(struct xhci_hcd *xhci,
 
 void xhci_urb_free_priv(struct urb_priv *urb_priv)
 {
+	WARN_ONCE(1, "xhci private data should be managed by urb");
 	kfree(urb_priv);
 }
 
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 423bf3649570..8fa3f71fdb29 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -821,7 +821,6 @@ static void xhci_giveback_urb_in_irq(struct xhci_hcd *xhci,
 				     struct xhci_td *cur_td, int status)
 {
 	struct urb	*urb		= cur_td->urb;
-	struct urb_priv	*urb_priv	= urb->hcpriv;
 	struct usb_hcd	*hcd		= bus_to_hcd(urb->dev->bus);
 
 	if (usb_pipetype(urb->pipe) == PIPE_ISOCHRONOUS) {
@@ -831,7 +830,7 @@ static void xhci_giveback_urb_in_irq(struct xhci_hcd *xhci,
 				usb_amd_quirk_pll_enable();
 		}
 	}
-	xhci_urb_free_priv(urb_priv);
+	urb_free_hcpriv(urb);
 	usb_hcd_unlink_urb_from_ep(hcd, urb);
 	trace_xhci_urb_giveback(urb);
 	usb_hcd_giveback_urb(hcd, urb, status);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 90eb491267b5..071a7680b36e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1552,7 +1552,7 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	else
 		num_tds = 1;
 
-	urb_priv = kzalloc(struct_size(urb_priv, td, num_tds), mem_flags);
+	urb_priv = urb_hcpriv_mempool_zalloc(urb, struct_size(urb_priv, td, num_tds), mem_flags);
 	if (!urb_priv)
 		return -ENOMEM;
 
@@ -1626,8 +1626,7 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 
 	if (ret) {
 free_priv:
-		xhci_urb_free_priv(urb_priv);
-		urb->hcpriv = NULL;
+		urb_free_hcpriv(urb);
 	}
 	spin_unlock_irqrestore(&xhci->lock, flags);
 	return ret;
@@ -1789,8 +1788,7 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	return ret;
 
 err_giveback:
-	if (urb_priv)
-		xhci_urb_free_priv(urb_priv);
+	urb_free_hcpriv(urb);
 	usb_hcd_unlink_urb_from_ep(hcd, urb);
 	spin_unlock_irqrestore(&xhci->lock, flags);
 	usb_hcd_giveback_urb(hcd, urb, -ESHUTDOWN);
-- 
2.39.2

