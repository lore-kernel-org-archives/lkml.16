Received: from glittertind.blackshift.org (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DD6230277
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.23.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737793; cv=none; b=BjYNmd7unljL00slzFszEFi1P3gHIpmjSvCJgreU+XKxKMzUeoRQJrwl6YuzL0V3i2Qf/RYv59dYdAAQJGa8QY7FH1oGlYh1rvYvEUYKQpTZ16X5CFaKUFTS7lCwLNByJZxcxxd3zAWdVk4u5OB7AVmOC3ijIqO2/Twqb3Nqrz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737793; c=relaxed/simple;
	bh=LyJrLbbVnlKXsSbL7xyqgKeGY8RTbecxMuFSWf+ZNo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eoz7t7nNv2lICfPNIA56w072IOflBLDmXmHo05T9+9Kd8F/Y3WMuBRaeAw2UIw5yhzD4+JUsWhaMhrMJ40kFH2a96hFj6X8Yc2Axo86dOP/V4qp19pSFsa0FUJeKavCYKQTMdfH625PDxNOCz3wOrtJLqvlD0/4qU4KSVXgXZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=none smtp.mailfrom=hardanger.blackshift.org; arc=none smtp.client-ip=116.203.23.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hardanger.blackshift.org
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:e3:7f3d:bb00:e75c:5124:23a3:4f62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1)
	 client-signature RSA-PSS (4096 bits))
	(Client CN "bjornoya.blackshift.org", Issuer "R10" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id 8E50366BC13
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:16:25 +0000 (UTC)
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 5CDBB4264C4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:16:25 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id E3130426431;
	Thu, 12 Jun 2025 14:16:18 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 2c0caf85;
	Thu, 12 Jun 2025 14:16:17 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 12 Jun 2025 16:16:01 +0200
Subject: [PATCH net-next v2 08/10] net: fec: fec_enet_rx_queue(): reduce
 scope of data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-fec-cleanups-v2-8-ae7c36df185e@pengutronix.de>
References: <20250612-fec-cleanups-v2-0-ae7c36df185e@pengutronix.de>
In-Reply-To: <20250612-fec-cleanups-v2-0-ae7c36df185e@pengutronix.de>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15-dev-6f78e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=LyJrLbbVnlKXsSbL7xyqgKeGY8RTbecxMuFSWf+ZNo4=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBoSuErPL4DJ89NnHGzgWszt1Np6Y25wotvfmGAI
 JqA1bCHu0uJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaErhKwAKCRAMdGXf+ZCR
 nE43B/4hKlRe4t/GjGdJEjCQIRCKPlWxdEix6OqBEyWk6i1ONQjIQ12qDswsd53PtRBQGr7xGMs
 pqA5FBNrhJBn4SZkiSYvL7+hFxIeILhuhNByskmhD09tCZFcDdO68kkUJmyTgMFZ9h1pqiIjZHR
 M9g3H1b1x4NgasVyPR7ZAlZRCv4leDnKLMxagpPbJl2qmzfxAgcOLZRXp6+fLWVWX0T6EAWP8x3
 HK/NKoV55umkt+LX0bwJB1zfwTPA0S1CJB/caGpfkOVYPLwJbwjAbLUBu5w0nj0n5PDLZN09VFA
 G0GnaULNy8QtDibyqEynGuF8EnwgDvK5NQyYcqrTveRR7Qj7
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54

In order to clean up of the VLAN handling, reduce the scope of data.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Wei Fang <wei.fang@nxp.com>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/ethernet/freescale/fec_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index f238cb60aa65..bc547be59dae 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -1721,7 +1721,6 @@ fec_enet_rx_queue(struct net_device *ndev, u16 queue_id, int budget)
 	unsigned short status;
 	struct  sk_buff *skb;
 	ushort	pkt_len;
-	__u8 *data;
 	int	pkt_received = 0;
 	struct	bufdesc_ex *ebdp = NULL;
 	bool	vlan_packet_rcvd = false;
@@ -1844,10 +1843,11 @@ fec_enet_rx_queue(struct net_device *ndev, u16 queue_id, int budget)
 		skb_mark_for_recycle(skb);
 
 		if (unlikely(need_swap)) {
+			u8 *data;
+
 			data = page_address(page) + FEC_ENET_XDP_HEADROOM;
 			swap_buffer(data, pkt_len);
 		}
-		data = skb->data;
 
 		/* Extract the enhanced buffer descriptor */
 		ebdp = NULL;
@@ -1865,7 +1865,7 @@ fec_enet_rx_queue(struct net_device *ndev, u16 queue_id, int budget)
 
 			vlan_packet_rcvd = true;
 
-			memmove(skb->data + VLAN_HLEN, data, ETH_ALEN * 2);
+			memmove(skb->data + VLAN_HLEN, skb->data, ETH_ALEN * 2);
 			skb_pull(skb, VLAN_HLEN);
 		}
 

-- 
2.47.2


