Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FC128C2C9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551785; cv=none; b=lU9Zk4bckfSOxzx13Ofwm3b5P2MM+Ixi796FBiFLSM5ZPnxR0+Mou+7JydJAba7Dg02OvRUxRnIa6VjZ78YV9Sa3ru0oOXVt7UOGS2Kno7cYj70V1JESsedwcLeemlJ+hmtUYcECRtKt9g08GQSixJ40nVuzBkjg9c5umMNAsjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551785; c=relaxed/simple;
	bh=dmq8o36TWJB0FyTjqJVgXYaya0q5Y0iYVdvbZ4aVtHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UOl/adwrhFUa7gChf42dlFX0D/aloJXju3DGfenNCtuQrkQgmSCJ6//zc7cnegQaOyoDHCmGbaJiT0HBuaD9weA6tJ+Vpf1hsVeKpGtDWxLSsg/nvXn94bpyVWgt0md4NsVUogse5q8Milion7f6DB8huQqRw/J5NDKVNJZVftw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=ab1CXMXk; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="ab1CXMXk"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso3979068a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749551782; x=1750156582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxWDwPFv6h0dImX3Gmoz9VyaNxnEqO7/sNmZV6i1DE4=;
        b=ab1CXMXkp07nvtmr7Dy6W43krO5X0o+wXtQQC0/0C8uxRgHm1mwNu7Xf0L7E1OJyB0
         3DkqZTaJVxBGq7RId82zpuuY9sx4DTXKluOm8GfHJbRwYZZAEqTG8qbpkwOyuvM+g5Vf
         Xctv+AMdTVbr5pnD6BYwhvHrIS/P4QWebUlhNe/dNc2Fut/hpFkwDg6FU8it8rOokSQD
         V3u24YRVHgr3N0lKjG+LX9QE32KzR3YVBd+MOatbt3VfTeHLERdhB/rioSiVNxjR0NhA
         pAVWPbjnKRyKRtQYBKRf1stpYSLkJxdPgawiOZ2SJj9ZaL91TRhlhWq4l+3p2vEN3iYv
         pxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551782; x=1750156582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxWDwPFv6h0dImX3Gmoz9VyaNxnEqO7/sNmZV6i1DE4=;
        b=s29ooWeCOG2F1WiWkCGqBDIs7FpVzioN+5d5zaAv4YbxhV3SWagU51I6bGlqtsfqd9
         RjQdwPKexDL8Gw+8sXziZiq6hQM7r9oljKLZsugbEs9nsdbxposukbL2fNBoZmbWyKAJ
         bWyRQTizv2fZulTFrGgOj+BNQITIeFiZ5r0mZpAH4vxc8fMMlp2wPbv9cHh2e3LTWD/k
         UbFo/wDdE558v/Z+PW0WGxbSsXP50KgU6m/cCOWlFNQflX4ftpcbnj3YmdpoYW3UOqAV
         nC8SZ+Xy/8xb6qqYz3CViHTSY6mTjgGMPNL9HY+GBCBTgcBoMVxqtHGhY0br4yHSmSRG
         otcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1Wr3T+9lii0+7b1mpHdDxBQV0HGzxGo74HZWWFka/qSwRj1YDZKDylTPnKmetE4b2DXiXBMz+KjRyGxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyi0SNkUDV1MrUJzkiCdP06ZHUcZTST6VyR3yiF2mhiiS7VIJr
	t9fDbbI2TiccldJtoYKpGJSfAInF9FqiG9y6Mw0ig9hfTDP1esV0/4zasyAuoFTL/ds=
X-Gm-Gg: ASbGnctLZUYLfW83SHyb2fry3a+zDtPGO/AKqHwlpRd8oVIijYpPYhyuNq1SOAciNpE
	Dl5lNfhmD0ti5vICKsubhM+meR/JcshNMhG7VycXenJDhB4oWtqH0aTX9/9YSeLoUD92hYZT1CM
	wpmAdrK9hW1JRT3BqdBZPPMqjMEwZFo3s8DdGMceYql89SP0ObrAR354PJxdLoiPTJ9VOZXSwiC
	4j5PHXJPqh3Mt6h7P8A6ugJskdajro8UxIg8qlLDybOigp1hJcFAWzv+JjTIgOcdIgPFK/FUmYO
	K3Lbxgt2muSagRovxU+JGoKZvVmgv1a1YDUMFSTeA7GZQQr8MSlq929AhpaX6yZLS1jqmOJXM+O
	/3kttNfibufNQCMAO3B7r8DyxZpAiK+4z1kCWmslQsHs=
