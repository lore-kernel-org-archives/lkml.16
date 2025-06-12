Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD9C29B8C7;
	Thu, 12 Jun 2025 17:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749325; cv=none; b=L76dolipedkDUMQvWzX74KICJ5qXQFtsMAtCZL3Lng91wZV7X0uzEiUZ9L8jel4bFJQkzpz/8eOKn2R4AdSM43zBEpK1bjLjlVdBL24uFrdHm1fobt2DLkHgwgCrOoqep7C17h3bqcBXPxX+nD4pFDeRTUFbpuDQD8BXoQw43iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749325; c=relaxed/simple;
	bh=+XwTpQpsyBzCtMnqJ7LepVkLlvQgjzcUOIXHNpHa6Yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LwSLyU+W1VdQHOG6bxc4jvSUs+zthOjMJ5PaxXImBYxjgl/gJYL4U7euUZtWfWeuUXdGlrUCnIGLwuW66xgWZGwXw3deTROwQICjZWGWRJ0qV0wApCLDnQDtF8xNE4YgW79jBJVDLn4gVtc+mbrkQueWodpEFX5BADqihf4fx4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JN7+VJ2Z; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JN7+VJ2Z"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742c46611b6so1481713b3a.1;
        Thu, 12 Jun 2025 10:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749749321; x=1750354121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAiocoSvj6K/palouwV8t5u5i0cthUdH+QFCjgdRxdU=;
        b=JN7+VJ2Z6Cgrkbm2sWIiAVoq88uZQvlKEXoRvexnJag0abvL+qVeKB42LkEUZKmBRg
         TA1jyP6TgZtY+uZkZvGF0YY3dU7ax3cZvU5dBsVVyWL1RNIJ9fQDrMX+86scJwBOr3RN
         wA5FRIiLS/ze1ChJX8mXq7ae/8WE0jTEBO16HPqOIuQ2FjCJgPkCAh1sCXrFUUxiayEr
         YjO1d7I+MPdYEYgnvl3yzyYtiJ/YLmJuXglmlvMi5n5XegoQ7689JreqgjdhC/2ijKzQ
         J7MwWyhH1qZZ37YYhlHvANEuzDnibORA/8aqXf0/pOHKqUygBHKhufuCPs7kHhPsLzJx
         l3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749749321; x=1750354121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAiocoSvj6K/palouwV8t5u5i0cthUdH+QFCjgdRxdU=;
        b=YCNnOLeO143odrpjY1dPsL+HAaFc2uAEeNr1f2r4jxdP9hQ/iy1Wz3JfehWK/nEG5Y
         ph7zmCRdsQTGFdz1YZIoXMo3BIgh5IpUeHh62cw169B2O3XKs9MPJC5aoaAYhZ8+rfwC
         ciAMwfszrFa/OhVERVc1TzX9vqwQCr+uInujPnD8s/KYQccE0TTHx6QF3hCs49ccVmt3
         wtOY6+jILwNuIKDcxeD7hkCpD1QMkMhQe19MsiF6vHCC8M08/Q+RKOiAjJBDexkn8lkW
         aOw5HT9fhhIN8JtlEqsl56GfS7H82GIOHDT1Kiy3xER2EP/2l2aoWWbuAeqt8REL/QqS
         I3zA==
X-Forwarded-Encrypted: i=1; AJvYcCW8amWDMJPuj36hn+H0v83l9W8l3tp8PVTMebTX8nFW5U/wxjkrgcJAa6CDMGZYXno6a6u+1+9mksz2@vger.kernel.org, AJvYcCXxx36Xj5K8hg7pLN7tnzBDh/iXhUCxUdkw8kxgkaLgNFudXwliI7dmiqy5gW/sUSislG6JIRQ74fkTXis+@vger.kernel.org
X-Gm-Message-State: AOJu0YzOASbYrTZ9Tw5l5sZI/UC3Ok2d89vmCnZ9pYKBrTzcEljPj66T
	iw/VecKKJiXHEjOlaf8jXi7GLdTZ+bvGM2L31PuKGdG+h9h3BOlMAfJS
X-Gm-Gg: ASbGnctS0Xd/s7boZNUsTwtLyDGLaOzMeFi5aflpHgqhaFC2ZJwJVbiWwkpsMl0GidN
	0x1zv14uEE7ht53yNDurBgiKKgR+op3qb2bakvySl9rJcBkC74QQy4I/NqRgKoy0ljcPPtk7AFS
	8jYzy2lUASrNOrZPtcA8zrhULUifmHcjub72QHE+KtQdObxn+4WUsjR78VVTWFHmLF7G+apz6CY
	Y5G2h275tgphDtvyRxiswFOGssF/+ALE7FbMI1zX/o5kORGqlF4l7axbsjdlv1/UGrG3Pz9F6vI
	qQjwh7XXkV1BXUKofyeJbkBXiECUJw2gPpCeLD2jadtDoBndOKloLWqvMHIsOUww2CsjbslD/7C
	hUBvdLV/q6sUhttksDZ2H
X-Google-Smtp-Source: AGHT+IGhvmvmwHtFXNI/TFKTh/f+nkQSfssbJsX/a2IkGQJBc8XIAd1a0VsUBpyD2FsFGeyyRvdPJQ==
X-Received: by 2002:a05:6a00:b87:b0:747:bd28:1ca1 with SMTP id d2e1a72fcca58-7488f6230admr213099b3a.3.1749749321434;
        Thu, 12 Jun 2025 10:28:41 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd6362e28sm1665891a12.66.2025.06.12.10.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:28:40 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Thu, 12 Jun 2025 14:28:09 -0300
Subject: [PATCH v3 2/3] hwmon: (amc6821) Move reading fan data from OF to a
 function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250612-b4-amc6821-cooling-device-support-v3-2-360681a7652c@toradex.com>
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

Move fan property reading from OF to a separate function. This keeps OF
data handling separate from the code logic and makes it easier to add
features like cooling device support that use the same fan node.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
v3:
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

