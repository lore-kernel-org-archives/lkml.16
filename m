Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F51A2541;
	Sat,  5 Apr 2025 23:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894940; cv=none; b=QJIvkxii0mXXPSGYQsEzccnkrasKODk554iv3Uk84GXEXdRWWqGDPDixDJ5tHnKaNwwJFyAlcrv/Hgb57Luy81fvtbV66YMw4CE1+/stL3crkkqGS3d1HcDuQ/KIknavK0GOurjG3dRHd41vHfdLhz1eCb9Myx6En/NzIkRnDMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894940; c=relaxed/simple;
	bh=HqJUvE3cm056/al8IELSKt4YG1QY6I7o2vDGy5tCaZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhDkUukTZXqiPNrjFLG/kqOTx8rBymJp89tyCaIV193NsELXpBri/RlP3Kgu3rnt5cz1gy9UaY4BpkEVacAohC3oL2uCBIAHuQ1a3A6Yd3tvQ/xhEqwSc/VQgy83sNn7OqQ5xeWkYpeS2hxVk+difom3/ci0ECw3tmcgT7/C2aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeNe683I; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeNe683I"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227aaa82fafso27108195ad.2;
        Sat, 05 Apr 2025 16:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743894938; x=1744499738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zT7z/HktyzmUzeS1R/jDHnCVkQulwygo5o6mh5iuzs=;
        b=SeNe683IHdxrYkSQwUNW8+MQA9S6LhlRi/ctCvxhnADqaN3KzGte9PEwgeOYvi1RQ1
         Y4QzBkAPxRLpgIfihoibFAuJm5lxeo1jgF4HmJuDYE/3cUGKAcWqy8I3z9egZyer+0Bj
         IKBXylWOureMdVA8H4th7nDpxnkFGoqBxcBE+mxfNV1d2m465EJwvFE+cKQa+ilNLfRj
         Ny94q3w3nmo+XKbbaMAx33Nj7i7n0hJF3tU//hsrvjCWXGCM5fKxMNkCNmToj5gzfG1e
         atOWnsEs+hC4QTDHB3hQsf75ypzek5AMmHzymypMJpGFbRpm+T5okyWpbQqu48WnH0+k
         s46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743894938; x=1744499738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zT7z/HktyzmUzeS1R/jDHnCVkQulwygo5o6mh5iuzs=;
        b=YWYiQWo7mcG+ZHMEHwK8q9bdPX2+L8RdmCyyb8LbUjplLECJPL29ykQCRzX6r0ZgeD
         OYy9b5nkPh3nQDuafc2ghSxXEIWc1ghJxvw+TvD+Tiuv25k8Ecdaj1lZM1IYtwBKlnp9
         yclPNeTnk/1sgNBYpVw8BgFniQi99Nk8FWJRLFeo8eppDLOrg6u3Qq+OBmEmdw4zJ5AG
         iayNRwGr1wLv7Mg8PruHgWFblce7+FfgSjp1sORhqihfStWaRX1p17KMnZfZRGmpIf8z
         JG5+/eC4xE+M+gzcUy0X3jORvwSm2CxxiDVxzuPYDOoFnwa9OGDfQd7FHbXO2VBulY21
         Vfug==
X-Forwarded-Encrypted: i=1; AJvYcCUFGLjXPjCdZmrdzHxKZH2XfnHlF4R700jCFeYYdV00NDKeaVkwggFbPl4VLQBC3FOjWnIh73xesoWB@vger.kernel.org, AJvYcCUtfwctNHlWM75zaqNh+D20qJFyNqnSAzbYWA2VB8GIo5mfz1XeoI5BVJNZT+5qC1gGmBjVS33a+n8Fm4c=@vger.kernel.org, AJvYcCV4MYg9T1ScRDJ+2FQ6WIlAekDRkH+i6THtX+IcSXoiWLNt6REmLczm+8UEcI9e7CcITeze+UTCS9cOBuA=@vger.kernel.org, AJvYcCX6jJA9FhnODUUv4eHFesY7Ei7q93/QVYTg/aieYEDrf2jOz1wBlOxybla0daVFnXf5jDLkBzw4oDL25pyH@vger.kernel.org
X-Gm-Message-State: AOJu0YxoYrSarWNNhviiYs0BlvpckYEbzeM4MoEBF3Bxy4TaRAm8cbbe
	Le6jM8BuGIXhZvfvRqUInJa9BM80MzLI2HwXdgOS+MD7piC7pLki
X-Gm-Gg: ASbGncugiFKEojvbUY3FBeAQNf39KKjrb6VQpbegIIfU13MFCMl71bO6ahrT3WX9U3v
	DpjCk55YVT4hm1SP41cbs185a+0ky6pE3RZsFmbdfjK5P1orlA4XFmWTWaflidfI1pnMLk6HKKt
	qdp88ONUFKDIBSYGzM5G3DRTYdeRy36HrpZvSDfY3j5GiatAyzymTUTmyEr+ItK8S/WUmTUT49s
	w89ONbgcm91ijVwzFsNfigSXMEaRCavAvMlbLgH+67rmC1brk8IHtMlLL7JC7qZ52FCoRlish+x
	HYZWH2mF92qhPCAOleqhWx4vOnuKMm7vi+hmPwSNh8e8Hp/XhqUzYMW+8Ap1JcL8XdrHGSZZrfz
	EtJbfIew4fL1S9XAQKTH9RkJg4Xa4TaueUlmFsAo=
X-Google-Smtp-Source: AGHT+IGRchoS/CucZE1tgNu5aAkMlUokbSk42txl/eCkLWISpt+NHELUlUL8kUdOf6jUGAiNHPSQzQ==
X-Received: by 2002:a17:902:d4c4:b0:226:4764:1963 with SMTP id d9443c01a7336-22a8a1d6f93mr108621555ad.51.1743894937944;
        Sat, 05 Apr 2025 16:15:37 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c994esm55048345ad.102.2025.04.05.16.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 16:15:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 06 Apr 2025 09:15:05 +1000
Subject: [PATCH v5 1/8] ASoC: tas2770: Power cycle amp on ISENSE/VSENSE
 change
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-apple-codec-changes-v5-1-50a00ec850a3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=PCUEqTWLJugE/p5yI6mH/FN1rmh28HR0YZQdpuB+rAk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfd3b2a/nYCfT0nL4YrvFb7HqT7zcR00neorqzFc8c+
 Si8neFwRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABNp4WBkuFtR9ji/W7hnX/7N
 4rzy4K4L/d/NHNgW5RjWfD4hZVVQxchwOMtVzKTE+DmbivP2w5NW21VeLf7y8/zmCSv2+L+Yzaf
 HDgA=
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

