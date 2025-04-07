Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D2222424C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 20:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056614; cv=none; b=irVC3DjLk/WP8PJDyKojJXC34n4+ViP9Nx6rpIF5SRqti5jD+ICRZTNJo+WutLJ4/WoyBGpVncy9VNECexYStO8H4Zz8ZctJbBJM1RfuW2M+79KiVZ9/CEMdq+BzH3ka8hEo+3VwgxITdDlqRpat7bBJEczKFZJYuZERkRGADrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056614; c=relaxed/simple;
	bh=7RoIT9/RUIJd/OqbMR50Adl4B420MNsQ/i2IPCgIdKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hg5WXELu/yXSIHHY06iz4ZbMlwA8Am5kqpPkYHAmO/AvN5r0vdNC0tcREKzMPB1+FfMGCoiDhVXrFbLrK1XcmLstjNUmCi8KaFID42KVeRvPJaP6fJwoXoFgOzj9nWyGeZEUnFzam6y9T3b8c9GM60UQuki+cnjcGJuKThVW9Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=xseyQlep; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="xseyQlep"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227aaa82fafso41277125ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744056611; x=1744661411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKorvTDcHHWmcS+AjT7qKhMDewJLu0PWpIswTAFjbRo=;
        b=xseyQlepmsqtgwYCOGLB+yS8EQSTm2mrtGl3mvNapVVxMQy1ZsTKURZICYfWZkmGQN
         gHRU39FkwcyUUUcDfFLZGn2hL1QjyPoDXdj4ZU98UZboRXgqu2D4cwUZnQgvWP5hDude
         NnFVt1+QXpubsYc+jiDlKtBFRwrw0ix15Ol19e2Zm8DZPO3JEQwuwViBYVJnjfjyw6fX
         loIXvabfaHK/WjmXRwkUdDxL1JJHTZwVLb5PvBYlgq4RTF6Gl22ceEyGdnb1gitFqZQN
         Ivij96PKOxVG5OjaVLSnb/NJVaur5AareQVZLa2adbLCZlK1XByYCf8HGIZ9N6F1y3uW
         nG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744056611; x=1744661411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKorvTDcHHWmcS+AjT7qKhMDewJLu0PWpIswTAFjbRo=;
        b=M+0/hAMF+fWqQT/XO2v8Dh8iq7RmgN3CyGz/ZOF8y7LQnG35Svr8GMu/UTjjYOXXCU
         v+9RkL9+yxkW8FjJQSbEjU1Zj0jbSCl7eA3dJ07z9tcmzjeArm7nT+cHpxv21GK0kQNj
         SjeTh4k4YXjFs4PD5347N69BPjUn1eDUi4qA1OCIMZC2Dpwp9c8FiG3YK6F8seVlRssc
         txyhMCFOiz5JiIpN+klRSX6iNUdo595AoBPUD4xSzzpuKKsl+NcoRh0SQvVhcyu7kAiU
         vLQXLC8tW6/rqDlGHybJgCD0ndwxOnZE3OSxtQhH8eHK4WJ7nCri0/EHXblR7COyRit2
         572A==
X-Forwarded-Encrypted: i=1; AJvYcCW9gbY7ZgfRG8UZ58SuTbjNV+01+SvaWQpwOda6+fxK0636YR5usRx3QO7KZijiOq66dxFjQYkVfHilJG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YznAKtDnVdee1wMkj3GcY+QtErGvTMbEm7GxUWXITrHbTuS0eQw
	nvqwJX5c59+hLLTJM/8gjRZuuOApK02MMUiSTElF+jqX/ExcuHf5VwI4wzYq+JA0u5+dnyE2k/Y
	B
X-Gm-Gg: ASbGncsTyVHpG40KYGj5Yul4BLj2qJWrRz2EiddJhO2HzSRvJlKHOo1EhpkvibTa94B
	dA8DPH7mKp6Wz1k8nyVLdOe8mVOkiIkEXI6a2rnMo6GLnmYIzZiPbw6S4XNY0nS3tbPeLELtGS7
	cuw0BmN47LzJ6e4Z9cKcW4TvzKtapEn2yowO9x8xA6pNAB7HWjoIZbbpUjRYPmIwFN98AwTmoFM
	rPqe9gTRwLKSMAeT+jt81ccaKGRAIzOXQ9WHZmP+ijmVLpNlA60ugJSJeX3r0jSiD2Ku1wPRY4M
	Vyf0Ch25XOSwLTMc1eUMxdNxV0Bv+IvN+6AElMrBGIWyBh4HrJ4KZMAME5Lo6/bDqZsGTyLUuz+
	Qkh5xNTauVEX/GuifaYwCDq+Eqs7fikJd
X-Google-Smtp-Source: AGHT+IHvXiMbLnANd8/D78KF/tGgUo37pGC3kDLDkaZfEw+83S+ZticgxpE0lAOSgNyNxaubDQZWOw==
X-Received: by 2002:a17:902:ecc4:b0:224:1eab:97b2 with SMTP id d9443c01a7336-22a8a2da123mr210601995ad.53.1744056611011;
        Mon, 07 Apr 2025 13:10:11 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:b25a:2d1b:1734:78be])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e0b4sm86087865ad.154.2025.04.07.13.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 13:10:10 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v5] hwmon: (pmbus): Introduce page_change_delay
