Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CECF21B9D6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499305; cv=none; b=D18j338Orv7y1vaLRofKApXqsTFkC75OXLfkAnch/zRO5vvUTgogMPH2R+75LCAuRIBWafhthbh2RNl9CIoo0E1ddhra5siB0cn+Bg09HelnqF7T9aLKqQMW9/8JOZr2jg5UNbHaNLuuCsohiSLA/NqnxBxagsGdm10Ab+kE0oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499305; c=relaxed/simple;
	bh=L9QY4ZY+NZlfjp+6zJ9Zh0yubN5Tlbcju+8ra9dO3dw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Oa9Y2l4HXaMbYahRqfOftn+wBPqeF+vqei7L2N0lCrzWeHZqoh4C8B9VocsvJWG3EWB0kUuNXRSPprXFU5ehf1tU2NJsLj/94DYahFyQXF4s0E+LHGYUbsTVf6Gzv0CXC/bL1zoDfEz8x43EpOhpnmFrHXHVjmStunq0cRiLuXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4QnMIaF; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4QnMIaF"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d098f7bd77so55120485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 16:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751499302; x=1752104102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5P6VEh+TRCFSWLJBNZkHbbemxNDEsDjf6YXet7p1hbI=;
        b=N4QnMIaFqkOwcTpk2sVQeVTX74sU3cIJqTcyHfEE84U0lCMZaDbscEsLxROVFDTI8O
         crgqDEfB+GVwS5wg9n+SHR+eo6ktgLJXytdG9at2x5PVvNNaTZ2Q3wi8qTyBIOWhm+dH
         aLvd5iTKW7yNDvC0uVBowiNoaAEgnsM4957sFiRcVmFwl/s5L+znAYYuX2MvEdrCIXZ0
         /LpaVjzteY81A/aNDE9MLhjaouGHZAvxesG3l68B63+cKWhXHp9T6UIMWUC2dKsEwMa7
         bj9Mh+oOBA0fiwgvrnDowdv+HQK1xjrI5fAQTcpxSRAoSc4FTwNNGUrZQdj957NBSJO7
         mbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751499302; x=1752104102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5P6VEh+TRCFSWLJBNZkHbbemxNDEsDjf6YXet7p1hbI=;
        b=QW35Yp8+/KC5b3l09nd8pNADRtlcRLayutpvxjnsQPv7U9aPVbl25bqs2AYprD9vqV
         9f69R+Eai0dWCyuqX4wb4HMT2JhshnR4n0ifb5CoiQ3OfcZD0JRS28Bs4sW/yQQJJ2X9
         KxU84C195DHNxzp2f8zI9K22rrrbIuf4xcJ3i2j9HE/Z6+CJFTKRZi6SBnp7a2oA5+dI
         jU3sRnmnHNtLmmNsOUr+dhXtBk+p0T0fFJQv5+tBK5LaNR6GiuAlZ967tIaDrZcKG1ci
         ArazM6Xg6/4XSpRA/uBLpE+nHUZggns/wEom+hvjKQpiIEFnqwEvdZcasnR43EdpEj+d
         FuLQ==
X-Gm-Message-State: AOJu0YwrpXZs4aG5DMo+xZVOhCkDG4VwUwl9jOPOy9WdGhRz0vO299DQ
	VXfEuRrr6XLRoBwXZGEUD+yWnCRXw1Uc2ss6Xm4311QXf2ZjsP1n4iD4q1t0gJGj
