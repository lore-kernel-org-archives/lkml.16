Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2861A76D4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743714776; cv=none; b=ix9CE+gBKbmTYmI/3bUlqgyIqWaQ5FW/KycqQk2izd4yN7p+Sx5L0WvvZB+193qWKmGNTAVeQIbOy5iAFbEaQxjHrLy+vhZ3dzI2/TKISopgwisGAYINf5RY3AkIA4adzj5M5OafHsaYmrCy8aZKCdhH9In1cLXWRTlJqGW/WPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743714776; c=relaxed/simple;
	bh=FDKsvoDcKifyrzioPyqJFl5Y9Kr+DY+Vo3m64R/3kTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sp3YUfKJELJS+faCHO2G7LtxxbLOz2oDX+y7otNG8eTbsuD+ipPQeHgJxT6ye1Je4RPeb62YpaKcjrDb3qAWCM6REq8abT8B2/ES+hM0jQmCOOyuu7MK2icjqweycuZV9Y5qmc3XNLIDHeAkB6DseibJA31zsrqYy7Ur57QYI84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=bFwTS0Th; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="bFwTS0Th"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7340e6f3ce1so1113446b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 14:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743714772; x=1744319572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXRp1yjFEqxCY+hqVG+iOxexzqvkTqvacXHBnMD7TYQ=;
        b=bFwTS0ThLtYejVq7y/D75sB2f+xa0kkguBdPs2NRxJL4D9F6onzp+/rvirG2xT8kUD
         Sm2YTRtxDegVGYZCkisNJ9+ESVneKkF0MeOtEqtrJ6QZZfWso9VmQYT9F5r9Mgc7pjYE
         0HF6/+P9fc+jZ1+/s7pczyA4iYImnKcuiOp3iA1uMAmZGQ5bvGIRJyMWMeulmlLteqXi
         CD73kCFgQf8JCK5YSHU7ugp1DYQeRc03nidjJn+i3KLSXwaHGWWkwVl+s9X2lvE5niID
         jtbOPcJv+GxJDNAozPtcMC9DVs71w2B6bUGo9go3O5rBqOozz87wPZdL3EZ5Hm8CTbQA
         SMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743714772; x=1744319572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXRp1yjFEqxCY+hqVG+iOxexzqvkTqvacXHBnMD7TYQ=;
        b=rFIWZ1595k9hGeYxx54BVoXaxZrMx1qqRozSSJYDDOYYmntbuvhbb+GOxNiWVcXIe3
         WOcmTaOqC+5oAv3McXaGiI3uXFwF86deTdczt9O0tuWH6wx7WhKkYWR/kOZZXjKgIZPK
         /v59uegwdTeze9bguEj44JYQvmfIRqcL1+1IthQtSEnY8glNgNGKwdAe2mIhhthgps2s
         8bZwf1YAJItf34ot6fRmcN0GXxEdqm0OLY5sEiFBuwf5LEfIKs1BvPiuVDvl0Qaic0Mi
         oDY1VQp4V2W3DmuBfJJcQwLY7fmeAVGfKqULms4m6730oyoA9pEFhyvTU61ZKA66CtTL
         53Og==
X-Forwarded-Encrypted: i=1; AJvYcCUIwjpeqoUwNgqXb2gr3PhjFzuDBVq+S6gR52Ghf89oAulWgI7+XDr6xyTlahEZ0Xytfktfs1lDTbeT/x8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhZFw8uNcV0geRQTwNOtNfZ80NEMkHnZI7FP76ezSX5iKOQ607
	eNeIOjx+/j6r/aerLBPygbZEoEyyhOWvQ9wdJw+CRl9fvEF7A9eWF6xucSDI1CmAd6Jx/PSlOTN
	D
X-Gm-Gg: ASbGncvFH8nGZYrD1n6lepLnECWELEFMtv0A5h9hZYCEOSMczWk2E876teyGg6zMYsv
	ftV8Ivp7mMe4mKyNTwsx9Vg+EsuL00OSOrkIsMl/YP9VsBJEwRUeCLOzmM4Ro9O0Q7ISnBsCkCq
	8yf12SHzindDN92t19aiQWDxZececmXurHliFOUkGDcQm0Fj3vajY24cTq6s4NnECB2yKhMjoZ/
	P7ulIPvS6NDh2nt43zQCTWbfQ1l03TQmVAAiRKy8ljrSNdrZerua2kgiGaeZ0HeLcn717wGAynY
	+bL5tmx/U7/UiMg3sDaFJ06WUmVcFBtfeR01FXLm3yk3fY5IHvkiYpUJBxOMZh0WscIcuTKz74i
	MSeVr6sNIe72k/D+KNij3zcomnpt3dBs=
