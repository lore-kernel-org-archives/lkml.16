Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEF122068B;
	Fri, 13 Jun 2025 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822183; cv=none; b=RgXRMwaYVHgS0xRjWOC8wrJZ+fLmWtwbIfI0jc4v2hT1Bfb00Lc17HstoaNeOThOJOZnRxdfae6tGUer8kKD1+/7OdoC0Ab0BHyB2HnmtKzzk5mS5kwjyu1GjVq0H9ltvk82t4uw7u4JY5nqnI0l9s+dKesHTZK71kSBh+G7LEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822183; c=relaxed/simple;
	bh=FG+6pw/Hy+Vh9d4vKITWpmW62t7eU4Oui5u3Rce6lOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShPlzboC4dsxAS+eCj4lI72Stjz8lAc3Fa0l/qjb1QWIXOiKU185Q71Gm0IVUTQHh0L+AO73djYExCkN57UqXUUNQJEmPwjn7vHTc27HYgkZ6kcU98ciGDiN43xfH8f09C004lauaC+URw6R5gD3IbGUrLeapgD5Ext9VaDru6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEp61zKv; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEp61zKv"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso2526532b3a.2;
        Fri, 13 Jun 2025 06:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749822181; x=1750426981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAtnD418SuWs21ocMxuEndfuEBcj1a9ZJ99bfmYjokU=;
        b=LEp61zKvpwsXyE9LsCPWdI9f3knC4Z1x582tLDxoKOW/j3EwVMCzDlIGgLjkgwpMSH
         brmseOdKvG26pZKryzPNiGubLapuHxRlGbKovBdQ1DrGIHE+SZs9TD4T0m+D+ZlsVJpm
         TR8Q8bC5IkvGjzSQr1JyUhYy+VUG5Mb1AP+bdy7vOa+sQWVj99qEeEAy7sLcPAgJNYW5
         ZbB1pkojff1t6QiSQBxaXfjNd/oG/Ye8hCagFel5z8ZYbEE1nQlIe/v9wr10+oTd3l7h
         zbYTjO8NZ0GQ7H5Jcdx/ZUDQIrNALtOcPlx5TUTz1WIefYkWd4XF4Gv4pB3kaynB/XaW
         EYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822181; x=1750426981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAtnD418SuWs21ocMxuEndfuEBcj1a9ZJ99bfmYjokU=;
        b=CYBfYAIxXcPOh5zwI8KGWy/1mJibKADEvTOj02vVR/1qa3o9BORrhvNxdL5H18v9/P
         iiLqObg9wH21m9ISS02Vsz5gk5utjjE0rA6oHq6oIGul6YQHH1sbxMHDo4+Csa08Ydc6
         apC1aZRVVR3kJVT2qCh9hKe96BcO+TW6edAlbB3IU1w+4dHbhIL5/8H68gPPeg4XzkVp
         nfsFuMmye6mYVNDy9SPyL8mJWiIsPLFpNdaGTRqn+NfbhlJTXaskUODhefTsEs2NdWkA
         zfMVmeU9Zz6+M/yykI/xSixEuMS92omYCExfzohKVQl4P1m3oMfYC1m2JKSM7OR7gjUG
         zjGw==
X-Forwarded-Encrypted: i=1; AJvYcCWPam/AR1r/9NHi30d9pZa3QrO3oyqYzkPIoBZKlsezm3WWzaOPFY4Un4Q1/Kfg5fhJymjIDXs/KOsjWC83@vger.kernel.org, AJvYcCWyTztXMywn51lomKtIAZp7ngMIokZCJfBtRwYk69VVjsNVWhBCfFaoHYmPNOyxY1z8FcBl4ZCnrapm@vger.kernel.org
X-Gm-Message-State: AOJu0YwjoBVmQ/Ch6pzhTfe+W9XeP5w9Kfk0pX/Q/WGOCPsarWR/8ATo
	daOlux7c/DTwU2Hs/BQ9aFcVepaFSGTQ0lvvMYhBUVKRbbp/XjT9bzxC
