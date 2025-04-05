Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F79366;
	Sat,  5 Apr 2025 00:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812038; cv=none; b=m8PmH6TiT8no/ckDXNUCk+FwxC1sn16ZzH5pf4xcUAawpyQifcxabPsZTR+QAgCtnCSTejz8hAt2luPf3yZYl4sgVaRuM+ztLzlkP7GOfp4oFmJxafvhZhzBfQBG2rzEQBsGYIdgRoYdA0/M7TMulI5QbA/BjWeVFOmuZcvYPuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812038; c=relaxed/simple;
	bh=zOIPSUJDjpXEV2XASe4hz9XCB1lPli1Xme9M9iX6Pt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6T+bQrHE4OXG+Z7tGoe4UgGROrdWYpnU4uwd4l3NHsA3zP7QMWCZlzYzj47cRnxejn31KtHkjH1o0/pXdq9le0JBhveLFQ2sjAf00pkX8PUUctf0zSE0/r2J/TNYET5AO/OjiOyKQ5iB1CRxNKLfCShINxNjITdeCNmhRXGf2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRhcxJf3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRhcxJf3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223fb0f619dso26786715ad.1;
        Fri, 04 Apr 2025 17:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812036; x=1744416836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yW9hXSkJ4Waf+74SDd8gksPgJuAu7c7UXkVtQ2I/xOQ=;
        b=gRhcxJf3nxJKrtLPOpUV1ylrTY7sLE6A5T6ISnECXiOnVDhyapP5Dyft8Tophzg2sO
         Twm9yfhJEMuNfhCswF9XDtqKHzdFCviJs7tehjj2nt3wvpA91ydy832ocxgcMf8iCKJ5
         zxM+OQsrdCoZ7xD3XGK8nYQRHRyi9iPtqrDbIWeAgdqwzNOUXjuMzlOjwFjn7Bctys12
         uHYvlZg35qhbiv079s7BNCKQEgVol0gHa6QxbGHvVwYT+66IMm3qkQu66Fbqcf8XbCoA
         mXKhTAh1AeHTetz6MQxgHUHqMKOkPpriw9EBpErxcGMytxhvrmH+Sy55ZlDqExX+TNJ6
         AJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812036; x=1744416836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yW9hXSkJ4Waf+74SDd8gksPgJuAu7c7UXkVtQ2I/xOQ=;
        b=oytVDrBMUk72a+eS+rpT5HTc3IbwfgicvNnR6Q3LnISkqhyCT4og8aOPmofTeNyJ4V
         HdHNcOCKMTxT6Z25Y4s6yn6vrO/8YaMXFGqWgeoLWeKEvuK+FEyi9OzPAoVqj3TuPgKy
         kTkbXOaRsB+hpQMZM7KNOFJGbhn16FHvGOEBVpQmKthPwRCAwaeOGA9WzQsK7tULM2Cx
         zfjXXAmqN5vGXlFYarkqvn3auab/qrBxFst5wYda11TkxzH+n2ha4AVnoNWymaJ5fgTq
         pYtlVCKmkhzqzakgk19HrHPfasCx+j7+pE5qa51/wOZ/Ci8lsu/qQVKEInwzPKQRNS/c
         Oxuw==
X-Forwarded-Encrypted: i=1; AJvYcCW9e9ThNS9K5A4JUcYYDBcBECdTrK0LxcF4sAr+DVM6oC16Lljc54nNYgcuwHcwdUKHmgSKkF1ewKn9SAve@vger.kernel.org, AJvYcCWis2jToarldTCPFpokvyHSyPh+8KeEJGyH1Wv2aGNeSAtynf5IPvdGcXjz5WR++acqnOoTVwsK34WmETI=@vger.kernel.org, AJvYcCWyfnd6B5jtGNQTZ5xac5F6laFKFWE9FsbJqR01UYpmSwQPH1qL+zeZV+7uYXxk0NnCzHeHQhgRZHI2Ns8=@vger.kernel.org, AJvYcCXqloXvG5w4dJkXzkIbo6o8/tj55Nhm98SrK508fO8YrSkvz9OCAu5rM3PY2OR27Tc5ufXBnY0QojJn@vger.kernel.org
X-Gm-Message-State: AOJu0YzH+dBL4ee+DVK38cYoVFWRRGyjaJuaCFMd53S7fQFTlJ0nULZ3
	vjc/o4e8UZDP7QuogvhpWTgSBNWYG658TATQ+AFS6+y7UjZE+zbLPxQKiFW5
