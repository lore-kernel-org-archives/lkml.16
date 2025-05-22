Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C1F221D9B;
	Thu, 22 May 2025 07:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897866; cv=none; b=O+sTC0G/pc08nSL817ytuhQUIYmiRky47zQm2AyqwPGIBzdxyeIju8ye0YzTquFV4gxAX2dObWaRRM6dvy3BhYnwuoSnexvTUG8sOiByOjGX4wRaueHKv6d2dskaltPi9uFFlnT8rv60O8KU77qrYd1wrSTCV5ylXKURDvYoFfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897866; c=relaxed/simple;
	bh=1f60hXuzMX3Q12cENE42Cqcu5aJ9RJJaRYBKm42RIsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=snXhVcY/nxAvYwsJA+MKdQNPOWpUu4r5tDR/MqRTK9ZanKiReJ3q/ynSivgcHRPW4OpJ/Tk9hmr4hjidGloae0MSU2saSH8P3qoC6Yyb1Q7aNFfhzjDPu6XR+0VCyby0IWtJe1P52zmhzTweULBlWPSjPVwkk/xpAGy7/saD1sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Gqu7tFqf; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Gqu7tFqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=uc
	LITgF9VnGp5x0QXfM6YRhE6tyeArA6Sg9rqFsFqWE=; b=Gqu7tFqfxsfGTYeFVH
	cy4RsIV2phONbWpUdRKVpjIHl2EOtbwKIK+JQ5GldaCmnEbnTDCVS+mYqM/Cqjyp
	ga9k0FcBN7lNmkFw2adjo11IXlR8z9lHjSLIIJPTxQVlxcHre2+j4F3eFEaHCl1U
	V5IfguGkV+aoPsT69s0Dki9Bo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAHa9_TzS5o7LFrAQ--.37799S4;
	Thu, 22 May 2025 15:10:15 +0800 (CST)
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
Subject: [PATCH v4 2/2] USB: xhci: use urb hcpriv mempool for private data
Date: Thu, 22 May 2025 15:10:10 +0800
Message-Id: <5f14d11e4c651f9e856d760bc8b45ea7ac863b2f.1747897366.git.00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <a235e322e270942dc3d607d4b46ff7db29abeb2d.1747897366.git.00107082@163.com>
References: <a235e322e270942dc3d607d4b46ff7db29abeb2d.1747897366.git.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAHa9_TzS5o7LFrAQ--.37799S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxCry5WF13Kw43tryUAF48tFb_yoW5CFWfpF
	4rXa40kr1rtr4xXFZ8Jw1DAa4fJw4vgF92gFWxu345ursFy3srG342yFWF9rnxXryDCrnI
	qF1qqrWrGw1UGFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piL0ePUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqBdVqmgux8vUGgAAsE

xhci keeps alloc/free private data for each enqueue/dequeue cycles,
when using a USB webcam, allocation rate is ~250/s;
when using a USB mic, allocation rate reaches ~1k/s;
The more usb device in use, the higher allocation rate.

URB objects have longer lifespan than private data, hand over ownership
of private data to urb can save lots of memory allocations over time.
With this change, no extra memory allocation is needed during usages of
USB webcam/mic.

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

