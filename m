Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15278F58;
	Sat,  5 Apr 2025 00:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812000; cv=none; b=QHYpVwMtNBN3YakNGdqYUxCyn1cGmZwAHZnY1On/ACW1c16c7iUrk+3zZcDT60mqc6rLJw3vNIK2RGjfMtWABA/zCjOlt2KM/7Snn7gUqIyTb9FD121zqF4tO7wSb1JjTywhgXs+f5rMco/H+osrK8WJSTYsrgEAqzgvQjAhTDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812000; c=relaxed/simple;
	bh=/3vhqRp+rjiPGHeGrM8yyAU6vaDCJHkfWLO5hwwE4hA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccuhmYSuGbf2Q1McZKqgv7Tulws50AqFBi96rwuOLOnxha0jYh6DNQMzwrBO0uzfmNhG/utPUN8wOYDwi4ar6ckdRQLuhPyHFT7MayH7XiFnEr+T6r4RIuz9dwQiBS/5uSZBsvKpV06ZmDYoWLDAitnbzdqJ0gjdygjO/3FeGmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3LAgW9Z; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3LAgW9Z"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3032aa1b764so2002044a91.1;
        Fri, 04 Apr 2025 17:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743811998; x=1744416798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+61GEBl1ZKDXz7eqvknnogiq5/rNWdXiMpBWTCFhnU=;
        b=Q3LAgW9Zhu1hUEWdZatjSUfWkVatMc4os8Gz7vJgK3YnFgn0QXuNMeVdglaLcwe2Wf
         7akAzIpxMAW76cV/GZ1lnNQHLBYfEUjD1BrA//ZZuECLsD6xqWBQEZxIZhTRTGh/DpA0
         bJHqxzEARnGZx33ki8CwTfhAx0IvmG2Q5I6T1WMC7dd0rC7xRYJqdDgiYFwOdTwrF5Ft
         Snr1MyTktVDwiKef+NG+R/Y6f32Ihjerpbus/MS0tIEt1RklgUJmDB4e2Zg8ZNDL9KZw
         ldfW4nGMHBpsnZrVVoLFuW80VElug1DcV17xIpg4pWITq0o60NfzPt6G2ZNlMzYXu2du
         8qsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743811998; x=1744416798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+61GEBl1ZKDXz7eqvknnogiq5/rNWdXiMpBWTCFhnU=;
        b=WTSY7vEPnmzX8fWFFPCfmcNx64TkAAyflsbLIW7nClk6YojF2on/IIhkiVWJ6tI7HE
         c9+tz51EJCgY8txzJwdOkWc/7GOl5K9LD4tisNEXPglHCKCAfoSXccfwVEhoy87BB4Yw
         wJ8keUykhuGYREcejM1qKRLuY8OxYIFmQ59ADU/T06rxk5sHC+OOLkOz79kZq3gB2YN1
         kORRpZhoxnLmhvYFfxDqxbOBWub9ludVZCk7RQlbjtZX2nwGQgXLOLFgJZqVm8RMZmht
         0Bs+mWoSyOgkCGysF5zLy8pdAfGxcYkM48HAMf/g/a47otGZY2CmYZYYlERil5Y5nk+U
         ZeuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnstqbe56aCjWwJnsqICqrI4M2FECUJd362YHqPywrvdKECcoIDMudgH/1s2GnTfocNXfvf6SCuuaU@vger.kernel.org, AJvYcCVQvzFNsLeEw1SUk3U0ugbj6yOChsx1oZ3SwPjjSpDi5LVu6HUU/RKC8UW9CxHS3ZSYNMlQxFLcCZiISRks@vger.kernel.org, AJvYcCWp38ORoxbu1WD17tN77b1kBGZruxZj3otzi8B1eNa+St4oHXXU3j2iGhdE0PyOcWdHiugPSadU0Ih8ZGs=@vger.kernel.org, AJvYcCWviTKcIHE+8AlMETmBJKEOW8DDlsB8K6z53Vy3mAL0IhkaSEGcar1Ouju2hvI+/49J9QlcEKjKrU3MVZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHXD2VHaLFEzHi158XW6G6W+UJQYLLaIh9O6EU6ahJz6YT2spz
	weo13U3zc2zrQZasj07mVxgeWpoeGXvJSnOIeSX2M0e6NOVT20J8VJtiRzry
