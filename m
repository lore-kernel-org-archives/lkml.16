Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D2C4A07;
	Sat,  5 Apr 2025 00:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743811992; cv=none; b=Gw7WUkWpWS/nvLIzNcUSLkjZ4nyyOBnvPw+bcW50ofNaaUbxb3+Aq5t2N8zySc1tUjuZqe/jlbxjxihqJAoQzIf9cS5Pb/K05rjTwaqqSwZP99872mvEmo/UGJH/uzy3x8fCRoYt5yCi40MGKsB6WdN/l97qd+h9dyHsHXU0CO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743811992; c=relaxed/simple;
	bh=HqJUvE3cm056/al8IELSKt4YG1QY6I7o2vDGy5tCaZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oaUB6P7JM67lISpNYesHsrDm4UE/gVrB7dnY6XSl/iMnoN5mntzLKsZ3nDi9CIFo0ecJUB8/6IyGO+YlMJ1dBdtZVQbgpf1s+53eymjL9iTOhVRJRzUv7PZrZU9MRbko8o2IQcXcFrJodsEH63ZQ8RnVbNfDp/SUvc8DEftqEfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+XlboHx; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+XlboHx"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af59512c64fso1723262a12.0;
        Fri, 04 Apr 2025 17:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743811990; x=1744416790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zT7z/HktyzmUzeS1R/jDHnCVkQulwygo5o6mh5iuzs=;
        b=k+XlboHxGUl6dyZQxSW3RLwMAeIWg9izULx8qNSIPCD7AbnzTDtx5Ie2Mwkc3CMklG
         xb4phic4X7U4ljRZ+bmuOmqUz1W+fyNFEn3gsvrOnOTVv6tC2NKf0mVUW39cnEII5IlS
         IN8Zpfgs1PC7JzcVpmFpUd5P43yfnbSVr/QGOYx8ykLwxUHRGqSmIhIhurx5gl1jSkuT
         PWK70dMrL9VyWWGkFEZ8sX+7drJCAbnAVDUXWKdK2wx96P+XyTdZKiic4rGRx7yE6dyt
         T610Y5PhR3y7DG0nlWLMHxFqmbZh4P3yMenGZmna5g+6CvgbR6N+DNrnnukvBJ1b4e/v
         Ivog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743811990; x=1744416790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zT7z/HktyzmUzeS1R/jDHnCVkQulwygo5o6mh5iuzs=;
        b=PwuhgOkNzecUARRgRTQOgfSskkmMO54C3ZGxjStI0/BGCUQS9qaUIGpWwp8Q46lfJ+
         b6wAuaWZphSz5zwnbx5HGlflw7oEVk+RXekgCUc2LnT3Qx/kzwckZ8N0Z3pZvbI2jyye
         UttgEgmX1VM4+DivWqI9N6CDWkmqZ7L8nLUVUKUxI4fCSBh28fUXTn3Wrrtb+YnfLzKf
         vgZlO+CuOK4D22ZJBZ58fnKVVQJWBNu6mqGN9iz7Pix8EonMUTn7jNyrCskl5wRQxfr1
         XmENYkbP8wR+BsO1PPsIpN2o9U0FvjH+XjDHFaMiTBAfqPSRx4bVCXeOnfjBtuUzZbhQ
         f7sA==
X-Forwarded-Encrypted: i=1; AJvYcCWuUEDB8ctu9tNc5KA71hXUOm/8ziBMXqa0fkJWX16ZoWRiMhXgyxv+SVxS3sFwEUIx8yzvgk9Q0+CNaUc=@vger.kernel.org, AJvYcCXAloMtK/cmwdeYukL31n2g92ujevCu+CKwABesRKWtIODJDsRBELSNGZAIZFDS2DSrMiJICdbI9QxN@vger.kernel.org, AJvYcCXaLmpFkwF5AlRjVY97wDfgeattodk3YRsZaQdFd2c2M93jIZgxjRghlAQo3xJGJI14HI3mEhB3+271NjM=@vger.kernel.org, AJvYcCXprewg5IK038FX8Q+Zai5tneaCMXLPGqlFOr6fArtCvKg9qdsJWkg9Wy7N6DdaK8sUYqqnoXKgNzNrUFpj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw6CW0SX0MkfYSUNGSifvT7IR4JVd08AjnjkqWSiwYUHIvwH4Y
	ZgIycYicIw+MHmsO6BmVSlEf/ssOkMn1lQFaQrPqVglu1/fBCJe7We4+m3Oi
