Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA542231A51;
	Wed, 16 Apr 2025 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786506; cv=none; b=duJJ8JmwLMj8SKLE2DZsebxV7ku26bh3/1Zo4oNox+ivUKAnVBMiJOZo80Shj6zcHl20crZJWao9bapwp2vdhgEK/jVypelI6a93qCZMxds1kFv4tnvyEmUwcLt2bg/lOArPVsmBDr1ulIw4QHW71mbeKU/jVjWo2MIWTS54/Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786506; c=relaxed/simple;
	bh=f5MvPPgZzNQoUwNLf8pjd+gK69ncgfdoDGlBlbgMevI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fRR8gmk8+OnLpo9gahlplL1mHH8hC7LhA5PeHIxa6kyseGUrDSbt8uTPFZMHMBGmbRndr3gufouanYyr8dsmVkYGc+BIe7837N++WSXzJUvymrfxL6KoIJio6Z6ga/n0ouf0JtQW6X30/birxX7NW5iCFrSI0pKvFl5ptvp43uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=GOGescOE; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="GOGescOE"
Received: from 2001-b400-e2a9-54f6-6e67-7778-9cb9-7043.emome-ip6.hinet.net (unknown [10.101.200.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id DE35B42465;
	Wed, 16 Apr 2025 06:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744786020;
	bh=HXmdxN4qv8qUN/AmjmYz54sxkDkoxDt0ewKZemJZ36g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc;
	b=GOGescOEvY87ayDp1JcSqQxuzXw3u5PtCzkLHHTkFdWM6cO37CvYDOP95Qm+d9eU7
	 kXX5YDzJFmc0L6TqoZ6UiUqPNpfddpoIswqixBH3VXB4F8V/KL379/lyigAWSayO/2
	 cbfpt7cedrTDkZl/DTpGAGnsE32GUUUd5DTYfywCzLcHE+z3Wl5vMfUuGbmY82nKca
	 4dFvqkhMQz5/zJ1VpPqOuZ6YMlHB2f8nkTVDFrl1MQQPjKIBDzCJME+yPqTlMm/mg7
	 7V/9Z8M8tARrO+Tdbn2uSmAQyA2hEFu0O8P1Fo+0dSA64VSxbe0Obrx66TGNr4Pzys
	 fbiAgaiDTpJrQ==
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Wed, 16 Apr 2025 14:46:27 +0800
Subject: [PATCH 2/2] hwmon: (spd5118) restrict writes under SPD write
 protection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-2-8b3bcafe9dad@canonical.com>
References: <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-0-8b3bcafe9dad@canonical.com>
In-Reply-To: <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-0-8b3bcafe9dad@canonical.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Yo-Jung Lin (Leo)" <leo.lin@canonical.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3515; i=leo.lin@canonical.com;
 h=from:subject:message-id; bh=f5MvPPgZzNQoUwNLf8pjd+gK69ncgfdoDGlBlbgMevI=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBn/1JbViDIxPHR4QLCCYOn0QykrbyNLeW87IG9j
 l/cbSDmN0SJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCZ/9SWwAKCRBfF7GWSinu
 hjA/D/wMjsVRiYEMRj7NWnhGDeQLuKLfS8Jh3+ARwbt90Wq6TlBLb9py/krsK8AX0jIUHnNf+VB
 yRZVa5s6tMV+IFG5kbt0yh0iDJX8Tz1OD0c7Ls1kMm2gLBpME1STkapX+Je9EFxuGMt7YVNhPoQ
 4NnylGcFhKprDKsADoioY/D+eDHAWJYM0YqgBV5Ith8cyVw/i/iX7BTw5fgSUldYd/yuO/GNW95
 zbzqAGnp5+i0xqR8bFX/FYwM5StNOPlxSRF8TskkWryy14hyHQiZCyp93leId5RjDdqzlTBGydn
 xqqjfzUPsM9AFf9XJpVJ+QWBOeALOdcd1FPmoNHGbIujUuEQQNNPIYXWipkmqgbN4D8aVY5bwlj
 MbU2gJwZXQqy3Xguxhn/YMt6lL1MB3P5HugyuFKfkNJ9u6SQlfpIpkuXn3mA76RHvYCFNBa05TQ
 /Ul7Pakos16+FhWBmQjkW8NyZ6KxO/oRcgYjSpsH+qI+HnDBH34xYHcMEIgLY3Y21s/p8BuEBG1
 r8cneXRds8J3zoJ3c2w6JvwUkUNTumHOmRLtQmGVW9Dno7J2RWyQsOyqOlzlDPtGmt6xNp2rhzO
 eutzYzYv4/xSI1aJJK1WQxgmoAcM66nuLXSj2rMaFYU50VeCHT9rQDHymmvXw3kVJRcEQYEE5m2
 OD3IgtBv1OAbgag==
X-Developer-Key: i=leo.lin@canonical.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86

On some platforms, SPD Write Protection for the SMBus controller may be
enabled. For the i801 family, this will forbid writing data to devices
residing on addresses from 0x50 to 0x57. This may lead to the following
issues:

  1) Writes to the sensor hwmon sysfs attributes will always result in
     ENXIO.

  2) System-wide resume will encounter errors during regcache sync back,
     resulting in the following messages during resume:

     kernel: spd5118 1-0050: Failed to write b = 0: -6
     kernel: spd5118 1-0050: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6
     kernel: spd5118 1-0050: PM: failed to resume async: error -6

