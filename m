Received: from glittertind.blackshift.org (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FAE24887E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.23.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737793; cv=none; b=ETcfLMpOB9N2PrSvXr38RAHEJVqFPUrhzXYYfaC3BbkREWInCFspDeqFlWHEAIoYPZqL+GjFaixnUF/1uPIPVwAoPxYntJikCadTwo/EvQUQXLcttNNuKcUwWXcLrP2E7JyYniTd03Jda7SWwfbuBuuF6ya89TQ+yaN11RoCauY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737793; c=relaxed/simple;
	bh=YFzMRwy9IG++4sminbXVq/FQxPNDCu0SWEnO/TFE3og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2j9XDW4qzV4qZ4Q1pOzYkc2RbNLqsYR3T/hMldHSZHN5989qtZWEChBHLuQedyRSVFmlUKnMroYRSBY0S7+k+ONk6zp8o1i0XVyARv8nYu8ZThuER86iN2M+ihj4yeW2Q8lvR5/bYIdmmJ4Iq8/OVVrhUMzdvBf3wS0qeu24xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=none smtp.mailfrom=hardanger.blackshift.org; arc=none smtp.client-ip=116.203.23.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hardanger.blackshift.org
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:e3:7f3d:bb00:e75c:5124:23a3:4f62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1)
	 client-signature RSA-PSS (4096 bits))
	(Client CN "bjornoya.blackshift.org", Issuer "R10" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id 71E7866BC0E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:16:25 +0000 (UTC)
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 3DA634264C1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:16:25 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 85DC3426427;
	Thu, 12 Jun 2025 14:16:18 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 20a1ad9a;
	Thu, 12 Jun 2025 14:16:16 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 12 Jun 2025 16:15:58 +0200
Subject: [PATCH net-next v2 05/10] net: fec: fec_restart(): introduce a
 define for FEC_ECR_SPEED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-fec-cleanups-v2-5-ae7c36df185e@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=YFzMRwy9IG++4sminbXVq/FQxPNDCu0SWEnO/TFE3og=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBoSuElt40k9n1UTKfWSqO6oA3qeM/XZmq2GIQuI
 Q43hNuSKI+JATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaErhJQAKCRAMdGXf+ZCR
 nITpB/0bNEaKUOnAETSPdWJqb3BLpec/VizA7IK4XqkH66xSO4JLX8IVlBCF8NuQZsmuhBy1qa6
 5FH3bIdvgTNpTY5nLV1HIlJSfErDprRrrEYJwIKsORsEnhOLpUxeLlpe51B2bVTnmYSx8NFJwjk
 Z9wN6sSlFs89+szZ+3zj6PMBPhTluXSdgVrceV6T7SOgWS+FwYW2ToNHvqPXCeu56PduD0DrJ+J
 LCYSKAIVrzFYdmzRcWjrdD9SNqZRc0w+OrhjAk3jZq3c7mXbSQ2JmVWk/k89D6n3hLPSo2Mz1dg
 ZxhuNU3B9syM+p25OvMNmLoQiowDbxG0J7xOCcZ0+n5blFQq
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54

Replace "1 << 5" for configuring 1000 MBit/s with a defined constant to
improve code readability and maintainability.

Reviewed-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/ethernet/freescale/fec_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index e0d7365e5b4f..21891baa2fc5 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -276,6 +276,7 @@ MODULE_PARM_DESC(macaddr, "FEC Ethernet MAC address");
 #define FEC_ECR_MAGICEN         BIT(2)
 #define FEC_ECR_SLEEP           BIT(3)
 #define FEC_ECR_EN1588          BIT(4)
+#define FEC_ECR_SPEED           BIT(5)
 #define FEC_ECR_BYTESWP         BIT(8)
 /* FEC RCR bits definition */
 #define FEC_RCR_LOOP            BIT(0)
@@ -1207,7 +1208,7 @@ fec_restart(struct net_device *ndev)
 		/* 1G, 100M or 10M */
 		if (ndev->phydev) {
 			if (ndev->phydev->speed == SPEED_1000)
-				ecntl |= (1 << 5);
+				ecntl |= FEC_ECR_SPEED;
 			else if (ndev->phydev->speed == SPEED_100)
 				rcntl &= ~FEC_RCR_10BASET;
 			else

-- 
2.47.2


