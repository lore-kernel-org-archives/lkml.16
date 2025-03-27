Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E24D215782;
	Thu, 27 Mar 2025 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081637; cv=none; b=Ze0ESCaXYJvqZtvvnci2ryYPt9RfCz+QVA3o+ZHzSE16of8Wr0qWs5wXww7MpEEVQg/r4epBGBeBJkSWruos+CBGsDDzMVUK03/0iKLWuAifoD3OuU0FLQ8BiYxxcyL8LBPJrPS6oFeHQVGxg+SCvl7QbgNuMzee3iTiCGOvl58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081637; c=relaxed/simple;
	bh=wlj26vdCFJW6SSyEiwr/A888h+vTeqcZLsamfLhqP/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=pFoB7ECzaJUIKb5UNchExrla5SxPtMRK0EPasBl+iWQsLnDvObT17X3pRAjnBMHlEQjcIP/Lhs5MwsETY6wHycZ4p5t/ud/t1KuGMm5oX/4l/YPsS7dqLsDcw7fVKdGerJYeZeZPMPS7av591k96IfZNsthtWHYXh+Mb1ICPSnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UbJeYpJo; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UbJeYpJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=f9qeqcDtLM620bE3Ca
	/AcO/hR5gMSWl/zpqwr6lqtRs=; b=UbJeYpJo/U8obNN2veBIhkJx0xo+fWYoRe
	XVzBxKUgI8e1nHzfqQIgJguIa1nikqL1ma8ilqoJXMlHKluenKywY+bxnu5Wzj2F
	LcQ6oSADIFoLpSbuCJwqlNRZHnC09uMSM/cPmyANpmlsXR0Om0Sq1fnLCZnuvoNY
	4ot5avctM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3f7xtUOVn1ekMCQ--.39600S5;
	Thu, 27 Mar 2025 21:19:49 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jean Delvare <jdelvare@suse.com>
Cc: Wenliang Yan <wenliang202407@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/4] hwmon:(ina238)Modify the calculation formula to adapt to different chips
Date: Thu, 27 Mar 2025 09:18:40 -0400
Message-Id: <20250327131841.15013-4-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250327131841.15013-1-wenliang202407@163.com>
References: <20250327131841.15013-1-wenliang202407@163.com>
X-CM-TRANSID:_____wD3f7xtUOVn1ekMCQ--.39600S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxKrWfJrWfuw45Cry5uF45Jrb_yoWxZry8pF
	y5Can8Gr18tw17WrnFkr4xuF15Xwn7GwnxAr97KwnavFn0k34v9rW5tFWrZrW3Jws8Xa18
	t34UtrWYkwsFyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRFksgUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbibhkd02flSlJ99AAEsu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Modify the calculation formula to adapt to different chips.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---

v5->v6:Split the patch, this patch introduce the principle of the formula:
1.shunt voltage reading and writing calculate
*val = (regval * INA238_SHUNT_VOLTAGE_LSB) * data->gain / (1000 * 4);
regval = (regval * 1000 * 4) / (INA238_SHUNT_VOLTAGE_LSB * data->gain);
Solves the situation where gain=2 exists

2.power reading and writing calculate
power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT * data->gain *
data->config->power_calculate_factor, 4 * 100 * data->rshunt);

Since the 'data->config->power_calculate_factor' parameter values of different
chips are different, the formula is modified.

Current_LSB is 1mA/lsb, so the SQ52206's Energy calculation formula is
Power (uW) = 0.24(0.2) * register value * 1000 * 20000 / rshunt / 4 * gain,
where 20000 is the default resistance value. 4 is the default gain of 4,
20000*gain/ (rshunt*4) indicates the conversion ratio based on the actual
resistance value and the gain ratio. 0.24(0.2) is fixed parameters.
'data->config->power_calculate_factor/100 == 0.24(0.2)'.

3.read temp calculate
*val = div_s64(((s64)((s16)regval) >> data->config->temp_shift) *
(s64)data->config->temp_lsb, 10000);
Since the 'data->config->temp_shift' parameter values of different
chips are different, the formula is modified.
Cast the parameter regval type s64 to avoid overflows resulting in calculation errors.

4.writr temp calculate
regval = clamp_val(val, -40000, 125000);
Limiting the size of written data prevents overflows that can cause calculation error

 drivers/hwmon/ina238.c | 47 +++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 1bf4c850b04d..7a96b68d4d20 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -270,10 +270,10 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
 		regval = (s16)regval;
 		if (channel == 0)
 			/* gain of 1 -> LSB / 4 */