X-Gm-Gg: ASbGnctuRwFTxWmr8zVZbM+3CZ36uohFtIcJns/OKPeKBaJNZSI9ap2ZyezOopFac83
	9JRy2plirGre7N0DDuvetPRIkrPK2pVfuVWb8sqRLk5VI+wKIP2eOyWbrSZdJvLtVq1xmaWEXTU
	WdaAlA71v8uOFYe48QLzTVfrS5FZBqhojP6c36JUUe6kUI5N7xqsUc+bxcO6nQa6vM+0KpsOmgN
	Re+Xsi6my0gxFrV76YbAxpTUHUeHrBcdIW5zKKK99j/bXStLVeitXeDwP31I+1xGL9eY7nRoMlT
	wQFj6aqKHCIkpVpQH5/mSxulAnElQPzgYIOCz2YQ3JrP+8k0wGOAS5s1l3tvfRuN9YAKyRTYrLU
	p7o3s8IIoTMBfo5Zthbnk
X-Google-Smtp-Source: AGHT+IGqESe51MKfxljQ0iMGdQIn23lwfA9917DjtSpW/5FeC3+SHQEebgC5JnIZNDUoPE53AfPolA==
X-Received: by 2002:a05:6a00:2d06:b0:740:9e87:9625 with SMTP id d2e1a72fcca58-7488f62327bmr4504200b3a.4.1749822180677;
        Fri, 13 Jun 2025 06:43:00 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b2d8asm1605826b3a.132.2025.06.13.06.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:43:00 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Fri, 13 Jun 2025 10:42:40 -0300
Subject: [PATCH v4 3/3] hwmon: (amc6821) Add cooling device support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-b4-amc6821-cooling-device-support-v4-3-a8fc063c55de@toradex.com>
References: <20250613-b4-amc6821-cooling-device-support-v4-0-a8fc063c55de@toradex.com>
In-Reply-To: <20250613-b4-amc6821-cooling-device-support-v4-0-a8fc063c55de@toradex.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Add support for using the AMC6821 as a cooling device. The AMC6821
registers with the thermal framework only if the `cooling-levels`
property is present in the fan device tree child node. If this property
is present, the driver assumes the fan will operate in open-loop, and
the kernel will control it directly. In this case, the driver will
change the AMC6821 mode to manual (software DCY) and set the initial PWM
duty cycle to the maximum fan cooling state level as defined in the DT.
It is worth mentioning that the cooling device is registered on the
child fan node, not on the fan controller node. Existing behavior is
unchanged, so the AMC6821 can still be used without the thermal
framework (hwmon only).

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
v4:
- Fix uninitialized variable `err` on probe()
v3: https://lore.kernel.org/lkml/20250612-b4-amc6821-cooling-device-support-v3-0-360681a7652c@toradex.com/
- Fix using fan node after of_node_put()
- Add setting the pwm duty cycle to max fan cooling state level on
  initialization
v2: https://lore.kernel.org/lkml/20250603-b4-amc6821-cooling-device-support-v2-0-74943c889a2d@toradex.com/
v1: https://lore.kernel.org/lkml/20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com/
---
 drivers/hwmon/amc6821.c | 116 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 110 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 612895db7d8d4096372310c9fa71c103d642dd07..bca33090a93fd745b5c51ec404f671d07c2ba43c 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -26,6 +26,7 @@
 #include <linux/pwm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/thermal.h>
 
 #include <dt-bindings/pwm/pwm.h>
 
@@ -126,6 +127,9 @@ module_param(init, int, 0444);
 struct amc6821_data {
 	struct regmap *regmap;
 	struct mutex update_lock;
+	unsigned long fan_state;
+	unsigned long fan_max_state;
+	unsigned int *fan_cooling_levels;
 	enum pwm_polarity pwm_polarity;
 };
 
@@ -805,6 +809,65 @@ static const struct hwmon_chip_info amc6821_chip_info = {
 	.info = amc6821_info,
 };
 
