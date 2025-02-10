Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D157E105;
	Mon, 10 Feb 2025 02:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739154718; cv=none; b=ANCvwcvZArCyH2U78cj9E28o/RnArlAX8TP7NI/7LHUB3OTQK4LWocKtuf1sj6AfU7+lN17WMCsuMgfV3ke4BCovgNe3rokbuzAMygez2wQrkkPM0f7UvOzfjEQrSoc7aDKx916hUoGDrPRro+KL2WHP92lVZVCvmUlmb6IdjRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739154718; c=relaxed/simple;
	bh=Nnqyotd7W+VYQWypQy4ER6j2gU8oIvSZV1McbdtLh+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oBuljaxE+s6abLixlLU70UjCX2AHpZ0JKoOsTK7X1Supavbwa9n/ESFqGEA/yDlX09Metvp1mM7q+e52LinXuYPKA3vUph/FL7L9nS1Jt2k9ISxddfK0XBCrdBUk5jeQ8cmWswTo0+4KrhvTRkMRUg2Lmy0u+6Zx+muPeowEdJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=KTP5CmxS; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="KTP5CmxS"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A0PgxL014127;
	Sun, 9 Feb 2025 21:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=FUtQT
	eemMCibRCnqWLzbr7ZmqJbkxhyJdlgsrkLyQhY=; b=KTP5CmxSoK4mXT518fVAz
	HAIQZHtDExcYd3jzhsz2fUC95kBtISS2oVJgp1B+7ANc0QfkSm+pv6vScyMgdFIz
	yRGO5h9LtbWHWHBCsgqSaoeewjsSf+h5kNelTKRu/vEkWhKN7Twmb7YRacqZdca7
	v068T3ALVVLqH2m/IfKI/BAXoqikpC1vXACooBMWncOufx8eNbgfO6KXc3144Vfi
	7+ZtvkN3ygK2PadwOc1gFp8BmA0PvTs6/Qa3ev+LIkO7o00l9jIL1EhMdeGDb3mK
	g+QYEUxrxwi9cP0x8RNb028mfECWhdNpR0bIrOY8edN6b7pfKck0gQUEL8DK5q8l
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 44p529n8v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Feb 2025 21:31:39 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 51A2VcnW018804
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 9 Feb 2025 21:31:38 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Sun, 9 Feb 2025
 21:31:38 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Sun, 9 Feb 2025 21:31:38 -0500
Received: from CCAPUA-L02.ad.analog.com (CCAPUA-L02.ad.analog.com [10.117.222.251])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 51A2VLir017158;
	Sun, 9 Feb 2025 21:31:29 -0500
From: "Celine Joy A. Capua" <celinejoy.capua@analog.com>
Date: Mon, 10 Feb 2025 10:30:52 +0800
Subject: [PATCH 1/2] regulator: ltc7871: Add driver for LTC7871
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250210-staging-ltc7871-v1-1-c593ad86aab2@analog.com>
References: <20250210-staging-ltc7871-v1-0-c593ad86aab2@analog.com>
In-Reply-To: <20250210-staging-ltc7871-v1-0-c593ad86aab2@analog.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Celine Joy
 A. Capua" <celinejoy.capua@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739154682; l=12335;
 i=celinejoy.capua@analog.com; s=20250210; h=from:subject:message-id;
 bh=Nnqyotd7W+VYQWypQy4ER6j2gU8oIvSZV1McbdtLh+c=;
 b=9ahNDKHjhzbg8qT+PVbZ6FXkXt87Fxvi+yh3dlvHMJ6WEpFm/N/hzjVM4JvfrzQfodHrkk37T
 I5pivj9/dWnA+6W0qVu3MR8uxcYuQGpTl4kaVanmheh6b74khlUr+17
X-Developer-Key: i=celinejoy.capua@analog.com; a=ed25519;
 pk=7kw4U3NQswQj33plajHOwzScUl5kbavfQVO78tcggn8=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: B3wIiu_CtlU2oQCumTyecTs_Nxqf8mQr
X-Authority-Analysis: v=2.4 cv=FabNxI+6 c=1 sm=1 tr=0 ts=67a9650c cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=gAnH3GRIAAAA:8 a=A6f6jut1Y_ydnefepkgA:9 a=QEXdDO2ut3YA:10
 a=oVHKYsEdi7-vN-J5QA_j:22