-			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) /
-			       (1000 * (4 - data->gain + 1));
+			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) *
+					data->gain / (1000 * 4);
 		else
-			*val = (regval * INA238_BUS_VOLTAGE_LSB) / 1000;
+			*val = (regval * data->config->bus_voltage_lsb) / 1000;
 		break;
 	case hwmon_in_max_alarm:
 	case hwmon_in_min_alarm:
@@ -298,8 +298,8 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
 	case 0:
 		/* signed value, clamp to max range +/-163 mV */
 		regval = clamp_val(val, -163, 163);
-		regval = (regval * 1000 * (4 - data->gain + 1)) /
-			 INA238_SHUNT_VOLTAGE_LSB;
+		regval = (regval * 1000 * 4) /
+			 (INA238_SHUNT_VOLTAGE_LSB * data->gain);
 		regval = clamp_val(regval, S16_MIN, S16_MAX);
 
 		switch (attr) {
@@ -315,7 +315,7 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
 	case 1:
 		/* signed value, positive values only. Clamp to max 102.396 V */
 		regval = clamp_val(val, 0, 102396);
-		regval = (regval * 1000) / INA238_BUS_VOLTAGE_LSB;
+		regval = (regval * 1000) / data->config->bus_voltage_lsb;
 		regval = clamp_val(regval, 0, S16_MAX);
 
 		switch (attr) {
@@ -370,8 +370,8 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 			return err;
 
 		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
-		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *
-				data->gain, 20 * data->rshunt);
+		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *	data->gain *
+				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -381,8 +381,8 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 			return err;
 
 		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
-		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *
-				data->gain, 20 * data->rshunt);
+		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *	data->gain *
+				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -395,8 +395,8 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 		 * Truncated 24-bit compare register, lower 8-bits are
 		 * truncated. Same conversion to/from uW as POWER register.
 		 */
-		power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *
-			       data->gain, 20 * data->rshunt);
+		power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *	data->gain *
+				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -428,8 +428,8 @@ static int ina238_write_power(struct device *dev, u32 attr, long val)
 	 * register.
 	 */
 	regval = clamp_val(val, 0, LONG_MAX);
-	regval = div_u64(val * 20ULL * data->rshunt,
-			 1000ULL * INA238_FIXED_SHUNT * data->gain);
+	regval = div_u64(val * 4 * 100 * data->rshunt, data->config->power_calculate_factor *
+			1000ULL * INA238_FIXED_SHUNT * data->gain);
 	regval = clamp_val(regval >> 8, 0, U16_MAX);
 
 	return regmap_write(data->regmap, INA238_POWER_LIMIT, regval);
@@ -446,17 +446,17 @@ static int ina238_read_temp(struct device *dev, u32 attr, long *val)
 		err = regmap_read(data->regmap, INA238_DIE_TEMP, &regval);
 		if (err)
 			return err;
-
-		/* Signed, bits 15-4 of register, result in mC */
-		*val = ((s16)regval >> 4) * INA238_DIE_TEMP_LSB;
+		/* Signed, result in mC */
+		*val = div_s64(((s64)((s16)regval) >> data->config->temp_shift) *
+						(s64)data->config->temp_lsb, 10000);
 		break;
 	case hwmon_temp_max:
 		err = regmap_read(data->regmap, INA238_TEMP_LIMIT, &regval);
 		if (err)
 			return err;
-
-		/* Signed, bits 15-4 of register, result in mC */
-		*val = ((s16)regval >> 4) * INA238_DIE_TEMP_LSB;
+		/* Signed, result in mC */
+		*val = div_s64(((s64)((s16)regval) >> data->config->temp_shift) *
+						(s64)data->config->temp_lsb, 10000);
 		break;
 	case hwmon_temp_max_alarm:
 		err = regmap_read(data->regmap, INA238_DIAG_ALERT, &regval);
@@ -480,9 +480,10 @@ static int ina238_write_temp(struct device *dev, u32 attr, long val)
 	if (attr != hwmon_temp_max)
 		return -EOPNOTSUPP;
 
-	/* Signed, bits 15-4 of register */
-	regval = (val / INA238_DIE_TEMP_LSB) << 4;
-	regval = clamp_val(regval, S16_MIN, S16_MAX) & 0xfff0;
+	/* Signed */
+	regval = clamp_val(val, -40000, 125000);
+	regval = div_s64(val*10000, data->config->temp_lsb) << data->config->temp_shift;
+	regval = clamp_val(regval, S16_MIN, S16_MAX) & (0xffff << data->config->temp_shift);
 
 	return regmap_write(data->regmap, INA238_TEMP_LIMIT, regval);
 }
-- 
2.17.1

