Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C188C283FD5
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434226; cv=none; b=TtFhi3Lt9gmj87sbaZKlojzUtl2JXsqJE1Xp7kboTo3TDcm0AqDs0dON/zwHM7a3iAzRu52sj0bKZzNrqJo3CCDouVlfLq6sKOQPnK5jQQjW1y7+oA6N8iz1Y5ue70AGaZakliOl2CxDnV8A4Ax/wuAKfhoCGak/bzm6ptSPkA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434226; c=relaxed/simple;
	bh=pJEDr/qugQx4eH6wJYeHlFwWjJLN3bxQWo8T2Qnk3Dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfCYVkir2HrgPdj8C1XHv1nUvXvipS0+/mmP3XcPaj8RqxDJKMP3Mu0w8UwkrVPK42GZRpVJ3TKNY/IrGQiJC7+qs2VKk5oirdB/5ckr5nS5INMuNtzVCpf+0HEzCOkrqbW7DH5eX8p7m1T9dG3e+RDWEnmmJW4rnvTUHi+uVhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org; spf=fail smtp.mailfrom=openpixelsystems.org; dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b=DeUPSriI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b="DeUPSriI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so6669265e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1748434223; x=1749039023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bE1qAzhNE5HZd1ubRE3mU3j6Ns9DRAixhCjB1nZFWXI=;
        b=DeUPSriIJOVzWvIBDMp3jJxkQpqfK5OJDwtuDH1s4uzysEiB7J1RheUQcOzV0nyd3E
         oumGIS9sA3ihSiUxO3+hlYqkp1Y9a21NC2URNvo9ZFX52fFLzT2ew9UBKCmf68wBgJcv
         w5Dvf5ADvVvy1fOs7bV+X/TP43dhOKvoFCy3JvTc1pUAY7+joecz4lSum7cGheDnQ5vP
         frNYERAjbnlTqmudxEQNlSiLK+mFc1hd3c1SLe3i+GGntETz3czcUFJo5gtux1w8Y54j
         IUcS2+KHM9vHb9MGIme+qvIvE6wckINUUADZiNMmHYtI3vO5Pk8dlXewUx8LgjaxsC6y
         KkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434223; x=1749039023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bE1qAzhNE5HZd1ubRE3mU3j6Ns9DRAixhCjB1nZFWXI=;
        b=Zk65Ps5d0aln1uwm8Jj43KASGT+eoT67uUNeiFNqCOWQUG3Lxwyx2sv5rFXFq3E6dP
         4ZUGmZbi80war7eE9s3xwbXePqxsDx7M1fDvTceC+cM7Di0QvpvlpuLRyTp1sTg46uTZ
         7sa33j79dZ0c8MjUPiJppU4+wq68marPxSPJ7LxCv54RfjYxAG4GBP2sQeODggGRPHRE
         LfLH4zPHWcI0RS9AHpap6l/WPEj06qiWyrhx7RTSHYPoDbKdfsoXxwJGQ+gnyUTQMAvp
         pDoyQV6nd5SeZeydCblARR//7XdzdlzzlNwjSnB7FzgK9AreltTZOtJgPGCFwsk1vGEY
         z1rw==
X-Forwarded-Encrypted: i=1; AJvYcCWPdYXhn+TKMHhBJLxV/G/BhYEYqeN80eWkd5E3p93SRYXr7BgV1Nh6sFJgZDyJNJJMlHRkNEuR+BAhIRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgjPPePhUS7/5C5UUrzSb/cQeGkHCRA+lV8OcR2o2R2AHb7fd+
	sHwD8KV0waiO2yzpMtZgFz7qpFt7+jpd3GLKNn2p1dRTyPEeR4fINwVoLLJjGWbOFts=
X-Gm-Gg: ASbGncsZ6Iu4CRWJs6BGmrqAabVIqJrSZ/Umz6tRcf0Jy1fPORRFFfkR8aPUxsux3tj
	i0RXQqZ1uoTyLzABfpJxztZy3f3LgG0ohW5Qi34dAcJbDdm2n5Te5ulSbNouWpOGrzP0x32o/Mg
	LBkZzAnEnkT39LeamTvrMQDGEbqF/Q/b6F2zdesIkkOS4UxylrAq3Q5NN6r39gRdxRXMTKa7xaF
	L4WAlMTFtKCtej49YiLEHP5ZTCVBlBXB8nnPRstoXEEEumMCJEwA4HRyN8Ufaitn1PXApAWyP5X
	esT6v0z3FOXCv3xEmSoiP2eFzKduV476FXMvdvZuacEzfMLB9B1XScIRof6dMVdUR2r1Ix94mgA
	ye30wmD8mx11sctGWJM7umZK7XTz7qCYBmFwssWk3uEo=