X-Proofpoint-GUID: B3wIiu_CtlU2oQCumTyecTs_Nxqf8mQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_01,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100019

Add ADI LTC7871 buck-boost controller driver support.

Signed-off-by: Celine Joy A. Capua <celinejoy.capua@analog.com>
---
 drivers/regulator/Kconfig             |  11 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/ltc7871-regulator.c | 405 ++++++++++++++++++++++++++++++++++
 3 files changed, 417 insertions(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 39297f7d8177193e51c99bc2b360c6d9936e62fe..500e8d7a198c597a479f80866a9733ebf945e15f 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -566,6 +566,17 @@ config REGULATOR_LTC3676
 	  This enables support for the LTC3676
 	  8-output regulators controlled via I2C.
 
+config REGULATOR_LTC7871
+	tristate "LTC7871 six-phase buck-boost voltage regulator driver with SPI"
+	depends on SPI && OF
+	help
+	  This driver controls an Analog Devices LTC7871 high performance
+	  bidirectional buck or boost switching regulator controller
+	  that operates in either buck or boost mode on demand.
+
+	  Say M here if you want to include support for the regulator as a
+	  module.
+
 config REGULATOR_MAX14577
 	tristate "Maxim 14577/77836 regulator"
 	depends on MFD_MAX14577
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 3d5a803dce8a0556ba9557fa069c6e37593b3c69..47e26fcf39db39da542a7bc4df05b214c4b7cc0f 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_REGULATOR_LP8788) += lp8788-ldo.o
 obj-$(CONFIG_REGULATOR_LP8755) += lp8755.o
 obj-$(CONFIG_REGULATOR_LTC3589) += ltc3589.o
 obj-$(CONFIG_REGULATOR_LTC3676) += ltc3676.o
+obj-$(CONFIG_REGULATOR_LTC7871) += ltc7871-regulator.o
 obj-$(CONFIG_REGULATOR_MAX14577) += max14577-regulator.o
 obj-$(CONFIG_REGULATOR_MAX1586) += max1586.o
 obj-$(CONFIG_REGULATOR_MAX5970) += max5970-regulator.o
