Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E53E28B404;
	Tue,  6 May 2025 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746509945; cv=none; b=kjJY9w76bGDXJlavl5jeb5+YmgL4nzzPeyXbzSpMLbix7WgdjvEvbF6nYdveG46jrmbgQ5uB6v1s5oK0Kwb+ozvWFzivq5hZ21NI999MZYxZ7PxUyZyqQ4BMOFHD9I4qXL+Fo5KSu649Fsa8bRVqSaiP9A8b81yjsQLI30GTu/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746509945; c=relaxed/simple;
	bh=VqaefWIeeAWB8AF8A6vwJaER/pKdcIdNGd5Xi4YlzC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=E7ZYWpJS9TEyHyUJ+Op84zUu7j7OEGtVpa/EKb8ZrwYHGtY/dCa5ynTqomVp/g+1i3d/ArFqcC2xlI9ukb5WX/ly/AORnE+pQoYvxTD16JJUUJT+1RMMcBE84w0cboQeLMrq4q04IMILAsQ+uT5bbUzSrYwqQKMN51u6CJVzFp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iQdv+nBk; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iQdv+nBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=AqqRBuCmSkqKBix9v4
	uiNk3uih1aJj44EwU4vrNzXFQ=; b=iQdv+nBkRg2YU97jYPbe0Xnf+m+Wjnp2ul
	qOwqs8EkspQG20LI7GW3eXLI4e+xUgrbzW2SO2ktVcxRkxfnsAkJY0ELi4dYEOTE
	ASHBZSUrYvWCIZAdtDkDp3+KCzQhiICGKcaQcxnAtzUoDSQCq/7nQBws2kto9ErX
	g7dVho2M8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBHxSpEoBloZ2M1Ew--.50689S3;
	Tue, 06 May 2025 13:38:18 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jean Delvare <jdelvare@suse.com>
Cc: Wenliang Yan <wenliang202407@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	derek.lin@silergycorp.com,
	miguel.lee@silergycorp.com,
	chris.ho@silergycorp.com,
	eason.liao@silergycorp.com
Subject: [PATCH v7 1/4] hwmon:(ina238)Add ina238_config to save configurations for different chips
Date: Tue,  6 May 2025 01:37:38 -0400
Message-Id: <20250506053741.4837-2-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250506053741.4837-1-wenliang202407@163.com>
References: <20250506053741.4837-1-wenliang202407@163.com>
X-CM-TRANSID:_____wBHxSpEoBloZ2M1Ew--.50689S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw1kWr4rWr1fuw48WF15Jwb_yoWrCrWrpF
	Z3Ga45JrWUXF4aga9xta97uFn8Kwn7Jr17Kr47Ww1S9F1kWry0kFZrKF1UAFsrKr95XF4I
	yry8tryrCwnFv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEk9NDUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbibgFF02gZnfc1tgABsg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Add structure ina238_config to store proprietary properties for different
chips to meet different chip adaptations

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---

v6->v7:Maintain the previous changes

v5->v6:Split the patch, this patch add a structure with the following contents: 
1. 'has_power_highest' is used to determine whether peak power can be
detected (New features for SQ52206)
2. 'has_energy' is used to determine non-energy detection energy
consumption (new feature for SQ52206)
3. 'temp_shift' is used to distinguish the data bits of the
temperature register
4. 'power_calculate_factor' is used to calculate power
5. 'config_default' is used to save the initial configuration
6. 'bus_voltage_lsb' is used to save the least significant bit
corresponding to bus voltage
7. 'temp_lsb' is used tosave the least significant bit corresponding
to temperature

Configure the architecture content for ina237 and ina238 respectively to
lay the foundation for subsequent adaptation to new chips.

 drivers/hwmon/ina238.c | 57 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 2d9f12f68d50..c8d6bd3041b3 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -102,7 +102,20 @@ static const struct regmap_config ina238_regmap_config = {
 	.val_bits = 16,
 };
 
+enum ina238_ids { ina238, ina237 };
+
+struct ina238_config {
+	bool has_power_highest;		/* chip detection power peak */
+	bool has_energy;			/* chip detection energy */
+	u8 temp_shift;				/* fixed parameters for temp calculate */
+	u32 power_calculate_factor;	/* fixed parameters for power calculate */
+	u16 config_default;			/* Power-on default state */
+	int bus_voltage_lsb;		/* use for temperature calculate, uV/lsb */
+	int temp_lsb;				/* use for temperature calculate */
+};
+
 struct ina238_data {
+	const struct ina238_config *config;
 	struct i2c_client *client;
 	struct mutex config_lock;
 	struct regmap *regmap;
@@ -110,6 +123,27 @@ struct ina238_data {
 	int gain;
 };
 
+static const struct ina238_config ina238_config[] = {
+	[ina238] = {
+		.has_energy = false,
+		.has_power_highest = false,
+		.temp_shift = 4,
+		.power_calculate_factor = 20,
+		.config_default = INA238_CONFIG_DEFAULT,
+		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
+		.temp_lsb = INA238_DIE_TEMP_LSB,
+	},
+	[ina237] = {
+		.has_energy = false,
+		.has_power_highest = false,
+		.temp_shift = 4,
+		.power_calculate_factor = 20,
+		.config_default = INA238_CONFIG_DEFAULT,
+		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
+		.temp_lsb = INA238_DIE_TEMP_LSB,
+	},
+};
+
 static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
 {
 	u8 data[3];
@@ -536,14 +570,20 @@ static int ina238_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct ina238_data *data;
+	enum ina238_ids chip;
 	int config;
 	int ret;
 
+	chip = (uintptr_t)i2c_get_match_data(client);
+
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	data->client = client;
+	/* set the device type */
+	data->config = &ina238_config[chip];
+
 	mutex_init(&data->config_lock);
 
 	data->regmap = devm_regmap_init_i2c(client, &ina238_regmap_config);
@@ -570,7 +610,7 @@ static int ina238_probe(struct i2c_client *client)
 	}
 
 	/* Setup CONFIG register */
-	config = INA238_CONFIG_DEFAULT;
+	config = data->config->config_default;
 	if (data->gain == 1)
 		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
 	ret = regmap_write(data->regmap, INA238_CONFIG, config);
@@ -616,15 +656,22 @@ static int ina238_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ina238_id[] = {
-	{ "ina238" },
+	{ "ina237", ina237 },
+	{ "ina238", ina238 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ina238_id);
 
 static const struct of_device_id __maybe_unused ina238_of_match[] = {
-	{ .compatible = "ti,ina237" },
-	{ .compatible = "ti,ina238" },
-	{ },
+	{
+		.compatible = "ti,ina237",
+		.data = (void *)ina237
+	},
+	{
+		.compatible = "ti,ina238",
+		.data = (void *)ina238
+	},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ina238_of_match);
 
-- 
2.17.1