+static int amc6821_set_sw_dcy(struct amc6821_data *data, u8 duty_cycle)
+{
+	int ret;
+
+	ret = regmap_write(data->regmap, AMC6821_REG_DCY, duty_cycle);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(data->regmap, AMC6821_REG_CONF1,
+				  AMC6821_CONF1_FDRC0 | AMC6821_CONF1_FDRC1, 0);
+}
+
+static int amc6821_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	struct amc6821_data *data = cdev->devdata;
+
+	if (!data)
+		return -EINVAL;
+
+	*state = data->fan_max_state;
+
+	return 0;
+}
+
+static int amc6821_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	struct amc6821_data *data = cdev->devdata;
+
+	if (!data)
+		return -EINVAL;
+
+	*state = data->fan_state;
+
+	return 0;
+}
+
+static int amc6821_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
+{
+	struct amc6821_data *data = cdev->devdata;
+	int ret;
+
+	if (!data || state > data->fan_max_state)
+		return -EINVAL;
+
+	ret = amc6821_set_sw_dcy(data, data->fan_cooling_levels[state]);
+	if (ret)
+		return ret;
+
+	data->fan_state = state;
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops amc6821_cooling_ops = {
+	.get_max_state = amc6821_get_max_state,
+	.get_cur_state = amc6821_get_cur_state,
+	.set_cur_state = amc6821_set_cur_state,
+};
+
 /* Return 0 if detection is successful, -ENODEV otherwise */
 static int amc6821_detect(struct i2c_client *client, struct i2c_board_info *info)
 {
@@ -877,11 +940,29 @@ static enum pwm_polarity amc6821_pwm_polarity(struct i2c_client *client,
 	return polarity;
 }
 
-static void amc6821_of_fan_read_data(struct i2c_client *client,
-				     struct amc6821_data *data,
-				     struct device_node *fan_np)
+static int amc6821_of_fan_read_data(struct i2c_client *client,
+				    struct amc6821_data *data,
+				    struct device_node *fan_np)
 {
+	int num;
+
 	data->pwm_polarity = amc6821_pwm_polarity(client, fan_np);
+
+	num = of_property_count_u32_elems(fan_np, "cooling-levels");
+	if (num <= 0)
+		return 0;
+
+	data->fan_max_state = num - 1;
+
+	data->fan_cooling_levels = devm_kcalloc(&client->dev, num,
+						sizeof(u32),
+						GFP_KERNEL);
+
+	if (!data->fan_cooling_levels)
+		return -ENOMEM;
+
+	return of_property_read_u32_array(fan_np, "cooling-levels",
+					  data->fan_cooling_levels, num);
 }
 
 static int amc6821_init_client(struct i2c_client *client, struct amc6821_data *data)
@@ -914,6 +995,14 @@ static int amc6821_init_client(struct i2c_client *client, struct amc6821_data *d
 					 regval);
 		if (err)
 			return err;
+
+		/* Software DCY-control mode with fan enabled when cooling-levels present */
+		if (data->fan_cooling_levels) {
+			err = amc6821_set_sw_dcy(data,
+						 data->fan_cooling_levels[data->fan_max_state]);
+			if (err)
+				return err;
+		}
 	}
 	return 0;
 }
@@ -961,8 +1050,12 @@ static int amc6821_probe(struct i2c_client *client)
 	data->regmap = regmap;
 
 	fan_np = of_get_child_by_name(dev->of_node, "fan");
-	if (fan_np)
-		amc6821_of_fan_read_data(client, data, fan_np);
+	if (fan_np) {
+		err = amc6821_of_fan_read_data(client, data, fan_np);
+		if (err)
+			return dev_err_probe(dev, err,
+					     "Failed to read fan device tree data\n");
+	}
 
 	err = amc6821_init_client(client, data);
 	if (err)
@@ -978,7 +1071,18 @@ static int amc6821_probe(struct i2c_client *client)
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
 							 data, &amc6821_chip_info,
 							 amc6821_groups);
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	if (IS_ERR(hwmon_dev))
+		return dev_err_probe(dev, PTR_ERR(hwmon_dev),
+				     "Failed to initialize hwmon\n");
+
+	if (IS_ENABLED(CONFIG_THERMAL) && fan_np && data->fan_cooling_levels)
+		return PTR_ERR_OR_ZERO(devm_thermal_of_cooling_device_register(dev,
+									       fan_np,
+									       client->name,
+									       data,
+									       &amc6821_cooling_ops));
+
+	return 0;
 }
 
 static const struct i2c_device_id amc6821_id[] = {

-- 
2.43.0

