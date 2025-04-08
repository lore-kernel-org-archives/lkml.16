Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D772144AD;
	Tue,  8 Apr 2025 08:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102021; cv=none; b=k95GF1/JTr/KikgFB3qbLFlVv8uH5sqVc+eZZUnYPcJEvFvNrVg8xvRevix6n3DQZLkK5nYqlFduUjp+hoh3HsWbCimoTWCy4g4oarhAT3H61D1+CNwWn1l7xBHD+l0ugKduE1NlvnZQUlyVo6YkgvsBLfkI+9vj1NQO5wiOtqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102021; c=relaxed/simple;
	bh=ajrNUKcPnohRf5cL8ym8NP3wcPHEZHqxrp60lU6H25I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOWEOASMma/MspVV45sTRRpMRVUmnnBgr1yRpqwxjVDqQ4HjQoCQuwxwQt+Hmg0jgg4Ai4B3LNKLaCEZkGyJ9V/IayXAXogJSERspMuwXRD7ZDy8oBbYHL8+stG8GXk1reEbT/SjkucWlVCrSGMR71VVh3y0F+Kb/K+onh0p4D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9nyLmbd; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9nyLmbd"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b10956398so6104232e87.0;
        Tue, 08 Apr 2025 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744102018; x=1744706818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wferYMoqriZwCKWiK5cb+F4CmBS5znOThgFl8yhbAEU=;
        b=K9nyLmbd6m7kVlpk4tNNuE9IcLM/g4qKtRFYQK6fuZUWIccEy2Ya+LVsNvz5SmqJSB
         O0GzXTzNvl+zOVH9SLTdMwh/1qQ5t2pMrm9M3gjl+buc9GSYSk7tc1DNPprapiKIxASt
         USEbugKsZJGddtbowlsvQoGg5eRb2DaycKCeFq0TBDYjaJpDxImTk1+R4DC5umY/SAGo
         Pbxgm/WdGfspfB6oWGaq07CF1nCPMhUkvIuMSn1VSw8S35oXpOTlxpPhKjTNdinh6FCR
         m7c5GZ/UdliTLi2jsZ1wI33Pin1k+E79OiaXE3SkMqEaRYxpK/hEbl2mNMcBzMaoDHXE
         j6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102018; x=1744706818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wferYMoqriZwCKWiK5cb+F4CmBS5znOThgFl8yhbAEU=;
        b=SsBhtU2RoedZhBs/V5HfGQ4cYfSapwZ/cd9JjA9PdmjME5koCCKQf8SFHXtPwPoVe9
         DRmJ/rgTNhkIKgWaYOBLJoIIs2mPYQz8gevCWjjwWKBhxXE6e/JQEP0S2ZnCMXjnNxRj
         hDs4IpZRr9/RgWIF6HZxyLwQybAp0MBSqlbYWpdY/LtBvJ6Y/eWzU2qTOY6v67khqPcj
         71q9TlwDeG2EHBqJM9yt+LTVeDuSXOD9Gg/ysc+vZdDrYNfkd4dLIsGaT5GqiLWqiuUs
         L7xj6d55m0cVWgB6UjorL7UK0nXhWAzlrxZTBBhYS5nZN3QTkWdTP1kRnxC85ukDbSex
         nCng==
X-Forwarded-Encrypted: i=1; AJvYcCWydJKXWmVDBOMvM9eMFpdm/oTRmgmVY5/1geKZ2fWB6wUw50g3R++SHQZIY1FoYQiFOxfEmcQ4fzDc@vger.kernel.org, AJvYcCXXNkCo6olcCqGR7bTgmiTOlquNLqQIeC/3OTZLzbjx/hlxyk2mUcvdzxH6QmwrSh9by/PByZ1RZ2wI8pHM@vger.kernel.org
X-Gm-Message-State: AOJu0YzrGu9gC0JwCLMoKvCsy2mnfynsTqTjHT4AK1drIdKrK0zfq4Au
	ZMW6ocautK4W7z6VmNkibC1oLp1d3OVNFiC7RJDmlJV7AwWT+TTC
