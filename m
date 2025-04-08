Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5C42638A6;
	Tue,  8 Apr 2025 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101969; cv=none; b=YfJ/nqca1KoRuVTYWk0TbDLO83hN+gyhfNGedm4vsE75jktSKs7LuHmayDjk5fQvZIsvh5CqxUtBxrsWjtU7N77usaoXBnWJ2CWU9hh2eNJQd/jbKbuhT/RXySlRAjsczuYjJt4N9xE4Vb309KQeZt8kPJs3vPysn5lcXXtMQCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101969; c=relaxed/simple;
	bh=KJNzANBN7Q7QqyJR9mmdS4vWTKj+Q5bE6S+hZ+hVHWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ybz6AG4GFVdFcooieGlxrupTii1fBUgnaqBY7U9P1VjgyRefFQzLI6KzvIFlDnM7xtY+MGkCqzYJrigXIR1pcZ8i+iwoobZNCiEslb/4BV5xfYV07ld9gg3we+oRQ6noRvBk2mlhfqdfhm1zElsEX2VzogGuTRMPwGuKQgE5ce8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBTEek9X; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBTEek9X"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54993c68ba0so5950058e87.2;
        Tue, 08 Apr 2025 01:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744101965; x=1744706765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tTOR0yI4u1rLIBZlLw3kVKLV4VXHXvLKFew98GbqH+I=;
        b=jBTEek9XIfRf1Dcuf+c+YJDNPFkbfZ0LUNlZjGOKs9pWuidTzHHezE6HH9wUgxKLnk
         7rvx+3idVEImF7Y5BvqRDVR24Hy1X606jk5trFCGYl/5r/gV4tn6TDL7HO4WH+PIWfsD
         te6UyQuBhVIFon8nxTU1Dv6bvA/26D3C7NNMMxuSXgQSZyuEEpayiGXksXVSJX0M3ZHa
         aYvWBfmdpx9wrBDEPP49on28tkOsqwp5vMDkQGIhEYRTdQotbsQmF+fY4C0hXvDRUj9a
         OpG/40GftdWK+cGCOa4+LGutnz1QsOF67YTTUZyo9SgxfHotA3KwOYbs0A65tRWhNDS0
         kWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101965; x=1744706765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTOR0yI4u1rLIBZlLw3kVKLV4VXHXvLKFew98GbqH+I=;
        b=D/39FozHAkNskjmXkNQ8j5vznCkoIaiU04Qn4Nl+aane3jUY5jrtx7ryJlrvkGGF05
         NACjaqEP5B5BCJdH96lTuO4HGj+tFeqM98L0zrlj686AT1SPwGYVcKoD6teWHd16Zlvk
         qzg1eVNO6cfHcgWS6R1TNcEJRJX7OztrcLN1dizSv6zIumZ8vUgCgB367ve+cbpYNRcG
         rQ/OxQDYvkz0B9iLUm5w985TggGufGjeTNv3r+RC1PXXo8RA2JxVEIwxBigaGXzHoHBj
         W7ZubE3GCBN6AlCKGVsdJXvnp3Zh7BO4fAr3QBGFjOBcrApmNua6bAVDEIZqysVvZS/i
         Ycqw==
X-Forwarded-Encrypted: i=1; AJvYcCVtNbUSNmVR42NZCjM8/c2M23dsS7w3cSadhTwzyvg2uMwFm0Qj5Fq0pmHvvetwr4rclZ5CXE/DSjDj@vger.kernel.org, AJvYcCXs9pVSAwM6KIT6QnbXEGT6udlNtdusssD4eHM0Y02WETpFmvJmWeF/XUoKjxoTNwoFbyKLxgXrytIMansT@vger.kernel.org
X-Gm-Message-State: AOJu0YzoapWa2R9m+22IhTCUzFVj6q6rwQkhFJVPOpoVeSqPG3DcNnxM
	aE/MEkHVcQ7G3evp9OQ09mqRV3OzjFGXGNP7kx9HmHdl3+ra5+Om