X-Google-Smtp-Source: AGHT+IGcE3Yp8bAVOCVgnJKGkwATDVpB/cTdFinAHS7r+RAhvqsfHiBYYpvMiJ1biMvf0uyRn2ZFHw==
X-Received: by 2002:a05:600c:1d1f:b0:442:cd12:c68a with SMTP id 5b1f17b1804b1-44fd1a01f9fmr40280845e9.1.1748434222845;
        Wed, 28 May 2025 05:10:22 -0700 (PDT)
Received: from [10.0.12.41] (253.124-78-194.adsl-static.isp.belgacom.be. [194.78.124.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45006499727sm19874145e9.3.2025.05.28.05.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:10:22 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Date: Wed, 28 May 2025 14:10:08 +0200
Subject: [PATCH 1/2] ASoC: tas571x: add support for tas5753
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-asoc-tas5753-support-v1-1-a50c3f6734ee@openpixelsystems.org>
References: <20250528-asoc-tas5753-support-v1-0-a50c3f6734ee@openpixelsystems.org>
In-Reply-To: <20250528-asoc-tas5753-support-v1-0-a50c3f6734ee@openpixelsystems.org>
To: Kevin Cernekee <cernekee@chromium.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>, peter@korsgaard.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3260;
 i=bram.vlerick@openpixelsystems.org; h=from:subject:message-id;
 bh=pJEDr/qugQx4eH6wJYeHlFwWjJLN3bxQWo8T2Qnk3Dc=;
 b=owEBbQKS/ZANAwAIAblauka9BQbwAcsmYgBoNv0stC7BS5QfA4/R40SJ3UKg/Z0reSEOgJeqB
 J+6ZB/f4xyJAjMEAAEIAB0WIQQO7PtG7b77XLxuay25WrpGvQUG8AUCaDb9LAAKCRC5WrpGvQUG
 8Ee9EACwK7jyH73TEFUrymNw/Ov4xTcRHvis+2TDZ5LX2TUiQJZHIlckf96N5ILSDfvT8lB7Ros
 4uICNWMwg2iYVQSJulfHw53rXTzQN4ybvLPfIZAoqwtSexxXqhHFU4BPKyaROShrSEIWER2HDFX
 q6o+F2VQP0rFdBJ25nLHTjoZSZZuZf/bcI/QL+W/FOGJWH+35u8IL5doh8GY4+hpCXMvJ954vVN
 KUfljO6Jn5q4cMKlZur54YeXCBOuoVuUXvbQulKVfmhs/p8NZuQ7WsW+TQr6A+rw16V982tHIg+
 J8p6pAOS7Jb5ZMjdvEuhp1S8zNn/BDUmTo6CA09SgBU5EyX1QH59BuRGLn8XAM3TC2n6cvMTD8u
 6/3ZxHmN1aAqh2CRB2okmwKaVBKz3dJIKdxi3I8IAGi0xnA2FzB3FAh2t1o3S/KqTOG8rTy/qNF
 QP/3C6I1VdX5V1rLeT9BLx8E2YigJuFJ0owH1oC0M9BvKcFEcgV7SKpUuOVWJXjx7Qi+/c9UX5+
 eRGNXCvPLg7PHB51qZkgJyKfuJgo2g9inBLfx6bSSU58PZIGr/91yMuCc8LVXw/NyElb0uLPX5N
 HULdIxuRhLRg2e5Pm5B+EFtHicamWsQJvmuL08ZiXXxiC8notgPfRhqaYiSrdhcvX9LkyD+8VXF
 t83v6t03L1WtJAw==
X-Developer-Key: i=bram.vlerick@openpixelsystems.org; a=openpgp;
 fpr=0EECFB46EDBEFB5CBC6E6B2DB95ABA46BD0506F0

Add support for tas5753, device is similar to tas5733 but with added
headphone / line driver.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 sound/soc/codecs/tas571x.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 00b131294547812f1406056d17e6c42ddf92003f..b0b360aaf1202d3254d25215a5fa288e48410637 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -839,6 +839,56 @@ static const struct tas571x_chip tas5733_chip = {
 	.vol_reg_size                   = 2,
 };
 
+static const struct reg_default tas5753_reg_defaults[] = {
+	{TAS571X_CLK_CTRL_REG,		0x6c},
+	{TAS571X_DEV_ID_REG,		0x41},
+	{TAS571X_ERR_STATUS_REG,	0x00},
+	{TAS571X_SYS_CTRL_1_REG,	0xa0},
+	{TAS571X_SDI_REG,		0x05},
+	{TAS571X_SYS_CTRL_2_REG,	0x40},
+	{TAS571X_SOFT_MUTE_REG,		0x00},
+	{TAS571X_MVOL_REG,		0x03ff},
+	{TAS571X_CH1_VOL_REG,		0x00c0},
+	{TAS571X_CH2_VOL_REG,		0x00c0},
+	{TAS571X_CH3_VOL_REG,		0x00c0},
+	{TAS571X_VOL_CFG_REG,		0xf0},
+	{TAS571X_MODULATION_LIMIT_REG,	0x01},
+	{TAS571X_IC_DELAY_CH1_REG,	0xac},
+	{TAS571X_IC_DELAY_CH2_REG,	0x54},
+	{TAS571X_IC_DELAY_CH3_REG,	0xac},
+	{TAS571X_IC_DELAY_CH4_REG,	0x54},
+	{TAS571X_OSC_TRIM_REG,		0x82},
+	{TAS571X_BKND_ERR_REG,		0x57},
+	{TAS571X_INPUT_MUX_REG,		0x00017772},
+	{TAS571X_PWM_MUX_REG,		0x01021345},
+	{TAS5717_CH1_RIGHT_CH_MIX_REG,	0x00},
+	{TAS5717_CH1_LEFT_CH_MIX_REG,	0x800000},
+	{TAS5717_CH2_LEFT_CH_MIX_REG,	0x00},
+	{TAS5717_CH2_RIGHT_CH_MIX_REG,	0x800000},
+};
+
+static const struct regmap_config tas5753_regmap_config = {
+	.reg_bits			= 8,
+	.val_bits			= 32,
+	.max_register			= 0xff,
+	.reg_read			= tas571x_reg_read,
+	.reg_write			= tas571x_reg_write,
+	.reg_defaults			= tas5753_reg_defaults,
+	.num_reg_defaults		= ARRAY_SIZE(tas5753_reg_defaults),
+	.cache_type			= REGCACHE_RBTREE,
+	.wr_table			= &tas571x_write_regs,
+	.volatile_table			= &tas571x_volatile_regs,
+};
+
+static const struct tas571x_chip tas5753_chip = {
+	.supply_names			= tas5721_supply_names,
+	.num_supply_names		= ARRAY_SIZE(tas5721_supply_names),
+	.controls			= tas5733_controls,
+	.num_controls			= ARRAY_SIZE(tas5733_controls),
+	.regmap_config			= &tas5753_regmap_config,
+	.vol_reg_size			= 2,
+};
+
 static const struct tas571x_chip tas5721_chip = {
 	.supply_names			= tas5721_supply_names,
 	.num_supply_names		= ARRAY_SIZE(tas5721_supply_names),
@@ -1007,6 +1057,7 @@ static const struct of_device_id tas571x_of_match[] __maybe_unused = {
 	{ .compatible = "ti,tas5719", .data = &tas5717_chip, },
 	{ .compatible = "ti,tas5721", .data = &tas5721_chip, },
 	{ .compatible = "ti,tas5733", .data = &tas5733_chip, },
+	{ .compatible = "ti,tas5753", .data = &tas5753_chip, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tas571x_of_match);
@@ -1018,6 +1069,7 @@ static const struct i2c_device_id tas571x_i2c_id[] = {
 	{ "tas5719", (kernel_ulong_t) &tas5717_chip },
 	{ "tas5721", (kernel_ulong_t) &tas5721_chip },
 	{ "tas5733", (kernel_ulong_t) &tas5733_chip },
+	{ "tas5753", (kernel_ulong_t) &tas5753_chip },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas571x_i2c_id);

-- 
2.49.0

