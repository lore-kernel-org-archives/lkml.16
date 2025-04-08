Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6690221DA0;
	Tue,  8 Apr 2025 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101985; cv=none; b=QtEr/DgiKq+hrPLPkNJQerfHIFir/6zeSs3ZpjTxTXdi3AlnyKMlhfrWlTjaNhalU5e4/XW3ryE1adbpvISZW++feY15oiwKElEMsXu/Bfsk5qj5KvG3C18mpEbkN5s34HYpJBwmT2lM4lIfWmfuFlOGi7N2et/kN5YRFWaJGn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101985; c=relaxed/simple;
	bh=pfOe7W7vRWE33xLPTApDG1oUv7XI8FeMMTOctaqrT7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERpbizwsac88vLoXbbAiMx4eEYZ5Mm7OEc7MKFS2CzhCdeeo7tm/QYPtVhWjOV57kt1ftqwTuTcJLymvGhwXSc7+QWrEN+SxyE5yiUecrR0qnYX7oCGRIRWKcQr0L8tNxVpodsxG084K5oUdmnQ27GPfJlySVsZSSDsWl2m69pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nb7My9Oi; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nb7My9Oi"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54963160818so6628604e87.2;
        Tue, 08 Apr 2025 01:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744101982; x=1744706782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cWxaik4sLZh+WCpZiMllK89eY0TintZs38xVms8UItA=;
        b=Nb7My9Oi04b5ZWD9cPqA47Qy6zQTr1Q4SQPEEnBO5xlZBNB/aw0UwrZPXt8qOdQxzu
         5NywiPGXB5ZzCYZ5/3Y01q/OBFUKcBVSrGqUxceMOGiQPKeoVN8rp6q0GRLfCTHCRMLr
         BbTIgoLFzkaccy9UBpB/QqjJl0SkwXMazwKKCpv7/5SbNQQJX2UAUaL8EkZZHyMhE9bz
         bt/gm2G6x3LFaYERDsfx0Ndus6JOKI02CIs9i88pUBrKRcFbDK6Xmf5UDf+nuiM5xBWa
         DN2c+Py466JzI4FOO4DWNFUX5/9GtHJUH/J/r0T5hVeENmPdzmbzdPHvQo2IftWw3imx
         9Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101982; x=1744706782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWxaik4sLZh+WCpZiMllK89eY0TintZs38xVms8UItA=;
        b=GRS3U2mw1EbJrtVfB5csmShc94KzLtHJmfdiRX2KEdTghu8g8pZJHy92YdaB7V05rC
         2RMsKcZ79JopNQk+tN7MkNTS+7Q4QwYj6ge7GeNtRSs8rpvtP3eNkdzh2/KagdGs1Avg
         pVNs4p2fUagsEGXVLwJRjKKZVTpRDBwyE0FOwT4Yb81TM11Y2Ll0oNWvpuzD64T8oYDy
         4zhjsbFWfUIeCvk5Du9j6ZeEjKWLBWOPhgviqCyvnnMzg5B3l5FJrFRz44GCF6za94Uw
         ZKQDoIJ9Zllcd+cO+J9DY60VUHxzTNC5ihaC/NwG4uVgvZhThHkwm2WPrOk+5wnh8SRi
         AXIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbcfn/WnYeB1uMbU5rAeBg+xw8JpWgPK+snSx1uCZVCVKW8wt/Ph7HyCJOrPAbtrjPC0Rj7j7/c8RhB6AV@vger.kernel.org, AJvYcCWhlW7d9vntSi3+tpJMuIvmQp0p1kqJsleob0f9EPU9Wl2GLhcdBqKics+Fp17Poe4GefX+/tmhF/GB@vger.kernel.org
X-Gm-Message-State: AOJu0YwethgnLpL6Db8DSiYevv9LAq+nCFLPrq8y8iyiS/qows/zqCXG
	5abQrxE7QXjvklEqvk7LLfmMvkhVjj5LgLELc4mZ0DwDt4/4tede
X-Gm-Gg: ASbGncsCGMHJwMmmJD3tV86I9egv6hVYhrpvbfQDWtX8vptbYZd5d0lMPLA6dWYvfAw
	medANmSnFxvxk7Yca2TP5jwbg/mq2Z55efJOMfiR/BaAxlW80nCELyJHpzetWKvOCu6QFw48lKo
	1Et105hucwKfoULZv6drVCbcdg+70AUJk9CsgZt+0PEpnHjcEHH9d0+RWXJqh9pQ3p0gsZotKm6
	Fk2kG30dWg/cQ2qCgCoAaRBigw1IR/hosm0HZHE6kPeZnagIOHAREOCDy8q9XgLhqVHxz6wZNaI
	mYujfJTqR3c09ibqUtE1CWo79FB4g0M5l+VCxC426bpV6bE=
