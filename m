Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B5C22FDFF;
	Tue,  3 Jun 2025 11:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951186; cv=none; b=F9GnbtQPoNVDMC7XmdG5ygCKKyOUu0mIwYK3NHUaZoi8k2EcGEHWx/fQuE8qfiQatSX8Pu+OAAo3UVv/DgJ7CHs84068n9j10VfjFovS1VCwMObAMrARhSXx1s1e3rQaBQv/d1S4aqufu7wCYoqHgkorKV+htzNnCRrearci/8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951186; c=relaxed/simple;
	bh=46z+CHp5FplvdxQZLMRvZ4Je4WlVrniIZ170jmL7wlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nzlImnXZpTVPQdvvskicvEe1MpH4onUdGJ4iteDKEAyK22uu8/hGzm866h1b2rPtRa8+tZW0QyPLMz2YdUx8zUVUN5eMjQlHuOdKkZze1MZsVNRqfJcsDYWg9x9CKjMzALzLEWkoLU1FcadtsPNvQWEyn19Lj41hwNovBefNk0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYoRmVvk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYoRmVvk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso640352b3a.3;
        Tue, 03 Jun 2025 04:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748951184; x=1749555984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNqV/c3DG1fBhuN3qww4p36YlFduC0lkwktHJcC6OkA=;
        b=WYoRmVvkFZgYFGbO8EEApTHd4FtemtPX9IvEeO8OPtewuUisAPF7EbQtsYnitxM4kE
         vk2f0GYXT3HNw3PLjiDoiuug0Bl29YwZeZU9RJF/76WBP4HStwqvS8HFXAvvv0WeXAVB
         v4JC+N2OPejNgKAbSzbB32bmZa3OkhkQ+hTGVV7EPSjb3EjQ/Sm/D3fQzLvFUr9Gktet
         RzJ/lZnQXRPc0D3lof5eN2+67LNSXG4LX7bIxF9gqPYa01Uq2uQ0RpoDxsDb/wX/+Zz2
         u23XrINb4xRx1l+iwVV8WKiorGplEfF0NCyuPOV/boBTHY5UiSSPrhAvNefxLxyeHPoE
         Z0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951184; x=1749555984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNqV/c3DG1fBhuN3qww4p36YlFduC0lkwktHJcC6OkA=;
        b=oF0c8NYlavqVcGNKwWavXXJcYYC69cN+2L11utLD/9Wpv5Yd0roP3MQYhGw+J+a1mN
         bw9VPDduIA5AN8uiVvXaJ9/4tjemWVZg1qp2CqPJTCPQfdrnaYba4pfzTekU5/cgPLg5
         ciSh8rQgPHvEq1kkYEG+XlDIjWGYq8wCB56fLdnkLKyEUlNFlqcbwzeipfh1qFTvefvk
         KinSP6/nlrZclyttOOiSuwI+AqrostoQZHOwVleLJPPM6sGip12FuUhBbl3HoUqG8/rn
         7HBglwJLxyX7K1Cums8pGTlfVf4hCyJSGtZtSE+MZGpado7fYZeV0EVfaTioblWVnzvu
         RDGw==
X-Forwarded-Encrypted: i=1; AJvYcCU7DS7Lk9XaTkFI7jJsvdCH6qqE+DDLyH52V9X34LCdv8FoPP2odp2gAFcixYpb4WaiiQA07I4OYhzE@vger.kernel.org, AJvYcCVNcZSzvi1evWdFpgU2hJVkXlAaP6t4URt1xkPjrEn/+5hdiwVo0YZdhaNri0yedTJH4wcrK+vVZVFEP3/u@vger.kernel.org
X-Gm-Message-State: AOJu0YwZnE7MEpbY8KDg+w7Rs6pfxVBNvg6h99cLhbg++8UWu92Bbn0W
	xr/MZDC6TE9iTxxaSatkvg1WEeqv7IvTkCySoBK4WgYjx9QyVfVQxKCp
