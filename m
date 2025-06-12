Received: from glittertind.blackshift.org (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7E324887A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.23.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737793; cv=none; b=F2Pvp0IVvvoYcdjtQosAkh1iYOhsTfP+rZwrfmUa8uXfKQ4QkP/TBTPp0GNjpz0pM9SQgYFYBOW6xwh15YwpjqznAoSJKL3PxExlbaGlIGj/5D7AeX1KzoTJZ5NWptShIB0i+VqxDiNjizeWRIkQj4Eor084ywn39ZWWJ+YtpQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737793; c=relaxed/simple;
	bh=Emt1YpF4s/JoqxKThhmx8HqvPvs7S3WPKPOleUx7LiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIIZ848YASKYKN6AsbB1vgBT+vLasvNs/pO3p17LjY5JsNT/Bew9j+xbYssjKUnMpI4i1R3wqQORlb5YxLSErISrw0L+nFxFKptkyEi7Q7gB8sfdr4r0p7Ied8HVMDoD7ZWJCHZerP0HJkP9CUes63Gv0kVN1QSecpWHvhD1oQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=none smtp.mailfrom=hardanger.blackshift.org; arc=none smtp.client-ip=116.203.23.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hardanger.blackshift.org
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:e3:7f3d:bb00:e75c:5124:23a3:4f62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1)
	 client-signature RSA-PSS (4096 bits))
	(Client CN "bjornoya.blackshift.org", Issuer "R10" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id 53E9B66BBA6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:16:22 +0000 (UTC)
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 1C622426472
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:16:22 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 6A344426425;
	Thu, 12 Jun 2025 14:16:18 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 5ae98956;
	Thu, 12 Jun 2025 14:16:16 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 12 Jun 2025 16:15:57 +0200
Subject: [PATCH net-next v2 04/10] net: fec: rename struct fec_devinfo
 fec_imx6x_info -> fec_imx6sx_info
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-fec-cleanups-v2-4-ae7c36df185e@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1840; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=Emt1YpF4s/JoqxKThhmx8HqvPvs7S3WPKPOleUx7LiE=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBoSuEjAzhgxRuqvxEpMLBbgh+AaICU6MCHgMHo2
 5kKMcGrg9yJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaErhIwAKCRAMdGXf+ZCR
 nFS9B/4vp5Lly4DRq8PDAm+JDAZb7FtiLjAMlJG+dTDDGymkPRwzFMtAFV1S/zvhM7bKzrctKkt
 D7mUQMhoCVwMhI+oN3DU/RMSTO9TXMFzLjC/u5c/bSI3wlIwdjkwXVVgtHBy6d39fkJ0cgZskPB
 l8f8qlaIL4yRk0IDbbAe9pfIc7ypNAas5LVmHUsOGdd0JXiwM+MeeIMzgrLezvwY/mY0w7SE75j
 K1hDnNWdk0gkqKv7aghmOi246/ZDoFJZsEBME+4SCJDgEvAUrLNfcWgYhLiYI3Nq0LZMbZ/Zvkz
 ZzN3+HTY8BBa65JjR3lM21jaYvuwvSUjVKSzWiCyMhD4u4Cu
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54

In da722186f654 ("net: fec: set GPR bit on suspend by DT
configuration.") the platform_device_id fec_devtype::driver_data was
converted from holding the quirks to a pointing to struct fec_devinfo.

The struct fec_devinfo holding the information for the i.MX6SX was
named fec_imx6x_info.

Rename fec_imx6x_info to fec_imx6sx_info to align with the SoC's name.

Reviewed-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/ethernet/freescale/fec_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 17e9bddb9ddd..e0d7365e5b4f 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -131,7 +131,7 @@ static const struct fec_devinfo fec_mvf600_info = {
 		  FEC_QUIRK_HAS_MDIO_C45,
 };
 
-static const struct fec_devinfo fec_imx6x_info = {
+static const struct fec_devinfo fec_imx6sx_info = {
 	.quirks = FEC_QUIRK_ENET_MAC | FEC_QUIRK_HAS_GBIT |
 		  FEC_QUIRK_HAS_BUFDESC_EX | FEC_QUIRK_HAS_CSUM |
 		  FEC_QUIRK_HAS_VLAN | FEC_QUIRK_HAS_AVB |
@@ -196,7 +196,7 @@ static const struct of_device_id fec_dt_ids[] = {
 	{ .compatible = "fsl,imx28-fec", .data = &fec_imx28_info, },
 	{ .compatible = "fsl,imx6q-fec", .data = &fec_imx6q_info, },
 	{ .compatible = "fsl,mvf600-fec", .data = &fec_mvf600_info, },
-	{ .compatible = "fsl,imx6sx-fec", .data = &fec_imx6x_info, },
+	{ .compatible = "fsl,imx6sx-fec", .data = &fec_imx6sx_info, },
 	{ .compatible = "fsl,imx6ul-fec", .data = &fec_imx6ul_info, },
 	{ .compatible = "fsl,imx8mq-fec", .data = &fec_imx8mq_info, },
 	{ .compatible = "fsl,imx8qm-fec", .data = &fec_imx8qm_info, },

-- 
2.47.2


