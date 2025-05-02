Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905F8254861;
	Fri,  2 May 2025 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197656; cv=none; b=a9UG3XxgaQnryVpx8FeBcJ+iKPm4cXqrfzpo59Cut+gAdf4oUIkpeI+1BzEeHF68qjCfNTSh5AF0oaKloO7rl1eX2ShyoK3Au/TWjE8IyIDgKywKXTTsA4r2wybkUUz5Oq7eUbvuRaZwmPdhJPT7YuDKmSnc8MBVNKxYj3HrmTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197656; c=relaxed/simple;
	bh=l2KP2UA05ETPMzC1L54eMmUPajkDpF0kPXkQYA7Aqwk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jYn+XInkaVS7r8t10BgqYHoz0euFyrEvLz77gExpAieNKfaV3i0UToEbScyqRzKXqr46qThK3TwYs/jOPI33lvaGkcJ9kOjGGQe9KDeX8968UltkaXnfPAsCk33NgUu+mNJ7oXNRGvVYOAxZWK6g1JB3c5M24kpiaPC6SY/1+C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TncYU+Xe; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TncYU+Xe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=+/cEe
	zMTsb5S5Zu+KDWbMqAkl+WWX2DrcdgP1KIyM3Y=; b=TncYU+XedSTk5efR1JgxD
	DxXVgL6esDTbWBVPNnGU8FdlV6pcMSmgazCc3QHl0cCJ786qfLwZWYWI0Wi6PSgf
	K4RxFFALijagsNiRR03hiOGvHBMcUmAymvCUQ93xMOM0fKA8I3zAQZbqvBbpClsn
	aviRnCQVHIQh8x5bCWnje4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDHcGeM3BRolRJODw--.49008S2;
	Fri, 02 May 2025 22:54:04 +0800 (CST)
From: "zhilin.yang" <zlyang_001@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"zhilin.yang" <zlyang_001@163.com>
Subject: [PATCH] usb: gadget: u_ether: Continue to send skbs if remote wakeup fails
Date: Fri,  2 May 2025 22:53:52 +0800
Message-Id: <20250502145352.557174-1-zlyang_001@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHcGeM3BRolRJODw--.49008S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWDAw18JrWrKFWkKry7Awb_yoW8GF4xpa
	18GFyFkws5ZrWDtw47JanYqF4rZws2qFWUKrZ2yws8Wa1UJ340kr1rKFW2ga4DAFW7C3yF
	gF1Yqa98u34DuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE1vVZUUUUU=
X-CM-SenderInfo: p2o1t0tjbqiii6rwjhhfrp/xtbB0gZBlmgU2qk1hAAAs9

While UDC suspends, u_ether attempts to remote wakeup
the host if there are any pending transfers. If there are no
pending transfers, the is_suspend flag is set. If the is_suspend
flag is set, it attempts to remote wakeup the host when start to
send skbs. However, if host does not support remote wakeup, skbs
will never be sent.

To fix this, stop to queue skbs and return NETDEV_TX_BUSY only if
remote wakeup operation is successful.

Signed-off-by: zhilin.yang <zlyang_001@163.com>
---
 drivers/usb/gadget/function/u_ether.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index f58590bf5..9d746ed3f 100644
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