X-Google-Smtp-Source: AGHT+IGn8fcfrrXvZkpHFKZoSgfdWXzGVsrIu9dy8O+QoTfXt6qGcbJSz6dn7vl+kdYmmnpCPjuB9Q==
X-Received: by 2002:a17:90b:3a8b:b0:311:e8cc:424e with SMTP id 98e67ed59e1d1-3134767ea00mr23916915a91.24.1749551781667;
        Tue, 10 Jun 2025 03:36:21 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349ff7e14sm7800595a91.45.2025.06.10.03.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:36:21 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Tue, 10 Jun 2025 18:25:55 +0800
Message-Id: <20250610102556.236300-3-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250610102556.236300-1-chiang.brian@inventec.com>
References: <20250610102556.236300-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TPS53685 is a fully AMD SVI3 compliant step down controller with
trans-inductor voltage regulator(TLVR) topology support, dual channels,
built-in non-volatile memory (NVM), PMBus interface, and full compatible
with TI NexFET smart power stages.

Add support for it to the tps53679 driver.

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
v8 -> v9:
- Wrap commit message body at 75 columns
- Fix the alignment to match open parenthesis
- Link to v8: https://lore.kernel.org/all/20250602042454.184643-3-chiang.brian@inventec.com/

v7 -> v8:
- Convert the type of device_id in tps53679_identify_multiphase() from int to char *
- Run make.cross with ARCH i386
- Link to v7: https://lore.kernel.org/all/20250515081449.1433772-3-chiang.brian@inventec.com/

v6 -> v7:
- Modify the type of device_id from u16 to char *
- Run make.cross with ARCH nios2, powerpc, and riscv
- Link to v6: https://lore.kernel.org/all/20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com/

v5 -> v6:
- Add information about tps53685 into tps53679.rst
- Add additional flags when identifing the chip as tps53685
- Adjust length once returned device id is terminated by null character
- Link to v5: https://lore.kernel.org/all/20250314033040.3190642-1-chiang.brian@inventec.com/

v4 -> v5: 
- document the compatible of tps53685 into dt-bindings
- add the buffer length as argument for %*ph
- Add Changelog
- Link to v4: https://lore.kernel.org/all/CAJCfHmW61d2jd_tYpNEqBG_Z58bEnVKAmsvhrEP1zXQoXqrUVw@mail.gmail.com/

v3 -> v4: 
- Add length comparison into the comparison of "id",or it may be true when the substring of "id" matches device id. 
- Restore `return 0;` in `tps53679_identify_chip()`
- Link to v3: https://lore.kernel.org/all/CAJCfHmVyaDPh0_ThPjhBP0zMO1oE1AR=4=Zsa0cMPXU3J4v6dw@mail.gmail.com/

v2 -> v3:
- Remove the length comparsion in the comparison of "id".
- Link to v2: https://lore.kernel.org/all/CAJCfHmUteFM+nUZWBWvmwFjALg1QUL5r+=syU1HmYTL1ewQWqA@mail.gmail.com/

v1 -> v2: 
- Modify subject and description to meet requirements
- Add "tps53685" into enum chips with numeric order
- Modify the content of marco "TPS53681_DEVICE_ID" from 0x81 to "\x81" 
- Add marco "TPS53685_DEVICE_ID" with content "TIShP"
- Modify the type of "id" from u16 to char* in `tps53679_identify_chip()`
- Modify the comparison of "id". It will be true if the string "id" matches device ID and compare with type char*,
- Add the length comparsion into the comparison of "id".
- Modify "len" as return code in `tps53679_identify_chip()`
- Output device error log with %*ph, instead of 0x%x\n" 
- Use existing tps53679_identify_multiphase() with argument "TPS53685_DEVICE_ID" in tps53685_identify() rather than creating one tps53685_identify_multiphase()
- Link to v1: https://lore.kernel.org/all/CAJCfHmVy3O4-nz2_PKF7TcXYr+HqTte1-bdUWLBmV7JOS7He1g@mail.gmail.com/

 Documentation/hwmon/tps53679.rst |  8 +++++++
 drivers/hwmon/pmbus/tps53679.c   | 37 ++++++++++++++++++++++++++------
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/tps53679.rst b/Documentation/hwmon/tps53679.rst
index 3b9561648c24..dd5e4a37375d 100644
--- a/Documentation/hwmon/tps53679.rst
+++ b/Documentation/hwmon/tps53679.rst
@@ -43,6 +43,14 @@ Supported chips:
 
     Datasheet: https://www.ti.com/lit/gpn/TPS53681
 