Date: Mon,  7 Apr 2025 13:10:02 -0700
Message-ID: <20250407201002.1198092-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
In-Reply-To: <20250404193103.4174977-1-william@wkennington.com>
References: <20250404193103.4174977-1-william@wkennington.com>
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

This makes a slight behavioral tweak to the existing delay logic, where
it considers the longest of delays between operations, instead of always
chosing the write delay over the access delay.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
V1 -> V2: Simplify how the backoff time is stored and computed
V2 -> V3: Use the BIT macro
V3 -> V4: Move defines up
	  Move op combos outside update call
	  Remove unused PMBUS_OP_READ
V4 -> V5: Rebase onto 6.15-rc1

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
index cfeba2e4c5c3..be6d05def115 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -32,6 +32,13 @@
 #define PMBUS_ATTR_ALLOC_SIZE	32
 #define PMBUS_NAME_SIZE		24
 
+/*
+ * The type of operation used for picking the delay between
+ * successive pmbus operations.
+ */
+#define PMBUS_OP_WRITE		BIT(0)
+#define PMBUS_OP_PAGE_CHANGE	BIT(1)
+
 static int wp = -1;
 module_param(wp, int, 0444);
 
@@ -113,8 +120,8 @@ struct pmbus_data {
 
 	int vout_low[PMBUS_PAGES];	/* voltage low margin */
 	int vout_high[PMBUS_PAGES];	/* voltage high margin */
-	ktime_t write_time;		/* Last SMBUS write timestamp */
-	ktime_t access_time;		/* Last SMBUS access timestamp */
+
+	ktime_t next_access_backoff;	/* Wait until at least this time */
 };
 
 struct pmbus_debugfs_entry {
@@ -169,32 +176,26 @@ EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");
 static void pmbus_wait(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
-	const struct pmbus_driver_info *info = data->info;
-	s64 delta;
+	s64 delay = ktime_us_delta(data->next_access_backoff, ktime_get());
 
-	if (info->access_delay) {
-		delta = ktime_us_delta(ktime_get(), data->access_time);
-
-		if (delta < info->access_delay)
-			fsleep(info->access_delay - delta);
-	} else if (info->write_delay) {
-		delta = ktime_us_delta(ktime_get(), data->write_time);
-
-		if (delta < info->write_delay)
-			fsleep(info->write_delay - delta);
-	}
+	if (delay > 0)
+		fsleep(delay);
 }
 
-/* Sets the last accessed timestamp for pmbus_wait */
-static void pmbus_update_ts(struct i2c_client *client, bool write_op)
+/* Sets the last operation timestamp for pmbus_wait */
+static void pmbus_update_ts(struct i2c_client *client, int op)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	const struct pmbus_driver_info *info = data->info;
+	int delay = info->access_delay;
+
+	if (op & PMBUS_OP_WRITE)
+		delay = max(delay, info->write_delay);
+	if (op & PMBUS_OP_PAGE_CHANGE)
+		delay = max(delay, info->page_change_delay);
 
-	if (info->access_delay)
-		data->access_time = ktime_get();
-	else if (info->write_delay && write_op)
-		data->write_time = ktime_get();
+	if (delay > 0)
+		data->next_access_backoff = ktime_add_us(ktime_get(), delay);
 }
 
 int pmbus_set_page(struct i2c_client *client, int page, int phase)
@@ -209,13 +210,13 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 	    data->info->pages > 1 && page != data->currpage) {
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
-		pmbus_update_ts(client, true);
+		pmbus_update_ts(client, PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE);
 		if (rv < 0)
 			return rv;
 
 		pmbus_wait(client);
 		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, 0);
 		if (rv < 0)
 			return rv;
 
@@ -229,7 +230,7 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
 					       phase);
-		pmbus_update_ts(client, true);
+		pmbus_update_ts(client, PMBUS_OP_WRITE);
 		if (rv)
 			return rv;
 	}
@@ -249,7 +250,7 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_byte(client, value);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -284,7 +285,7 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_word_data(client, reg, word);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -405,7 +406,7 @@ int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_word_data(client, reg);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, 0);
 
 	return rv;
 }
@@ -468,7 +469,7 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_byte_data(client, reg);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, 0);
 
 	return rv;
 }
@@ -484,7 +485,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_byte_data(client, reg, value);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -520,7 +521,7 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_block_data(client, reg, data_buf);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, 0);
 
 	return rv;
 }
@@ -2524,7 +2525,7 @@ static int pmbus_read_coefficients(struct i2c_client *client,
 	rv = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
 			    I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
 			    I2C_SMBUS_BLOCK_PROC_CALL, &data);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	if (rv < 0)
 		return rv;
@@ -2728,7 +2729,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (!(data->flags & PMBUS_NO_CAPABILITY)) {
 		pmbus_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, 0);
 
 		if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK)) {
 			if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
@@ -2744,13 +2745,13 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	data->read_status = pmbus_read_status_word;
 	pmbus_wait(client);
 	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, 0);
 
 	if (ret < 0 || ret == 0xffff) {
 		data->read_status = pmbus_read_status_byte;
 		pmbus_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, 0);
 
 		if (ret < 0 || ret == 0xff) {
 			dev_err(dev, "PMBus status register not found\n");
-- 
2.49.0.504.g3bcea36a83-goog

