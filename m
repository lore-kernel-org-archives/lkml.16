Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C787A186E20
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501638; cv=none; b=Zyr9flfP/Lf3rEYXstSJwEuz42NPYASN3oL8AsW+HfjDFJEJEXw9UKM2Q4IsxWunWHTuKRj7U/LtR7/wFNYw+LV8IExuQQ9Oe5iq6x/AMJdyad92cTx0QUz3OLAeR24UoZ8zLTGAqJ7Dp2GyKzCNxBccNIHU+EGWxQiZqDXh67I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501638; c=relaxed/simple;
	bh=PmojUCnrJqdi6ctPr2LDOJj4If88C0jCyODfzBPkVZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hRqCAwzZVtBSRqwuihEUJ5DvFq/sYnDrB3JgX/QUab/FJRnjK6d0HnPelKzUx7KaciVtA9hcX7SNnlgZrKu6/xaTRvisbSbwIuvgzE2UfmFEhGQjSBP5NrQ/agXdJw1f+IGtSRZIBMALMEm8d+sduXOZmcwueNuBbOb8W6Ai4NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=HffbYUUv; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="HffbYUUv"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so1103143a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1745501633; x=1746106433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAd6NcWDbAEkgnYX5ETwh+0vWLsl9guxGLJqEAiLt0U=;
        b=HffbYUUvoCFOU/h1qQUwRgPCJYaEXF6WlbwroPu7WNatjmO+rR7vEKUAHsCGxrjaKa
         IP4REwSUPXNyfOih2HIZZ4ML1UNtSnmUi4X72GlVYngk5pfAYupFLZgWt8wSwFx7G3K3
         IMd8Rd1DN6wxLMnW09sP+pXJMcWd2uEoW6Ao5Mt953OrGLLnId8zjsWnDBM8KmVD9OVq
         xQdz1Dq83Hb96ZLT99TfzqjgOYJlCc6fNO7LYU5rFNlZXFJ4vMR+7QM/9wismHzvQ97k
         LJJ7QOvW6dpT469Hdsfljux+lYexR6E8fuHHd4QK1LHR3ZWeCG1j1+k2d91BfISS0RxD
         2IAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745501633; x=1746106433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAd6NcWDbAEkgnYX5ETwh+0vWLsl9guxGLJqEAiLt0U=;
        b=MQhtvWGHzInEEPeAablRGUMmNBNlCWRK4TeqScnRpqPVz0yokaM5EAhAmwVXrywPSm
         hhKPgcQYxM1iBolvdu2XpFIfWt3MuwSXY5FBG+XGG7UcY2l6/iM02AXOplABoPzMyvEo
         Ihj3645bNldd/JjsYkSvDhT4R6MvMYULiGdUUeKmXVhIk81lxliKy+WkJYsaHFtttuM7
         lszz7aNxT/tbC7ZXSxSgpDDqiB10B0bfKTCisZm0nKZYPWGb2UMNYmXu8bppxXSxg5Y4
         8C9UAgrA/+ni67dTZj7VBT7ZySwBDRq9PY/TJ2eQSFxwiwzx4GEJCjKJJxBumaWABepQ
         U5aA==
X-Forwarded-Encrypted: i=1; AJvYcCX6tY1/jX34qCLqvGJ0lfk+L7C3GSAfduP3e7wF1gwIyPS6HXwp9UUEqNYsoXkzo3ExKgGojpFkIa/XlCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYAc9nIf2eqhNNNxQwCK4KYghkoCJz0sOynCF0Ki5hzAdKj3Ae
	AQ/WCvXBB+sISsrxXlLluZnYExJA2J3y+XTNragRBzAOHJwJCei45xqEqbAZgQP3HLhEJdqNzem
	X
X-Gm-Gg: ASbGncv9iKQl5h1XSZb9D6AqXziDXWMSd88Od44rlXAaJCSxnHVE5MdGY0sZyN7cORe
	XuXr3v2m+qOYydoMJliRjSpX5Ht3hCx3WlyhoilS+F6a4R9U06Kj6zwwdmI2zDqnhO+d0IMsE2n
	OewDLOPB9Baf68pbwMI+vXG8RSRy18K1d/oaNXGTUN/EXCKlwS64gKfNENFk4YWk+kLRPFdGvub
	VhxJ18hwDMgdh/yzMhPyfG+w8JF3j4uQ4yUf+9kQr8rHzPXcWzpOOYJWi85arnOeLkZUAUqnAQq
	KI+SMTcupmMvn+FBxvNS5aw5EGn6Vk9yWX3ir+E1jD86Eo+w2Hho1VOAeXoPpx/Raw9yCIOCMvR
	R6VzH+3UDQfk+ATqT+zeM1Jq2Dkq0wFPcuhFpAPAf68oYWLZib8FPcWuy
X-Google-Smtp-Source: AGHT+IE5MxG2v6sAMsA9v4eeCn0OWfJW+7T9eGpMN/cvo+iq3Qr4O9mPR89K/lfCHHiHtXjigxiacQ==
X-Received: by 2002:a17:90b:2d10:b0:2f5:88bb:12f with SMTP id 98e67ed59e1d1-309ed28e9f7mr3454247a91.21.1745501632892;
        Thu, 24 Apr 2025 06:33:52 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0d5c72sm1321147a91.43.2025.04.24.06.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:33:52 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
X-Google-Original-From: Chiang Brian <chiang.brian@inventec.corp-partner.google.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Thu, 24 Apr 2025 21:25:37 +0800
Message-Id: <20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424132538.2004510-1-chiang.brian@inventec.corp-partner.google.com>
References: <20250424132538.2004510-1-chiang.brian@inventec.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chiang Brian <chiang.brian@inventec.com>

The TPS53685 is a fully AMD SVI3 compliant step down
controller with trans-inductor voltage regulator
(TLVR) topology support, dual channels, built-in
non-volatile memory (NVM), PMBus interface, and
full compatible with TI NexFET smart power
stages.
Add support for it to the tps53679 driver.

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
V5 -> V6:
	1. Add information about tps53685 into tps53679.rst
	2. Add additional flags when identifing the chip as tps53685
	3. Adjust length once returned device id is terminated by null character
V4 -> V5: 
	1. document the compatible of tps53685 into dt-bindings
	2. add the buffer length as argument for %*ph
	3. Add Changelog
V3 -> V4: 
	1. Add length comparison into the comparison of "id",or it may be true when 
	   the substring of "id" matches device id. 
	2. Restore `return 0;` in `tps53679_identify_chip()`
V2 -> V3:
	1. Remove the length comparsion in the comparison of "id".
V1 -> V2: 
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

