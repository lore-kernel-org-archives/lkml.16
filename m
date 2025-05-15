Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823182882BD
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297365; cv=none; b=IxTH2THLxQA5mIxo+R0/QvaOH3daqaCMYJWDryQGakICxz6CsleZbFVhS5BkmzM+8FFC5vY72iLXVcGg1K6O15WO1eTzrWHaRnSH3TWUuGyiwfhl3pb2Q1VL0OST4dKF0IKGToSN7TlBET95ljqBtlEYM0Fsh5y8x1DrqIvxTDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297365; c=relaxed/simple;
	bh=92odk2sd4sfHthMDJynyDSvgpIspg2D4IeMy8RWB//k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pXmfQ4yfn8i9xI8dYn5tiPpxWBVp6THdL3dT36+cqQKsTSm8LlhYtMyzpGp2HLHuLqugaQh5EC8zJWaLRMzlolZ7Ex0HoAtSbgKVQPcqp1RhyAnuTfY1XJNM7WYf3AMqZMwvQzZRdt28+S4P5p9lGUINleJm6jDw1/dIpZoI/dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=BprQF6cf; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="BprQF6cf"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30a894cc07cso594780a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1747297362; x=1747902162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwF2mpLnEXgp6MS24DBfTJGU9J3NTQxVKIISS1QkMRY=;
        b=BprQF6cf1DYwGex5AP/dD5Mwqo9uYIXNN04hG2y2+onqfdzzL48z3MiLi9n+fJg+UE
         WvDj6icQu3/o+m5pULXWX99o286OPsRIOXQfo5YHm5JS/fwN261MXgFuENHZON1YV9LD
         aqy/cQqUe9PSvbvDdnuS/8WDfU/o5Aaw4Su5OOTTUVd9tS1p01FaUworE+UVnBumxdKw
         42EAQMe//ZLPggVyxYAq7V+lZLSmsEFY+LG6fW1w4KpR7G2Une1eKU/65sXMp7IKGG62
         s6DzguPmyYchw779JJ1n6tBEfV4tySWH5pOAD/XfwE3A/VCOwqDlBT4bx9Qsx0R1wZqd
         II4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297362; x=1747902162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwF2mpLnEXgp6MS24DBfTJGU9J3NTQxVKIISS1QkMRY=;
        b=e9quE1a6N4e4Z85kvkOkrNUVnXGQCMf4WiJOZYqRHXtL5AkS6WlIL1G9k6/1m0/UHF
         NVywGauaoAYOZYLlMWom6/JSWFm3BUHC6uGTHIXaNZJzuBvohkexzK0GJ4IEhIJkazYj
         0JsYbj9SOlC2Sk5XNzCR25uWDyc3nad+4kge/RMmiwK7D0JwGvwxgo7RYWzge30x0cL8
         8ojxDDJ7KrMUErvQEp0XWbBBGUWrFw9HYqXlVz1f63NKe7a6m7lWZaLEbmPqi/gpuomL
         sKZ6J4OIC9P0FTs+l+kRrsjwHpW5hM/MOGAEiZpVgdC8VwW8bBBCAlTolI5OuX2/z87l
         uoKg==
X-Forwarded-Encrypted: i=1; AJvYcCXEzmfJfmwuPpz6n9G4AwH5s5VUOPGdGa6za6jT2FMJInORX7XOrEUlDIMLQlbhS2xsXXLuTSuYlAjjlJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfHzX1xlRm3/dcxJymLHYOKpbXjhDFdptiKwXExhgzmb5++B2X
	CHKFXSsgJdoy4uxfqganVaxsMtdweOoCTSoQ08kBs6IC+6VcEI+iqc1PSJspS2E=
X-Gm-Gg: ASbGncsI6SJKcNZZlO7VHZYG6adNHxu4QQdCWP0WnqleVWJz5Juw41CdiMxNkU0ohEU
	cMSeOhiFp08LTaGIJTU0ElVorrrGcmfDYcHWOOk9c7xMc/jftNzopMo7W7/kNjok2m19q2MgpUa
	i8C3LqHV4Vn4SZCQid2D3qEynTVWoqOyu+86l5ALcd66DKt4mfu9A3HKLKQT8y4fyfxzzsqAZUW
	21fOyQIf1CzCTre4+ETbNBOoBWPuOVQTTrQb5T73Vm6AOs5bLoCaC8gIyoiuG4hQpJgvisfxIN+
	Xj0ai1gzq2WL5/BVBjt4X562A9kO3RctJvqFQfzB8lqO3sTtKZn3S1Kbdg4LURJEUtYCQ4hsRFN
	agQDCRsN0dQC70E+TJRI6Sk29P2xUkGohiVkqssVu6qI=
