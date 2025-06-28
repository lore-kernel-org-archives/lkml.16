Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ADD222586
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 18:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751135054; cv=none; b=WioaznsPjQyxwIWB9ZZRsYsSaWjwbZlphn9mS8CbvrFVrzPrbbwcCG9K48+51M3/AxnZHeCZd8VktZYnwJTWNI093mD88LF00IHWZW/DbdFblbN1aseftrc7KB+8+SsIeTsadSImcFVWWR+NLBHEBCNqY42Wz7+HhYKS/peoW/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751135054; c=relaxed/simple;
	bh=Vn5+2bgtvfPS9qCqWhJMk22PfY3DVZYJGIAqAoBVIig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEQhBhQGwYtBuh4g6EE2gNA8CDAViXWI/CK9gynxML68mwawsL4fjYuDhnqggMny4xw0s2eZmDOKNj+sUWpGzbD9N4Kc/xRsRIapgiPz9KMeuDkenT8bjVUHBx0gS9FZ+xGxW1AgB4ywjAMgl8UeIJhmdocVpdOSE3dPi9/wn7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IK/Tpf97; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IK/Tpf97"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-73a9c5ccfcdso538887a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751135050; x=1751739850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGEHW90gNNjHt5IztadQjOw1eB6HNXmwtaUXnz7Gm04=;
        b=IK/Tpf97VJZyPIEmDoYFIft1FKRyx0E3tctknqPpReCOnFu+auT4lAEA8ngjGyviuW
         y0MZ1yafBU2FsVoaK4aCmHEllEaxCM+ei9KztwQofsA8y6oPbwP2TqMCf+KzvECv86sc
         JAgllqUkW0YCk3ODUkfgZVlPxcmoAl9qUhBluSGhNO1QiVyE+7mPLara5bQkf8Yw+WUv
         46km5sfWkF084QzO5T1tlEjbxfXC+VucJziueNHEjxLNL5kkUO+9tp5qmnWWIfDQR45y
         AHBus3nFis93KWaUamVZje4aIYfGP5JP4kQpMqmmHDCs1a7gM3u+lPKL3Tv21lgNxTuD
         hGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751135050; x=1751739850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGEHW90gNNjHt5IztadQjOw1eB6HNXmwtaUXnz7Gm04=;
        b=r/2AR2keh0/Rsk3cN8DG2bdkUliKkTYnGe9ZAC9KxRmqLlpWpYkjh/bsLj3X+PEJUd
         t5iX6BNEV3ZrcGxi9i7WyGV836978UdGe/yNofjtsLIjQrb9uG9oB5YyM9A2P6lBr3ud
         kX/YrURhGHje23sLKaRKNaizOKlJTITiD/aoMZVpxPxZRmSt1v49+4bxibIg+9z0EZLA
         KgkDWKriQG/pMrFSaucOIAvljOmS1NAPPsiUW15n4tcxg9sgArLKzFrZvMcdPvtcWL0B
         +Bxto02jVmbYUX8R0kw2WOBZv/zIr7YeSmG0sD/QetlEyYt1VlfXkm5/6GRN2NMxPSDo
         3JLw==
X-Forwarded-Encrypted: i=1; AJvYcCU60KV6RCnJo3Yl7AyGi212gtlFBvPLIAU65/9d2VX2OE5PWgoqXQkjVLBfCbnkY/le/9b/0JB2/7VTEAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKzF0PScs5f5GpNsMgijtOCwkqo2mtK8n/4YW9MsVH60S48AN9
	w1MK7T2q+dWVMsUc03mG3EFb+0TWw6Olzuh8FxjuUexpRt0x88aapk8OEkDJoovKfudWpRewDTi
	FAUmMKNk=
X-Gm-Gg: ASbGncu3l/kYuhntcUHRCKEreU89IXjPI7h/ZzFMNMHn6ZSlR7tAq+uf1Hpn/rnvvEl
	E8YucGr1b7ID9/++iN8K0BARTRf90hmwrYFaXN8Gycy6Hr70l3+v0kklQay4s3Zh0GsNJgnieSR
	XZRslCaqiqyxcmIVG9XLCgxTT1T8Z3y6A844Sy7Yfcn3vK/QZCOXOvYX3Vmy6qRMQ2fwR0ZRpk2
	DvbqdAecNqa5xqjI5UYGUlOm6yTtgrW7AXWW1DBOE/1uT+ezfrnKQXJa/eg/57ZDzoANQrCapEb
	XJ2rkMYVoFsWdtmkctBOfO7dpnutKOY9KfSc3xQo3Z8Iw8+0rxrjr+T9OlFgxrQ9udrsYcrsrRB
	fJYY=