X-Google-Smtp-Source: AGHT+IGtyUDAHP0kMEAQGXVC2RIiUeYhnxVwE696mYw3OyJmJ8uc9X3Hf129+rcflTs8dnAAhqmxHA==
X-Received: by 2002:a05:6512:3b1f:b0:545:c7d:1796 with SMTP id 2adb3069b0e04-54c23346b98mr4525345e87.43.1744101981513;
        Tue, 08 Apr 2025 01:46:21 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031ce997sm18138791fa.92.2025.04.08.01.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:46:19 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:46:16 +0300
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
Subject: [PATCH v3 09/14] regulator: bd96801: Support ROHM BD96802
Message-ID: <2fb2d0d4997c32d18bfa32cea4564352c00eebc8.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EQn/RDlW9nc9EarN"
Content-Disposition: inline
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>


--EQn/RDlW9nc9EarN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD96802 PMIC is primarily intended to be used as a companion
PMIC extending the capabilities of the BD96802 but it can be used on
it's own as well. When used as a companion PMIC, the start-up and
shut-down sequences are usually intitiated by the master PMIC using IF
pins.

The BD96802 looks from the digital interface point of view pretty much
like a reduced version of BD96801. It includes only 2 BUCKs and provides
the same error protection/detection mechanisms as the BD96801. Also, the
voltage control logic is same up to the register addresses.

Add support for controlling BD96802 using the BD96801 driver.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v2: =3D> v3:
 - Add a define for BD96802 voltages to help spotting mistakes in values
   filled to the respective PMIC's regulator descs
v1 =3D> v2:
 - No changes
---
 drivers/regulator/bd96801-regulator.c | 95 ++++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96=
801-regulator.c
index 48cdd583e92d..8e96c460c8ae 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -160,6 +160,9 @@ static const struct linear_range bd96801_buck_init_volt=
s[] =3D {
 	REGULATOR_LINEAR_RANGE(3300000 - 150000, 0xed, 0xff, 0),
 };
