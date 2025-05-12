Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F252309B3;
	Mon, 12 May 2025 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747062490; cv=none; b=jr/oBAQXsQZnQZCx7VUNY0cYlMV+UH9MzFnPrrh2BnGkPrX3IEyJJPuDEgKX5tlE2DNF58SSi2L/9fFHczdV/GUULISzf2ARC2ZAl/qiWhi1dz96Jb49htvaWlZ9inqzHluYOENeyTirdbP9l1mQPFHFMbT/UYxeoQMn3cibaOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747062490; c=relaxed/simple;
	bh=ya1PXoj6K1yoFGFHvgkn8xDzl0UKTfF4IP9FQz7gfNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kvtGDw9HDOCubZ2RRpwUpVaWotiXJgPVn5q5zehgY3uEdXHL2PNG3CF+2MM5/7mNVcYsk8/DkuBB2dLRoBM91SO9wrVLyJfR8LME/BtmC2DWP5rSnl4pChs33UiIdgMM2bv/dxNGHQZjX9ahFGStGpKjjK9EPWG7z2KuuT3oFVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nmKtDF93; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nmKtDF93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tI
	4q0Mc1q4PSwYa2K29AJnW0a4yN6ijZ6Fj4djm0HFA=; b=nmKtDF93rDpQ17gVa6
	LHve6SWf169npfoby0DPhj40Ux6ZaNPIoC0K1jVoGJ7X4ctvEU1om/QYqnxVPAvU
	CmWPWJybn5Fb0chCPdWuB+OSlzABWDetUpDE89yg6vVF4jkPcxwd2WEnWi0D1uUz
	2h8p7voICjyLd+X5GeLBazEl8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3H+itDiJo1qybAw--.5044S4;
	Mon, 12 May 2025 23:07:40 +0800 (CST)
From: David Wang <00107082@163.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	surenb@google.com,
	kent.overstreet@linux.dev,
	David Wang <00107082@163.com>
Subject: [RFC] USB: core/xhci: add a buffer in urb for host controller private data
Date: Mon, 12 May 2025 23:07:24 +0800
Message-Id: <20250512150724.4560-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H+itDiJo1qybAw--.5044S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWxWF4UtF1rKrWUXFyrJFb_yoWrAr4xpF
	Z5Wry8Kr1rtr47XFZ8Gw1kAa1fJw4kuF9FgFWxC345Zr12yw17W3s2yF4S9Fn7Xr4kCrsY
	q3Wqg3y8Wr1UJa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE1vVZUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqAZLqmgh6hWauQABsb

---
I was checking memory allocation behaviors (via memory profiling[1]),
when I notice a high frequent memory allocation in xhci_urb_enqueue, about
250/s when using a USB webcam. If those alloced buffer could be kept and
reused, lots of memory allocations could be avoid over time.

This patch is just a POC, about 0/s memory allocation in xhci with this
patch, when I use my USB devices, webcam/keyboard/mouse. 

A dynamic cached memory would be better: URB keep host controller's
private data, if larger size buffer needed for private data, old buffer
released and a larger buffer alloced.

I did not observe any nagative impact with xhci's 250/s allocations
when using my system, hence no measurement of how useful this changes
can make to user. Just want to collect feedbacks before putting more
effort.


[1] https://lore.kernel.org/all/20240221194052.927623-1-surenb@google.com/
---
xhci keeps allocing new memory when enque a urb for private data,
and enque frequency could be high, about 250/s when using a usb
webcam, about 30/s for high pace USB keyboard/mouse usage.
Using a cache/buffer for those private data could avoid
lots memory allocations.

Signed-off-by: David Wang <00107082@163.com>
---
 drivers/usb/host/xhci-ring.c |  3 ++-
 drivers/usb/host/xhci.c      | 14 +++++++++++---
 include/linux/usb.h          |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 423bf3649570..bc350b307758 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -831,7 +831,8 @@ static void xhci_giveback_urb_in_irq(struct xhci_hcd *xhci,
 				usb_amd_quirk_pll_enable();
 		}
 	}
-	xhci_urb_free_priv(urb_priv);
+	if (urb_priv != (void *)urb->hcpriv_buffer)
+		xhci_urb_free_priv(urb_priv);
 	usb_hcd_unlink_urb_from_ep(hcd, urb);
 	trace_xhci_urb_giveback(urb);
 	usb_hcd_giveback_urb(hcd, urb, status);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 90eb491267b5..85aa5fe526c8 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1539,6 +1539,7 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	unsigned int *ep_state;
 	struct urb_priv	*urb_priv;
 	int num_tds;
+	size_t private_size;
 
 	ep_index = xhci_get_endpoint_index(&urb->ep->desc);
 
@@ -1552,7 +1553,13 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	else
 		num_tds = 1;
 
-	urb_priv = kzalloc(struct_size(urb_priv, td, num_tds), mem_flags);
+	private_size = struct_size(urb_priv, td, num_tds);
+	if (private_size <= sizeof(urb->hcpriv_buffer)) {
+		memset(urb->hcpriv_buffer, 0, sizeof(urb->hcpriv_buffer));
+		urb_priv = (struct urb_priv *)urb->hcpriv_buffer;
+	} else {
+		urb_priv = kzalloc(private_size, mem_flags);
+	}
 	if (!urb_priv)
 		return -ENOMEM;
 
@@ -1626,7 +1633,8 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 
 	if (ret) {
 free_priv:
-		xhci_urb_free_priv(urb_priv);
+		if (urb_priv != (void *)urb->hcpriv_buffer)
+			xhci_urb_free_priv(urb_priv);
 		urb->hcpriv = NULL;
 	}
 	spin_unlock_irqrestore(&xhci->lock, flags);
@@ -1789,7 +1797,7 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	return ret;
 
 err_giveback:
-	if (urb_priv)
+	if (urb_priv &&  urb_priv != (void *)urb->hcpriv_buffer)
 		xhci_urb_free_priv(urb_priv);
 	usb_hcd_unlink_urb_from_ep(hcd, urb);
 	spin_unlock_irqrestore(&xhci->lock, flags);
diff --git a/include/linux/usb.h b/include/linux/usb.h
index b46738701f8d..4f82bb69081c 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1602,6 +1602,7 @@ struct urb {
 	struct kref kref;		/* reference count of the URB */
 	int unlinked;			/* unlink error code */
 	void *hcpriv;			/* private data for host controller */
+	u8 hcpriv_buffer[4096];         /* small buffer if private data can fit */
 	atomic_t use_count;		/* concurrent submissions counter */
 	atomic_t reject;		/* submissions will fail */
 
-- 
2.39.2

