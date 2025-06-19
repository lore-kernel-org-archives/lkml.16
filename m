Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E9C25CC70
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315934; cv=none; b=t/r6ik9bN3+VJfgMRoHGPXNAQHUSobiW9lV8SQvfKMdNGk6YFZxOpW1lgplhEjEjkCgebC2fA/X3pLXwErvjDPAnuDV76z+T0ZSKUbXbn7H6DlXm6BfQBpBk07wP8uOIaZX+DQOcBFGeh71FQTwqNeOcsq6lov3yqaUJv2XizBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315934; c=relaxed/simple;
	bh=j0D8KCzwpdvfwKiYALqBHWiCezF6D/C7YNd9jZcBaoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nXCTdzTIrkqh4eej47ABTNteRkoz0DFGnZysYeK3PCrck7yQB+ol+jaXC9cuikzw1jdkvzySTPlWk8p65vnll+y09ybeb/e6SkpwonyUVhwMeJY7Ledz3lMsWn6bwRXzT8/uupxf7Gh2m40swJGYf82c7i2z0NFuM15wDZu4j4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=Tw+qvkG/; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="Tw+qvkG/"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b31c978688dso279423a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1750315932; x=1750920732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7cRG7CEONHQ0MzlEt834pCTpHoSgbKYnCgWwAPvcT0=;
        b=Tw+qvkG/4SSuGdO7x9NLEdsWRhoKnf9iVvbE6Q1nEYpHWxNeZ2vWEbGKGkb3q6kE7Q
         Wt2qZc0Ai3651ZQVIHtWNQRbaf0y/af4OnzNxjg1loJvZEfcSL7l2kL/RHy3/IO17mr6
         /PkuBA+ROsNVlhOJra4FGCYml1UDEzBuzLfZlDfHawwDOjucSQaYtDqgf2yPVUspRdx/
         8MzhCF5lHz/HHCai7KrkcVfes3KUSoVzZ/bDtvz+PsaXRmrz8TzBCDgPxqTOVhWrRp2s
         +b6Esjp5McH98erNG+SQL9Qp0lrLvMFogaNoGNIjqUNeX8advwrxnTJ0TV7siQZTMUr4
         2/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750315932; x=1750920732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7cRG7CEONHQ0MzlEt834pCTpHoSgbKYnCgWwAPvcT0=;
        b=fnLZ/GEYF2HwxCnEuG65xgT3cbKtBNutfU9JUiSBdXf+uiAcFtrH9fQHVW+n6PQpa8
         eX79bA5gdhfyVKLt/e539QIZolkcgFx/2tBqmvBy5pNrBz+ycdoWVvAiEGp7gRlMtxbZ
         Fm0ASFq0N/JjFi2ojnxnOTmC8vV9Kb8vXPzDP6TFy7Eg/iv46fUNxV+WYVicbVaGPJHs
         VUXRLNxM70km3MDvj5WyvWnLeurER03xHFLkE7gJTR/h1poslG22CweagGyz/tpkbqXS
         Tj785wBdMDy8hJm5TW2hxgP2NhtKpU4gD+g0iAv1EY15+89aVuD0B3UE2bppyWZTPRod
         06VA==
X-Forwarded-Encrypted: i=1; AJvYcCVykGRIvH5KbfVC5hLgnQw0W1Rq0LTZXB2SsdHZXLYzYQCaAeNLG29K/bpBdaaOrtZAAPRzTCfEVeaEodo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNnMGaU6WNJ2AE1FmSB/2Krn8aQtUMva0OMxTPvDR81DpKzq9K
	+IOledkMfxgHI9uHtw2/VKEkQTyamyxVJ/NwvS4mIPUtlJpCNPSx8tTidDkIH8jMoNM=
X-Gm-Gg: ASbGnctpocvrFXreJ8RHwwl6brJchHwWud3CdOl763Bd1sSJv5gzOBkLe31eH8gK74b
	5RIcLm8gSilqcMMx+IejfDfNRqd8xamY6i5CyeK04sIfcMG1B+lLm4OVIfSpBVAA6IizJXOZE1m
	mPgsYnXf7MaRfps1jY3QkfH/Prt9GcKYhns0FmADdL3aKE+KQOkXkURoFdNBmgYuIx2lg2J4R7X
	c79sBYH7P8CidkjNV8rvES31TJ4BsbSGS/rRq77rIScmpGwQPro0DkbdV5ZzccQBvXaEbtxbrSk
	zpz4Gbn/CL+y50hE/g9FCSoAJDHmv6lOA3tzT2EmZv9l9u1PM49InXz+NoncfDyrUh14JB7d7t5
	xLkh87O8tHrNSu0tl2wTxiDnhlJKmvuWdGEejXh0vv/p3Glmcrg04TA==
X-Google-Smtp-Source: AGHT+IG7Ph+8uJQmjQif7lETBAJgdykbV8iaxZ0QjQChWdVLIxh/wav0NIWFvqQJ1rJ/Yowpku5rcg==
X-Received: by 2002:a17:90b:4a92:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-313f1ca8cf7mr27295456a91.8.1750315931848;
        Wed, 18 Jun 2025 23:52:11 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dfdb9a0sm113108155ad.239.2025.06.18.23.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 23:52:11 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chiang Brian <chiang.brian@inventec.com>
Subject: [PATCH v10 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Thu, 19 Jun 2025 14:42:23 +0800
Message-Id: <20250619064223.3165523-3-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250619064223.3165523-1-chiang.brian@inventec.com>
References: <20250619064223.3165523-1-chiang.brian@inventec.com>
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
v9 -> v10:
- Fix the inconsistent indenting in switch case with tab instead of space
- Run the smatch kchecker to confirm
- Link to v9: https://lore.kernel.org/all/20250610102556.236300-3-chiang.brian@inventec.com/

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
index 63524dff5e75..ca2bfa25eb04 100644
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
+		info->pages = TPS53679_PAGE_NUM;
+		info->identify = tps53685_identify;
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