X-Gm-Gg: ASbGnct5PNbcz/bYxafXnTnmosv8zsm8vmVCL8kWqHq8ouSGIYO55P+68De0jMk0tjJ
	TLdQiHiwQh2xDIFF0rnuVa7vqCyj/H/C7e13JvsNvHN2FzfTAUb5yP9ePme/97XRWSymyTXvJTK
	URBlMCwjV8FQ1zJzjviJqCCPlonj21OsDLgl+/DNbe4eh9uelqhSh8ONDzWYmDGjTMq79Nw6YGd
	nradPI5uD08R7DsUScdqsVXuxr4ZI5mJI80uUjEZnclDCoHal0H/KxQdF/+tSDDVtGBx0uPZWDR
	Wc+xofubYR8w4K9yA0/X7vvyVX5KnMC1xtr5TXLpJXpKgkycU9sShVrtQb3qJLeKVZhr5xrTFp6
	THHVWy0SWAgRUr2w36h6g
X-Google-Smtp-Source: AGHT+IGgSnNZEK3IDe5Uoa0aO9rllMo7czQcZuW+XjqLX+PNb4Ok39zD+MBqKXA2h5FXnbvZ+n5sEg==
X-Received: by 2002:a05:6a00:178b:b0:742:a111:ee6f with SMTP id d2e1a72fcca58-747c1a8610fmr20422329b3a.10.1748951184114;
        Tue, 03 Jun 2025 04:46:24 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeadbb8sm9446459b3a.66.2025.06.03.04.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:46:23 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Tue, 03 Jun 2025 08:44:56 -0300
Subject: [PATCH v2 3/3] hwmon: (amc6821) Add cooling device support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250603-b4-amc6821-cooling-device-support-v2-3-74943c889a2d@toradex.com>
References: <20250603-b4-amc6821-cooling-device-support-v2-0-74943c889a2d@toradex.com>
In-Reply-To: <20250603-b4-amc6821-cooling-device-support-v2-0-74943c889a2d@toradex.com>
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
property is present in the fan device tree child node. Existing behavior
is unchanged, so the AMC6821 can still be used without the thermal
framework (hwmon only).

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
v2: Unchanged
v1: https://lore.kernel.org/lkml/20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com/
---
 drivers/hwmon/amc6821.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 92 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 850a42510649279fba23ed504826384e1d8e335c..218efa0d405b87e838874c273cff7f2872a02448 100644
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
 
@@ -805,6 +809,56 @@ static const struct hwmon_chip_info amc6821_chip_info = {
 	.info = amc6821_info,
 };
 
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
+	ret = regmap_write(data->regmap, AMC6821_REG_DCY,
+			   data->fan_cooling_levels[state]);
+	if (ret)
+		return ret;
+
+	data->fan_state = state;
+
+	/* Change to manual mode (software DCY) */
+	return regmap_update_bits(data->regmap, AMC6821_REG_CONF1,
+				  AMC6821_CONF1_FDRC0 | AMC6821_CONF1_FDRC1, 0);
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
@@ -877,11 +931,29 @@ static enum pwm_polarity amc6821_pwm_polarity(struct i2c_client *client,
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
@@ -962,10 +1034,14 @@ static int amc6821_probe(struct i2c_client *client)
 
 	fan_np = of_get_child_by_name(dev->of_node, "fan");
 	if (fan_np) {
-		amc6821_of_fan_read_data(client, data, fan_np);
+		err = amc6821_of_fan_read_data(client, data, fan_np);
 		of_node_put(fan_np);
 	}
 
+	if (err)
+		return dev_err_probe(dev, err,
+				     "Failed to read fan device tree data\n");
+
 	err = amc6821_init_client(client, data);
 	if (err)
 		return err;
@@ -980,7 +1056,18 @@ static int amc6821_probe(struct i2c_client *client)
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