X-Gm-Gg: ASbGncuZYezbTw9MRaY/S49hhcpQwBeaTuTaHMP77gBytWiOwlz8rf5Z3KXQ5I9gFN1
	Bf/4IGbBV7aBX7IP4K4UuzcmLN4rnLFvSkp9eeuMTiIPfBNeeHmXHnAI9sMFuRIXxWKs5uypvlm
	oQaSO4edP4bFh/5IsSohwdqmpDvhT06i0V55SOst1AtOiE2hwPbe0eb6AoZaPRLQz5eBnclVjbQ
	/inCIr4hrPvnOrq+nXh9Y3hYFkeZv/y8iF85Q6o4AEaD5vDyaUxCoozvjVvDSBfNR7PDbxggaqD
	49D2SKrdLsu/6tdw9ixfG9MJaXXZK3IUwCaV15di9b+wIVJzDsUhYPICZw==
X-Google-Smtp-Source: AGHT+IElBUOEgorMPr7/NVnPHFrDoZwrL6Zm/gGEhAt4uBCyh/DSQ83c7yU4uJ8whZdx+7nR1xi6Cg==
X-Received: by 2002:a05:6512:3f0b:b0:549:7145:5d2d with SMTP id 2adb3069b0e04-54c3bb9e608mr794149e87.16.1744102017724;
        Tue, 08 Apr 2025 01:46:57 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5b41d6sm1468025e87.8.2025.04.08.01.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:46:56 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:46:53 +0300
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
Subject: [PATCH v3 11/14] regulator: bd96801: Support ROHM BD96805 PMIC
Message-ID: <eab1369557b14a9762c41a5429d1ac87a4644d9e.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dQ8uc+8gGX5JUCAx"
Content-Disposition: inline
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>


--dQ8uc+8gGX5JUCAx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD96805 is from the software perspective almost identical to
the ROHM BD96801. The main difference is different voltage tuning
ranges.

Add support differentiating these PMICs and provide correct voltages
for both models.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Mark Brown <broonie@kernel.org>

---
Revision history:
v1 =3D> :
 - No changes
---
 drivers/regulator/bd96801-regulator.c | 208 ++++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96=
