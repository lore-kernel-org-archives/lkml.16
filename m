Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B77F1C8625;
	Sat,  5 Apr 2025 23:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894955; cv=none; b=e+h2vh3rlsn6lOCieak/Q0mMAB33Iq1IYfKWCVonURY/6NWo647Qk2Ly23CcoRW0Piiyb1nrNRBj05AWNX8oltMNckf6SJVX1AmKEhscVI7lF6G9IFFBmcLn0uwdchI4KBKtykos+Ge3XGNEf0SODsefR6RfBGYOHJYuS1cCCHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894955; c=relaxed/simple;
	bh=TCm6ICnn4hWfWQL4sbSAXGwOU0wyVtdYiBPxab6jEBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h41Kg+C3ORceul7FwgmmVvmdOZUE80APxHbaSw0eomJUuI7x6hmDybozK5JHUve0E8NlDUQl51Bsirda8wt2AgQhcMzArS4xLrnOdxc7ZOHwyB+vTo8sawzzVjRmGXvsylqyOeaVEb1lm+UqzlQPcHPac7rES/l4vxUxWSqOCwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abjYjqr4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abjYjqr4"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22438c356c8so31207995ad.1;
        Sat, 05 Apr 2025 16:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743894953; x=1744499753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oK2/ZeW8ANllKk46FkJuUv+WaiUUGbjs5ATKiMs/AJs=;
        b=abjYjqr4+qv+ux8BTd8RTK9zbmj3Yp2dUdyx6RdYaAL3672CjDjBbt6pELim/OZ9GK
         H9SduanlkdKdtlj/8DVBkX5aVyAOcWF9YsZx7jYwIM7bnXUvSWfSXwY3tT3tsQFm0BIy
         /P7EMo/g4Of0z2NFKGEZkiE+/JuUcRqz6RWkMzzcsqtMc/UIyYZ9PBxzjEIBEGljYR2X
         G8iB89gEWq5ALth1ldQecl0Grz+wijNwaxuz1bsIQiIZFfVudfTxGMd5JdCdva/GPUJZ
         kXgmKiG/5HqcsKmlawxE1NDgrKtp5iQvDKxh6jy/yps7OsfG7rEP2itA4iEeKsChyCOf
         lXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743894953; x=1744499753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK2/ZeW8ANllKk46FkJuUv+WaiUUGbjs5ATKiMs/AJs=;
        b=S+wkUkk3zRSux+g0yENYfcZdsN5PBjrIndC/Wstdct4Q7wCZRaoyHzqEpbEo7h95FM
         DJOnJUwXxFsgcYwWwhEijm5ptm0efzdSlBLaciirXOSKUlFEFIKn6FO1M4IzxD6jsWAW
         tEPMWpHPmXGEBITGkBmEKuITpi0QSCyRu0XmNW79GwsSEKP/+u/4+OzNedmdjb28Nhcp
         y/UoQqSdiS1Df1sOJobkp3o+uqjyhbz/awZxoS7pzyqW0RESD+l2daTfGJ9wqCrv7R5Y
         j1jjMkcsWykTteNq9HjvdsnJ+cV6zfJRq76erw8HgQ7fiXPerc4ukhXOGEVtoDmgktNJ
         627A==
X-Forwarded-Encrypted: i=1; AJvYcCUFW2DYjBIOLlMvZ457mykpEP8TKCzOukLP2JHnn9cJLhEyR03KPu73mfLeP92Inb7P9YKL/tdEclUYa9c=@vger.kernel.org, AJvYcCUjPQLuKhvKHgUDR0kPPZneaAJow8Eoy82Z3JMO59Kslhnu7R/Ehwp9BQJkqSMALUnJntsFxpKcKNdu@vger.kernel.org, AJvYcCXJMhTPkyuR5ivFEsb1xvSjZxoryBJ8A+SD6YgzAW8gf4kxZhZhRlkTII5wNO0rG/K8eMkoBuBjliIRw2Ij@vger.kernel.org, AJvYcCXQ/pov/UYItt/HmvAvsbUmFqmYXeFtwY29WHji6IFh3q88XrQ/h1hNcsrmKSlxD1gP8T+8R/YVicjkQ2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU9fbjpOfO0u3+6fypeFzlIYsu1+YaVB8IO8zTxV/xzvnNUBQ3
	tcXg5pwWCIsKqJczDFXnCFkleL+EhHtX7ZaIwDFUlbeC8OmuHYfw
X-Gm-Gg: ASbGncupsRrK8RF20ck3CnX2KZNsVtcEFOX+14+7UmULYMIN63PkjwnYf2X33Lqk6tx
	HX7rg+DYENEqw+E/1dr0xHp240tFmFHPteTY34KqOAmVsbxboI4uIaGsLV+1Dsy1jcX6kqK6Hac
	n7STDYWdXaJrFDbodV3+NJ2Chh78Ni5r9UcEZwNHd4qag15n75hHNTZZIvM+kR24CY9UXVXvRW8
	GL9EhEXOFmCYZ0nmuoesG15Neb6SDMvL0CCqtAfcwA/5C80LS34D79k+d93vP7yU5GFVn7WuYtN
	SV9m1IHqeuHrSO/uS83F8pGdQF2JaEz8p4CABQyVAVTZY17y7C0Dn4NdjmIOG7ENAFcCQTijmxD
	tzQ/D6m8HhxlL0mx0v8jE3iV/PdF4h9mRciYAVN8=
X-Google-Smtp-Source: AGHT+IGRLt/UgytCUZ6RX0b6+stfUBPUHZ9HiQpm2F23F9DZ8bIT2TMqzECkL+Le43z/TyHUlcvc4Q==
X-Received: by 2002:a17:902:d591:b0:227:ac2a:1dd6 with SMTP id d9443c01a7336-22a8a87a6c3mr128550555ad.24.1743894953445;
        Sat, 05 Apr 2025 16:15:53 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c994esm55048345ad.102.2025.04.05.16.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 16:15:53 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 06 Apr 2025 09:15:07 +1000
Subject: [PATCH v5 3/8] ASoC: tas2764: Reinit cache on part reset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250406-apple-codec-changes-v5-3-50a00ec850a3@gmail.com>
References: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
In-Reply-To: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
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
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfd3ZGaMRzKhobM5hK2/K/OhG9R4XnhOwW3x17nTqT1
 F6mxDt1lLIwiHExyIopsmxoEvKYbcR2s1+kci/MHFYmkCEMXJwCMJHfDYwM7163amy8WcL7vaZ/
 4QFb2/3vI37NYr33/dyZsGhL2YTCXYwMs6VtfI/fvqHIZnlaRLOm6ojuoXDtS3Ghss9nTg0sfab
 AAwA=
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