To address this, check if the sensor can be written to at probe, and bypass
write-related functions if writing to the sensor is not possible.

Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
---
 drivers/hwmon/spd5118.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 3cb2eb2e0227..9dd5342c31dd 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -75,6 +75,7 @@ static const unsigned short normal_i2c[] = {
 struct spd5118_data {
 	struct regmap *regmap;
 	struct mutex nvmem_lock;
+	bool write_protected;
 };
 
 /* hwmon */
@@ -284,7 +285,7 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
 	case hwmon_temp_lcrit:
 	case hwmon_temp_crit:
 	case hwmon_temp_enable:
-		return 0644;
+		return data->write_protected ? 0444 : 0644;
 	case hwmon_temp_min_alarm:
 	case hwmon_temp_max_alarm:
 	case hwmon_temp_crit_alarm:
@@ -499,7 +500,7 @@ static const struct regmap_range_cfg spd5118_regmap_range_cfg[] = {
 	},
 };
 
-static const struct regmap_config spd5118_regmap_config = {
+static struct regmap_config spd5118_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0x7ff,
@@ -563,6 +564,21 @@ static int spd5118_init(struct i2c_client *client)
 	return 0;
 }
 
+static bool spd5118_write_protected(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	int mode = 0;
+	int err = 0;
+
+	mode = i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
+	if (mode < 0)
+		dev_warn(dev, "Failed to read MR11: %d", mode);
+
+	err = i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode);
+
+	return (err < 0);
+}
+
 static int spd5118_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -580,6 +596,11 @@ static int spd5118_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	if (spd5118_write_protected(client)) {
+		data->write_protected = true;
+		spd5118_regmap_config.cache_type = REGCACHE_NONE;
+	}
+
 	regmap = devm_regmap_init_i2c(client, &spd5118_regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
@@ -638,6 +659,9 @@ static int spd5118_suspend(struct device *dev)
 	u32 regval;
 	int err;
 
+	if (data->write_protected)
+		return 0;
+
 	/*
 	 * Make sure the configuration register in the regmap cache is current
 	 * before bypassing it.
@@ -662,6 +686,9 @@ static int spd5118_resume(struct device *dev)
 	struct spd5118_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
 
+	if (data->write_protected)
+		return 0;
+
 	regcache_cache_only(regmap, false);
 	return regcache_sync(regmap);
 }

-- 
2.43.0