X-Google-Smtp-Source: AGHT+IHNR8EJAaQnAdyzC2AU/eeGSrNjzrGwR3T8S8xZRtBcbASkDxeJixzR5DKOd1m+MZlAYjT58w==
X-Received: by 2002:a05:6830:4986:b0:72b:b8b9:9cc1 with SMTP id 46e09a7af769-73afc3abf6fmr5958119a34.5.1751135050048;
        Sat, 28 Jun 2025 11:24:10 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afafee682sm902248a34.1.2025.06.28.11.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 11:24:09 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 13:23:48 -0500
Subject: [PATCH 1/2] iio: proximity: vcnl3020: pass struct
 vcnl3020_property by pointer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-25-v1-1-5d99cf17790e@baylibre.com>
References: <20250628-iio-const-data-25-v1-0-5d99cf17790e@baylibre.com>
In-Reply-To: <20250628-iio-const-data-25-v1-0-5d99cf17790e@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Vn5+2bgtvfPS9qCqWhJMk22PfY3DVZYJGIAqAoBVIig=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYDM7YwJIsTBC3/tgiqXNZ3ilb3pDfz8+ehcO3
 d5+FIc0vvWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAzOwAKCRDCzCAB/wGP
 wEowB/9L5Oh63yVqhswKGkbnLnmebYfPtLSEoMJGImWJ2RRP30Zz1EnUYKhe14LQBZQdGMYoUCj
 NB15Ir9bJRjsKfXbwI1mqJsKY2JwzjKdFRUKnY/B/cWZjsbrSOXpoBDzIxUnVtOf3eAOqTXLmND
 sZjelu2fLjYH72LZIChWTm3lnXJ9yja4HxgveZQnEKHxgIH+TIZFLh4vojdS6W+OmWFRD59kGfp
 86T5Uluzm3BCIvXKvW7kBTuiTGsc/KFM4MPlEmpDFrPtMMtDnLmVxtx6dO2b7CXS83j7CZUmCNZ
 6SkFtXZwJAhvjO5OxmhFDhJosmb5BSCNwDSp94SpEzKlO26l
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Pass struct vcnl3020_property by pointer instead of by value to avoid
copying the entire struct.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/proximity/vcnl3020.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/proximity/vcnl3020.c b/drivers/iio/proximity/vcnl3020.c
index 31e77d9e0c90e503e5e337f1ae7f17587624a785..234bdad543cc25e59ace336d2870356b9521f8c8 100644
--- a/drivers/iio/proximity/vcnl3020.c
+++ b/drivers/iio/proximity/vcnl3020.c
@@ -109,22 +109,22 @@ static struct vcnl3020_property vcnl3020_led_current_property = {
 };
 
 static int vcnl3020_get_and_apply_property(struct vcnl3020_data *data,
-					   struct vcnl3020_property prop)
+					   struct vcnl3020_property *prop)
 {
 	int rc;
 	u32 val;
 
-	rc = device_property_read_u32(data->dev, prop.name, &val);
+	rc = device_property_read_u32(data->dev, prop->name, &val);
 	if (rc)
 		return 0;
 
-	if (prop.conversion_func)
-		prop.conversion_func(&val);
+	if (prop->conversion_func)
+		prop->conversion_func(&val);
 
-	rc = regmap_write(data->regmap, prop.reg, val);
+	rc = regmap_write(data->regmap, prop->reg, val);
 	if (rc) {
 		dev_err(data->dev, "Error (%d) setting property (%s)\n",
-			rc, prop.name);
+			rc, prop->name);
 	}
 
 	return rc;
@@ -153,7 +153,7 @@ static int vcnl3020_init(struct vcnl3020_data *data)
 	mutex_init(&data->lock);
 
 	return vcnl3020_get_and_apply_property(data,
-					       vcnl3020_led_current_property);
+					       &vcnl3020_led_current_property);
 };
 
 static bool vcnl3020_is_in_periodic_mode(struct vcnl3020_data *data)

-- 
2.43.0