X-Gm-Gg: ASbGnctGOlvJclbz5amL8y9EXzJg6NtokPBVTpLz3p9mth7f2qlfldKUukKPjIur/S2
	yoMVbfCN+13v9aI8dY6kO1C40dbFH9ZaW8RzmvfAm6X2icyeqxaD1ZD6QIlbc5WLtExzyERAJHy
	ZyjrlDGwJ8BCsjjigjZWu0+JyfnyAhoNAwKOZ6tQKU2jEa6X14AY/A7pGmWf5vCGjvBtpz2aen9
	3o3BCDvs0D6eDZWQXxzB3x9hQGcmtlQDw6xzt6hRFW7jYVZCuRfTBQRb3JJcrpQGw7gI7XAYibR
	To/u6J/XEcqqa65uF5LrQ1bXnXPGq07GDiCTMx/PAzwKuKuTGegZK7/oR7fTKtxIO/8z/WdEo6Z
	D13MnAxBej58=
X-Google-Smtp-Source: AGHT+IEe83t2DrXjJuf4kE9JfQV/TEyelDFDLsJ1VGGW+TsjrPi0t2/+SwB/E6KWWMKvx6fvrTiSzg==
X-Received: by 2002:a05:620a:172a:b0:7d4:4b12:a39c with SMTP id af79cd13be357-7d5d3fa1c02mr14095485a.16.1751499301863;
        Wed, 02 Jul 2025 16:35:01 -0700 (PDT)
Received: from eijiuchiyama-Dell-G15-5530.. ([187.10.131.129])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d45c0fe6dfsm597031185a.58.2025.07.02.16.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 16:35:01 -0700 (PDT)
From: Lucas Eiji Uchiyama <lucaseiji54@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Lucas Eiji Uchiyama <lucaseiji54@gmail.com>
Subject: [PATCH] iio: dps310.c: Remove duplication in functions
Date: Wed,  2 Jul 2025 20:34:41 -0300
Message-Id: <20250702233441.94203-1-lucaseiji54@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolidate the following functions into shared implementations:

- dps310_get_pres_precision
- dps310_get_temp_precision
- dps310_set_pres_precision
- dps310_set_temp_precision
- dps310_set_pres_samp_freq
- dps310_set_temp_samp_freq
- dps310_get_pres_samp_freq
- dps310_get_temp_samp_freq
- dps310_get_pres_k
- dps310_get_temp_k

These were replaced by the following unified functions:

- dps310_get_precision
- dps310_set_precision
- dps310_set_samp_freq
- dps310_get_samp_freq
- dps310_get_k

Each now takes an additional `mode` parameter indicating whether the
operation applies to temperature or pressure.

All call sites were updated accordingly. To improve readability, new
macros PRESSURE and TEMPERATURE were introduced and passed to the
shared functions.

Additionally, a new macro was defined for:

  BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
  BIT(IIO_CHAN_INFO_SAMP_FREQ) |
  BIT(IIO_CHAN_INFO_PROCESSED)

since this combination was used twice in the same struct.

Signed-off-by: Lucas Eiji Uchiyama <lucaseiji54@gmail.com>
---
 drivers/iio/pressure/dps310.c | 182 +++++++++++++---------------------
 1 file changed, 69 insertions(+), 113 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 8edaa4d10..99188bf4a 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -56,6 +56,8 @@
 #define DPS310_RESET		0x0c
 #define  DPS310_RESET_MAGIC	0x09
 #define DPS310_COEF_BASE	0x10
+#define PRESSURE 0
+#define TEMPERATURE 1
 
 /* Make sure sleep time is <= 30ms for usleep_range */
 #define DPS310_POLL_SLEEP_US(t)		min(30000, (t) / 8)
@@ -65,6 +67,11 @@
 #define DPS310_PRS_BASE		DPS310_PRS_B0
 #define DPS310_TMP_BASE		DPS310_TMP_B0
 
