Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4182D269820;
	Fri, 30 May 2025 17:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627210; cv=none; b=Iweo+wQHu5saGPAISEtGSH4PPQ66V58JGNfu/RJ2gXz6zsGEKjzsCO2t7qYJBHR+KFOIKVVkV/HZ6AbvK8m+wed8+MZ8o5WhWZoluRmvsoPh69PWGjQifRwjPJbhV0ohO9ryj8bYlbfmli/Mmo12BPt0ZKHzJ7diTl4kmK6o8MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627210; c=relaxed/simple;
	bh=+JpBqXqJLKMDMkWO2vyVD4/soc6w0MN0sgT9vjot+nM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b7ILwPKdG4agFs7Zzw+pPZ6d94siSA702UjM435rRirZom57aGS89uAT4Tr21+73Q8K0IhxF/EL2Tam4N5TKOEzWH2bbOXJi1cR7skYbOKSJFcTtS7e0Z174KE6SeKhGWg6Cvn3Gy0lMihxQ+45DHZmPMJW6lvXcz++rG5NMFm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO7udHtt; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO7udHtt"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87dfde2aea2so607173241.2;
        Fri, 30 May 2025 10:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748627208; x=1749232008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKUFBKXPLbw7kwilgIATyY6n6w0/znEVgC9+5Lfbtcc=;
        b=cO7udHttveTROaHDH+XT/Y7ifM+rC3zX+9qDmQAc+ZBLOWUy9NwlqyTVot9NQAmUzc
         ja9ra7fNQZWxfL+i+0GLrhDwdEwnFmodu+75Iyt77xs4TJnmgEGU/OhglTiDYqyQUz2F
         ryUFjFwd/7h5g85rbC1A7C2gOWcyMPDuKz/Up1yEMwLPYNDbD1Vs+T/YOqBC62oS9SxM
         cE8m2iyVKWSwjXi8F0TyGGxE71VpTnLOn7Y/hG0vVQD2n0Li2Mopjw7BEXixYstpbD8G
         8y1yQoSzRI362d6aJ6+GWCSSMgoUpIWbuxAJxivAcKB1uyFY3ttTQPS7KbDz7CTkCRSb
         ZtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627208; x=1749232008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKUFBKXPLbw7kwilgIATyY6n6w0/znEVgC9+5Lfbtcc=;
        b=A8PbRtdF9EiOCFx5Omigbvr3zFq/u0JfcwxpDcM4AVyX/1KQe+kMOJHDNjflaOnWOi
         MbAXZcESVC0/XUWpOzg2Dob9TUusq3Kvhwux7ljad8AUcBcFI6P3KmiloCCTVI19bdHR
         h8di4JvUDP3dceGyi9iMPQzsEPGB65I+mOxZZSsCrSFWzgMb+1mB1WmPg+GMaQUTrVhz
         I4xYAgNtCshH0Lp4eauvNO/PPBoTlmtfoIv/OKYlWhpnRy75cUrepQ517tuMySTdzuuK
         nDgiInUn3oSwhBagXzdRQRlr7ITkHb7uogjAyv93zNnIqjXBtbsknptuPSozayKH18l5
         MeJw==
X-Forwarded-Encrypted: i=1; AJvYcCXY/mzr4hrCiSBsqvGMuc1Ccqss1o8FcPTsn9/OtDWpNWERY8gjAqQeX1Hit93KzW+n3S0NZRT5jP4e@vger.kernel.org, AJvYcCXbc0FilOlfcohZVYCc9K7mACMC6e69LSx550ogEnckk/eWhKQf3QyB1ZxcwtL/CWrWRcAPtoKqJVCOReSm@vger.kernel.org
X-Gm-Message-State: AOJu0YyTCsOcV7sXWRQ0yDNDhmyQDR70oTJO/5dgMssFHDTka0YeSoNS
	+VRvQsp5/ke6tjfsmh3krb0pEncpL8tPwGHcMz9UAc384W7w4+3XbEgq
X-Gm-Gg: ASbGnct9aDOeZOCWh7uOKU5y2lPl8+jojEjXJIyc3gu/sU6wCeGJbBr2vEtFT97mnGE
	SxJMw+44wG28eBARWwwErf9J9lLcrOwAYGiywihhhXgYJkZUk6K184IfpV8rbVm7aUmIGn/8+15
	jLDGt//XY3vu1oEgLjuEkS3rkNUuIffqP+QGyhxGEuNdBbpE0odZJS/qulnQzl9XyCezYcZdFzG
	3S+cAPTKVFsvPo9b5fsG7uVtY3OsCb7MQESspBN+FfkNowYqKpG2aGNqLE+VdXcfi+dDsIxYlPM
	kT3r9ggIetXgp5a0QjmYLbo+cMSomgVrCF+qVU4NUkRDQV20II77r+HDCCzlIu071WfSXu+II6r
	LA5fOY7xK1w==