801-regulator.c
index 8e96c460c8ae..9c7109a2ab96 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -83,6 +83,7 @@ enum {
 #define BD96801_LDO6_VSEL_REG		0x26
 #define BD96801_LDO7_VSEL_REG		0x27
 #define BD96801_BUCK_VSEL_MASK		0x1F
+#define BD96805_BUCK_VSEL_MASK		0x3f
 #define BD96801_LDO_VSEL_MASK		0xff
=20
 #define BD96801_MASK_RAMP_DELAY		0xc0
@@ -90,6 +91,7 @@ enum {
 #define BD96801_BUCK_INT_VOUT_MASK	0xff
=20
 #define BD96801_BUCK_VOLTS		256
+#define BD96805_BUCK_VOLTS		64
 #define BD96801_LDO_VOLTS		256
=20
 #define BD96801_OVP_MASK		0x03
@@ -163,6 +165,23 @@ static const struct linear_range bd96801_buck_init_vol=
ts[] =3D {
 /* BD96802 uses same voltage ranges for bucks as BD96801 */
 #define bd96802_tune_volts bd96801_tune_volts
 #define bd96802_buck_init_volts bd96801_buck_init_volts
+
+/*
+ * On BD96805 we have similar "negative tuning range" as on BD96801, except
+ * that the max tuning is -310 ... +310 mV (instead of the 150mV). We use =
same
+ * approach as with the BD96801 ranges.
+ */
+static const struct linear_range bd96805_tune_volts[] =3D {
+	REGULATOR_LINEAR_RANGE(310000, 0x00, 0x1F, 10000),
+	REGULATOR_LINEAR_RANGE(0, 0x20, 0x3F, 10000),
+};
+
+static const struct linear_range bd96805_buck_init_volts[] =3D {
+	REGULATOR_LINEAR_RANGE(500000 - 310000, 0x00, 0xc8, 5000),
+	REGULATOR_LINEAR_RANGE(1550000 - 310000, 0xc9, 0xec, 50000),
+	REGULATOR_LINEAR_RANGE(3300000 - 310000, 0xed, 0xff, 0),
+};
+
 static const struct linear_range bd96801_ldo_int_volts[] =3D {
 	REGULATOR_LINEAR_RANGE(300000, 0x00, 0x78, 25000),
 	REGULATOR_LINEAR_RANGE(3300000, 0x79, 0xff, 0),
@@ -759,6 +778,194 @@ static const struct bd96801_pmic_data bd96801_data =
=3D {
 	.num_regulators =3D 7,
 };
=20
+static const struct bd96801_pmic_data bd96805_data =3D {
+	.regulator_data =3D {
+	{
+		.desc =3D {
+			.name =3D "buck1",
+			.of_match =3D of_match_ptr("buck1"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_BUCK1,
+			.ops =3D &bd96801_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96805_tune_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96805_tune_volts),
+			.n_voltages =3D BD96805_BUCK_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_BUCK1_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_BUCK1_VSEL_REG,
+			.vsel_mask =3D BD96805_BUCK_VSEL_MASK,
+			.ramp_reg =3D BD96801_BUCK1_VSEL_REG,
+			.ramp_mask =3D BD96801_MASK_RAMP_DELAY,
+			.ramp_delay_table =3D &buck_ramp_table[0],
+			.n_ramp_values =3D ARRAY_SIZE(buck_ramp_table),
+			.owner =3D THIS_MODULE,
+		},
+		.init_ranges =3D bd96805_buck_init_volts,
+		.num_ranges =3D ARRAY_SIZE(bd96805_buck_init_volts),
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&buck1_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(buck1_irqinfo),
+		},
+	}, {
+		.desc =3D {
+			.name =3D "buck2",
+			.of_match =3D of_match_ptr("buck2"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_BUCK2,
+			.ops =3D &bd96801_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96805_tune_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96805_tune_volts),
+			.n_voltages =3D BD96805_BUCK_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_BUCK2_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_BUCK2_VSEL_REG,
+			.vsel_mask =3D BD96805_BUCK_VSEL_MASK,
+			.ramp_reg =3D BD96801_BUCK2_VSEL_REG,
+			.ramp_mask =3D BD96801_MASK_RAMP_DELAY,
+			.ramp_delay_table =3D &buck_ramp_table[0],
+			.n_ramp_values =3D ARRAY_SIZE(buck_ramp_table),
+			.owner =3D THIS_MODULE,
+		},
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&buck2_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(buck2_irqinfo),
+		},
+		.init_ranges =3D bd96805_buck_init_volts,
+		.num_ranges =3D ARRAY_SIZE(bd96805_buck_init_volts),
+	}, {
+		.desc =3D {
+			.name =3D "buck3",
+			.of_match =3D of_match_ptr("buck3"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_BUCK3,
+			.ops =3D &bd96801_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96805_tune_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96805_tune_volts),
+			.n_voltages =3D BD96805_BUCK_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_BUCK3_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_BUCK3_VSEL_REG,
+			.vsel_mask =3D BD96805_BUCK_VSEL_MASK,
+			.ramp_reg =3D BD96801_BUCK3_VSEL_REG,
+			.ramp_mask =3D BD96801_MASK_RAMP_DELAY,
+			.ramp_delay_table =3D &buck_ramp_table[0],
+			.n_ramp_values =3D ARRAY_SIZE(buck_ramp_table),
+			.owner =3D THIS_MODULE,
+		},
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&buck3_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(buck3_irqinfo),
+		},
+		.init_ranges =3D bd96805_buck_init_volts,
+		.num_ranges =3D ARRAY_SIZE(bd96805_buck_init_volts),
+	}, {
+		.desc =3D {
+			.name =3D "buck4",
+			.of_match =3D of_match_ptr("buck4"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_BUCK4,
+			.ops =3D &bd96801_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96805_tune_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96805_tune_volts),
+			.n_voltages =3D BD96805_BUCK_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_BUCK4_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_BUCK4_VSEL_REG,
+			.vsel_mask =3D BD96805_BUCK_VSEL_MASK,
+			.ramp_reg =3D BD96801_BUCK4_VSEL_REG,
+			.ramp_mask =3D BD96801_MASK_RAMP_DELAY,
+			.ramp_delay_table =3D &buck_ramp_table[0],
+			.n_ramp_values =3D ARRAY_SIZE(buck_ramp_table),
+			.owner =3D THIS_MODULE,
+		},
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&buck4_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(buck4_irqinfo),
+		},
+		.init_ranges =3D bd96805_buck_init_volts,
+		.num_ranges =3D ARRAY_SIZE(bd96805_buck_init_volts),
+	}, {
+		.desc =3D {
+			.name =3D "ldo5",
+			.of_match =3D of_match_ptr("ldo5"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_LDO5,
+			.ops =3D &bd96801_ldo_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96801_ldo_int_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96801_ldo_int_volts),
+			.n_voltages =3D BD96801_LDO_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_LDO5_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_LDO5_VSEL_REG,
+			.vsel_mask =3D BD96801_LDO_VSEL_MASK,
+			.owner =3D THIS_MODULE,
+		},
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&ldo5_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(ldo5_irqinfo),
+		},
+		.ldo_vol_lvl =3D BD96801_LDO5_VOL_LVL_REG,
+	}, {
+		.desc =3D {
+			.name =3D "ldo6",
+			.of_match =3D of_match_ptr("ldo6"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_LDO6,
+			.ops =3D &bd96801_ldo_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96801_ldo_int_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96801_ldo_int_volts),
+			.n_voltages =3D BD96801_LDO_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_LDO6_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_LDO6_VSEL_REG,
+			.vsel_mask =3D BD96801_LDO_VSEL_MASK,
+			.owner =3D THIS_MODULE,
+		},
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&ldo6_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(ldo6_irqinfo),
+		},
+		.ldo_vol_lvl =3D BD96801_LDO6_VOL_LVL_REG,
+	}, {
+		.desc =3D {
+			.name =3D "ldo7",
+			.of_match =3D of_match_ptr("ldo7"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_LDO7,
+			.ops =3D &bd96801_ldo_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96801_ldo_int_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96801_ldo_int_volts),
+			.n_voltages =3D BD96801_LDO_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_LDO7_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_LDO7_VSEL_REG,
+			.vsel_mask =3D BD96801_LDO_VSEL_MASK,
+			.owner =3D THIS_MODULE,
+		},
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&ldo7_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(ldo7_irqinfo),
+		},
+		.ldo_vol_lvl =3D BD96801_LDO7_VOL_LVL_REG,
+	},
+	},
+	.num_regulators =3D 7,
+};
+
 static int initialize_pmic_data(struct platform_device *pdev,
 				struct bd96801_pmic_data *pdata)
 {
@@ -1056,6 +1263,7 @@ static int bd96801_probe(struct platform_device *pdev)
 static const struct platform_device_id bd96801_pmic_id[] =3D {
 	{ "bd96801-regulator", (kernel_ulong_t)&bd96801_data },
 	{ "bd96802-regulator", (kernel_ulong_t)&bd96802_data },
+	{ "bd96805-regulator", (kernel_ulong_t)&bd96805_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, bd96801_pmic_id);
--=20
2.49.0


--dQ8uc+8gGX5JUCAx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04nwACgkQeFA3/03a
ocWKAAf/auAd/KRBpRWo7ig40HwXmQ1wx/sZkXsWOvUTR6jy3RQUdbqD4UWZzkkA
gGEPvAPODlhHynUaehx+qZfv9ylUm/4q1b6SoOOjqXKwhPhyTIEcr1pcNS+2fYUF
mH7/KdQGDsvK1H6NOSuGPDPrQWuAew5Mz0D5CX6O4FB71Qv4oGgKEtQIx+SXofmv
YTjscOx61Lx8STRKKklq71P7GTw8ucKQnyCExjiF1cjvYezdELfyTKIr/ew5XKjv
g9ae1fNCv4FLowAMRclB5vQeGj5IGXwtSldr+7hFYoZz/Muh1pCugYEB1hDcZGz9
1hkH6sBPq4jzj6F3ikk1MAV8Jv1u1A==
=Safe
-----END PGP SIGNATURE-----

--dQ8uc+8gGX5JUCAx--