X-Gm-Gg: ASbGnctnK7WYEWGBT935BgnaxW0rr+qFpthBoFYP8LbC/Bx6C2cSF697BWtsLnKMkyT
	f9IVGczm1VBY88IvF+Id71sqoXfyixE80wC1lfpRD8LCl1un3yMpzI4L8OyOnRUBdkqI0uqnN7F
	fumx+sphevyMkWz/Me7hbV8sXNpKC1feZvQDB7rMSw9z3QWlSc/3iR2hx4lotEUWqcB9mwqcVFi
	F1tSQr0yY5fvlrF3enVA8DKEj3g0d7raFD3ETqEaydYGeSCVrWRFmjE+vmQu7P99jwbIP/DMyy3
	9GMjyYhCnH9lpbNYR2b/k2Nwy+muVUbI5ovzPnCyS97P/qRCjBzHBONz6dieBtLvZ9VP9eWuZ/v
	v9CWiBunZIH/YoBe+YQ048MwgDro0QlvNbqcdAmo=
X-Google-Smtp-Source: AGHT+IFltsks+wmLZvFMiu/ddUG8l4Y0oDHlKEENo+2a90xv8YrDEZUOkh4gBHIkB/U1wYqoUFz3ow==
X-Received: by 2002:a17:90b:5444:b0:2ff:618c:a1e0 with SMTP id 98e67ed59e1d1-306a6240e97mr6131067a91.29.1743811997725;
        Fri, 04 Apr 2025 17:13:17 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:17 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:39 +1000
Subject: [PATCH v4 02/10] ASoC: tas2770: Support setting the PDM TX slot
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250405-apple-codec-changes-v4-2-d007e46ce4a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4896;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=EUPivI1e5lG/Ctwi0iED8gK1+8hCsJ53czJp1dml81s=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfSlvvqex/uSw8Xbwjhu20Vs5lr66SZV4fY7r+BT6qN
 DrDPm1xRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABNpKmdkWOwwaZoMU+XkI2X1
 QVNuH6778X6GxKNVX9Q3Gp7YK/bo8j9GhheZC2LO/V+1dO6pzVyRzQqLWvMSsl/8W+c9XShRKmB
 rORcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

We don't actually support configuring the PDM input right now. Rather,
this is useful as a hack.

On Apple Silicon machines, amps are split between two I2S buses which
are logically ANDed internally at the SoC. Odd and even slot groups are
driven by amps on either bus respectively. Since the signals are ANDed,
unused slot groups must be driven as zero to avoid corrupting the data
from the other side.

On most recent machines (TAS2764-based), this is accomplished using the
"SDOUT zero mask" feature of that chip. Unfortunately, TAS2770 does not
support this. It does support zeroing out *all* unused slots, which
works well for machines with a single amp per I2S bus. That is all,
except one.

The 13" M1 MacBook Pro is the only machine using TAS2770 and two amps
per I2S bus:

L Bus: SPK0I SPK0V Hi-Z  Hi-Z  SPK2I SPK2V Hi-Z  Hi-Z
R Bus: Hi-Z  Hi-Z  SPK1I SPK2V Hi-Z  Hi-Z  SPK3I SPK3V

To ensure uncorrupted data, we need to force all the Hi-Z periods to
zero. We cannot use the "force all zero" feature, as that would cause a
bus conflict between both amps. We can use the pull-down feature, but
that leaves a few bits of garbage on the trailing edge of the speaker
data, since the pull-down is weak.

