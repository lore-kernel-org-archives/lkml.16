Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626F2246BD2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495371; cv=none; b=EChZsVzHXTsc/z5fF2penmAUyJzkW+lcchkeiPqG5wyytLs3pk9Wm/FSM2gC7/MZ6SCb/mecKxKPHAQUv2BZi0gmc6GRJXOmB851NRMa4d86sfJIirQUf2fJMkaYBlC6gRmeFYsiC6ujymdk4sYwGkgFYa7+51vGJ1SDs8h7dUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495371; c=relaxed/simple;
	bh=UB/1CZl8oOmPKV9a7tsaq0/uU/QT7jmtqT0Co+Rz/EU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nRPvPA7doKxWEC4roPB+GRmjGy4KnpCtXWioNFPZHyIInbvNkLKsRzk3e/EGiH834GrbKFpkakEz2oDeoNfmSG5v8oqOIsTd3okOhrUxyUkQl5oaZEIMF3ZD1n5VpWovBIq+MkZ1B8O3zmqkUYTE31kS11cxrYIxSVrfZlMraY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=LKy+timi; arc=none smtp.client-ip=185.136.64.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="LKy+timi"
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250702222929db12d4959152fee7c3
        for <linux-kernel@vger.kernel.org>;
        Thu, 03 Jul 2025 00:29:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Exuo4vBEyGgZ8IlxrnwEasdjOqhqf7aSWUFkWz3BbJM=;
 b=LKy+timiStEplbmQ04AmzxOwEwiaECL6oByolWt0PCAb9EcK8dxpqW/yxco7cJ3byOFUNn
 vjV8JXOpeH8Ule2H9+DpOt/88sB8YcXhR92/zuLd0k69I5ZEYrwtYixOF3icuJRJeKCm/z2Q
 Q8fcDY7s8iSMINSNRpOGi5gwduWO2WA5tg1DBeZaSGaiDUCBUThTnVkb1rk6Knn4wAX0Y51Z
 D/Yn4iABZHOXVSgkqlBRJf5aSJ2hLK8JjHNWarfgUtXMugo6V70I+ZPbpsbyHZzoOkehoYLT
 rwBpwKlBKaMIkxeRisISaIwmJp0NR7oWgakvsXJBeyrnSINUM1zf9uTw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-kernel@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] eeprom: at25: fram: Detect and support inside-out chip variants
Date: Thu,  3 Jul 2025 00:29:26 +0200
Message-ID: <20250702222927.864875-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Infineon seems to be confused with the order ID bytes should be presented
by the FRAM chips and to be on the safe side they offer chips which are
either JEDEC conform or the full opposite of the latter.

Examples of the chips which present ID bytes in the reversed order are:
CY15B102QN
CY15B204QSN

Let's support them nevertheless. Except reversing the ID bytes, they also
have quite different density encoding even across EXCELON(tm) family.

The patch has been tested with the above two chips.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/misc/eeprom/at25.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index 20611320e7152..2d0492867054f 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -385,17 +385,33 @@ static int at25_fram_to_chip(struct device *dev, struct spi_eeprom *chip)
 
 	/* Get ID of chip */
 	fm25_aux_read(at25, id, FM25_RDID, FM25_ID_LEN);
+	/* There are inside-out FRAM variations, detect them and reverse the ID bytes */
+	if (id[6] == 0x7f && id[2] == 0xc2)
+		for (i = 0; i < ARRAY_SIZE(id) / 2; i++) {
+			u8 tmp = id[i];
+			int j = ARRAY_SIZE(id) - i - 1;
+
+			id[i] = id[j];
+			id[j] = tmp;
+		}
 	if (id[6] != 0xc2) {
 		dev_err(dev, "Error: no Cypress FRAM (id %02x)\n", id[6]);
 		return -ENODEV;
 	}
-	/* Set size found in ID */
-	if (id[7] < 0x21 || id[7] > 0x26) {
+
+	switch (id[7]) {
+	case 0x21 ... 0x26:
+		chip->byte_len = BIT(id[7] - 0x21 + 4) * 1024;
+		break;
+	case 0x2a ... 0x30:
+		/* CY15B116QN ... CY15B116QN */
+		chip->byte_len = BIT(((id[7] >> 1) & 0xf) + 13);
+		break;
+	default:
 		dev_err(dev, "Error: unsupported size (id %02x)\n", id[7]);
 		return -ENODEV;
 	}
 
-	chip->byte_len = BIT(id[7] - 0x21 + 4) * 1024;
 	if (chip->byte_len > 64 * 1024)
 		chip->flags |= EE_ADDR3;
 	else
-- 
2.50.0