+#define INFO_MASK_SEPARATE \
+	 (BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) | \
+	 BIT(IIO_CHAN_INFO_SAMP_FREQ) | \
+	 BIT(IIO_CHAN_INFO_PROCESSED))
+
 /*
  * These values (defined in the spec) indicate how to scale the raw register
  * values for each level of precision available.
@@ -95,15 +102,11 @@ struct dps310_data {
 static const struct iio_chan_spec dps310_channels[] = {
 	{
 		.type = IIO_TEMP,
-		.info_mask_separate = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
-			BIT(IIO_CHAN_INFO_SAMP_FREQ) |
-			BIT(IIO_CHAN_INFO_PROCESSED),
+		.info_mask_separate = INFO_MASK_SEPARATE
 	},
 	{
 		.type = IIO_PRESSURE,
-		.info_mask_separate = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
-			BIT(IIO_CHAN_INFO_SAMP_FREQ) |
-			BIT(IIO_CHAN_INFO_PROCESSED),
+		.info_mask_separate = INFO_MASK_SEPARATE
 	},
 };
 
@@ -256,57 +259,24 @@ static int dps310_startup(struct dps310_data *data)
 	return dps310_temp_workaround(data);
 }
 
-static int dps310_get_pres_precision(struct dps310_data *data, int *val)
-{
-	int reg_val, rc;
-
-	rc = regmap_read(data->regmap, DPS310_PRS_CFG, &reg_val);
-	if (rc < 0)
-		return rc;
-
-	*val = BIT(reg_val & GENMASK(2, 0));
-
-	return 0;
-}
-
-static int dps310_get_temp_precision(struct dps310_data *data, int *val)
+static int dps310_get_precision(struct dps310_data *data, int *val, int mode)
 {
 	int reg_val, rc;
-
-	rc = regmap_read(data->regmap, DPS310_TMP_CFG, &reg_val);
+	if (!mode)
+		rc = regmap_read(data->regmap, DPS310_PRS_CFG, &reg_val);
+	else
+		rc = regmap_read(data->regmap, DPS310_TMP_CFG, &reg_val);
 	if (rc < 0)
 		return rc;
 
-	/*
-	 * Scale factor is bottom 4 bits of the register, but 1111 is
-	 * reserved so just grab bottom three
-	 */
 	*val = BIT(reg_val & GENMASK(2, 0));
 
 	return 0;
-}
-
-/* Called with lock held */
-static int dps310_set_pres_precision(struct dps310_data *data, int val)
-{
-	int rc;
-	u8 shift_en;
-
-	if (val < 0 || val > 128)
-		return -EINVAL;
-
-	shift_en = val >= 16 ? DPS310_PRS_SHIFT_EN : 0;
-	rc = regmap_write_bits(data->regmap, DPS310_CFG_REG,
-			       DPS310_PRS_SHIFT_EN, shift_en);
-	if (rc)
-		return rc;
 
-	return regmap_update_bits(data->regmap, DPS310_PRS_CFG,
-				  DPS310_PRS_PRC_BITS, ilog2(val));
 }
 
 /* Called with lock held */
-static int dps310_set_temp_precision(struct dps310_data *data, int val)
+static int dps310_set_precision(struct dps310_data *data, int val, int mode)
 {
 	int rc;
 	u8 shift_en;
@@ -314,32 +284,29 @@ static int dps310_set_temp_precision(struct dps310_data *data, int val)
 	if (val < 0 || val > 128)
 		return -EINVAL;
 
-	shift_en = val >= 16 ? DPS310_TMP_SHIFT_EN : 0;
-	rc = regmap_write_bits(data->regmap, DPS310_CFG_REG,
-			       DPS310_TMP_SHIFT_EN, shift_en);
-	if (rc)
-		return rc;
-
-	return regmap_update_bits(data->regmap, DPS310_TMP_CFG,
-				  DPS310_TMP_PRC_BITS, ilog2(val));
-}
-
-/* Called with lock held */
-static int dps310_set_pres_samp_freq(struct dps310_data *data, int freq)
-{
-	u8 val;
-
-	if (freq < 0 || freq > 128)
-		return -EINVAL;
+	if (!mode) {
+		shift_en = val >= 16 ? DPS310_PRS_SHIFT_EN : 0;
+		rc = regmap_write_bits(data->regmap, DPS310_CFG_REG,
+				DPS310_PRS_SHIFT_EN, shift_en);
+		if (rc)
+			return rc;
 
-	val = ilog2(freq) << 4;
+		return regmap_update_bits(data->regmap, DPS310_PRS_CFG,
+				DPS310_PRS_PRC_BITS, ilog2(val));
+	} else {
+		shift_en = val >= 16 ? DPS310_TMP_SHIFT_EN : 0;
+		rc = regmap_write_bits(data->regmap, DPS310_CFG_REG,
+				DPS310_TMP_SHIFT_EN, shift_en);
+		if (rc)
+			return rc;
 
-	return regmap_update_bits(data->regmap, DPS310_PRS_CFG,
-				  DPS310_PRS_RATE_BITS, val);
+		return regmap_update_bits(data->regmap, DPS310_TMP_CFG,
+				DPS310_TMP_PRC_BITS, ilog2(val));
+	}
 }
 
 /* Called with lock held */