X-Gm-Gg: ASbGncsKPN2CO/cL92L1PS0c4N6X/UH7uoItS4V/PBVILwx8YdGHy0zV+pNU/sbjRi3
	QO9jV3KRh7/CpU+Ob+rsHgn3YGd6DwIAVwcUAXclqpUpMAbuR8IFZ7kHy+nO20saV/SjjlMlV5F
	sQHRjO60shDT1cIGbCMFdTKPBdSAxtSLJAbCZGGMNtDHvcliOah7udJKNG3Tdd3cGcWs/bXQgcH
	hyFfTQu0FtV1a+gpMW8hD5HVDTM4GTb6e4vQoaLkPFXm/WYq1pSYj3UOIxD6WDfaG2+HnobvtrJ
	vfLIXDZECTSsIbDP08IgJEKhOEDzyAIUX4ydHRULH8sTI7k=
X-Google-Smtp-Source: AGHT+IF9E1xDU+/vK9McOxMfJKzHMWL6xtTc/UUM1fTBQHv9QsUZHpRVcezRe9vv6X7nBmMrELkgRg==
X-Received: by 2002:a2e:b889:0:b0:30d:629c:4333 with SMTP id 38308e7fff4ca-30f0a191ed1mr48269431fa.34.1744101964890;
        Tue, 08 Apr 2025 01:46:04 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031edc1dsm18062011fa.112.2025.04.08.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:46:04 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:45:59 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/14] mfd: rohm-bd96801: Support ROHM BD96802
Message-ID: <05957d194425a79a4f35f287695c3d9ca2ed1ae2.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0YXRvFLLTr9WmT8B"
Content-Disposition: inline
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>


--0YXRvFLLTr9WmT8B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD96802 PMIC looks from software point of view a lot like ROHM
BD96801 PMIC. Just with reduced number of voltage rails. Both PMICs
provide two physical IRQ lines referred as INTB and ERRB and contain
blocks implementing regulator controls and a weatchdog. Hence it makes
sense to use same MFD core for both PMICs.

Add support for ROHM BD96802 scalable companion PMIC to the BD96801
core driver.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Lee Jones <lee@kernel.org>

---
Revision history:
v2 =3D> :
  - No changes
v1 =3D> v2:
 - Use chip_type enum
---
 drivers/mfd/rohm-bd96801.c       | 239 ++++++++++++++++++++++++++++++-
 include/linux/mfd/rohm-bd96801.h |   2 +
 include/linux/mfd/rohm-bd96802.h |  74 ++++++++++
 include/linux/mfd/rohm-generic.h |   1 +
 4 files changed, 311 insertions(+), 5 deletions(-)
 create mode 100644 include/linux/mfd/rohm-bd96802.h

diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
index d1d2a4cea605..e5ee5f556a55 100644
--- a/drivers/mfd/rohm-bd96801.c
+++ b/drivers/mfd/rohm-bd96801.c
@@ -38,6 +38,7 @@
 #include <linux/types.h>
=20
 #include <linux/mfd/rohm-bd96801.h>
+#include <linux/mfd/rohm-bd96802.h>
 #include <linux/mfd/rohm-generic.h>
=20
 struct bd968xx {
@@ -113,6 +114,36 @@ static const struct resource bd96801_reg_errb_irqs[] =
=3D {
 	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_SHDN_ERR_STAT, "ldo7-shdn-err"),
 };
