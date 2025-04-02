Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1345B7082F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625676; cv=none; b=bopyuhutbQKZqiE4z63t3ZoxePElK31iDW0dXnUpug5Q8qgru7JFmRBCTLnmoi99M8IJZskHAbXBTBLf6uAAlMFRaY+pbrK6QjWeud2gnp+DXuphnm+qXmE6tPdiBN2L82XgNJyi69OZ6w3TqVx6Xy37dJpScL15sfsvZhkHf8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625676; c=relaxed/simple;
	bh=ksYDJJamouaX+7+ZknwgmKc24Oi0rZ+snVeSKyhAGHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LByW+OJjHGkBrWE83NsB50CyLi2U4dArPCF15ZNKmFktT5hntxeWI4W1iEKcFu5yUpNAhETr30PMYTKWx/4KVsA6Bj36LBAS0LuQJ8yWk9Q2llPhuORA0HwFhgiubNf2/W7c1q03kLX/Rb20bqq/WmR/ddf+iSxuvNc+XRRF+0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=F4qbzFAj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="F4qbzFAj"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224191d92e4so2233435ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743625672; x=1744230472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZ2EAW/2N3IU4uVQRL2HRkz+DYOEYY23NM5sMNZ7QZk=;
        b=F4qbzFAjLSns+pYKZVW3sxhjyo0ECgflI+N/xJnbAMkZVS82tFhrssIO9of2cCFiQU
         HBDzc1hthg245zQiE2k7P8IHopa19naHjuMwARoxN+55QsLbV5rtemQPVD+ic53GnKJ7
         3G2XYPN7sumKy+uvGo90JZVZccRFHZiiLoPSxhU8boWXE///9Gh6yEcEcBak7GILjsqP
         e8v3DvgOVxu1BVxNhBICWapuRrcjdZPjD5YKkw254YrmI4PWI2Wsj3jH5PVzap7R0NMy
         ShUC8D7JtYPc1lrXbiWcfZV1GJIN3jQZlWuvPUD8r6h1Um/QDRXk4q8+8Lat51OJMVuG
         gKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743625672; x=1744230472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZ2EAW/2N3IU4uVQRL2HRkz+DYOEYY23NM5sMNZ7QZk=;
        b=SzTEBKoSAR5ScvkG9IbpV4anycyFbnrcI1s1Q3HxubWmokf55B53wQqWSDeEy1KPsv
         iL9jEebjAwTtecENf2a/refD0lHPzmwReq5VpgR0JBnV8J3Jrqlf7gTSYkvz3ltxAEHz
         YTJ9CYg0/1t1/wHL+Qy3FQkwxxFDmDUHsIuuKF+5FSpRSRC0xg8ljCtOToP2FVUiMtmH
         9Dsc9FzD6NYfwN/cYvnZJW/bdLHXEONSyteB1ZoasDoY5qLbDw249aM4ODWWSliRX+kT
         pFUcC/SxpsiFBo/Xsd9KBUQZeTJX+kG4b+nWVuhwrtC5+pdcfEtpp45nN/Whc+lDCFUb
         TJJA==
X-Forwarded-Encrypted: i=1; AJvYcCXoEQU20O5vOH3w+3UffWqTmUUI/XvNXLirbkypbE5gBxnDDqbHwk/cfMJ9qP0cS7qIQe6EbrRWYm7znBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSzbcml82lzAY4h+QeqGP4CNxUxy1z4qM7QM7CtBZoOjXqlEkn
	ixtruZ+Kf2qwEVPduLE2V+2tlwzYZzflu30bNH8VlGhWm/QVvr4zunpQZNYsjSup0LF4c8LOCwY
	ORqA=
X-Gm-Gg: ASbGnctVKosWLlwE+Kw7Nzt5Hr2/KvoWV7H8o7BREKmqfpf9GubuadyrPiQv82ygEa4
	8rdu1+FPVXTVDEfbAVCs8g278rPxAkj1VbtdzbOxD43IeHnSH9gJ7XSx8W0x45GFc9mAiNIsd93
	NM9HvqqsfJHXDyr3WD9Mfq4ppS2EvIp74CgLD0eyPCSIyihNogp6hBKYafuHzZ8TftQT/C4cyJ0
	OAsEnv7FfsHQ8kAUjVVlz+buicRHoAEq88cG++G70EwYIeXkhkUYdO6yB8sFYPrVBpdUO0wVdb3
	7c3SclU1LMHbt+4UF96R/UvZRJRCCp3WRkIENWExR3Hv6B/nTky+Qoi6SJ20RSCPhUbcaU2TF9e
	EFb4YO9lYRmLcUnZflaLX27N5+DLNdxqN
X-Google-Smtp-Source: AGHT+IGJuPcuk2hk34oRzIG3vN5RHFzCC92WEXTwtbVH+o3TJw2XVt+DiMNuKPmXefr2m//Bg7iVhQ==
X-Received: by 2002:a17:902:f651:b0:224:1221:1ab4 with SMTP id d9443c01a7336-22977d9c36fmr2135875ad.22.1743625672258;
        Wed, 02 Apr 2025 13:27:52 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:9c70:5442:2794:3e8d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf222sm113137195ad.129.2025.04.02.13.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 13:27:51 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v2] hwmon: (pmbus): Introduce page_change_delay
Date: Wed,  2 Apr 2025 13:27:41 -0700
Message-ID: <20250402202741.3593606-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
In-Reply-To: <20250402193452.3571888-1-william@wkennington.com>
References: <20250402193452.3571888-1-william@wkennington.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have some buggy pmbus devices that require a delay after performing a
page change operation before trying to issue more commands to the
device.

