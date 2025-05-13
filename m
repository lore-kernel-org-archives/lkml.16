Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1321DEFE7;
	Tue, 13 May 2025 05:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115785; cv=none; b=fuZhb5XW/9Odug3CZg5yC5H4HlD0C4jPQYz1/gCHdU8FYfxN0+n4clDC8BSnzzhwwRb3Bw2sTdWco42CYNJcaVNzY52uKhqTb+n8p97tEz3ioNZss/gub0w78TeRdsq8OmjjBdfgxlXPsk5lWnR7okaAmdy2X1Isu+EjDBkxi7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115785; c=relaxed/simple;
	bh=p6w275A94nytvklausbAYSIp4RX8gBNakpOf+CKSRjw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FBqBE8Prj1RGyBcpQjX3YXoxP6nblZf92cIESrBk5ZLLjJ+wd/IKWZlTHweEoO6Od8ZyfcjCDzHC//ECoBUWG8iQdyi2vixIb4d5vCdtUonRU/6LaGFIBK+PUu5CPZRe9HV8b4+qtAiTBrsu/WZktGmrk4yLbWy8gwh7TcmoQ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NyhffNw2; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NyhffNw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+k
	/VGJTQ7VpQV+dYkPSM1DAaHCORay8ZMGNM7qiLKr4=; b=NyhffNw2hT0vC/Y7OC
	1M8Tpnlzg6PAJ10KD+S3ymC4yHvG+8MXN3oiKLAhNZu2jsfD2c8PuviVxVL2NZLD
	/YTaijHubh7jFX5YHSHPXknZg88hpI4LCO+7qpRSiP1VsAeaAx4ID89nBmIdpaM0
	rMJvDRow9tzmWhWQQ7b2CSHNg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBHPnXi3iJoD9BIBA--.18930S4;
	Tue, 13 May 2025 13:55:54 +0800 (CST)
From: David Wang <00107082@163.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Wang <00107082@163.com>
Subject: [PATCH 2/2] USB: xhci: use urb hcpriv mempool for private data
Date: Tue, 13 May 2025 13:55:45 +0800
Message-Id: <20250513055545.5738-1-00107082@163.com>
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
X-CM-TRANSID:_____wBHPnXi3iJoD9BIBA--.18930S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFWUGF4rtw13uryxCry7Awb_yoW8Zw4UpF
	WrWa40kr1Fyr42qFW5Jw1DA3WfJw4kWFyDWFWxG3yUur42k3srG34IyFWF9FnaqrykCrsI
	q3W8X3y8GF1DKFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p__-BDUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqBlMqmgi2uV4+gAAsg

xhci keeps alloc/free private data for each enqueue/dequeue cycles,
when using a USB webcam, the memory allocation frequency could reach
about 1k/s.

URB objects have longer lifecycle than private data, hand over ownership
of private data to urb can save lots of memory allocations over time.

Signed-off-by: David Wang <00107082@163.com>
---
 drivers/usb/host/xhci-ring.c | 1 -
 drivers/usb/host/xhci.c      | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 423bf3649570..b98e5211693d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -831,7 +831,6 @@ static void xhci_giveback_urb_in_irq(struct xhci_hcd *xhci,
 				usb_amd_quirk_pll_enable();
 		}
 	}
-	xhci_urb_free_priv(urb_priv);
 	usb_hcd_unlink_urb_from_ep(hcd, urb);
 	trace_xhci_urb_giveback(urb);
 	usb_hcd_giveback_urb(hcd, urb, status);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 90eb491267b5..94ff5fa9dcf2 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1552,7 +1552,7 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	else
 		num_tds = 1;
 
-	urb_priv = kzalloc(struct_size(urb_priv, td, num_tds), mem_flags);
+	urb_priv = urb_hcpriv_mempool_zalloc(urb, struct_size(urb_priv, td, num_tds));
 	if (!urb_priv)
 		return -ENOMEM;
 
@@ -1626,7 +1626,6 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 
 	if (ret) {
 free_priv:
-		xhci_urb_free_priv(urb_priv);
 		urb->hcpriv = NULL;
 	}
 	spin_unlock_irqrestore(&xhci->lock, flags);
@@ -1789,8 +1788,6 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	return ret;
 
 err_giveback:
-	if (urb_priv)
-		xhci_urb_free_priv(urb_priv);
 	usb_hcd_unlink_urb_from_ep(hcd, urb);
 	spin_unlock_irqrestore(&xhci->lock, flags);
 	usb_hcd_giveback_urb(hcd, urb, -ESHUTDOWN);
-- 
2.39.2

