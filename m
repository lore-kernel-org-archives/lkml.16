Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310A51DFD8B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743622503; cv=none; b=m6wcXrKf3wKkdXSzWP7i4g9px97AUcTrzEDy65dtxC3C1WKOIBKPKTnVgoV8DlG/wTzdZr8VxDnW/fWapszyLwYrg33XpBIyFFP2D5nnGbQVZ3a2Gl8ALyPbSwEhda9PUrp8wlxAOlrNkBzg+qvZSeYVxc4SFzE5WQQU+1ObpYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743622503; c=relaxed/simple;
	bh=q+7rDiESpW/5o/TmwAoALZFAEN0ZYQGNCvmcoJZ0byY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a9RyYY9CoDJ/mdLK15EqHTaSKQUPk6Pwj2T+TttCGLqAjdUGcrCdgwInTDrbcBkNwAp9OhKyKGFMkMBihRSSZAKB0nRy6gyOGQIWB1EaWGhb6h37NEYVi00cfLNb0cJrw25tIgkwBERR2uzPLZOQJdOraiU+jnSKEQ+QI0SjQ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=mh1gFJhr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="mh1gFJhr"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22580c9ee0aso2190475ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743622500; x=1744227300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jdfekkXQ2BPkIkZEF2KATlxON6SfSUU4DnMu+LAjv8Q=;
        b=mh1gFJhr8VIb/60mzOBHVQyJZEBA/oTOP+PTypE1ezh9ggv5m8PBDVV89HvaDjvgXY
         /zyMUuGbR7XIG+0pH3P+49plttBL0CEFuH5/RSWrjXscbFEX81JNaMosGe6Kj1syr6zN
         2LN9A9tdqExX7QUY9ZsjFfUtzTgSTM7oO4Xi6LgKOPBHBW2dTSx//qhUsClZkYCuO85I
         DLpKq+qbQ0hL/Lg3lIgpN7vJIkNKt+CMGmqNX8GswMZ3r99HOGjnBwzZQMKtIYqHgcHR
         i0xtXyuu1DV0QZNIjhYN+z9W0YGq1eF0LXSJQGV92dtXxj01OGqzYbHPqWgtxYdZo3kL
         /BOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743622500; x=1744227300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdfekkXQ2BPkIkZEF2KATlxON6SfSUU4DnMu+LAjv8Q=;
        b=HlYZ7nCpHWropOF/UzgvQ0Hgta/xdyz8KZAaPsFGnxBzuXwKS6Py32Ar9kt5x51JMW
         IZi4L8QBVsOXPFTNpKCBn60ccl/eCWdSBlmnL77aGKvcbjfY5JxfPONOWrkgf1L86djt
         1WNc56a8PRdsQNHtOI5qfFvLhRB5GKE2gqud27Ij6sY11SSvNlua/iXs69ZeOpkYE1An
         oSBK4tsjdJn8BNICXLjPh5etUZnL4ZA79IcbDYfh76TUI356m9Lnvini6lScrliK+fPV
         Z784ev3gs3zIeCcWSbc98C4qJVQTznn1vIu8SRmhNsJ894arnl3GaiDl98rU9rMzM2LV
         OajA==
X-Forwarded-Encrypted: i=1; AJvYcCXssJV+yFJqjHzCb4EQEs0UqJrZmL4ooHChrU1RVNSTsHsljFOWcdV8kfzCFDVD7H7wDkaaozc2e1rNpeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvygGaiw8eq3laFu18XSHwYyPRAZozZwzg7DEobbC4x8ephtda
	6zr8UKJ/gKEoJx+BbKAIhWe8IX2X+7P3/7vRvI5N/Lpz2ef7jvYcAIOFJqvpXpI6W3+CHz5fhUG
	xhhI=
X-Gm-Gg: ASbGncsSuoHudW9TdzcWJ8WpoXg4H8dgQuBdUeX41uequTwxTFAe2CUNrZZIEi5KXD+
	gHGOOP2kHpQ6TVrzXLVJU+kyW1B4FpBdh3KvPX50cpLSoHchHwnSMlK+SwD2+Du0UdJoyoZNGjV
	IyjCOX8YIcRqtqrt2Oc4drCqNwAPdgfi9L5dcv/1Okau9UvOMZ18ndHy4kmEz8bp9Cihx91t5od
	gOsW5KXDn76GWL39R6Wm1UBmwZJbsY4JRfobEidq6TIVj765oeG9utBC9EAmqfY+JmFye/AeEWj
	Q0QJcRvnDkCtD+e8lopU2xnFX5DJ8aSDsdU3jixleyfYq6EEn9PWkKIvD/jumbF2AjJcydHAou5
	BMBFOKYKEIzmpwtjW/a79N+Wjg4ld8f3R