This is where the PDM transmit feature comes in. With PDM grounded and
disabled (the default state), the PDM slot is transmitted as all zeroes.
We can use that to force a zero 16-bit slot after the voltage data for
each speaker, cleaning it up. Then the pull-down ensures the line stays
low for the subsequent slot:

L Bus: SPK0I SPK0V PDM0  PulDn SPK2I SPK2V PDM0  PulDn
R Bus: PDM0  PulDn SPK1I SPK2V PDM0  PulDn SPK3I SPK3V

Yes, this is a horrible hack, but it beats adding dummy slots that would
be visible to the userspace capture side. There may be some other way to
fix the logical AND behavior on the MCA side... that would make this
unnecessary.

("How does Apple deal with this"? - they don't, macOS does not use
IVSENSE on TAS2770 machines even though it's physically wired up,
but we want to do so on Linux.)

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 25 +++++++++++++++++++++++++
 sound/soc/codecs/tas2770.h |  6 ++++++
 2 files changed, 31 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 8de7e94d4ba478aa9b705a81e7276bd005c8a18e..55e4723044044338bd941763240d24ccfef6e8f3 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -240,6 +240,19 @@ static int tas2770_set_ivsense_transmit(struct tas2770_priv *tas2770,
 	return 0;
 }
 
+static int tas2770_set_pdm_transmit(struct tas2770_priv *tas2770, int slot)
+{
+	struct snd_soc_component *component = tas2770->component;
+	int ret;
+
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG7,
+					    TAS2770_TDM_CFG_REG7_PDM_MASK |
+					    TAS2770_TDM_CFG_REG7_50_MASK,
+					    TAS2770_TDM_CFG_REG7_PDM_ENABLE |
+					    slot);
+	return ret;
+}
+
 static int tas2770_set_bitwidth(struct tas2770_priv *tas2770, int bitwidth)
 {
 	int ret;
@@ -543,6 +556,13 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
+	if (tas2770->pdm_slot != -1) {
+		ret = tas2770_set_pdm_transmit(tas2770, tas2770->pdm_slot);
+
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -682,6 +702,11 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 		tas2770->v_sense_slot = -1;
 	}
 
+	rc = fwnode_property_read_u32(dev->fwnode, "ti,pdm-slot-no",
+				      &tas2770->pdm_slot);
+	if (rc)
+		tas2770->pdm_slot = -1;
+
 	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(tas2770->sdz_gpio)) {
 		if (PTR_ERR(tas2770->sdz_gpio) == -EPROBE_DEFER)
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index f75f40781ab136cccbe1c272f7129ddd3e4a22a3..3fd2e7003c50b6a4bae2d86681e9219b5a244a11 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -77,6 +77,11 @@
 #define TAS2770_TDM_CFG_REG6_ISNS_MASK  BIT(6)
 #define TAS2770_TDM_CFG_REG6_ISNS_ENABLE  BIT(6)
 #define TAS2770_TDM_CFG_REG6_50_MASK  GENMASK(5, 0)
+    /* TDM Configuration Reg10 */
+#define TAS2770_TDM_CFG_REG7  TAS2770_REG(0X0, 0x11)
+#define TAS2770_TDM_CFG_REG7_PDM_MASK  BIT(6)
+#define TAS2770_TDM_CFG_REG7_PDM_ENABLE  BIT(6)
+#define TAS2770_TDM_CFG_REG7_50_MASK	GENMASK(5, 0)
     /* Brown Out Prevention Reg0 */
 #define TAS2770_BO_PRV_REG0  TAS2770_REG(0X0, 0x1B)
     /* Interrupt MASK Reg0 */
@@ -138,6 +143,7 @@ struct tas2770_priv {
 	struct device *dev;
 	int v_sense_slot;
 	int i_sense_slot;
+	int pdm_slot;
 	bool dac_powered;
 	bool unmuted;
 };

-- 
2.49.0

