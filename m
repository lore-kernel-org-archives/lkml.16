Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1660822F39B;
	Tue,  3 Jun 2025 11:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951183; cv=none; b=HAt9igHGJNrOO1jxeK5gM4SWoAndnIoLzdA5jsUQ2xEpwwFcxZYSkD2MxTqoumDwEDT/cwSiHaPFdizlCjOi5TXkBPu0Ld5tXEUTh3u2MF8+DpbKCm2hD81eSIfWDjmVK1KaB+yDVD3JsHKfOKyai3Psnec5qqsm3Yp1OXTG69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951183; c=relaxed/simple;
	bh=HMD/cjDrdB42kd7q9Q9vTVu8zbV4eDiLo5TPujNd7Xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/e/P+BPbozu8T5cL1dPsZgR/17X2hKPZNn5eIFKYYs7mxau1xk3m6cfG6hesiVCsX85jCWTkHKaIw0dlzRZluHDc9hTDedBPVE2tBHmxYBHmsixMvupL5SJM/qoqNfEQCQY3/jd1xqfth5tSRo9r5koegAKg/kXHGZcdrEa6U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICEyQoQb; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICEyQoQb"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-747ef5996edso1403886b3a.0;
        Tue, 03 Jun 2025 04:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748951181; x=1749555981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CAOW5vl/LLe1o7M/Bk/ENUPRqGBcwp3DBRCrvbrPQE=;
        b=ICEyQoQbGrmQVNquDGwhzDMtd4bcRvy22oA4V3ssYMK8xg6BnFRI/UNhDLpMZ5UFzv
         8miTFWD8TSPkV2cIuflOTP0OH7k+ejb+iUG7BnGhJJq9cwhqH8uskd12nz9F3UICr5PY
         cERc7P2MUYRY6e+DX/l9EkiiBABB6XNYRj7iwpSHTytPsQ2vqvIU3EpyEaWvXWRECLC9
         03DFzKf7LWJ1ylBMET2fan4EiusndIRnVSIpN5T6cIksCD7XjJmeGk21Ehrdia6N+KDm
         Z0m5hN8lrfb00Btn+6vo+/otUkMuOEuW4Jvov5N6O+zS2T5JzGW86k1xZT2XBrikFuBQ
         ryig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951181; x=1749555981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CAOW5vl/LLe1o7M/Bk/ENUPRqGBcwp3DBRCrvbrPQE=;
        b=m1lm377TjEAN9IUoTIPpnjwXen3TJnpWpLcF56atG/OVowOCjwFvP4NlgNcVlbinnE
         mH+AaPuD9LO1TormfK4x3Yv97J0CqYdSHWeAb2x5EFv04xJFY0NYBmgxAN0zGRGutt4V
         NfhDQ5H5ui9icuQq06e5eFGZDuRdHSfmfqAc+VuEAe9h8yus/4ZFZoI3f2KlYku0FNAr
         obWT8S1MecAuZs6vPW6POCl9CXeiXUz8bBI5td7SjO0hfTkgqax4PCl3ijQ2aEXtXTsF
         ewDlmm+cl9HR3aFGpr0U47g/h8hmxnyW3ztYoLYPw7cQFShkii8k1dT3N+nDWt9wDGo9
         2FgA==
X-Forwarded-Encrypted: i=1; AJvYcCX41jONyzodLv5UiAnOmNpuVsZSUSI98L4pBGLZbv68fJJA/fA7noHR/bplWyMJKDfjfq1awO0LtWVhwRfL@vger.kernel.org, AJvYcCXGZH3GXsrEoLauMLkW3DsKXnF23PakRYGSatZLKC+DvSRu7ljdFdToPB4QWUCnCSsIG2deEDN2RxMT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjh2mWrKoZENsOsRPzvE/covoKz2KAcVrCS4qGvL04kLmzz2gU
	9HkDrdLzzcQ5coYht1cQMM+2UH1Bh4J3Nt+RxM6Id/zVOXdve5NGQPlf
X-Gm-Gg: ASbGncvJ4hnePU0VkMcKbEH1TNUR2rBsRTaG6w4VzUOSUjpW4BYwMxChliMIlhl5D7o
	4gBJj4LTlXgONI1k07ZLHOCFrLUFCs5P5nZl/GMzMWbL6snojd44aJwq5M3aWY8KxFDejXsOe7T
	y8I94u+/ZaM5+lcLyUVr7egLCQJTLlxJ7WsWCjkekc3zb0qoYfrznp9SsLZ+gOheGne+90kKT7R
	R3ypWi+fAaqgvbTKb+HSsOnHE/TIywGFU7Iw50KRSadq4k4ZflHbZIdz2kXKnPuaSBhrcHnWoeV
	v2kF7hzg6B71GgkaavTY4Osad46Z4VuazvkhEv37ZuLWmxm0mmDQG76RbVIPgnhN0z8M/j1xheE
	h7mVy4/SnuA==
