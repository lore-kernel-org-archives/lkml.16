Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65762142E86
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 04:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748838758; cv=none; b=QoOaAgyB6x2KnDKKt1NGpytJC7aKH6FgGRW5W2/lKwUqnTmMklIbWcZMC9EQKvOlNJKWsyAVefJ2Z3nfL3D+TrDP9r8AXUi/hsnnv1Sx3S5sdvItJCd/88jIinc6aetdmGOesS0OnfL3st9TW2SdxZky7BtPvYGJXgNVqWersuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748838758; c=relaxed/simple;
	bh=w+VxyWyeHmB8zTHz5vr1CBHLW/vpGjCdvW3zfnG5yck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qu0kxyDnAmxkXdXAmZg+2TZe+bGLNMrqn8iag2U0v+oLCcBlhmAg8kMF/ITubG+dMh0gdherXAy+OrVx2VGPWtNfUmKvEyH8s/FQIY4rwNhnKuogWE6Vmy8e+obqhD6gTtUbAqQMaV9bZT0Ocf96gdHqMKqHNirqtb8gsGGCdi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=RFggX+ag; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="RFggX+ag"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c7a52e97so3124581b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 21:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1748838756; x=1749443556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQuGO6g/SZ9oMjTCL2qfCUD/gDCphaWVpxx22x3N+gg=;
        b=RFggX+ag/MJBDGrDzfhH4QSiafrK4uPyc7X9vLwzDMPMf00iZiGjtM29CNN1K9dm/5
         kCmH/4NY2Jm9IL9aG44X4Ug/aVsoikqN8g7O9ADcodLqwfXUBImqUSaZX13FLdRjjtUw
         Xp6Dic/xniOiwhYR8rcncxfOUXbD/qd3b3p55QBY8OhjQrSvWAgdJNRBkAiA4dYAd7lK
         XWkvZfuwwCm72la0fzM8HxKH2nMrRasvTXyled98I7M7WeVOI4LJjwNA/pTKDJZyEgyV
         JXd4YJ6a/dfuGuk5MqsHZtvrNd37srtkIqmmFa+4PS8pTEts5aw4FkjAqLUnCMvqHpOJ
         WZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748838756; x=1749443556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQuGO6g/SZ9oMjTCL2qfCUD/gDCphaWVpxx22x3N+gg=;
        b=nk2PRIKtAtq20x2nNUivtGSbLaJ/ik3WoPJFzpLMY96EN41BcwJmR6id+vonTaWdsU
         ukPXFYYGGQqO6FxyJyBRRb4x8tnwCbuNdkJAfWcu1YXnsLTEWTzIpAJjB0tlnfZex/mw
         31xNiWLuBtizgcrQXUPppfOVKfVZVzv4yDn4pizZfLC7slB0pnkuLepF+vCznwvcJub8
         gWsuCHyGv3VjI7liWl2xp8bpLh6JdA79NgfxN/Ag3R3HJeaIn0sjq8QagBiUdY/8JzLk
         ylDiEHIQJtStoFV6N2ZizANItPg5bsi263NEoZk4O5q4mZZC3wKV+kwdA/Tp5LPRuJpJ
         6Dyw==
X-Forwarded-Encrypted: i=1; AJvYcCWtlyIc4j1IbDwGRJw+Tv4ms4AJe8q1LH3cyvAMizTZaq8teUvDcjv9S8LZxH7I6X7gVCM00Ci/bQmdaDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOpRtRnDPD0u16Xc72fUi/lM2/r1HJVCBKRO+KhjjA8a6y43YS
	UmGqO+LQ5cBCyc1lzEhlvo8njo/pApqi3+o3UPDz42cHlg9yQFB+pN8b0+GlZ1cVznc=
X-Gm-Gg: ASbGncs0d2ZhrlB7kX8xqekOtbdVjfl/7KqSpxrnwTW2T5AVRhw8U2QVm5+oqN/pmDn
	bvWRq72CsI1scuczH1pNkX24CL2k4IFnUddc/1FO6vjq7kstBASpiFBsX+88ObwGCWJsjNYulU2
	gf/rz+1rj504vbr9aEhGuo8xWA/PnWQFlNXASZF5euMVhnpHYmaIGDswcbGvGUgYGDklVs/veKE
	QeEOmMNB+yYz6Itop27GR9RX35IAtgx6uyZDjrfDnPF1CKaz92VwijTKIdpWOnx0mP8hc1Y2L8X
	bL3PkZB/vn7SjPbDOHjzDoV0cqLe/U+uOHA2bpboAIFitt7hRFywFVzoDg5vh9wNVfLSS27m
X-Google-Smtp-Source: AGHT+IFauMN+Ap2bprtM63mZt0PiRavzePopZZVUp5jvD/1smKCB7wVL6nZ3R9oRF663nQCkly61lA==
X-Received: by 2002:a05:6a21:a346:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-21ae00d4b56mr15459767637.42.1748838755652;
        Sun, 01 Jun 2025 21:32:35 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab743sm6887118b3a.54.2025.06.01.21.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 21:32:35 -0700 (PDT)
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
Subject: [PATCH v8 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Mon,  2 Jun 2025 12:24:54 +0800
Message-Id: <20250602042454.184643-3-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602042454.184643-1-chiang.brian@inventec.com>
References: <20250602042454.184643-1-chiang.brian@inventec.com>
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
v7 -> v8:
	1. Convert the type of device_id in tps53679_identify_multiphase()
	   from int to char *
	2. Run make.cross with ARCH i386
	- Link to v7: https://lore.kernel.org/all/20250515081449.1433772-3-chiang.brian@inventec.com/

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
index 63524dff5e75..7ef0c730e2fe 100644
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