X-Google-Smtp-Source: AGHT+IFs+HI8X1Eu5K1dQEmTGEWwXWCwfDIQIm5YGK91rSnEnxfPxok0S5MGqQwufcOf5BlB7sy3Sg==
X-Received: by 2002:a05:6a00:809:b0:730:9946:5973 with SMTP id d2e1a72fcca58-739e48d622cmr1394789b3a.5.1743714771986;
        Thu, 03 Apr 2025 14:12:51 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:b3cc:4c6:a3e7:fc73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ed193sm1967031b3a.44.2025.04.03.14.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 14:12:51 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v3] hwmon: (pmbus): Introduce page_change_delay
Date: Thu,  3 Apr 2025 14:12:46 -0700
Message-ID: <20250403211246.3876138-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
In-Reply-To: <20250402202741.3593606-1-william@wkennington.com>
References: <20250402202741.3593606-1-william@wkennington.com>
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
V2 -> V3: Use the BIT macro

 drivers/hwmon/pmbus/pmbus.h      |  1 +
 drivers/hwmon/pmbus/pmbus_core.c | 67 +++++++++++++++-----------------
 2 files changed, 33 insertions(+), 35 deletions(-)

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
index 787683e83db6..3aa5851610b2 100644
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
@@ -170,33 +170,30 @@ EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");
 static void pmbus_wait(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
-	const struct pmbus_driver_info *info = data->info;
-	s64 delta;
-
-	if (info->access_delay) {
-		delta = ktime_us_delta(ktime_get(), data->access_time);
-
-		if (delta < info->access_delay)
-			fsleep(info->access_delay - delta);
-	} else if (info->write_delay) {
-		delta = ktime_us_delta(ktime_get(), data->write_time);
+	s64 delay = ktime_us_delta(data->next_access_backoff, ktime_get());
 
-		if (delta < info->write_delay)
-			fsleep(info->write_delay - delta);
-	}
+	if (delay > 0)
+		fsleep(delay);
 }
 
-/* Sets the last accessed timestamp for pmbus_wait */
-static void pmbus_update_ts(struct i2c_client *client, bool write_op)
+#define PMBUS_OP_READ BIT(0)
+#define PMBUS_OP_WRITE BIT(1)
+#define PMBUS_OP_PAGE_CHANGE BIT(2)
+
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
+	if (op & (PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE))
+		delay = max(delay, info->write_delay);
+	if (op & PMBUS_OP_PAGE_CHANGE)
+		delay = max(delay, info->page_change_delay);
+
+	if (delay > 0)
+		data->next_access_backoff = ktime_add_us(ktime_get(), delay);
 }
 
 int pmbus_set_page(struct i2c_client *client, int page, int phase)
@@ -211,13 +208,13 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
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
 
@@ -231,7 +228,7 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
 					       phase);
-		pmbus_update_ts(client, true);
+		pmbus_update_ts(client, PMBUS_OP_WRITE);
 		if (rv)
 			return rv;
 	}
@@ -251,7 +248,7 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_byte(client, value);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -286,7 +283,7 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_word_data(client, reg, word);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -408,7 +405,7 @@ int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_word_data(client, reg);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, PMBUS_OP_READ);
 
 	return rv;
 }
@@ -471,7 +468,7 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_byte_data(client, reg);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, PMBUS_OP_READ);
 
 	return rv;
 }
@@ -487,7 +484,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_byte_data(client, reg, value);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -523,7 +520,7 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_block_data(client, reg, data_buf);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, PMBUS_OP_READ);
 
 	return rv;
 }
@@ -2530,7 +2527,7 @@ static int pmbus_read_coefficients(struct i2c_client *client,
 	rv = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
 			    I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
 			    I2C_SMBUS_BLOCK_PROC_CALL, &data);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_READ | PMBUS_OP_WRITE);
 
 	if (rv < 0)
 		return rv;
@@ -2734,7 +2731,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (!(data->flags & PMBUS_NO_CAPABILITY)) {
 		pmbus_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, PMBUS_OP_READ);
 
 		if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK)) {
 			if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
@@ -2750,13 +2747,13 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
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
2.49.0.504.g3bcea36a83-goog