=20
+/* BD96802 uses same voltage ranges for bucks as BD96801 */
+#define bd96802_tune_volts bd96801_tune_volts
+#define bd96802_buck_init_volts bd96801_buck_init_volts
 static const struct linear_range bd96801_ldo_int_volts[] =3D {
 	REGULATOR_LINEAR_RANGE(300000, 0x00, 0x78, 25000),
 	REGULATOR_LINEAR_RANGE(3300000, 0x79, 0xff, 0),
@@ -302,6 +305,7 @@ struct bd96801_pmic_data {
 	struct bd96801_regulator_data regulator_data[BD96801_NUM_REGULATORS];
 	struct regmap *regmap;
 	int fatal_ind;
+	int num_regulators;
 };
=20
 static int ldo_map_notif(int irq, struct regulator_irq_data *rid,
@@ -503,6 +507,70 @@ static int bd96801_walk_regulator_dt(struct device *de=
v, struct regmap *regmap,
  * case later. What we can easly do for preparing is to not use static glo=
bal
  * data for regulators though.
  */
+static const struct bd96801_pmic_data bd96802_data =3D {
+	.regulator_data =3D {
+	{
+		.desc =3D {
+			.name =3D "buck1",
+			.of_match =3D of_match_ptr("buck1"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_BUCK1,
+			.ops =3D &bd96801_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96802_tune_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96802_tune_volts),
+			.n_voltages =3D BD96801_BUCK_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_BUCK1_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_BUCK1_VSEL_REG,
+			.vsel_mask =3D BD96801_BUCK_VSEL_MASK,
+			.ramp_reg =3D BD96801_BUCK1_VSEL_REG,
+			.ramp_mask =3D BD96801_MASK_RAMP_DELAY,
+			.ramp_delay_table =3D &buck_ramp_table[0],
+			.n_ramp_values =3D ARRAY_SIZE(buck_ramp_table),
+			.owner =3D THIS_MODULE,
+		},
+		.init_ranges =3D bd96802_buck_init_volts,
+		.num_ranges =3D ARRAY_SIZE(bd96802_buck_init_volts),
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&buck1_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(buck1_irqinfo),
+		},
+	},
+	{
+		.desc =3D {
+			.name =3D "buck2",
+			.of_match =3D of_match_ptr("buck2"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_BUCK2,
+			.ops =3D &bd96801_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96802_tune_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96802_tune_volts),
+			.n_voltages =3D BD96801_BUCK_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_BUCK2_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_BUCK2_VSEL_REG,
+			.vsel_mask =3D BD96801_BUCK_VSEL_MASK,
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
+		.init_ranges =3D bd96802_buck_init_volts,
+		.num_ranges =3D ARRAY_SIZE(bd96802_buck_init_volts),
+	},
+	},
+	.num_regulators =3D 2,
+};
+
 static const struct bd96801_pmic_data bd96801_data =3D {
 	.regulator_data =3D {
 	{
@@ -688,11 +756,13 @@ static const struct bd96801_pmic_data bd96801_data =
=3D {
 		.ldo_vol_lvl =3D BD96801_LDO7_VOL_LVL_REG,
 	},
 	},
+	.num_regulators =3D 7,
 };
=20
-static int initialize_pmic_data(struct device *dev,
+static int initialize_pmic_data(struct platform_device *pdev,
 				struct bd96801_pmic_data *pdata)
 {
+	struct device *dev =3D &pdev->dev;
 	int r, i;
=20
 	/*
@@ -700,7 +770,7 @@ static int initialize_pmic_data(struct device *dev,
 	 * wish to modify IRQ information independently for each driver
 	 * instance.
 	 */
-	for (r =3D 0; r < BD96801_NUM_REGULATORS; r++) {
+	for (r =3D 0; r < pdata->num_regulators; r++) {
 		const struct bd96801_irqinfo *template;
 		struct bd96801_irqinfo *new;
 		int num_infos;
@@ -866,6 +936,7 @@ static int bd96801_probe(struct platform_device *pdev)
 {
 	struct regulator_dev *ldo_errs_rdev_arr[BD96801_NUM_LDOS];
 	struct regulator_dev *all_rdevs[BD96801_NUM_REGULATORS];
+	struct bd96801_pmic_data *pdata_template;
 	struct bd96801_regulator_data *rdesc;
 	struct regulator_config config =3D {};
 	int ldo_errs_arr[BD96801_NUM_LDOS];
@@ -878,12 +949,16 @@ static int bd96801_probe(struct platform_device *pdev)
=20
 	parent =3D pdev->dev.parent;
=20
-	pdata =3D devm_kmemdup(&pdev->dev, &bd96801_data, sizeof(bd96801_data),
+	pdata_template =3D (struct bd96801_pmic_data *)platform_get_device_id(pde=
v)->driver_data;
+	if (!pdata_template)
+		return -ENODEV;
+
+	pdata =3D devm_kmemdup(&pdev->dev, pdata_template, sizeof(bd96801_data),
 			     GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
=20
-	if (initialize_pmic_data(&pdev->dev, pdata))
+	if (initialize_pmic_data(pdev, pdata))
 		return -ENOMEM;
=20
 	pdata->regmap =3D dev_get_regmap(parent, NULL);
@@ -906,11 +981,11 @@ static int bd96801_probe(struct platform_device *pdev)
 		use_errb =3D true;
=20
 	ret =3D bd96801_walk_regulator_dt(&pdev->dev, pdata->regmap, rdesc,
-					BD96801_NUM_REGULATORS);
+					pdata->num_regulators);
 	if (ret)
 		return ret;
=20
-	for (i =3D 0; i < ARRAY_SIZE(pdata->regulator_data); i++) {
+	for (i =3D 0; i < pdata->num_regulators; i++) {
 		struct regulator_dev *rdev;
 		struct bd96801_irq_desc *idesc =3D &rdesc[i].irq_desc;
 		int j;
@@ -923,6 +998,7 @@ static int bd96801_probe(struct platform_device *pdev)
 				rdesc[i].desc.name);
 			return PTR_ERR(rdev);
 		}
+
 		all_rdevs[i] =3D rdev;
 		/*
 		 * LDOs don't have own temperature monitoring. If temperature
@@ -972,14 +1048,15 @@ static int bd96801_probe(struct platform_device *pde=
v)
=20
 	if (use_errb)
 		return bd96801_global_errb_irqs(pdev, all_rdevs,
-						ARRAY_SIZE(all_rdevs));
+						pdata->num_regulators);
=20
 	return 0;
 }
=20
 static const struct platform_device_id bd96801_pmic_id[] =3D {
-	{ "bd96801-regulator", },
-	{ }
+	{ "bd96801-regulator", (kernel_ulong_t)&bd96801_data },
+	{ "bd96802-regulator", (kernel_ulong_t)&bd96802_data },
+	{ },
 };
 MODULE_DEVICE_TABLE(platform, bd96801_pmic_id);
=20
--=20
2.49.0


--EQn/RDlW9nc9EarN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04lgACgkQeFA3/03a
ocV6Dgf+M5Gl7j2QlyMLzDeuBTCj1xF0gTwT6wctnaisjYTYYhYsklZ1qbiSTZFj
t9nkYFVLs+5v35pantQdD+OJ1uBVCkUKcnb0F9HQp5LnQnBV3hwAPsl+Bwb+4InH
MQt2Xdy7uSdiK+BJ5ms6zNAWTtk6FV21uCYsRkR8hHk9M/stHXhTKbPLwuc9gpW1
GHX5qgNKL6ElLIKVO4rpmu1c0zMji4j0OxgZcR1mckBSXuzFbr9yO5WA3ZFOlFU+
YAye03iSp1FIXTGJdUZgRajNgAX+CqE++NvsiZE3KsW3qvRQn5wS/Y5G4AxO4aIU
YdqYEXkq2YUgd9VoZBqf4Luu+DJ6bw==
=oMTx
-----END PGP SIGNATURE-----

--EQn/RDlW9nc9EarN--