diff --git a/drivers/regulator/ltc7871-regulator.c b/drivers/regulator/ltc7871-regulator.c
new file mode 100644
index 0000000000000000000000000000000000000000..eeea952f9362e48e0f6b85309a0c273f77776cb0
--- /dev/null
+++ b/drivers/regulator/ltc7871-regulator.c
@@ -0,0 +1,405 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Analog Devices LTC7871 Voltage Regulator Driver
+ *
+ * Copyright 2025 Analog Devices Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/crc8.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/spi/spi.h>
+
+#define LTC7871_REG_FAULT		0x01
+#define LTC7871_REG_CONFIG2		0x06
+#define LTC7871_REG_CHIP_CTRL		0x07
+#define LTC7871_REG_IDAC_VLOW		0x08
+#define LTC7871_REG_IDAC_VHIGH		0x09
+#define LTC7871_REG_SETCUR		0x0A
+#define LTC7871_REG_SSFM		0x0B
+
+#define LTC7871_FAULT_OVER_TEMP		BIT(0)
+#define LTC7871_FAULT_VHIGH_UV		BIT(4)
+#define LTC7871_FAULT_VHIGH_OV		BIT(5)
+#define LTC7871_FAULT_VLOW_OV		BIT(6)
+
+#define LTC7871_MASK_CONFIG2_BUCK_BOOST	BIT(0)
+
+#define LTC7871_MASK_CHIP_CTRL_WP	BIT(0)
+
+#define	LTC7871_MASK_SSFM_FREQ_SPREAD	GENMASK(4, 3)
+#define	LTC7871_MASK_SSFM_MOD_SIG_FREQ	GENMASK(2, 0)
+
+#define LTC7871_CRC_INIT		0x41
+#define LTC7871_CRC8_POLY		0x7
+#define LTC7871_DATA_POS		1
+#define LTC7871_CRC_POS			2
+#define LTC7871_FRAME_SIZE		3
+
+#define LTC7871_IDAC_MAX		63
+#define LTC7871_IDAC_MIN		-64
+
+DECLARE_CRC8_TABLE(ltc7871_crc8_table);
+
+struct ltc7871 {
+	struct spi_device *spi;
+	struct regulator_dev *rdev;
+	bool enable_chip_ctrl_wp;
+	bool regulator_mode;
+	u32 ra_ext;
+	u32 rb_ext;
+	u32 rc_ext;
+	u32 rd_ext;
+	u32 r1;
+	u32 r2;
+	u32 max_vol;
+	u32 min_vol;
+	s32 idac_setcur_uA;
+	const char *freq_spread_percentage;
+	u32 switching_freq_divider;
+};
+
+static const char * const ltc7871_freq_spread_percentage[] = {
+	"+-12%",
+	"+-15%",
+	"+-10%",
+	"+-8%",
+};
+
+static const unsigned int ltc7871_switching_freq_divider[] = {
+	512,
+	1024,
+	2048,
+	4096,
+	256,
+	128,
+	64,
+};
+
+static int ltc7871_reg_read(struct spi_device *spi, u8 reg, int *val)
+{
+	int ret;
+	struct spi_transfer t;
+	u8 crc;
+	u8 rx_buf[LTC7871_FRAME_SIZE] = {0};
+	u8 tx_buf[LTC7871_FRAME_SIZE] = {0};
+
+	tx_buf[0] = reg << 1 | 1;
+
+	t.tx_buf = tx_buf;
+	t.rx_buf = rx_buf;
+	t.len = LTC7871_FRAME_SIZE;
+
+	crc = crc8(ltc7871_crc8_table, rx_buf, LTC7871_CRC_POS,
+		   LTC7871_CRC_INIT);
+
+	ret = spi_sync_transfer(spi, &t, 1);
+	if (ret < 0)
+		return ret;
+
+	if (rx_buf[LTC7871_CRC_POS] != crc)
+		return -EIO;
+
+	return 0;
+}
+
+static int ltc7871_reg_write(struct spi_device *spi, u8 reg, int val)
+{
+	struct spi_transfer t;
+	u8 rx_buf[LTC7871_FRAME_SIZE] = {0};
+	u8 tx_buf[LTC7871_FRAME_SIZE] = {0};
+
+	tx_buf[0] = reg << 1;
+	tx_buf[1] = val;
+	tx_buf[2] = crc8(ltc7871_crc8_table, tx_buf, LTC7871_CRC_POS, LTC7871_CRC_INIT);
+
+	t.tx_buf = tx_buf;
+	t.rx_buf = rx_buf;
+	t.len = LTC7871_FRAME_SIZE;
+
+	return spi_sync_transfer(spi, &t, 1);
+}
+
+static int ltc7871_get_error_flags(struct regulator_dev *rdev,
+				   unsigned int *flags)
+{
+	u32 val;
+	int ret;
+	struct ltc7871 *ltc7871 = rdev_get_drvdata(rdev);
+
+	ret = ltc7871_reg_read(ltc7871->spi, LTC7871_REG_FAULT, &val);
+	if (ret)
+		return ret;
+
+	*flags = 0;
+
+	if (FIELD_GET(LTC7871_FAULT_VHIGH_OV, val) ||
+	    FIELD_GET(LTC7871_FAULT_VLOW_OV, val))
+		*flags |= REGULATOR_ERROR_OVER_VOLTAGE_WARN;
+
+	if (FIELD_GET(LTC7871_FAULT_VHIGH_UV, val))
+		*flags |= REGULATOR_ERROR_UNDER_VOLTAGE;
+
+	if (FIELD_GET(LTC7871_FAULT_OVER_TEMP, val))
+		*flags |= REGULATOR_ERROR_OVER_TEMP;
+
+	return 0;
+}
+
+static s64 _ltc7871_dac_to_uV(struct ltc7871 *ltc7871, u32 dac_val)
+{
+	s64 tmp;
+
+	tmp = 1200 * (1000 + (div_s64(ltc7871->r2 * 1000, ltc7871->r1)));
+	tmp = tmp - dac_val * ltc7871->r2;
+
+	return tmp;
+}
+
+static s64 _ltc7871_uV_to_dac(struct ltc7871 *ltc7871, s32 uV)
+{
+	s64 tmp;
+
+	tmp = 1200 * (1000 + (div_s64(ltc7871->r2 * 1000, ltc7871->r1))) - uV;
+	tmp = div_s64(tmp, ltc7871->r2);
+
+	return tmp;
+}
+
+static int ltc7871_set_voltage_sel(struct regulator_dev *rdev,
+				   unsigned int sel)
+{
+	int reg;
+	int addr;
+	struct ltc7871 *ltc7871 = rdev_get_drvdata(rdev);
+
+	if (sel < ltc7871->min_vol || sel > ltc7871->max_vol)
+		return -EINVAL;
+
+	if (ltc7871->regulator_mode)
+		addr = LTC7871_REG_IDAC_VLOW;
+	else
+		addr = LTC7871_REG_IDAC_VHIGH;
+
+	reg = _ltc7871_uV_to_dac(ltc7871, sel);
+
+	return ltc7871_reg_write(ltc7871->spi, addr, reg);
+}
+
+static int ltc7871_get_voltage_sel(struct regulator_dev *rdev)
+{
+	int reg, ret;
+	int addr;
+	struct ltc7871 *ltc7871 = rdev_get_drvdata(rdev);
+
+	if (ltc7871->regulator_mode)
+		addr = LTC7871_REG_IDAC_VLOW;
+	else
+		addr = LTC7871_REG_IDAC_VHIGH;
+
+	ret = ltc7871_reg_read(ltc7871->spi, addr, &reg);
+	if (ret < 0)
+		return ret;
+
+	return _ltc7871_dac_to_uV(ltc7871, reg);
+}
+
+static int ltc7871_get_prop_index(const u32 *table, size_t table_size, u32 value)
+{
+	int i;
+
+	for (i = 0; i < table_size; i++)
+		if (table[i] == value)
+			return i;
+
+	return -EINVAL;
+}
+
+static int ltc7871_parse_fw(struct ltc7871 *chip)
+{
+	int reg, ret;
+	int val1, val2;
+
+	/* Setting default values based on datasheet and DC2886A Schematic */
+	chip->idac_setcur_uA = 0;
+	chip->freq_spread_percentage = "+-12%";
+	chip->switching_freq_divider = 512;
+	chip->enable_chip_ctrl_wp = 0;
+	chip->ra_ext = 10000;
+	chip->rb_ext = 107000;
+	chip->rc_ext = 12700;
+	chip->rd_ext = 499000;
+
+	ret = device_property_read_u32(&chip->spi->dev, "adi,ra-external-ohms",
+				 &chip->ra_ext);
+	if (!ret) {
+		if (!chip->ra_ext)
+			return -EINVAL;
+	}
+
+	ret = device_property_read_u32(&chip->spi->dev, "adi,rb-external-ohms",
+				 &chip->rb_ext);
+	if (!ret) {
+		if (!chip->rb_ext)
+			return -EINVAL;
+	}
+
+	ret = device_property_read_u32(&chip->spi->dev, "adi,rc-external-ohms",
+				 &chip->rc_ext);
+	if (!ret) {
+		if (!chip->rc_ext)
+			return -EINVAL;
+	}
+
+	ret = device_property_read_u32(&chip->spi->dev, "adi,rd-external-ohms",
+				 &chip->rd_ext);
+	if (!ret) {
+		if (!chip->rd_ext)
+			return -EINVAL;
+	}
+
+	ret = ltc7871_reg_read(chip->spi, LTC7871_REG_CONFIG2, &reg);
+	if (ret < 0)
+		return ret;
+
+	chip->regulator_mode = FIELD_GET(LTC7871_MASK_CONFIG2_BUCK_BOOST, reg);
+
+	if (chip->regulator_mode) {
+		chip->r1 = chip->ra_ext;
+		chip->r2 = chip->rb_ext;
+	} else {
+		chip->r1 = chip->rc_ext;
+		chip->r2 = chip->rd_ext;
+	}
+	chip->min_vol = _ltc7871_dac_to_uV(chip, LTC7871_IDAC_MAX);
+	chip->max_vol = _ltc7871_dac_to_uV(chip, LTC7871_IDAC_MIN);
+
+	ret = ltc7871_reg_read(chip->spi, LTC7871_REG_CHIP_CTRL, &reg);
+	if (ret < 0)
+		return ret;
+
+	chip->enable_chip_ctrl_wp = device_property_read_bool(&chip->spi->dev,
+						"adi,enable-chip-ctrl-wp");
+	val1 = FIELD_PREP(LTC7871_MASK_CHIP_CTRL_WP, chip->enable_chip_ctrl_wp) | reg;
+	ret = ltc7871_reg_write(chip->spi, LTC7871_REG_CHIP_CTRL, val1);
+	if (ret)
+		return ret;
+
+	ret = device_property_read_u32(&chip->spi->dev, "adi,idac-setcur-microamp",
+				 &chip->idac_setcur_uA);
+	if (!ret) {
+		if (chip->idac_setcur_uA < LTC7871_IDAC_MIN ||
+		    chip->idac_setcur_uA > LTC7871_IDAC_MAX) {
+			return -EINVAL;
+		}
+
+		ret = ltc7871_reg_write(chip->spi, LTC7871_REG_SETCUR,
+					chip->idac_setcur_uA);
+		if (ret)
+			return ret;
+	}
+	ret = device_property_match_property_string(&chip->spi->dev,
+			"adi,freq-spread-percentage",
+			ltc7871_freq_spread_percentage,
+			ARRAY_SIZE(ltc7871_freq_spread_percentage));
+
+	if (ret >= 0)
+		val1 = FIELD_PREP(LTC7871_MASK_SSFM_FREQ_SPREAD, ret);
+	else
+		val1 = 0;
+
+	ret = device_property_read_u32(&chip->spi->dev,
+				       "adi,switching-freq-divider",
+				       &chip->switching_freq_divider);
+	if (!ret) {
+		ret = ltc7871_get_prop_index(ltc7871_switching_freq_divider,
+					     ARRAY_SIZE(ltc7871_switching_freq_divider),
+					     chip->switching_freq_divider);
+		if (ret < 0)
+			return ret;
+
+		val2 = FIELD_PREP(LTC7871_MASK_SSFM_MOD_SIG_FREQ, ret);
+	}
+
+	return ltc7871_reg_write(chip->spi, LTC7871_REG_SSFM, val1 | val2);
+}
+
+static const struct regulator_ops ltc7871_regulator_ops = {
+	.set_voltage_sel = ltc7871_set_voltage_sel,
+	.get_voltage_sel = ltc7871_get_voltage_sel,
+	.get_error_flags = ltc7871_get_error_flags,
+};
+
+static const struct regulator_desc ltc7871_regulator_desc = {
+	.ops = &ltc7871_regulator_ops,
+	.name = "ltc7871",
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+};
+
+static int ltc7871_probe(struct spi_device *spi)
+{
+	int ret;
+	struct regulator_init_data *init_data;
+	struct device *dev = &spi->dev;
+	struct regulator_config config = { };
+	struct ltc7871 *chip;
+
+	init_data = of_get_regulator_init_data(dev, spi->dev.of_node,
+					       &ltc7871_regulator_desc);
+	if (!init_data)
+		return -EINVAL;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	crc8_populate_msb(ltc7871_crc8_table, LTC7871_CRC8_POLY);
+
+	chip->spi = spi;
+
+	ret = ltc7871_parse_fw(chip);
+	if (ret < 0)
+		return ret;
+
+	config.dev = dev;
+	config.init_data = init_data;
+	config.driver_data = chip;
+
+	chip->rdev = devm_regulator_register(dev, &ltc7871_regulator_desc,
+					     &config);
+
+	return PTR_ERR_OR_ZERO(chip->rdev);
+}
+
+static const struct of_device_id ltc7871_of_match[] = {
+	{ .compatible = "adi,ltc7871", },
+	{ .compatible = "adi,ltc7872", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ltc7871_of_match);
+
+static const struct spi_device_id ltc7871_id[] = {
+	{"ltc7871" },
+	{"ltc7872" },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, ltc7871_id);
+
+static struct spi_driver ltc7871_driver = {
+	.driver = {
+		.name = "ltc7871",
+		.of_match_table = ltc7871_of_match,
+	},
+	.probe = ltc7871_probe,
+	.id_table = ltc7871_id,
+};
+module_spi_driver(ltc7871_driver);
+
+MODULE_DESCRIPTION("LTC7871 Voltage Regulator Driver");
+MODULE_AUTHOR("Celine Joy Capua <celinejoy.capua@analog.com>");
+MODULE_LICENSE("GPL");

-- 
2.34.1