X-Google-Smtp-Source: AGHT+IFoAqDUpGzwC9J9Vfxc7d04H0Ld+rHi4ImfRVH+QnmmS1i9bVST/jFIeL7kigUyfhHbFokLQQ==
X-Received: by 2002:a17:90b:55d0:b0:309:fac6:44f9 with SMTP id 98e67ed59e1d1-30e51947471mr2175743a91.31.1747297361651;
        Thu, 15 May 2025 01:22:41 -0700 (PDT)
Received: from localhost.localdomain (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33451e97sm2909715a91.25.2025.05.15.01.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:22:41 -0700 (PDT)
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
Subject: [PATCH v7 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Thu, 15 May 2025 16:14:39 +0800
Message-Id: <20250515081449.1433772-3-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515081449.1433772-1-chiang.brian@inventec.com>
References: <20250515081449.1433772-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TPS53685 is a fully AMD SVI3 compliant step down
controller with trans-inductor voltage regulator
(TLVR) topology support, dual channels, built-in
non-volatile memory (NVM), PMBus interface, and
full compatible with TI NexFET smart power
stages.
Add support for it to the tps53679 driver.

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
v6 -> v7:
	1. Modify the type of device_id from u16 to char *
	2. Run make.cross with ARCH nios2, powerpc, and riscv
	- Link to v6: https://lore.kernel.org/all/20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com/

v5 -> v6:
	1. Add information about tps53685 into tps53679.rst
	2. Add additional flags when identifing the chip as tps53685
	3. Adjust length once returned device id is terminated by null character
	- Link to v5: https://lore.kernel.org/all/20250314033040.3190642-1-chiang.brian@inventec.com/

v4 -> v5: 
	1. document the compatible of tps53685 into dt-bindings
	2. add the buffer length as argument for %*ph
	3. Add Changelog
	- Link to v4: https://lore.kernel.org/all/CAJCfHmW61d2jd_tYpNEqBG_Z58bEnVKAmsvhrEP1zXQoXqrUVw@mail.gmail.com/

v3 -> v4: 
	1. Add length comparison into the comparison of "id",or it may be true when 
	   the substring of "id" matches device id. 
	2. Restore `return 0;` in `tps53679_identify_chip()`
	- Link to v3: https://lore.kernel.org/all/CAJCfHmVyaDPh0_ThPjhBP0zMO1oE1AR=4=Zsa0cMPXU3J4v6dw@mail.gmail.com/

v2 -> v3:
	1. Remove the length comparsion in the comparison of "id".
	- Link to v2: https://lore.kernel.org/all/CAJCfHmUteFM+nUZWBWvmwFjALg1QUL5r+=syU1HmYTL1ewQWqA@mail.gmail.com/

v1 -> v2: 
	1. Modify subject and description to meet requirements
	2. Add "tps53685" into enum chips with numeric order
	3. Modify the content of marco "TPS53681_DEVICE_ID" from 0x81 to "\x81"
	   Add marco "TPS53685_DEVICE_ID" with content "TIShP"
	4. Modify the type of "id" from u16 to char* in `tps53679_identify_chip()`
	5. Modify the comparison of "id". It will be true if the string "id" matches 
	   device ID and compare with type char*,
	6. Add the length comparsion into the comparison of "id".
	7. Modify "len" as return code in `tps53679_identify_chip()`
	8. Output device error log with %*ph, instead of 0x%x\n" 
	9. Use existing tps53679_identify_multiphase() with argument 
	   "TPS53685_DEVICE_ID" in tps53685_identify() rather than creating one
	   tps53685_identify_multiphase()
	- Link to v1: https://lore.kernel.org/all/CAJCfHmVy3O4-nz2_PKF7TcXYr+HqTte1-bdUWLBmV7JOS7He1g@mail.gmail.com/

 Documentation/hwmon/tps53679.rst |  8 +++++++
 drivers/hwmon/pmbus/tps53679.c   | 36 +++++++++++++++++++++++++++-----
 2 files changed, 39 insertions(+), 5 deletions(-)

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
index 63524dff5e75..01fefaef1688 100644
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
@@ -138,6 +147,16 @@ static int tps53679_identify(struct i2c_client *client,
 	return tps53679_identify_mode(client, info);
 }
 
+static int tps53685_identify(struct i2c_client *client,
+				 struct pmbus_driver_info *info)
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
2.43.0