X-Gm-Gg: ASbGncuytKxD0JIdwmf6RDyzSc+fGG/mQNrTIj0tmvRaJUD3WVoHMhux6hrE4d/0T2n
	wP469YS6D7dUR+DKcP2VAhpM/AvYlSE/aJZOlmO+wXvq/UBLXZ8P8wy64CrHQzhwfxFGAT6ufw6
	URTak7PQNqBHwDM+CTK3DfiAS1Te9LM1KHPYtHfzE9HSwartP5xI1+ti13CN2754iqaK+XMMC21
	6Ofjh6kmPfsEO+QnQHcz/OAmRNby9B5zPB9q9eQAo5Qs/vuBAUsafFQTZK91q1B/6DbKyKo8ZrT
	zPlcmvJ6XBjosD0VYHY09cWsdEJH/SjKPJYaGXZCD7ym9zC/ugj/Sdo/RIn1h0tQqv5HmLzi4WW
	EkAJLmETSETVCGUsKdNJI/JrPAkyRuQgfj4E2FlE=
X-Google-Smtp-Source: AGHT+IEE6zMQfkLbaLC/4MKZv/t32LHEsVuSD90Q/qkTOICJcvUwFUepDytIfdM3lbOQRnFcDxo4gQ==
X-Received: by 2002:a17:90b:5483:b0:2ff:5714:6a with SMTP id 98e67ed59e1d1-306a48a55ebmr6682090a91.19.1743811990086;
        Fri, 04 Apr 2025 17:13:10 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:38 +1000
Subject: [PATCH v4 01/10] ASoC: tas2770: Power cycle amp on ISENSE/VSENSE
 change
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250405-apple-codec-changes-v4-1-d007e46ce4a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=PCUEqTWLJugE/p5yI6mH/FN1rmh28HR0YZQdpuB+rAk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfSltfxbhZdmd8el3MvnOKefLybdONJO+ud5bY0tfI6
 njk9ZHfHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEykVZ/hf0q/3+z3d8yU9dMZ
 bGZt6a2bcN7vY799wwWz2NjX8SHb0xn+VzOe7vigmBd6a/fdjyIThIvbeETfXZhz5XOtGhPzyd+
 SDAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

The ISENSE/VSENSE blocks are only powered up when the amplifier
transitions from shutdown to active. This means that if those controls
are flipped on while the amplifier is already playing back audio, they
will have no effect.

Fix this by forcing a power cycle around transitions in those controls.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 30 +++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 7f219df8be7046912bf3ef452f75c17b5118bcf6..8de7e94d4ba478aa9b705a81e7276bd005c8a18e 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -156,11 +156,37 @@ static const struct snd_kcontrol_new isense_switch =
 static const struct snd_kcontrol_new vsense_switch =
 	SOC_DAPM_SINGLE("Switch", TAS2770_PWR_CTRL, 2, 1, 1);
 
+static int sense_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
+
+	/*
+	 * Powering up ISENSE/VSENSE requires a trip through the shutdown state.
+	 * Do that here to ensure that our changes are applied properly, otherwise
+	 * we might end up with non-functional IVSENSE if playback started earlier,
+	 * which would break software speaker protection.
+	 */
+	switch (event) {
+	case SND_SOC_DAPM_PRE_REG:
+		return snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+						    TAS2770_PWR_CTRL_MASK,
+						    TAS2770_PWR_CTRL_SHUTDOWN);
+	case SND_SOC_DAPM_POST_REG:
+		return tas2770_update_pwr_ctrl(tas2770);
+	default:
+		return 0;
+	}
+}
+
 static const struct snd_soc_dapm_widget tas2770_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2770_asi1_mux),
-	SND_SOC_DAPM_SWITCH("ISENSE", TAS2770_PWR_CTRL, 3, 1, &isense_switch),
-	SND_SOC_DAPM_SWITCH("VSENSE", TAS2770_PWR_CTRL, 2, 1, &vsense_switch),
+	SND_SOC_DAPM_SWITCH_E("ISENSE", TAS2770_PWR_CTRL, 3, 1, &isense_switch,
+		sense_event, SND_SOC_DAPM_PRE_REG | SND_SOC_DAPM_POST_REG),
+	SND_SOC_DAPM_SWITCH_E("VSENSE", TAS2770_PWR_CTRL, 2, 1, &vsense_switch,
+		sense_event, SND_SOC_DAPM_PRE_REG | SND_SOC_DAPM_POST_REG),
 	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2770_dac_event,
 			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_OUTPUT("OUT"),

-- 
2.49.0