X-Google-Smtp-Source: AGHT+IGzjtc6+54YCsqpCYgZgm0OOfs46vu0/qNM0W+LaLOAwQ27JaDx0VZx3kht7r5zAHsqSmLg1g==
X-Received: by 2002:a05:6a21:9998:b0:215:e9aa:7fff with SMTP id adf61e73a8af0-21ae00b198cmr28090728637.31.1748951181005;
        Tue, 03 Jun 2025 04:46:21 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeadbb8sm9446459b3a.66.2025.06.03.04.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:46:20 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Tue, 03 Jun 2025 08:44:55 -0300
Subject: [PATCH v2 2/3] hwmon: (amc6821) Move reading fan data from OF to a
 function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250603-b4-amc6821-cooling-device-support-v2-2-74943c889a2d@toradex.com>
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

Move fan property reading from OF to a separate function. This keeps OF
data handling separate from the code logic and makes it easier to add
features like cooling device support that use the same fan node.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
v2:
- Remove devm_action on release and call of_node_put() manually
- Change of_pwm_polarity to store resulting pwm polarity on driver private data
v1: https://lore.kernel.org/lkml/20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com/
---
 drivers/hwmon/amc6821.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 13a789cc85d24da282430eb2d4edf0003617fe6b..850a42510649279fba23ed504826384e1d8e335c 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -126,6 +126,7 @@ module_param(init, int, 0444);
 struct amc6821_data {
 	struct regmap *regmap;
 	struct mutex update_lock;
+	enum pwm_polarity pwm_polarity;
 };
 
 /*
@@ -848,11 +849,11 @@ static int amc6821_detect(struct i2c_client *client, struct i2c_board_info *info
 	return 0;
 }
 
-static enum pwm_polarity amc6821_pwm_polarity(struct i2c_client *client)
+static enum pwm_polarity amc6821_pwm_polarity(struct i2c_client *client,
+					      struct device_node *fan_np)
 {
 	enum pwm_polarity polarity = PWM_POLARITY_NORMAL;
 	struct of_phandle_args args;
-	struct device_node *fan_np;
 
 	/*
 	 * For backward compatibility, the pwminv module parameter takes
@@ -863,10 +864,6 @@ static enum pwm_polarity amc6821_pwm_polarity(struct i2c_client *client)
 	if (pwminv > 0)
 		return PWM_POLARITY_INVERSED;
 
-	fan_np = of_get_child_by_name(client->dev.of_node, "fan");
-	if (!fan_np)
-		return PWM_POLARITY_NORMAL;
-
 	if (of_parse_phandle_with_args(fan_np, "pwms", "#pwm-cells", 0, &args))
 		goto out;
 	of_node_put(args.np);
@@ -877,10 +874,16 @@ static enum pwm_polarity amc6821_pwm_polarity(struct i2c_client *client)
 	if (args.args[1] & PWM_POLARITY_INVERTED)
 		polarity = PWM_POLARITY_INVERSED;
 out:
-	of_node_put(fan_np);
 	return polarity;
 }
 
+static void amc6821_of_fan_read_data(struct i2c_client *client,
+				     struct amc6821_data *data,
+				     struct device_node *fan_np)
+{
+	data->pwm_polarity = amc6821_pwm_polarity(client, fan_np);
+}
+
 static int amc6821_init_client(struct i2c_client *client, struct amc6821_data *data)
 {
 	struct regmap *regmap = data->regmap;
@@ -902,7 +905,7 @@ static int amc6821_init_client(struct i2c_client *client, struct amc6821_data *d
 			return err;
 
 		regval = AMC6821_CONF1_START;
-		if (amc6821_pwm_polarity(client) == PWM_POLARITY_INVERSED)
+		if (data->pwm_polarity == PWM_POLARITY_INVERSED)
 			regval |= AMC6821_CONF1_PWMINV;
 
 		err = regmap_update_bits(regmap, AMC6821_REG_CONF1,
@@ -944,6 +947,7 @@ static int amc6821_probe(struct i2c_client *client)
 	struct amc6821_data *data;
 	struct device *hwmon_dev;
 	struct regmap *regmap;
+	struct device_node *fan_np;
 	int err;
 
 	data = devm_kzalloc(dev, sizeof(struct amc6821_data), GFP_KERNEL);
@@ -956,6 +960,12 @@ static int amc6821_probe(struct i2c_client *client)
 				     "Failed to initialize regmap\n");
 	data->regmap = regmap;
 
+	fan_np = of_get_child_by_name(dev->of_node, "fan");
+	if (fan_np) {
+		amc6821_of_fan_read_data(client, data, fan_np);
+		of_node_put(fan_np);
+	}
+
 	err = amc6821_init_client(client, data);
 	if (err)
 		return err;

-- 
2.43.0