X-Google-Smtp-Source: AGHT+IGK3/Qcy/9QIOvx75XzyDA7Qqv7k7EdN1+r7RtcTe+8bWLWpkaUyuVLOrSbaffKsjjNRgV/mw==
X-Received: by 2002:a05:6122:1350:b0:530:7e05:2009 with SMTP id 71dfb90a1353d-53080f73eb1mr4781899e0c.3.1748627207917;
        Fri, 30 May 2025 10:46:47 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074ab0d37sm3578591e0c.8.2025.05.30.10.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:46:47 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Fri, 30 May 2025 14:46:26 -0300
Subject: [PATCH 2/3] hwmon: (amc6821) Move reading fan data from OF to a
 function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-b4-v1-amc6821-cooling-device-support-b4-v1-2-7bb98496c969@toradex.com>
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

Move fan property reading from OF to a separate function. This keeps OF
data handling separate from the code logic and makes it easier to add
features like cooling device support that use the same fan node.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 drivers/hwmon/amc6821.c | 58 +++++++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 13a789cc85d24da282430eb2d4edf0003617fe6b..a969fad803ae1abb05113ce15f2476e83df029d9 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -126,6 +126,7 @@ module_param(init, int, 0444);
 struct amc6821_data {
 	struct regmap *regmap;
 	struct mutex update_lock;
+	enum pwm_polarity of_pwm_polarity;
 };
 
 /*
@@ -848,12 +849,23 @@ static int amc6821_detect(struct i2c_client *client, struct i2c_board_info *info
 	return 0;
 }
 
-static enum pwm_polarity amc6821_pwm_polarity(struct i2c_client *client)
+static void amc6821_of_fan_read_data(struct amc6821_data *data,
+				     struct device_node *fan_np)
 {
-	enum pwm_polarity polarity = PWM_POLARITY_NORMAL;
 	struct of_phandle_args args;
-	struct device_node *fan_np;
 
+	data->of_pwm_polarity = PWM_POLARITY_NORMAL;
+
+	if (!of_parse_phandle_with_args(fan_np, "pwms", "#pwm-cells", 0, &args)) {
+		if (args.args_count == 2 && args.args[1] & PWM_POLARITY_INVERTED)
+			data->of_pwm_polarity = PWM_POLARITY_INVERSED;
+
+		of_node_put(args.np);
+	}
+}
+
+static enum pwm_polarity amc6821_pwm_polarity(struct amc6821_data *data)
+{
 	/*
 	 * For backward compatibility, the pwminv module parameter takes
 	 * always the precedence over any other device description
@@ -863,22 +875,7 @@ static enum pwm_polarity amc6821_pwm_polarity(struct i2c_client *client)
 	if (pwminv > 0)
 		return PWM_POLARITY_INVERSED;
 
-	fan_np = of_get_child_by_name(client->dev.of_node, "fan");
-	if (!fan_np)
-		return PWM_POLARITY_NORMAL;
-
-	if (of_parse_phandle_with_args(fan_np, "pwms", "#pwm-cells", 0, &args))
-		goto out;
-	of_node_put(args.np);
-
-	if (args.args_count != 2)
-		goto out;
-
-	if (args.args[1] & PWM_POLARITY_INVERTED)
-		polarity = PWM_POLARITY_INVERSED;
-out:
-	of_node_put(fan_np);
-	return polarity;
+	return data->of_pwm_polarity;
 }
 
 static int amc6821_init_client(struct i2c_client *client, struct amc6821_data *data)
@@ -902,7 +899,7 @@ static int amc6821_init_client(struct i2c_client *client, struct amc6821_data *d
 			return err;
 
 		regval = AMC6821_CONF1_START;
-		if (amc6821_pwm_polarity(client) == PWM_POLARITY_INVERSED)
+		if (amc6821_pwm_polarity(data) == PWM_POLARITY_INVERSED)
 			regval |= AMC6821_CONF1_PWMINV;
 
 		err = regmap_update_bits(regmap, AMC6821_REG_CONF1,
@@ -938,13 +935,21 @@ static const struct regmap_config amc6821_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static void amc6821_of_fan_put(void *data)
+{
+	struct device_node *fan_np = data;
+
+	of_node_put(fan_np);
+}
+
 static int amc6821_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct amc6821_data *data;
 	struct device *hwmon_dev;
 	struct regmap *regmap;
-	int err;
+	struct device_node *fan_np;
+	int err = 0;
 
 	data = devm_kzalloc(dev, sizeof(struct amc6821_data), GFP_KERNEL);
 	if (!data)
@@ -956,6 +961,17 @@ static int amc6821_probe(struct i2c_client *client)
 				     "Failed to initialize regmap\n");
 	data->regmap = regmap;
 
+	fan_np = of_get_child_by_name(dev->of_node, "fan");
+	if (fan_np)
+		err = devm_add_action_or_reset(dev, amc6821_of_fan_put, fan_np);
+
+	if (err)
+		return dev_err_probe(dev, err,
+				     "Failed to add fan node release action\n");
+
+	if (fan_np)
+		amc6821_of_fan_read_data(data, fan_np);
+
 	err = amc6821_init_client(client, data);
 	if (err)
 		return err;

-- 
2.43.0