This allows for a configurable delay after page changes, but not
affecting other read or write operations.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
V1 -> V2: Simplify how the backoff time is stored and computed

 drivers/hwmon/pmbus/pmbus.h      |  1 +
 drivers/hwmon/pmbus/pmbus_core.c | 69 ++++++++++++++++----------------
 2 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index ddb19c9726d6..742dafc44390 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -482,6 +482,7 @@ struct pmbus_driver_info {
 	 */
 	int access_delay;		/* in microseconds */
 	int write_delay;		/* in microseconds */
+	int page_change_delay;		/* in microseconds */
 };
 
 /* Regulator ops */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 787683e83db6..46d80d3743d9 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -114,8 +114,8 @@ struct pmbus_data {
 
 	int vout_low[PMBUS_PAGES];	/* voltage low margin */
 	int vout_high[PMBUS_PAGES];	/* voltage high margin */
-	ktime_t write_time;		/* Last SMBUS write timestamp */
-	ktime_t access_time;		/* Last SMBUS access timestamp */
+
+	ktime_t next_access_backoff;	/* Wait until at least this time */
 };
 
 struct pmbus_debugfs_entry {
@@ -170,33 +170,34 @@ EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");
 static void pmbus_wait(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
-	const struct pmbus_driver_info *info = data->info;
-	s64 delta;
+	s64 delay = ktime_us_delta(data->next_access_backoff, ktime_get());
 
-	if (info->access_delay) {
-		delta = ktime_us_delta(ktime_get(), data->access_time);
+	if (delay > 0)
+		fsleep(delay);
+}
 
-		if (delta < info->access_delay)
-			fsleep(info->access_delay - delta);
-	} else if (info->write_delay) {
-		delta = ktime_us_delta(ktime_get(), data->write_time);
+#define PMBUS_OP_READ_BIT 1
+#define PMBUS_OP_WRITE_BIT 2
+#define PMBUS_OP_PAGE_CHANGE_BIT 4
 
-		if (delta < info->write_delay)
-			fsleep(info->write_delay - delta);
-	}
-}
+#define PMBUS_OP_READ PMBUS_OP_READ_BIT
+#define PMBUS_OP_WRITE PMBUS_OP_WRITE_BIT
+#define PMBUS_OP_PAGE_CHANGE (PMBUS_OP_PAGE_CHANGE_BIT | PMBUS_OP_WRITE)
 
-/* Sets the last accessed timestamp for pmbus_wait */
-static void pmbus_update_ts(struct i2c_client *client, bool write_op)
+/* Sets the last operation timestamp for pmbus_wait */
+static void pmbus_update_ts(struct i2c_client *client, int op)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	const struct pmbus_driver_info *info = data->info;
+	int delay = info->access_delay;
 
-	if (info->access_delay) {
-		data->access_time = ktime_get();
-	} else if (info->write_delay && write_op) {
-		data->write_time = ktime_get();
-	}
+	if (op & PMBUS_OP_WRITE_BIT)
+		delay = max(delay, info->write_delay);
+	if (op & PMBUS_OP_PAGE_CHANGE_BIT)
+		delay = max(delay, info->page_change_delay);
+
+	if (delay > 0)
+		data->next_access_backoff = ktime_add_us(ktime_get(), delay);
 }
 
 int pmbus_set_page(struct i2c_client *client, int page, int phase)
@@ -211,13 +212,13 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 	    data->info->pages > 1 && page != data->currpage) {
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
-		pmbus_update_ts(client, true);
+		pmbus_update_ts(client, PMBUS_OP_PAGE_CHANGE);
 		if (rv < 0)
 			return rv;
 
 		pmbus_wait(client);
 		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, PMBUS_OP_READ);
 		if (rv < 0)
 			return rv;
 
@@ -231,7 +232,7 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
 					       phase);
-		pmbus_update_ts(client, true);
+		pmbus_update_ts(client, PMBUS_OP_WRITE);
 		if (rv)
 			return rv;
 	}
@@ -251,7 +252,7 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_byte(client, value);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -286,7 +287,7 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_word_data(client, reg, word);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -408,7 +409,7 @@ int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_word_data(client, reg);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, PMBUS_OP_READ);
 
 	return rv;
 }
@@ -471,7 +472,7 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_byte_data(client, reg);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, PMBUS_OP_READ);
 
 	return rv;
 }
@@ -487,7 +488,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_byte_data(client, reg, value);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -523,7 +524,7 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_block_data(client, reg, data_buf);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, PMBUS_OP_READ);
 
 	return rv;
 }
@@ -2530,7 +2531,7 @@ static int pmbus_read_coefficients(struct i2c_client *client,
 	rv = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
 			    I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
 			    I2C_SMBUS_BLOCK_PROC_CALL, &data);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_READ | PMBUS_OP_WRITE);
 
 	if (rv < 0)
 		return rv;
@@ -2734,7 +2735,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (!(data->flags & PMBUS_NO_CAPABILITY)) {
 		pmbus_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, PMBUS_OP_READ);
 
 		if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK)) {
 			if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
@@ -2750,13 +2751,13 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	data->read_status = pmbus_read_status_word;
 	pmbus_wait(client);
 	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, PMBUS_OP_READ);
 
 	if (ret < 0 || ret == 0xffff) {
 		data->read_status = pmbus_read_status_byte;
 		pmbus_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, PMBUS_OP_READ);
 
 		if (ret < 0 || ret == 0xff) {
 			dev_err(dev, "PMBus status register not found\n");
-- 
2.49.0.472.ge94155a9ec-goog