=20
+static const struct resource bd96802_reg_errb_irqs[] =3D {
+	DEFINE_RES_IRQ_NAMED(BD96802_OTP_ERR_STAT, "otp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_DBIST_ERR_STAT, "dbist-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_EEP_ERR_STAT, "eep-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_ABIST_ERR_STAT, "abist-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_PRSTB_ERR_STAT, "prstb-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_DRMOS1_ERR_STAT, "drmoserr1"),
+	DEFINE_RES_IRQ_NAMED(BD96802_DRMOS1_ERR_STAT, "drmoserr2"),
+	DEFINE_RES_IRQ_NAMED(BD96802_SLAVE_ERR_STAT, "slave-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_VREF_ERR_STAT, "vref-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_TSD_ERR_STAT, "tsd"),
+	DEFINE_RES_IRQ_NAMED(BD96802_UVLO_ERR_STAT, "uvlo-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_OVLO_ERR_STAT, "ovlo-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_OSC_ERR_STAT, "osc-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_PON_ERR_STAT, "pon-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_POFF_ERR_STAT, "poff-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_CMD_SHDN_ERR_STAT, "cmd-shdn-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_INT_SHDN_ERR_STAT, "int-shdn-err"),
+
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK1_PVIN_ERR_STAT, "buck1-pvin-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK1_OVP_ERR_STAT, "buck1-ovp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK1_UVP_ERR_STAT, "buck1-uvp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK1_SHDN_ERR_STAT, "buck1-shdn-err"),
+
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK2_PVIN_ERR_STAT, "buck2-pvin-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK2_OVP_ERR_STAT, "buck2-ovp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK2_UVP_ERR_STAT, "buck2-uvp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK2_SHDN_ERR_STAT, "buck2-shdn-err"),
+};
+
 static const struct resource bd96801_reg_intb_irqs[] =3D {
 	DEFINE_RES_IRQ_NAMED(BD96801_TW_STAT, "core-thermal"),
=20
@@ -157,6 +188,24 @@ static const struct resource bd96801_reg_intb_irqs[] =
=3D {
 	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_UVD_STAT, "ldo7-undervolt"),
 };
=20
+static const struct resource bd96802_reg_intb_irqs[] =3D {
+	DEFINE_RES_IRQ_NAMED(BD96802_TW_STAT, "core-thermal"),
+
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK1_OCPH_STAT, "buck1-overcurr-h"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK1_OCPL_STAT, "buck1-overcurr-l"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK1_OCPN_STAT, "buck1-overcurr-n"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK1_OVD_STAT, "buck1-overvolt"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK1_UVD_STAT, "buck1-undervolt"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK1_TW_CH_STAT, "buck1-thermal"),
+
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK2_OCPH_STAT, "buck2-overcurr-h"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK2_OCPL_STAT, "buck2-overcurr-l"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK2_OCPN_STAT, "buck2-overcurr-n"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK2_OVD_STAT, "buck2-overvolt"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK2_UVD_STAT, "buck2-undervolt"),
+	DEFINE_RES_IRQ_NAMED(BD96802_BUCK2_TW_CH_STAT, "buck2-thermal"),
+};
+
 enum {
 	WDG_CELL =3D 0,
 	REGULATOR_CELL,
@@ -167,6 +216,11 @@ static struct mfd_cell bd96801_cells[] =3D {
 	[REGULATOR_CELL] =3D { .name =3D "bd96801-regulator", },
 };
=20
+static struct mfd_cell bd96802_cells[] =3D {
+	[WDG_CELL] =3D { .name =3D "bd96801-wdt", },
+	[REGULATOR_CELL] =3D { .name =3D "bd96802-regulator", },
+};
+
 static const struct regmap_range bd96801_volatile_ranges[] =3D {
 	/* Status registers */
 	regmap_reg_range(BD96801_REG_WD_FEED, BD96801_REG_WD_FAILCOUNT),
@@ -184,11 +238,28 @@ static const struct regmap_range bd96801_volatile_ran=
ges[] =3D {
 	regmap_reg_range(BD96801_LDO5_VOL_LVL_REG, BD96801_LDO7_VOL_LVL_REG),
 };
=20
-static const struct regmap_access_table volatile_regs =3D {
+static const struct regmap_range bd96802_volatile_ranges[] =3D {
+	/* Status regs */
+	regmap_reg_range(BD96801_REG_WD_FEED, BD96801_REG_WD_FAILCOUNT),
+	regmap_reg_range(BD96801_REG_WD_ASK, BD96801_REG_WD_ASK),
+	regmap_reg_range(BD96801_REG_WD_STATUS, BD96801_REG_WD_STATUS),
+	regmap_reg_range(BD96801_REG_PMIC_STATE, BD96801_REG_INT_BUCK2_ERRB),
+	regmap_reg_range(BD96801_REG_INT_SYS_INTB, BD96801_REG_INT_BUCK2_INTB),
+	/* Registers which do not update value unless PMIC is in STBY */
+	regmap_reg_range(BD96801_REG_SSCG_CTRL, BD96801_REG_SHD_INTB),
+	regmap_reg_range(BD96801_REG_BUCK_OVP, BD96801_REG_BOOT_OVERTIME),
+};
+
+static const struct regmap_access_table bd96801_volatile_regs =3D {
 	.yes_ranges =3D bd96801_volatile_ranges,
 	.n_yes_ranges =3D ARRAY_SIZE(bd96801_volatile_ranges),
 };
=20
+static const struct regmap_access_table bd96802_volatile_regs =3D {
+	.yes_ranges =3D bd96802_volatile_ranges,
+	.n_yes_ranges =3D ARRAY_SIZE(bd96802_volatile_ranges),
+};
+
 /*
  * For ERRB we need main register bit mapping as bit(0) indicates active I=
RQ
  * in one of the first 3 sub IRQ registers, For INTB we can use default 1 =
to 1
@@ -203,7 +274,7 @@ static unsigned int bit5_offsets[] =3D {7};	/* LDO 5 st=
at */
 static unsigned int bit6_offsets[] =3D {8};	/* LDO 6 stat */
 static unsigned int bit7_offsets[] =3D {9};	/* LDO 7 stat */
=20
-static const struct regmap_irq_sub_irq_map errb_sub_irq_offsets[] =3D {
+static const struct regmap_irq_sub_irq_map bd96801_errb_sub_irq_offsets[] =
=3D {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
@@ -214,6 +285,12 @@ static const struct regmap_irq_sub_irq_map errb_sub_ir=
q_offsets[] =3D {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit7_offsets),
 };
=20
+static const struct regmap_irq_sub_irq_map bd96802_errb_sub_irq_offsets[] =
=3D {
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
+};
+
 static const struct regmap_irq bd96801_errb_irqs[] =3D {
 	/* Reg 0x52 Fatal ERRB1 */
 	REGMAP_IRQ_REG(BD96801_OTP_ERR_STAT, 0, BD96801_OTP_ERR_MASK),
@@ -274,6 +351,39 @@ static const struct regmap_irq bd96801_errb_irqs[] =3D=
 {
 	REGMAP_IRQ_REG(BD96801_LDO7_SHDN_ERR_STAT, 9, BD96801_OUT_SHDN_ERR_MASK),
 };
=20
+static const struct regmap_irq bd96802_errb_irqs[] =3D {
+	/* Reg 0x52 Fatal ERRB1 */
+	REGMAP_IRQ_REG(BD96802_OTP_ERR_STAT, 0, BD96801_OTP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_DBIST_ERR_STAT, 0, BD96801_DBIST_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_EEP_ERR_STAT, 0, BD96801_EEP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_ABIST_ERR_STAT, 0, BD96801_ABIST_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_PRSTB_ERR_STAT, 0, BD96801_PRSTB_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_DRMOS1_ERR_STAT, 0, BD96801_DRMOS1_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_DRMOS2_ERR_STAT, 0, BD96801_DRMOS2_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_SLAVE_ERR_STAT, 0, BD96801_SLAVE_ERR_MASK),
+	/* 0x53 Fatal ERRB2 */
+	REGMAP_IRQ_REG(BD96802_VREF_ERR_STAT, 1, BD96801_VREF_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_TSD_ERR_STAT, 1, BD96801_TSD_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_UVLO_ERR_STAT, 1, BD96801_UVLO_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_OVLO_ERR_STAT, 1, BD96801_OVLO_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_OSC_ERR_STAT, 1, BD96801_OSC_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_PON_ERR_STAT, 1, BD96801_PON_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_POFF_ERR_STAT, 1, BD96801_POFF_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_CMD_SHDN_ERR_STAT, 1, BD96801_CMD_SHDN_ERR_MASK),
+	/* 0x54 Fatal INTB shadowed to ERRB */
+	REGMAP_IRQ_REG(BD96802_INT_SHDN_ERR_STAT, 2, BD96801_INT_SHDN_ERR_MASK),
+	/* Reg 0x55 BUCK1 ERR IRQs */
+	REGMAP_IRQ_REG(BD96802_BUCK1_PVIN_ERR_STAT, 3, BD96801_OUT_PVIN_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK1_OVP_ERR_STAT, 3, BD96801_OUT_OVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK1_UVP_ERR_STAT, 3, BD96801_OUT_UVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK1_SHDN_ERR_STAT, 3, BD96801_OUT_SHDN_ERR_MASK),
+	/* Reg 0x56 BUCK2 ERR IRQs */
+	REGMAP_IRQ_REG(BD96802_BUCK2_PVIN_ERR_STAT, 4, BD96801_OUT_PVIN_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK2_OVP_ERR_STAT, 4, BD96801_OUT_OVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK2_UVP_ERR_STAT, 4, BD96801_OUT_UVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK2_SHDN_ERR_STAT, 4, BD96801_OUT_SHDN_ERR_MASK),
+};
+
 static const struct regmap_irq bd96801_intb_irqs[] =3D {
 	/* STATUS SYSTEM INTB */
 	REGMAP_IRQ_REG(BD96801_TW_STAT, 0, BD96801_TW_STAT_MASK),
@@ -322,6 +432,69 @@ static const struct regmap_irq bd96801_intb_irqs[] =3D=
 {
 	REGMAP_IRQ_REG(BD96801_LDO7_UVD_STAT, 7, BD96801_LDO_UVD_STAT_MASK),
 };
=20
+static const struct regmap_irq bd96802_intb_irqs[] =3D {
+	/* STATUS SYSTEM INTB */
+	REGMAP_IRQ_REG(BD96802_TW_STAT, 0, BD96801_TW_STAT_MASK),
+	REGMAP_IRQ_REG(BD96802_WDT_ERR_STAT, 0, BD96801_WDT_ERR_STAT_MASK),
+	REGMAP_IRQ_REG(BD96802_I2C_ERR_STAT, 0, BD96801_I2C_ERR_STAT_MASK),
+	REGMAP_IRQ_REG(BD96802_CHIP_IF_ERR_STAT, 0, BD96801_CHIP_IF_ERR_STAT_MASK=
),
+	/* STATUS BUCK1 INTB */
+	REGMAP_IRQ_REG(BD96802_BUCK1_OCPH_STAT, 1, BD96801_BUCK_OCPH_STAT_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK1_OCPL_STAT, 1, BD96801_BUCK_OCPL_STAT_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK1_OCPN_STAT, 1, BD96801_BUCK_OCPN_STAT_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK1_OVD_STAT, 1, BD96801_BUCK_OVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK1_UVD_STAT, 1, BD96801_BUCK_UVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK1_TW_CH_STAT, 1, BD96801_BUCK_TW_CH_STAT_MASK),
+	/* BUCK 2 INTB */
+	REGMAP_IRQ_REG(BD96802_BUCK2_OCPH_STAT, 2, BD96801_BUCK_OCPH_STAT_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK2_OCPL_STAT, 2, BD96801_BUCK_OCPL_STAT_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK2_OCPN_STAT, 2, BD96801_BUCK_OCPN_STAT_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK2_OVD_STAT, 2, BD96801_BUCK_OVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK2_UVD_STAT, 2, BD96801_BUCK_UVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96802_BUCK2_TW_CH_STAT, 2, BD96801_BUCK_TW_CH_STAT_MASK),
+};
+
+/*
+ * The IRQ stuff is a bit hairy. The BD96801 / BD96802 provide two physical
+ * IRQ lines called INTB and ERRB. They share the same main status registe=
r.
+ *
+ * For ERRB, mapping from main status to sub-status is such that the
+ * 'global' faults are mapped to first 3 sub-status registers - and indica=
ted
+ * by the first bit[0] in main status reg.
+ *
+ * Rest of the status registers are for indicating stuff for individual
+ * regulators, 1 sub register / regulator and 1 main status register bit /
+ * regulator, starting from bit[1].
+ *
+ * Eg, regulator specific stuff has 1 to 1 mapping from main-status to sub
+ * registers but 'global' ERRB IRQs require mapping from main status bit[0=
] to
+ * 3 status registers.
+ *
+ * Furthermore, the BD96801 has 7 regulators where the BD96802 has only 2.
+ *
+ * INTB has only 1 sub status register for 'global' events and then own sub
+ * status register for each of the regulators. So, for INTB we have direct
+ * 1 to 1 mapping - BD96801 just having 5 register and 5 main status bits
+ * more than the BD96802.
+ *
+ * Sharing the main status bits could be a problem if we had both INTB and
+ * ERRB IRQs asserted but for different sub-status offsets. This might lead
+ * IRQ controller code to go read a sub status register which indicates no
+ * active IRQs. I assume this occurring repeteadly might lead the IRQ to be
+ * disabled by core as a result of repeteadly returned IRQ_NONEs.
+ *
+ * I don't consider this as a fatal problem for now because:
+ *	a) Having ERRB asserted leads to PMIC fault state which will kill
+ *	   the SoC powered by the PMIC. (So, relevant only for potential
+ *	   case of not powering the processor with this PMIC).
+ *	b) Having ERRB set without having respective INTB is unlikely
+ *	   (haven't actually verified this).
+ *
+ * So, let's proceed with main status enabled for both INTB and ERRB. We c=
an
+ * later disable main-status usage on systems where this ever proves to be
+ * a problem.
+ */
+
 static const struct regmap_irq_chip bd96801_irq_chip_errb =3D {
 	.name =3D "bd96801-irq-errb",
 	.domain_suffix =3D "errb",
@@ -335,7 +508,23 @@ static const struct regmap_irq_chip bd96801_irq_chip_e=
rrb =3D {
 	.init_ack_masked =3D true,
 	.num_regs =3D 10,
 	.irq_reg_stride =3D 1,
-	.sub_reg_offsets =3D &errb_sub_irq_offsets[0],
+	.sub_reg_offsets =3D &bd96801_errb_sub_irq_offsets[0],
+};
+
+static const struct regmap_irq_chip bd96802_irq_chip_errb =3D {
+	.name =3D "bd96802-irq-errb",
+	.domain_suffix =3D "errb",
+	.main_status =3D BD96801_REG_INT_MAIN,
+	.num_main_regs =3D 1,
+	.irqs =3D &bd96802_errb_irqs[0],
+	.num_irqs =3D ARRAY_SIZE(bd96802_errb_irqs),
+	.status_base =3D BD96801_REG_INT_SYS_ERRB1,
+	.mask_base =3D BD96801_REG_MASK_SYS_ERRB,
+	.ack_base =3D BD96801_REG_INT_SYS_ERRB1,
+	.init_ack_masked =3D true,
+	.num_regs =3D 5,
+	.irq_reg_stride =3D 1,
+	.sub_reg_offsets =3D &bd96802_errb_sub_irq_offsets[0],
 };
=20
 static const struct regmap_irq_chip bd96801_irq_chip_intb =3D {
@@ -353,10 +542,32 @@ static const struct regmap_irq_chip bd96801_irq_chip_=
intb =3D {
 	.irq_reg_stride =3D 1,
 };
=20
+static const struct regmap_irq_chip bd96802_irq_chip_intb =3D {
+	.name =3D "bd96802-irq-intb",
+	.domain_suffix =3D "intb",
+	.main_status =3D BD96801_REG_INT_MAIN,
+	.num_main_regs =3D 1,
+	.irqs =3D &bd96802_intb_irqs[0],
+	.num_irqs =3D ARRAY_SIZE(bd96802_intb_irqs),
+	.status_base =3D BD96801_REG_INT_SYS_INTB,
+	.mask_base =3D BD96801_REG_MASK_SYS_INTB,
+	.ack_base =3D BD96801_REG_INT_SYS_INTB,
+	.init_ack_masked =3D true,
+	.num_regs =3D 3,
+	.irq_reg_stride =3D 1,
+};
+
 static const struct regmap_config bd96801_regmap_config =3D {
 	.reg_bits =3D 8,
 	.val_bits =3D 8,
-	.volatile_table =3D &volatile_regs,
+	.volatile_table =3D &bd96801_volatile_regs,
+	.cache_type =3D REGCACHE_MAPLE,
+};
+
+static const struct regmap_config bd96802_regmap_config =3D {
+	.reg_bits =3D 8,
+	.val_bits =3D 8,
+	.volatile_table =3D &bd96802_volatile_regs,
 	.cache_type =3D REGCACHE_MAPLE,
 };
=20
@@ -374,6 +585,20 @@ static const struct bd968xx bd96801_data =3D {
 	.unlock_val =3D BD96801_UNLOCK,
 };
=20
+static const struct bd968xx bd96802_data =3D {
+	.errb_irqs =3D bd96802_reg_errb_irqs,
+	.intb_irqs =3D bd96802_reg_intb_irqs,
+	.num_errb_irqs =3D ARRAY_SIZE(bd96802_reg_errb_irqs),
+	.num_intb_irqs =3D ARRAY_SIZE(bd96802_reg_intb_irqs),
+	.errb_irq_chip =3D &bd96802_irq_chip_errb,
+	.intb_irq_chip =3D &bd96802_irq_chip_intb,
+	.regmap_config =3D &bd96802_regmap_config,
+	.cells =3D bd96802_cells,
+	.num_cells =3D ARRAY_SIZE(bd96802_cells),
+	.unlock_reg =3D BD96801_LOCK_REG,
+	.unlock_val =3D BD96801_UNLOCK,
+};
+
 static int bd96801_i2c_probe(struct i2c_client *i2c)
 {
 	struct regmap_irq_chip_data *intb_irq_data, *errb_irq_data;
@@ -393,6 +618,9 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	case ROHM_CHIP_TYPE_BD96801:
 		ddata =3D &bd96801_data;
 		break;
+	case ROHM_CHIP_TYPE_BD96802:
+		ddata =3D &bd96802_data;
+		break;
 	default:
 		dev_err(&i2c->dev, "Unknown IC\n");
 		return -EINVAL;
@@ -488,6 +716,7 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
=20
 static const struct of_device_id bd96801_of_match[] =3D {
 	{ .compatible =3D "rohm,bd96801", .data =3D (void *)ROHM_CHIP_TYPE_BD9680=
1 },
+	{ .compatible =3D "rohm,bd96802", .data =3D (void *)ROHM_CHIP_TYPE_BD9680=
2 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bd96801_of_match);
@@ -515,5 +744,5 @@ static void __exit bd96801_i2c_exit(void)
 module_exit(bd96801_i2c_exit);
=20
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
-MODULE_DESCRIPTION("ROHM BD96801 Power Management IC driver");
+MODULE_DESCRIPTION("ROHM BD9680X Power Management IC driver");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/rohm-bd96801.h b/include/linux/mfd/rohm-bd96=
801.h
index e2d9e10b6364..68c8ac8ad409 100644
--- a/include/linux/mfd/rohm-bd96801.h
+++ b/include/linux/mfd/rohm-bd96801.h
@@ -40,7 +40,9 @@
  * INTB status registers are at range 0x5c ... 0x63
  */
 #define BD96801_REG_INT_SYS_ERRB1	0x52
+#define BD96801_REG_INT_BUCK2_ERRB	0x56
 #define BD96801_REG_INT_SYS_INTB	0x5c
+#define BD96801_REG_INT_BUCK2_INTB	0x5e
 #define BD96801_REG_INT_LDO7_INTB	0x63
=20
 /* MASK registers */
diff --git a/include/linux/mfd/rohm-bd96802.h b/include/linux/mfd/rohm-bd96=
802.h
new file mode 100644
index 000000000000..bf4b77944edf
--- /dev/null
+++ b/include/linux/mfd/rohm-bd96802.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2025 ROHM Semiconductors
+ *
+ * The digital interface of trhe BD96802 PMIC is a reduced version of the
+ * BD96801. Hence the BD96801 definitions are used for registers and masks
+ * while this header only holds the IRQ definitions - mainly to avoid gaps=
 in
+ * IRQ numbers caused by the lack of some BUCKs / LDOs and their respective
+ * IRQs.
+ */
+
+#ifndef __LINUX_MFD_BD96802_H__
+#define __LINUX_MFD_BD96802_H__
+
+/* ERRB IRQs */
+enum {
+	/* Reg 0x52, 0x53, 0x54 - ERRB system IRQs */
+	BD96802_OTP_ERR_STAT,
+	BD96802_DBIST_ERR_STAT,
+	BD96802_EEP_ERR_STAT,
+	BD96802_ABIST_ERR_STAT,
+	BD96802_PRSTB_ERR_STAT,
+	BD96802_DRMOS1_ERR_STAT,
+	BD96802_DRMOS2_ERR_STAT,
+	BD96802_SLAVE_ERR_STAT,
+	BD96802_VREF_ERR_STAT,
+	BD96802_TSD_ERR_STAT,
+	BD96802_UVLO_ERR_STAT,
+	BD96802_OVLO_ERR_STAT,
+	BD96802_OSC_ERR_STAT,
+	BD96802_PON_ERR_STAT,
+	BD96802_POFF_ERR_STAT,
+	BD96802_CMD_SHDN_ERR_STAT,
+	BD96802_INT_SHDN_ERR_STAT,
+
+	/* Reg 0x55 BUCK1 ERR IRQs */
+	BD96802_BUCK1_PVIN_ERR_STAT,
+	BD96802_BUCK1_OVP_ERR_STAT,
+	BD96802_BUCK1_UVP_ERR_STAT,
+	BD96802_BUCK1_SHDN_ERR_STAT,
+
+	/* Reg 0x56 BUCK2 ERR IRQs */
+	BD96802_BUCK2_PVIN_ERR_STAT,
+	BD96802_BUCK2_OVP_ERR_STAT,
+	BD96802_BUCK2_UVP_ERR_STAT,
+	BD96802_BUCK2_SHDN_ERR_STAT,
+};
+
+/* INTB IRQs */
+enum {
+	/* Reg 0x5c (System INTB) */
+	BD96802_TW_STAT,
+	BD96802_WDT_ERR_STAT,
+	BD96802_I2C_ERR_STAT,
+	BD96802_CHIP_IF_ERR_STAT,
+
+	/* Reg 0x5d (BUCK1 INTB) */
+	BD96802_BUCK1_OCPH_STAT,
+	BD96802_BUCK1_OCPL_STAT,
+	BD96802_BUCK1_OCPN_STAT,
+	BD96802_BUCK1_OVD_STAT,
+	BD96802_BUCK1_UVD_STAT,
+	BD96802_BUCK1_TW_CH_STAT,
+
+	/* Reg 0x5e (BUCK2 INTB) */
+	BD96802_BUCK2_OCPH_STAT,
+	BD96802_BUCK2_OCPL_STAT,
+	BD96802_BUCK2_OCPN_STAT,
+	BD96802_BUCK2_OVD_STAT,
+	BD96802_BUCK2_UVD_STAT,
+	BD96802_BUCK2_TW_CH_STAT,
+};
+
+#endif
diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-gene=
ric.h
index e7d4e6afe388..11b86f9129e3 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -17,6 +17,7 @@ enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD71837,
 	ROHM_CHIP_TYPE_BD71847,
 	ROHM_CHIP_TYPE_BD96801,
+	ROHM_CHIP_TYPE_BD96802,
 	ROHM_CHIP_TYPE_AMOUNT
 };
=20
--=20
2.49.0


--0YXRvFLLTr9WmT8B
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04kcACgkQeFA3/03a
ocUKUQf/a6FrNiOYVKR4aMMZAiUvPdggclkQlNDeDX2zYax5YpDUjeIRbhxW2nI0
Wu4UsBrj6YIqAgg0ZwlyCnM9UiMCiVu3WaXoFQPGYkPMXjH28kSQb1dibelxkKcs
GOSlXwR3G+2agSFnT+QV3E4EwdiWAm21iAdj87gEMRgzyrbq1WaLRUpWTfunWy2U
CgJJ9Q2uIE7XpnEzMwYDcGodBBoIt3rLvgV+U0Dqa6K60ummaO/Mtfx+LFdValFP
LovRtADlP4i2Yw/XJhRJDeKIwts7HgPcgvLSU4r+QIsV3MrVjoUcRXPVb6qw12Vi
SuoiCpNnpg2M/anPFkhLvKiRQukaKw==
=m4k+
-----END PGP SIGNATURE-----

--0YXRvFLLTr9WmT8B--
