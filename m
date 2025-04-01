Received: from mail.cab.de (mail.cab.de [46.232.229.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEC11F930
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.232.229.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514404; cv=none; b=t0rOsiXH/kwr9HmVqNxp7RMXCN+j4hKL96n21VdLDTiXbv8BuBKiaJbJthyHBEXhm2f9AJnUHvoY6RE+lNX2EZeGn6MF5K2kJSTLQAXSlQ4CwW2FOveVvl+UG1+kQjKySpOC/d6Yx24UP3w/2wxMM1d3I74rS2khHhahwtmnR5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514404; c=relaxed/simple;
	bh=jMMC+wm6vXcF1DkhT8g6MXmLjOdtu1T9dhA3en6FymE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cjvkjaJajAUaPq9EoKfUZ1ZyawQMOYkOKCz/liEDK/atWoeIaFNIXQ7p+yf5BLxSHiU1r9r55VcF66vxlpXIU7VTOMVkEugXqBqNFM/21is3TGgWAk3BszyA1yTEIccmJZR2f03SNZVQImE23ewZ16gj6d8sQvEoEutj4fR9n3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cab.de; spf=pass smtp.mailfrom=cab.de; dkim=pass (1024-bit key) header.d=cab.de header.i=@cab.de header.b=TjkIegWK; arc=none smtp.client-ip=46.232.229.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cab.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cab.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cab.de header.i=@cab.de header.b="TjkIegWK"
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.cab.de 4ZRpq40P9dzMvZsd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cab.de; s=default;
	t=1743514400; bh=wnt780oLccvGGA06d4dBzhYIn/GiO4i1xcNjf5ih2p4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=TjkIegWKGkeuJpE+oToDmA5LAC1QbnP1tkqqXcR0wp5/hBAIYJEzRV5S79KI/6sK6
	 3QaDSvXZMS1Lniv7MlqiqHLu0PRCM+rEd7ETKuLaMlr8iAXeVy3ukbUKlC27uKAO/9
	 tMY87qOEa1Jc25HE6NiwkFEIlvraKcY+NbHcvwzE=
X-cab-MailScanner-Watermark: 1744119195.55986@ypLX5Y4JCgHJBEtHSayM+Q
X-cab-MailScanner-From: m.heidelberg@cab.de
X-cab-MailScanner: Found to be clean
X-cab-MailScanner-ID: 4ZRppv53YRzMvb0J
X-cab-MailScanner-Information: Please contact it@cab.de for more information
Received: from Adranos.cab.de ([10.10.1.54] [10.10.1.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(no client certificate requested)
	by hephaistos.cab.de (MailScanner Milter) with SMTP id 4ZRppv53YRzMvb0J;
	Tue,  1 Apr 2025 15:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.cab.de 4ZRppv53YRzMvb0J
Received: from KAN23-025.cab.de (10.10.3.178) by Adranos.cab.de (10.10.1.54)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Apr
 2025 15:33:20 +0200
From: Markus Heidelberg <m.heidelberg@cab.de>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Christian
 Eggers <ceggers@arri.de>
CC: Markus Heidelberg <m.heidelberg@cab.de>, Jiri Prchal
	<jiri.prchal@aksignal.cz>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RFC PATCH 1/2] eeprom: at25: support Cypress FRAMs without device ID
Date: Tue, 1 Apr 2025 15:30:47 +0200
Message-ID: <20250401133148.38330-2-m.heidelberg@cab.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401133148.38330-1-m.heidelberg@cab.de>
References: <20250401133148.38330-1-m.heidelberg@cab.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Adranos.cab.de (10.10.1.54) To Adranos.cab.de (10.10.1.54)

Not all FRAM chips have a device ID and implement the corresponding read
command. For such chips this led to the following error on module
loading:

    at25 spi2.0: Error: no Cypress FRAM (id 00)

The device ID contains the memory size, so devices without this ID are
supported now by setting the size manually in Devicetree using the
"size" property.

Tested with FM25L16B.

According to Infineon/Cypress datasheets, these FRAMs have a device ID:

    FM25V01A
    FM25V02A
    FM25V05
    FM25V10
    FM25V20A
    FM25VN10

but these do not:

    FM25040B
    FM25640B
    FM25C160B
    FM25CL64B
    FM25L04B
    FM25L16B
    FM25W256

So all "FM25V*" FRAMs and only these have a device ID. The letter after
"FM25" (V/C/L/W) only describes the voltage range, though.

Signed-off-by: Markus Heidelberg <m.heidelberg@cab.de>
---
 drivers/misc/eeprom/at25.c | 42 ++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index 595ceb9a7126..16ce36c02ed4 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -382,35 +382,41 @@ static int at25_fram_to_chip(struct device *dev, struct spi_eeprom *chip)
 	struct at25_data *at25 = container_of(chip, struct at25_data, chip);
 	u8 sernum[FM25_SN_LEN];
 	u8 id[FM25_ID_LEN];
+	u32 val;
 	int i;
 
 	strscpy(chip->name, "fm25", sizeof(chip->name));
 
-	/* Get ID of chip */
-	fm25_aux_read(at25, id, FM25_RDID, FM25_ID_LEN);
-	if (id[6] != 0xc2) {
-		dev_err(dev, "Error: no Cypress FRAM (id %02x)\n", id[6]);
-		return -ENODEV;
-	}
-	/* Set size found in ID */
-	if (id[7] < 0x21 || id[7] > 0x26) {
-		dev_err(dev, "Error: unsupported size (id %02x)\n", id[7]);
-		return -ENODEV;
+	if (!device_property_read_u32(dev, "size", &val)) {
+		chip->byte_len = val;
+	} else {
+		/* Get ID of chip */
+		fm25_aux_read(at25, id, FM25_RDID, FM25_ID_LEN);
+		if (id[6] != 0xc2) {
+			dev_err(dev, "Error: no Cypress FRAM (id %02x)\n", id[6]);
+			return -ENODEV;
+		}
+		/* Set size found in ID */
+		if (id[7] < 0x21 || id[7] > 0x26) {
+			dev_err(dev, "Error: unsupported size (id %02x)\n", id[7]);
+			return -ENODEV;
+		}
+
+		chip->byte_len = BIT(id[7] - 0x21 + 4) * 1024;
+
+		if (id[8]) {
+			fm25_aux_read(at25, sernum, FM25_RDSN, FM25_SN_LEN);
+			/* Swap byte order */
+			for (i = 0; i < FM25_SN_LEN; i++)
+				at25->sernum[i] = sernum[FM25_SN_LEN - 1 - i];
+		}
 	}
 
-	chip->byte_len = BIT(id[7] - 0x21 + 4) * 1024;
 	if (chip->byte_len > 64 * 1024)
 		chip->flags |= EE_ADDR3;
 	else
 		chip->flags |= EE_ADDR2;
 
-	if (id[8]) {
-		fm25_aux_read(at25, sernum, FM25_RDSN, FM25_SN_LEN);
-		/* Swap byte order */
-		for (i = 0; i < FM25_SN_LEN; i++)
-			at25->sernum[i] = sernum[FM25_SN_LEN - 1 - i];
-	}
-
 	chip->page_size = PAGE_SIZE;
 	return 0;
 }
-- 
2.43.0


