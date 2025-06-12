Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2200A2BDC00;
	Thu, 12 Jun 2025 17:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749327; cv=none; b=CNHl6dyJBWNOV9eTO7YxnuBB4lqRY3D2zaVYuXNt+kczjXeFU4RhQMNLbx/yoW/ZgZPVbdPbKXY3RF3VR0LKf/FJJURVAfZUJjyAP0sw+sxyrA27C+Om2kc4gd9zWbg/wfQWodXRsaltPxkhipHfl5A/HnYVLZIjVV6fDnr0Gg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749327; c=relaxed/simple;
	bh=AozvK/5U+6wBXRp41xZyaThogAWf0PSIUKgwcAN2z2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQa92bQ7G1dvmUGxURGaBNHPeiZong7j2dbeYonI3UtFRFjOkb1yEM2Fzlfj+/w25s5jJF63sMeaNp+87Eo3cnDkBczIQHeaKCyTGMptz54gyjcrCLa5lacLB9bj5A+cWaxaF8luAkyX3s23GbwoSozpysFeq4I8ZZmVK3u+7sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Obw8W6sE; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Obw8W6sE"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so1064665a12.1;
        Thu, 12 Jun 2025 10:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749749325; x=1750354125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmuUO8nQoY3c7DRNnxZ7kn0ESbqmdfBPxrOAUf2SnQg=;
        b=Obw8W6sEKB6tlBCBbHT84FpdFxrkJ/282T7flXfuDRjQbRiVoGxsRNIpygJQAoU/Dd
         WwlrgY8gEHhTfnvNhd4Ag8hRcmz/f5HEWMkxCIyjAPVCXy9SGOKjXjxY/CxzLImRbIK6
         u0rnxHa2DaL1jFRbvCy3JxIu+pXkCPnWONhUQnsHkxdWza0hM4Fg80zyn0Q3cr5ramJK
         duKj+ZFHgUi38eCfX14o2QIxDyobpiIoopjmoIU7AtPX44KT1dMc0+BUoGPfKLOqDVg8
         M9D+tiW+53UegtfVM37SDqz7MsxQcoucn2FnYnVfnxEzUiasPWqGfQB/y1suwuleRcwz
         VyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749749325; x=1750354125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmuUO8nQoY3c7DRNnxZ7kn0ESbqmdfBPxrOAUf2SnQg=;
        b=eAG10S0cnxwbBHmVVqFvwkjnQY1rWgyzwkdb4CD7DjHbm2+ov5c7Bmf7N4Ked0tf+8
         9ctIgEPnl6gb5EfP4bF9HwJMCAcNNza0oN2oMPeW6Jcbi7Sw7FZmfXfeBNP2AmimbjpO
         qPCovezPSjnl0qD9h5+grzJazr5ZFEWLGkQ5H01uyUMq7mUY9xipdeiNPhc/EYg3Mg6d
         wqmAIHsbCappx4lXjg3egG+h7AE5l2/x53nPIuMdlChMZB7yr9Xu6Bh1BLJtCftKpVbS
         7GAKAEB3KQCoi+GICClNq3psBLqMc5bkUY0t/Ppkts3QWAipXRDXcOgIV/t1L4o93+Ux
         kvQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK7tNxErugodUDPEGxjNXFWuxOdjAVPdpcbVfdXO4yZNyYRCU5T7SAp5PB+lBqxBo6O8AVoYKD09JHfMjz@vger.kernel.org, AJvYcCWY/Ow7pE8N13RLMlFvoSFOkEHHubqFJ7LKjJKjcYF5823g9w585VLctmVqaQOdfqkPidD7shEeqZZe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlr4il3Lk3HD9Y4zh4YOwHl+p0KIj7kukmTkbRSsc2rh9zzJ3T
	9R+LJIpxLslw5S9VXCgNQdII1mh/BKTIqlu0KAb6sV40Db4cdP9tHPgY
X-Gm-Gg: ASbGnctb8OOJZxyA7HrpCx+Cg3zU9XreB2o/vAdCB9DNKwa3cIMy72/pebD7i9ecyCY
	9pq1rqG8gGfl7dBCERNFRxcJ95CTfKS7j85svJeItA/0fgCIo8sCbZ5yIUDbaZ4jI4+MGIE6Gyj
	2NbLJJmGoqx6IPBpdKgnojPSmJ+wuaP3PXd5JM8QlvtofXuOpBKpwkmywELOk82VpW23Suk3ipp
	hW0Yix4A0GZBD5fRf7ag0RiQW+iLid6ty+V7b3+0VquC5XhIj0HWM9SuZCFdCWNLeXf9xNHSx49
	wRdsLfwRBYLVso0DUkNWwySwXtUuhlfwPy9cip8vzQsen/WTSHohnm2SYHpw/C6bP0BuGJExJgn
	ANZJdg+nTcuktNSBQ0LSm
X-Google-Smtp-Source: AGHT+IGD0uYZhWH0OKCohG5z9EZ68VQHAMQbmcy/0Ff19PH2tXQ5aYKeM50xbHDWiR90sfEGEIPptQ==
X-Received: by 2002:a05:6a20:9e4d:b0:218:bcbf:52f9 with SMTP id adf61e73a8af0-21f978f4abcmr6132869637.42.1749749325294;
        Thu, 12 Jun 2025 10:28:45 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd6362e28sm1665891a12.66.2025.06.12.10.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:28:44 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Thu, 12 Jun 2025 14:28:10 -0300
Subject: [PATCH v3 3/3] hwmon: (amc6821) Add cooling device support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250612-b4-amc6821-cooling-device-support-v3-3-360681a7652c@toradex.com>
References: <20250612-b4-amc6821-cooling-device-support-v3-0-360681a7652c@toradex.com>
In-Reply-To: <20250612-b4-amc6821-cooling-device-support-v3-0-360681a7652c@toradex.com>
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
v3:
- Fix using fan node after of_node_put()
- Add setting the pwm duty cycle to max fan cooling state level on
  initialization
v2: https://lore.kernel.org/lkml/20250603-b4-amc6821-cooling-device-support-v2-0-74943c889a2d@toradex.com/
v1: https://lore.kernel.org/lkml/20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com/
---
 drivers/hwmon/amc6821.c | 114 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 109 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 612895db7d8d4096372310c9fa71c103d642dd07..143a2d6a5593f462a456c5d9a9dad0e97fa73ab5 100644
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
@@ -962,7 +1051,11 @@ static int amc6821_probe(struct i2c_client *client)
 
 	fan_np = of_get_child_by_name(dev->of_node, "fan");
 	if (fan_np)
-		amc6821_of_fan_read_data(client, data, fan_np);
+		err = amc6821_of_fan_read_data(client, data, fan_np);
+
+	if (err)
+		return dev_err_probe(dev, err,
+				     "Failed to read fan device tree data\n");
 
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

