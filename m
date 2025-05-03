Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A529613FEE;
	Sat,  3 May 2025 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746282099; cv=none; b=nJKtdVIjjFdSJh/JcCZrXv5LdjZDsBHtO0dt5JRNQNUL3UJAQsUc4nTpl1WWm8S87LhL+zAXujGoIHqUernodaHUNdhv1AuXReztkf0DRaE6flhH1NvCEpGjKyK6Zdoiykehb3cjr4taSWkIcHG5fqKi2rM31PHYTjfgsQSPCvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746282099; c=relaxed/simple;
	bh=cWbEmQltz0oDoF8oRZHZClnv9ssMp15SavJKYJBRPsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hANdmx1EvEY7x7Mv1HdSqDWW0o8xGDh/B7DeWrrv5OTFjzPekQCWA+iQbjmfX0VATZxp1wXeaJxEGlRSIjUEtziha/yb6vOoYuZQWs3UKeQtbPPtsYzJ4YHqTvyx+LSnGma2jBaLU28oJDn0LxAKaWoPrCbq0pnkVckzzE5aVX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bs6aC8kP; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bs6aC8kP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=2de8T
	GkqjLKkQ3gsSnvhy0NWfdS9n+mGP2Kv83ig7cw=; b=bs6aC8kPiB9RyBaiYET1n
	t4osPp3a8oAkD87qXGVcf5us4tDWe0cG6ZbPn00EHy9BaFcfIXw6udYyLunzEd6k
	y9+vH25RRC6oyEIsyCSs8c4+gkcN/lBbUWB25Ya4+aRuPcL/HP1w0VcHbzcRxXTu
	aMS/mAbn7iZHpqfJWzyMjI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD318doJhZow54KEA--.40554S2;
	Sat, 03 May 2025 22:21:28 +0800 (CST)
From: Zhilin Yang <zlyang_001@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhilin Yang <zlyang_001@163.com>
Subject: [PATCH] usb: gadget: u_ether: Continue to send skbs if remote wakeup fails
Date: Sat,  3 May 2025 22:19:58 +0800
Message-Id: <20250503141958.584143-1-zlyang_001@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2025050321-apprehend-lavish-ea92@gregkh>
References: <2025050321-apprehend-lavish-ea92@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD318doJhZow54KEA--.40554S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWkJF1rJw1DuF4fKr43GFg_yoW8XF1Dpa
	18GryFkwn5Z3yDtw4UJws5XF45X39FqFWDKrZ2yws09a13J340kr4rKFW2gayDAFW7C3yY
	gFn8X398u34kuFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_yCJrUUUUU=
X-CM-SenderInfo: p2o1t0tjbqiii6rwjhhfrp/1tbiqBVClmgWHTu2TQABsL

While UDC suspends, u_ether attempts to remote wakeup the host if there
are any pending transfers. If there are no pending transfers, the
is_suspend flag is set. If the is_suspend flag is set, it attempts to
wakeup the host when start to transmit skbs. However, if wakeup fails,
for example, wakeup is not supported, skbs will never be sent.

To fix this, stop to queue skbs and return NETDEV_TX_BUSY only if remote
wakeup operation is successful.

Fixes: 17c2c87c3786 ("usb: gadget: u_ether: Set is_suspend flag if remote wakeup fails")
Signed-off-by: Zhilin Yang <zlyang_001@163.com>
---
 drivers/usb/gadget/function/u_ether.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index f58590bf5e02..9d746ed3f072 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -473,10 +473,11 @@ static netdev_tx_t eth_start_xmit(struct sk_buff *skb,
 
 	if (dev->port_usb && dev->port_usb->is_suspend) {
 		DBG(dev, "Port suspended. Triggering wakeup\n");
-		netif_stop_queue(net);
-		spin_unlock_irqrestore(&dev->lock, flags);
-		ether_wakeup_host(dev->port_usb);
-		return NETDEV_TX_BUSY;
+		if (!ether_wakeup_host(dev->port_usb)) {
+			netif_stop_queue(net);
+			spin_unlock_irqrestore(&dev->lock, flags);
+			return NETDEV_TX_BUSY;
+		}
 	}
 
 	spin_unlock_irqrestore(&dev->lock, flags);
-- 
2.25.1

