Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F536205503;
	Thu, 27 Mar 2025 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081630; cv=none; b=ZA8bGvv5y2d1HGmTzUQU63+BfvuOJ6jGQoZszhD+8s9Yf2eoXrCXbD93XIfppzKb/99jSZtr4pQH4NeIRmLFtYEpg2V/4uvFP+iGgOzvaPO0rHOMNdYINjzhPJTahiFvDV9wQURNEm0jGZrj6BQE2wclAuuBlnJdRBJVZKty0sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081630; c=relaxed/simple;
	bh=gpB2JcnAqVBshf4WQKvBgFsAV/rFjneCt7a6Ovtr4Rw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=LGz7Uq6PDCIg+FXoJpdKE5TqYKV3/DJ7tl1V/soEuLAZhi/q0aRcoee/Dz5plq9qKAg7HFcWoHD4d36+mAK6eOabqKKZ36rX63bzZrdVya+FOXZwZJot/PWSA+Cl0TTAUtj8Rkmo9nqpVmSr406g3fWsdszEdO1H9TouSqXkL1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CT7Qk1Vc; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CT7Qk1Vc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=8Jm4LhbXQVF+MvLzws
	SSvG+uf8lBE4CRVyo6Bjfd51o=; b=CT7Qk1VcT+ZE9+t0djMfurdAchkCxVLgxg
	MBlncyxBmW5SehcXx8og4v9SrH4BMKWVb5oninwYL4PJD9n/CiiLjcvVwb8ulTvs
	mF0i8+nnqUpda7qNieAdEl0v8OzsMYellqO24RAyB+2s5XqitqPJ2YvoNhz4y76P
	/Hgbz5abk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3f7xtUOVn1ekMCQ--.39600S3;
	Thu, 27 Mar 2025 21:19:46 +0800 (CST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/4] hwmon:(ina238)Add ina238_config to save configurations for different chips
Date: Thu, 27 Mar 2025 09:18:38 -0400
Message-Id: <20250327131841.15013-2-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250327131841.15013-1-wenliang202407@163.com>
References: <20250327131841.15013-1-wenliang202407@163.com>
X-CM-TRANSID:_____wD3f7xtUOVn1ekMCQ--.39600S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw4UXF4fuFWrXr18uFy8Xwb_yoWrCr1UpF
	Z3Ga45JrWUXF4aqa9xta97uFn8Kwn7Jr47Kr4xWw1S9F1kWry0kFZrKF1UAFsrKr95XF4I
	yry0yryrCwnFv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zM9a9UUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbibhkd02flSlJ99AABsr
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Add structure ina238_config to store proprietary properties for different
chips to meet different chip adaptations

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---

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