X-Gm-Gg: ASbGncucqtXoVWbD0j3SMyjlW99/qFx1Za1ALw39idZfRrNYNEyZP1RrlhVvS0FnT8x
	EVsRXWcdqEA03EF5YdOGC4Uvr0Gve9MWMB8mJE2w4T1j8iDq7DYbxbkgNiDDie7nahOlTJ1iiLZ
	hamkxDHB9jUUd0wsGFpHqIdT0AxkeCfR+va5yso4YUX2KXWdN1uGq+owWE5r0LjMsirAcE0eaBt
	pp35Qi7kPJeXmHiJvg4QbqcKYUGw1ej95d2NRfbheH2pSnjorocmYiNwekVZ6vsE+RzboQLmtEg
	Sn3+fgecJEJb0cihOd1e4WSFlB2Sx4khVZ3ki5kkgiZtLLeIk9ydV7Xd4vX2C96qaDyRpsDSRjd
	3hswXTIqXsZKZSA3ykxRg7uxMhpvUNpCuYM92L3Q=
X-Google-Smtp-Source: AGHT+IGa7e36UcDvxDMrQQfz/mat62V0LnpWU7YvqHeKSh9vf46sMIbVPfmaI2qyNOvWUDVuKcMj0w==
X-Received: by 2002:a17:903:1245:b0:224:721:cc with SMTP id d9443c01a7336-22a8a05b5b7mr55301085ad.13.1743812036182;
        Fri, 04 Apr 2025 17:13:56 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:55 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:44 +1000
Subject: [PATCH v4 07/10] ASoC: tas2764: Raise regmap range maximum
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250405-apple-codec-changes-v4-7-d007e46ce4a2@gmail.com>
References: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
In-Reply-To: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=BkIMz4eJxcgeuEtuRc/ufySB7IywdlsAKS/PxKZmonw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfStvkThXohen5PT0oPyc6XJybTzJltof8G6XV6V1Mr
 nrWm+o7SlkYxLgYZMUUWTY0CXnMNmK72S9SuRdmDisTyBAGLk4BmIhsKMP/8OU9Pxeyf39cLb5P
 Y9Ejy/kNl/9t4lmgeKxTxuZ9uK0hK8M/hZWZjo7b1j05qrTJxmY5S+mR7N+5jJ2HfBSMzoaeTUn
 jBwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

TAS2764 has a number of undocumented registers between
page 0xf0 and 0xff. These are used to apply in-silicon
quirks and workarounds at runtime.

Raise the regmap max register to 0xffff to cover any
quirks registers.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index e291ec0951d49ee902589df16c4db96e83614e66..c55c6e4ea1e2ce0051e43120a71e229238204fd5 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -724,7 +724,7 @@ static const struct reg_default tas2764_reg_defaults[] = {
 static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
 	{
 		.range_min = 0,
-		.range_max = 1 * 128,
+		.range_max = 0xffff,
 		.selector_reg = TAS2764_PAGE,
 		.selector_mask = 0xff,
 		.selector_shift = 0,
@@ -754,7 +754,7 @@ static const struct regmap_config tas2764_i2c_regmap = {
 	.cache_type = REGCACHE_RBTREE,
 	.ranges = tas2764_regmap_ranges,
 	.num_ranges = ARRAY_SIZE(tas2764_regmap_ranges),
-	.max_register = 1 * 128,
+	.max_register = 0xffff,
 };
 
 static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)

-- 
2.49.0