-static int dps310_set_temp_samp_freq(struct dps310_data *data, int freq)
+static int dps310_set_samp_freq(struct dps310_data *data, int freq, int mode)
 {
 	u8 val;
 
@@ -348,54 +315,43 @@ static int dps310_set_temp_samp_freq(struct dps310_data *data, int freq)
 
 	val = ilog2(freq) << 4;
 
-	return regmap_update_bits(data->regmap, DPS310_TMP_CFG,
-				  DPS310_TMP_RATE_BITS, val);
+	if (!mode)
+		return regmap_update_bits(data->regmap, DPS310_PRS_CFG,
+				DPS310_PRS_RATE_BITS, val);
+	else
+		return regmap_update_bits(data->regmap, DPS310_TMP_CFG,
+				DPS310_TMP_RATE_BITS, val);
 }
 
-static int dps310_get_pres_samp_freq(struct dps310_data *data, int *val)
+static int dps310_get_samp_freq(struct dps310_data *data, int *val, int mode)
 {
 	int reg_val, rc;
 
-	rc = regmap_read(data->regmap, DPS310_PRS_CFG, &reg_val);
-	if (rc < 0)
-		return rc;
-
-	*val = BIT((reg_val & DPS310_PRS_RATE_BITS) >> 4);
-
-	return 0;
-}
-
-static int dps310_get_temp_samp_freq(struct dps310_data *data, int *val)
-{
-	int reg_val, rc;
-
-	rc = regmap_read(data->regmap, DPS310_TMP_CFG, &reg_val);
-	if (rc < 0)
-		return rc;
+	if (!mode) {
+		rc = regmap_read(data->regmap, DPS310_PRS_CFG, &reg_val);
+		if (rc < 0)
+			return rc;
 
-	*val = BIT((reg_val & DPS310_TMP_RATE_BITS) >> 4);
+		*val = BIT((reg_val & DPS310_PRS_RATE_BITS) >> 4);
+	} else {
+		rc = regmap_read(data->regmap, DPS310_TMP_CFG, &reg_val);
+		if (rc < 0)
+			return rc;
 
+		*val = BIT((reg_val & DPS310_TMP_RATE_BITS) >> 4);
+	}
 	return 0;
 }
 
