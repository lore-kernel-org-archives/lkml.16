Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB2D1F1518;
	Tue, 13 May 2025 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747136362; cv=none; b=HjIigY1mkDmWd60BGXOGBhf4kh4rCh/o9uJJEQpMMe8rqeUlnisWdrq9PbzsIn0ULXqhMUbg5HLtnnTnybv3qBno1gDIE51bGqR+PL5j6CdtHh8WC1f0erCqXkjCWj62xfbRlLXYwDMN30T+zWluCZQ8LYmW2aRqF+gxYxBtspo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747136362; c=relaxed/simple;
	bh=nbagik6tAO1HCjwX/OPW5KIrG4ERYzWcrn8PsO5htCM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DiyT5jTRjtalfIvhoO1NinpU1TQy5jMiUh/g7xOMF2VjZ+AJkInkwqGAWKa2vVS2wCFUcIpowR6RLvS20ZDmeP15tbZUkiPjgk4ZhU6d6WGxtFOfqJkUYisMNMBPpxY0zqYexOz1PK1mJdD92wkJtxYJnZNNaorbw+uYrK1amEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Sfi/jK/4; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Sfi/jK/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Re
	n+rlKZczgZSleRIJP8LCbNsTi1hR9xCfhAJWAh8bI=; b=Sfi/jK/4OB/zNO5JWX
	cW3j1U1HF7G1nU1VsMA0KIbW0NOXHBR1T9uJbsDnxEOyIU+0RImah4FRIyWgNh2q
	tOfWt8WuTgu3tgJFTX47pxjQlrQtTcT4JGe65kN8qzZLY8cHx/0ehuwmz/Vp4Db/
	fOJoKcszqGvQwonWGtjaRp4Jc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wBXkKBFLyNoIZZ_BA--.18364S4;
	Tue, 13 May 2025 19:38:52 +0800 (CST)
From: David Wang <00107082@163.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org,
	oneukum@suse.com
Cc: stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Wang <00107082@163.com>
Subject: [PATCH v2 2/2] USB: xhci: use urb hcpriv mempool for private data
Date: Tue, 13 May 2025 19:38:44 +0800
Message-Id: <20250513113844.12096-1-00107082@163.com>
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
X-CM-TRANSID:_____wBXkKBFLyNoIZZ_BA--.18364S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF4rtryrtw43JF13Zw43KFg_yoW5Jry3pF
	WrXa40kr4Fyr47XFW5Aw4DA3WfJw4vgF92gFWxC3y5WrsFy3srWa4IyFWF9FnIqrykCrsI
	q3WvqrWrG3WUKFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEcTmwUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0glMqmgjJyLnigAAse

---
Changes:
1. remove a unused variable declaration in xhci-ring.c
---
xhci keeps alloc/free private data for each enqueue/dequeue cycles,
when using a USB webcam, the memory allocation frequency could reach
about 1k/s and above.

URB objects have longer lifecycle than private data, hand over ownership
of private data to urb can save lots of memory allocations over time.

Signed-off-by: David Wang <00107082@163.com>
---
 drivers/usb/host/xhci-ring.c | 2 --
 drivers/usb/host/xhci.c      | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 423bf3649570..f082215f140b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -821,7 +821,6 @@ static void xhci_giveback_urb_in_irq(struct xhci_hcd *xhci,
 				     struct xhci_td *cur_td, int status)
 {
 	struct urb	*urb		= cur_td->urb;
-	struct urb_priv	*urb_priv	= urb->hcpriv;
 	struct usb_hcd	*hcd		= bus_to_hcd(urb->dev->bus);
 
 	if (usb_pipetype(urb->pipe) == PIPE_ISOCHRONOUS) {
@@ -831,7 +830,6 @@ static void xhci_giveback_urb_in_irq(struct xhci_hcd *xhci,
 				usb_amd_quirk_pll_enable();
 		}
 	}
-	xhci_urb_free_priv(urb_priv);
 	usb_hcd_unlink_urb_from_ep(hcd, urb);
 	trace_xhci_urb_giveback(urb);
 	usb_hcd_giveback_urb(hcd, urb, status);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 90eb491267b5..f88385e0488e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1552,7 +1552,7 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	else
 		num_tds = 1;
 
-	urb_priv = kzalloc(struct_size(urb_priv, td, num_tds), mem_flags);
+	urb_priv = urb_hcpriv_mempool_zalloc(urb, struct_size(urb_priv, td, num_tds), mem_flags);
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

