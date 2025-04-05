Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1362D1805B;
	Sat,  5 Apr 2025 00:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812015; cv=none; b=slgQ5Xsz/bl3CJCPkxoEeSfCZHHBnnkCIxTb/RalN3EFE3PiWb5881roo1XFRQrXsGJhRQpxPCksYjfGSw8wDmD5kS5mzO7eD3Y2Uf0BPi7wRV1dVrhZUYxyNSlbZpdrCyM5ng0cGr0T0a5phtaLR7jZNIE/cXCQilE2fC9nldc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812015; c=relaxed/simple;
	bh=TCm6ICnn4hWfWQL4sbSAXGwOU0wyVtdYiBPxab6jEBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRwoUQQgMlQ1TbTArkYQTLdhA+InFRsgYm2BgTQ7qme39RSh2WuKaj4QLySykc+AP5Rupn5iCWFlKEQZ/ozneGQ/XBn1/EgSTSyIq7RNPdOTyE0x1/PSe5o4P7MuPw2z7/ulNqk/WINJoql7DKdJMOUi31cPRKkPgkBYVG2ypJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YelTFI5y; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YelTFI5y"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30185d00446so2154962a91.0;
        Fri, 04 Apr 2025 17:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812013; x=1744416813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oK2/ZeW8ANllKk46FkJuUv+WaiUUGbjs5ATKiMs/AJs=;
        b=YelTFI5yDVSE3vgsKubQ8AHIyf5tXyE1HOZ+mp2huOpImnP29Psioi47naEEXZg7z/
         pRTbyqcG+SHbLT7L9tXP5CwnIoeDB/F41Vyo/+VJXk6EzNW+6SgoN/iVNrYVxo4OVjBC
         UEGNRgvDjy4MsO7ThDODHcI1xQbR+5rpQYT8rPKz9cRrkEXDGqO4+CCmfc5ZGSqm8AZD
         614fmJNqMl44yetCI9tNFvkbK4G9DzLsE5hw6j7SG9usXfljeDS5e2bCoVSXgODvXXWp
         qpdtcukv+b8bIw3vbJ07ZghaTnKGUxLZFhAOb9qd/lxgdhhw5rdFR6lp04W9K0Bz/JYg
         M7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812013; x=1744416813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK2/ZeW8ANllKk46FkJuUv+WaiUUGbjs5ATKiMs/AJs=;
        b=F3nQpYXlxBQNOttF2YJ86esK5dFvPJDfKPRKrFOwHyi/QvKukUJ0rGSH9fDR6XlUfk
         NQyy2FxlPBGKta2lSqkVwSYWDvbXRv7+g26mRkAGdEajVzqP+3pFhkFSFK+AbRTzZ16l
         hb010yvlcqd5lSdX4k2qbSYCwvJsVkFqpSgnidZ6YPjsrb/WKBk+QrEu0KbRtDWghJXS
         eqCd5KALn+kUiGjxG4dJOWW40asc8VklZ48vcCxETjszwIkf/AUwLJTuu06lZqrLZMKv
         2xjI9jauyoTZxFe/CFKFxOpheo47MURV7Qe3VfEnlVzQVSgSUHV6kHjybZfNjeKV7Ge/
         /AXA==
X-Forwarded-Encrypted: i=1; AJvYcCU0ZDC3AdtkRERKWUWEaHHk46pArY9J0pQ3djWw4Vn6v5JNTEGCfP3AxDw53huOg0b/t+lIUKQzri6x/2+J@vger.kernel.org, AJvYcCUAAoZeIh11GMDChSXFqlVnhILlotLT5m7G8JZlaYhoAi4H8HULEYHsQSR0TPZUrbq+HH4D6Sn5pkEUKK0=@vger.kernel.org, AJvYcCUazP16YX259bjXxyrFDrGn55N+Z8GSDeagRrG00c2EWT2Dj14JPpYRN45dG6Ut3yNiJZEtrUVK/wt8@vger.kernel.org, AJvYcCUdKrlsDIjDAvXN4f/ZeEBc3OjoLjTYSRZGy1MpoiVFyMpMzEJacEXgNI9UTWKEX7D+QivRloaZ7MaEU5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5jlIHCQkdJShxtmN/+sYL21jkWyF0yUneglZS00ccxmgLmzxr
	lyCajoDk4Rj+tNN6h/O/yHup1LmoA2hQVHdKRogXnAUK6hf8dvwARLCWkCS5
X-Gm-Gg: ASbGncspkjGxX5EGVpLhgwlRuwezVEXVYyjxFw0eQ+SFJuAG+xZ/pTvKUiAyD6cAH6i
	TCws+psoYSEQD4uE0RBX3IDh66eCVam9O3+pIwT/7HS0F/j7OTOLFRKMWLLtsqfsA3vkh7M2jiy
	AEWmPwcXKwCGqcj9jLO+7hNcYlBDGqsN9jcfDJt8HbmYTDmdYlWj5pbRqSXlMga4Q+rImUxCIt8
	ee9ity0hVj5bQeYIKqW0S1Ins30KNF0cMe1WFLhtQ06Re6n0UsSX1k8k11Hd+Gr1z+Bz7Xlj5rN
	u49EeN3nHQh+hyaBDmJnyiUWXf1+D5pVftT8Mrkhcp9Mzl0yRAcgpr62xMZhV+LaBkVDT0dNOdM
	rDbkAVDBtEZlSJmbyP8SSiy44W8+EEdAcEeJFENg=
X-Google-Smtp-Source: AGHT+IESpLtNEq3Uo0UPWYlpNC6z8O+/rayp2Dz2+/rLbWE5vL9qfAGTlln4qpWuZ05eUr6DDThW/A==
X-Received: by 2002:a17:90b:5247:b0:2ff:556f:bf9 with SMTP id 98e67ed59e1d1-306a4e62893mr6812003a91.4.1743812013150;
        Fri, 04 Apr 2025 17:13:33 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:32 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:41 +1000
Subject: [PATCH v4 04/10] ASoC: tas2764: Reinit cache on part reset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250405-apple-codec-changes-v4-4-d007e46ce4a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9m3wSRyoGMFtfeJA0LTHIxypfZ4C2ZJU7xKp8v385vM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfSlunHLiqe0tZtlf++z4dFyFFnnON54u4Tu46KK29k
 Ckj7UJARykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABORFGf47/pozQkH4du7NTkF
 fk/336u33anQenHZ8Tf5v3TYVRJzFjL89/h+rv9VNfPMlOUsDLo3T0qqlmcJrGrWffZ0+9HMKwG
 /+QA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

When the part is reset in component_probe, do not forget to reinit the
regcache, otherwise the cache can get out of sync with the part's
actual state. This fix is similar to commit 0a0342ede303
("ASoC: tas2770: Reinit regcache on reset") which concerned the
tas2770 driver.

Fixes: 827ed8a0fa50 ("ASoC: tas2764: Add the driver for the TAS2764")
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 08aa7ee34256896915f3ed6438b8b8827ce240c7..49b73b74b2d9dd6d09747cabc2b00519c549775d 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -546,6 +546,8 @@ static uint8_t sn012776_bop_presets[] = {
 	0x06, 0x3e, 0x37, 0x30, 0xff, 0xe6
 };
 
+static const struct regmap_config tas2764_i2c_regmap;
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
@@ -559,6 +561,7 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	}
 
 	tas2764_reset(tas2764);
+	regmap_reinit_cache(tas2764->regmap, &tas2764_i2c_regmap);
 
 	if (tas2764->irq) {
 		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0xff);

-- 
2.49.0