-static int dps310_get_pres_k(struct dps310_data *data, int *val)
+static int dps310_get_k(struct dps310_data *data, int *val, int mode)
 {
 	int reg_val, rc;
 
-	rc = regmap_read(data->regmap, DPS310_PRS_CFG, &reg_val);
-	if (rc < 0)
-		return rc;
-
-	*val = scale_factors[reg_val & GENMASK(2, 0)];
-
-	return 0;
-}
-
-static int dps310_get_temp_k(struct dps310_data *data, int *val)
-{
-	int reg_val, rc;
+	if (!mode)
+		rc = regmap_read(data->regmap, DPS310_PRS_CFG, &reg_val);
+	else
+		rc = regmap_read(data->regmap, DPS310_TMP_CFG, &reg_val);
 
-	rc = regmap_read(data->regmap, DPS310_TMP_CFG, &reg_val);
 	if (rc < 0)
 		return rc;
 
@@ -474,7 +430,7 @@ static int dps310_read_pres_raw(struct dps310_data *data)
 	if (mutex_lock_interruptible(&data->lock))
 		return -EINTR;
 
-	rc = dps310_get_pres_samp_freq(data, &rate);
+	rc = dps310_get_samp_freq(data, &rate, PRESSURE);
 	if (rc)
 		goto done;
 
@@ -523,7 +479,7 @@ static int dps310_read_temp_raw(struct dps310_data *data)
 	if (mutex_lock_interruptible(&data->lock))
 		return -EINTR;
 
-	rc = dps310_get_temp_samp_freq(data, &rate);
+	rc = dps310_get_samp_freq(data, &rate, TEMPERATURE);
 	if (rc)
 		goto done;
 
@@ -590,11 +546,11 @@ static int dps310_write_raw(struct iio_dev *iio,
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		switch (chan->type) {
 		case IIO_PRESSURE:
-			rc = dps310_set_pres_samp_freq(data, val);
+			rc = dps310_set_samp_freq(data, val, PRESSURE);
 			break;
 
 		case IIO_TEMP:
-			rc = dps310_set_temp_samp_freq(data, val);
+			rc = dps310_set_samp_freq(data, TEMPERATURE);
 			break;
 
 		default:
@@ -606,11 +562,11 @@ static int dps310_write_raw(struct iio_dev *iio,
 	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
 		switch (chan->type) {
 		case IIO_PRESSURE:
-			rc = dps310_set_pres_precision(data, val);
+			rc = dps310_set_precision(data, val, PRESSURE);
 			break;
 
 		case IIO_TEMP:
-			rc = dps310_set_temp_precision(data, val);
+			rc = dps310_set_precision(data, val, TEMPERATURE);
 			break;
 
 		default:
@@ -645,11 +601,11 @@ static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	s64 kp;
 	s64 kt;
 
-	rc = dps310_get_pres_k(data, &kpi);
+	rc = dps310_get_k(data, &kpi, PRESSURE);
 	if (rc)
 		return rc;
 
-	rc = dps310_get_temp_k(data, &kti);
+	rc = dps310_get_k(data, &kti, TEMPERATURE);
 	if (rc)
 		return rc;
 
@@ -717,7 +673,7 @@ static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_SAMP_FREQ:
-		rc = dps310_get_pres_samp_freq(data, val);
+		rc = dps310_get_samp_freq(data, val, PRESSURE);
 		if (rc)
 			return rc;
 
@@ -736,7 +692,7 @@ static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,
 		return IIO_VAL_FRACTIONAL;
 
 	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
-		rc = dps310_get_pres_precision(data, val);
+		rc = dps310_get_precision(data, val, PRESSURE);
 		if (rc)
 			return rc;
 		return IIO_VAL_INT;
@@ -752,7 +708,7 @@ static int dps310_calculate_temp(struct dps310_data *data, int *val)
 	s64 t;
 	int kt, rc;
 
-	rc = dps310_get_temp_k(data, &kt);
+	rc = dps310_get_k(data, &kt, TEMPERATURE);
 	if (rc)
 		return rc;
 
@@ -775,7 +731,7 @@ static int dps310_read_temp(struct dps310_data *data, int *val, int *val2,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_SAMP_FREQ:
-		rc = dps310_get_temp_samp_freq(data, val);
+		rc = dps310_get_samp_freq(data, val, TEMPERATURE);
 		if (rc)
 			return rc;
 
@@ -793,7 +749,7 @@ static int dps310_read_temp(struct dps310_data *data, int *val, int *val2,
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
-		rc = dps310_get_temp_precision(data, val);
+		rc = dps310_get_precision(data, val, TEMPERATURE);
 		if (rc)
 			return rc;
 
-- 
2.34.1