+  * Texas Instruments TPS53685
+
+    Prefix: 'tps53685'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.ti.com/lit/gpn/TPS53685
+
   * Texas Instruments TPS53688
 
     Prefix: 'tps53688'
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 63524dff5e75..47c28a8e25a5 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -16,7 +16,7 @@
 #include "pmbus.h"
 
 enum chips {
-	tps53647, tps53667, tps53676, tps53679, tps53681, tps53688
+	tps53647, tps53667, tps53676, tps53679, tps53681, tps53685, tps53688
 };
 
 #define TPS53647_PAGE_NUM		1
@@ -31,7 +31,8 @@ enum chips {
 #define TPS53679_PROT_VR13_5MV		0x07 /* VR13.0 mode, 5-mV DAC */
 #define TPS53679_PAGE_NUM		2
 
-#define TPS53681_DEVICE_ID		0x81
+#define TPS53681_DEVICE_ID     "\x81"
+#define TPS53685_DEVICE_ID     "TIShP"
 
 #define TPS53681_PMBUS_REVISION		0x33
 
@@ -86,10 +87,12 @@ static int tps53679_identify_phases(struct i2c_client *client,
 }
 
 static int tps53679_identify_chip(struct i2c_client *client,
-				  u8 revision, u16 id)
+				  u8 revision, char *id)
 {
 	u8 buf[I2C_SMBUS_BLOCK_MAX];
 	int ret;
+	int buf_len;
+	int id_len;
 
 	ret = pmbus_read_byte_data(client, 0, PMBUS_REVISION);
 	if (ret < 0)
@@ -102,8 +105,14 @@ static int tps53679_identify_chip(struct i2c_client *client,
 	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
 	if (ret < 0)
 		return ret;
-	if (ret != 1 || buf[0] != id) {
-		dev_err(&client->dev, "Unexpected device ID 0x%x\n", buf[0]);
+
+	/* Adjust length if null terminator if present */
+	buf_len = (buf[ret - 1] != '\x00' ? ret : ret - 1);
+
+	id_len = strlen(id);
+
+	if (buf_len != id_len || strncmp(id, buf, id_len)) {
+		dev_err(&client->dev, "Unexpected device ID: %*ph\n", ret, buf);
 		return -ENODEV;
 	}
 	return 0;
@@ -117,7 +126,7 @@ static int tps53679_identify_chip(struct i2c_client *client,
  */
 static int tps53679_identify_multiphase(struct i2c_client *client,
 					struct pmbus_driver_info *info,
-					int pmbus_rev, int device_id)
+					int pmbus_rev, char *device_id)
 {
 	int ret;
 
@@ -138,6 +147,16 @@ static int tps53679_identify(struct i2c_client *client,
 	return tps53679_identify_mode(client, info);
 }
 
+static int tps53685_identify(struct i2c_client *client,
+			     struct pmbus_driver_info *info)
+{
+	info->func[1] |= PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+			 PMBUS_HAVE_STATUS_INPUT;
+	info->format[PSC_VOLTAGE_OUT] = linear;
+	return tps53679_identify_chip(client, TPS53681_PMBUS_REVISION,
+					   TPS53685_DEVICE_ID);
+}
+
 static int tps53681_identify(struct i2c_client *client,
 			     struct pmbus_driver_info *info)
 {
@@ -263,6 +282,10 @@ static int tps53679_probe(struct i2c_client *client)
 		info->identify = tps53681_identify;
 		info->read_word_data = tps53681_read_word_data;
 		break;
+	case tps53685:
+	    info->pages = TPS53679_PAGE_NUM;
+	    info->identify = tps53685_identify;
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -277,6 +300,7 @@ static const struct i2c_device_id tps53679_id[] = {
 	{"tps53676", tps53676},
 	{"tps53679", tps53679},
 	{"tps53681", tps53681},
+	{"tps53685", tps53685},
 	{"tps53688", tps53688},
 	{}
 };
@@ -289,6 +313,7 @@ static const struct of_device_id __maybe_unused tps53679_of_match[] = {
 	{.compatible = "ti,tps53676", .data = (void *)tps53676},
 	{.compatible = "ti,tps53679", .data = (void *)tps53679},
 	{.compatible = "ti,tps53681", .data = (void *)tps53681},
+	{.compatible = "ti,tps53685", .data = (void *)tps53685},
 	{.compatible = "ti,tps53688", .data = (void *)tps53688},
 	{}
 };
-- 
2.25.1

