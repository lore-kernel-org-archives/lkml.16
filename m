Received: from glittertind.blackshift.org (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FD12475E8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.23.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738315; cv=none; b=AASr5ObgGLUHYTS6DTa1eJmJ2p9xHNCxJEbTKnT+NH/HQgI14JeVQ2riEfFjJ5ub0F/fOy9JFdXTtS7jRK5U23QYB4PN4t4RBLDOhilNc6wMqJGgj0E1Aw6TILm8pwRKgb/w2VzfidVHhVJtxvxjzSaNweIBXFzbM7fVtuV8FWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738315; c=relaxed/simple;
	bh=V8ff7fDbtrBpOwcc2k1XD/2X9ZfI4Jix++SEAjR5Wf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IKqWZ+y3tecet0a5nlBeJ7+ibybf+Pz9beLjj9WeIppqFfqvJyyJ0R/Zo/T1O6at9+1XBhTZDdxQ/pvhdcX9k09Cx0BkyLvM7Y1wDH9AeJP7reYi4/8kwOwb2haAkJ3NODQXEx9eGP07RAmSX6rkxgUE6kq7y0rSOSfLn0ljhuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=none smtp.mailfrom=hardanger.blackshift.org; arc=none smtp.client-ip=116.203.23.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hardanger.blackshift.org
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:e3:7f3d:bb00:e75c:5124:23a3:4f62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1)
	 client-signature RSA-PSS (4096 bits))
	(Client CN "bjornoya.blackshift.org", Issuer "R10" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id DD13466BB9C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:16:21 +0000 (UTC)
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id AD0CA42646A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:16:21 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 0B04F42641F;
	Thu, 12 Jun 2025 14:16:18 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id fcc4cc8b;
	Thu, 12 Jun 2025 14:16:16 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 12 Jun 2025 16:15:55 +0200
Subject: [PATCH net-next v2 02/10] net: fec: struct fec_enet_private:
 remove obsolete comment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-fec-cleanups-v2-2-ae7c36df185e@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=970; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=V8ff7fDbtrBpOwcc2k1XD/2X9ZfI4Jix++SEAjR5Wf0=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBoSuEgGxr/m2fNxi/tQG3/OmRmy2aYxJwSlpKms
 T5J1yjvkvGJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaErhIAAKCRAMdGXf+ZCR
 nNnKCACNGqT+Oob2vRXPlWR+BG/fc1lVEPu+6PMdLRFkxb/KyykjSOLo83N0uDlPovLcH4zrpKi
 xTmtuExPhs3rDcbMeGHnCgYoUOJE8uaKHl6hjd1Mgc+7m9ety0sUFJ1o3z/8Yp3R/m7MD1SAPTj
 +AsHYlrlRW8lD7/BthGHIDK7UAyhejA6fItZ0VQwrDFrJBk2cIdl5zAR1xSUvSLwZzC/G/DcmV+
 4F/oEAPLVzpdV5suzmiJucc8PCmSRQOm0kPTjAr1Nmrv6zCrJUGRVmKD1QA+05nbtKEnMow8Dr8
 575j17y+gJcYhvFw/p8Hjvx7AI4M3GKTxQ04wtDHrdqiQ5+L
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54

In commit 4d494cdc92b3 ("net: fec: change data structure to support
multiqueue") the data structures were changed, so that the comment about
the sent-in-place skb doesn't apply any more. Remove it.

Reviewed-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/ethernet/freescale/fec.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec.h b/drivers/net/ethernet/freescale/fec.h
index 3cce9bba5dee..ce1e4fe4d492 100644
--- a/drivers/net/ethernet/freescale/fec.h
+++ b/drivers/net/ethernet/freescale/fec.h
@@ -614,7 +614,6 @@ struct fec_enet_private {
 	unsigned int num_tx_queues;
 	unsigned int num_rx_queues;
 
-	/* The saved address of a sent-in-place packet/buffer, for skfree(). */
 	struct fec_enet_priv_tx_q *tx_queue[FEC_ENET_MAX_TX_QS];
 	struct fec_enet_priv_rx_q *rx_queue[FEC_ENET_MAX_RX_QS];
 

-- 
2.47.2


