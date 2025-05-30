Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFFA26C397;
	Fri, 30 May 2025 17:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627225; cv=none; b=sZRgsrmO1VfcJSGSW1oS4MzzPkUwalZup2JC23ecWkSEXDPE61eHWNiMR1MjBmRzDFT4qyhz4FwkkozfsQlGpSKruNVtpHA8U3ej/0sGvTHxQQzsVTa2duOwIiTx5RNO9CqMX1yb26/DtxPIDYY/MG4F+VgaI5iBauFQ7pKbjkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627225; c=relaxed/simple;
	bh=zIxZUPINiB71fpjaRwMtAXcPO/BFOQTNAgmjWX4YAXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0q8H7MWw539KY0tmwBspAPpGIzKqGcJxExzfMT/EEZh2Ykt3PyWKiqN6cqSv4XuRXZv19m4oYLdmSrRDumSUjyLmPvF2eUO0N9BSuCUHzH/CCmbNwrLJGMNa52i8rweaNOp65ix1yvBIhtu6/wF90ADjwI2P5N115sO0Lav8dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcOxPqmi; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcOxPqmi"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-735ac221670so1273212a34.0;
        Fri, 30 May 2025 10:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748627223; x=1749232023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8jSrbzxTIV6JI6ROOZVNoqdJ8N6Uj17TZ6mBSovTa4=;
        b=EcOxPqmiI4NdnPPeESjnRNxU+IFPKzSHokjQl4dzo0tt4t0BZ6RyNTZHnlSJL/TohY
         MCoVofasV5lpRht05tOodYvo6BJJe/7TadH2VZ7oPeV6H3x2U1Ew7Y2FlXdaCYM+0600
         YzICLd0gX3KPqK9OHBlwTQecVaruUXy8znjilM7xq1WuENxHkLXLu5mHeF83p2Ub8ei4
         4jnfy2uPKG8qSN3jqAuXvGsHNsAVt86sQMUDTRN2arzsGYoFeRQPmXxnDn8MWe0rkAN6
         nIrU2sEtiwNwIo+odaPYzr0QYkKakDsIu5mql/hNhjzPlkgM7n1Y9KNDGk0dUruVM6C+
         le2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627223; x=1749232023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8jSrbzxTIV6JI6ROOZVNoqdJ8N6Uj17TZ6mBSovTa4=;
        b=YTW5TOCqgwDiAeCe0Raa4Z9DZZfLYTMrcQ8dFals4ff8I4sQ76pqrfk2n8k6pys2nE
         bwERfYfNmX5M+h5YAVpT7EiueO1JoLAiGiSAPwsF2kDSxoiMW2onVp0BFJr8ipSob85N
         KAatuQcjgQtvuPJudErE4yNGvDX11j2f9fpA+H83gbfJMXWBunDHJYh7oJKGnIStdfQ1
         HC4+lv2nU9H1JJrvnb+2QoUiu+Vhlsd0x/XFYSkV+G2kN1XVdsh4jjVu8ZYlXwEtc55d
         v44uBcmRnvuYjQ9GGTYD//cLRcnGGRerQkbtFzjG9mWIeSijFA82KcuO/XUPFQIHmm3m
         fsFA==
X-Forwarded-Encrypted: i=1; AJvYcCWJphoVnR6q7d9qCkH2PqZvaEMOcGLIVOc+Urzj4pRFeG9tvcvkvgutPeXA/zAJ09IMPLgXR8o3HCjRm0kc@vger.kernel.org, AJvYcCXTLqoYrxNbg+XzyImq3vBF7qKaxFYhC4LVkR0JiAiT3HiICCaLdkZmoIMAr1/WkLSmt6W6YfHCSvLu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+lRV5HBxD5hX4kXgkVzv/lsajR6xoGn1fBTy6BKnMuzpfJl9x
	EdRpDw3ZjJrM9712x7EgjUw0N92jBVP5WLlwdbCMIBCQpz2DNAlNzt2SLGsnfdVH
X-Gm-Gg: ASbGncuyudOlxFpCFz/S9cg4HrCHNNODPnyUViNsrRqL/kdp6VrScOpUd1zQatWF/Ag
	oYMvMo9CF4cuin0CxLG+UbQZzvVTAifjGXkx2OZPBB2VWSQZmVP0HQIHrNRoLd02kafr0dDek1Z
	wrXLO1SFpBQip8LElc1Cug+wFL/R5t3AiT/scvwYdckLwmlXFx46GWPVuw6u/k9evSUOxQmWHl6
	fawP6WBhVaMvGLJeovce1yK2aEqKvjqDdw4oMCYZ0mLiovXwDJTXqkNfGXfAZOSMcAgHYjBwXlj
	PazfBVUYu3msfq55KifIjRPCuqhKZTpavQrwYjxUG3crb5noy/IGMTB8BivK3D5BbiodA4n8P58
	mOLDijwNU8A==
X-Google-Smtp-Source: AGHT+IF8d8o2lQhmhY9V2rCtmPZaUMLenTO9/WFy67VF3R8YCRg5chd5WTUYrC4BhFSLSekT50xnSA==
X-Received: by 2002:a05:6122:17a8:b0:50d:39aa:7881 with SMTP id 71dfb90a1353d-530810a550dmr5024998e0c.0.1748627211536;
        Fri, 30 May 2025 10:46:51 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074ab0d37sm3578591e0c.8.2025.05.30.10.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:46:50 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Fri, 30 May 2025 14:46:27 -0300
Subject: [PATCH 3/3] hwmon: (amc6821) Add cooling device support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-b4-v1-amc6821-cooling-device-support-b4-v1-3-7bb98496c969@toradex.com>
References: <20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com>
In-Reply-To: <20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com>
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
 drivers/hwmon/amc6821.c | 95 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 91 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index a969fad803ae1abb05113ce15f2476e83df029d9..f4c2aa71a0e68c071fa4915567327585c20ab5f5 100644
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
 	enum pwm_polarity of_pwm_polarity;
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
@@ -849,10 +903,12 @@ static int amc6821_detect(struct i2c_client *client, struct i2c_board_info *info
 	return 0;
 }
 
-static void amc6821_of_fan_read_data(struct amc6821_data *data,
-				     struct device_node *fan_np)
+static int amc6821_of_fan_read_data(struct i2c_client *client,
+				    struct amc6821_data *data,
+				    struct device_node *fan_np)
 {
 	struct of_phandle_args args;
+	int num;
 
 	data->of_pwm_polarity = PWM_POLARITY_NORMAL;
 
@@ -862,6 +918,22 @@ static void amc6821_of_fan_read_data(struct amc6821_data *data,
 
 		of_node_put(args.np);
 	}
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
 
 static enum pwm_polarity amc6821_pwm_polarity(struct amc6821_data *data)
@@ -970,7 +1042,11 @@ static int amc6821_probe(struct i2c_client *client)
 				     "Failed to add fan node release action\n");
 
 	if (fan_np)
-		amc6821_of_fan_read_data(data, fan_np);
+		err = amc6821_of_fan_read_data(client, data, fan_np);
+
+	if (err)
+		return dev_err_probe(dev, err,
+				     "Failed to read fan device tree data\n");
 
 	err = amc6821_init_client(client, data);
 	if (err)
@@ -986,7 +1062,18 @@ static int amc6821_probe(struct i2c_client *client)
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