X-Google-Smtp-Source: AGHT+IFKrVJio0LKpW2SzFWvHvDpGei9zMhW0Yx5z/I6qFKNcJ1k/8ZevK3YqM48GqJfPM1mqLKcUg==
X-Received: by 2002:a17:903:189:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-2292f975798mr305163525ad.29.1743622500080;
        Wed, 02 Apr 2025 12:35:00 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:9c70:5442:2794:3e8d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedfd85sm112868025ad.77.2025.04.02.12.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:34:59 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH] hwmon: (pmbus): Introduce page_change_delay
Date: Wed,  2 Apr 2025 12:34:52 -0700
Message-ID: <20250402193452.3571888-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
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
 drivers/hwmon/pmbus/pmbus.h      |  1 +
 drivers/hwmon/pmbus/pmbus_core.c | 59 ++++++++++++++++++++++----------
 2 files changed, 41 insertions(+), 19 deletions(-)

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
index 787683e83db6..cfb724a8718b 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -116,6 +116,7 @@ struct pmbus_data {
 	int vout_high[PMBUS_PAGES];	/* voltage high margin */
 	ktime_t write_time;		/* Last SMBUS write timestamp */
 	ktime_t access_time;		/* Last SMBUS access timestamp */
+	ktime_t page_change_time;	/* Last SMBUS page change timestamp */
 };
 
 struct pmbus_debugfs_entry {
@@ -178,24 +179,44 @@ static void pmbus_wait(struct i2c_client *client)
 
 		if (delta < info->access_delay)
 			fsleep(info->access_delay - delta);
-	} else if (info->write_delay) {
+	}
+	if (info->write_delay) {
 		delta = ktime_us_delta(ktime_get(), data->write_time);
 
 		if (delta < info->write_delay)
 			fsleep(info->write_delay - delta);
 	}
+	if (info->page_change_delay) {
+		delta = ktime_us_delta(ktime_get(), data->page_change_time);
+
+		if (delta < info->page_change_delay)
+			fsleep(info->page_change_delay - delta);
+	}
 }
 
-/* Sets the last accessed timestamp for pmbus_wait */
-static void pmbus_update_ts(struct i2c_client *client, bool write_op)
+#define PMBUS_OP_READ_BIT 1
+#define PMBUS_OP_WRITE_BIT 2
+#define PMBUS_OP_PAGE_CHANGE_BIT 4
+
+#define PMBUS_OP_READ PMBUS_OP_READ_BIT
+#define PMBUS_OP_WRITE PMBUS_OP_WRITE_BIT
+#define PMBUS_OP_PAGE_CHANGE (PMBUS_OP_PAGE_CHANGE_BIT | PMBUS_OP_WRITE)
+
+/* Sets the last operation timestamp for pmbus_wait */
+static void pmbus_update_ts(struct i2c_client *client, int op)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	const struct pmbus_driver_info *info = data->info;
+	ktime_t now = ktime_get();
 
 	if (info->access_delay) {
-		data->access_time = ktime_get();
-	} else if (info->write_delay && write_op) {
-		data->write_time = ktime_get();
+		data->access_time = now;
+	}
+	if (info->write_delay && (op & PMBUS_OP_WRITE_BIT)) {
+		data->write_time = now;
+	}
+	if (info->page_change_delay && (op & PMBUS_OP_PAGE_CHANGE_BIT)) {
+		data->write_time = now;
 	}
 }
 
@@ -211,13 +232,13 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
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
 
@@ -231,7 +252,7 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
 					       phase);
-		pmbus_update_ts(client, true);
+		pmbus_update_ts(client, PMBUS_OP_WRITE);
 		if (rv)
 			return rv;
 	}
@@ -251,7 +272,7 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_byte(client, value);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -286,7 +307,7 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_word_data(client, reg, word);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -408,7 +429,7 @@ int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_word_data(client, reg);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, PMBUS_OP_READ);
 
 	return rv;
 }
@@ -471,7 +492,7 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_byte_data(client, reg);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, PMBUS_OP_READ);
 
 	return rv;
 }
@@ -487,7 +508,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_byte_data(client, reg, value);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -523,7 +544,7 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_block_data(client, reg, data_buf);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, PMBUS_OP_READ);
 
 	return rv;
 }
@@ -2530,7 +2551,7 @@ static int pmbus_read_coefficients(struct i2c_client *client,
 	rv = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
 			    I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
 			    I2C_SMBUS_BLOCK_PROC_CALL, &data);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_READ | PMBUS_OP_WRITE);
 
 	if (rv < 0)
 		return rv;
@@ -2734,7 +2755,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (!(data->flags & PMBUS_NO_CAPABILITY)) {
 		pmbus_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, PMBUS_OP_READ);
 
 		if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK)) {
 			if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
@@ -2750,13 +2771,13 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
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

