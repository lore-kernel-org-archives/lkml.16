Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B02C19C55E;
	Fri, 13 Jun 2025 13:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822179; cv=none; b=fElW1HBuTELDmaS6J1t8WRenVwLPZxC0sbZ1aMcdpEfbrOHTTSt3JaGNHdJ59JMIGr6s0tXTqFvgbH5q43Ic295w+KF8nqTFmjWp5cUCIF0BAoG+6xR4A4V3wr/bhDYCyN8oaAmDqrAfnodtTvYb0jdYtt1NJyioG0ocbZoLNwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822179; c=relaxed/simple;
	bh=X/nB8WLx7zz4/NBfeOTzqK6Hg2MbKXiI163jTQh1DBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTgZM12CgU7TcwfFfthHAdnuYWVQ/5BG7F/4Sd03e4AbC07vxeN7J30v8eyk/57MGGNGBDbG+tQXuyymofUxNXlZHBVPDarbcbr97tYRFuxcavk8OtVkbpPrgwKBf1cRHDYavoi+oNEqZoT3XnDCnRYWskRkpGDiA/ACKt+8wIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9QQTxMR; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9QQTxMR"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so1732435b3a.1;
        Fri, 13 Jun 2025 06:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749822178; x=1750426978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6Y1ZQon7Ei1dxPdOS13fefVnxKxvM6C2HzI9CWHYO4=;
        b=A9QQTxMRaiTs0BF3IF17wLDIN9iL3NxaF9cD7K9uwjNI+/+AZpH9tsLYdvR2ObLEBN
         4hdwBEIR7YDAF2pi+m7Awq7x3E1GesI+zFfzuoU3vISzKkjJ8byKHSYl3jQqXXhdQc/S
         bI3h5iZZutUhNGt2TQ1uau4huOiMaJVMt2SirXitQGPSrqKDRX+U/cJ9KJ/HsUa2BM6b
         2uZbjgVNsiQHYhvvDuLWQKzXZFBBrRFi79oWkxfnIg0m3xUODrAyNnIMz/7JWkx+QBUw
         XJFAT+0GJR6Z+VSVNMoBMhZklb4rc4A4qH9mQKUhlgvyqa3l7xgpdxVSe/v3cJzTfbPD
         +zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822178; x=1750426978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6Y1ZQon7Ei1dxPdOS13fefVnxKxvM6C2HzI9CWHYO4=;
        b=q4FLd+oSY48+BFOYN+tD2BrETcOYKrLhFwpzUuL91TNXo6rA7i4+5ipA7uFYcTWHmk
         EerR42Da7V4UwJVLRFP+z26nQsaFrkUgrKWY/uhzjCA3MJWX6uOpcGuKruLjqYjGK+7M
         tebQrdWK3RnDgMXeoqE9Tra/Ld0oZpL3tW1KN4vrnCqVYjcJ4Eyj/92D6QLlTMlpX0ux
         2jXG8xQK4CSh27eDvfMXqb/weao/4sdFAMOPDZqVHm9+Z07QwPwmgT9aWR7bVqtSQRS/
         dr3aIIKa8Blr4KjF2naTu53zYV+3dThb7/YFkkoqTcqz3hi+OT0hD1SBbbP4LmdA4ehP
         vA9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyaXZz3U0UH3kNZdaT8VqLRmlCk7sUJ+av8DD94oEgHYhHkEc4Es/sqOCkmNoUp0HlKIKrargOMs4f9/HV@vger.kernel.org, AJvYcCX2Q40ZLBwG4cUC7UfIC26r4XCoxyft0n5PzuJvqXL3zW02Wui5nzupgG+1YnAJMNO325IME2YnSY+z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr+/8hgdaInonc82HbMyfaKJZTGHPy999QSoPspmheBfOIj2z9
	jti8YVo0jfLMRVgenhkiu6HCXnwbf0XX5ayUcj6jFCEOq+0B/adU/UNZ
X-Gm-Gg: ASbGncv1FkzG6LNqB4HyL/F5dIum0axanMQfprV/KYUg3sQkF5TS2/o81hglA8ujnh5
	MJns4AImmW6mGZIb89DMOjIIg/um6c/DLxAJ7Nk3WDQvkXtXJQDu7ccRg9eUXeBrlExZqJlpz3V
	ZquFMpuJTf4YvsYc/PACANK+TRpyGoWL/pDecjbTV+qX1sqg07JzNCfTe74UXSnbVgnnT9Y77/c
	My6rg+q7i8uWGZm52SWpvTMFs/t5DFx+wpVw3vq1d48ybi2kA0XJXbiFN6H0Kz4+TI1sFs2ZyeC
	qRqd/a8LISAPblQYYVrE3sOmccCZSyszsoEnWaWJInQ+2kMvOXRKnD7pUKOwCwnqO0Zcey+39nK
	QUkTHbIYqkYhFPZc4Z/VR
X-Google-Smtp-Source: AGHT+IG2MCMgeN0/FLKpk9+/1bFsnlSCRDdiLGKQPQyMkmIj3t0cVzXbZ9nOGNKrFJ+kZbes+D61BA==
X-Received: by 2002:a05:6a00:3c89:b0:748:6a12:1b47 with SMTP id d2e1a72fcca58-74898845eb2mr879795b3a.10.1749822177608;
        Fri, 13 Jun 2025 06:42:57 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b2d8asm1605826b3a.132.2025.06.13.06.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:42:57 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Fri, 13 Jun 2025 10:42:39 -0300
Subject: [PATCH v4 2/3] hwmon: (amc6821) Move reading fan data from OF to a
 function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-b4-amc6821-cooling-device-support-v4-2-a8fc063c55de@toradex.com>
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

Move fan property reading from OF to a separate function. This keeps OF
data handling separate from the code logic and makes it easier to add
features like cooling device support that use the same fan node.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
v4: Unchanged
v3: https://lore.kernel.org/lkml/20250612-b4-amc6821-cooling-device-support-v3-0-360681a7652c@toradex.com/
- Change call to of_node_put() on fan node to be scope based
v2: https://lore.kernel.org/lkml/20250603-b4-amc6821-cooling-device-support-v2-0-74943c889a2d@toradex.com/
- Remove devm_action on release and call of_node_put() manually
- Change of_pwm_polarity to store resulting pwm polarity on driver private data
v1: https://lore.kernel.org/lkml/20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com/
---
 drivers/hwmon/amc6821.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 13a789cc85d24da282430eb2d4edf0003617fe6b..612895db7d8d4096372310c9fa71c103d642dd07 100644
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
+	struct device_node *fan_np __free(device_node) = NULL;
 	int err;
 
 	data = devm_kzalloc(dev, sizeof(struct amc6821_data), GFP_KERNEL);
@@ -956,6 +960,10 @@ static int amc6821_probe(struct i2c_client *client)
 				     "Failed to initialize regmap\n");
 	data->regmap = regmap;
 
+	fan_np = of_get_child_by_name(dev->of_node, "fan");
+	if (fan_np)
+		amc6821_of_fan_read_data(client, data, fan_np);
+
 	err = amc6821_init_client(client, data);
 	if (err)
 		return err;

-- 
2.43.0

